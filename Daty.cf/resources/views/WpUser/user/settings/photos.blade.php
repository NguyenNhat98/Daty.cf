@section('page-title', 'Ảnh của tôi')
@section('head-title', 'Ảnh của tôi')
@section('keywordName', 'Ảnh của tôi')
@section('keyword', 'Ảnh của tôi')
@section('description', 'Ảnh của tôi')
@section('keywordDescription', 'Ảnh của tôi')
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h4 class="h5 mb-0 text-gray-200">
		<span class="text-primary"><i class="far fa-images"></i></span> Ảnh của tôi
	</h4>
</div>

<div class="card mb-3">
    <div class="card-body">
    @if($photosCount <= 20)
        <input type="file" class="lw-file-uploader" data-instant-upload="true" data-action="<?= route('user.upload_photos') ?>" data-default-image-url="" data-allowed-media='<?= getMediaRestriction('photos') ?>' multiple data-callback="afterFileUpload" data-remove-all-media="true">
    @endif

        <div class="row text-center text-lg-left lw-horizontal-container pl-2 lw-photoswipe-gallery" id="lwUserPhotos">
        </div>
    </div>
</div>


<script type="text/_template" id="lwPhotosContainer">
<% if(!_.isEmpty(__tData.userPhotos)) { %>
    <% _.forEach(__tData.userPhotos, function(item, index) { %>
        <img class="lw-user-photo lw-photoswipe-gallery-img lw-lazy-img" data-img-index="<%= index %>" src="<%= item.image_url %>" alt="">
    <% }); %>
<% } else { %>
Không có ảnh nào được tìm thấy.
<% } %>
</script>

@push('appScripts')
<script>

    var userPhotos = <?= json_encode($userPhotos) ?>;
    function preparePhotosList() {
        var photoContainer = _.template($('#lwPhotosContainer').html()),
            compiledHtml = photoContainer({'userPhotos': userPhotos});
            $('#lwUserPhotos').html(compiledHtml);
    }
    preparePhotosList();

    // After successfully uploaded file
    function afterFileUpload(responseData) {
        if (!_.isUndefined(responseData.data.stored_photo)) {
            userPhotos.push(responseData.data.stored_photo);
            preparePhotosList();
        }
    }
</script>
@endpush
