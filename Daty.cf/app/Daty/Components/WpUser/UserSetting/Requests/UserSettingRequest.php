<?php
/*
* UserSettingRequest.php - Request file
*
* This file is part of the UserSetting component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpUser\UserSetting\Requests;

use App\Daty\Base\BaseRequest;
use Illuminate\Http\Request;

class UserSettingRequest extends BaseRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     *-----------------------------------------------------------------------*/
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the user register request.
     *
     * @return bool
     *-----------------------------------------------------------------------*/
    public function rules()
    {
        return [];
    }
}
