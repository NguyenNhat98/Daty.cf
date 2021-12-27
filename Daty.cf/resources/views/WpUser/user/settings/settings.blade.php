<?php $pageType = request()->pageType ?>
 <!-- card start -->
<div class="card">
	<!-- card body -->
	<div class="card-body">
	<!-- include related view -->
	@include('WpUser.user.settings.'. $pageType)
	<!-- /include related view -->
	</div>
	<!-- /card body -->
</div>
<!-- card start -->

<!-- EXTRA DIV Reason Error On Production Mode-->
</div>
<!-- /EXTRA DIV Reason Error On Production Mode-->
