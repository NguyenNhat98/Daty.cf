<!-- Sidebar -->
<ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <li>
        <a class="sidebar-brand d-flex align-items-center bg-dark" href="<?= url('/home') ?>">

            <img class="lw-logo-img d-sm-none d-none d-md-block" src="<?= getStoreSettings('logo_image_url') ?>"
                    alt="<?= getStoreSettings('name') ?>">
            <h1><?= getStoreSettings('name') ?></h1>
        </a>
    </li>
     <li class="nav-item mt-2 d-sm-block d-md-none">
            <a href class="nav-link" onclick="getChatMessenger('<?= route('user.read.all_conversation') ?>', true)" id="lwAllMessageChatButton" data-chat-loaded="false" data-toggle="modal" data-target="#messengerDialog">
                <i class="far fa-comments"></i>
                <span>Tin nhắn</span>
            </a>
		</li>
		<!-- Notification Link -->
        <li class="nav-item dropdown no-arrow mx-1 d-sm-block d-md-none">
            <a class="nav-link dropdown-toggle lw-ajax-link-action" href="<?= route('user.notification.write.read_all_notification') ?>" data-callback="onReadAllNotificationCallback" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-method="post">
                <i class="fas fa-bell fa-fw"></i>
                <span>Thông báo</span>
                <span class="badge badge-danger badge-counter" id="lwNotificationCount"><?= getNotificationList()['notificationCount'] ?></span>
            </a>
            <!-- Dropdown - Alerts -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                    Thông báo
				</h6>
				<!-- Notification block -->
				@if(!__isEmpty(getNotificationList()['notificationData']))
					<span id="lwNotificationList">
					@foreach(getNotificationList()['notificationData'] as $notification)

						<!-- show all notification list -->
						<a class="dropdown-item d-flex align-items-center" href="<?= $notification['actionUrl'] ?>">
							<div>
								<div class="small text-gray-500"><?= $notification['created_at'] ?></div>
								<span class="font-weight-bold"><?= $notification['message'] ?></span>
							</div>
						</a>
						<!-- show all notification list -->
					@endforeach
					</span>
					<!-- show all notification link -->
					<a class="dropdown-item text-center small text-gray-500" href="<?= route('user.notification.read.view') ?>" id="lwShowAllNotifyLink">Show All Notifications</a>
					<!-- /show all notification link -->
				@else
					<!-- info message -->
					<a class="dropdown-item text-center small text-gray-500">Không có thông báo</a>
					<!-- /info message -->
				@endif
                <!-- /Notification block -->
            </div>
        </li>
		<!-- /Notification Link -->

        <!-- Nav Item - Messages -->
        <li class="nav-item d-sm-block d-md-none">
            <a class="nav-link" href="<?= route('user.credit_wallet.read.view') ?>">
                <i class="fas fa-coins fa-fw mr-2"></i>
                <span>Ví tíền</span>
                <span class="badge badge-success badge-counter"><?= totalUserCredits() ?></span>
            </a>
        </li>

        <!-- Nav Item - Messages -->
        <li class="nav-item d-sm-block d-md-none">
            <a class="nav-link" href  data-toggle="modal" data-target="#boosterModal">
                <i class="fas fa-bolt fa-fw mr-2"></i>
                <span>Tăng cường hồ sơ</span>
                <span id="lwBoosterTimerCountDownOnSB"></span>
            </a>
        </li>
	@if(isset($is_profile_page) and ($is_profile_page === true))
		@if(!$isBlockUser and !$blockByMeUser)
			@stack('sidebarProfilePage')
		@endif
    @endif
    <hr class="sidebar-divider mt-2 mb-2 d-sm-block d-md-none">
    <!-- Heading -->
    <li class="mt-2 nav-item <?= makeLinkActive('home_page')?>">
        <a class="nav-link" href="<?= route('home_page') ?>">
            <i class="fas fa-home"></i>
            <span><?= __tr('Trang chủ') ?></span>
        </a>
    </li>

    <li class="nav-item <?= makeLinkActive('user.read.find_matches') ?>">
        <a class="nav-link"
            href="<?= route('user.read.find_matches') ?>">
            <i class="fas fa-search"></i>
            {{--<span><?= __tr('Find Matches') ?></span>--}}
            <span><?= __tr('Tìm phù hợp') ?></span>
        </a>
    </li>
    <li class="nav-item <?= makeLinkActive('user.profile_view') ?>">
        <a class="nav-link"
            href="<?= route('user.profile_view', ['username' => getUserAuthInfo('profile.username')]) ?>">
            <i class="fas fa-user"></i>
{{--
            <span><?= __tr('My Profile') ?></span>
--}}
            <span><?= __tr('Thông tin') ?></span>

        </a>
    </li>
    <li class="nav-item <?= makeLinkActive('user.photos_setting') ?>">
        <a class="nav-link"
            href="<?= route('user.photos_setting', ['username' => getUserAuthInfo('profile.username')]) ?>">
            <i class="far fa-images"></i>
{{--
            <span><?= __tr('My Photos') ?></span>
--}}
            <span><?= __tr('Ảnh của tôi') ?></span>

        </a>
    </li>
    <!-- Divider -->
    <hr class="sidebar-divider mt-2 mb-2">
    <li class="nav-item <?= makeLinkActive('user.who_liked_me_view') ?>">
        <a class="nav-link" href="<?= route('user.who_liked_me_view') ?>">
            <i class="fa fa-thumbs-up" aria-hidden="true"></i>
{{--
            <span><?= __tr('Who likes me') ?>
--}}
            <span>Người thích tôi

                <?php
                $featurePlans = getStoreSettings('feature_plans');
                $showLike = $featurePlans['show_like']['select_user'];
            ?>
            @if($showLike == 2)
            <span class="lw-premium-feature-badge"></span></span>
            @endif
        </a>
    </li>
    <li class="nav-item <?= makeLinkActive('user.mutual_like_view') ?>">
        <a class="nav-link" href="<?= route('user.mutual_like_view') ?>">
            <i class="fa fa-users"></i>
            {{--<span><?= __tr('Mutual Likes') ?></span>--}}
            <span>Kết đôi</span>
        </a>
    </li>
    <li class="nav-item <?= makeLinkActive('user.my_liked_view') ?>">
        <a class="nav-link" href="<?= route('user.my_liked_view') ?>">
            <i class="fas fa-fw fa-heart"></i>
{{--
            <span><?= __tr('My Likes') ?></span>
--}}
            <span>Người tôi thích</span>

        </a>
    </li>
    <li class="nav-item <?= makeLinkActive('user.my_disliked_view') ?>">
        <a class="nav-link" href="<?= route('user.my_disliked_view') ?>">
            <i class="fas fa-fw fa-heart-broken"></i>
{{--
            <span><?= __tr('My Dislikes') ?></span>
--}}
            <span>Người không thích</span>

        </a>
    </li>
    <li class="nav-item  <?= makeLinkActive('user.profile_visitors_view') ?>">
        <a class="nav-link" href="<?= route('user.profile_visitors_view') ?>">
            <i class="fa fa-user" aria-hidden="true"></i>
{{--
            <span><?= __tr('Visitors') ?></span>
--}}

            <span>Truy cập</span>

        </a>
    </li>
    <li class="nav-item  <?= makeLinkActive('user.notification.read.view') ?>">
        <a class="nav-link" href="<?= route('user.notification.read.view') ?>">
            <i class="fa fa-bell" aria-hidden="true"></i>
{{--
            <span><?= __tr('Notifications') ?></span>
--}}
            <span>Thông báo</span>

        </a>
    </li>
    <li class="nav-item <?= makeLinkActive('user.read.block_user_list') ?>">
        <a class="nav-link" href="<?= route('user.read.block_user_list') ?>">
            <i class="fas fa-ban"></i>
{{--
            <span><?= __tr('Blocked Users') ?></span>
--}}

            <span>Người bị chặn</span>

        </a>
    </li>

</ul>
<!-- End of Sidebar -->
