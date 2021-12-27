@section('page-title', 'Người không thích')
@section('head-title', 'Người không thích')
@section('keywordName', 'Người không thích')
@section('keyword', 'Người không thích')
@section('description', 'Người không thích')
@section('keywordDescription', 'Người không thích')
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h5 class="h5 mb-0 text-gray-200">
	<span class="text-primary"><i class="fas fa-fw fa-heart-broken" aria-hidden="true"></i></span>
		Người không thích</h5>
</div>

<!-- liked people container -->
<div class="container-fluid">
	@if(!__isEmpty($usersData))
	<div class="row row-cols-sm-1 row-cols-md-2 row-cols-lg-4" id="lwDisLikedUsersContainer">
		@include('WpUser.user.partial-templates.my-liked-users')
	</div>
	@else
		<!-- info message -->
		<div class="alert alert-info">
			Không có người dùng nào tôi không thích.
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
				$("#lwDisLikedUsersContainer").append(response.data);
			}
		};
	</script>
@endpush
