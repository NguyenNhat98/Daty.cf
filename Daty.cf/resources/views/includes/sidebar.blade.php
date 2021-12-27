<!-- Sidebar -->
<ul class="navbar-nav bg-dark sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center" href="<?= route('user.profile_view', ['username' => getUserAuthInfo('profile.username')]) ?>">
        <img class="lw-logo-img" src="<?= getStoreSettings('logo_image_url') ?>" alt="<?= getStoreSettings('name') ?>">
   <h1><?= getStoreSettings('name') ?></h1>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item <?= makeLinkActive('manage.dashboard') ?> mt-2">
        <a class="nav-link" href="<?= route('manage.dashboard') ?>">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Bảng điều khiển</span>
        </a>
    </li>
	<li class="nav-item <?= makeLinkActive('manage.item.gift.view') ?>">
		<a class="nav-link" href="<?= route('manage.item.gift.view') ?>">
            <i class="fas fa fa-gift"></i>
            <span>Quà tặng</span>
		</a>
	</li>
	<li class="nav-item <?= makeLinkActive('manage.item.sticker.view') ?>">
		<a class="nav-link" href="<?= route('manage.item.sticker.view') ?>">
            <i class="fas fa fa-sticky-note"></i>
            <span>Hình dán</span>
		</a>
	</li>
	<li class="nav-item <?= makeLinkActive('manage.credit_package.read.list') ?>">
		<a class="nav-link" href="<?= route('manage.credit_package.read.list') ?>">
            <i class="fas fa-box"></i>
            <span>Gói tín dụng</span>
		</a>
	</li>
	<li class="nav-item <?= makeLinkActive('manage.abuse_report.read.list') ?>">
		<a class="nav-link" href="<?= route('manage.abuse_report.read.list', ['status' => 1]) ?>">
            <i class="fas fa-flag"></i>
            <span>Báo cáo lạm dụng</span>
        </a>
    </li>
	<li class="nav-item <?= makeLinkActive('manage.user.view_list') ?>">
        <a class="nav-link" href="<?= route('manage.user.view_list', ['status' => 1]) ?>">
            <i class="fas fa-users"></i>
            <span>Người dùng</span>
        </a>
    </li>
    <li class="nav-item <?= makeLinkActive('manage.user.photos_list') ?>">
        <a class="nav-link" href="<?= route('manage.user.photos_list') ?>">
            <i class="fas fa-users"></i>
            <span>Tải lên của người dùng</span>
        </a>
    </li>
	<li class="nav-item <?= makeLinkActive('manage.configuration.read') ?>">
        <a class="nav-link" href="<?= route('manage.configuration.read', ['pageType' => 'general']) ?>">
            <i class="fas fa-cogs"></i>
            <span>Cài đặt</span>
		</a>
	</li>
	<li class="nav-item <?= makeLinkActive('manage.financial_transaction.read.view_list') ?>">
		<a class="nav-link" href="<?= route('manage.financial_transaction.read.view_list', ['transactionType' => 'live']) ?>">
 			<i class="fas fa-university"></i>
            <span>Giao dịch tài chính</span>
		</a>
	</li>

	<li class="nav-item <?= makeLinkActive('manage.fake_users.read.generator_options') ?>">
        <a class="nav-link" href="<?= route('manage.fake_users.read.generator_options') ?>">
            <i class="fas fa-user-plus"></i>
            <span>Tạo người dùng giả mạo</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" title="Nếu bạn đã thực hiện các thay đổi không phản ánh liên kết này có thể giúp xóa tất cả bộ nhớ cache." href="<?= route('manage.configuration.clear_cache', []).'?redirectTo='.base64_encode(Request::fullUrl()); ?>">
            <i class="fas fa-broom"></i>
            <span>Làm sạch bộ nhớ đệm </span>
        </a>
    </li>
    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>
</ul>
<!-- End of Sidebar -->
