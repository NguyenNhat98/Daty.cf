@section('page-title','Người dùng bị chặn')
@section('head-title', 'Người dùng bị chặn')
@section('keywordName','Người dùng bị chặn')
@section('keyword', 'Người dùng bị chặn')
@section('description','Người dùng bị chặn')
@section('keywordDescription', 'Người dùng bị chặn')
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h5 class="h5 mb-0 text-gray-200">
		<span class="text-primary"><i class="fas fa-ban"></i></span> Người dùng bị chặn
	</h5>
</div>

<!-- blocked users -->
<div class="container-fluid">
	@if(!__isEmpty($usersData))
	<div class="row" id="lwBlockedUsersContainer">
		@include('WpUser.user.partial-templates.blocked-users')
	</div>
	@else
		<!-- info message -->
		<div class="alert alert-info">
            Không có người dùng bị chặn.
		</div>
		<!-- / info message -->
	@endif
</div>
<!-- / blocked users -->

@push('appScripts')
	<script type="text/javascript">
		function loadNextLikedUsers(response) {
			if (response.data != '') {
				$("#lwNextPageLink").remove();
				$("#lwBlockedUsersContainer").append(response.data);
			}
		};
	</script>
@endpush

@push('appScripts')
<script>
	//get block user data
	var blockUserData = JSON.parse('<?= json_encode($usersData) ?>');

	//if block user length is zero then show info message
	if (blockUserData.length == 0) {
		$("#lwShowInfoMessage").show();
	} else {
		$("#lwShowInfoMessage").hide();
	}

	//on un block user callback
	function onUnblockUser(response) {
		//check reaction code is 1
		if (response.reaction == 1) {
			var requestData = response.data;

			//apply class row fade in
			$("#lwBlockUser_"+requestData.blockUserUid).hide();
			if (requestData.blockUserLength == 0) {
				$("#lwShowInfoMessage").show();
			}
		}
    }
</script>
@endpush
