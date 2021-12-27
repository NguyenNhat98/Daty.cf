<!-- include header -->
@include('includes.header')
<!-- /include header -->

<body id="page-top lw-admin-section">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- include sidebar -->
        @if(isLoggedIn())
            @include('includes.sidebar')
        @endif
        <!-- /include sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column bg-gray-900">
            <div id="content">
                <!-- include top bar -->
                @if(isLoggedIn())
                    @include('includes.top-bar')
                @endif
                <!-- /include top bar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    @if(isset($pageRequested))
                        <?php echo $pageRequested; ?>
                    @endif
                </div>
                <!-- /.container-fluid -->
            </div>

            <!-- include footer -->
            @include('includes.footer')
            <!-- /include footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- /Scroll to Top Button-->

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Sẵn sàng dăng xuất ?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                	Chọn "Đăng xuất" bên dưới nếu bạn đã sẵn sàng kết thúc phiên hiện tại của mình.

                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">THOÁT</button>
                    <a class="btn btn-primary" href="<?= route('user.logout') ?>">ĐĂNG XUẤT</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /Logout Modal-->
</body>
</html>
