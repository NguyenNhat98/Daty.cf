<!-- Page Heading -->
<h3>Cài đặt tăng cường</h3>
<!-- Page Heading -->
<hr>
<!-- Email Setting Form -->
<form class="lw-ajax-form lw-form" method="post" action="<?= route('manage.configuration.write', ['pageType' => request()->pageType]) ?>">
  	<div class="form-group row">
		<!-- Booster period -->
		<div class="col-sm-12 mb-3 mb-sm-0">
            <label for="lwBoosterPeriod">Khoảng thời gian tăng cường (tính bằng phút)</label>
			<input type="number" min="1" name="booster_period" class="form-control form-control-user" id="lwBoosterPeriod" required value="<?= $configurationData['booster_period'] ?>">
		</div>
		<!-- / Booster period -->
	</div>
	<div class="form-group row">
		<!-- Booster Price For Standard Users -->
		<div class="col-sm-6 mb-3 mb-sm-0">
            <label for="lwBoosterPrice">Giá tăng cường cho người dùng tiêu chuẩn (tính bằng Tín dụng)</label>
			<input type="number" min="1" name="booster_price" class="form-control form-control-user" id="lwBoosterPrice" required value="<?= $configurationData['booster_price'] ?>">
		</div>
		<!-- / Booster Price For Standard Users -->
		<!-- Booster Price For Premium Users -->
		<div class="col-sm-6 mb-3 mb-sm-0">
            <label for="lwPremiumUserBoosterPrice">Giá tăng cường cho người dùng cao cấp (tính bằng Tín dụng)</label>
			<input type="number" min="1" name="booster_price_for_premium_user" class="form-control form-control-user" id="lwPremiumUserBoosterPrice" required value="<?= $configurationData['booster_price_for_premium_user'] ?>">
		</div>
		<!-- / Booster Price For Premium Users -->
	</div>
    <!-- Update Button -->
    <a href class="lw-ajax-form-submit-action btn btn-primary btn-user lw-btn-block-mobile">
        Cập nhật
    </a>
    <!-- /Update Button -->
</form>
<!-- /Email Setting Form -->