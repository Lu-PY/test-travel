-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-11-11 16:56:17
-- 伺服器版本： 10.4.25-MariaDB
-- PHP 版本： 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `booking`
--

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '優惠券名稱',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '優惠券序號',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '優惠券描述',
  `expire_date` datetime NOT NULL COMMENT '優惠券期限',
  `discount` int(20) NOT NULL COMMENT '優惠券折數',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `hotel_account`
--

CREATE TABLE `hotel_account` (
  `id` int(20) UNSIGNED NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飯店帳號',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飯店密碼',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '負責人',
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名',
  `company_phone` int(20) NOT NULL COMMENT '公司電話',
  `stars` int(20) NOT NULL COMMENT '星級',
  `company_banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司橫幅圖',
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地區',
  `created_at` datetime NOT NULL COMMENT '建立帳號日期',
  `bank_account` int(20) NOT NULL COMMENT '銀行帳戶',
  `start_date` datetime NOT NULL COMMENT '開業日期',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司信箱',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '官網',
  `introduction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司簡介',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `hotel_comment`
--

CREATE TABLE `hotel_comment` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user.account',
  `hotel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hotel_account.id',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '評論',
  `comment_stars` int(20) NOT NULL COMMENT '評論星數',
  `created_at` datetime NOT NULL COMMENT '留言時間',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `hotel_room_list`
--

CREATE TABLE `hotel_room_list` (
  `id` int(20) NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hotel_account.account',
  `room_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '房間名稱',
  `price` int(20) NOT NULL COMMENT '價格',
  `service` int(20) NOT NULL,
  `amount` int(20) NOT NULL COMMENT '賣多少份',
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宣傳照片',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '房間說明',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `hotel_service_list`
--

CREATE TABLE `hotel_service_list` (
  `id` int(20) NOT NULL,
  `room` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hotel_list.hotel_name',
  `wifi` int(20) NOT NULL COMMENT '無線網路',
  `pool` int(20) NOT NULL COMMENT '泳池',
  `gym` int(20) NOT NULL COMMENT '健身房',
  `restaurant` int(20) NOT NULL COMMENT '餐廳 ',
  `bar` int(20) NOT NULL COMMENT 'Bar',
  `parking` int(20) NOT NULL COMMENT '停車場',
  `laundry` int(20) NOT NULL COMMENT '洗衣間',
  `meeting_room` int(11) NOT NULL COMMENT '會議室',
  `arcade` int(11) NOT NULL COMMENT '遊樂場'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `room_service_list`
--

CREATE TABLE `room_service_list` (
  `id` int(20) NOT NULL,
  `room` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hotel_room_list.room_name',
  `pet` int(20) NOT NULL COMMENT '寵物',
  `tv` int(20) NOT NULL COMMENT '電視',
  `tub` int(20) NOT NULL COMMENT '浴缸',
  `meal` int(20) NOT NULL COMMENT '供餐',
  `mini_bar` int(20) NOT NULL COMMENT 'mini Bar',
  `window` int(20) NOT NULL COMMENT '有窗戶',
  `corner` int(20) NOT NULL COMMENT '邊間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `total_order_list`
--

CREATE TABLE `total_order_list` (
  `id` int(20) UNSIGNED NOT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'users.account',
  `product_id` int(255) NOT NULL COMMENT 'hotel_room_list.room_name / trip_event.trip_name',
  `status` int(20) NOT NULL COMMENT '是否付費',
  `order_date` datetime(6) NOT NULL COMMENT '訂購日期',
  `amount` int(20) NOT NULL COMMENT '訂單數'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `total_order_list_detail`
--

CREATE TABLE `total_order_list_detail` (
  `id` int(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'total_order_list.product_id',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `price` int(20) NOT NULL COMMENT '價格',
  `date` datetime NOT NULL COMMENT '行程日期',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行程描述',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `travel_account`
--

CREATE TABLE `travel_account` (
  `id` int(20) UNSIGNED NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飯店帳號',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飯店密碼',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '負責人',
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名',
  `company_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司電話',
  `company_banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司橫幅圖',
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地區',
  `created_at` datetime NOT NULL COMMENT '建立帳號日期',
  `bank_account` int(20) NOT NULL COMMENT '銀行帳戶',
  `start_date` date NOT NULL COMMENT '開業日期',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司信箱',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '官網',
  `introduction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司簡介',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `travel_account`
--

INSERT INTO `travel_account` (`id`, `account`, `password`, `name`, `company_name`, `company_phone`, `company_banner`, `area`, `created_at`, `bank_account`, `start_date`, `email`, `website`, `introduction`, `valid`) VALUES
(1, 'Moon123', 'Moon123', '樂月月', '月亮旅團', '0912345678', 'Momo', '0', '2022-11-04 10:37:23', 1231456464, '2022-11-04', 'moon123@moon.com.tw', 'https://moon123.com.tw', '月亮月亮', 1),
(2, 'Kitty321', 'Kitty321', 'Kitty', '無嘴喵旅行社', '0976482462', 'Kitty', '0', '2022-11-04 10:59:02', 156455, '2022-10-10', 'Kitty321@kkity.com.tw', 'https://Kitty456.com.tw', 'KItttttty', 1),
(3, 'Momo123', 'Momo123', 'Momo', 'Momo trip', '0912345646', '1.png', '0', '2022-11-04 13:53:15', 111254681, '2022-11-22', 'Momo123@momo.com.tw', 'https://Momo123.com.tw', 'Momo GOGO', 1),
(4, 'Joe', 'JJ123', 'Joe', 'Joe 旅行', '097534584', 'Joe', '0', '2022-11-04 13:58:30', 2147483647, '2019-09-26', 'Joe@mail.com', 'https://Joe123.com.tw', 'Joe Goo', 1),
(5, 'test', 'test', 'test', 'test', '0911111', 'batman.jpg', '2', '2022-11-04 14:22:33', 123456, '2022-11-17', '1112314@dasda.cca', '12313.cccomc.tw', 'test', 1),
(6, 'Allmin', 'max123', 'Mini', 'Mini', '034525416', '', '0', '2022-11-07 09:37:39', 123321123, '2022-11-22', 'Mini123@minmail.com', 'https://min123.com.tw', 'Mini123', 1),
(7, '5558', '5558', '555', '555', '0924675813', 'daredevil.jpg', '1', '2022-11-07 11:22:59', 1205254355, '1955-05-05', '55s55s@55xmail.com', 'https://555s.com.tw', '55s5s55s', 1),
(8, '8885', '8885', '888', '888', '0988888888', 'clothes_v5.png', '2', '2022-11-07 11:25:00', 1828388848, '1988-08-08', '88a8a@88amail.com', 'https://888a.com.tw', '888a888aa888a', 1),
(9, 'test123.', '123456', 'test', 'test', '0976482462', 'light.jpg', '2', '2022-11-10 14:04:53', 1457296835, '2022-11-25', 'aasf4asf65@asfasf8fas6', '12313.cccomc.tw', 'test', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `trip_comment`
--

CREATE TABLE `trip_comment` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user.account',
  `trip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'trip_event.id',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '評論',
  `comment_stars` int(20) NOT NULL COMMENT '評論星數',
  `created_at` datetime NOT NULL COMMENT '留言時間',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `trip_comment`
--

INSERT INTO `trip_comment` (`id`, `name`, `trip`, `comment`, `comment_stars`, `created_at`, `valid`) VALUES
(1, 'admin', '1', 'good!', 4, '2022-11-10 13:26:56', 1),
(2, 'admin', '2', 'good!', 5, '2022-11-10 13:26:56', 1),
(3, 'admin', '3', 'good!', 5, '2022-11-10 13:26:56', 1),
(4, 'admin2', '1', 'good!', 5, '2022-11-10 13:26:56', 1),
(5, 'admin2', '2', 'good!', 2, '2022-11-10 13:26:56', 1),
(6, 'admin', '5', 'good!', 5, '2022-11-10 13:26:56', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `trip_event`
--

CREATE TABLE `trip_event` (
  `id` int(20) NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'travel_account.account',
  `trip_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行程名稱',
  `price` int(20) NOT NULL COMMENT '價格',
  `service` int(20) NOT NULL,
  `amount` int(20) NOT NULL COMMENT '賣多少份',
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宣傳照片',
  `guide` int(20) NOT NULL COMMENT '有無導遊',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行程說明',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `trip_event`
--

INSERT INTO `trip_event` (`id`, `owner`, `trip_name`, `price`, `service`, `amount`, `picture`, `guide`, `description`, `start_date`, `end_date`, `created_at`, `valid`) VALUES
(1, 'test', 'test132', 2000, 2, 20, 'test.jpg', 0, 'test123', '2022-11-01', '2022-11-23', '2022-09-20 12:52:36', 1),
(2, 'Momo123', 'momo132', 2000, 1, 20, 'momo.jpg', 0, 'momo123', '2022-12-01', '2022-12-05', '2022-10-20 12:52:36', 1),
(3, 'test', 'test3333', 8000, 2, 11, 'test333', 0, 'test3333', '2022-11-08', '2022-11-10', '2022-11-01 16:29:58', 1),
(4, 'test', 'test444', 850, 2, 11, 'test4444', 0, 'test4444', '2022-11-07', '2022-11-15', '2022-11-01 16:29:58', 1),
(5, 'test', 'test555', 8200, 2, 11, 'test555', 0, 'test555', '2022-11-12', '2022-11-15', '2022-10-12 16:29:58', 1),
(6, 'test', 'test666', 8000, 2, 11, 'test6666', 0, 'test666', '2022-11-23', '2022-11-30', '2022-11-01 16:29:58', 1),
(7, 'Kitty321', 'kitty556', 9999, 2, 11, 'kitty123', 1, 'kitty556', '2022-12-07', '2022-12-21', '2022-11-07 16:29:58', 1),
(8, 'test', 'test895046', 200, 1, 30, 'test.jpg', 0, 'testtesttesttest', '2022-11-08', '2022-11-16', '2022-11-10 10:50:47', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `trip_service_list`
--

CREATE TABLE `trip_service_list` (
  `id` int(20) NOT NULL,
  `trip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'trip_event.trip_name',
  `indoor_outdoor` int(20) NOT NULL COMMENT '室內室外',
  `mountain` int(20) NOT NULL COMMENT '登山',
  `water` int(20) NOT NULL COMMENT '戲水',
  `sky` int(20) NOT NULL COMMENT '空中景點',
  `meal` int(20) NOT NULL COMMENT '供餐',
  `walk` int(20) NOT NULL COMMENT '徒步',
  `car` int(20) NOT NULL COMMENT '包車',
  `bike` int(20) NOT NULL COMMENT '腳踏車'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `trip_service_list`
--

INSERT INTO `trip_service_list` (`id`, `trip`, `indoor_outdoor`, `mountain`, `water`, `sky`, `meal`, `walk`, `car`, `bike`) VALUES
(1, 'test', 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'Joe_song_trip', 0, 0, 0, 0, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(20) UNSIGNED NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳戶',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `phone` int(20) NOT NULL COMMENT '電話',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '信箱',
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身分證',
  `birthday` datetime NOT NULL COMMENT '生日',
  `gender` int(20) NOT NULL COMMENT '性別',
  `created_at` datetime NOT NULL COMMENT '創建時間',
  `points` int(20) NOT NULL COMMENT '點數',
  `level` int(20) NOT NULL COMMENT '等級',
  `coupon` int(20) NOT NULL COMMENT '優惠券',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `account`, `password`, `name`, `phone`, `email`, `identification`, `birthday`, `gender`, `created_at`, `points`, `level`, `coupon`, `valid`) VALUES
(1, 'admin', '12345', 'Tom', 123456789, 'god@777', '', '0000-00-00 00:00:00', 0, '2022-11-03 16:00:26', 0, 0, 0, 1),
(2, 'admin2', '1234', 'Jerry', 90454646, 'godd@77', '', '0000-00-00 00:00:00', 0, '2022-11-03 16:06:34', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user_coupon`
--

CREATE TABLE `user_coupon` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'users.account',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'coupon.name',
  `amount` int(20) NOT NULL COMMENT '優惠券數量',
  `expire_date` datetime NOT NULL COMMENT 'coupon.expire_date',
  `discount` int(20) NOT NULL COMMENT 'coupon.discount',
  `valid` int(20) NOT NULL COMMENT '軟刪除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `user_order`
--

CREATE TABLE `user_order` (
  `id` int(6) UNSIGNED NOT NULL,
  `product_hotel_id` int(6) UNSIGNED NOT NULL COMMENT '對應product-hotel的id',
  `product-travel-id` int(6) NOT NULL COMMENT '對應product-travel的id',
  `amount` int(4) UNSIGNED NOT NULL,
  `buyer_id` int(3) NOT NULL COMMENT '對應一般使用者的id',
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `hotel_account`
--
ALTER TABLE `hotel_account`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `hotel_comment`
--
ALTER TABLE `hotel_comment`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `hotel_room_list`
--
ALTER TABLE `hotel_room_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `hotel_service_list`
--
ALTER TABLE `hotel_service_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `room_service_list`
--
ALTER TABLE `room_service_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `total_order_list`
--
ALTER TABLE `total_order_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `total_order_list_detail`
--
ALTER TABLE `total_order_list_detail`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `travel_account`
--
ALTER TABLE `travel_account`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `trip_comment`
--
ALTER TABLE `trip_comment`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `trip_event`
--
ALTER TABLE `trip_event`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `trip_service_list`
--
ALTER TABLE `trip_service_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_coupon`
--
ALTER TABLE `user_coupon`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hotel_account`
--
ALTER TABLE `hotel_account`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hotel_comment`
--
ALTER TABLE `hotel_comment`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hotel_room_list`
--
ALTER TABLE `hotel_room_list`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hotel_service_list`
--
ALTER TABLE `hotel_service_list`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `room_service_list`
--
ALTER TABLE `room_service_list`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `total_order_list`
--
ALTER TABLE `total_order_list`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `total_order_list_detail`
--
ALTER TABLE `total_order_list_detail`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `travel_account`
--
ALTER TABLE `travel_account`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trip_comment`
--
ALTER TABLE `trip_comment`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trip_event`
--
ALTER TABLE `trip_event`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trip_service_list`
--
ALTER TABLE `trip_service_list`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_coupon`
--
ALTER TABLE `user_coupon`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_order`
--
ALTER TABLE `user_order`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
