@section('page-title', 'Liên hệ')
@section('head-title', 'Liên hệ')
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
								<div class="p-5">
									<!-- heading -->
									<div class="text-center">
										<img class="lw-logo-img" src="<?= getStoreSettings('logo_image_url') ?>" alt="<?= getStoreSettings('name') ?>">
                                        <h1><?= getStoreSettings('name') ?></h1>
										<hr class="mt-4 mb-4">
										<h4 class="text-gray-200 mb-4">Liên hệ</h4>
									</div>
									<!-- / heading -->
									<!-- change password form -->
									<form class="user lw-ajax-form lw-form" method="post" action="<?= route('user.contact.process') ?>" data-show-processing="true" data-callback="onContactMailCallback" id="lwContactMailForm">
										<!-- Full Name input field -->
										<div class="form-group">
											<label for="lwFullName">Họ và tên</label>
											<input type="text" class="form-control form-control-user" name="fullName" value="<?= isset($userFullName) ? $userFullName : '' ?>" required id="lwFullName" placeholder="Nhập tên đầy đủ">
										</div>
										<!-- / Full Name input field -->

										<!-- Email input field -->
										<div class="form-group">
											<label for="lwEmail">Email</label>
											<input type="email" class="form-control form-control-user" name="email" required id="lwEmail" value="<?= isset($contactEmail) ? $contactEmail : '' ?>" placeholder="Nhập Email">
										</div>
										<!-- / Email input field -->

										<!-- Subject field -->
										<div class="form-group">
											<label for="lwSubject">Tiêu đề</label>
											<input type="text" class="form-control form-control-user" name="subject" required id="lwSubject" placeholder="Tiêu đề">
										</div>
										<!-- / Subject field -->

										<!-- Message field -->
										<div class="form-group">
											<label for="lwMessage">Nội dung</label>
											<textarea cols="10" rows="3" class="form-control form-control-user" name="message" required id="lwMessage" placeholder="Nội dung"></textarea>
										</div>
										<!-- / Message field -->

										<!-- Submit button -->
										<button type="submit" class="lw-ajax-form-submit-action btn btn-primary btn-user btn-block">Gửi đi</button>
										<!-- / Submit button -->
									</form>
									<!-- /change password form -->

						            @if(!isLoggedIn())
										<hr>
										<!-- account and login page link -->
										<div class="text-center">
											<a class="small" href="<?= route('user.sign_up') ?>">Tạo một tài khoản !</a>
										</div>
										<div class="text-center">
											<a class="small" href="<?= route('user.login') ?>">Bạn có sẵn một tài khoản? Đăng nhập !</a>
										</div>
										<!-- / account and login page link -->
									@endif
								</div>
							</div>
						</div>
						<!-- /Nested Row within Card Body -->
					</div>
				</div>
			</div>
		</div>
		<!-- / Outer Row -->
	</div>
</body>
@push('appScripts')
<script>
	//on contact mail form callback
	function onContactMailCallback(response) {
		//check reaction code is 1
		if (response.reaction == 1) {
			//reset form
			$("#lwContactMailForm")[0].reset();
		}
	}
</script>
@endpush
@include('includes.footer')
