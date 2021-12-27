<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Cập nhật người dùng</h1>
	<!-- back button -->
	<a class="btn btn-light btn-sm" href="<?= route('manage.user.view_list', ['status' => 1]) ?>">
		<i class="fa fa-arrow-left" aria-hidden="true"></i> Trở về
	</a>
	<!-- /back button -->
</div>
<!-- Page Heading -->

<!-- Start of Page Wrapper -->
 <div class="row">
	<div class="col-xl-12 mb-4">
        <!-- card -->
		<div class="card mb-4">
            <!-- card body -->
			<div class="card-body">
                <!-- form start -->
				<form class="lw-form" method="post" method="post" action="<?= route('manage.user.write.update', ['userUid' => $userData['uid']]) ?>">
					<div class="form-group row">
                        <!-- First Name -->
						<div class="col-sm-6 mb-3 mb-sm-0">
							<label for="lwFirstName">Tên</label>
							<input type="text" class="form-control form-control-user" name="first_name" id="lwFirstName" value="<?= $userData['first_name'] ?>" required minlength="3">
						</div>
                        <!-- /First Name -->
                        <!-- Last Name -->
						<div class="col-sm-6">
							<label for="lwLastName">Họ</label>
							<input type="text" class="form-control form-control-user" name="last_name" id="lwLastName" value="<?= $userData['last_name'] ?>" required minlength="3">
						</div>
                        <!-- /Last Name -->
                    </div>
                    <div class="form-group row">
                        <!-- Email -->
						<div class="col-sm-6 mb-3 mb-sm-0">
							<label for="lwEmail">Email</label>
							<input type="text" class="form-control form-control-user" name="email" id="lwEmail" value="<?= $userData['email'] ?>" required>
						</div>
                        <!-- /Email -->
                        <!-- Username -->
						<div class="col-sm-6">
							<label for="lwUsername">Tên người dùng</label>
							<input type="text" class="form-control form-control-user" name="username" id="lwUsername" value="<?= $userData['username'] ?>" required minlength="5">
						</div>
                        <!-- /Username -->
                    </div>
                    <div class="form-group row">
                        <!-- Mobile Number -->
						<div class="col-sm-6">
							<label for="lwMobileNumber">Số điện thoại</label>
							<input type="text" class="form-control form-control-user" name="mobile_number" id="lwMobileNumber" value="<?= $userData['mobile_number'] ?>" required maxlength="15">
						</div>
                        <!-- /Mobile Number -->
					</div>
                    <!-- status field -->
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <div class="custom-control custom-checkbox custom-control-inline">
                                <input type="checkbox" class="custom-control-input" id="activeCheck" name="status" <?= $userData['status'] == 1 ? 'checked' : '' ?> value="1">
                                <label class="custom-control-label" for="activeCheck">Hoạt động</label>
                            </div>
                        </div>
                    </div>
					<!-- / status field -->
                    <!-- Update Button -->
					<button type="button" class="btn btn-primary lw-btn-block-mobile lw-ajax-form-submit-action">Cập nhật</button>
                    <!-- /Update Button -->
				</form>
                <!-- /form end -->
			</div>
            <!-- /card body -->
		</div>
        <!-- /card -->
	</div>
</div>
<!-- End of Page Wrapper -->
