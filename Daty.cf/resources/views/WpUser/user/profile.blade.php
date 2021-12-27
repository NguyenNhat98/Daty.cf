@section('page-title', strip_tags($userData['userName']))
@section('head-title', strip_tags($userData['userName']))
@section('page-url', url()->current())

@if(isset($userData['aboutMe']))
    @section('keywordName', strip_tags($userProfileData['aboutMe']))
@section('keyword', strip_tags($userProfileData['aboutMe']))
@section('description', strip_tags($userProfileData['aboutMe']))
@section('keywordDescription', strip_tags($userProfileData['aboutMe']))
@endif

@if(isset($userData['profilePicture']))
    @section('page-image', $userData['profilePicture'])
@endif
@if(isset($userData['coverPicture']))
    @section('twitter-card-image', $userData['coverPicture'])
@endif

<!-- if user block then don't show profile page content -->
@if($isBlockUser)
    <!-- info message -->
    <div class="alert alert-info">
        Người dùng này không có sẵn.
    </div>
    <!-- / info message -->
@elseif($blockByMeUser)
    <!-- info message -->
    <div class="alert alert-info">
        Bạn đã chặn người dùng này
    </div>
    <!-- / info message -->
@else
    <div class="">
        <div class="card mb-3">
            <div class="card-header">
                @if(!$isOwnProfile)
                    <span class="float-right">
					<!-- report button -->
					<a class="text-primary btn-link btn" title="Báo cáo" data-toggle="modal" data-target="#lwReportUserDialog"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></a>
                        <!-- /report button -->

                        <!-- Block User button -->
					<a class="text-primary btn-link btn" title="Chặn người dùng" id="lwBlockUserBtn"><i class="fas fa-ban"></i></a>
                        <!-- /Block User button -->
				</span>
                @endif
                <h4>
                    <?= $userData['fullName'] ?>
                    @if(!__isEmpty($userData['userAge'])) (<span data-model="userData.userAge"><?= $userData['userAge'] ?></span>) @endif
                <!-- show user online, idle or offline status -->
                    @if(!$isOwnProfile)
                        @if($userOnlineStatus == 1)
                            <span class="lw-dot lw-dot-success float-none" title="Trực tuyến"></span>
                        @elseif($userOnlineStatus == 2)
                            <span class="lw-dot lw-dot-warning float-none" title="Nghĩ"></span>
                        @elseif($userOnlineStatus == 3)
                            <span class="lw-dot lw-dot-danger float-none" title="Không trực tuyến"></span>
                        @endif
                    @endif
                <!-- /show user online, idle or offline status -->

                    <!-- if user is premium then show badge -->
                    @if(getFeatureSettings('premium_badge'))
                        <i class="fas fa-star"></i>
                    @endif
                <!-- /if user is premium then show badge -->

                    @if(__ifIsset($userProfileData['isVerified'])
                        and $userProfileData['isVerified'] == 1)
                        <i class="fas fa-user-check text-info"></i>
                    @endif
                </h4>
                <hr>
                @if((__ifIsset($userProfileData['city']) and __ifIsset($userProfileData['country_name'])))
                    <i class="fas fa-map-marker-alt text-success"></i>
                    <span class="mr-3"><span data-model="profileData.city"><?= $userProfileData['city'] ?></span>, <span data-model="profileData.country_name"><?= $userProfileData['country_name'] ?></span></span>
                @endif

                @if($isOwnProfile)
                    <div class="float-right">
                        <!-- total user likes count -->
                        <i class="fas fa-heart text-danger"></i> <span id="lwTotalUserLikes" class="mr-3">
				<?=  $totalUserLike?> Thích</span>
                        <!-- /total user likes count -->

                        <!-- total user visitors count -->
                        <i class="fas fa-eye text-warning"></i> <?=$totalVisitors?> Xem
                    <!-- /total user visitors count -->
                    </div>
                @endif
            </div>
        </div>
        <!-- User Profile and Cover photo -->
        <div class="card mb-4 lw-profile-image-card-container">
            <div class="card-body">
                @if($isOwnProfile)
                    <span class="lw-profile-edit-button-container">
					<a class="lw-icon-btn" href role="button" id="lwEditProfileAndCoverPhoto">
						<i class="fa fa-pencil-alt"></i>
					</a>
					<a class="lw-icon-btn" href role="button" id="lwCloseProfileAndCoverBlock" style="display: none;">
						<i class="fa fa-times"></i>
					</a>
				</span>
                @endif
                <div class="row" id="lwProfileAndCoverStaticBlock">
                    <div class="col-lg-12">
                        <div class="card mb-3 lw-profile-image-card-container">
                            <img class="lw-profile-thumbnail lw-photoswipe-gallery-img lw-lazy-img" id="lwProfilePictureStaticImage" data-src="<?= imageOrNoImageAvailable($userData['profilePicture']) ?>">
                            <img class="lw-cover-picture card-img-top lw-lazy-img" id="lwCoverPhotoStaticImage" data-src="<?= imageOrNoImageAvailable($userData['coverPicture']) ?>">
                        </div>
                    </div>
                </div>
                @if($isOwnProfile)
                    <div class="row" id="lwProfileAndCoverEditBlock" style="display: none;">
                        <div class="col-lg-3">
                            <input type="file"
                                   name="filepond"
                                   class="filepond lw-file-uploader"
                                   id="lwFileUploader"
                                   data-remove-media="true"
                                   data-instant-upload="true"
                                   data-action="<?= route('user.upload_profile_image') ?>"
                                   data-label-idle="Kéo và thả ảnh của bạn vào"
                                   data-image-preview-height="170"
                                   data-image-crop-aspect-ratio="1:1"
                                   data-style-panel-layout="compact circle"
                                   data-style-load-indicator-position="center bottom"
                                   data-style-progress-indicator-position="right bottom"
                                   data-style-button-remove-item-position="left bottom"
                                   data-style-button-process-item-position="right bottom"
                                   data-callback="afterUploadedProfilePicture">
                        </div>
                        <div class="col-lg-9">
                            <input type="file"
                                   name="filepond"
                                   class="filepond lw-file-uploader mt-5"
                                   id="lwFileUploader"
                                   data-remove-media="false"
                                   data-instant-upload="true"
                                   data-action="<?= route('user.upload_cover_image') ?>"
                                   data-callback="afterUploadedCoverPhoto"
                                   data-label-idle="Kéo và thả ảnh của bạn vào </span>">
                        </div>
                    </div>
                @endif
            </div>
        </div>
        <!-- /User Profile and Cover photo -->

        <!-- mobile view premium block -->
        @if($isPremiumUser)
            <div class="mb-4 d-block d-md-none">
                <div class="card">
                    <div class="card-body">
                        <span class="lw-premium-badge" title="Người dùng hạng cao cấp"></span>
                    </div>
                </div>
            </div>
        @endif
    <!-- /mobile view premium block -->

        <!-- mobile view like dislike block -->
        @if(!$isOwnProfile)
            <div class="mb-4 d-block d-md-none">
                <!-- profile related -->
                <div class="card">
                    <div class="card-header">
                        Thích không thích
                    </div>
                    <div class="card-body">
                        <!-- Like and dislike buttons -->
                        @if(!$isOwnProfile)
                            <div class="lw-like-dislike-box">
                                <!-- like button -->
                                <a href data-action="<?= route('user.write.like_dislike', ['toUserUid' => $userData['userUId'],'like' => 1]) ?>" data-method="post" data-callback="onLikeCallback" title="Like" class="lw-ajax-link-action lw-like-action-btn" id="lwLikeBtn">
                                    <span class="lw-animated-heart lw-animated-like-heart <?= (isset($userLikeData['like']) and $userLikeData['like'] == 1) ? 'lw-is-active' : '' ?>"></span>
                                </a>
                                <span data-model="userLikeStatus"><?= (isset($userLikeData['like']) and $userLikeData['like'] == 1) ? 'Thích' : 'Thích'  ?>
						</span>
                                <!-- /like button -->
                            </div>
                            <div class="lw-like-dislike-box">
                                <!-- dislike button -->
                                <a href data-action="<?= route('user.write.like_dislike', ['toUserUid' => $userData['userUId'],'like' => 0]) ?>" data-method="post" data-callback="onLikeCallback" title="Dislike" class="lw-ajax-link-action lw-dislike-action-btn" id="lwDislikeBtn">
                                    <span class="lw-animated-heart lw-animated-broken-heart <?= (isset($userLikeData['like']) and $userLikeData['like'] == 0) ? 'lw-is-active' : '' ?>"></span>
                                </a>
                                <span data-model="userDislikeStatus"><?= (isset($userLikeData['like']) and $userLikeData['like'] == 0) ? 'Không thích' : 'Không thích'  ?>
						</span>
                                <!-- /dislike button -->
                            </div>
                        @endif
                    </div>
                    <!-- / Like and dislike buttons -->
                </div>
                <div class="card mt-3">
                    <div class="card-header">
                        Gửi tin nhắn hoặc quà tặng
                    </div>
                    <div class="card-body text-center">
                        <!-- message button -->
                        <a class="mr-3 btn-link btn" onclick="getChatMessenger('<?= route('user.read.individual_conversation', ['specificUserId' => $userData['userId']]) ?>')" href id="lwMessageChatButton" data-chat-loaded="false" data-toggle="modal" data-target="#messengerDialog"><i class="far fa-comments fa-3x"></i>
                            <br>Nhắn tin</a>

                        <!-- send gift button -->
                        <a href title="Gửi quà" data-toggle="modal" data-target="#lwSendGiftDialog" class="btn-link btn"><i class="fa fa-gift fa-3x" aria-hidden="true"></i>
                            <br> Quà
                        </a>
                        <!-- /send gift button -->
                    </div>
                </div>
            </div>
        @endif
    <!-- /mobile view like dislike block -->
        @if(isset($userProfileData['aboutMe']) and $userProfileData['aboutMe'])
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-user text-primary"></i> Về tôi

                </div>
                <div class="card-body">
                    <!-- About Me -->
                    <div class="form-group">
                        <div class="lw-inline-edit-text" data-model="profileData.aboutMe">
                            <?= __ifIsset($userProfileData['aboutMe'], $userProfileData['aboutMe'], '-') ?>
                        </div>
                    </div>
                    <!-- /About Me -->
                </div>
            </div>
        @endif
        @if(!__isEmpty($photosData) or $isOwnProfile)
            <div class="card mb-3">
                <div class="card-header">
                    @if($isOwnProfile)
                        <span class="float-right">
						<a class="lw-icon-btn" href="<?= route('user.photos_setting', ['username' => getUserAuthInfo('profile.username')]) ?>" role="button">
							<i class="fas fa-cog"></i>
						</a>
					</span>
                    @endif
                    <h5><i class="fas fa-images text-warning"></i> Ảnh</h5>
                </div>

                <div class="card-body">
                    <div class="row text-center text-lg-left lw-horizontal-container pl-2">
                        @if(!__isEmpty($photosData))
                            @foreach($photosData as $key =>  $photo)
                                <img class="lw-user-photo lw-photoswipe-gallery-img lw-lazy-img" data-img-index="<?= $key ?>" data-src="<?= imageOrNoImageAvailable($photo['image_url']) ?>" >
                            @endforeach
                        @else
                            Rất tiếc ... Không tìm thấy hình ảnh nào ...
                        @endif
                    </div>
                </div>
            </div>
        @endif

    <!-- user gift data -->
        @if(!__isEmpty($userGiftData) or $isOwnProfile)
            <div class="card mb-3">
                <!-- Gift Header -->
                <div class="card-header">
                    <h5><i class="fa fa-gifts" aria-hidden="true"></i> Quà</h5>
                </div>
                <!-- /Gift Header -->
                <!-- Gift Card Body -->
                <div class="card-body">
                    @if(!__isEmpty($userGiftData))
                        <div class="row">
                            @foreach($userGiftData as $gift)
                                <div class="lw-user-gift-container">
                                    <img data-src="<?= imageOrNoImageAvailable($gift['userGiftImgUrl']) ?>" class="lw-user-gift-img lw-lazy-img"/>
                                    <small>
                                        <?= __tr('sent by') ?> <br>
                                        <a href="<?= route('user.profile_view', ['username' => $gift['senderUserName']]) ?>"><?= $gift['fromUserName'] ?></a></small>
                                    @if($gift['status'] === 1)
                                        <i class="fas fa-mask" title="Đây là món quà riêng của bạn và chỉ người gửi mới có thể nhìn thấy món quà này"></i>
                                    @endif
                                </div>
                            @endforeach
                        </div>
                    @else
                    <!-- info message -->
                        <div class="alert alert-info">
                            Không có quà tặng
                        </div>
                        <!-- / info message -->
                    @endif
                </div>
                <!-- Gift Card Body -->
            </div>
        @endif
    <!-- /user gift data -->

        <!-- User Basic Information -->
        <div class="card mb-3">
            <!-- Basic information Header -->
            <div class="card-header">
                <!-- Check if its own profile -->
                @if($isOwnProfile)
                    <span class="float-right">
						<a class="lw-icon-btn" href role="button" id="lwEditBasicInformation">
							<i class="fa fa-pencil-alt"></i>
						</a>
						<a class="lw-icon-btn" href role="button" id="lwCloseBasicInfoEditBlock" style="display: none;">
							<i class="fa fa-times"></i>
						</a>
					</span>
            @endif
            <!-- /Check if its own profile -->
                <h5><i class="fas fa-info-circle text-info"></i>  Thông tin cơ bản</h5>
            </div>
            <!-- /Basic information Header -->
            <!-- Basic Information content -->
            <div class="card-body">
                <!-- Static basic information container -->
                <div id="lwStaticBasicInformation">
                    @if($isOwnProfile)
                        <div class="form-group row">
                            <!-- First Name -->
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="first_name"><strong>Họ</strong></label>
                                <div class="lw-inline-edit-text" data-model="userData.first_name"><?= __ifIsset($userData['first_name'], $userData['first_name'], '-') ?></div>
                            </div>
                            <!-- /First Name -->
                            <!-- Last Name -->
                            <div class="col-sm-6">
                                <label for="last_name"><strong>Tên</strong></label>
                                <div class="lw-inline-edit-text" data-model="userData.last_name"><?= __ifIsset($userData['last_name'], $userData['last_name'], '-') ?></div>
                            </div>
                            <!-- /Last Name -->
                        </div>
                    @endif
                    <div class="form-group row">
                        <!-- Gender -->
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="select_gender"><strong>Giới tính</strong></label>
                            <div class="lw-inline-edit-text" data-model="profileData.gender_text">
                                <?= __ifIsset($userProfileData['gender_text'], $userProfileData['gender_text'], '-') ?>
                            </div>
                        </div>
                        <!-- /Gender -->
                        <!-- Preferred Language -->
                        <div class="col-sm-6">
                            <label><strong>Ngôn ngữ ưa thích
                                </strong></label>
                            <div class="lw-inline-edit-text" data-model="profileData.formatted_preferred_language">
                                <?= __ifIsset($userProfileData['formatted_preferred_language'], $userProfileData['formatted_preferred_language'], '-') ?>
                            </div>
                        </div>
                        <!-- /Preferred Language -->
                    </div>
                    <div class="form-group row">
                        <!-- Relationship Status -->
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label><strong>Tình trạng mối quan hệ
                                </strong></label>
                            <div class="lw-inline-edit-text" data-model="profileData.formatted_relationship_status">
                                <?= __ifIsset($userProfileData['formatted_relationship_status'], $userProfileData['formatted_relationship_status'], '-') ?>
                            </div>
                        </div>
                        <!-- /Relationship Status -->
                        <!-- Work Status -->
                        <div class="col-sm-6">
                            <label for="work_status"><strong>Tình trạng công việc
                                </strong></label>
                            <div class="lw-inline-edit-text" data-model="profileData.formatted_work_status">
                                <?= __ifIsset($userProfileData['formatted_work_status'], $userProfileData['formatted_work_status'], '-') ?>
                            </div>
                        </div>
                        <!-- /Work Status -->
                    </div>
                    <div class="form-group row">
                        <!-- Education -->
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="education"><strong>Giáo dục
                                </strong></label>
                            <div class="lw-inline-edit-text" data-model="profileData.formatted_education">
                                <?= __ifIsset($userProfileData['formatted_education'], $userProfileData['formatted_education'], '-') ?>
                            </div>
                        </div>
                        <!-- /Education -->
                        <!-- Birthday -->
                        <div class="col-sm-6">
                            <label for="birthday"><strong>Sinh nhật</strong></label>
                            <div class="lw-inline-edit-text" data-model="profileData.birthday">
                                <?= __ifIsset($userProfileData['birthday'], $userProfileData['birthday'], '-') ?>
                            </div>
                        </div>
                        <!-- /Birthday -->
                    </div>
                    <div class="form-group row">
                        <!-- Mobile Number -->
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="mobile_number"><strong>Số điện thoại</strong></label>
                            <div class="lw-inline-edit-text" data-model="profileData.mobile_number">
                                <?= __ifIsset($userProfileData['mobile_number'], $userProfileData['mobile_number'], '-') ?>
                            </div>
                        </div>
                        <!-- /Mobile Number -->
                    </div>
                </div>
                <!-- /Static basic information container -->

            @if($isOwnProfile)
                <!-- User Basic Information Form -->
                    <form class="lw-ajax-form lw-form" lwSubmitOnChange method="post" data-show-message="true" action="<?= route('user.write.basic_setting') ?>" data-callback="getUserProfileData" style="display: none;" id="lwUserBasicInformationForm">
                        <div class="form-group row">
                            <!-- First Name -->
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="first_name">Họ</label>
                                <input type="text" value="<?= $userData['first_name'] ?>" class="form-control" name="first_name"
                                       placeholder="Họ">
                            </div>
                            <!-- /First Name -->
                            <!-- Last Name -->
                            <div class="col-sm-6">
                                <label for="last_name">Tên</label>
                                <input type="text" value="<?= $userData['last_name'] ?>" class="form-control" name="last_name" placeholder="Tên">
                            </div>
                            <!-- /Last Name -->
                        </div>
                        <div class="form-group row">
                            <!-- Gender -->
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="select_gender">Giới tính</label>
                                <select name="gender" class="form-control" id="select_gender">
                                    <option value="" selected disabled>Chọn giới tính</option>
                                    @foreach($genders as $genderKey => $gender)
                                        <option value="<?= $genderKey ?>" <?= (__ifIsset($userProfileData['gender']) and $genderKey == $userProfileData['gender']) ? 'selected' : '' ?>><?= $gender ?></option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- /Gender -->
                            <!-- Birthday -->
                            <div class="col-sm-6">
                                <label for="select_preferred_language">Ngôn ngữ ưa thích
                                </label>
                                <select name="preferred_language" class="form-control" id="select_preferred_language">
                                   {{-- <option value="" selected disabled>Chọn ngôn ngữ ưa thích
                                    </option>--}}
                                    <option value="" selected disabled></option>
                                    @foreach($preferredLanguages as $languageKey => $language)
                                        <option value="<?= $languageKey ?>" <?= (__ifIsset($userProfileData['preferred_language']) and $languageKey == $userProfileData['preferred_language']) ? 'selected' : '' ?>><?= $language ?></option>
                                    @endforeach
                                </select>
                            </div>
                            <!-- /Preferred Language -->
                        </div>
                        <div class="form-group row">
                            <!-- Relationship Status -->
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="select_relationship_status">Tình trạng mối quan hệ</label>
                                <select name="relationship_status" class="form-control" id="select_relationship_status">

                                    @foreach($relationshipStatuses as $relationshipStatusKey => $relationshipStatus)
                                        <option value="<?= $relationshipStatusKey ?>" <?= (__ifIsset($userProfileData['relationship_status']) and $relationshipStatusKey == $userProfileData['relationship_status']) ? 'selected' : '' ?>><?= $relationshipStatus ?></option>
                                    @endforeach
                                </select>
                            </div>
                            <!-- /Relationship Status -->
                            <!-- Work status -->
                            <div class="col-sm-6">
                                <label for="select_work_status">Tình trạng công việc</label>
                                <select name="work_status" class="form-control" id="select_work_status">

                                    @foreach($workStatuses as $workStatusKey => $workStatus)
                                        <option value="<?= $workStatusKey ?>" <?= (__ifIsset($userProfileData['work_status']) and $workStatusKey == $userProfileData['work_status']) ? 'selected' : '' ?>><?= $workStatus ?></option>
                                    @endforeach
                                </select>
                            </div>
                            <!-- /Work status -->
                        </div>
                        <div class="form-group row">
                            <!-- Education -->
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="select_education">Giáo dục</label>
                                <select name="education" class="form-control" id="select_education">
                                    <option value="" selected disabled></option>
                                    @foreach($educations as $educationKey => $educationValue)
                                        <option value="<?= $educationKey ?>" <?= (__ifIsset($userProfileData['education']) and $educationKey == $userProfileData['education']) ? 'selected' : '' ?>><?= $educationValue ?></option>
                                    @endforeach
                                </select>
                            </div>
                            <!-- /Education -->
                            <!-- Birthday -->
                            <div class="col-sm-6">
                                <label for="birthday">Sinh nhật</label>
                                <input type="text" name="birthday" value="<?= __ifIsset($userProfileData['dob'], $userProfileData['dob']) ?>" placeholder="<?= __tr('YYYY-MM-DD') ?>" class="form-control" required dateISO="true">
                            </div>
                            <!-- /Birthday -->
                        </div>
                        @if($isOwnProfile)

                            <div class="form-group row">
                                <!-- Mobile Number -->
                                <div class="col-sm-6">
                                    <label for="mobile_number">Số điện thoại</label>
                                    <input type="text" value="<?= $userData['mobile_number'] ?>" name="mobile_number" placeholder="Số điện thoại" class="form-control" required maxlength="15">
                                </div>
                                <!-- /Mobile Number -->
                            </div>
                            <!-- About Me -->
                            <div class="form-group">
                                <label for="about_me">Về tôi</label>
                                <textarea class="form-control" name="about_me" id="about_me" rows="3" placeholder="Nói điều gì đó về bản thân"><?= __ifIsset($userProfileData['aboutMe'], $userProfileData['aboutMe'], '') ?></textarea>
                            </div>
                            <!-- /About Me -->
                        @endif
                    </form>
                    <!-- /User Basic Information Form -->
                @endif
            </div>
        </div>
        <!-- /User Basic Information -->
        <div class="card mb-3">
            <div class="card-header">
                @if($isOwnProfile)
                    <span class="float-right">
					<a class="lw-icon-btn" href role="button" id="lwEditUserLocation">
						<i class="fa fa-pencil-alt"></i>
					</a>
					<a class="lw-icon-btn" href role="button" id="lwCloseLocationBlock" style="display: none;">
						<i class="fa fa-times"></i>
					</a>
				</span>
                @endif
                <h5><i class="fas fa-map-marker-alt"></i> Vị trí</h5>
            </div>
            <div class="card-body">
                {{--	@if(getStoreSettings('allow_google_map'))--}}
                <div id="lwUserStaticLocation">
                    <?php
                    $latitude = (__ifIsset($userProfileData['latitude'], $userProfileData['latitude'], '21.120779'));
                    $longitude = (__ifIsset($userProfileData['longitude'], $userProfileData['longitude'], '79.0544606'));
                    ?>
                    <div class="gmap_canvas"><iframe height="300" id="gmap_canvas" src="https://maps.google.com/maps/place?q=<?= $latitude ?>,<?= $longitude ?>&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                    </div>
                </div>
                <div id="lwUserEditableLocation" style="display: none;">
                    <div class="form-group">

                        <input type="text" id="address-input" name="address_address" class="form-control map-input">
                        <input type="hidden" name="address_latitude" data-model="profileData.latitude" id="address-latitude" value="<?= $latitude ?>" />
                        <input type="hidden" name="address_longitude" data-model="profileData.longitude" id="address-longitude" value="<?= $longitude ?>" />
                    </div>
                    <div id="address-map-container" style="width:100%;height:400px; ">
                        <div style="width: 100%; height: 100%" id="address-map"></div>
                    </div>
                </div>
                {{--@else
                    <!-- info message -->
                    <div class="alert alert-info">
                        <?= __tr('Something went wrong with Google Api Key, please contact to system administrator.') ?>
                    </div>
                    <!-- / info message -->
                @endif--}}
            </div>
        </div>

        <!-- User Specifications -->
        @if(!__isEmpty($userSpecificationData))
            @foreach($userSpecificationData as $specificationKey => $specifications)
                <div class="card mb-3">
                    <!-- User Specification Header -->
                    <div class="card-header">
                        <!-- Check if its own profile -->
                        @if($isOwnProfile)
                            <span class="float-right">
								<a class="lw-icon-btn" href role="button" id="lwEdit<?= $specificationKey ?>" onclick="showHideSpecificationUser('<?= $specificationKey ?>', event)">
									<i class="fa fa-pencil-alt"></i>
								</a>
								<a class="lw-icon-btn" href role="button" id="lwClose<?= $specificationKey ?>Block" onclick="showHideSpecificationUser('<?= $specificationKey ?>', event)" style="display: none;">
									<i class="fa fa-times"></i>
								</a>
							</span>
                    @endif
                    <!-- /Check if its own profile -->
                        <h5><?= $specifications['icon'] ?> <?= $specifications['title'] ?></h5>
                    </div>
                    <!-- /User Specification Header -->
                    <div class="card-body">
                        <!-- User Specification static container -->
                        <div id="lw<?= $specificationKey ?>StaticContainer">
                            @foreach(collect($specifications['items'])->chunk(2) as $specKey => $specification)
                                <div class="form-group row">
                                    @foreach($specification as $itemKey => $item)
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label><strong><?= $item['label'] ?></strong></label>
                                            <div class="lw-inline-edit-text" data-model="specificationData.<?= $item['name'] ?>">
                                                <?= $item['value'] ?>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            @endforeach
                        </div>
                        <!-- /User Specification static container -->
                    @if($isOwnProfile)
                        <!-- User Specification Form -->
                            <form class="lw-ajax-form lw-form" method="post" lwSubmitOnChange action="<?= route('user.write.profile_setting') ?>" data-callback="getUserProfileData" id="lwUser<?= $specificationKey ?>Form" style="display: none;">
                                @foreach(collect($specifications['items'])->chunk(2) as $specification)
                                    <div class="form-group row">
                                        @foreach($specification as $itemKey => $item)
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                @if($item['input_type'] == 'select')
                                                    <label for="<?= $item['name'] ?>"><?= $item['label'] ?></label>
                                                    <select name="<?= $item['name'] ?>" class="form-control">
                                                        <option value="" selected disabled><?= __tr('Chọn __label__', [
                                                                '__label__' => $item['label']
                                                            ]) ?></option>
                                                        @foreach($item['options'] as $optionKey => $option)
                                                            <option value="<?= $optionKey ?>" <?= $item['selected_options'] == $optionKey ? 'selected' : '' ?>>
                                                                <?= $option ?>
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                @elseif($item['input_type'] == 'textbox')
                                                    <label for="<?= $item['name'] ?>"><?= $item['label'] ?></label>
                                                    <input type="text" id="<?= $item['name'] ?>" name="<?= $item['name'] ?>" class="form-control" value="<?= $item['selected_options'] ?>">
                                                @endif
                                            </div>
                                        @endforeach
                                    </div>
                                @endforeach
                            </form>
                            <!-- /User Specification Form -->
                        @endif
                    </div>
                </div>
        @endforeach
    @endif
    <!-- /User Specifications -->

    </div>
    </div>

    <!-- user report Modal-->
    <div class="modal fade" id="lwReportUserDialog" tabindex="-1" role="dialog" aria-labelledby="userReportModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="userReportModalLabel"><?= __tr('Báo cáo lạm dụng cho __username__', [
                            '__username__' => $userData['fullName']]) ?></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <form class="lw-ajax-form lw-form" id="lwReportUserForm" method="post" data-callback="userReportCallback" action="<?= route('user.write.report_user', ['sendUserUId' => $userData['userUId']]) ?>">
                    <div class="modal-body">
                        <!-- reason input field -->
                        <div class="form-group">
                            <label for="lwUserReportReason">Lý do</label>
                            <textarea class="form-control" rows="3" id="lwUserReportReason" name="report_reason" required></textarea>
                        </div>
                        <!-- / reason input field -->
                    </div>

                    <!-- modal footer -->
                    <div class="modal-footer mt-3">
                        <button class="btn btn-light btn-sm" id="lwCloseUserReportDialog">Huỷ bỏ</button>
                        <button type="submit" class="btn btn-primary btn-sm lw-ajax-form-submit-action btn-user lw-btn-block-mobile">Báo cáo</button>
                    </div>
                </form>
                <!-- modal footer -->
            </div>
        </div>
    </div>
    <!-- /user report Modal-->

    <!-- send gift Modal-->
    <div class="modal fade" id="lwSendGiftDialog" tabindex="-1" role="dialog" aria-labelledby="sendGiftModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <?php $totalAvailableCredits = totalUserCredits() ?>
                    <h5 class="modal-title" id="sendGiftModalLabel">Tặng quà<small class="text-muted">   Số dư tài khoản có sẵn: <?=  $totalAvailableCredits
                             ?>VND</small></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
            @if(isset($giftListData) and !__isEmpty($giftListData))

                <!-- insufficient balance error message -->
                    <div class="alert alert-info" id="lwGiftModalErrorText" style="display: none">
                        Số dư của bạn quá thấp, vui lòng nạp thêm
                        <a href="<?= route('user.credit_wallet.read.view') ?>">Mua tín dụng</a>
                    </div>
                    <!-- / insufficient balance error message -->

                    <form class="lw-ajax-form lw-form" id="lwSendGiftForm" method="post" data-callback="sendGiftCallback" action="<?= route('user.write.send_gift', ['sendUserUId' => $userData['userUId']]) ?>">
                        <div class="modal-body">
                            <div class="btn-group-toggle" data-toggle="buttons">
                                @foreach($giftListData as $key => $gift)
                                    <span class="btn lw-group-radio-option-img" id="lwSendGiftRadioBtn_<?= $gift['_uid'] ?>">
								<input type="radio" value="<?= $gift['_uid'] ?>" name="selected_gift"/>
								<span>
									<img class="lw-lazy-img" data-src="<?= imageOrNoImageAvailable($gift['gift_image_url']) ?>"/><br>
									<?= $gift['formattedPrice'] ?>
								</span>
							</span>
                                @endforeach
                            </div>

                            <!-- select private / public -->
                            <div class="custom-control custom-checkbox custom-control-inline mt-3">
                                <input type="checkbox" class="custom-control-input" id="isPrivateCheck"  name="isPrivateGift">
                                <label class="custom-control-label" for="isPrivateCheck">Riêng tư</label>
                            </div>
                            <!-- /select private / public -->
                        </div>
                        <!-- modal footer -->
                        <div class="modal-footer mt-3">
                            <button class="btn btn-light btn-sm" id="lwCloseSendGiftDialog">Trở lại</button>
                            <button type="submit" class="btn btn-primary btn-sm lw-ajax-form-submit-action btn-user lw-btn-block-mobile">Gửi</button>
                        </div>
                        <!-- modal footer -->
                    </form>
            @else
                <!-- info message -->
                    <div class="alert alert-info">
                        Không có quà tặng
                    </div>
                    <!-- / info message -->
                @endif
                <div>
                    <div>
                    </div>
                    <!-- /send gift Modal-->
                </div>
            </div>
        </div>
        <!-- User block Confirmation text html -->
        <div id="lwBlockUserConfirmationText" style="display: none;">
            <h3>Bạn có chắc không !
            </h3>
            <strong>Bạn chắc chắn muốn chặn người dùng này ?</strong>
        </div>
        <!-- /User block Confirmation text html -->

        <!-- Content for sidebar -->
        @push('sidebarProfilePage')
            <li class="mt-4 d-none d-md-block">
                <!-- profile related -->
                <div class="card">
                    <div class="card-header">
                        <?= $userData['fullName'] ?>
                    </div>
                    <div class="card-body">
                        <img class="lw-profile-thumbnail lw-lazy-img" data-src="<?= imageOrNoImageAvailable($userData['profilePicture']) ?>">
                        @if($isPremiumUser)
                            <span class="lw-premium-badge" title="<?= __tr('Premium User') ?>"></span>
                        @endif
                    <!-- Like and dislike buttons -->
                        @if(!$isOwnProfile)
                            <div class="lw-like-dislike-box">
                                <!-- like button -->
                                <a href data-action="<?= route('user.write.like_dislike', ['toUserUid' => $userData['userUId'],'like' => 1]) ?>" data-method="post" data-callback="onLikeCallback" title="Like" class="lw-ajax-link-action" id="lwLikeBtn">
							<span class="lw-animated-heart lw-animated-like-heart <?= (isset($userLikeData['like']) and $userLikeData['like'] == 1) ? 'lw-is-active' : '' ?>"
                            ></span>
                                </a>
                                <span data-model="userLikeStatus"><?= (isset($userLikeData['like']) and $userLikeData['like'] == 1) ? 'Thích' : 'Thích'  ?>
						</span>
                                <!-- /like button -->
                            </div>
                            <div class="lw-like-dislike-box">
                                <!-- dislike button -->
                                <a href data-action="<?= route('user.write.like_dislike', ['toUserUid' => $userData['userUId'],'like' => 0]) ?>" data-method="post" data-callback="onLikeCallback" title="Dislike" class="lw-ajax-link-action" id="lwDislikeBtn">
							<span class="lw-animated-heart lw-animated-broken-heart <?= (isset($userLikeData['like']) and $userLikeData['like'] == 0) ? 'lw-is-active' : '' ?>"
                            ></span>
                                </a>
                                <span data-model="userDislikeStatus"><?= (isset($userLikeData['like']) and $userLikeData['like'] == 0) ? 'Không thích' : 'Không thích'  ?>
						</span>
                                <!-- /dislike button -->
                            </div>
                    </div>
                    <!-- / Like and dislike buttons -->
                </div>
                <div class="card mt-3">
                    <div class="card-header">
                        Gửi tin nhắn hoặc tặng qùa
                    </div>
                    <div class="card-body text-center">
                        <!-- message button -->
                        <a class="mr-lg-3 btn-link btn" onclick="getChatMessenger('<?= route('user.read.individual_conversation', ['specificUserId' => $userData['userId']]) ?>')" href id="lwMessageChatButton" data-chat-loaded="false" data-toggle="modal" data-target="#messengerDialog"><i class="far fa-comments fa-3x"></i>
                            <br> Nhắn tin</a>

                        <!-- send gift button -->
                        <a href title="Gửi quà" data-toggle="modal" data-target="#lwSendGiftDialog" class="btn-link btn"><i class="fa fa-gift fa-3x" aria-hidden="true"></i>
                            <br> Quà
                        </a>
                        <!-- /send gift button -->
                    </div>
                </div>
                @endif
            </li>
        @endpush
        @endif
    <!-- /if user block then don't show profile page content -->

        @push('appScripts')
            @if(getStoreSettings('allow_google_map'))
                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCBwpleEmc4oKhfWXP5cVFXIHNC1nXAwhg&libraries=places&callback=initialize" async defer></script>
            @endif
            <script>
                // Get user profile data
                function getUserProfileData(response) {
                    // If successfully stored data
                    if (response.reaction == 1) {
                        __DataRequest.get("<?= route('user.get_profile_data', ['username' => getUserAuthInfo('profile.username')]) ?>", {}, function(responseData) {
                            var requestData = responseData.data;
                            var specificationUpdateData = [];
                            _.forEach(requestData.userSpecificationData, function(specification) {
                                _.forEach(specification['items'], function(item) {
                                    specificationUpdateData[item.name] = item.value;
                                });
                            });
                            __DataRequest.updateModels('userData', requestData.userData);
                            __DataRequest.updateModels('profileData', requestData.userProfileData);
                            __DataRequest.updateModels('specificationData', specificationUpdateData);
                        });
                    }
                }

                /**************** User Like Dislike Fetch and Callback Block Start ******************/
                //add disabled anchor tag class on click
                $(".lw-like-action-btn, .lw-dislike-action-btn").on('click', function() {
                    $('.lw-like-dislike-box').addClass("lw-disable-anchor-tag");
                });
                //on like Callback function
                function onLikeCallback(response) {
                    var requestData = response.data;
                    //check reaction code is 1 and status created or updated and like status is 1
                    if (response.reaction == 1 && requestData.likeStatus == 1 && (requestData.status == "created" || requestData.status == 'updated')) {
                        __DataRequest.updateModels({
                            'userLikeStatus' 	: 'Thích', //user liked status
                            'userDislikeStatus' : 'Không thích', //user dislike status
                        });
                        //add class
                        $(".lw-animated-like-heart").toggleClass("lw-is-active");
                        //check if updated then remove class in dislike heart
                        if (requestData.status == 'updated') {
                            $(".lw-animated-broken-heart").toggleClass("lw-is-active");
                        }
                    }
                    //check reaction code is 1 and status created or updated and like status is 2
                    if (response.reaction == 1 && requestData.likeStatus == 2 && (requestData.status == "created" || requestData.status == 'updated')) {
                        __DataRequest.updateModels({
                            'userLikeStatus' 	: 'Thích', //user like status
                            'userDislikeStatus' : 'Không thích', //user disliked status
                        });
                        //add class
                        $(".lw-animated-broken-heart").toggleClass("lw-is-active");
                        //check if updated then remove class in like heart
                        if (requestData.status == 'updated') {
                            $(".lw-animated-like-heart").toggleClass("lw-is-active");
                        }
                    }
                    //check reaction code is 1 and status deleted and like status is 1
                    if (response.reaction == 1 && requestData.likeStatus == 1 && requestData.status == "deleted") {
                        __DataRequest.updateModels({
                            'userLikeStatus' 	: 'Thích', //user like status
                        });
                        $(".lw-animated-like-heart").toggleClass("lw-is-active");
                    }
                    //check reaction code is 1 and status deleted and like status is 2
                    if (response.reaction == 1 && requestData.likeStatus == 2 && requestData.status == "deleted") {
                        __DataRequest.updateModels({
                            'userDislikeStatus' 	: 'Không thích', //user like status
                        });
                        $(".lw-animated-broken-heart").toggleClass("lw-is-active");
                    }
                    //remove disabled anchor tag class
                    _.delay(function() {
                        $('.lw-like-dislike-box').removeClass("lw-disable-anchor-tag");
                    }, 1000);
                }
                /**************** User Like Dislike Fetch and Callback Block End ******************/


                //send gift callback
                function sendGiftCallback(response) {
                    //check success reaction is 1
                    if (response.reaction == 1) {
                        var requestData = response.data;
                        //form reset after success
                        $("#lwSendGiftForm").trigger("reset");
                        //remove active class after success on select gift radio option
                        $("#lwSendGiftRadioBtn_"+requestData.giftUid).removeClass('active');
                        //close dialog after success
                        $('#lwSendGiftDialog').modal('hide');
                        //reload view after 2 seconds on success reaction
                        _.delay(function() {
                            __Utils.viewReload();
                        }, 1000)
                        //if error type is insufficient balance then show error message
                    } else if (response.data['errorType'] == 'insufficient_balance') {
                        //show error div
                        $("#lwGiftModalErrorText").show();
                    } else {
                        //hide error div
                        $("#lwGiftModalErrorText").hide();
                    }
                }

                //close Send Gift Dialog
                $("#lwCloseSendGiftDialog").on('click', function(e) {
                    e.preventDefault();
                    //form reset after success
                    $("#lwSendGiftForm").trigger("reset");
                    //close dialog after success
                    $('#lwSendGiftDialog').modal('hide');
                });

                //user report callback
                function userReportCallback(response) {
                    //check success reaction is 1
                    if (response.reaction == 1) {
                        var requestData = response.data;
                        //form reset after success
                        $("#lwReportUserForm").trigger("reset");
                        //close dialog after success
                        $('#lwReportUserDialog').modal('hide');
                        //reload view after 2 seconds on success reaction
                        _.delay(function() {
                            __Utils.viewReload();
                        }, 1000)
                    }
                }

                //close User Report Dialog
                $("#lwCloseUserReportDialog").on('click', function(e) {
                    e.preventDefault();
                    //form reset after success
                    $("#lwReportUserForm").trigger("reset");
                    //close dialog after success
                    $('#lwReportUserDialog').modal('hide');
                });

                //block user confirmation
                $("#lwBlockUserBtn").on('click', function(e) {
                    var confirmText = $('#lwBlockUserConfirmationText');
                    //show confirmation
                    showConfirmation(confirmText, function() {
                        var requestUrl = '<?= route('user.write.block_user') ?>',
                            formData = {
                                'block_user_id' : '<?= $userData['userUId'] ?>',
                            };
                        // post ajax request
                        __DataRequest.post(requestUrl, formData, function(response) {
                            if (response.reaction == 1) {
                                __Utils.viewReload();
                            }
                        });
                    });
                });

                // Click on edit / close button
                $('#lwEditBasicInformation, #lwCloseBasicInfoEditBlock').click(function(e) {
                    e.preventDefault();
                    showHideBasicInfoContainer();
                });
                // Show / Hide basic information container
                function showHideBasicInfoContainer() {
                    $('#lwUserBasicInformationForm').toggle();
                    $('#lwStaticBasicInformation').toggle();
                    $('#lwCloseBasicInfoEditBlock').toggle();
                    $('#lwEditBasicInformation').toggle();
                }
                // Show hide specification user settings
                function showHideSpecificationUser(formId, event) {
                    event.preventDefault();
                    $('#lwEdit'+formId).toggle();
                    $('#lw'+formId+'StaticContainer').toggle();
                    $('#lwUser'+formId+'Form').toggle();
                    $('#lwClose'+formId+'Block').toggle();
                }
                // Click on profile and cover container edit / close button
                $('#lwEditProfileAndCoverPhoto, #lwCloseProfileAndCoverBlock').click(function(e) {
                    e.preventDefault();
                    showHideProfileAndCoverPhotoContainer();
                });
                // Hide / show profile and cover photo container
                function showHideProfileAndCoverPhotoContainer() {
                    $('#lwProfileAndCoverStaticBlock').toggle();
                    $('#lwProfileAndCoverEditBlock').toggle();
                    $('#lwEditProfileAndCoverPhoto').toggle();
                    $('#lwCloseProfileAndCoverBlock').toggle();
                }
                // After successfully upload profile picture
                function afterUploadedProfilePicture(responseData) {
                    $('#lwProfilePictureStaticImage, .lw-profile-thumbnail').attr('src', responseData.data.image_url);
                }
                // After successfully upload Cover photo
                function afterUploadedCoverPhoto(responseData) {
                    $('#lwCoverPhotoStaticImage').attr('src', responseData.data.image_url);
                }
            </script>
            <script>
                // Click on edit / close button
                $('#lwEditUserLocation, #lwCloseLocationBlock').click(function(e) {
                    e.preventDefault();
                    showHideLocationContainer();
                });
                // Show hide location container
                function showHideLocationContainer() {
                    $('#lwUserStaticLocation').toggle();
                    $('#lwUserEditableLocation').toggle();
                    $('#lwEditUserLocation').toggle();
                    $('#lwCloseLocationBlock').toggle();
                }

                function initialize() {

                    $('form').on('keyup keypress', function(e) {
                        var keyCode = e.keyCode || e.which;
                        if (keyCode === 13) {
                            e.preventDefault();
                            return false;
                        }
                    });
                    const locationInputs = document.getElementsByClassName("map-input");

                    const autocompletes = [];
                    const geocoder = new google.maps.Geocoder;
                    for (let i = 0; i < locationInputs.length; i++) {

                        const input = locationInputs[i];
                        const fieldKey = input.id.replace("-input", "");
                        const isEdit = document.getElementById(fieldKey + "-latitude").value != '' && document.getElementById(fieldKey + "-longitude").value != '';

                        const latitude = parseFloat(document.getElementById(fieldKey + "-latitude").value) || -33.8688;
                        const longitude = parseFloat(document.getElementById(fieldKey + "-longitude").value) || 151.2195;

                        const map = new google.maps.Map(document.getElementById(fieldKey + '-map'), {
                            center: {lat: latitude, lng: longitude},
                            zoom: 13
                        });
                        const marker = new google.maps.Marker({
                            map: map,
                            position: {lat: latitude, lng: longitude},
                        });

                        marker.setVisible(isEdit);

                        const autocomplete = new google.maps.places.Autocomplete(input);
                        autocomplete.key = fieldKey;
                        autocompletes.push({input: input, map: map, marker: marker, autocomplete: autocomplete});
                    }

                    for (let i = 0; i < autocompletes.length; i++) {
                        const input = autocompletes[i].input;
                        const autocomplete = autocompletes[i].autocomplete;
                        const map = autocompletes[i].map;
                        const marker = autocompletes[i].marker;

                        google.maps.event.addListener(autocomplete, 'place_changed', function () {
                            marker.setVisible(false);
                            const place = autocomplete.getPlace();

                            geocoder.geocode({'placeId': place.place_id}, function (results, status) {
                                if (status === google.maps.GeocoderStatus.OK) {
                                    const lat = results[0].geometry.location.lat();
                                    const lng = results[0].geometry.location.lng();
                                    setLocationCoordinates(autocomplete.key, lat, lng, place);
                                }
                            });

                            if (!place.geometry) {
                                window.alert("No details available for input: '" + place.name + "'");
                                input.value = "";
                                return;
                            }

                            if (place.geometry.viewport) {
                                map.fitBounds(place.geometry.viewport);
                            } else {
                                map.setCenter(place.geometry.location);
                                map.setZoom(17);
                            }
                            marker.setPosition(place.geometry.location);
                            marker.setVisible(true);

                        });
                    }
                }

                function setLocationCoordinates(key, lat, lng, placeData) {
                    __DataRequest.post("<?= route('user.write.location_data') ?>", {
                        'latitude': lat,
                        'longitude': lng,
                        'placeData': placeData.address_components
                    }, function(responseData) {
                        showHideLocationContainer();
                        var requestData = responseData.data;
                        __DataRequest.updateModels('profileData', {
                            city: requestData.city,
                            country_name: requestData.country_name,
                            latitude: lat,
                            longitude: lng
                        });
                        var mapSrc = "https://maps.google.com/maps/place?q="+lat+","+lng+"&output=embed";
                        $('#gmap_canvas').attr('src', mapSrc)
                    });
                };

                // $(".lw-animated-heart").on("click", function() {
                //     $(this).toggleClass("lw-is-active");
                // });
            </script>
    @endpush
