<?php
/*
* FinancialTransactionController.php - Controller file
*
* This file is part of the FinancialTransaction User component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpAdmin\FinancialTransaction\Controllers;

use App\Daty\Base\BaseController;
use App\Daty\Components\WpAdmin\FinancialTransaction\FinancialTransactionEngine;

class FinancialTransactionController extends BaseController
{
    /**
     * @var  FinancialTransactionEngine $financialTransactionEngine - FinancialTransaction Engine
     */
    protected $financialTransactionEngine;

    /**
      * Constructor
      *
      * @param  FinancialTransactionEngine $financialTransactionEngine - FinancialTransaction Engine
      *
      * @return  void
      *-----------------------------------------------------------------------*/

    function __construct(FinancialTransactionEngine $financialTransactionEngine)
    {
        $this->financialTransactionEngine = $financialTransactionEngine;
	}

	/**
     * Manage Financial Transaction load view.
     *
     * @return json object
     *---------------------------------------------------------------- */
    public function financialTransactionViewList($transactionType)
    {
        return $this->loadManageView('WpAdmin.financial-transaction.manage.list');
	}

	/**
     * Get Transaction List data.
     *
     *-----------------------------------------------------------------------*/
    public function getTransactionList($transactionType)
    {
        return $this->financialTransactionEngine->prepareTransactionList($transactionType);
	}

	/**
      * Delete all test transaction
      *
      *
      * @return  void
      *-----------------------------------------------------------------------*/
    public function deleteAllTestTransaction()
    {
		$processReaction = $this->financialTransactionEngine->processDeleteAllTestTransaction();

		return $this->responseAction(
			$this->processResponse($processReaction, [], [], true)
		);

        return $this->getUserConversation($userId);
    }
}
