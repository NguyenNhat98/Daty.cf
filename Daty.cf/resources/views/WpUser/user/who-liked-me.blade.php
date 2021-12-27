@section('page-title', 'Người thích tôi')
@section('head-title', 'Người thích tôi')
@section('keywordName', 'Người thích tôi')
@section('keyword', 'Người thích tôi')
@section('description', 'Người thích tôi')
@section('keywordDescription', 'Người thích tôi')
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h5 class="h5 mb-0 text-gray-200">
	<span class="text-primary"><i class="fa fa-heart" aria-hidden="true"></i></span>
		Người thích tôi</h5>
</div>

<!-- liked people container -->
<div class="container-fluid">
	@if(getFeatureSettings('show_like'))
		@if(!__isEmpty($usersData))
		<div class="row row-cols-sm-1 row-cols-md-2 row-cols-lg-4" id="lwWhoLikedUsersContainer">
			@include('WpUser.user.partial-templates.my-liked-users')
		</div>
		@else
			<!-- info message -->
			<div class="alert alert-info">
				Không có người nào thích tôi.
			</div>
			<!-- / info message -->
		@endif
	@else
 		<!-- info message -->
		<div class="alert alert-info">
			Đây là một tính năng cao cấp, để xem ai thích tôi, trước tiên bạn cần mua gói cao cấp.
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
				$("#lwWhoLikedUsersContainer").append(response.data);
			}
		};
	</script>
@endpush
