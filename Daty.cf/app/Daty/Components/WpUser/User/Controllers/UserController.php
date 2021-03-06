<?php
/*
* UserController.php - Controller file
*
* This file is part of the User component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpUser\User\Controllers;

use App\Daty\Base\BaseController;
use Illuminate\Http\Request;
use App\Daty\Components\WpUser\User\Requests\{
    UserSignUpRequest,
    UserLoginRequest,
    UserUpdatePasswordRequest,
    UserForgotPasswordRequest,
    UserResetPasswordRequest,
	UserChangeEmailRequest,
	SendUserGiftRequest,
	ReportUserRequest,
	UserContactRequest
};
use App\Daty\Components\WpUser\User\UserEngine;
use App\Daty\Support\CommonUnsecuredPostRequest;
use Auth;

class UserController extends BaseController
{
    /**
     * @var UserEngine - User Engine
     */
    protected $userEngine;

    /**
     * Constructor.
     *
     * @param UserEngine $userEngine - User Engine
     *-----------------------------------------------------------------------*/
    public function __construct(UserEngine $userEngine)
    {
        $this->userEngine = $userEngine;
    }

    /**
     * Show login view.
     *---------------------------------------------------------------- */
    public function login()
    {
        return $this->loadView('WpUser.user.login');
    }

    /**
     * Authenticate user based on post form data.
     *
     * @param object UserLoginRequest $request
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function loginProcess(UserLoginRequest $request)
    {
        $processReaction = $this->userEngine->processLogin($request->all());

        //check reaction code equal to 1
        if ($processReaction['reaction_code'] === 1) {
            return $this->responseAction(
                    $this->processResponse($processReaction, [], [], true),
                    $this->redirectTo('user.profile_view', ['username' => getUserAuthInfo('profile.username')])
                );
        } else {
            return $this->responseAction(
                $this->processResponse($processReaction, [], [], true)
            );
        }
    }

    /**
     * Perform user logout action.
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function logout()
    {
        $processReaction = $this->userEngine->processLogout();

        return redirect()->route('user.login');
    }

    /**
     * Show Sign Up View.
     *
     *-----------------------------------------------------------------------*/
    public function signUp()
    {
        return $this->loadView('WpUser.user.sign-up', [
        	'genders' => configItem('user_settings.gender')
        ]);
    }

    /**
     * User Sign Process.
     *
     * @param object UserSignUpRequest $request
     *
     *-----------------------------------------------------------------------*/
    public function signUpProcess(UserSignUpRequest $request)
    {
        $processReaction = $this->userEngine->userSignUpProcess($request->all());
		//check reaction code is 1 then redirect to login page
		if ($processReaction['reaction_code'] === 1) {
			return $this->responseAction(
				$this->processResponse($processReaction, [], [], true),
				$this->redirectTo('user.login')
			);
		} else {
			return $this->responseAction(
				$this->processResponse($processReaction, [], [], true)
			);
		}
    }

    /**
     * Show Change Password View.
     *
     *-----------------------------------------------------------------------*/
    public function changePasswordView()
    {
		$user = Auth::user();
		$data = [];
		if ($user->password == 'NO_PASSWORD') {
			$data = [
				'userPassword' => $user->password
			];
		}
        return $this->loadPublicView('WpUser.user.change-password', $data);
    }

    /**
     * Handle change password request.
     *
     * @param object UserUpdatePasswordRequest $request
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function processChangePassword(UserUpdatePasswordRequest $request)
    {
        $processReaction = $this->userEngine
                                ->processUpdatePassword(
                                    $request->only(
                                        'new_password',
                                        'current_password'
                                    )
                                );

        return $this->responseAction(
            $this->processResponse($processReaction, [], [], true)
        );
    }

    /**
     * Show Change Email View.
     *
     *-----------------------------------------------------------------------*/
    public function changeEmailView()
    {
        $user = Auth::user();
        $data = [
            'userEmail' => $user->email
        ];
        return $this->loadPublicView('WpUser.user.change-email', $data);
    }

    /**
     * Handle change email request.
     *
     * @param object UserChangeEmailRequest $request
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function processChangeEmail(UserChangeEmailRequest $request)
    {
        $processReaction = $this->userEngine
                                ->processChangeEmail(
                                    $request->only(
                                        'new_email',
                                        'current_password'
                                    )
                                );

        return $this->responseAction(
            $this->processResponse($processReaction, [], [], true)
        );
    }

    /**
     * Show Forgot Password View.
     *
     *-----------------------------------------------------------------------*/
    public function forgotPasswordView()
    {
        return $this->loadView('WpUser.user.forgot-password');
    }

     /**
     * Handle user forgot password request.
     *
     * @param object UserForgotPasswordRequest $request
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function processForgotPassword(UserForgotPasswordRequest $request)
    {
        $processReaction = $this->userEngine
                                ->sendPasswordReminder(
                                    $request->input('email')
                                );

        //check reaction code equal to 1
        if ($processReaction['reaction_code'] === 1) {
            return $this->responseAction(
                $this->processResponse($processReaction, [], [], true),
                $this->replaceView('user.forgot-password-success', [], '.lw-success-message')
            );
        } else {
            return $this->responseAction(
                $this->processResponse($processReaction, [], [], true)
            );
        }
    }

    /**
     * User Sign Process.
     *
     *-----------------------------------------------------------------------*/
    public function accountActivation(Request $request, $userUid)
    {
        if (!$request->hasValidSignature()) {
            abort(401);
        }

        $processReaction = $this->userEngine->processAccountActivation($userUid);

        // Check if account activation process succeed
        if ($processReaction['reaction_code'] === 1) {
            return redirect()->route('user.login')
                        ->with([
                            'success' => 'true',
                            'message' => 'T???i kho???n c???a b???n ???? ???????c k??ch ho???t th??nh c??ng. ????ng nh???p b???ng email v?? m???t kh???u c???a b???n',
                        ]);
        }

        // if activation process failed then
        return redirect()->route('user.login')
                        ->with([
                            'error' => 'true',
                            'message' => 'Li??n k???t k??ch ho???t t??i kho???n kh??ng h???p l???',
                        ]);
	}

	/**
     * User Sign Process.
     *
     *-----------------------------------------------------------------------*/
    public function newEmailActivation(Request $request, $userUid, $newEmail)
    {
        if (!$request->hasValidSignature()) {
            abort(401);
        }

        $processReaction = $this->userEngine->processNewEmailActivation($userUid, $newEmail);

        // Check if account activation process succeed
        if ($processReaction['reaction_code'] === 1) {
           return redirect()->route('user.new_email.read.success')->with([
                'success' => true,
                'message' => 'Email m???i c???a b???n ???? ???????c k??ch ho???t th??nh c??ng',
             ]);
        }
        // if activation process failed then
        return redirect()->route('user.new_email.read.success')->with([
                'success' => false,
                'message' => 'Email kh??ng ???????c c???p nh???t',
             ]);
	}

	/**
     * User Sign Process.
     *
     *-----------------------------------------------------------------------*/
    public function updateEmailSuccessView()
    {
		return $this->loadPublicView('WpUser.user.change-email-success');
	}

    /**
     * Show Reset Password View.
     *
     *-----------------------------------------------------------------------*/
    public function restPasswordView()
    {
        return $this->loadManageView('WpUser.user.reset-password');
    }

     /**
     * Handle reset password request.
     *
     * @param object UserResetPasswordRequest $request
     * @param string                          $reminderToken
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function processRestPassword(UserResetPasswordRequest $request,
        $reminderToken)
    {
        $processReaction = $this->userEngine
                                ->processResetPassword(
                                    $request->all(),
                                    $reminderToken
                                );

        //check reaction code equal to 1
        if ($processReaction['reaction_code'] === 1) {
            return $this->responseAction(
                $this->processResponse($processReaction, [], [], true),
                $this->redirectTo('user.login')
            );
        } else {
            return $this->responseAction(
                $this->processResponse($processReaction, [], [], true)
            );
        }
    }

    /**
     * Get User profile view.
     *
     * @param string $userName
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function getUserProfile($userName)
    {
        $processReaction = $this->userEngine->prepareUserProfile($userName);

        // check if record does not exists
        if ($processReaction['reaction_code'] == 18) {
            return redirect()->route('user.profile_view', ['username' => getUserAuthInfo('profile.username')]);
        }
        $processReaction['data']['is_profile_page'] = true;
        return $this->loadPublicView('WpUser.user.profile', $processReaction['data']);
    }

    /**
     * Get User profile view.
     *
     * @param string $userName
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function getUserProfileData($userName)
    {
        $processReaction = $this->userEngine->prepareUserProfile($userName);

        return $this->processResponse($processReaction, [], [], true);
	}

	/**
     * Handle user like dislike request.
     *
     * @param object UserResetPasswordRequest $request
     * @param string                          $reminderToken
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function userLikeDislike($toUserUid, $like)
    {
        $processReaction = $this->userEngine->processUserLikeDislike($toUserUid, $like);

        //check reaction code equal to 1
        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}

	/**
     * Get User my like view.
     *
     * @param string $userName
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function getMyLikeView()
    {
    	//get page requested
    	$page = request()->input('page');
		//get liked people data by parameter like '1'
        $processReaction = $this->userEngine->prepareUserLikeDislikedData(1);

        //check if page is not null and not equal to first page
        if (!is_null($page) and ($page != 1)) {

        	$processReaction['data'] = view('WpUser.user.partial-templates.my-liked-users', $processReaction['data'])
        									->render();

        	return $processReaction;
    	}

    	//load default view
    	return $this->loadPublicView('WpUser.user.my-liked', $processReaction['data']);
	}

	/**
     * Get User my Disliked view.
     *
     * @param string $userName
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function getMyDislikedView()
    {
		//get page requested
    	$page = request()->input('page');
		//get liked people data by parameter like '1'
        $processReaction = $this->userEngine->prepareUserLikeDislikedData(0);

        //check if page is not null and not equal to first page
        if (!is_null($page) and ($page != 1)) {

        	$processReaction['data'] = view('WpUser.user.partial-templates.my-liked-users', $processReaction['data'])
        									->render();

        	return $processReaction;
    	}

    	//load default view
    	return $this->loadPublicView('WpUser.user.my-disliked', $processReaction['data']);
	}

	/**
     * Get User my Disliked view.
     *
     * @param string $userName
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function getWhoLikedMeView()
    {
        //get page requested
    	$page = request()->input('page');
		//get liked people data by parameter like '1'
        $processReaction = $this->userEngine->prepareUserLikeMeData();

        //check if page is not null and not equal to first page
        if (!is_null($page) and ($page != 1)) {

        	$processReaction['data'] = view('WpUser.user.partial-templates.my-liked-users', $processReaction['data'])
        									->render();

        	return $processReaction;
    	}

    	//load default view
    	return $this->loadPublicView('WpUser.user.who-liked-me', $processReaction['data']);
	}

	/**
     * Get mutual like view.
     *
     * @param string $userName
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function getMutualLikeView()
    {
    	//get page requested
    	$page = request()->input('page');
		//get mutual like data
       	$processReaction = $this->userEngine->prepareMutualLikeData();

        //check if page is not null and not equal to first page
        if (!is_null($page) and ($page != 1)) {

        	$processReaction['data'] = view('WpUser.user.partial-templates.my-liked-users', $processReaction['data'])
        									->render();

        	return $processReaction;
    	}

    	//load default view
    	return $this->loadPublicView('WpUser.user.mutual-like', $processReaction['data']);
	}

	/**
     * Get profile visitors view.
     *
     * @param string $userName
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function getProfileVisitorView()
    {
        //get page requested
    	$page = request()->input('page');
		//get liked people data by parameter like '1'
        $processReaction = $this->userEngine->prepareProfileVisitorsData();

        //check if page is not null and not equal to first page
        if (!is_null($page) and ($page != 1)) {

        	$processReaction['data'] = view('WpUser.user.partial-templates.my-liked-users', $processReaction['data'])
        									->render();

        	return $processReaction;
    	}

    	//load default view
    	return $this->loadPublicView('WpUser.user.profile-visitor', $processReaction['data']);
	}

	/**
     * Handle send user gift request.
     *
     * @param object SendUserGiftRequest $request
     * @param string $reminderToken
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function userSendGift(SendUserGiftRequest $request, $sendUserUId)
    {
        $processReaction = $this->userEngine->processUserSendGift($request->all(), $sendUserUId);

        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}

	/**
     * Handle report user request.
     *
     * @param object ReportUserRequest $request
     * @param string $reminderToken
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function reportUser(ReportUserRequest $request, $sendUserUId)
    {
        $processReaction = $this->userEngine->processReportUser($request->all(), $sendUserUId);

        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}

	/**
     * Handle report user request.
     *
     * @param object blockUser $request
     * @param string $reminderToken
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function blockUser(CommonUnsecuredPostRequest $request)
    {
        $processReaction = $this->userEngine->processBlockUser($request->all());

        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}

	/**
     * Get block user view and user list.
     *
     * @param string $userName
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function blockUserList()
    {
		//get page requested
    	$page = request()->input('page');
		//get profile visitors data
    	$processReaction = $this->userEngine->prepareBlockUserData();

        //check if page is not null and not equal to first page
        if (!is_null($page) and ($page != 1)) {

        	$processReaction['data'] = view('WpUser.user.partial-templates.blocked-users', $processReaction['data'])
        									->render();

        	return $processReaction;
    	}

        return $this->loadPublicView('WpUser.user.block-user.list', $processReaction['data']);
	}

	/**
     * Handle report user request.
     *
     * @param object blockUser $userUid
     * @param string $reminderToken
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function processUnblockUser($userUid)
    {
        $processReaction = $this->userEngine->processUnblockUser($userUid);

        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}

	/**
     * process Boost Profile.
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function processBoostProfile()
    {
        $processReaction = $this->userEngine->processBoostProfile();

        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}

	/**
     * process Boost Profile.
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function loadProfileUpdateWizard()
    {
        $processReaction = $this->userEngine->checkProfileStatus();

		return $this->loadView('WpUser.user.profile.update-wizard', $processReaction['data']);
	}

	/**
     * process Boost Profile.
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function checkProfileUpdateWizard()
    {
        $processReaction = $this->userEngine->checkProfileStatus();

        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}

	/**
     * process Boost Profile.
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function finishWizard()
    {
        $processReaction = $this->userEngine->finishWizard();

        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}

	/**
     * User Contact View.
     *
     *-----------------------------------------------------------------------*/
    public function getContactView()
    {
		$user = Auth::user();
		$contactData = [];
		//check is not empty
		if ($user) {
			$contactData = [
				'userFullName' => $user->first_name.' '.$user->last_name,
				'contactEmail' => $user->email
			];
		}
		return $this->loadView('WpUser.user.contact', $contactData);
	}

	/**
     * Handle process contact request.
     *
     * @param object UserContactRequest $request
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function contactProcess(UserContactRequest $request)
    {
		$processReaction = $this->userEngine->processContact($request->all());
		return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
    }

    /**
     * get booster price and period
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function getBoosterInfo()
    {
		$processReaction = $this->userEngine->getBoosterInfo();
		return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
    }

    /**
     * Handle process contact request.
     *
     * @param object CommonUnsecuredPostRequest $request
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function deleteAccount(CommonUnsecuredPostRequest $request)
    {
		$processReaction = $this->userEngine->processDeleteAccount($request->all());

        if ($processReaction['reaction_code'] == 1) {
            return $this->responseAction(
                $this->processResponse($processReaction, [], [], true),
                $this->redirectTo('user.login')
            );
        }

        return $this->processResponse($processReaction, [], [], true);
    }
}
