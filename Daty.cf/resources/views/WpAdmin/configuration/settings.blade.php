@section('page-title', 'Cài đặt')
@section('head-title', 'Cài đặt')
@section('keywordName', strip_tags('Cài đặt'))
@section('keyword', strip_tags('Cài đặt'))
@section('description', strip_tags('Cài đặt'))
@section('keywordDescription', strip_tags('Cài đặt'))
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Cài đặt</h1>
</div>
<!-- Page Heading -->
<?php $pageType = request()->pageType ?>
<div class="row">
    <div class="col-lg-3">
        <!-- List group start here -->
        <div class="list-group">
            <!-- General Settings -->
            <a class="list-group-item list-group-item-action <?= $pageType == 'general' ? 'active' : '' ?>" href="<?= route('manage.configuration.read', ['pageType' => 'general']) ?>">Chung</a>
            <!-- /General Settings -->

            <!-- User Settings -->
            <a class="list-group-item list-group-item-action <?= $pageType == 'user' ? 'active' : '' ?>" href="<?= route('manage.configuration.read', ['pageType' => 'user']) ?>">Người dùng</a>
			<!-- /User Settings -->

			<!-- Currency & Credit Packages -->
			<!-- /Currency & Credit Packages -->

			<!-- Payment Settings -->
            <a class="list-group-item list-group-item-action <?= $pageType == 'payment' ? 'active' : '' ?>" href="<?= route('manage.configuration.read', ['pageType' => 'payment']) ?>">Cổng thanh toán</a>
			<!-- /Payment Settings -->

			<!-- Social Login Settings -->
            <a class="list-group-item list-group-item-action <?= $pageType == 'social-login' ? 'active' : '' ?>" href="<?= route('manage.configuration.read', ['pageType' => 'social-login']) ?>">Đăng nhập xã hội</a>
			<!-- /Social Login Settings -->

			<!-- Integration Settings -->
            <a class="list-group-item list-group-item-action <?= $pageType == 'integration' ? 'active' : '' ?>" href="<?= route('manage.configuration.read', ['pageType' => 'integration']) ?>">Tích hợp</a>
			<!-- /Integration Settings -->

			<!-- Premium Plans Settings -->
            <a class="list-group-item list-group-item-action <?= $pageType == 'premium-plans' ? 'active' : '' ?>" href="<?= route('manage.configuration.read', ['pageType' => 'premium-plans']) ?>">Gói cao cấp</a>
			<!-- /Premium Plans Settings -->

			<!-- Premium Features Settings -->
            <a class="list-group-item list-group-item-action <?= $pageType == 'premium-feature' ? 'active' : '' ?>" href="<?= route('manage.configuration.read', ['pageType' => 'premium-feature']) ?>">Tính năng</a>
            <!-- /Premium Features Settings -->

            <!-- Email Settings -->
            <a class="list-group-item list-group-item-action <?= $pageType == 'email' ? 'active' : '' ?>" href="<?= route('manage.configuration.read', ['pageType' => 'email']) ?>">Email</a>
			<!-- /Email Settings -->

			<!-- Booster Settings -->
            <a class="list-group-item list-group-item-action <?= $pageType == 'booster' ? 'active' : '' ?>" href="<?= route('manage.configuration.read', ['pageType' => 'booster']) ?>">Tăng cường</a>
			<!-- /Booster Settings -->

        </div>
        <!-- /List group end here -->
    </div>
    <div class="col-lg-9">
        <!-- card start -->
        <div class="card">
            <!-- card body -->
            <div class="card-body">
                <!-- include related view -->
                @include('configuration.'. $pageType)
                <!-- /include related view -->
            </div>
            <!-- /card body -->
        </div>
        <!-- card start -->
    </div>
</div>
