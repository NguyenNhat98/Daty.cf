<?php

/*
* PaypalTransactionRequest.php - Request file
*
* This file is part of the User component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpUser\User\Requests;

use App\Daty\Base\BaseRequest;

class PaypalTransactionRequest extends BaseRequest
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
        return [];
    }
}
