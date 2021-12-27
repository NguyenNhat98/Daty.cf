@section('page-title', 'Truy cập')
@section('head-title', 'Truy cập')
@section('keywordName', 'Truy cập')
@section('keyword', 'Truy cập')
@section('description', 'Truy cập')
@section('keywordDescription', __tr('Visitors'))
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h5 class="h5 mb-0 text-gray-200">
{{--
		<span class="text-primary"><i class="far fa-user"></i></span> <?= __tr('Visitors') ?>
--}}
		<span class="text-primary"><i class="far fa-user"></i></span> Truy cập

	</h5>
</div>

<!-- profile visitors container -->
<div class="container-fluid">
	@if(!__isEmpty($usersData))
	<div class="row row-cols-sm-1 row-cols-md-2 row-cols-lg-4" id="lwProfileVisitorsContainer">
		@include('WpUser.user.partial-templates.my-liked-users')
	</div>
	@else
		<!-- info message -->
		<div class="alert alert-info">
			Không có lượt truy cập nào.
		</div>
		<!-- / info message -->
	@endif
</div>
<!-- / profile visitors container -->

@push('appScripts')
	<script type="text/javascript">
		function loadNextLikedUsers(response) {
			if (response.data != '') {
				$("#lwNextPageLink").remove();
				$("#lwProfileVisitorsContainer").append(response.data);
			}
		};
	</script>
@endpush
