@section('page-title', 'Đổi mật khẩu')
@section('head-title', 'Đổi mật khẩu')
@section('keywordName', 'Đổi mật khẩu')
@section('keyword', 'Đổi mật khẩu')
@section('description', 'Đổi mật khẩu')
@section('keywordDescription','Đổi mật khẩu')
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-200">Đổi mật khẩu</h1>
</div>

<div class="row">
    <div class="col-xl-12 mb-4">
		<!-- if user password is not password then show info message -->
		@if(isset($userPassword) and $userPassword == 'NO_PASSWORD')
		<!-- info message -->
		<div class="alert alert-info">
            Vì bạn đã đăng ký bằng tài khoản xã hội và chưa đặt mật khẩu, bạn cần đăng xuất và sử dụng liên kết Quên mật khẩu để đặt mật khẩu
		</div>
		<!-- / info message -->
		@endif
		<!-- /if user password is not password then show info message -->

		<!-- change password form -->
        <div class="card mb-4">
            <div class="card-body">
				<!-- change password form -->
                <form class="lw-ajax-form lw-form <?= (isset($userPassword) and $userPassword == 'NO_PASSWORD') ? 'lw-disabled-block-content' : '' ?>" method="post" action="<?= route('user.change_password.process') ?>" data-callback="onChangePasswordCallback" id="lwChangePasswordForm">
					<!-- current password input field -->
                    <div class="form-group">
                        <label for="lwCurrentPassword">Mật khẩu hiện tại</label>
                        <input type="password" class="form-control" name="current_password" required minlength="6" id="lwCurrentPassword">
                    </div>
					<!-- / current password input field -->

					<!-- new confirmation password input field -->
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                        <label for="lwNewPassword">Mật khẩu mới</label>
                            <input type="password" class="form-control" name="new_password" id="lwNewPassword" required minlength="6">
                        </div>
                        <div class="col-sm-6">
                        <label for="lwNewPasswordConfirmation">Nhập lại mật khẩu</label>
                            <input type="password" class="form-control" name="new_password_confirmation" id="lwNewPasswordConfirmation" required minlength="6">
                        </div>
                    </div>
					<!-- / new confirmation password input field -->

					<!-- update Password button -->
                    <button type="submit" class="lw-ajax-form-submit-action btn btn-primary btn-user lw-btn-block-mobile">Cập nhật mật khẩu</button>
					<!-- / update Password button -->
                </form>
				<!-- /change password form -->
            </div>
		</div>
		<!-- /change password form -->
    </div>
</div>
@push('appScripts')
<script>
	function onChangePasswordCallback(response) {
		if (response.reaction == 1) {
			$("#lwChangePasswordForm")[0].reset();
		}
	}
</script>
@endpush
