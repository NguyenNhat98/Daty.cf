@section('page-title', 'Người tôi thích')
@section('head-title', 'Người tôi thích')
@section('keywordName', 'Người tôi thích')
@section('keyword', 'Người tôi thích')
@section('description', 'Người tôi thích')
@section('keywordDescription', 'Người tôi thích')
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h5 class="h5 mb-0 text-gray-200">
	<span class="text-primary"><i class="fa fa-heart" aria-hidden="true"></i></span>
	Người tôi thích</h5>
</div>

<!-- liked people container -->
<div class="container-fluid">
	@if(!__isEmpty($usersData))
	<div class="row row-cols-sm-1 row-cols-md-2 row-cols-lg-4" id="lwLikedUsersContainer">
		@include('WpUser.user.partial-templates.my-liked-users')
	</div>
	@else
		<!-- info message -->
		<div class="alert alert-info">
			Không có bất kỳ người dùng nào tôi thích.
		</div>
		<!-- / info message -->
	@endif
</div>
<!-- / liked people container -->

@push('appScripts')
	<script type="text/javascript">
		function loadNextLikedUsers(response) {
			if (response.data != '') {
				$("#lwNextPageLink").remove();
				$("#lwLikedUsersContainer").append(response.data);
			}
		};
	</script>
@endpush
