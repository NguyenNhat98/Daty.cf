<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span><?= __tr('Bản quyền © thuộc về __storeName__ __copyrightYear__', [
                '__storeName__' => getStoreSettings('name'),
                '__copyrightYear__' => date('Y')
            ]) ?> </span>
            <a href="<?= route('user.read.contact') ?>" class="pl-1">Liên hệ</a>
        </div>
    </div>
</footer>
<!-- End of Footer -->

<!-- Messenger Dialog -->
<div class="modal fade" id="messengerDialog" tabindex="-1" role="dialog" aria-labelledby="messengerModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button id="lwChatSidebarToggle" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
                <h5 class="modal-title">Trò chuyện</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div id="lwChatDialogLoader" style="display: none;">
                    <div class="d-flex justify-content-center m-5">
                        <div class="spinner-border" role="status">
                            <span class="sr-only">Đăng tải</span>
                        </div>
                    </div>
                </div>
                <div id="lwMessengerContent"></div>
            </div>
        </div>
    </div>
</div>
<!-- Messenger Dialog -->
<img src="<?= asset('imgs/ajax-loader.gif') ?>" style="height:1px;width:1px;">
<script>
    window.appConfig = {
        debug: "<?= config('app.debug') ?>",
        csrf_token: "<?= csrf_token() ?>"
    }
</script>

<?= __yesset([
    'dist/pusher-js/pusher.min.js',
    'dist/js/vendorlibs-public.js',
    'dist/js/vendorlibs-datatable.js',
    'dist/js/vendorlibs-photoswipe.js',
    'dist/js/vendorlibs-smartwizard.js'
], true) ?>
<script>
        (function () {
            $.validator.messages = $.extend({}, $.validator.messages, {
                required: 'Trường này là bắt buộc.',
                remote: 'Vui lòng sửa phạm vi này.',
                email: 'Vui lòng nhập một địa chỉ email hợp lệ.',
                url: 'Vui lòng nhập một URL hợp lệ.',
                date: 'Vui lòng nhập một ngày hợp lệ.',
                dateISO: 'Vui lòng nhập ngày hợp lệ (ISO).',
                number: 'Vui lòng nhập một số hợp lệ.',
                digits: 'Vui lòng chỉ nhập các chữ số.',
                equalTo: 'Vui lòng nhập lại cùng một giá trị.',
                maxlength: $.validator.format('Vui lòng nhập không quá {0} ký tự.'),
                minlength: $.validator.format('Vui lòng nhập ít nhất {0} ký tự.'),
                rangelength: $.validator.format('Vui lòng nhập một giá trị có độ dài từ {0} đến {1} ký tự.'),
                range: $.validator.format('Vui lòng nhập giá trị từ {0} đến {1}.'),
                max: $.validator.format('Vui lòng nhập giá trị nhỏ hơn hoặc bằng {0}.'),
                min: $.validator.format('Vui lòng nhập giá trị lớn hơn hoặc bằng {0}.'),
                step: $.validator.format('Vui lòng nhập bội số của {0}.')
            });
        })();
</script>
<?= __yesset([
    'dist/js/common-app.*.js'
], true) ?>
<script>
    __Utils.setTranslation({
        'processing': "Chờ",
        'uploader_default_text': "<span class='filepond--label-action'>Kéo và thả tệp hoặc trình duyệt</span>",
        'gif_no_result': "Không tìm thấy kết quả",
        "message_is_required": "Tin nhắn là bắt buộc",
        "sticker_name_label": "Hình dán"
    });

    var userLoggedIn = '<?= isLoggedIn() ?>',
        enablePusher = '<?= getStoreSettings('allow_pusher') ?>';

    if (userLoggedIn && enablePusher) {
        var userUid = '<?= getUserUID() ?>',
            pusherAppKey = '<?= getStoreSettings('pusher_app_key') ?>',
            __pusherAppOptions = {
                cluster: '<?= getStoreSettings('pusher_app_cluster_key') ?>',
                forceTLS: true,
            };

    }
