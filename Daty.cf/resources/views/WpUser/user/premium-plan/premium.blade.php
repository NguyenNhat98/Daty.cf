@section('page-title', 'Gói cao cấp')
@section('head-title', 'Gói cao cấp')
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Cao cấp</h1>
</div>

<!-- card -->
<div class="card">
	<!-- card body -->
	<div class="card-body">
		@if($premiumPlanData['isPremiumUser'])
 			<div class="card-header text-center">
				<i class="fa fa-smile" aria-hidden="true"></i>
				Bạn đã mua gói cao cấp
			</div>
 			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					Kế hoạch
					<span class="float-right"><?= $premiumPlanData['userSubscriptionData']['planTitle'] ?></span>
				</li>
				<li class="list-group-item">
					Ngày tạo
					<span class="float-right"><?= $premiumPlanData['userSubscriptionData']['created_at'] ?></span>
				</li>
				<li class="list-group-item">
					Hết hạn
					<span class="float-right"><?= $premiumPlanData['userSubscriptionData']['expiry_at'] ?></span>
				</li>
				<li class="list-group-item">
					Giá
					<span class="float-right"><?= $premiumPlanData['userSubscriptionData']['planPrice'].' '.'USD' ?></span>
				</li>
				<li class="list-group-item">
					Tíền nợ
					<span class="float-right"><?= $premiumPlanData['userSubscriptionData']['debitedCredits'].' '.'USD' ?></span>
				</li>
			</ul>
		@else
 		<div class="row">
			<!-- premium plans block -->
 			<div class="col-md-4 lw-premium-plan-right-border">
				Chọn thời gian cho gói cao cấp
				@if(!__isEmpty($premiumPlanData['premiumPlans']))
					<!-- show premium plan radio options -->
					<div class="btn-group-toggle mt-3" data-toggle="buttons">
						@foreach($premiumPlanData['premiumPlans'] as $planKey => $plan)
 							@if($plan['enable'])
							<span class="btn lw-premium-plan-radio-option mt-2">
								<span class="float-left"><?= $plan['title'] ?></span>
								<input type="radio" name="select_plan" value="<?= $planKey ?>" class="lw-selected-plan" id="lwSelectedPlan_<?= $planKey ?>" data-plan-title="<?= $plan['title'] ?>" data-plan-price="<?= $plan['price'] ?>"/>
								<div  class="float-right">
									<?=  $plan['price']
									?> VND
								</div>
							</span>
							@endif
						@endforeach
					</div>
					<!-- / show premium plan radio options -->

					<!-- buy plan button -->
					<button  type="button" id="lwBuyPremiumPlanBtn" class="btn btn-lg btn-block btn-primary mt-5"><?= __tr('CAO CẤP BÂY GIỜ') ?></button>
					<!-- /buy plan button -->
				@else
 					<!-- info message -->
					<div class="alert alert-info">
						Không có gói cao cấp.
					</div>
					<!-- / info message -->
				@endif
			</div>
			<!-- /premium plans block -->

			<!-- premium features block -->
			<div class="col-md-8">
                Tính năng cao cấp
				@if(!__isEmpty($premiumPlanData['premiumFeature']))
 					<!-- show premium plan features -->
					<div class="row mt-3 ml-2">
                        <!-- Discounts -->
                        <div class="col-sm-5 lw-premium-feature-item">
                            <div class="lw-premium-feature-item-icon">
                                <i class="fas fa-percent text-success fa-3x"></i>
                            </div>
                            <h6>Giảm giá quà tặng, nhãn dán & công cụ hỗ trợ hồ sơ</h6>
                        </div>
                        <!-- /Discounts -->
                        <!-- Discounts -->
                        <div class="col-sm-5 lw-premium-feature-item">
                            <div class="lw-premium-feature-item-icon">
                                <i class="fas fa-award text-primary fa-4x"></i>
                            </div>
                            <h6>Huy hiệu cao cấp</h6>
                        </div>
                        <!-- /Discounts -->
                        <div class="col-sm-5 lw-premium-feature-item">
                            <div class="lw-premium-feature-item-icon">
                                <i class="fas fa-star fa-3x text-warning"></i>
                            </div>
                            <h6>Ưu tiên trong kết quả Tìm kiếm & Người dùng ngẫu nhiên</h6>
                        </div>
						@foreach($premiumPlanData['premiumFeature'] as $featureKey => $feature)
							@if(isset($feature['enable']) and $feature['enable'])
								<div class="col-sm-5 lw-premium-feature-item">
									<div class="lw-premium-feature-item-icon">
										<?= $feature['icon'] ?>
									</div>
									<h6><?= $feature['title'] ?></h6>
								</div>
							@endif
						@endforeach
					</div>
					<!-- / show premium plan features -->
				@else
				<!-- info message -->
				<div class="alert alert-info">
					Không có tính năng cao cấp.
				</div>
				<!-- / info message -->
				@endif
			</div>
			<!-- /premium features block -->
		</div>
		@endif
	</div>
	<!-- /card body -->
