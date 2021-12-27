<?php
/*
* DashboardController.php - Controller file
*
* This file is part of the Dashboard component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpAdmin\Dashboard\Controllers;

use App\Daty\Base\BaseController;
use App\Daty\Components\WpAdmin\Dashboard\DashboardEngine;

class DashboardController extends BaseController
{
    /**
     * @var  DashboardEngine $dashboardEngine - Dashboard Engine
     */
    protected $dashboardEngine;

    /**
      * Constructor
      *
      * @param  DashboardEngine $dashboardEngine - Dashboard Engine
      *
      * @return  void
      *-----------------------------------------------------------------------*/

    function __construct(DashboardEngine $dashboardEngine)
    {
        $this->dashboardEngine = $dashboardEngine;
    }

	/**
     * Show dashboard view.
     *---------------------------------------------------------------- */
    public function loadDashboardView()
    {
    	$data = $this->dashboardEngine->prepareDashboard();

        return $this->loadManageView('WpAdmin.dashboard.dashboard', $data);
	}
}
