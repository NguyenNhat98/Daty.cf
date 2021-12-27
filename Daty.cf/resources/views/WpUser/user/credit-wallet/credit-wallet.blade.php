@section('page-title', 'Ví tín dụng')
@section('head-title', 'Ví tín dụng')
@section('keywordName', 'Ví tín dụng')
@section('keyword', 'Ví tín dụng')
@section('description', 'Ví tín dụng')
@section('keywordDescription', 'Ví tín dụng')
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

 <style>
     .lw-group-radio-option-img.active::after {
         content: "Đã chọn";
     }
 </style>
 <!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Ví tín dụng</h1>
</div>

 <!-- Show loader when process payment request -->
<div class="d-flex justify-content-center">
	<div class="lw-page-loader lw-show-till-loading">
		<div class="spinner-border text-primary"  role="status"></div>
	</div>
</div>
<!-- Show loader when process payment request -->

<div class="d-block text-center lw-credit-balance">
    <h2 class="text-gray-200">
		Số dư trên ví của bạn
    </h2>
    <h1 class="text-primary">

   <i class="fas fa-coins fa-fw mr-2"></i>
        <?= totalUserCredits() ?> VND

    </h1>
    <hr>
    <p class="text-muted ">
		Bạn có thể sử dụng các khoản tín dụng này trên trang web này cho các giao dịch mua khác nhau như mua Tư cách thành viên cao cấp, Tăng cường hồ sơ, mua Quà tặng & Hình dán, v.v.
    </p>
</div>

<!-- buy credits card -->
<div>
    <!-- payment successfully message -->
		@if(session('success'))
		<!--  success message when email sent  -->
		<div class="alert alert-success alert-dismissible">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<?= session('message') ?>
		</div>
		<!--  /success message when email sent  -->
		@endif
		<!-- / payment successfully message -->

		<!-- payment failed message -->
		@if(session('error'))
		<!--  danger message when email sent  -->
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<?= session('message') ?>
		</div>
		<!--  /danger message when email sent  -->
		@endif
		<!-- / payment failed message -->

		<!--  success messages  -->
		<div class="alert alert-success alert-dismissible fade show" id="lwSuccessMessage" style="display:none;"></div>
		<!--  /success messages  -->

		<!--  error messages  -->
		<div class="alert alert-danger alert-dismissible fade show" id="lwErrorMessage" style="display:none;"></div>
		<!--  /error messages  -->
		 <h4>Mua thêm các gói</h4>
         <hr>
		<!-- select package form -->
		<form class="lw-ajax-form lw-form text-center" name="credit_wallet_form" method="post" action="<?= route('user.credit_wallet.write.payment_process') ?>" data-callback="onSuccessCallback">
 			<!-- show credit packages radio options -->
			<div class="btn-group-toggle lw-img-credits-radio-btns-container" data-toggle="buttons">
				@if(isset($creditWalletData) and !__isEmpty($creditWalletData['creditPackages']))
					@foreach($creditWalletData['creditPackages'] as $key => $package)
					<span class="btn lw-group-radio-option-img">
						<span class="lw-credit-package-name"><?= $package['package_name'] ?></span>
						<input type="radio" value="<?= $package['_uid'] ?>" data-package-price="<?= $package['price'] ?>"  data-package-name="<?= $package['package_name'] ?>" name="select_package"/>
						<div>
							<img src="<?= $package['packageImageUrl'] ?>"/>
                            <h3 class="text-success">
                                <?= $package['credit']
                                ?> VND
                            </h3>

						</div>
					</span>
					@endforeach
				@else
					<!-- info message -->
					<div class="alert alert-info">
						Không có gói
					</div>
					<!-- / info message -->
				@endif
			</div>
			<!-- / show credit packages radio options -->

			<!-- hidden select payment option input field -->
			<input type="hidden" name="select_payment_method" id="lwSelectPaymentMethod"/>
			<!-- / hidden select payment option input field -->

			<!-- payment buttons -->
			<div id="lwPaymentOption" style="display:none">
				@if(getStoreSettings('enable_paypal'))
				<div id="paypal-button-container" style="width:286px"></div>
				@endif

				@if(getStoreSettings('enable_stripe'))
				<button class="lw-ajax-form-submit-action btn btn-user lw-btn-block-mobile lw-stripe-checkout-btn lw-stripe-payment-btn lw-payment-checkout-btn" title="<?= __tr('Stripe Payment') ?>"><i class="fab fa-stripe-s"></i> <?= __tr('Stripe') ?></button>
				@endif


			</div>
			<!-- / payment buttons -->

		</form>
		<!-- /select package form -->
