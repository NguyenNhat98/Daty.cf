@foreach($usersData as $user)
<div class="col-sm-3 mb-3 mr-4 card text-center lw-user-thumbnail-block <?= (isset($user['isPremiumUser']) and $user['isPremiumUser'] == true) ? 'lw-has-premium-badge' : '' ?>" id="lwBlockUser_<?= $user['_uid'] ?>">
	<a href="<?= route('user.profile_view', ['username' => $user['username']]) ?>">
			<img data-src="<?= imageOrNoImageAvailable($user['userImageUrl']) ?>" class="lw-user-thumbnail lw-lazy-img"/>
	</a>
	<div class="card-title">
		<h5>
			<a class="text-secondary" href="<?= route('user.profile_view', ['username' => $user['username']]) ?>">
				<?= $user['userFullName'] ?>
			</a>
			<?= $user['detailString'] ?> <br>
            @if($user['city'])
                <?= $user['city'] ?>
            @endif

		</h5>
		<span><?= $user['created_at'] ?></span><br>
		<button class="btn btn-primary btn-sm lw-ajax-link-action" data-callback="onUnblockUser" data-method="post" href="<?= route('user.write.unblock_user', ['userUid' => $user['userUId']]) ?>">Mở khóa</button>
	</div>
</div>
@endforeach

@if(!__isEmpty($nextPageUrl))
<a href="<?= $nextPageUrl ?>" id="lwNextPageLink" class="col-sm-12 alert alert-dark text-center bg-dark text-secondary border-0 mt-5 lw-ajax-link-action" data-method="get" data-callback="loadNextLikedUsers">Tải thêm</a>
@else
<div class="col-sm-12 alert alert-dark text-center bg-dark text-secondary border-0 mt-5">Có vẻ như bạn đã đến cuối trang</div>
@endIf
