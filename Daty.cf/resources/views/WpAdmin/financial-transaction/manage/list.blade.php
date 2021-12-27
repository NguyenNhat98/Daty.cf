@section('page-title', 'Giao dịch tài chính')
@section('head-title', 'Giao dịch tài chính')
@section('keywordName', 'Giao dịch tài chính')
@section('keyword', 'Giao dịch tài chính')
@section('description', 'Giao dịch tài chính')
@section('keywordDescription', strip_tags('Giao dịch tài chính'))
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Giao dịch tài chính</h1>
</div>
<!-- Start of Page Wrapper -->
<?php $transactionType = request()->transactionType; ?>
 <div class="row">
	<div class="col-xl-12 mb-4">
		<div class="card mb-4">
			<div class="card-body">
				<ul class="nav nav-tabs mb-3">
                    <!-- Live Transaction -->
                    <li class="nav-item">
                        <a class="nav-link <?= $transactionType == 'live' ? 'active' : '' ?>" href="<?= route('manage.financial_transaction.read.view_list', ['transactionType' => 'live']) ?>">
                            Giao dịch trực tiếp
                        </a>
                    </li>
                    <!-- /Live Transaction -->

                    <!-- Test Transaction -->
                    <li class="nav-item">
                        <a class="nav-link <?= $transactionType == 'test' ? 'active' : '' ?>" href="<?= route('manage.financial_transaction.read.view_list', ['transactionType' => 'test']) ?>">
                            Giao dịch thử nghiệm
                        </a>
                    </li>
                    <!-- /Test Transaction -->
				</ul>
				<!-- delete all transaction button -->
				@if($transactionType == 'test')
				<a class="btn btn-danger float-right btn-sm lw-ajax-link-action-via-confirm" data-confirm="#lwDeleteAllTestTransactions" data-method="post" data-action="<?= route('manage.financial_transaction.write.delete.all_transaction') ?>" data-callback="deleteAllTransactionCallback">Xóa tất cả</a>
				<br><br>
				@endif
				<!-- delete all transaction button -->

				<!-- transaction table -->
				<table class="table table-hover" id="lwTransactionTable">
					<thead>
						<tr>
							<th>Người dùng</th>
							<th>Ngày tạo</th>
							<th>Số tiền</th>
							<th>Phương thức thanh toán</th>
							<th>Gói</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<!-- /transaction table -->
			</div>
		</div>
	</div>
</div>
<!-- End of Page Wrapper -->

<!-- User Permanent delete Container -->
<div id="lwDeleteAllTestTransactions" style="display: none;">
    <h3>Bạn có chắc không !</h3>
    <strong>Bạn muốn xóa tất cả các giao dịch thử nghiệm</strong>
</div>
<!-- User Permanent delete Container -->

@push('appScripts')
<script>
	//transaction list data table columns data
	var dtColumnsData = [
		{
			"name"      : "userFullName",
			"orderable" : true
		},
		{
			"name"      : "created_at",
			"orderable" : true
		},
		{
			"name"      : "formatAmount",
			"orderable" : false
		},
		{
			"name"      : "method",
			"orderable" : true
		},
		{
			"name"      : "packageName",
			"orderable" : false
		}
	],
	transactionListDataTable;

	//for transactions list
    fetchTransactions = function () {
		transactionListDataTable = dataTable('#lwTransactionTable', {
			url         : "<?= route('manage.financial_transaction.read.list', ['transactionType' => $transactionType ]) ?>",
			dtOptions   : {
				"searching": true,
				"order": [[ 0, 'desc' ]],
				"pageLength" : 10
			},
			columnsData : dtColumnsData,
			scope       : this
		});
	};
	//fetch transaction data
	fetchTransactions();

	//delete all test transaction callback
	function deleteAllTransactionCallback(responseData) {
		if (responseData.reaction == 1) {
			reloadDT(transactionListDataTable);
		}
	};
</script>
@endpush