</div>
<!-- /card -->

<!-- User Permanent delete Container -->
<div id="lwMsgContent"  style="display: none;"></div>
<script type="text/_template" id="lwBuyPremiumPlanContainer">
	<h3>Bạn có chắc không ?</h3>
    <strong><?= __tr('You want to buy __selectedPlanTitle__ plan.', [
    '__selectedPlanTitle__' => '<%- __tData.selectedPlanTitle %>'
    ]) ?></strong>
</script>
<!-- User Permanent delete Container -->

@push('appScripts')
<script>
	$(document).ready(function() {
		//getPremium plan data
		var premiumPlan = JSON.parse('<?= json_encode($premiumPlanData['premiumPlans']) ?>'),
			isPlanSelected = false,
			selectedPlanPrice = selectedPlan = selectedPlanTitle = null;

		//premium plan array on change bind value and disable input price filed start
		_.forEach(premiumPlan, function(value, key) {
			var isPlanSelected = $("#lwSelectedPlan_"+key).is(':checked');
			//check if plan not selected then disable true buy button
			if (!isPlanSelected) {
				$("#lwBuyPremiumPlanBtn").attr("disabled", true);
			}

			//on change select plan radio option
			$("#lwSelectedPlan_"+key).on('change', function() {
				selectedPlan = $(this).val();
				selectedPlanTitle = $(this).attr('data-plan-title');
				selectedPlanPrice = Number($(this).attr('data-plan-price'));
				isPlanSelected = $("#lwSelectedPlan_"+key).is(':checked');

				//check if plan selected then disable false buy button
				if (isPlanSelected) {
					$("#lwBuyPremiumPlanBtn").attr("disabled", false);
				}
			});
		});

		//buy premium plan on click
		$("#lwBuyPremiumPlanBtn").on('click', function() {
			//get Selected Plan
			var totalUserCredits = '<?= totalUserCredits() ?>';
				lwMsgContentDiv = $("#lwMsgContent"),
				compiled = _.template($('#lwBuyPremiumPlanContainer').html());
				//append value on div
				lwMsgContentDiv.html(compiled({'selectedPlanTitle': selectedPlanTitle}));

			if (selectedPlanPrice > totalUserCredits) {
				//show confirmation text
				var errorText = 'Số dư của bạn quá thấp, vui lòng nạp tiền';
				showConfirmation(errorText, function() {
					//redirect to buy credits package view
					window.location.href = '<?= route('user.credit_wallet.read.view') ?>';
				});
			} else {
				//check is plan selected
				if (!_.isEmpty(selectedPlan)) {
					//show confirmation
					showConfirmation($("#lwMsgContent"), function() {
						var requestUrl = '<?= route('user.premium_plan.write.buy_premium_plan') ?>',
							formData = {
								'select_plan' : selectedPlan
							};
						//post ajax request
						__DataRequest.post(requestUrl, formData, function(response) {
						});
					});
				}
			}
		});
	});

</script>
@endpush