</div>
<!-- /buy credits card -->

<!-- transaction list card -->
<div class="card mb-4 mt-4">
	<!-- card body -->
	<div class="card-body">
 		<!-- financial transaction list -->
		<h4 class="mt-3">Giao dịch trên ví</h4><hr>
		<!-- / financial transaction list -->

		<!-- financial transaction table -->
 		<table class="table table-hover" id="lwUserTransactionTable">
			<thead>
				<tr>
					<th>Ngày giao dịch</th>
					<th>Nội dung</th>
					<th width="190px;">Tín dụng (tín dụng / ghi nợ)</th>
					<th>Hoạt động</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<!-- financial transaction table -->
	</div>
	<!-- / card body -->
</div>
<!-- / transaction list card -->

<!-- Transaction Details Action Column -->
<script type="text/_template" id="transactionDetailsActionColumnTemplate">
	<!-- action dropdown -->
	<% if(__tData.transactionType == 1 && !_.isEmpty(__tData.financialTransactionDetail)) { %>
	<div class="btn-group">
		<button type="button" class="btn btn-black dropdown-toggle lw-datatable-action-dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			<i class="fas fa-ellipsis-v"></i>
		</button>
		<div class="dropdown-menu dropdown-menu-right">
			<!-- Transaction Detail Button -->
			<a href class="dropdown-item" data-toggle="modal" data-financial-transaction='<%= JSON.stringify(__tData.financialTransactionDetail) %>' data-target="#userTransactionDetailDialog" data-transaction-detail><i class="far fa-edit"  id="lwTransactionDetailBtn"></i> Lịch sử giao dịch</a>
			<!-- /Transaction Detail Button -->
		</div>
	</div>
	<% } else { %>
		-
	<% } %>
	<!-- /action dropdown -->
</script>
<!-- Transaction Details Action Column -->

<!-- user transaction Modal-->
<div class="modal fade" id="userTransactionDetailDialog" tabindex="-1" role="dialog" aria-labelledby="userTransactionModalLabel" aria-hidden="true">
 	<div class="modal-dialog modal-lg" role="document">
 		<div class="modal-content">
 			<div class="modal-header">
				<h5 class="modal-title" id="userTransactionModalLabel">Thông tin giao dịch</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" id="lwUserTransactionContent"></div>
			<script type="text/_template"
					id="lwTransactionDetailTemplate"
					data-replace-target="#lwUserTransactionContent"
					data-modal-id="#userTransactionDetailDialog">
					<div>
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									Ngày tạo
									<span class="float-right"><%- __tData.financialTransactionData.created_at %></span>
								</li>
								<li class="list-group-item">
                                    Số tiền
									<span class="float-right"><%= __tData.financialTransactionData.amount %></span>
								</li>
								<li class="list-group-item">
                                    Tiền tệ
									<span class="float-right"><%= __tData.financialTransactionData.currency_code %></span>
								</li>
								<li class="list-group-item">
                                    Trạng thái
									<span class="float-right"><%= __tData.financialTransactionData.status %></span>
								</li>
								<li class="list-group-item">
									Phương thức
									<span class="float-right"><%= __tData.financialTransactionData.method %></span>
								</li>
								<li class="list-group-item">
                                    Chế độ
									<span class="float-right"><%= __tData.financialTransactionData.payment_mode %></span>
								</li>
							</ul>
						</div>
					</div>
			</script>
			<!-- modal footer -->
			<div class="modal-footer mt-3">
				<button class="btn btn-light btn-sm" class="close" type="button" data-dismiss="modal">Đóng</button>
			</div>
			<!-- modal footer -->
		</div>
	</div>
</div>
<!-- / user transaction Modal-->

