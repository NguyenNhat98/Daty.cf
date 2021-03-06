<?php
/*
* UserEngine.php - Main component file
*
* This file is part of the User component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpUser\User;
use Auth;
use Cookie;
use Hash;
use YesSecurity;
use Session;
use PushBroadcast;
use Carbon\Carbon;
use App\Daty\Base\BaseEngine;
use App\Daty\Base\BaseMailer;
use App\Daty\Components\WpAdmin\Media\MediaEngine;
use App\Daty\Components\WpUser\User\Repositories\{UserRepository, CreditWalletRepository, UserEncounterRepository};
use App\Daty\Components\WpUser\UserSetting\Repositories\UserSettingRepository;
use App\Daty\Components\WpAdmin\Item\Repositories\ManageItemRepository;
use App\Daty\Components\WpAdmin\AbuseReport\Repositories\ManageAbuseReportRepository;
use App\Daty\Support\Country\Repositories\CountryRepository;
use App\Daty\Support\CommonTrait;
use \Illuminate\Support\Facades\URL;
use YesTokenAuth;
use App\Daty\Support\Utils;

class UserEngine extends BaseEngine
{
    /**
     * @var CommonTrait - Common Trait
     */
    use CommonTrait;

    /**
     * @var UserRepository - User Repository
     */
    protected $userRepository;

    /**
     * @var BaseMailer - Base Mailer
     */
    protected $baseMailer;

    /**
     * @var  UserSettingRepository $userSettingRepository - UserSetting Repository
     */
    protected $userSettingRepository;

    /**
     * @var ManageItemRepository - ManageItem Repository
     */
    protected $manageItemRepository;

    /**
     * @var  CreditWalletRepository $creditWalletRepository - CreditWallet Repository
     */
    protected $creditWalletRepository;

    /**
     * @var ManageAbuseReportRepository - ManageAbuseReport Repository
     */
    protected $manageAbuseReportRepository;

    /**
     * @var  UserEncounterRepository $userEncounterRepository - UserEncounter Repository
     */
    protected $userEncounterRepository;

    /**
     * @var  CountryRepository $countryRepository - Country Repository
     */
    protected $countryRepository;

    /**
     * @var  MediaEngine $mediaEngine - Media Engine
     */
    protected $mediaEngine;

    /**
     * Constructor.
     * @param  CreditWalletRepository $creditWalletRepository - CreditWallet Repository
     * @param UserRepository  $userRepository  - User Repository
     * @param BaseMailer  $baseMailer  - Base Mailer
     * @param  UserSettingRepository $userSettingRepository - UserSetting Repository
     * @param ManageItemRepository $manageItemRepository - ManageItem Repository
     * @param  CountryRepository $countryRepository - Country Repository
     *
     *-----------------------------------------------------------------------*/
    public function __construct(
        BaseMailer  $baseMailer,
        UserRepository $userRepository,
        UserSettingRepository $userSettingRepository,
        ManageItemRepository $manageItemRepository,
        CreditWalletRepository $creditWalletRepository,
        ManageAbuseReportRepository $manageAbuseReportRepository,
        UserEncounterRepository $userEncounterRepository,
        CountryRepository $countryRepository,
        MediaEngine $mediaEngine
    ) {
        $this->baseMailer        	        = $baseMailer;
        $this->userRepository        	    = $userRepository;
        $this->userSettingRepository        = $userSettingRepository;
        $this->manageItemRepository 	    = $manageItemRepository;
        $this->creditWalletRepository 	    = $creditWalletRepository;
        $this->manageAbuseReportRepository 	= $manageAbuseReportRepository;
        $this->userEncounterRepository 	    = $userEncounterRepository;
        $this->countryRepository            = $countryRepository;
        $this->mediaEngine                  = $mediaEngine;
    }

    /**
     * Process user login request using user repository & return
     * engine reaction.
     *
     * @param array $input
     *
     * @return array
     *---------------------------------------------------------------- */
    public function processLogin($input)
    {
        //check is email or username
        if (str_contains($input['email_or_username'], '@')) {
            $user = $this->userRepository->fetchByEmail($input['email_or_username']);
        } else {
            $user = $this->userRepository->fetchByUsername($input['email_or_username']);
        }

        // Check if empty then return error message
        if (__isEmpty($user)) {
            return $this->engineReaction(2, ['show_message' => true],  'B???n ch??a ph???i l?? th??nh vi??n c???a h??? th???ng, Vui l??ng ????ng k?? tr?????c, sau ???? b???n c?? th??? ????ng nh???p.');
        }

        //collect login credentials
        $loginCredentials = [
            'email'         => $user->email,
            'password'      => $input['password'],
        ];

        //check user status not equal to 1
        if ($user->status != 1) {
            return $this->engineReaction(2, ['show_message' => true], 'T??i kho???n c???a b???n hi???n t???i __status__, Vui l??ng li??n h??? v???i qu???n tr??? vi??n.', ['__status__' => configItem('status_codes', $user->status) ]);
        }

        //get remember me data
        $remember_me = (isset($input['remember_me']) and $input['remember_me'] == 'on') ? true : false;

        // Process for login attempt
        if (Auth::attempt($loginCredentials, $remember_me)) {

            //loggedIn user name
            $loggedInUserName = $user->first_name.' '.$user->last_name;
            //get people likes me data
            $userLikedMeData = $this->userRepository->fetchUserLikeMeData();
            //check user like data exists
            if (!__isEmpty($userLikedMeData)) {
                foreach($userLikedMeData as $userLike) {
                    //notification log message
                    notificationLog($loggedInUserName. ' l?? ????ng nh???p. ', route('user.profile_view', ['username' => $user->username]), null, $userLike->userId);

                    //push data to pusher
                    PushBroadcast::notifyViaPusher('event.user.notification' ,[
                        'type'    				=> 'user-login',
                        'userUid' 				=> $userLike->userUId,
                        'subject' 				=> 'Ng?????i d??ng ???? ????ng nh???p th??nh c??ng',
                        'message' 				=> $loggedInUserName.'l?? ????ng nh???p',
                        'messageType' 			=> 'C???p nh???t',
                        'showNotification' 		=> getUserSettings('show_user_login_notification', $userLike->userId),
                        'getNotificationList' 	=> getNotificationList($userLike->userId)
                    ]);
                }
            }

            //if mobile request
            if (isMobileAppRequest()) {

                //issue new token
                $authToken = YesTokenAuth::issueToken([
                    'aud'  => $user->_id,
                    'uaid' => $user->user_authority_id
                ]);

                return $this->engineReaction(1, [
                    'auth_info'     => getUserAuthInfo(1),
                    'access_token'  => $authToken
                ], 'Ch??o m???ng, b???n ???? ????ng nh???p th??nh c??ng.');
            }

            return $this->engineReaction(1, [
                'auth_info'     => getUserAuthInfo(1),
                'intendedUrl' => Session::get('intendedUrl'),
                'show_message' => true
            ], 'Ch??o m???ng, b???n ???? ????ng nh???p th??nh c??ng.');
        }



        return $this->engineReaction(2, ['show_message' => true], 'X??c th???c kh??ng th??nh c??ng, vui l??ng ki???m tra th??ng tin ????ng nh???p c???a b???n v?? th??? l???i.');
    }

    /**
     * Process logout request
     *
     * @return array
     *---------------------------------------------------------------- */

    public function processLogout()
    {

        if (Session::has('intendedUrl')) {
            Session::forget('intendedUrl');
        }

        $userId = Auth::user()->_id;

        //fetch user authority
        $userAuthority = $this->userRepository->fetchUserAuthority($userId);

        //update data
        $updateData = [
            'updated_at' => Carbon::now()->subMinutes(2)->toDateTimeString()
        ];

        // Check for if new email activation store
        if ($this->userRepository->updateUserAuthority($userAuthority, $updateData)) {
            Auth::logout();
        }

        return $this->engineReaction(2, null, '????ng xu???t ng?????i d??ng kh??ng th??nh c??ng.');
    }

    /**
     * User Sign prepare
     *-----------------------------------------------------------------------*/
    public function prepareSignupData()
    {
        $allGenders = configItem('user_settings.gender');
        $genders = [];
        foreach ($allGenders as $key => $value) {
            $genders[] = [
                'id' 	=> $key,
                'value' => $value
            ];
        }
        return $this->engineReaction(1, [
            'genders' => $genders
        ]);
    }

    /**
     * User Sign Process.
     *
     * @param array $inputData
     *
     *-----------------------------------------------------------------------*/
    public function userSignUpProcess($inputData)
    {
        $transactionResponse = $this->userRepository->processTransaction(function() use($inputData) {
            $activationRequiredForNewUser = getStoreSettings('activation_required_for_new_user');
            $inputData['status'] = 1; // Active
            // check if activation is required for new user
            if ($activationRequiredForNewUser) {
                $inputData['status'] = 4; // Never Activated
            }
            // Store user
            $newUser = $this->userRepository->storeUser($inputData);
            // Check if user not stored successfully
            if (!$newUser) {
                return $this->userRepository->transactionResponse(2, ['show_message' => true], __tr('User not added.'));
            }
            $userAuthorityData = [
                'user_id' => $newUser->_id,
                'user_roles__id' => 2
            ];
            // Add user authority
            if ($this->userRepository->storeUserAuthority($userAuthorityData)) {

                //check enable bonus credits for new user
                if (getStoreSettings('enable_bonus_credits')) {
                    $creditWalletStoreData = [
                        'status' 	=> 1,
                        'users__id' => $newUser->_id,
                        'credits' 	=> getStoreSettings('number_of_credits'),
                        'credit_type' => 1 //Bonuses
                    ];
                    //store user credit transaction data
                    if (!$this->userRepository->storeCreditWalletTransaction($creditWalletStoreData)) {
                        return $this->userRepository->transactionResponse(2, ['show_message' => true], __tr('User credits not stored.'));
                    }
                }

                $profileData = [
                    'users__id' 	=> $newUser->_id,
                    'gender' 		=> $inputData['gender'],
                    'dob' 			=> $inputData['dob'],
                    'status'		=> 1
                ];

                //store profile
                if ($this->userRepository->storeUserProfile($profileData)) {

                    //check activation required for new users
                    if ($activationRequiredForNewUser) {

                        if (isMobileAppRequest()) {
                            $emailData = [
                                'fullName' => $newUser->first_name,
                                'email' => $newUser->email,
                                'expirationTime' => configItem('otp_expiry'),
                                'otp' => $newUser->remember_token
                            ];
                            // check if email send to member
                            if ($this->baseMailer->notifyToUser('T??i kho???n c???a b???n ???? ????ng k?? th??nh c??ng.', 'account.activation-for-app', $emailData, $newUser->email)) {
                                return $this->userRepository->transactionResponse(1, [
                                    'show_message' => true,
                                    'activation_required' => true
                                ], 'T??i kho???n c???a b???n ???? ???????c t???o th??nh c??ng, ????? k??ch ho???t t??i kho???n, vui l??ng ki???m tra email c???a b???n.');
                            }
                        } else {

                            $emailData = [
                                'fullName' => $newUser->first_name,
                                'email' => $newUser->email,
                                'expirationTime' => configItem('account.expiry'),
                                'activation_url' => URL::temporarySignedRoute('user.account.activation', Carbon::now()->addHours(configItem('account.expiry')), ['userUid' => $newUser->_uid])
                            ];
                            // check if email send to member
                            if ($this->baseMailer->notifyToUser('T??i kho???n c???a b???n ???? ????ng k?? th??nh c??ng.', 'account.activation', $emailData, $newUser->email)) {
                                return $this->userRepository->transactionResponse(1, ['show_message' => true], 'T??i kho???n c???a b???n ???? ???????c t???o th??nh c??ng, ????? k??ch ho???t t??i kho???n, vui l??ng ki???m tra email c???a b???n.');
                            }
                        }
                    } else {
                        return $this->userRepository->transactionResponse(1, ['show_message' => true], 'T??i kho???n c???a b???n ???? ???????c t???o th??nh c??ng.');
                    }
                }
            }
            // Send failed server error message
            return $this->userRepository->transactionResponse(2, ['show_message' => true], '???? x???y ra s??? c??? tr??n m??y ch???, vui l??ng li??n h??? v???i qu???n tr??? vi??n.');
        });

        return $this->engineReaction($transactionResponse);
    }

    /**
     * Process user update password request.
     *
     * @param array $inputData
     *
     * @return array
     *---------------------------------------------------------------- */
    public function processUpdatePassword($inputData)
    {
        $user = Auth::user();
        // Check if logged in user password matched with entered password
        if (!Hash::check($inputData['current_password'], $user->password)) {
            return $this->engineReaction(3, ['show_message' => true], 'M???t kh???u hi???n t???i kh??ng ????ng.');
        }

        // Check if user password updated
        if ($this->userRepository->updatePassword($user, $inputData['new_password'])) {
            return $this->engineReaction(1, ['show_message' => true], '???? c???p nh???t m???t kh???u th??nh c??ng');
        }

        return $this->engineReaction(14, ['show_message' => true], 'M???t kh???u ch??a ???????c c???p nh???t.');
    }

    /**
     * Send new email activation reminder.
     *
     * @param array $inputData
     *
     * @return array
     *---------------------------------------------------------------- */
    public function processChangeEmail($inputData)
    {
        $user = Auth::user();
        // Check if user entered correct password or not
        if (!Hash::check($inputData['current_password'], $user->password)) {
            return $this->engineReaction(3, ['show_message' => true], 'Vui l??ng ki???m tra m???t kh???u c???a b???n.');
        }
        //get data
        $activationRequired = getStoreSettings('activation_required_for_change_email');

        //check activation required or not
        if ($activationRequired) {
            $emailData = [
                'full_name' => $user->first_name.' '.$user->last_name,
                'newEmail' => $inputData['new_email'],
                'expirationTime' => configItem('account.change_email_expiry'),
                'activation_url' => URL::temporarySignedRoute('user.new_email.activation', Carbon::now()->addHours(configItem('account.change_email_expiry')), ['userUid' => $user->_uid, 'newEmail' => $inputData['new_email']])

            ];
            // check if email send to member
            if ($this->baseMailer->notifyToUser('K??ch ho???t Email M???i.', 'account.new-email-activation', $emailData, $inputData['new_email'])) {
                return $this->engineReaction(1, ['show_message' => true, 'activationRequired' => true], 'Li??n k???t k??ch ho???t email m???i ???? ???????c g???i ?????n ?????a ch??? email m???i c???a b???n, vui l??ng ki???m tra email c???a b???n.');
            }
        } else {
            $updateData = [
                'email' => $inputData['new_email']
            ];
            // Check for if new email activation store
            if ($this->userRepository->updateUser($user, $updateData)) {
                return $this->engineReaction(1, [
                    'show_message' => true,
                    'activationRequired' => false,
                    'newEmail' => $inputData['new_email']
                ], 'C???p nh???t email th??nh c??ng');
            }
        }
        //error response
        return $this->engineReaction(2, ['show_message' => true], 'Email kh??ng ???????c c???p nh???t.');
    }

    /**
     * Activate new email.
     *
     * @param number $userID
     *
     * @return array
     *---------------------------------------------------------------- */
    public function processNewEmailActivation($userUid, $newEmail)
    {
        $user = $this->userRepository->fetch($userUid);
        // Check if user record exist
        if (__isEmpty($user)) {
            return $this->engineReaction(2, null, 'D??? li???u ng?????i d??ng kh??ng t???n t???i.');
        }
        $updateData = [
            'email' => $newEmail
        ];

        // Check for if new email activation store
        if ($this->userRepository->updateUser($user, $updateData)) {
            return $this->engineReaction(1, ['show_message' => true], 'C???p nh???t email th??nh c??ng.');
        }
        //error response
        return $this->engineReaction(2, ['show_message' => true], 'Email kh??ng ???????c c???p nh???t.');
    }

    /**
     * Process forgot password request based on passed email address &
     * send password reminder on enter email address.
     *
     * @param string $email
     *
     * @return array
     *---------------------------------------------------------------- */
    public function sendPasswordReminder($email)
    {
        $user = $this->userRepository->fetchActiveUserByEmail($email);

        // Check if user record exist
        if (__isEmpty($user)) {
            return $this->engineReaction(2, ['show_message'=>true], 'Y??u c???u kh??ng h???p l???.');
        }

        // Delete old password reminder for this user
        $this->userRepository->deleteOldPasswordReminder($email);

        $token = YesSecurity::generateUid();
        $createdAt = getCurrentDateTime();

        $storeData = [
            'email'			=>	$email,
            'token'			=>	$token,
            'created_at'	=>	$createdAt
        ];

        // Check for if password reminder added
        if (!$this->userRepository->storePasswordReminder($storeData)) {
            return $this->engineReaction(2, ['show_message'=>true], 'Y??u c???u kh??ng h???p l???.');
        }

        //message data
        $emailData = [
            'full_name' => $user->first_name.' '.$user->last_name,
            'email' => $user->email,
            'expirationTime' => config('__tech.account.password_reminder_expiry'),
            'email' => $user->email,
            'email' => $user->email,
            'email' => $user->email,
            'tokenUrl' => route('user.reset_password', ['reminderToken' => $token]),
        ];

        // if reminder mail has been sent
        if ($this->baseMailer->notifyToUser('?????t l???i m???t kh???u', 'account.password-reminder', $emailData, $user->email)) {
            return $this->engineReaction(1, ['show_message' => true], 'Ch??ng t??i ???? g???i qua e-mail li??n k???t ?????t l???i m???t kh???u c???a b???n.'); // success reaction
        }

        return $this->engineReaction(2, ['show_message' => true],'???? x???y ra s??? c??? tr??n m??y ch???'); // error reaction
    }

    /**
     * Process reset password request.
     *
     * @param array  $input
     * @param string $reminderToken
     *
     * @return array
     *---------------------------------------------------------------- */
    public function processResetPassword($input, $reminderToken)
    {
        $email = $input['email'];

        //check if mobile app request then change request Url
        $token = $reminderToken;

        //get password reminder count
        $count = $this->userRepository->fetchPasswordReminderCount($token, $email);

        // Check if reminder count not exist on 0
        if (!$count > 0) {
            return  $this->engineReaction(18, ['show_message' => true], 'Y??u c???u kh??ng h???p l???.');
        }

        //fetch active user by email
        $user = $this->userRepository->fetchActiveUserByEmail($email);

        // Check if user record exist
        if (__isEmpty($user)) {
            return  $this->engineReaction(18, ['show_message' => true], 'Y??u c???u kh??ng h???p l???.');
        }

        // Check if user password updated
        if ($this->userRepository->resetPassword($user, $input['password'])) {
            return  $this->engineReaction(1, ['show_message' => true], '?????t l???i m???t kh???u th??nh c??ng.');
        }

        //failed response
        return  $this->engineReaction(2, ['show_message' => true], 'M???t kh???u ch??a ???????c c???p nh???t.');
    }

    /**
     * Process Account Activation.
     *
     * @param string $userUid
     *
     *-----------------------------------------------------------------------*/
    public function processAccountActivation($userUid)
    {
        $neverActivatedUser = $this->userRepository->fetchNeverActivatedUser($userUid);

        // Check if never activated user exist or not
        if (__isEmpty($neverActivatedUser)) {
            return $this->engineReaction(18, null, 'Li??n k???t k??ch ho???t t??i kho???n kh??ng h???p l???.');
        }

        $updateData = [
            'status' => 1 // Active
        ];
        // Check if user activated successfully
        if ($this->userRepository->updateUser($neverActivatedUser, $updateData)) {
            return $this->engineReaction(1, null, 'T???i kho???n c???a b???n ???? ???????c k??ch ho???t th??nh c??ng. ????ng nh???p b???ng email v?? m???t kh???u c???a b???n.');
        }

        return  $this->engineReaction(2, null, 'Li??n k???t k??ch ho???t t??i kho???n kh??ng h???p l???.');
    }

    /**
     * Prepare User Profile Data.
     *
     * @param string $userName
     *
     *-----------------------------------------------------------------------*/
    public function prepareUserProfile($userName)
    {
        // fetch User by username
        $user = $this->userRepository->fetchByUsername($userName, true);

        // check if user exists
        if (__isEmpty($user)) {
            return $this->engineReaction(18, [], 'Ng?????i d??ng kh??ng t???n t???i.');
        }
        $userId = $user->_id;
        $userUid = $user->_uid;
        $isOwnProfile = ($userId == getUserID()) ? true : false;
        // Prepare user data
        $userData = [
            'userId' => $userId,
            'userUId' => $userUid,
            'fullName' => $user->first_name.' '.$user->last_name,
            'first_name' => $user->first_name,
            'last_name' => $user->last_name,
            'mobile_number' => $user->mobile_number,
            'userName'	=> $user->username
        ];

        $userProfileData = $userSpecifications = $userSpecificationData = $photosData = [];

        // fetch User details
        $userProfile = $this->userSettingRepository->fetchUserProfile($userId);
        $userSettingConfig = configItem('user_settings');
        $profilePictureFolderPath = getPathByKey('profile_photo', ['{_uid}' => $userUid]);
        $profilePictureUrl = noThumbImageURL();
        $coverPictureFolderPath = getPathByKey('cover_photo', ['{_uid}' => $userUid]);
        $coverPictureUrl = noThumbCoverImageURL();
        // Check if user profile exists
        if (!__isEmpty($userProfile)) {
            if (!__isEmpty($userProfile->profile_picture)) {
                $profilePictureUrl = getMediaUrl($profilePictureFolderPath, $userProfile->profile_picture);
            }
            if (!__isEmpty($userProfile->cover_picture)) {
                $coverPictureUrl = getMediaUrl($coverPictureFolderPath, $userProfile->cover_picture);
            }
        }
        // Set cover and profile picture url
        $userData['profilePicture'] = $profilePictureUrl;
        $userData['coverPicture'] = $coverPictureUrl;
        $userData['userAge'] = isset($userProfile->dob) ? Carbon::parse($userProfile->dob)->age : null;

        // check if user profile exists
        if (!\__isEmpty($userProfile)) {
            // Get country name
            $countryName = '';
            if (!__isEmpty($userProfile->countries__id)) {
                $country = $this->countryRepository->fetchById($userProfile->countries__id, ['name']);
                $countryName = $country->name;
            }
            $userProfileData = [
                'aboutMe'               => $userProfile->about_me,
                'city'                  => $userProfile->city,
                'mobile_number'         => $user->mobile_number,
                'gender'                => $userProfile->gender,
                'gender_text'           => array_get($userSettingConfig, 'gender.'.$userProfile->gender),
                'country'               => $userProfile->countries__id,
                'country_name'          => $countryName,
                'dob'                   => $userProfile->dob,
                'birthday'              => (!\__isEmpty($userProfile->dob))
                    ? formatDate($userProfile->dob)
                    : '',
                'work_status'           => $userProfile->work_status,
                'formatted_work_status' => array_get($userSettingConfig, 'work_status.'.$userProfile->work_status),
                'education'                 => $userProfile->education,
                'formatted_education'       => array_get($userSettingConfig, 'educations.'.$userProfile->education),
                'preferred_language'    => $userProfile->preferred_language,
                'formatted_preferred_language' => array_get($userSettingConfig, 'preferred_language.'.$userProfile->preferred_language),
                'relationship_status'   => $userProfile->relationship_status,
                'formatted_relationship_status' => array_get($userSettingConfig, 'relationship_status.'.$userProfile->relationship_status),
                'latitude'              => $userProfile->location_latitude,
                'longitude'             => $userProfile->location_longitude,
                'isVerified'            => $userProfile->is_verified,
            ];
        }

        $specificationCollection = $this->userSettingRepository->fetchUserSpecificationById($userId);
        // Check if user specifications exists
        if (!\__isEmpty($specificationCollection)) {
            $userSpecifications = $specificationCollection->pluck('specification_value', 'specification_key')->toArray();
        }
        $specificationConfig = $this->getUserSpecificationConfig();
        foreach ($specificationConfig['groups'] as $specKey => $specification) {
            $items = [];
            foreach($specification['items'] as $itemKey => $item) {
                if (!$isOwnProfile and array_key_exists($itemKey, $userSpecifications)) {
                    $userSpecKey =  $userSpecifications[$itemKey];
                    $items[] = [
                        'name'  => $itemKey,
                        'label'  => $item['name'],
                        'input_type' => $item['input_type'],
                        'value' => isset($item['options'])
                            ? $item['options'][$userSpecKey]
                            : $userSpecifications[$itemKey],
                        'options' => isset($item['options']) ? $item['options'] : '',
                        'selected_options' => (!__isEmpty($userSpecKey)) ? $userSpecKey : ''
                    ];
                } elseif ($isOwnProfile) {
                    $itemValue = '';
                    $userSpecValue =  isset($userSpecifications[$itemKey])
                        ? $userSpecifications[$itemKey]
                        : '';
                    if (!__isEmpty($userSpecValue)) {
                        $itemValue = isset($item['options'])
                            ? isset($item['options'][$userSpecValue])
                                ? $item['options'][$userSpecValue] : ''
                            : $userSpecValue;
                    }
                    $items[] = [
                        'name'  => $itemKey,
                        'label'  => $item['name'],
                        'input_type' => $item['input_type'],
                        'value' => $itemValue,
                        'options' => isset($item['options']) ? $item['options'] : '',
                        'selected_options' => $userSpecValue
                    ];
                }
            }
            // Check if Item exists
            if (!__isEmpty($items)) {
                $userSpecificationData[$specKey] = [
                    'title' => $specification['title'],
                    'icon' => $specification['icon'],
                    'items' => $items
                ];
            }
        }

        // Get user photos collection
        $userPhotosCollection = $this->userSettingRepository->fetchUserPhotos($userId);
        $userPhotosFolderPath = getPathByKey('user_photos', ['{_uid}' => $userUid]);
        // check if user photos exists
        if (!__isEmpty($userPhotosCollection)) {
            foreach($userPhotosCollection as $userPhoto) {
                $photosData[] = [
                    'image_url' => getMediaUrl($userPhotosFolderPath, $userPhoto->file)
                ];
            }
        }

        //fetch like dislike data by to user id
        $likeDislikeData = $this->userRepository->fetchLikeDislike($user->_id);

        $userLikeData = [];
        //check is not empty
        if (!__isEmpty($likeDislikeData)) {
            $userLikeData = [
                '_id' =>  $likeDislikeData->_id,
                'like' => $likeDislikeData->like
            ];
        }

        //check loggedIn User id doesn't match current user id then
        // store visitor profile data
        if ($userId != getUserID()) {
            $profileVisitorData = $this->userRepository->fetProfileVisitorByUserId($userId);
            //check is empty then store profile visitor data
            if (__isEmpty($profileVisitorData)) {
                $storeData = [
                    'status' => 1,
                    'to_users__id' => $userId,
                    'by_users__id' => getUserID()
                ];

                //store profile visitors data
                if ($this->userRepository->storeProfileVisitors($storeData)) {
                    //user full name
                    $userFullName = $user->first_name.' '.$user->last_name;


                    //loggedIn user name
                    $loggedInUserName = Auth::user()->first_name.' '.Auth::user()->last_name;
                    //check user browser
                    $allowVisitorProfile = getFeatureSettings('browse_incognito_mode');
                    //check in setting allow visitor notification log and pusher request
                    if (!$allowVisitorProfile) {
                        //notification log message
                        notificationLog('H??? s?? ???????c truy c???p b???i'.' '.$loggedInUserName, route('user.profile_view', ['username' => Auth::user()->username]), null, $userId);
                        //push data to pusher
                        PushBroadcast::notifyViaPusher('event.user.notification' ,[
                            'type'    				=> 'profile-visitor',
                            'userUid' 				=> $userUid,
                            'subject' 				=> 'H??? s?? ???? truy c???p th??nh c??ng',
                            'message' 				=> 'H??? s?? ???????c truy c???p b???i'.' '.$loggedInUserName,
                            'messageType' 			=> 'Th??nh c??ng',
                            'showNotification' 		=> getUserSettings('show_visitor_notification', $user->_id),
                            'getNotificationList' 	=> getNotificationList($user->_id)
                        ]);
                    }
                } else {
                    return $this->engineReaction(18, [], 'Kh??ch truy c???p h??? s?? kh??ng ???????c t???o.');
                }
            }
        }

        //fetch total visitors data
        $visitorData = $this->userRepository->fetchProfileVisitor($userId);

        //fetch gift collection
        $giftCollection = $this->manageItemRepository->fetchListData(1);

        $giftListData = [];
        if (!__isEmpty($giftCollection)) {
            foreach ($giftCollection as $key => $giftData) {
                //only active gifts
                if ($giftData->status == 1) {
                    $giftImageUrl = '';
                    $giftImageFolderPath = getPathByKey('gift_image', ['{_uid}' => $giftData->_uid]);
                    $giftImageUrl = getMediaUrl($giftImageFolderPath, $giftData->file_name);
                    //get normal price or normal price is zero then show free gift
                    $normalPrice = (isset($giftData['normal_price']) and intval($giftData['normal_price']) <= 0) ? 'Free' : intval($giftData['normal_price']).' '.'V??';

                    //get premium price or premium price is zero then show free gift
                    $premiumPrice = (isset($giftData['premium_price']) and $giftData['premium_price'] <= 0) ? 'Free' : $giftData['premium_price'].' '.'V??';
                    $giftData['premium_price'].' '.'V??';

                    $price = 'Free';
                    //check user is premium or normal or Set price
                    if (isPremiumUser()) {
                        $price = $premiumPrice;
                    } else {
                        $price = $normalPrice;
                    }
                    $giftListData[] = [
                        '_id' 				=> $giftData['_id'],
                        '_uid' 				=> $giftData['_uid'],
                        'normal_price' 		=> $normalPrice,
                        'premium_price' 	=> $giftData['premium_price'],
                        'formattedPrice' 	=> $price,
                        'gift_image_url'	=> $giftImageUrl
                    ];
                }
            }
        }

        //fetch user gift record
        $userGiftCollection = $this->userRepository->fetchUserGift($userId);

        $userGiftData = [];
        //check if not empty
        if (!__isEmpty($userGiftCollection)) {
            foreach ($userGiftCollection as $key => $userGift) {
                $userGiftImgUrl = '';
                $userGiftFolderPath = getPathByKey('gift_image', ['{_uid}' => $userGift->itemUId]);
                $userGiftImgUrl = getMediaUrl($userGiftFolderPath, $userGift->file_name);
                //check gift status is private (1) and check gift send to current user or gift send by current user
                if ($userGift->status == 1 and ($userGift->to_users__id == getUserID() || $userGift->from_users__id == getUserID())) {
                    $userGiftData[] = [
                        '_id' 				=> $userGift->_id,
                        '_uid' 				=> $userGift->_uid,
                        'itemId' 			=> $userGift->itemId,
                        'status' 			=> $userGift->status,
                        'fromUserName'		=> $userGift->fromUserName,
                        'senderUserName'	=> $userGift->senderUserName,
                        'userGiftImgUrl' 	=> $userGiftImgUrl
                    ];
                    //check gift status is public (0)
                } else if ($userGift->status != 1) {
                    $userGiftData[] = [
                        '_id' 				=> $userGift->_id,
                        '_uid' 				=> $userGift->_uid,
                        'itemId' 			=> $userGift->itemId,
                        'status' 			=> $userGift->status,
                        'fromUserName'		=> $userGift->fromUserName,
                        'senderUserName'	=> $userGift->senderUserName,
                        'userGiftImgUrl' 	=> $userGiftImgUrl
                    ];
                }
            }
        }

        //fetch block me users
        $blockMeUser =  $this->userRepository->fetchBlockMeUser($user->_id);
        $isBlockUser = false;
        //check if not empty then set variable is true
        if (!__isEmpty($blockMeUser)) {
            $isBlockUser = true;
        }

        //fetch block by me user
        $blockUserData = $this->userRepository->fetchBlockUser($user->_id);
        $blockByMe = false;
        //if it is empty
        if (!__isEmpty($blockUserData)) {
            $blockByMe = true;
        }

        return $this->engineReaction(1, [
            'isOwnProfile'          => $isOwnProfile,
            'userData'              => $userData,
            'countries'             => $this->countryRepository->fetchAll()->toArray(),
            'genders'               => $userSettingConfig['gender'],
            'preferredLanguages'    => $userSettingConfig['preferred_language'],
            'relationshipStatuses'  => $userSettingConfig['relationship_status'],
            'workStatuses'          => $userSettingConfig['work_status'],
            'educations'            => $userSettingConfig['educations'],
            'userProfileData'       => $userProfileData,
            'photosData'            => $photosData,
            'userSpecificationData' => $userSpecificationData,
            'userLikeData'			=> $userLikeData,
            'totalUserLike'			=> fetchTotalUserLikedCount($userId),
            'totalVisitors'			=> $visitorData->count(),
            'isBlockUser'			=> $isBlockUser,
            'blockByMeUser'			=> $blockByMe,
            'giftListData'			=> $giftListData,
            'userGiftData'			=> $userGiftData,
            'userOnlineStatus'		=> $this->getUserOnlineStatus($user->userAuthorityUpdatedAt),
            'isPremiumUser'			=> isPremiumUser($userId)
        ]);
    }

    /**
     * User Like Dislike Process.
     *
     * @param array $inputData
     *
     *-----------------------------------------------------------------------*/
    public function processUserLikeDislike($toUserUid, $like)
    {
        // fetch User by toUserUid
        $user = $this->userRepository->fetch($toUserUid);

        // check if user exists
        if (__isEmpty($user)) {
            return $this->engineReaction(2, ['show_message' => true], 'Ng?????i d??ng kh??ng t???n t???i.');
        }

        //delete old encounter User
        $this->userEncounterRepository->deleteOldEncounterUser();

        //user full name
        $userFullName = $user->first_name.' '.$user->last_name;
        //loggedIn user name
        $loggedInUserFullName = Auth::user()->first_name.' '.Auth::user()->last_name;
        $loggedInUserName = Auth::user()->username;
        $showLikeNotification = getFeatureSettings('show_like', null, $user->_id);

        //fetch like dislike data by to user id
        $likeDislikeData = $this->userRepository->fetchLikeDislike($user->_id);

        //check if not empty
        if (!__isEmpty($likeDislikeData)) {
            //if user already liked then show error messages
            if ($like == $likeDislikeData['like'] and $like == 1) {
                if ($this->userRepository->deleteLikeDislike($likeDislikeData)) {
                    return $this->engineReaction(1, [
                        'show_message' => true,
                        'likeStatus' => 1,
                        'status' => 'deleted',
                        'totalLikes' => fetchTotalUserLikedCount($user->_id)
                    ], '???? h???y th??ch ng?????i d??ng');
                }
            } else if ($like == $likeDislikeData['like'] and $like == 0) {
                if ($this->userRepository->deleteLikeDislike($likeDislikeData)) {
                    return $this->engineReaction(1, [
                        'show_message' => true,
                        'likeStatus' => 2,
                        'status' => 'deleted',
                        'totalLikes' => fetchTotalUserLikedCount($user->_id)
                    ], '???? h???y kh??ng th??ch ng?????i d??ng');
                }
            }

            //update data
            $updateData = ['like'=> $like];
            //update like dislike
            if ($this->userRepository->updateLikeDislike($likeDislikeData, $updateData)) {
                //is like 1
                if ($like == 1) {

                    //check show like feature return true
                    if ($showLikeNotification) {
                        //notification log message
                        notificationLog('H??? s?? ???????c th??ch b???i'.' '.$loggedInUserFullName, route('user.profile_view', ['username' => $loggedInUserName]), null, $user->_id);
                        //push data to pusher
                        PushBroadcast::notifyViaPusher('event.user.notification' ,[
                            'type'    				=> 'user-likes',
                            'userUid' 				=> $user->_uid,
                            'subject' 				=> 'Th??ch' .' '.$loggedInUserFullName .' '. 'th??nh c??ng',
                            'message' 				=> 'H??? s?? ???????c th??ch b???i'.' '.$loggedInUserFullName,
                            'messageType' 			=> 'success',
                            'showNotification' 		=> getUserSettings('show_like_notification', $user->_id),
                            'getNotificationList' 	=> getNotificationList($user->_id)
                        ]);
                    }
                    return $this->engineReaction(1, [
                        'show_message' => true,
                        'likeStatus' => 1,
                        'status' => 'updated',
                        'totalLikes' => fetchTotalUserLikedCount($user->_id)
                    ], 'Th??ch ng?????i d??ng th??nh c??ng');
                } else {


                    return $this->engineReaction(1,  [
                        'show_message' => true,
                        'likeStatus' => 2,
                        'status' => 'updated',
                        'totalLikes' => fetchTotalUserLikedCount($user->_id)
                    ], 'Kh??ng th??ch ng?????i d??ng th??nh c??ng');
                }
            }
        } else {
            //store data
            $storeData = [
                'status' => 1,
                'to_users__id' => $user->_id,
                'by_users__id' => getUserID(),
                'like'		   => $like
            ];
            //store like dislike
            if ($this->userRepository->storeLikeDislike($storeData)) {
                //is like 1
                if ($like == 1) {

                    //check show like feature return true
                    if ($showLikeNotification) {
                        //notification log message
                        notificationLog('H??? s?? ???????c th??ch b???i'.' '.$loggedInUserFullName, route('user.profile_view', ['username' => $loggedInUserName]), null, $user->_id);

                        //push data to pusher
                        PushBroadcast::notifyViaPusher('event.user.notification' ,[
                            'type'    				=> 'user-likes',
                            'userUid' 				=> $user->_uid,
                            'subject' 				=> 'Th??ch' .' '.$loggedInUserFullName .' '. 'th??nh c??ng',
                            'message' 				=> 'H??? s?? ???????c th??ch b???i'.' '.$loggedInUserFullName,
                            'messageType' 			=> 'success',
                            'showNotification' 		=> getUserSettings('show_like_notification', $user->_id),
                            'getNotificationList' 	=> getNotificationList($user->_id)
                        ]);
                    }

                    return $this->engineReaction(1, [
                        'show_message' => true,
                        'likeStatus' => 1,
                        'status' => 'created',
                        'totalLikes' => fetchTotalUserLikedCount($user->_id)
                    ], 'Th??ch ng?????i d??ng th??nh c??ng');
                } else {


                    return $this->engineReaction(1, [
                        'show_message' => true,
                        'likeStatus' => 2,
                        'status' => 'created',
                        'totalLikes' => fetchTotalUserLikedCount($user->_id)
                    ], 'Kh??ng th??ch ng??????i du??ng th??nh c??ng');
                }
            }
        }
        return $this->engineReaction(2, ['show_message' => true], '???? x???y ra l???i.');
    }

    /**
     * Prepare User Liked Data.
     *
     *-----------------------------------------------------------------------*/
    public function prepareUserLikeDislikedData($likeType)
    {
        //fetch user liked data by to user id
        $likedCollection = $this->userRepository->fetchUserLikeData($likeType, true);

        return $this->engineReaction(1, [
            'usersData' => $this->prepareUserArray($likedCollection),
            'nextPageUrl' => $likedCollection->nextPageUrl()
        ]);
    }

    /**
     * Prepare User Liked Me Data.
     *
     *-----------------------------------------------------------------------*/
    public function prepareUserLikeMeData()
    {
        //get people likes me data
        $userLikedMeData = $this->userRepository->fetchUserLikeMeData(true);

        return $this->engineReaction(1, [
            'usersData' => $this->prepareUserArray($userLikedMeData),
            'nextPageUrl' => $userLikedMeData->nextPageUrl()
        ]);
    }

    /**
     * Prepare Mutual like data.
     *
     *-----------------------------------------------------------------------*/
    public function prepareMutualLikeData()
    {
        //fetch user liked data by to user id
        $likedCollection = $this->userRepository->fetchUserLikeData(1, false);
        //pluck people like ids
        $peopleLikeUserIds = $likedCollection->pluck('to_users__id')->toArray();
        //get people likes me data
        $userLikedMeData = $this->userRepository->fetchUserLikeMeData(false)->whereIn('by_users__id', $peopleLikeUserIds);
        //pluck people like me ids
        $mutualLikeIds = $userLikedMeData->pluck('_id')->toArray();
        //get mutual like data
        $mutualLikeCollection = $this->userRepository->fetchMutualLikeUserData($mutualLikeIds);

        return $this->engineReaction(1, [
            'usersData' => $this->prepareUserArray($mutualLikeCollection),
            'nextPageUrl' => $mutualLikeCollection->nextPageUrl()
        ]);
    }

    /**
     * Prepare profile visitors Data.
     *
     *-----------------------------------------------------------------------*/
    public function prepareProfileVisitorsData()
    {
        //profile boost all user list
        $isPremiumUser = $this->userRepository->fetchAllPremiumUsers();
        //premium user ids
        $premiumUserIds = $isPremiumUser->pluck('users__id')->toArray();
        //get profile visitor data
        $profileVisitors = $this->userRepository->fetchProfileVisitorData();

        $userData = [];
        //check if not empty collection
        if (!__isEmpty($profileVisitors)) {
            foreach ($profileVisitors as $key => $user) {
                //check user browser
                $allowVisitorProfile = getFeatureSettings('browse_incognito_mode', null, $user->userId);

                //check is premium user value is false and in array check premium user exists
                //then data not shown in visitors page
                if (!$allowVisitorProfile and !in_array($user->userId, $premiumUserIds)) {
                    $userImageUrl = '';
                    //check is not empty
                    if (!__isEmpty($user->profile_picture)) {
                        $profileImageFolderPath = getPathByKey('profile_photo', ['{_uid}' => $user->userUId]);
                        $userImageUrl = getMediaUrl($profileImageFolderPath, $user->profile_picture);
                    } else {
                        $userImageUrl = noThumbImageURL();
                    }

                    $userAge = isset($user->dob) ? Carbon::parse($user->dob)->age : null;
                    $gender = isset($user->gender) ? configItem('user_settings.gender', $user->gender) : null;

                    $userData[] = [
                        '_id' 			=> $user->_id,
                        '_uid' 			=> $user->_uid,
                        'status' 		=> $user->status,
                        'like'			=> $user->like,
                        'created_at' 	=> formatDiffForHumans($user->created_at),
                        'updated_at'	=> formatDiffForHumans($user->updated_at),
                        'userFullName'	=> $user->userFullName,
                        'username'  	=> $user->username,
                        'userImageUrl'  => $userImageUrl,
                        'profilePicture'=> $user->profile_picture,
                        'userOnlineStatus' => $this->getUserOnlineStatus($user->userAuthorityUpdatedAt),
                        'gender' 		=> $gender,
                        'dob' 			=> $user->dob,
                        'city' 			=> $user->city,
                        'userAge'		=> $userAge,
                        'countryName' 	=> $user->countryName,
                        'isPremiumUser'		=> isPremiumUser($user->userId),
                        'detailString'	=> implode(", ", array_filter([$userAge, $gender]))
                    ];
                }
            }
        }

        return $this->engineReaction(1, [
            'usersData' => $userData,
            'nextPageUrl' => $profileVisitors->nextPageUrl()
        ]);
    }

    /**
     * Prepare User Array Data.
     *
     *-----------------------------------------------------------------------*/
    public function prepareUserArray($userCollection)
    {
        $userData = [];
        //check if not empty collection
        if (!__isEmpty($userCollection)) {
            foreach ($userCollection as $key => $user) {
                $userImageUrl = '';
                //check is not empty
                if (!__isEmpty($user->profile_picture)) {
                    $profileImageFolderPath = getPathByKey('profile_photo', ['{_uid}' => $user->userUId]);
                    $userImageUrl = getMediaUrl($profileImageFolderPath, $user->profile_picture);
                } else {
                    $userImageUrl = noThumbImageURL();
                }

                $userAge = isset($user->dob) ? Carbon::parse($user->dob)->age : null;
                $gender = isset($user->gender) ? configItem('user_settings.gender', $user->gender) : null;

                $userData[] = [
                    '_id' 			=> $user->_id,
                    '_uid' 			=> $user->_uid,
                    'status' 		=> $user->status,
                    'like'			=> $user->like,
                    'created_at' 	=> formatDiffForHumans($user->created_at),
                    'updated_at'	=> formatDiffForHumans($user->updated_at),
                    'userFullName'	=> $user->userFullName,
                    'username'  	=> $user->username,
                    'userImageUrl'  => $userImageUrl,
                    'profilePicture'=> $user->profile_picture,
                    'userOnlineStatus' => $this->getUserOnlineStatus($user->userAuthorityUpdatedAt),
                    'gender' 		=> $gender,
                    'dob' 			=> $user->dob,
                    'city' 			=> $user->city,
                    'userAge'		=> $userAge,
                    'countryName' 	=> $user->countryName,
                    'isPremiumUser'	=> isPremiumUser($user->userId),
                    'detailString'	=> implode(", ", array_filter([$userAge, $gender]))
                ];
            }
        }

        return $userData;
    }

    /**
     * Process User Send Gift.
     *
     *-----------------------------------------------------------------------*/
    public function processUserSendGift($inputData, $sendUserUId)
    {
        //buy premium plan request
        $userSendGiftRequest = $this->userRepository->processTransaction(function() use ($inputData, $sendUserUId) {
            //fetch user
            $user = $this->userRepository->fetch($sendUserUId);

            //if user not exists
            if (__isEmpty($user)) {
                return $this->userRepository->transactionResponse(2, ['show_message' => true], 'Ng?????i d??ng kh??ng t???n t???i');
            }

            //fetch gift data
            $giftData = $this->manageItemRepository->fetch($inputData['selected_gift']);

            //if gift not exists
            if (__isEmpty($giftData)) {
                return $this->userRepository->transactionResponse(2, ['show_message' => true], 'D??? li???u qu?? t???ng kh??ng t???n t???i');
            }

            //fetch user credits data
            $totalUserCredits = totalUserCredits();

            //if gift price greater then total user credits then show error message
            if ($giftData->normal_price > $totalUserCredits) {
                return $this->userRepository->transactionResponse(2, [
                    'show_message' => true,
                    'errorType' => 'insufficient_balance'
                ], 'S??? d?? c???a b???n qu?? th???p, vui l??ng na??p ti????n');
            }
            //check user is premium or normal or Set price
            if (isPremiumUser()) {
                $credits = $giftData->premium_price;
            } else {
                $credits = $giftData->normal_price;
            }
            //credit wallet store data
            $creditWalletStoreData = [
                'status' => 1,
                'users__id'=> getUserID(),
                'credits' => '-'.''.$credits
            ];

            //store user gift data
            if ($creditWalledId = $this->userRepository->storeCreditWalletTransaction($creditWalletStoreData)) {

                //store gift data
                $giftStoreData = [
                    'status' => (isset($inputData['isPrivateGift'])
                        and $inputData['isPrivateGift'] == 'on') ? 1 : 0,
                    'from_users__id' => getUserID(),
                    'to_users__id'	 => $user->_id,
                    'items__id'		 => $giftData->_id,
                    'price'			 => $giftData->normal_price,
                    'credit_wallet_transactions__id' => $creditWalledId
                ];

                //store gift data
                if ($this->userRepository->storeUserGift($giftStoreData)) {
                    $userFullName = $user->first_name.' '.$user->last_name;

                    //loggedIn user name
                    $loggedInUserName = Auth::user()->first_name.' '.Auth::user()->last_name;
                    //notification log message
                    notificationLog('Gift send by'.' '.$loggedInUserName, route('user.profile_view', ['username' => Auth::user()->username]), null, $user->_id);

                    //push data to pusher
                    PushBroadcast::notifyViaPusher('event.user.notification' ,[
                        'type'    				=> 'user-gift',
                        'userUid' 				=> $user->_uid,
                        'subject' 				=> 'G???i qu?? th??nh c??ng',
                        'message' 				=> 'G???i qu?? b???i'.' '.$loggedInUserName,
                        'messageType' 			=> 'C???p nh???t',
                        'showNotification' 		=> getUserSettings('show_gift_notification', $user->_id),
                        'getNotificationList' 	=> getNotificationList($user->_id)
                    ]);

                    return $this->userRepository->transactionResponse(1, [
                        'show_message' => true,
                        'giftUid' => $giftData->_uid
                    ], 'G???i qu?? th??nh c??ng.');
                }
            }
            //error message
            return $this->userRepository->transactionResponse(2, ['show_message' => true], __tr('Gift not send.'));
        });

        //response
        return $this->engineReaction($userSendGiftRequest);
    }

    /**
     * Process Report User.
     *
     *-----------------------------------------------------------------------*/
    public function processReportUser($inputData, $sendUserUId)
    {
        //fetch user
        $user = $this->userRepository->fetch($sendUserUId);

        //if user not exists
        if (__isEmpty($user)) {
            return $this->engineReaction(2, ['show_message' => true], __tr('User does not exists.'));
        }

        //fetch reported user data
        $reportUserData = $this->manageAbuseReportRepository->fetchAbuseReport($user->_id);

        //if exist then throw error message
        if (!__isEmpty($reportUserData)) {
            return $this->engineReaction(2, ['show_message' => true], __tr('User already abuse reported.'));
        }

        //store report data
        $storeReportData = [
            'status' => 1,
            'for_users__id' => $user->_id,
            'by_users__id'  => getUserID(),
            'reason'		=>	$inputData['report_reason']
        ];
        // store report data
        if ($this->manageAbuseReportRepository->storeReportUser($storeReportData)) {
            return $this->engineReaction(1, ['show_message' => true], '???? b??o c??o l???m d???ng ng?????i d??ng th??nh c??ng');
        }

        //error message
        return $this->engineReaction(1, ['show_message' => true], 'Ng?????i d??ng kh??ng th??? b??o c??o l???m d???ng');
    }

    /**
     * Process Block User.
     *
     *-----------------------------------------------------------------------*/
    public function processBlockUser($inputData)
    {
        //fetch user
        $user = $this->userRepository->fetch($inputData['block_user_id']);

        //if user not exists
        if (__isEmpty($user)) {
            return $this->engineReaction(2, null, 'Ng?????i d??ng kh??ng t???n t???i.');
        }

        //fetch block user data
        $blockUserData = $this->userRepository->fetchBlockUser($user->_id);

        //check is not empty
        if (!__isEmpty($blockUserData)) {
            //error response
            return $this->engineReaction(2, null, 'B???n ???? ch???n ng?????i d??ng n??y.');
        }

        //store data
        $storeData = [
            'status' => 1,
            'to_users__id' => $user->_id,
            'by_users__id' => getUserID()
        ];

        //store block user data
        if ($this->userRepository->storeBlockUser($storeData)) {
            //user full name
            $userFullName = $user->first_name.' '.$user->last_name;
            //loggedIn user name
            $loggedInUserName = Auth::user()->first_name.' '.Auth::user()->last_name;


            //success response
            return $this->engineReaction(1, null, '???? ch???n ng?????i d??ng th??nh c??ng.');
        }
        //error response
        return $this->engineReaction(2, null, 'Ng?????i d??ng kh??ng ch???n.');
    }

    /**
     * Prepare Block User Data.
     *
     *-----------------------------------------------------------------------*/
    public function prepareBlockUserData()
    {
        $blockUserCollection = $this->userRepository->fetchAllBlockUser(true);

        $blockUserList = [];
        //check if not empty
        if (!__isEmpty($blockUserCollection)) {
            foreach ($blockUserCollection as $key => $blockUser) {
                $userImageUrl = '';
                //check is not empty
                if (!__isEmpty($blockUser->profile_picture)) {
                    $profileImageFolderPath = getPathByKey('profile_photo', ['{_uid}' => $blockUser->userUId]);
                    $userImageUrl = getMediaUrl($profileImageFolderPath, $blockUser->profile_picture);
                } else {
                    $userImageUrl = noThumbImageURL();
                }

                $userAge = isset($blockUser->dob) ? Carbon::parse($blockUser->dob)->age : null;
                $gender = isset($blockUser->gender) ? configItem('user_settings.gender', $blockUser->gender) : null;

                $blockUserList[] = [
                    '_id' 			=> $blockUser->_id,
                    '_uid' 			=> $blockUser->_uid,
                    'userId' 		=> $blockUser->userId,
                    'userUId' 		=> $blockUser->userUId,
                    'userFullName' 	=> $blockUser->userFullName	,
                    'status' 		=> $blockUser->status,
                    'created_at' 	=> formatDiffForHumans($blockUser->created_at),
                    'username'		=>	$blockUser->username,
                    'userImageUrl'  => $userImageUrl,
                    'profilePicture' => $blockUser->profile_picture,
                    'gender' 		=> $gender,
                    'dob' 			=> $blockUser->dob,
                    'city' 			=> $blockUser->city,
                    'userAge'		=> $userAge,
                    'countryName' 	=> $blockUser->countryName,
                    'isPremiumUser'	=> isPremiumUser($blockUser->userId),
                    'detailString'	=> implode(", ", array_filter([$userAge, $gender]))
                ];
            }
        }

        //success reaction
        return $this->engineReaction(1, [
            'usersData' => $blockUserList,
            'nextPageUrl' 	=> $blockUserCollection->nextPageUrl()
        ]);
    }

    /**
     *Process unblock user.
     *
     *-----------------------------------------------------------------------*/
    public function processUnblockUser($userUid)
    {
        //fetch user
        $user = $this->userRepository->fetch($userUid);

        //if user not exists
        if (__isEmpty($user)) {
            return $this->engineReaction(2, null, 'Ng?????i d??ng kh??ng t???n t???i.');
        }

        //fetch block user data
        $blockUserData = $this->userRepository->fetchBlockUser($user->_id);

        //if it is empty
        if (__isEmpty($blockUserData)) {
            return $this->engineReaction(2, null, 'Ng?????i d??ng ch???n kh??ng t???n t???i.');
        }

        //delete block user
        if ($this->userRepository->deleteBlockUser($blockUserData)) {
            //user full name
            $userFullName = $user->first_name.' '.$user->last_name;
            //loggedIn user name
            $loggedInUserName = Auth::user()->first_name.' '.Auth::user()->last_name;

            //success response
            return $this->engineReaction(1, [
                'blockUserUid' => $blockUserData->_uid,
                'blockUserLength' => $this->userRepository->fetchAllBlockUser()->count()
            ], __tr('User has been unblock successfully.'));
        }

        //error response
        return $this->engineReaction(2, null, 'Kh??ng th??? b??? ch???n ng?????i d??ng.');
    }


    /**
     *	Process Boost Profile
     *
     *-----------------------------------------------------------------------*/
    public function processBoostProfile()
    {
        $transactionResponse = $this->userRepository->processTransaction(function() {

            $user = Auth::user();

            //fetch user
            $activeBoost = $this->userRepository->fetchActiveProfileBoost($user->_id);

            $remainingTime = 0;

            if (!__isEmpty($activeBoost)) {
                $remainingTime = Carbon::now()->diffInSeconds($activeBoost->expiry_at, false);
            }

            $totalUserCredits = totalUserCredits();
            $boostPeriod = getStoreSettings('booster_period');
            $boostPrice = getStoreSettings('booster_price');

            if (isPremiumUser()) {
                $boostPrice = getStoreSettings('booster_price_for_premium_user');
            }

            if ($totalUserCredits < $boostPrice) {
                return $this->userRepository->transactionResponse(2, [
                    'show_message' => true,
                    'creditsRemaining' => totalUserCredits()
                ], '????? c??c kho???n t??n d???ng kh??ng c?? s???n. Vui l??ng mua m???t s??? t??n d???ng');
            }

            //credit wallet store data
            $creditWalletStoreData = [
                'status' => 1,
                'users__id'=> $user->_id,
                'credits' => '-'.''.$boostPrice
            ];

            //store user gift data
            if ($creditWalledId = $this->userRepository->storeCreditWalletTransaction($creditWalletStoreData)) {

                $boosterData = [
                    'for_users__id' => $user->_id,
                    'expiry_at' 	=> Carbon::now()->addSeconds(($remainingTime + ($boostPeriod * 60))),
                    'status' => 1,
                    'credit_wallet_transactions__id' => $creditWalledId
                ];

                if ($booster = $this->userRepository->storeBooster($boosterData)) {



                    //fetch user
                    $activeBoost = $this->userRepository->fetchActiveProfileBoost($user->_id);

                    //success response
                    return $this->userRepository->transactionResponse(1, [
                        'show_message' => true,
                        'boosterExpiry' => Carbon::now()->diffInSeconds($activeBoost->expiry_at, false),
                        'creditsRemaining' => totalUserCredits()
                    ], 'T??ng c??????ng ???????c k??ch ho???t th??nh c??ng');
                }
            }

            //error response
            return $this->userRepository->transactionResponse(2, ['show_message' => true], __tr('Failed to boost profile.'));

        });
        return $this->engineReaction($transactionResponse);
    }

    /**
     *	Check profile status
     *
     *-----------------------------------------------------------------------*/
    public function checkProfileStatus()
    {
        //get profile
        $userProfile = $this->userSettingRepository->fetchUserProfile(getUserID());

        if (__isEmpty($userProfile)) {
            $userProfile = $this->userRepository->storeUserProfile([
                'users__id' => getUserID(),
                'status'	=> 1,
            ]);
        }

        $steps = configItem('profile_update_wizard');

        if ($userProfile->status == 2) {
            $profileStatus = [
                'step_one' 		=> true,
                'step_two' 		=> true
            ];
        } else {

            //check if co-ordinates are set
            if ((__isEmpty($userProfile['location_longitude'])
                    or $userProfile['location_longitude'] == 0)
                and (__isEmpty($userProfile['location_latitude'])
                    or $userProfile['location_latitude'] == 0)) {
                $profileStatus['step_two'] = false;
            } else {
                $profileStatus['step_two'] = true;
            }

            //for step one
            $profileStatus['step_one'] = $this->isStepCompleted($userProfile->toArray(), $steps['step_one']);
        }

        //preview options
        $profileInfo = [
            'profile_picture_url' => null,
            'cover_picture_url' => null,
            'gender' => $userProfile['gender'],
            'birthday' => $userProfile['dob'],
            'location_longitude' => $userProfile['location_longitude'] ?: 0,
            'location_latitude'  => $userProfile['location_latitude'] ?: 0
        ];

        $userUID = authUID();

        //profile pic
        if (isset($userProfile['profile_picture']) and !__isEmpty($userProfile['profile_picture'])) {
            //path
            $profilePictureFolderPath = getPathByKey('profile_photo', ['{_uid}' => $userUID]);
            // url
            $profileInfo['profile_picture_url'] = getMediaUrl($profilePictureFolderPath, $userProfile['profile_picture']);
        }

        //cover photo
        if (isset($userProfile['cover_picture']) and !__isEmpty($userProfile['cover_picture'])) {
            //path
            $coverPictureFolderPath = getPathByKey('cover_photo', ['{_uid}' => $userUID]);
            // url
            $profileInfo['cover_picture_url'] = getMediaUrl($coverPictureFolderPath, $userProfile['cover_picture']);
        }

        return $this->engineReaction(1, [
            'profileStatus' => $profileStatus,
            'profileInfo' 	=> $profileInfo,
            'genders' 		=> configItem('user_settings.gender')
        ]);
    }

    /**
     *	Check profile status
     *
     *-----------------------------------------------------------------------*/
    public function finishWizard()
    {
        //get profile
        $userProfile = $this->userSettingRepository->fetchUserProfile(getUserID());

        if ($this->userRepository->updateProfile($userProfile, [ 'status' => 2 ]) || $userProfile->status == 2) {
            return $this->engineReaction(1, [
                'redirectURL' => route('user.profile_view', ['username' => getUserAuthInfo('profile.username') ])
            ], __tr("Wizard completed successfully"));
        }

        return $this->engineReaction(2, ['show_message' => true], __tr("Failed to complete profile"));
    }

    /**
     *	check if step completed
     *
     *-----------------------------------------------------------------------*/
    private function isStepCompleted($profile, $stepFields)
    {
        if (!__isEmpty($profile)) {
            foreach ($profile as $key => $value) {
                if (in_array($key, $stepFields)) {
                    if (__isEmpty($profile[$key])) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    /**
     * Process user contact request.
     *
     * @param array $inputData
     *
     * @return array
     *---------------------------------------------------------------- */
    public function processContact($inputData)
    {
        //contact email data
        $emailData = [
            'userName'	    => $inputData['fullName'],
            'senderEmail' 	=> $inputData['email'],
            'toEmail' 		=> getStoreSettings('contact_email'),
            'subject'   	=> $inputData['subject'],
            'messageText'   => $inputData['message']
        ];

        // check if email send to member
        if ($this->baseMailer->notifyAdmin($inputData['subject'], 'contact', $emailData, 2)) {
            //success response
            return $this->engineReaction(1, ['show_message' => true], 'Th?? ???? ???????c g???i th??nh c??ng, ch??ng t??i s??? li??n h??? s???m cho b???n');
        }
        //error response
        return $this->engineReaction(2, ['show_message' => true], 'Kh??ng g???i ???????c th??');
    }

    /**
     * Process user contact request.
     *
     * @param array $inputData
     *
     * @return array
     *---------------------------------------------------------------- */
    public function getBoosterInfo()
    {
        return $this->engineReaction(1, [
            'booster_period' 	=> getStoreSettings('booster_period'),
            'booster_price'		=> (isPremiumUser()) ? getStoreSettings('booster_price_for_premium_user') : getStoreSettings('booster_price')
        ]);
    }

    /**
     * Process delete account.
     *
     * @param array $inputData
     *
     * @return array
     *---------------------------------------------------------------- */
    public function processDeleteAccount($inputData)
    {
        $user = $this->userRepository->fetchByID(getUserID());

        // Check if user exists
        if (__isEmpty($user)) {
            return $this->engineReaction(18, ['show_message' => true], 'Ng?????i d??ng kh??ng t???n t???i');
        }

        if (!Hash::check($inputData['password'], $user->password)) {
            return $this->engineReaction(3, ['show_message' => true], 'M???t kh???u hi???n t???i kh??ng ????ng');
        }

        // Delete all media of user
        $deletedMedia = $this->mediaEngine->deleteUserAccount();

        // Delete account successfully
        if ($this->userRepository->deleteUser($user)) {
            // Process Logout user
            $this->processLogout();
            return $this->engineReaction(1, ['show_message' => true], 'T??i kho???n c???a b???n ???? ???????c x??a th??nh c??ng');
        }

        return $this->engineReaction(2, ['show_message' => true], 'T??i kho???n kh??ng b??? x??a');
    }

    /**
     * Process delete account.
     *
     * @param array $inputData
     *
     * @return array
     *---------------------------------------------------------------- */
    public function resendActivationMail($inputData)
    {
        $user = $this->userRepository->fetchByEmail($inputData['email']);

        // Check if user exists
        if (__isEmpty($user)) {
            return $this->engineReaction(18, ['show_message' => true], 'B???n kh??ng ph???i l?? th??nh vi??n c???a h??? th???ng n??y');
        }

        // Check if user exists
        if ($user->status == 1) {
            return $this->engineReaction(18, ['show_message' => true], 'T??i kho???n ???? ???????c k??ch ho???t');
        }

        $transactionResponse = $this->userRepository->processTransaction(function() use ($inputData, $user) {

            // Delete account successfully
            if ($updatedUser = $this->userRepository->updateUser($user, [
                'remember_token' => Utils::generateStrongPassword(4, false, 'ud')
            ])) {

                $emailData = [
                    'fullName' => $user->first_name,
                    'email' => $user->email,
                    'expirationTime' => configItem('otp_expiry'),
                    'otp' => $updatedUser->remember_token
                ];

                // check if email send to member
                if ($this->baseMailer->notifyToUser('???? g???i th?? k??ch ho???t.', 'account.activation-for-app', $emailData, $user->email)) {
                    return $this->userRepository->transactionResponse(1, [
                        'show_message' => true,
                        'activation_mail_sent' => true
                    ], '???? g???i mail k??ch ho???t th??nh c??ng, ????? k??ch ho???t t??i kho???n vui l??ng ki???m tra email c???a b???n.');
                }

                return $this->userRepository->transactionResponse(2, ['show_message' => true], 'Kh??ng g???i ???????c th?? k??ch ho???t');
            }
        });

        return $this->engineReaction($transactionResponse);
    }

    /**
     * Process verify otp
     *
     * @param array $inputData
     *
     * @return array
     *---------------------------------------------------------------- */
    public function verifyOtpProcess($inputData, $type)
    {
        // exit;
        $user = $this->userRepository->fetchByEmail($inputData['email']);

        // Check if user exists
        if (__isEmpty($user)) {
            return $this->engineReaction(18, ['show_message' => true], 'B???n kh??ng ph???i l?? th??nh vi??n c???a h??? th???ng n??y');
        }

        $transactionResponse = $this->userRepository->processTransaction(function() use ($inputData, $user, $type) {

            if ($type == 1) {

                $neverActivatedUser = $this->userRepository->fetchNeverActivatedUserForApp($inputData['email']);

                // Check if never activated user exist or not
                if (__isEmpty($neverActivatedUser)) {
                    return $this->userRepository->processTransaction(18, null, 'OTP kh??ng h???p l???');
                }


                if ($user->remember_token == $inputData['otp']) {

                    $updatedUser = $this->userRepository->updateUser($user, [ 'remember_token' => null, 'status' => 1]);

                    return $this->userRepository->transactionResponse(1, [
                        'show_message' => true
                    ], __tr('Otp verified successfully.'));
                }

            } else if ($type == 2) {

                if ($user->remember_token == $inputData['otp']) {

                    $updatedUser = $this->userRepository->updateUser($user, [ 'remember_token' => null, 'status' => 1]);

                    return $this->userRepository->transactionResponse(1, [
                        'show_message' => true,
                        'account_verified' => true
                    ], 'Otp ???? x??c minh th??nh c??ng.');
                }

            }

            return $this->userRepository->transactionResponse(2, ['show_message' => true], 'OTP kh??ng h???p l???');
        });

        return $this->engineReaction($transactionResponse);
    }

    /**
     * Process delete account.
     *
     * @param array $inputData
     *
     * @return array
     *---------------------------------------------------------------- */
    public function requestNewPassword($inputData)
    {
        $user = $this->userRepository->fetchByEmail($inputData['email']);

        // Check if user exists
        if (__isEmpty($user)) {
            return $this->engineReaction(18, ['show_message' => true], 'B???n kh??ng ph???i l?? th??nh vi??n c???a h??? th???ng n??y');
        }

        // Check if user exists
        if ($user->status != 1) {
            return $this->engineReaction(18, [
                'show_message' => true
            ], 'T??i kho???n c???a b???n c?? th??? kh??ng ho???t ?????ng, b??? ch???n ho???c kh??ng ???????c k??ch ho???t.');
        }

        $transactionResponse = $this->userRepository->processTransaction(function() use ($inputData, $user) {

            // Delete account successfully
            if ($updatedUser = $this->userRepository->updateUser($user, [
                'remember_token' => Utils::generateStrongPassword(4, false, 'ud')
            ])) {

                $emailData = [
                    'fullName' => $user->first_name,
                    'email' => $user->email,
                    'expirationTime' => configItem('otp_expiry'),
                    'otp' => $updatedUser->remember_token
                ];

                // check if email send to member
                if ($this->baseMailer->notifyToUser('OTP sent.', 'account.forgot-password-for-app', $emailData, $user->email)) {
                    return $this->userRepository->transactionResponse(1, [
                        'show_message' => true,
                        'mail_sent' => true
                    ], '???? g???i OTP th??nh c??ng, ????? ?????t l???i m???t kh???u, h??y s??? d???ng OTP ???????c g???i ?????n email c???a b???n.');
                }

                return $this->userRepository->transactionResponse(2, ['show_message' => true], 'Kh??ng g???i ???????c OTP');
            }
        });

        return $this->engineReaction($transactionResponse);
    }

    /**
     * Process reset password request.
     *
     * @param array  $input
     * @param string $reminderToken
     *
     * @return array
     *---------------------------------------------------------------- */
    public function resetPasswordForApp($input)
    {
        $email = $input['email'];

        //fetch active user by email
        $user = $this->userRepository->fetchActiveUserByEmail($email);

        // Check if user record exist
        if (__isEmpty($user)) {
            return  $this->engineReaction(18, ['show_message' => true], 'Y??u c???u kh??ng h???p l???');
        }

        // Check if user password updated
        if ($this->userRepository->resetPassword($user, $input['password'])) {
            return  $this->engineReaction(1, [
                'show_message' => true,
                'password_changed' => true
            ], __tr('Password reset successfully.'));
        }

        //failed response
        return  $this->engineReaction(2, ['show_message' => true], 'M???t kh???u ch??a ???????c c???p nh???t.');
    }

    /**
     * prepare profile details
     * @return array
     *---------------------------------------------------------------- */
    public function prepareProfileDetails()
    {
        $user = $this->userRepository->fetchByID(getUserID());

        // Check if user exists
        if (__isEmpty($user)) {
            return $this->engineReaction(18, ['show_message' => true], 'Ng?????i d??ng kh??ng t???n t???i.');
        }

        $userId = $user->_id;
        $userUid = $user->_uid;
        $isOwnProfile = ($userId == getUserID()) ? true : false;
        // Prepare user data
        $userData = [
            'userId' => $userId,
            'userUId' => $userUid,
            'fullName' => $user->first_name.' '.$user->last_name,
            'first_name' => $user->first_name,
            'last_name' => $user->last_name,
            'mobile_number' => $user->mobile_number,
            'userName'	=> $user->username
        ];

        $userProfileData = $userSpecifications = $userSpecificationData = $photosData = [];

        // fetch User details
        $userProfile = $this->userSettingRepository->fetchUserProfile($userId);
        $userSettingConfig = configItem('user_settings');
        $profilePictureFolderPath = getPathByKey('profile_photo', ['{_uid}' => $userUid]);
        $profilePictureUrl = noThumbImageURL();
        $coverPictureFolderPath = getPathByKey('cover_photo', ['{_uid}' => $userUid]);
        $coverPictureUrl = noThumbCoverImageURL();

        // Check if user profile exists
        if (!__isEmpty($userProfile)) {
            if (!__isEmpty($userProfile->profile_picture)) {
                $profilePictureUrl = getMediaUrl($profilePictureFolderPath, $userProfile->profile_picture);
            }
            if (!__isEmpty($userProfile->cover_picture)) {
                $coverPictureUrl = getMediaUrl($coverPictureFolderPath, $userProfile->cover_picture);
            }
        }

        // Set cover and profile picture url
        $userData['profilePicture'] = $profilePictureUrl;
        $userData['coverPicture'] = $coverPictureUrl;
        $userData['userAge'] = isset($userProfile->dob) ? Carbon::parse($userProfile->dob)->age : null;

        // check if user profile exists
        if (!__isEmpty($userProfile)) {
            // Get country name
            $countryName = '';
            if (!__isEmpty($userProfile->countries__id)) {
                $country = $this->countryRepository->fetchById($userProfile->countries__id, ['name']);
                $countryName = $country->name;
            }
            $userProfileData = [
                'aboutMe'               => $userProfile->about_me,
                'city'                  => $userProfile->city,
                'mobile_number'         => $user->mobile_number,
                'gender'                => $userProfile->gender,
                'gender_text'           => array_get($userSettingConfig, 'gender.'.$userProfile->gender),
                'country'               => $userProfile->countries__id,
                'country_name'          => $countryName,
                'dob'                   => $userProfile->dob,
                'birthday'              => (!\__isEmpty($userProfile->dob))
                    ? formatDate($userProfile->dob)
                    : '',
                'work_status'           => $userProfile->work_status,
                'formatted_work_status' => array_get($userSettingConfig, 'work_status.'.$userProfile->work_status),
                'education'                 => $userProfile->education,
                'formatted_education'       => array_get($userSettingConfig, 'educations.'.$userProfile->education),
                'preferred_language'    => $userProfile->preferred_language,
                'formatted_preferred_language' => array_get($userSettingConfig, 'preferred_language.'.$userProfile->preferred_language),
                'relationship_status'   => $userProfile->relationship_status,
                'formatted_relationship_status' => array_get($userSettingConfig, 'relationship_status.'.$userProfile->relationship_status),
                'latitude'              => $userProfile->location_latitude?: 0,
                'longitude'             => $userProfile->location_longitude?: 0,
                'isVerified'            => $userProfile->is_verified,
            ];
        }

        // Get user photos collection
        $userPhotosCollection = $this->userSettingRepository->fetchUserPhotos($userId);
        $userPhotosFolderPath = getPathByKey('user_photos', ['{_uid}' => authUID()]);
        // check if user photos exists
        if (!__isEmpty($userPhotosCollection)) {
            foreach($userPhotosCollection as $userPhoto) {
                $photosData[] = [
                    'image_url' => getMediaUrl($userPhotosFolderPath, $userPhoto->file)
                ];
            }
        }

        //fetch total visitors data
        $visitorData = $this->userRepository->fetchProfileVisitor($userId);

        //fetch user gift record
        $userGiftCollection = $this->userRepository->fetchUserGift($userId);

        $userGiftData = [];
        //check if not empty
        if (!__isEmpty($userGiftCollection)) {
            foreach ($userGiftCollection as $key => $userGift) {
                $userGiftImgUrl = '';
                $userGiftFolderPath = getPathByKey('gift_image', ['{_uid}' => $userGift->itemUId]);
                $userGiftImgUrl = getMediaUrl($userGiftFolderPath, $userGift->file_name);
                //check gift status is private (1) and check gift send to current user or gift send by current user
                if ($userGift->status == 1 and ($userGift->to_users__id == getUserID() || $userGift->from_users__id == getUserID())) {

                    if (__isEmpty($userGift->file_name)) {
                        $userGiftImgUrl = noThumbImageURL();
                    }

                    $userGiftData[] = [
                        '_id' 				=> $userGift->_id,
                        '_uid' 				=> $userGift->_uid,
                        'itemId' 			=> $userGift->itemId,
                        'status' 			=> $userGift->status,
                        'fromUserName'		=> $userGift->fromUserName,
                        'senderUserName'	=> $userGift->senderUserName,
                        'userGiftImgUrl' 	=> $userGiftImgUrl
                    ];
                    //check gift status is public (0)
                } else if ($userGift->status != 1) {

                    if (__isEmpty($userGift->file_name)) {
                        $userGiftImgUrl = noThumbImageURL();
                    }

                    $userGiftData[] = [
                        '_id' 				=> $userGift->_id,
                        '_uid' 				=> $userGift->_uid,
                        'itemId' 			=> $userGift->itemId,
                        'status' 			=> $userGift->status,
                        'fromUserName'		=> $userGift->fromUserName,
                        'senderUserName'	=> $userGift->senderUserName,
                        'userGiftImgUrl' 	=> $userGiftImgUrl
                    ];
                }
            }
        }

        $specificationCollection = $this->userSettingRepository->fetchUserSpecificationById($userId);
        // Check if user specifications exists
        if (!\__isEmpty($specificationCollection)) {
            $userSpecifications = $specificationCollection->pluck('specification_value', 'specification_key')->toArray();
        }
        $specificationConfig = $this->getUserSpecificationConfig();
        foreach ($specificationConfig['groups'] as $specKey => $specification) {
            $items = [];
            foreach($specification['items'] as $itemKey => $item) {
                $itemValue = '';
                $userSpecValue =  isset($userSpecifications[$itemKey])
                    ? $userSpecifications[$itemKey]
                    : '';
                if (!__isEmpty($userSpecValue)) {
                    $itemValue = isset($item['options'])
                        ? isset($item['options'][$userSpecValue])
                            ? $item['options'][$userSpecValue] : ''
                        : $userSpecValue;
                }
                $items[] = [
                    'label'  => $item['name'],
                    'value' => $itemValue,
                ];
            }

            // Check if Item exists
            if (!__isEmpty($items)) {
                $userSpecificationData[$specKey] = [
                    'title' => $specification['title'],
                    'items' => $items
                ];
            }
        }

        return $this->engineReaction(1, [
            'userData'              => $userData,
            'userProfileData'       => $userProfileData,
            'photosData'            => $photosData,
            'totalUserLike'			=> fetchTotalUserLikedCount($userId),
            'totalVisitors'			=> $visitorData->count(),
            'userGiftData'			=> $userGiftData,
            'isPremiumUser'			=> isPremiumUser($userId),
            'specifications'		=> (array)$userSpecificationData
        ]);
    }

    /**
     * Process reset password request.
     *
     * @param array  $input
     * @param string $reminderToken
     *
     * @return array
     *---------------------------------------------------------------- */
    public function changeEmailProcess($input)
    {
        $email = $input['current_email'];

        //fetch active user by email
        $user = $this->userRepository->fetchActiveUserByEmail($email);

        // Check if user record exist
        if (__isEmpty($user)) {
            return  $this->engineReaction(18, ['show_message' => true], 'Y??u c???u kh??ng h???p l???.');
        }

        // Check if user entered correct password or not
        if (!Hash::check($input['current_password'], $user->password)) {
            return $this->engineReaction(3, [], 'Qu?? tr??nh x??c th???c ???? th???t b???i. Vui l??ng ki???m tra m???t kh???u c???a b???n.');
        }

        // Check if user password updated
        if ($this->userRepository->updateUser($user, ['email' => $input['new_email']])) {
            return  $this->engineReaction(1, [
                'show_message' => true,
            ], __tr('Email updated successfully.'));
        }

        //failed response
        return  $this->engineReaction(2, ['show_message' => true], 'Email kh??ng ???????c c???p nh???t.');
    }

    /**
     * prepare profile details
     * @return array
     *---------------------------------------------------------------- */
    public function prepareProfileUpdate()
    {
        $user = $this->userRepository->fetchByID(getUserID());

        // Check if user exists
        if (__isEmpty($user)) {
            return $this->engineReaction(18, ['show_message' => true], 'Ng?????i d??ng kh??ng t???n t???i.');
        }

        $userId = $user->_id;
        $userUid = $user->_uid;

        $basicInformation = $userSpecifications = $userSpecificationData = $locationInformation = [];

        // fetch User details
        $userProfile = $this->userSettingRepository->fetchUserProfile($userId);

        $profilePictureUrl = noThumbImageURL();
        $coverPictureUrl = noThumbCoverImageURL();
        $userSettingConfig = configItem('user_settings');
        $profilePictureFolderPath = getPathByKey('profile_photo', ['{_uid}' => $userUid]);
        $coverPictureFolderPath = getPathByKey('cover_photo', ['{_uid}' => $userUid]);

        // Check if user profile exists
        if (!__isEmpty($userProfile)) {
            if (!__isEmpty($userProfile->profile_picture)) {
                $profilePictureUrl = getMediaUrl($profilePictureFolderPath, $userProfile->profile_picture);
            }
            if (!__isEmpty($userProfile->cover_picture)) {
                $coverPictureUrl = getMediaUrl($coverPictureFolderPath, $userProfile->cover_picture);
            }
        }

        // Prepare user data
        $basicInformation = [
            'first_name' 			=> $user->first_name,
            'last_name' 			=> $user->last_name,
            'mobile_number'	 		=> $user->mobile_number,
            'work_status'           => (string)$userProfile->work_status,
            'gender'           		=> (string)$userProfile->gender,
            'relationship_status'   => (string)$userProfile->relationship_status,
            'preferred_language'    => (string)$userProfile->preferred_language,
            'education'				=> (string)$userProfile->education,
            'birthday'              => formatDate($userProfile->dob, "DD-MM-YYYY") ?: null,
            'about_me'              => $userProfile->about_me,
            'country'               => $userProfile->countries__id,
            'profile_picture'		=> $profilePictureUrl,
            'cover_picture'			=> $coverPictureUrl
        ];

        // Prepare user data
        $locationInformation = [
            'country'               => $userProfile->countries__id,
            'location_latitude'		=> $userProfile->location_latitude,
            'location_longitude'	=> $userProfile->location_longitude
        ];

        $specificationCollection = $this->userSettingRepository->fetchUserSpecificationById($userId);

        // Check if user specifications exists
        if (!__isEmpty($specificationCollection)) {
            $userSpecifications = $specificationCollection->pluck('specification_value', 'specification_key')->toArray();
        }

        $specificationConfig = $this->getUserSpecificationConfig();

        foreach ($specificationConfig['groups'] as $specKey => $specification) {

            $items = [];

            foreach($specification['items'] as $itemKey => $item) {
                $itemValue = '';
                $userSpecValue =  isset($userSpecifications[$itemKey])
                    ? $userSpecifications[$itemKey]
                    : '';
                if (!__isEmpty($userSpecValue)) {
                    $itemValue = isset($item['options'])
                        ? isset($item['options'][$userSpecValue])
                            ? $item['options'][$userSpecValue] : ''
                        : $userSpecValue;
                }

                $items[] = [
                    'name'  => $itemKey,
                    'label'  => $item['name'],
                    'value' => $itemValue,
                    'options' => isset($item['options']) ? $item['options'] : '',
                    'selected_options' => $userSpecValue
                ];
            }

            // Check if Item exists
            if (!__isEmpty($items)) {
                $userSpecificationData[$specKey] = [
                    'title' => $specification['title'],
                    'items' => $items
                ];
            }
        }

        $allGenders = configItem('user_settings.gender');

        $genders = [];

        foreach ($allGenders as $key => $value) {
            $genders[] = [
                'id' 	=> $key,
                'value' => $value
            ];
        }

        return $this->engineReaction(1, [
            'basicInformation' 		=> $basicInformation,
            'locationInformation'	=> $locationInformation,
            'specifications'		=> (array)$userSpecificationData,
            'countries'             => $this->countryRepository->fetchAll()->toArray(),
            'user_settings'			=> configItem('user_settings')
        ]);
    }
}
