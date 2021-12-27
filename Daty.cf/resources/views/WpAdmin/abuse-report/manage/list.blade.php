@section('page-title', 'Quản lý báo cáo lạm dụng')
@section('head-title', 'Quản lý báo cáo lạm dụng')
@section('keywordName', strip_tags('Quản lý báo cáo lạm dụng'))
@section('keyword', strip_tags('Quản lý báo cáo lạm dụng'))
@section('description', strip_tags('Quản lý báo cáo lạm dụng'))
@section('keywordDescription', strip_tags('Quản lý báo cáo lạm dụng'))
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Quản lý báo cáo lạm dụng</h1>
</div>
 <!-- Start of Page Wrapper -->
 <?php $abuseReportStatus = request()->status; ?>
 <div class="row">
	<div class="col-xl-12 mb-4">
		<div class="card mb-4">
			<div class="card-body">
				<ul class="nav nav-tabs">
                    <!-- Awaiting Moderation Tab -->
                    <li class="nav-item">
                        <a class="nav-link <?= $abuseReportStatus == 1 ? 'active' : '' ?>" href="<?= route('manage.abuse_report.read.list', ['status' => 1]) ?>">
							Chờ đợi
                        </a>
                    </li>
                    <!-- /Awaiting Moderation Tab -->

                    <!-- Accept Tab -->
                    <li class="nav-item">
                        <a class="nav-link <?= $abuseReportStatus == 2 ? 'active' : '' ?>" href="<?= route('manage.abuse_report.read.list', ['status' => 2]) ?>">
							Chấp nhận
                        </a>
                    </li>
					<!-- /Accept Tab -->
					
					<!-- Rejected Tab -->
                    <li class="nav-item">
                        <a class="nav-link <?= $abuseReportStatus == 3 ? 'active' : '' ?>" href="<?= route('manage.abuse_report.read.list', ['status' => 3]) ?>">
							Từ chối
                        </a>
                    </li>
                    <!-- /Rejected Tab -->
				</ul>
				<div class="lw-nav-content">
					<div class="table-responsive">
	 					<table class="table table-hover">
							<thead>
								<tr>
									<th>Người dùng được báo cáo</th>
									<th>Ngày tạo</th>
									<th>Tổng báo cáo</th>
									<th>Trạng thái</th>
									<th>Hoạt động</th>
								</tr>
							</thead>
							<tbody>
								@if(!__isEmpty($reportListData))
									@foreach($reportListData as $reportData)
										<tr id="lw-report-row-<?= $reportData['_uid'] ?>">
											<td><?= $reportData['reported_user'] ?></td>
											<td><?= $reportData['created_at'] ?></td>
											<td><?= $reportData['total_report_count'] ?></td>
											<td><?= $reportData['formattedStatus'] ?></td>
											<td>
												@if($reportData['status'] == 1)
													<div class="btn-group">
														<button type="button" class="btn btn-black dropdown-toggle lw-datatable-action-dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
															<i class="fas fa-ellipsis-v"></i>
														</button>
														<div class="dropdown-menu dropdown-menu-right">
					 										<a class="dropdown-item" data-toggle="modal" data-target="#reportModerationDialog" data-user-id='<?= $reportData['for_users__id'] ?>' data-user-name="<?= $reportData['reported_user'] ?>" data-report-data='<?= json_encode($reportData['reportedByUser']) ?>'><i class="far fa-edit"></i>  Xem xét</a>
														</div>
													</div>
												@else
													<span>--</span>
												@endif
											</td>
										</tr>
									@endforeach
								@endif
								@if(__isEmpty($reportListData))
									<tr>
										<td colspan="6" class="text-center">
											Không có hồ sơ.
										</td>
									</tr>
								@endif
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Report Moderation Modal-->
<div class="modal fade" id="reportModerationDialog" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div id="lw-report-content"></div>
			<script type="text/_template" 
                    id="lw-report-template" 
                    data-replace-target="#lw-report-content"
                    data-modal-id="#reportModerationDialog">
				<div class="modal-header">
					<h5 class="modal-title" id="reportModalLabel">Kiểm duyệt Báo cáo (<%- __tData.reportUserName %>)</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="lw-ajax-form lw-form" method="post" data-callback="onModerateCallback" action="<?= route('manage.abuse_report.write.moderated') ?>">
						<div class="modal-body">
							<!-- for user id input hidden field -->
							<input type="hidden" name="forUserId" value="<%- __tData.forUserId %>">
							<!-- /for user id input hidden field -->
							
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Được báo cáo bởi</th>
											<th>Ngày tạo</th>
											<th>Lý do</th>
										</tr>
									</thead>
									<tbody>
										<% _.forEach(__tData.reportedData, function(data) {
											%>
											<tr>
												<th><%- data.reportedByUser %></th>
												<td><%- data.created_at %></td>
												<td><%- data.reason %></td>
											</tr>
										<% }); %>
									</tbody>
								</table>
							</div>
							<!-- description field -->
							<div class="form-group">
								<label for="lwRemark">Nhận xét</label>
								<input type="text" class="form-control" name="moderator_remarks" id="lwRemark">
							</div>
							<!-- / description field -->

							<!-- Accept -->
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="acceptRadioOption" name="reportStatus" class="custom-control-input" value="2">
								<label class="custom-control-label" for="acceptRadioOption">Chấp nhận</label>
							</div>
							<!-- /Accept -->

							<!-- Rejected -->
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="rejectRadioOption" name="reportStatus" class="custom-control-input" value="3">
								<label class="custom-control-label" for="rejectRadioOption">Từ chối</label>
							</div>
							<!-- /Rejected -->
						</div>
						<div class="modal-footer">
							<button type="submit" class="lw-ajax-form-submit-action btn btn-primary btn-user lw-btn-block-mobile">Gửi</button>
						</div>
					</form>
				</div>
			</script>
		</div>
	</div>
</div>
<!-- Report Moderation Modal-->

@push('appScripts')
<script>
	var successResponse = null;
    __Utils.modalTemplatize('#lw-report-template', function(e, data) {
        return { 
            'reportedData': data['reportData'],
			'forUserId': data['userId'],
			'reportUserName': data['userName']
        };
	}, function(e, myData) {
		if (!_.isNull(successResponse) && successResponse.reaction == 1) {
			__Utils.viewReload();
		}
        successResponse = null;
    });
	
	//on moderate success callback
	function onModerateCallback(responseData) {
		if (responseData.reaction == 1) {
            successResponse = responseData;
			$('#reportModerationDialog').modal('hide');
		}
	}
</script>
@endpush