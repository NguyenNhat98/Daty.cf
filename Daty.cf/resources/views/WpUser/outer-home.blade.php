<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title><?= getStoreSettings('name') ?></title>

		<?= __yesset([
            'dist/css/public-assets-app*.css',
            'dist/fa/css/all.min.css',
			'dist/css/home*.css'
		], true) ?>
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">

    <link rel="shortcut icon" href="<?= __yesset('favicon.ico') ?>" type="image/x-icon">
    <link rel="icon" href="<?= __yesset('favicon.ico') ?>" type="image/x-icon">

</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">
            <img class="lw-logo-img" src="<?= getStoreSettings('logo_image_url') ?>" alt="<?= getStoreSettings('name') ?>">

      </a>
        <h1><?= getStoreSettings('name') ?></h1>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#search">TìM HOÀN HẢO</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#premium">CAO CẤP</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#features">ĐẶC TRƯNG</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">LIÊN HỆ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= route('user.login') ?>">ĐĂNG NHẬP</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="masthead">
    <div class="container d-flex h-100 align-items-center pt-5">
      <div class="mx-auto text-center">
        <h1 class="mx-auto my-0 text-uppercase">TÌM KIẾM TÌNH YÊU CỦA BẠN</h1>
        <h2 class="text-white-50 mx-auto mt-2 mb-5"><?= __tr('Một điểm đến hoàn hảo để tìm kiếm tình yêu của bạn', [
            '__siteName__' =>  getStoreSettings('name')
        ]) ?></strong></h2>
        <a href="#search" class="btn btn-primary js-scroll-trigger">BẮT ĐẦU</a>
{{--
        <p class="mt-5 pt-5 text-white-50">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis rem id corporis, enim nihil vel nulla minus magni, dolore sequi placeat. Dolor doloribus, eum nisi non magni libero tempora maxime.</p>
--}}
      </div>
    </div>
  </header>
  </div>

  <!-- contact Section -->
  <section id="search" class="lw-search-section">
    <div class="container">
      <div class="row">
        <div class="col-md-10 col-lg-8 mx-auto text-center">

          <i class="fa fa-search fa-4x mb-2 text-white"></i>
          <h2 class="text-white mb-5">TÌM KIẾM HOÀN HẢO</h2>
          <form class="d-flex" method="post" action="<?= route('search_matches') ?>">
              <div class="input-group">
                <input type="hidden" name="_token" id="csrf-token" value="<?= csrf_token() ?>" />
                <select name="looking_for" class="custom-select form-control">
                  <b> <option disabled>GIỚI TÍNH</option></b>
                    <option value="all" selected>Tất cả</option>
                    @foreach(configItem('user_settings.gender') as $genderKey => $gender)
                    <option value="<?= $genderKey ?>"><?= $gender ?></option>
                    @endforeach
                </select>
                <select name="min_age" class="custom-select form-control">
                    <option disabled>Tuổi từ</option>
                   {{-- @foreach(range(18,70) as $age)
                    <option value="<?= $age ?>" <?= $age == 18 ? 'selected' : '' ?>><?= __tr('__translatedAge__', [
                            '__translatedAge__' => $age
                        ]) ?></option>
                    @endforeach--}}
                  @foreach(range(18,60) as $age)
                    <option value="<?= $age ?>" <?= $age == 18 ? 'selected' : '' ?>><?= $age ?></option>
                      ]) ?></option>
                  @endforeach


                </select>
                <select name="max_age" class="custom-select form-control">
                    <option disabled>Tuổi đến</option>
                    @foreach(range(18,60) as $age)
                    <option value="<?= $age ?>" <?= $age == 30 ? 'selected' : '' ?>><?= $age ?></option>
                    @endforeach
                </select>





                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!-- premium Section -->
  <section id="premium" class="premium-section text-center parallax-window" data-parallax="scroll" data-image-src="<?= asset('imgs/home/caocap.jpg') ?>">
    <div class="container">
      <div class="row card lw-transparent-card">
        <div class="col-lg-8 mx-auto pb-4">
            <h2>
                <i class="fas fa-heart text-white"></i>
            </h2>
          <h2 class="text-white mb-4">TÍNH NĂNG CAO CẬP</h2>
          <div class="text-white-50">
           <h5 class="lw-feature-items">Duyệt ở chế độ ẩn danh, Xem ai thích bạn, Xem lượt thích Thông báo, Ưu tiên trong kết quả tìm kiếm, Ưu tiên cho người dùng ngẫu nhiên, Gọi thoại qua tin nhắn, Gọi video qua tin nhắn, Gặp gỡ người dùng không giới hạn, Giảm giá trong Hình dán & Quà tặng,...</h5>
        </div>
      </div>
    </div>
  </section>

  <!-- features Section -->
  <section id="features" class="features-section bg-dark">
    <div class="container">

      <!-- Featured features Row -->
      <div class="row align-items-center no-gutters mb-4 mb-lg-5">
        <div class="col-xl-8 col-lg-7">
          <img class="img-fluid mb-3 mb-lg-0" src="imgs/home/dangkyhoso.jpg" alt="">
        </div>
        <div class="col-xl-4 col-lg-5 text-white pl-3">
          <div class="featured-text text-center text-lg-left">
            <h4><i class="fas fa-user"></i> Đăng ký</h4>
            <p class="text-white-50 mb-0">Đăng ký miễn phí và nhanh chóng</p>
          </div>
          <div class="featured-text text-center text-lg-left mt-4">
            <h4><i class="fas fa-id-card"></i> Hồ sơ</h4>
            <p class="text-white-50 mb-0">Hoàn thành hồ sơ thông tin của bạn</p>
          </div>
          <div class="featured-text text-center text-lg-left mt-4">
            <h4><i class="fas fa-search"></i>Tìm kiếm</h4>
            <p class="text-white-50 mb-0">Tìm kiếm được những người mà bạn đang muốn tìm kiếm</p>
          </div>
        </div>
      </div>

      <!-- features Two Row -->
      <div class="row justify-content-center no-gutters">
        <div class="col-lg-6">
          <img class="img-fluid" src="imgs/home/gapgo.jpg" alt="">
        </div>
        <div class="col-lg-6 order-lg-first pr-3">
          <div class="bg-dark text-center h-100 features">
            <div class="d-flex h-100">
              <div class="features-text w-100 my-auto text-center text-lg-right">
                <h4 class="text-white">Gặp gỡ</h4>
                <p class="mb-0 text-white-50">Gặp gỡ người đó, bạn có thể quan tâm</p>
                <hr class="d-none d-lg-block mb-0 mr-0">
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- features One Row -->
      <div class="row justify-content-center no-gutters mb-5 mb-lg-0">
        <div class="col-lg-6">
          <img class="img-fluid" src="imgs/home/hoso.jpg" alt="">
        </div>
        <div class="col-lg-6 pl-3">
          <div class="bg-dark text-center h-100 features">
            <div class="d-flex h-100">
              <div class="features-text w-100 my-auto text-center text-lg-left">
                <h4 class="text-white">Hoàn thành hồ sơ của bạn</h4>
                <p class="mb-0 text-white-50">Ví dụ về nơi bạn có thể đặt hình ảnh của một đối tượng địa lý hoặc bất kỳ thứ gì khác, cùng với mô tả..</p>
                <hr class="d-none d-lg-block mb-0 ml-0">
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

  <!-- Contact Section -->
  <section id="contact" class="contact-section bg-dark">
    <div class="container">

      <div class="row">

        <div class="col-md-4 mb-3 mb-md-0">
          <div class="card py-4 h-100">
            <div class="card-body text-center">
              <i class="fas fa-map-marked-alt text-primary mb-2"></i>
              <h4 class="text-uppercase m-0">Địa chỉ</h4>
              <hr class="my-4">
              <div class="small text-white-50"><a href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+H%E1%BB%8Dc+Th%E1%BB%A7y+L%E1%BB%A3i/@21.0073878,105.822535,17z/data=!3m1!4b1!4m5!3m4!1s0x3135ac8109765ba5:0xd84740ece05680ee!8m2!3d21.0073828!4d105.8247237?hl=vi-VN">
                  Đại Học Thủy Lợi</a></div>
            </div>
          </div>
        </div>

        <div class="col-md-4 mb-3 mb-md-0">
          <div class="card py-4 h-100">
            <div class="card-body text-center">
              <i class="fas fa-envelope text-primary mb-2"></i>
              <h4 class="text-uppercase m-0">Email</h4>
              <hr class="my-4">
              <div class="small text-white-50">
                <a href="#">NhatNV62@wru.vn</a>

              </div>
            </div>
          </div>
        </div>

        <div class="col-md-4 mb-3 mb-md-0">
          <div class="card py-4 h-100">
            <div class="card-body text-center">
              <i class="fas fa-mobile-alt text-primary mb-2"></i>
              <h4 class="text-uppercase m-0">Số điện thoại</h4>
              <hr class="my-4">
              <div class="small text-white-50"><a href="#">+84 926 053 033</a></div>
            </div>
          </div>
        </div>
      </div>

      <div class="social d-flex justify-content-center">
        <a href="#" class="mx-2">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="#" class="mx-2">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="#" class="mx-2">
          <i class="fab fa-github"></i>
        </a>
      </div>

    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-dark small text-center text-white-50">
    <div class="container">
      Bản quyền &copy; thuộc về Daty
    </div>
  </footer>
