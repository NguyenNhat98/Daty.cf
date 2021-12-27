@section('page-title', 'Quản lý các gói tín dụng')
@section('head-title', 'Quản lý các gói tín dụng')
@section('keywordName', strip_tags('Quản lý các gói tín dụng'))
@section('keyword', strip_tags('Quản lý các gói tín dụng'))
@section('description', strip_tags('Quản lý các gói tín dụng'))
@section('keywordDescription', strip_tags('Quản lý các gói tín dụng'))
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Quản lý các gói tín dụng</h1>
	<a class="btn btn-primary btn-sm" href="<?= route('manage.credit_package.add.view') ?>" title="Add New Gift">Thêm gói mới</a>
</div>
 <!-- Start of Page Wrapper -->
 <div class="row">
	<div class="col-xl-12 mb-4">
		<div class="card mb-4">
			<div class="card-body table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Hình ảnh</th>
							<th>Tiêu đề</th>
							<th>Ngày tạo</th>
							<th>Giá </th>
							<th>Tín dụng</th>
							<th>Trạng thái</th>
							<th>Hoạt động</th>
						</tr>
					</thead>
					<tbody>
						@if(!__isEmpty($creditPackageData))
							@foreach($creditPackageData as $package)
								<tr id="lw-package-row-<?= $package['_uid'] ?>">
 									<td class="lw-photoswipe-gallery">
										<img src="<?= $package['packageImageUrl'] ?>" class="img-thumbnail lw-item-img-thumbnail lw-photoswipe-gallery-img"/>
									</td>
									<td><?= $package['title'] ?></td>
									<td><?= $package['created_at'] ?></td>
									<td><?= $package['price'] ?></td>
									<td><?= $package['credits'] ?></td>
									<td><?= $package['status'] ?></td>
									<td>
										<div class="btn-group">
											<button type="button" class="btn btn-black dropdown-toggle lw-datatable-action-dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												<i class="fas fa-ellipsis-v"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-right">
											    <a class="dropdown-item" href="<?= route('manage.credit_package.edit.view', ['packageUId' => $package['_uid']]) ?>"><i class="far fa-edit"></i> Sửa</a>
												<a data-callback="onDelete" data-method="post" class="dropdown-item lw-ajax-link-action" href="<?= route('manage.credit_package.write.delete', ['packageUId' => $package['_uid']]) ?>"><i class="fas fa-trash-alt"></i> Xóa</a>
											</div>
										</div>
									</td>
								</tr>
							@endforeach
						@endif
						@if(__isEmpty($creditPackageData))
 							<tr>
                                <td colspan="7" class="text-center">
									Không có hồ sơ.
                                </td>
                            </tr>
						@endif
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- End of Page Wrapper -->
@push('appScripts')
<script>
	function onDelete(response) {
		//check reaction code is 1
		if (response.reaction == 1) {
			//apply class row fade in
			$("#lw-package-row-"+response.data.packageUId).addClass("lw-deleted-row");
		}
	}
</script>
@endpush
