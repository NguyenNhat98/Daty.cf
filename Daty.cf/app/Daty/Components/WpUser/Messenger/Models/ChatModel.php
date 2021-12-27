<?php
/*
* Chat.php - Model file
*
* This file is part of the Messenger component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpUser\Messenger\Models;

use App\Daty\Base\BaseModel;

class ChatModel extends BaseModel
{
    /**
     * @var  string $table - The database table used by the model.
     */
    protected $table = "chats";

    /**
     * @var  array $casts - The attributes that should be casted to native types.
     */
    protected $casts = [
    ];

    /**
     * @var  array $fillable - The attributes that are mass assignable.
     */
    protected $fillable = [
    ];

}
