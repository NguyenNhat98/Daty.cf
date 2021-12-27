@section('page-title', 'QUÊN MẬT KHẨU')
@section('head-title', 'QUÊN MẬT KHẨU')
@section('keywordName', strip_tags('QUÊN MẬT KHẨU'))
@section('keyword', strip_tags('QUÊN MẬT KHẨU'))
@section('description', strip_tags('QUÊN MẬT KHẨU'))
@section('keywordDescription', strip_tags('QUÊN MẬT KHẨU'))
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- include header -->
@include('includes.header')
<!-- /include header -->
<body class="lw-login-register-page">
	<div class="lw-page-bg lw-lazy-img" data-src="<?= __yesset("imgs/auto/*.jpg", false, [
        'random' => true
    ]) ?>"></div>
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-5">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-12">
								<div class="p-5 lw-success-message">
									<!-- heading -->
									<div class="text-center">
										<a href="<?= url(''); ?>">
											<img class="lw-logo-img" src="<?= getStoreSettings('logo_image_url') ?>" alt="<?= getStoreSettings('name') ?>">
										</a>
										<hr class="mt-4 mb-4">
										<h4 class="text-gray-200 mb-4">QUÊN MẬT KHẨU</h4>
										<p class="mb-4">Nhập địa chỉ email của bạn vào bên dưới và chúng tôi sẽ gửi cho bạn một liên kết để đặt lại mật khẩu của bạn !!</p>
									</div>
									<!-- / heading -->
									<!-- forgot password form form -->
									<form class="user lw-ajax-form lw-form" method="post" action="<?= route('user.forgot_password.process') ?>">
										<!-- email input field -->
										<div class="form-group">
											<input type="email" class="form-control form-control-user" name="email" aria-describedby="emailHelp" placeholder="Email..." required>
										</div>
										<!-- / email input field -->

										<!-- Reset Password button -->
										<button type="submit" class="lw-ajax-form-submit-action btn btn-primary btn-user btn-block">
										 Đặt lại mật khẩu
										</button>
										<!-- Reset Password button -->
									</form>
									<!-- forgot password form form -->
									<hr>
									<!-- account and login page link -->
									<div class="text-center">
										<a class="small" href="<?= route('user.sign_up') ?>">TẠO TÀI KHOẢN!</a>
									</div><br>
									<div class="text-center">
										<a class="small" href="<?= route('user.login') ?>">ĐÃ CÓ TÀI KHOẢN? ĐĂNG NHẬP!</a>
									</div>
									<!-- / account and login page link -->
								</div>
							</div>
						</div>
						<!-- / Nested Row within Card Body -->
					</div>
				</div>
			</div>
		</div>
		<!-- / Outer Row -->
	</div>
</body>
@include('includes.footer')
