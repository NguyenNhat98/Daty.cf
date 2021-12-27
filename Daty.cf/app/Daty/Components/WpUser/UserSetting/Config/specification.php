<?php
return [
    'groups' => [
        'looks' => [
            'title' => 'Tổng quan',
            'icon'  => '<i class="far fa-smile text-primary"></i>',
            'items' => [
                'ethnicity' => [
                    'name'          => 'Dân tộc',
                    'input_type'    => 'select',
                    'options' => [
                        'kinh'            => 'Kinh',
                        'tay'             => 'Tày',
                        'thai'          => 'Thái',
                        'muong'         => 'Mường',
                        'hmong'         => 'H.Mong',
                        'nung'             => 'Nùng',
                        'dao'             => 'Dao',
                        'hoa'             => 'Hoa',
                        'khac'             => 'Khác',
                    ]
                ],
                'body_type' => [
                    'name'          => 'Hình dáng',
                    'input_type'    => 'select',
                    'options' => [
                        'slim'          => 'Gầy',
                        'sporty'        => 'Thể thao',
                        'curvy'         => 'Đường cong',
                        'round'         => 'Tròn',
                        'supermodel'    => 'Siêu mẫu',
                        'average'       => 'Trung bình',
                        'other'         => 'Khác'
                    ]
                ],
                'height' => [
                    'name' => 'Chiều cao',
                    'input_type'    => 'select',
                    'options' => [
                        "148"            => "148 cm",
                        "149"            => "149 cm",
                        "150"            => "150 cm",
                        "151"            => "151 cm",
                        "152"            => "152 cm",
                        "153"            => "153 cm",
                        "154"            => "154 cm",
                        "155"            => "155 cm",
                        "156"            => "156 cm",
                        "157"            => "157 cm",
                        "158"            => "158 cm",
                        "159"            => "159 cm",
                        "160"            => "160 cm",
                        "161"            => "161 cm",
                        "162"            => "162 cm",
                        "163"            => "163 cm",
                        "164"            => "164 cm",
                        "165"            => "165 cm",
                        "166"            => "166 cm",
                        "167"            => "167 cm",
                        "168"            => "168 cm",
                        "169"            => "169 cm",
                        "170"            => "170 cm",
                        "171"            => "171 cm",
                        "172"            => "172 cm",
                        "173"            => "173 cm",
                        "174"            => "174 cm",
                        "175"            => "175 cm",
                        "176"            => "176 cm",
                        "177"            => "177 cm",
                        "178"            => "178 cm",
                        "179"            => "179 cm",
                        "180"            => "180 cm",
                        "181"            => "181 cm",
                        "182"            => "182 cm",
                        "183"            => "183 cm",
                        "184"            => "184 cm",
                        "185"            => "185 cm",
                        "186"            => "186 cm",
                        "187"            => "187 cm",
                        "188"            => "188 cm",

                    ]
                ],
                'hair_color' => [
                    'name'          => 'Màu tóc',
                    'input_type'    => 'select',
                    'options'   => [

                        'black'                     => 'Đen',
                        'white'                     => 'Trắng',
                        'gray'                      => 'Xám',
                        'red'                       => 'Đỏ',
                        'yellow'                    => 'Vàng',
                        'blue'                      => 'Xanh',
                        'pink'                      => 'Hồng',
                        'purple'                    => 'Tím',
                        'other'                     => 'Khác'
                    ]
                ]
            ]
        ],
        'personality' => [
            'title' => 'Tính cách',
            'icon'  => '<i class="fas fa-child text-success"></i>',
            'items' => [
                'nature' => [
                    'name'          => 'Tổng quan',
                    'input_type'    => 'select',
                    'options' => [
                        'adventurous'       => 'Phiêu lưu',
                        'affection'       => 'Tình cảm',
                        'calm'              => 'Điềm tĩnh',
                        'careless'          => 'Cẩu thả',
                        'enthusiasm'       => 'Nhiệt tình',
                        'strong'            =>'Mạnh mẽ',
                        'honest'            => 'Thật thà',
                        'generous'          => 'Hào phóng',
                        'humorous'          => 'Khôi hài',
                        'lively'            => 'Sống động',
                        'reserved'          => 'Kín đáo',
                        'shy'               => 'Nhút nhát',
                        'stubborn'          => 'Bướng bỉnh',
                        'thoughtful'        => 'Chu đáo',
                        'friendly'          => 'Thân thiện',
                        'polite'            => 'Lịch sự',
                        'personalities'       => 'Cá tính',
                        'careful'           => 'Cẩn thận',
                        'optimistic'        => 'Lạc quan'
                    ]
                ],
                'friends' => [
                    'name'          => 'Bạn bè',
                    'input_type'    => 'select',
                    'options' => [
                        'no_friends'        => 'Không có bạn bè',
                        'some_friends'      => 'Một số người bạn',
                        'many_friends'      => 'Nhiều bạn',
                        'only_good_friends' => 'Chỉ những người bạn tốt',
                    ]
                ],
                'children' => [
                    'name'          => 'Trẻ em',
                    'input_type'    => 'select',
                    'options' => [
                        "no_never"                          => 'Không bao giờ',
                        "someday_maybe"                     => 'Có thể một ngày nào đó',
                        "expecting"                         => 'Mong đợi',
                        "i_already_have_kids"               => 'Đã có con',
                    ]
                ],
                'pets' => [
                    'name'          => 'Thú cưng',
                    'input_type'    => 'select',
                    'options' => [
                        'none'      => 'Không ',
                        'have_pets' => 'Có nhiều thú cung'
                    ]
                ]
            ]
        ],
        'lifestyle' => [
            'title' => 'Cách sống',
            'icon'  => '<i class="fas fa-umbrella-beach text-warning"></i>',
            'items' => [
                'religion' => [
                    'name'          => 'Tôn giáo',
                    'input_type'    => 'select',
                    'options' => [
                        'muslim'        => 'Hồi giáo',

                        'buddhist'      => 'Phật giáo',
                        'catholic'      => 'Công giáo',

                        'jewish'        => 'Do thái',

                        'other'         => 'Khác'
                    ]
                ],
                'i_live_with' => [
                    'name'          => 'Tình trạng',
                    'input_type'    => 'select',
                    'options' => [
                        'alone'     => 'Một mình',
                        'parents'   => 'Cha mẹ',
                        'friends'   => 'Bạn bè',
                        'children'  => 'Trẻ em',
                        'other'     => 'Khác'
                    ]
                ],

                'travel' => [
                    'name'          => 'Du lịch',
                    'input_type'    => 'select',
                    'options' => [
                        "yes_all_the_time"  => 'Có, mọi lúc',
                        "yes_sometimes"     => 'Thỉng thoảng',
                        "not_very_much"     => 'Không nhiều lắm',
                        "no"                => 'Không'
                    ]
                ],


            ]
        ],
        'favorites' => [
            'title' => 'Yêu thích',
            'icon'  => '<i class="far fa-heart text-danger"></i>',
            'items' => [
                'music_genre' => [
                    'name'          => 'Thể loại âm nhạc',
                    'input_type'    => 'textbox'
                ],
                'singer' => [
                    'name'          => 'Ca sĩ',
                    'input_type'    => 'textbox'
                ],
                'song' => [
                    'name'          => 'Bài hát',
                    'input_type'    => 'textbox'
                ],
                'hobby' => [
                    'name'          => 'Sở thích',
                    'input_type'    => 'textbox'
                ],
                'sport' => [
                    'name'          => 'Thể thao',
                    'input_type'    => 'textbox'
                ],
                'book' => [
                    'name'          => 'Sách',
                    'input_type'    => 'textbox'
                ],
                'dish' => [
                    'name'          => 'Món ăn',
                    'input_type'    => 'textbox'
                ],
                'color' => [
                    'name'          => 'Màu sách',
                    'input_type'    => 'textbox'
                ],
                'movie' => [
                    'name'          => 'Phim',
                    'input_type'    => 'textbox'
                ],
                'other' => [
                    'name'          => 'Khác',
                    'input_type'    => 'textbox'
                ]
            ]
        ],
    ]
];