</script>
<!-- Include Audio Video Call Component -->
@include('WpUser.messenger.audio-video')
<!-- /Include Audio Video Call Component -->
<script>
    //check user loggedIn or not
    if (userLoggedIn && enablePusher) {
        //subscribe pusher notification
        subscribeNotification('event.user.notification', pusherAppKey, userUid, function (responseData) {
            //get notification list
            var requestData = responseData.getNotificationList,
                getNotificationList = requestData.notificationData,
                getNotificationCount = requestData.notificationCount;
            //update notification count
            __DataRequest.updateModels({
                'totalNotificationCount': getNotificationCount, //total notification count
            });
            //check is not empty
            if (!_.isEmpty(getNotificationList)) {
                var template = _.template($("#lwNotificationListTemplate").html());
                $("#lwNotificationContent").html(template({
                    'notificationList': getNotificationList,
                }));
            }
            //check is not empty
            if (responseData) {
                switch (responseData.type) {
                    case 'user-likes':
                        if (responseData.showNotification != 0) {
                            showSuccessMessage(responseData.message);
                        }
                        break;
                    case 'user-gift':
                        if (responseData.showNotification != 0) {
                            showSuccessMessage(responseData.message);
                        }
                        break;
                    case 'profile-visitor':
                        if (responseData.showNotification != 0) {
                            showSuccessMessage(responseData.message);
                        }
                        break;
                    case 'user-login':
                        if (responseData.showNotification != 0) {
                            showSuccessMessage(responseData.message);
                        }
                        break;
                    default:
                        showSuccessMessage(responseData.message);
                        break;
                }
            }
        });

        subscribeNotification('event.user.chat.messages', pusherAppKey, userUid, function (responseData) {
            // Message chat
            if (responseData.requestFor == 'MESSAGE_CHAT') {
                if (currentSelectedUserUid == responseData.toUserUid) {
                    __Messenger.appendReceivedMessage(responseData.type, responseData.message, responseData.createdOn);
                }

                // Set user message count
                if (responseData.userId != currentSelectedUserId) {
                    var incomingMsgEl = $('.lw-incoming-message-count-' + responseData.userId),
                        messageCount = 1;
                    if (!_.isEmpty(incomingMsgEl.text())) {
                        messageCount = parseInt(incomingMsgEl.text()) + 1;
                    }
                    incomingMsgEl.text(messageCount);
                    // Show notification of incoming messages
                    if (responseData.showNotification) {
                        showSuccessMessage(responseData.notificationMessage);
                    }
                }
            }

            // Message request
            if (responseData.requestFor == 'MESSAGE_REQUEST') {
                if (responseData.userId == currentSelectedUserId) {
                    handleMessageActionContainer(responseData.messageRequestStatus, false);
                    if (!_.isEmpty(responseData.message)) {
                        __Messenger.appendReceivedMessage(responseData.type, responseData.message, responseData.createdOn);
                    }
                } else {
                    if (responseData.showNotification) {
                        showSuccessMessage(responseData.notificationMessage);
                    }
                }
            }

        });
    };

    //for cookie terms
    function showCookiePolicyDialog() {
        if (__Cookie.get('cookie_policy_terms_accepted') != '1') {
            $('#lwCookiePolicyContainer').show();
        } else {
            $('#lwCookiePolicyContainer').hide();
        }
    };

    showCookiePolicyDialog();

    $("#lwCookiePolicyButton").on('click', function () {
        __Cookie.set('cookie_policy_terms_accepted', '1', 1000);
        showCookiePolicyDialog();
    });

    // Get messenger chat data
    function getChatMessenger(url, isAllChatMessenger) {
        var $allMessageChatButtonEl = $('#lwAllMessageChatButton'),
            $lwMessageChatButtonEl = $('#lwMessageChatButton');
        // check if request for all messenger
        if (isAllChatMessenger) {
            var isAllMessengerChatLoaded = $allMessageChatButtonEl.data('chat-loaded');
            if (!isAllMessengerChatLoaded) {
                $allMessageChatButtonEl.attr('data-chat-loaded', true);
                $lwMessageChatButtonEl.attr('data-chat-loaded', false);
                fetchChatMessages(url);
            }
        } else {
            var isMessengerLoaded = $lwMessageChatButtonEl.data('chat-loaded');
            if (!isMessengerLoaded) {
                $lwMessageChatButtonEl.attr('data-chat-loaded', true);
                $allMessageChatButtonEl.attr('data-chat-loaded', false);
                fetchChatMessages(url);
            }
        }
    };

    // Fetch messages from server
    function fetchChatMessages(url) {
        $('#lwChatDialogLoader').show();
        $('#lwMessengerContent').hide();
        __DataRequest.get(url, {}, function (responseData) {
            $('#lwChatDialogLoader').hide();
            $('#lwMessengerContent').show();
        });
    };
</script>
@stack('appScripts')
