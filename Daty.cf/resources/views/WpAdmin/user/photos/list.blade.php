@section('page-title', 'Quản lý tải lên của người dùng')
@section('head-title', 'Quản lý tải lên của người dùng')
@section('keywordName', strip_tags('Quản lý tải lên của người dùng'))
@section('keyword', strip_tags('Quản lý tải lên của người dùng'))
@section('description', strip_tags('Quản lý tải lên của người dùng'))
@section('keywordDescription', strip_tags('Quản lý tải lên của người dùng'))
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Quản lý tải lên của người dùng</h1>
</div>
<!-- /Page Heading -->

<div class="row">
	<div class="col-xl-12">
        <!-- card -->
		<div class="card mb-4">
            <!-- card body -->
			<div class="card-body">
				<!-- table start -->
				<table class="table table-hover" id="lwManageUserPhotosTable">
					<!-- table headings -->
					<thead>
						<tr>
							<th class="lw-dt-nosort">Hình ảnh </th>
							<th>Họ và tên</th>
							<th>Kiểu</th>
							<th>Ngày tạo</th>
							<th>Hoạt động</th>
						</tr>
					</thead>
					<!-- /table headings -->
					<tbody class="lw-datatable-photoswipe-gallery"></tbody>
				</table>
                <!-- table end -->
			</div>
            <!-- /card body -->
		</div>
        <!-- /card -->
	</div>
</div>
<!-- User Soft delete Container -->
<div id="lwPhotoDeleteContainer" style="display: none;">
    <h3>Bạn có chắc không!</h3>
    <strong>Bạn muốn xóa ảnh này ?</strong>
</div>
<!-- User Soft delete Container -->

<script type="text/_template" id="usersProfilePictureTemplate">
	<%  if(__tData.type == 'photo') { %>
		<img class="lw-datatable-profile-picture lw-dt-thumbnail lw-photoswipe-gallery-img lw-lazy-img" src="<?= noThumbImageURL() ?>" data-src="<%= __tData.profile_image %>">
	<%  } else if(__tData.type == 'profile') {  %>
		<img class="lw-datatable-profile-picture lw-dt-thumbnail lw-photoswipe-gallery-img lw-lazy-img" src="<?= noThumbImageURL() ?>" data-src="<%= __tData.profile_image %>">
	<%  } else if(__tData.type == 'cover') {  %>
		<img class="lw-datatable-profile-picture lw-dt-thumbnail lw-photoswipe-gallery-img lw-lazy-img" src="<?= noThumbCoverImageURL() ?>" data-src="<%= __tData.profile_image %>">
	<%  }  %>
</script>
<script type="text/_template" id="imageTypeTemplate">
	<%  if(__tData.type == 'photo') { %>
    Ảnh đã tải lên
	<%  } else if(__tData.type == 'profile') {  %>
    Ảnh hồ sơ
	<%  } else if(__tData.type == 'cover') {  %>
    Ảnh bìa
	<%  }  %>

</script>

<!-- Pages Action Column -->
<script type="text/_template" id="actionColumnTemplate">

	<a class="btn btn-danger btn-sm  lw-ajax-link-action-via-confirm" data-confirm="#lwPhotoDeleteContainer" data-method="post" data-action="<%= __tData.deleteImageUrl %>" data-callback="onSuccessAction" href data-method="post"><i class="fas fa-trash-alt"></i> Xóa</a>

</script>
<!-- Pages Action Column -->

<!-- Title Column -->
<script type="text/_template" id="titleTmplate">

	<a target="_blank" href="<%= __tData.profile_url %>"><%= __tData.full_name %></a>

</script>
<!-- Title Column -->

@push('appScripts')
<script>

	var dtColumnsData = [
        {
            "name"      : "_uid",
            "template"  : '#usersProfilePictureTemplate',
            "searchable" : false,
            "orderable" : false
        },
        {
            "name"      : "first_name",
            "orderable" : true,
            "searchable" : true,
            "template"  : '#titleTmplate',
        },
        {
            "name"      : "type",
            "orderable" : false,
            "searchable" : false,
            "template"  : '#imageTypeTemplate',
        },
        {
            "name"      : "updated_at",
            "orderable" : true,
            "searchable" : false
        },
		{
            "name"      : "action",
            "orderable" : false,
            "searchable" : false,
            "template"  : '#actionColumnTemplate'
        }
    ],
    dataTableInstance;

    // Perform actions after delete / restore / block
	onSuccessAction = function (response) {
		reloadDT(dataTableInstance);
	};

	//for users list
    fetchUserPhotos = function () {
    	dataTableInstance = dataTable('#lwManageUserPhotosTable', {
	        url         : "<?= route('manage.user.read.photos_list') ?>",
	        dtOptions   : {
	            "searching": true,
	            "order": [[ 3, 'desc' ]],
	            "pageLength" : 25,
	            "drawCallback": function() {
					applyLazyImages();
				}
	        },
	        columnsData : dtColumnsData,
	        scope       : this
	    });
    };

    fetchUserPhotos();
</script>
@endpush
