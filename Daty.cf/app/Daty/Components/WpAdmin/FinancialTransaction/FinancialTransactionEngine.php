<?php
/*
* FinancialTransactionEngine.php - Main component file
*
* This file is part of the FinancialTransaction component.
*-----------------------------------------------------------------------------*/

namespace App\Daty\Components\WpAdmin\FinancialTransaction;

use App\Daty\Base\BaseEngine;
use App\Daty\Components\WpAdmin\FinancialTransaction\Repositories\{FinancialTransactionRepository};

class FinancialTransactionEngine extends BaseEngine
{
	 /**
     * @var  FinancialTransactionRepository $financialTransactionRepository - FinancialTransaction Repository
     */
	protected $financialTransactionRepository;

    /**
      * Constructor
      *
	  * @param  FinancialTransactionRepository $financialTransactionRepository - FinancialTransaction Repository
      * @return  void
      *-----------------------------------------------------------------------*/

    function __construct(
		FinancialTransactionRepository $financialTransactionRepository
	)
    {
		$this->financialTransactionRepository 	= $financialTransactionRepository;
	}

	/**
     * get transaction list data.
     *
     *
     * @return object
     *---------------------------------------------------------------- */
    public function prepareTransactionList($transactionType)
    {
		// $testMode =
		if ($transactionType == 'test') {
			$testMode = 1;
		} else {
			$testMode = 2;
		}

		$transactionCollection = $this->financialTransactionRepository->fetchTransactionListData($testMode);

        $requireColumns = [
            '_id',
            '_uid',
			'amount',
			'formatAmount' => function($key) {
				return priceFormat($key['amount'], true, false);
			},
            'created_at' => function($key) {
                return formatDate($key['created_at']);
            },
            'status',
			'method',
			'currency_code',
			'is_test',
			'userFullName',
			'__data',
			'packageName' => function($key) {
				//check is not Empty
				if (!__isEmpty($key['__data']) and !__isEmpty($key['__data']['packageName'])) {
					return $key['__data']['packageName'];
				}
				return 'N/A';
			}
        ];

        return $this->dataTableResponse($transactionCollection, $requireColumns);
	}

	/**
     * Delete all test transaction
     *
     * @param int pageUId
     *
     * @return array
     *---------------------------------------------------------------- */
    public function processDeleteAllTestTransaction()
    {
        $transactions = $this->financialTransactionRepository->fetchAllTestTransactions();

		//if is empty then show error message
		if (__isEmpty($transactions)) {
			return $this->engineReaction(1, null, 'Giao d???ch kh??ng t???n t???i');
		}

		//all test transaction ids
		$transactionsIds = $transactions->pluck('_id')->toArray();

        //Check if gift deleted
        if ($this->financialTransactionRepository->deleteAllTransaction($transactionsIds)) {
            return $this->engineReaction(1, null, 'X??a t???t c??? c??c giao d???ch th??? nghi???m th??nh c??ng');
        }

        return $this->engineReaction(18, null, 'Giao d???ch kh??ng b??? x??a');
    }
}
