@section('page-title', 'Quản lý quà tặng')
@section('head-title', 'Quản lý quà tặng')
@section('keywordName', strip_tags('Quản lý quà tặng'))
@section('keyword', strip_tags('Quản lý quà tặng'))
@section('description', strip_tags('Quản lý quà tặng'))
@section('keywordDescription', strip_tags('Quản lý quà tặng'))
@section('page-image', getStoreSettings('logo_image_url'))
@section('twitter-card-image', getStoreSettings('logo_image_url'))
@section('page-url', url()->current())

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-200">Quản lý quà tặng</h1>
	<a class="btn btn-primary btn-sm" href="<?= route('manage.item.gift.add.view') ?>" title="Add New Gift">Thêm quà tặng</a>
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
							<th>Được tạo</th>
							<th>Giá bình thường (VND)</th>
							<th>Giá đặc biệt (VND)</th>
							<th>Trạng thái</th>
							<th>Hoạt động</th>
						</tr>
					</thead>
					<tbody>
						@if(!__isEmpty($giftListData))
							@foreach($giftListData as $giftData)
								<tr id="lw-gift-row-<?= $giftData['_uid'] ?>">
 									<td class="lw-photoswipe-gallery">
										<img src="<?= $giftData['giftImageUrl'] ?>" class="img-thumbnail lw-item-img-thumbnail lw-photoswipe-gallery-img"/>
									</td>
									<td><?= $giftData['title'] ?></td>
									<td><?= $giftData['created_at'] ?></td>
									<td><?= $giftData['normal_price'] ?></td>
									<td><?= $giftData['premium_price'] ?></td>
									<td><?= $giftData['status'] ?></td>
									<td>
										<div class="btn-group">
											<button type="button" class="btn btn-black dropdown-toggle lw-datatable-action-dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												<i class="fas fa-ellipsis-v"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-right">
											    <a class="dropdown-item" href="<?= route('manage.item.gift.edit.view', ['giftUId' => $giftData['_uid']]) ?>"><i class="far fa-edit"></i> Sửa</a>
												<a data-callback="onDelete" data-method="post" class="dropdown-item lw-ajax-link-action" href="<?= route('manage.item.gift.write.delete', ['giftUId' => $giftData['_uid']]) ?>"><i class="fas fa-trash-alt"></i> Xóa</a>
											</div>
										</div>
									</td>
								</tr>
							@endforeach
						@endif
						@if(__isEmpty($giftListData))
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
			$("#lw-gift-row-"+response.data.giftUId).addClass("lw-deleted-row");
		}
	}
</script>
@endpush
