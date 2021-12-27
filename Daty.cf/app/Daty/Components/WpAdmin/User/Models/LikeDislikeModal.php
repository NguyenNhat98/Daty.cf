<?php

namespace App\Daty\Components\WpAdmin\User\Models;

use App\Daty\Base\BaseModel;

class LikeDislikeModal extends BaseModel
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
	protected $table = 'like_dislikes';


    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [];

}
