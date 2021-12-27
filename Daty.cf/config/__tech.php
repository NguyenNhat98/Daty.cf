<?php
// Response Codes & other global configurations
$techConfig = require app_path('Daty/__Laraware/Config/tech-config.php');

$techAppConfig = [
	/* Feature User Count
	------------------------------------------------------------------------- */
	'random_feature_user_count' => '12',

	/* Account related
    ------------------------------------------------------------------------- */
    'account' => [
        'expiry'    				=> 24 * 2, // 48 Hours
        'password_reminder_expiry'  => 24 * 2, // hours
		'change_email_expiry'       => 24 * 2 // hours
	],

	/* Login Otp valid minutes
    ------------------------------------------------------------------------- */
    'otp_expiry' => 5,

    /* Email Config
    ------------------------------------------------------------------------- */
    'mail_from'         =>  [
        env('MAIL_FROM_ADD', 'your@domain.com'),
        env('MAIL_FROM_NAME', 'E-Mail Service')
	],

	/* There is defined the key for social login providers
    ------------------------------------------------------------------------- */
    'social_login_driver' =>  [
        'via-facebook'  => 'facebook',
        'via-google' 	=> 'google',
    ],

    /* There is defined the key for social login providers
    ------------------------------------------------------------------------- */
    'social_login_driver_keys' =>  [
        'facebook'   => 'via-facebook',
        'google'     => 'via-google',
	],

	/* Status Code Multiple Uses
    ------------------------------------------------------------------------- */
    'status_codes' => [
        1 => 'Hoạt động',
        2 => 'Không hoạt động',
        3 => 'Bị chặn',
        4 => 'Chưa được kích hoạt',
        5 => 'Đã xóa',
        6 => 'Hạn chế',
        7 => 'Đang chờ',
        8 => 'Đã hoàn thành',
        9 => 'Mời'
	],

	/* User Online Status
    ------------------------------------------------------------------------- */
    'user_online_status' => [
        1 => 'Hoạt động',
        2 => 'Nghĩ',
        3 => 'Không hoạt động'
	],

	/* User Wallet Transaction type
    ------------------------------------------------------------------------- */
    'user_transaction_type' => [
        1 => 'Mua gói',
        2 => 'Quà',
        3 => 'Hình dán',
        4 => 'Tăng cấu hình',
        5 => 'Gói cao cấp',
        6 => 'Tiền thưởng'
    ],

    /* Profile Update Wizard
	------------------------------------------------------------------------- */
    'profile_update_wizard' => [
    	'step_one' => [
			'profile_picture',
			'cover_picture',
			'gender',
			'dob'
		],
		'step_two' => [
			'location_latitude',
			'location_longitude'
		]
    ],

	/* Payment Status Code Multiple Uses
	------------------------------------------------------------------------- */
	'payments' => [
		'payment_methods' => [
			1 => ('PayPal'),
			2 => ('Stripe'),

            3 => ('Paypal Checkout')
		],
		'status_codes' => [
			1 => 'Đang chờ thanh toán', // PayPal IPN Payments
			2 => 'Đã hoàn thành',
			3 => 'Thanh toán không thành công',
			4 => 'Đang chờ xử lý',
			5 => 'Đã hoàn lại'
		],
		'payment_checkout_modes' => [
			1 => 'Kiểm tra',
        	2 => 'Trực tiếp'
		],
		'credit_type' => [
			1 => 'Tiền thưởng',
			2 => 'Đã mua'
		]
	],

	/* Mail Drivers
    ------------------------------------------------------------------------- */
    'mail_drivers' => [
        'smtp' => [
            'id' => 'smtp',
            'name' => 'SMTP',
            'config_data' => [
                'port'          =>  'smtp_mail_port',
                'host'          =>  'smtp_mail_host',
                'username'      =>  'smtp_mail_username',
                'encryption'    =>  'smtp_mail_encryption',
                'password'      =>  'smtp_mail_password_or_apikey'
            ]
        ],
        'sparkpost' => [
            'id' => 'sparkpost',
            'name' => 'Sparkpost',
            'config_data' => [
                'sparkpost_mail_password_or_apikey'
            ]
        ],
        'mailgun' => [
            'id' => 'mailgun',
            'name' => 'Mailgun',
            'config_data' => [
                'mailgun_domain',
                'mailgun_mail_password_or_apikey',
                'mailgun_endpoint'
            ]
        ],
    ],

    /* Mail encryption types
    ------------------------------------------------------------------------- */
    'mail_encryption_types' => [
        'ssl' => 'SSL',
        'tls' => 'TLS',
        'starttls' => 'STARTTLS',
    ],

	/* Report User Status Code Multiple Uses
    ------------------------------------------------------------------------- */
    'report_user_status_codes' => [
        1 => 'Chờ đợi',
        2 => 'Chấp nhận',
        3 => 'Từ chối'
    ],

    /* Define logo name of application
    ------------------------------------------------------------------------- */
    'logo_name' => 'logo.png',

    /* Define small logo name of application
    ------------------------------------------------------------------------- */
    'small_logo_name' => 'logo-short.svg',

    /* Define favicon name of application
    ------------------------------------------------------------------------- */
    'favicon_name' => 'favicon.ico',

    /* Default paginate count
    ------------------------------------------------------------------------- */
    'paginate_count' => 10,

    /* Digital Ocean Keys
    ------------------------------------------------------------------------- */
    'current_filesystem_driver' => env('FILESYSTEM_DRIVER', 'public-media-storage'),
    'do_full_url' => env('DO_FULL_URL'),

    /* Messenger Items
    ------------------------------------------------------------------------- */
    'messenger' => [
        'types' => [
            1 => 'Văn bản',
            2 => 'Tệp đã tải lên',
            3 => 'Biểu tượng cảm xúc',
            4 => 'Cuộc gọi âm thanh',
            5 => 'Cuộc gọi video',
            6 => 'Âm thanh',
            7 => 'Video',
            8 => 'Giphy',
            9 => 'Lời mời trò chuyện',
            10 => 'Chấp nhận',
            11 => 'Từ chối',
            12 => 'Hình dán'
        ],
        'statuses' => [
            1 => 'Gửi',
            2 => 'Đã gửi',
            3 => 'Đã xem'
        ]
    ],

    /* User Settings / Profile related items
    ------------------------------------------------------------------------- */
    'fake_data_generator' => [
    	'records_limits' => 100,
    	'default_password' => 'pass1234'
    ],

    'age_restriction' => [
    	'minimum' => 18,
    	'maximum' => 60
    ],

    /* User Settings / Profile related items
    ------------------------------------------------------------------------- */
    'user_settings' => [
        // Search / Find Matches Pagination
        'search_pagination' => 12,
        'gender' => [

            1 => 'NAM',
            2 => 'NỮ',
            3 => 'GAY'
        ],
        'preferred_language' => [
            1 => 'Tiếng Anh',
            2 => 'Tiếng Việt',
            3 => 'Tiếng Trung',
            4 => 'Tiếng Nhật',
            5 => 'Tiếng Hàn',
            6 => 'Tiếng Nga',
            7 => 'Tiếng Pháp',
            8 => 'Khác'

        ],
        'relationship_status' => [
            1 => 'Độc thân',
            2 => 'Đã kết hôn',
            3 => 'Đã ly hôn',
            4 => 'Góa phụ'
        ],
        'work_status' => [
            1 => 'Sinh viên',
            2 => 'Đang đi làm',
            3 => 'Chưa việc làm',
            4 => 'Về hưu',
            5 => 'Tự kinh doanh',
            6 => 'Khác'
        ],
        'educations' => [
            1 => 'Tiểu học',
            2 => 'Trung học',
            3 => 'Trung học phổ thông',
            4 => 'Đại học',
            5 => 'Bằng cấp cao',
            6 => 'Khác'
        ]
    ],
];

$appTechConfig = [];
if (file_exists(base_path('user-tech-config.php'))) {
    $appTechConfig = require base_path('user-tech-config.php');
}
return array_merge( $techConfig, $techAppConfig, $appTechConfig);
