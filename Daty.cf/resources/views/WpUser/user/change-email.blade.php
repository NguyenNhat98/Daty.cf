@section('page-title', 'Thay đổi e-mail')
@section('head-title', 'Thay đổi e-mail')
@section('keywordName', 'Thay đổi e-mail')
@section('keyword', 'Thay đổi e-mail')
@section('description', 'Thay đổi e-mail')
@section('keywordDescription', 'Thay đổi e-mail')
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Thay đổi e-mail</h1>
</div>
 <!-- Start of Page Wrapper -->
 <div class="row">
	<div class="col-xl-12 mb-4">
		<div class="card mb-4">
			<div class="card-body">
				<div data-show-if="activationRequired">
					<div class="alert alert-success">
						<div class="header">
							<strong>Kích hoạt địa chỉ email mới của bạn</strong>
						</div>
						<p>Bạn cần xác nhận địa chỉ email của mình. Để hoàn tất quá trình kích hoạt, vui lòng nhấp vào liên kết trong email chúng tôi vừa gửi cho bạn</p>
					</div>
				</div>
				<!-- change email form -->
				<form class="lw-ajax-form lw-form" method="post" action="<?= route('user.change_email.process') ?>" data-callback="onChangeEmailCallback" data-show-if="newChangeEmailRequestForm" data-show-processing="true" id="lwChangeEmailForm">
					<!-- current email input field -->
					<div class="form-group">
                        <label for="lwCurrentEmail">Email hiện tại</label>
						<input type="email" value="<?= $userEmail ?>" class="form-control" name="current_email" id="lwCurrentEmail" required readonly="true">
					</div>
					<!-- current email input field -->

					<!-- current password and new email input field -->
					<div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0">
                        <label for="lwCurrentPassword">Mật khẩu hiện tại</label>
							<input type="password" class="form-control" name="current_password" id="lwCurrentPassword" required minlength="6">
						</div>
						<div class="col-sm-6">
                        <label for="lwNewEmail">Email mới</label>
							<input type="email" class="form-control" name="new_email" id="lwNewEmail" required>
						</div>
					</div>
					<!-- /current password and new email input field -->

					<!-- update Email button -->
					<button type="submit" class="lw-ajax-form-submit-action btn btn-primary btn-user lw-btn-block-mobile">Cập nhật email</button>
					<!-- update Email button -->
				</form>
				<!-- / change email form -->
			</div>
		</div>
	</div>
</div>
<!-- End of Page Wrapper -->
@push('appScripts')
<script>
	__DataRequest.updateModels({
		'activationRequired' : false,
		'newChangeEmailRequestForm' : true
	});
	function onChangeEmailCallback(response) {
		if (response.reaction == 1 && response.data.activationRequired) {
			__DataRequest.updateModels({
				'activationRequired' : true,
				'newChangeEmailRequestForm' : false
			});
		} else {
			$("#lwChangeEmailForm")[0].reset();
			$("#lwCurrentEmail").val(response.data.newEmail);
		}
	}
</script>
@endpush
