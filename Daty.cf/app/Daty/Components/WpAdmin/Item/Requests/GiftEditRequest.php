<?php
/*
* GiftEditRequest.php - Request file
*
* This file is part of the Item component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpAdmin\Item\Requests;

use App\Daty\Base\BaseRequest;

class GiftEditRequest extends BaseRequest
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
     * Get the validation rules that apply to the add author client post request.
     *
     * @return bool
     *-----------------------------------------------------------------------*/
    public function rules()
    {
		$rules = [
			'title' 		=> 'required|min:3|max:150',
			'normal_price' 	=> 'required|integer',
			'premium_price'	=> 'required|integer'
		];

        return $rules;
    }
}
