<?php
/*
* DashboardEngine.php - Main component file
*
* This file is part of the Dashboard component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpAdmin\Dashboard;

use App\Daty\Base\BaseEngine;
use App\Daty\Components\WpAdmin\Dashboard\Repositories\DashboardRepository;
use Carbon\Carbon;

class DashboardEngine extends BaseEngine
{
	/**
     * @var  DashboardRepository $dashboardRepository - Dashboard Repository
     */
    protected $dashboardRepository;

    /**
      * Constructor
      *
      * @param  DashboardRepository $dashboardRepository - Dashboard Repository
      * @return  void
      *-----------------------------------------------------------------------*/

    function __construct(DashboardRepository $dashboardRepository)
    {
        $this->dashboardRepository 	= $dashboardRepository;
    }

    /**
      * Prepare Dashboard
      *
      * @return  void
      *-----------------------------------------------------------------------*/
    public function prepareDashboard()
    {
    	//all users
    	$users = $this->dashboardRepository->fetchUsers();
    	//online users
    	$onlineUsers = $this->dashboardRepository->fetchOnlineUsers();
        $OfflineUsers = $this->dashboardRepository->fetchOfflineUsers();
    	//abuse reports awaiting moderation
    	$abuseReportCount = $this->dashboardRepository->abuseReports(1)->count();
    	// all transactions
    	$transactions = $this->dashboardRepository->currentYearfinancialTransactions(2)->toArray();
    	//monthly transactions
    	$monthlyTransactions = collect($transactions)->groupBy('month');
    	// all users registered in current year
    	$currentYearRegistrations = $this->dashboardRepository->currentYearRegistrations()->toArray();
    	//month wise collection
    	$monthWiseUsers = collect($currentYearRegistrations)->groupBy(['gender', 'month']);

    	$datasets = [
    		1 => [
				/*'label' => "Male",*/
                'label' => "NAM",
				'backgroundColor' => "blue",
				'data' => array_fill(0, 12, 0)
    		],
    		2 => [
				/*'label' => "Female",*/
                'label' => "N???",
				'backgroundColor' => "pink",
				'borderColor' => "pink",
				'borderWidth' => 1,
				'data' => array_fill(0, 12, 0)
    		],
    		3  => [
/*				'label' => "Secret",*/
                'label' => "GAY",

                'backgroundColor' => "grey",
				'borderColor' => "grey",
				'borderWidth' => 1,
				'data' => array_fill(0, 12, 0)
    		],
    	];

    	//counts
    	$dashboardCounts = [
    		'online' => $onlineUsers->count(),
    		'active' => 0,
    		'inactive' =>$OfflineUsers -> count(),
    		'blocked' => 0,
    		'awaiting_abuse_report_count' => $abuseReportCount,
    		'current_month_income' => 0,
    		'monthwise_income' => array_fill(0, 12, 0),
    		'currency' => getCurrencySymbol(),
    		'current_year_registrations' => $datasets
    	];

    	if (!__isEmpty($monthWiseUsers)) {
    		foreach ($monthWiseUsers as $key => $monthwiseUser) {
    			foreach ($monthwiseUser as $key2 => $mtusers) {
    				$dashboardCounts['current_year_registrations'][$key]['data'][$key2 - 1] = $mtusers->count();
    			}
    		}
    	}

    	$currentMonth = (int)date('m');

    	if (!__isEmpty($monthlyTransactions)) {
    		foreach ($monthlyTransactions as $key => $trans) {
    			if (!__isEmpty($trans)) {

    				$amount = array_sum($trans->pluck('amount')->toArray());
    				//monthwise income
    				$dashboardCounts['monthwise_income'][$key-1] = $amount;
    				//current month earning
    				if ($currentMonth == $key) {
    					$dashboardCounts['current_month_income'] = number_format((float) $amount, 2);
    				}
    			}
    		}
    	}

    	//check if users not empty
    	if (!__isEmpty($users)) {
	    	foreach ($users->groupBy('status') as $key => $status) {

	    		switch ($key) {
	    			case 1:
	    				$dashboardCounts['active'] 	= $status->count();
	    				break;
	    			case 2:
	    				$dashboardCounts['inactive'] = $status->count();
	    				break;
	    			case 3:
	    				$dashboardCounts['blocked'] 	= $status->count();
	    				break;
	    			default:
	    				break;
	    		}
	    	}
    	}

    	return [
    		'dashboardData' => $dashboardCounts
    	];
    }

}
