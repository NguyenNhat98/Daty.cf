@section('page-title', 'Thêm quà tặng')
@section('head-title', 'Thêm quà tặng')
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Thêm quà tặng</h1>
	<!-- back button -->
	<a class="btn btn-light btn-sm" href="<?= route('manage.item.gift.view') ?>">
		<i class="fa fa-arrow-left" aria-hidden="true"></i>Quay lại
	</a>
	<!-- /back button -->
</div>
 <!-- Start of Page Wrapper -->
 <div class="row">
	<div class="col-xl-12 mb-4">
		<div class="card mb-4">
			<div class="card-body">
 				<!-- page add form -->
                <form class="lw-ajax-form lw-form" method="post" action="<?= route('manage.item.gift.write.add') ?>">
                    <div class="row">
                        <div class="col-lg-6">
                            <input type="file" class="lw-file-uploader" data-instant-upload="true" data-action="<?= route('media.gift.upload_temp_media') ?>" data-remove-media="true" data-callback="afterUploadedFile" data-allow-image-preview="false" data-allowed-media='<?= getMediaRestriction('gift') ?>'>
                            <input type="hidden" name="gift_image" class="lw-uploaded-file" value="" required>
                        </div>
                        <div class="col-lg-6" style="display: none" id="lwGiftImagePreview">
                            <img class="lw-gift-preview-image lw-uploaded-preview-img" src="">
                        </div>
                    </div>
					<!-- title input field -->
 					<div class="form-group">
 						<label for="lwTitle">Tiêu đề</label>
						<input type="text" class="form-control" name="title" id="lwTitle" required minlength="3">
					</div>
 					<!-- / title input field -->

					<div class="form-group row">
						<!-- normal price field -->
 						<div class="col-sm-6 mb-3 mb-sm-0">
 							<label for="lwNormalPrice">Giá bình thường</label>
							<div class="input-group">
								<input type="number" class="form-control" name="normal_price" id="lwNormalPrice" required digits="true">
								<div class="input-group-append">
									<span class="input-group-text">VND</span>
								</div>
							</div>
						</div>
						<!-- / normal price field -->
						<!-- premium price field -->
						<div class="col-sm-6 mb-3 mb-sm-0">
							<label for="lwPremiumPrice">Giá cao cấp</label>
							<div class="input-group">
								<input type="number" class="form-control" name="premium_price" id="lwPremiumPrice" required digits="true">
								<div class="input-group-append">
									<span class="input-group-text">VND</span>
								</div>
							</div>
						</div>
						<!-- / premium price field -->
					</div>

					<!-- status field -->
					<div class="custom-control custom-checkbox custom-control-inline">
						<input type="checkbox" class="custom-control-input" id="statusCheck" name="status">
						<label class="custom-control-label" for="statusCheck">Hoạt động</label>
					</div>
					<!-- / status field -->
					<br><br>
					<!-- add button -->
					<button type="submit" class="lw-ajax-form-submit-action btn btn-primary btn-user lw-btn-block-mobile">Thêm</button>
					<!-- / add button -->
				</form>
				<!-- / page add form -->
			</div>
		</div>
	</div>
</div>
<!-- End of Page Wrapper -->
@push('appScripts')
<script>
function afterUploadedFile(responseData) {
    if (responseData.reaction == 1) {
		$("#lwGiftImagePreview").show();
        $('.lw-gift-preview-image').attr('src', responseData.data.path);
    }
}
</script>
@endpush
