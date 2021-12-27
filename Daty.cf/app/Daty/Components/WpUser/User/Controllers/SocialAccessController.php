<?php

/*
* SocialAccessController.php - Controller file
*
* This file is part of the User component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpUser\User\Controllers;

use App\Daty\Base\BaseController;
use App\Daty\Components\WpUser\User\SocialAccessEngine;
use App\Daty\Components\WpUser\User\Requests\SocialAccessRequest;
use Socialite;

class SocialAccessController extends BaseController
{
	/**
     * @var SocialAccessEngine $socialAccessEngine - SocialAccess Engine
     */
	protected $socialAccessEngine;

	/**
      * Constructor
      *
      * @param SocialAccessEngine $socialAccessEngine - SocialAccess Engine
      *
      * @return void
      *-----------------------------------------------------------------------*/

    public function __construct(SocialAccessEngine $socialAccessEngine)
    {
        $this->socialAccessEngine = $socialAccessEngine;
	}

	/**
     * Redirect the user to the Facebook authentication page.
     *
     * @return Response
     *
     *---------------------------------------------------------------- */
    public function redirectToProvider($provider)
    {
        // match key & the provider name like google, facebook
        $providerName = getSocialProviderName($provider);

		//if provider name false throw error
        if ($providerName === false) {
            abort(404);
		}

        try {
            return Socialite::driver($providerName)->redirect();
        } catch (\Exception $e) {
            return redirect()->route('user.login')->with([
                                'errorStatus'   => true,
                                'message' => 'Đã xảy ra sự cố! Vui lòng liên hệ với quản trị viên.',
                            ]);
        }
	}

	 /**
     * Obtain the user information from Facebook.
     *
     * @return Response
     */
    public function handleProviderCallback($provider, SocialAccessRequest $request)
    {
		//get provider name
		$providerName = getSocialProviderName($provider);

		//if provider  name not exist then throw error
        if ($providerName === false) {
            abort(404);
		}

		$denyRequest = $request->input('error');
        $errorCode   = $request->input('error_code');

        // Check app not found and user cancel dialog
        if ((int) $errorCode === 4201) { // User cancel dialog
			//if error then go to login page
            return redirect()->route('user.login')->with([
                                'errorStatus'   => true,
                                'message' => 'Không tìm thấy ứng dụng, vui lòng liên hệ với quản trị viên',
                            ]);
		}

		// check the request is deny then redirect user on login page
        if (__ifIsset($denyRequest)
            and $denyRequest === 'access_denied') {
            return redirect()->route('user.login')->with([
                                    'errorStatus'   => true,
                                    'message' => __tr('Bạn đã từ chối quyền truy cập từ __provider__', [
                                            '__provider__' => $providerName
                                        ]),
                                ]);
        }

		//process social user authentication
		$processReaction = $this->socialAccessEngine->processSocialAccess($providerName);

		//check reaction code equal to 1
		if ($processReaction['reaction_code'] === 1) {
            return redirect()->route('user.profile_view', ['username' => getUserAuthInfo('profile.username')])->with([
				'success' => true,
				'message' =>'Chào mừng, bạn đã đăng nhập thành công',
			]);

		//else go to login page
		} else {
            return redirect()->route('user.login')->with([
				'errorStatus' => true,
				'message' => isset($processReaction['message'])
				? $processReaction['message']
				: 'Quá trình xác thực đã thất bại. Vui lòng kiểm tra email / mật khẩu của bạn và thử lại.',
			]);
        }
	}
}
