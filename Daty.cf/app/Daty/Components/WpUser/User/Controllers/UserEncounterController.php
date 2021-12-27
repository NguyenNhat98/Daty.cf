<?php
/*
* UserEncounterController.php - Controller file
*
* This file is part of the UserEncounter User component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpUser\User\Controllers;

use App\Daty\Base\BaseController;
use App\Daty\Components\WpUser\User\UserEncounterEngine;
// form Requests
use App\Daty\Support\CommonPostRequest;
use App\Daty\Components\WpUser\User\UserEngine;

class UserEncounterController extends BaseController
{
    /**
     * @var  UserEncounterEngine $userEncounterEngine - UserEncounter Engine
     */
	protected $userEncounterEngine;

	/**
     * @var UserEngine - User Engine
     */
    protected $userEngine;

    /**
      * Constructor
      *
      * @param  UserEncounterEngine $userEncounterEngine - UserEncounter Engine
      *
      * @return  void
      *-----------------------------------------------------------------------*/

    function __construct(
		UserEncounterEngine $userEncounterEngine,
		UserEngine $userEngine
	)
    {
		$this->userEncounterEngine 	= $userEncounterEngine;
		$this->userEngine 			= $userEngine;
	}

	/**
     * Handle user like dislike request.
     *
     * @param string $toUserUid, $like
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function userEncounterLikeDislike($toUserUid, $like)
    {
        $processReaction = $this->userEngine->processUserLikeDislike($toUserUid, $like);

        //check reaction code equal to 1
        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}

	/**
     * Handle skip encounter user request.
     *
     * @param string $toUserUid, $like
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function skipEncounterUser($toUserUid)
    {
        $processReaction = $this->userEncounterEngine->processSkipEncounterUser($toUserUid);

        //check reaction code equal to 1
        return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);
	}
}
