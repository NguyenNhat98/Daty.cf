<?php
/*
* HomeController.php - Controller file
*
* This file is part of the Home component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpUser\Home\Controllers;

use App\Daty\Base\BaseController;
use App\Daty\Components\WpUser\Home\HomeEngine;
use App\Daty\Components\WpUser\User\UserEncounterEngine;
use App\Daty\Components\WpUser\Filter\FilterEngine;
use App\Daty\Support\CommonUnsecuredPostRequest;



class HomeController extends BaseController
{
    /**
     * @var  HomeEngine $homeEngine - Home Engine
     */
    protected $homeEngine;

    /**
     * @var  UserEncounterEngine $userEncounterEngine - UserEncounter Engine
     */
    protected $userEncounterEngine;

    /**
     * @var  FilterEngine $filterEngine - Filter Engine
     */
    protected $filterEngine;



    /**
      * Constructor
      *
      * @param  HomeEngine $homeEngine - Home Engine

      *
      * @return  void
      *-----------------------------------------------------------------------*/

    function __construct(
        HomeEngine $homeEngine,
        UserEncounterEngine $userEncounterEngine,
        FilterEngine $filterEngine

    )
    {
        $this->homeEngine           = $homeEngine;
        $this->userEncounterEngine 	= $userEncounterEngine;
        $this->filterEngine         = $filterEngine;

    }

    /**
     * View Home Page
     *---------------------------------------------------------------- */
    public function homePage()
    {
        // get encounter data
        $encounterData = $this->userEncounterEngine->getEncounterUserData();
        // For Random search use following function
        $basicSearchData = $this->filterEngine->prepareRandomUserData([], 12);
        // merge encounter data and basic data
        $processReaction = array_merge($encounterData['data'], $basicSearchData['data']);

        return $this->loadPublicView('WpUser.home', $processReaction);
    }

    /**
     * ChangeLocale - It also managed from index.php.
     *---------------------------------------------------------------- */
    protected function changeLocale(CommonUnsecuredPostRequest $request, $localeId = null)
    {
        if (is_string($localeId)) {
            changeAppLocale($localeId);
        }
        if ($request->has('redirectTo')) {
            header('Location: '.base64_decode($request->get('redirectTo')));
            exit();
        }

        return 'Yêu cầu không hợp lệ';
    }



    /**
     * preview landing page
     *---------------------------------------------------------------- */
    public function landingPage()
    {
        return $this->loadView('WpUser.outer-home');
    }

    /**
     * Search Matches
     *---------------------------------------------------------------- */
    public function searchMatches(CommonUnsecuredPostRequest $request)
    {
        $inputData = $request->all();
        // Set user search data into session
        session()->put('userSearchData', [
            "looking_for"   => $inputData['looking_for'],
            "min_age"       => $inputData['min_age'],
            "max_age"       => $inputData['max_age']
        ]);

        return redirect()->route('WpUser.user.sign_up');
    }
}