@if(getStoreSettings('enable_paypal'))
	<?php $appDebug =  config('app.debug'); ?>
	@if(getStoreSettings('use_test_paypal_checkout'))
		<script src="https://www.paypal.com/sdk/js?client-id=<?= getStoreSettings('paypal_checkout_testing_client_id') ?>&currency=<?= getStoreSettings('currency') ?>&disable-funding=credit,card&debug=<?= (isset($appDebug) and $appDebug == 1) ? 'true' : 'false' ?>"></script>
	@else
		<script src="https://www.paypal.com/sdk/js?client-id=<?= getStoreSettings('paypal_checkout_live_client_id') ?>&currency=<?= getStoreSettings('currency') ?>&disable-funding=credit,card&debug=<?= (isset($appDebug) and $appDebug == 1) ? 'true' : 'false' ?>"></script>
	@endif
@endif

@if(getStoreSettings('enable_stripe'))
<script src="https://js.stripe.com/v3/"></script>
@endif



@push('appScripts')
<script>
	//user transaction dialog details
	__Utils.modalTemplatize('#lwTransactionDetailTemplate', function(e, data) {
		return {
            'financialTransactionData': data['financialTransaction']
        };
	}, function(e, myData) { });
	$(document).ready(function() {
		var enablePaypalCheckout = '<?= getStoreSettings('enable_paypal') ?>';

		//set on click select payment option
		$(".lw-stripe-checkout-btn").on('click', function() {
			$("#lwSelectPaymentMethod").val('stripe');
		});

		//by default hide payment options
		$('input[type=radio][name=select_package]').on('change', function(event) {
			var $this = $(this),
				packageUid = event.target.value,
				packageName = $this.attr('data-package-name'),
				packagePrice = $this.attr('data-package-price');
			//on change show payment button options
			$("#lwPaymentOption").show();

            //if paypal button instance available then remove from dom else create instance
            if (!_.isEmpty($("#paypal-button-container").html())) {
                $("#paypal-button-container").empty();
            }
			//paypal payment button script js
			/*************************************************************************************************************
			 Paypal Payment on Click
			**************************************************************************************************************/
			if (enablePaypalCheckout) {
				try {
					paypal.Buttons({
						style: {
							layout:  'horizontal',
							color:   'silver',
							shape:   'rect',
							size: 'responsive',
							// label:   'checkout',
							tagline: false,
							height: 35
						},
						createOrder: function(data, actions) {
							// This function sets up the details of the transaction, including the amount and line item details.
							return actions.order.create({
								purchase_units: [{
									amount: {
										value: packagePrice
									}
								}]
							});
						},
						onApprove: function(data, actions) {
							//before process on server disabled payment button block
							$("#lwPaymentOption").addClass('lw-disabled-block-content');
							//show loader before ajax request
							$(".lw-show-till-loading").show();
							// This function captures the funds from the transaction.
							return actions.order.capture().then(function(details) {
								var requestUrl = __Utils.apiURL("<?= route('user.credit_wallet.write.paypal_transaction_complete', ['packageUid' => 'packageUid']) ?>", {'packageUid': packageUid});

								//post ajax request
								__DataRequest.post(requestUrl, details, function(response) {
									//handle callback event data
									handlePaymentCallbackEvent(response);
								});
							});
						},onError: function (err) {
							// Show an error page here, when an error occurs
							alert(err.message);
						},onCancel: function (data) {
							// Show a cancel page, or return to cart
							//bind error message on div
							$("#lwErrorMessage").text('<?= __tr("Payment Canceled by User") ?>');
							//show hide div
							$("#lwErrorMessage").toggle();
							_.delay(function() {
								//hide div
								$("#lwErrorMessage").toggle();
							}, 10000);
						}
					}).render('#paypal-button-container');
				} catch (error) {
				 	/****Add Stuff error.message ****/
					if ('<?= getStoreSettings('enable_paypal') ?>') {
						__Utils.error('Đã xảy ra sự cố với thanh toán qua paypal, vui lòng liên hệ với quản trị viên');
					}
				}
			}
		});
	});

	//on success callback
	function onSuccessCallback(responseData) {
		var reactionCode = responseData.reaction,
			selectPaymentMethod = $("#lwSelectPaymentMethod").val(),
			enableStripe = "<?= getStoreSettings('enable_stripe'); ?>";
		//check reaction code
		if (reactionCode == 1 && enableStripe && selectPaymentMethod == 'stripe') {
			var requestData = responseData.data.stripeSessionData,
				useTestStripe = "<?= getStoreSettings('use_test_stripe'); ?>",
				stripePublishKey = '';

			//check is testing or live
			if (useTestStripe) {
				stripePublishKey = "<?= getStoreSettings('stripe_testing_publishable_key'); ?>";
			} else {
				stripePublishKey = "<?= getStoreSettings('stripe_live_publishable_key'); ?>";
			}

			//create stripe instance
			var stripe = Stripe(stripePublishKey);

			//check request id is not undefined
			if (typeof requestData.id !== "undefined") {
				stripe.redirectToCheckout({
					// Make the id field from the Checkout Session creation API response
					// available to this file, so you can provide it as parameter here
					sessionId: requestData.id
					}).then(function (result) {
					// If `redirectToCheckout` fails due to a browser or network
					// error, display the localized error message to your customer
					// using `result.error.message`.
					//bind error message on div
					$("#lwErrorMessage").text(result);
					//show hide div
					$("#lwErrorMessage").toggle();
					_.delay(function() {
						//hide div
						$("#lwErrorMessage").toggle();
					}, 10000);
				});
			}
		} else {
			//bind error message on div
			$("#lwErrorMessage").text(responseData.data.errorMessage);
			//show hide div
			$("#lwErrorMessage").toggle();
			_.delay(function() {
				//hide div
				$("#lwErrorMessage").toggle();
			}, 10000);
		}
	}

	//transaction list data table columns data
	var dtColumnsData = [
		{
			"name"      : "created_at",
			"orderable" : true
		},
		{
			"name"      : "formattedTransactionType",
			"orderable" : false
		},
		{
			"name"      : 'credits',
			"orderable" : true
		},
        {
            "name"      : 'action',
            "template"  : '#transactionDetailsActionColumnTemplate'
        }
	],
	transactionListDataTable = '';

	//fetch transaction list data
	function fetchTransactionList() {
		transactionListDataTable = dataTable('#lwUserTransactionTable', {
			url         : "<?= route('user.credit_wallet.read.wallet_transaction_list') ?>",
			dtOptions   : {
				"searching": false,
				"order": [[ 0, 'desc' ]],
				"pageLength" : 10,
				rowCallback : function(row, data, index) {
					$('td:eq(2)', row).css("text-align", "right")
				}
			},
			columnsData : dtColumnsData,
			scope       : this
		});
	}

	//load transaction list data function
	fetchTransactionList();

	/**
	 * reload data table
	 *
	 *-------------------------------------------------------- */
	reloadTransactionTable = function () {
		reloadDT(transactionListDataTable);
	};


	/**
	 * handle callback event data hide/show data
	 *
	 *-------------------------------------------------------- */
	function handlePaymentCallbackEvent(response) {
		//hide payment options
		$("#lwPaymentOption").hide();
		//hide loader after ajax request complete
		$(".lw-show-till-loading").hide();
		//after process on server enable payment button block
		$("#lwPaymentOption").removeClass('lw-disabled-block-content');
		//check reaction code is 1
		if (response.reaction == 1) {
			//show confirmation
			showConfirmation('Thanh toán thành công, Tiền đã được thêm thành công vào ví của bạn', null, {
				buttons: [
					Noty.button('Tải lại để cập nhật', 'btn btn-secondary btn-sm', function () {
						__Utils.viewReload();
						return response ;
					})
				]
			});
			//load transaction list data function
			_.defer(function() {
				reloadTransactionTable();
			});
			//bind error message on div
			$("#lwSuccessMessage").text(response.data.message);
			//show div
			$("#lwSuccessMessage").toggle();
			_.delay(function() {
				//hide div
				$("#lwSuccessMessage").toggle();
			}, 10000);
		} else {
			//bind error message on div
			$("#lwErrorMessage").text(response.data.errorMessage);
			//show hide div
			$("#lwErrorMessage").toggle();
			_.delay(function() {
				//hide div
				$("#lwErrorMessage").toggle();
			}, 10000);
		}
        return response;
	}

</script>
@endpush