<script src="https://js.pusher.com/5.0/pusher.min.js"></script>
  <?= __yesset([
    'dist/js/vendorlibs-public.js',
    // 'dist/js/vendorlibs-datatable.js',
    // 'dist/js/vendorlibs-photoswipe.js',
    // 'dist/js/common-app.*.js',
    // 'dist/js/vendor-second.js',
    // 'dist/js/vendorlibs-smartwizard.js'
], true) ?>

<script>
(function($) {
  "use strict"; // Start of use strict

  // Smooth scrolling using jQuery easing
  $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: (target.offset().top - 70)
        }, 1000, "easeInOutExpo");
        return false;
      }
    }
  });

  // Closes responsive menu when a scroll trigger link is clicked
  $('.js-scroll-trigger').click(function() {
    $('.navbar-collapse').collapse('hide');
  });

  // Activate scrollspy to add active class to navbar items on scroll
  $('body').scrollspy({
    target: '#mainNav',
    offset: 100
  });

  // Collapse Navbar
  var navbarCollapse = function() {
    if ($("#mainNav").offset().top > 100) {
      $("#mainNav").addClass("navbar-shrink");
    } else {
      $("#mainNav").removeClass("navbar-shrink");
    }
  };
  // Collapse now if page is not at top
  navbarCollapse();
  // Collapse the navbar when page is scrolled
  $(window).scroll(navbarCollapse);

})(jQuery); // End of use strict

</script>

</body>

</html>
