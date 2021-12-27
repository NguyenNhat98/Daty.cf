<?php

/*
* SendUserGiftRequest.php - Request file
*
* This file is part of the User component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpUser\User\Requests;

use App\Daty\Base\BaseRequest;

class SendUserGiftRequest extends BaseRequest
{
    /**
      * Authorization for request.
      *
      * @return bool
      *-----------------------------------------------------------------------*/

    public function authorize()
    {
        return true;
    }

    /**
      * Validation rules.
      *
      * @return bool
      *-----------------------------------------------------------------------*/

    public function rules()
    {
        return [
			'selected_gift'  => 'required'
		];
	}

	/**
      * Custom Message.
      *
      * @return bool
      *-----------------------------------------------------------------------*/

    public function messages()
    {
		return [
			'selected_gift.required' => 'The gift field is required.'
		];
    }
}
