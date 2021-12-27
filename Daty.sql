-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 21, 2020 lúc 06:51 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `l5`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `abuse_reports`
--

CREATE TABLE `abuse_reports` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `for_users__id` int(10) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `moderator_remarks` varchar(255) DEFAULT NULL,
  `moderated_by_users__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `abuse_reports`
--

INSERT INTO `abuse_reports` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `for_users__id`, `by_users__id`, `reason`, `moderator_remarks`, `moderated_by_users__id`) VALUES
(4, 'b377435f-1681-40a0-ac71-263a528a66c5', '2020-12-11 01:04:59', '2020-12-11 01:04:59', 1, 4, 7, 'gdrgdfgfdgfd', NULL, NULL),
(5, 'ec2c0b79-85d0-4031-9851-b7484387e200', '2020-12-15 21:26:32', '2020-12-15 21:26:32', 1, 26, 42, 'không thaich thôi', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activity_logs`
--

CREATE TABLE `activity_logs` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `__data` text DEFAULT NULL,
  `entity_type` tinyint(3) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Short description',
  `action_type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Create, Update, Delete',
  `entity_id` int(10) UNSIGNED DEFAULT NULL,
  `user_role_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `activity_logs`
--

INSERT INTO `activity_logs` (`_id`, `created_at`, `user_id`, `__data`, `entity_type`, `project_id`, `action_type`, `entity_id`, `user_role_id`) VALUES
(1, '2020-11-03 03:17:33', 2, 'embebibo embebibo update profile picture.', NULL, NULL, NULL, NULL, NULL),
(2, '2020-11-03 03:18:06', 2, 'embebibo embebibo update cover picture.', NULL, NULL, NULL, NULL, NULL),
(3, '2020-11-04 08:34:02', 2, 'embebibo embebibo update own location.', NULL, NULL, NULL, NULL, NULL),
(4, '2020-11-04 08:39:17', 2, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(5, '2020-11-04 08:41:24', 2, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(6, '2020-11-04 08:48:06', 3, 'embebibo1 embebibo1 update profile picture.', NULL, NULL, NULL, NULL, NULL),
(7, '2020-11-04 08:48:30', 3, 'embebibo1 embebibo1 update cover picture.', NULL, NULL, NULL, NULL, NULL),
(8, '2020-11-04 08:48:46', 3, 'embebibo1 embebibo1 update own location.', NULL, NULL, NULL, NULL, NULL),
(9, '2020-11-04 08:49:23', 3, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(10, '2020-11-04 08:49:28', 3, 'embebibo embebibo profile visited.', NULL, NULL, NULL, NULL, NULL),
(11, '2020-11-04 08:59:00', 3, 'Booster activated by user embebibo1 embebibo1', NULL, NULL, NULL, NULL, NULL),
(12, '2020-11-04 09:27:09', 2, 'embebibo1 embebibo1 profile visited.', NULL, NULL, NULL, NULL, NULL),
(13, '2020-11-04 09:27:24', 2, 'embebibo1 embebibo1 profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(14, '2020-11-04 09:27:28', 2, 'embebibo1 embebibo1 profile liked.', NULL, NULL, NULL, NULL, NULL),
(15, '2020-11-04 09:28:48', 2, 'embebibo embebibo update profile picture.', NULL, NULL, NULL, NULL, NULL),
(16, '2020-11-04 09:29:02', 2, 'embebibo embebibo update cover picture.', NULL, NULL, NULL, NULL, NULL),
(17, '2020-11-04 09:30:25', 3, 'embebibo embebibo profile liked.', NULL, NULL, NULL, NULL, NULL),
(18, '2020-11-04 09:30:46', 3, 'embebibo embebibo profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(19, '2020-11-04 09:31:03', 3, 'embebibo embebibo profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(20, '2020-11-04 14:39:22', 4, 'japan26081998 japan26081998 update profile picture.', NULL, NULL, NULL, NULL, NULL),
(21, '2020-11-04 14:39:29', 4, 'japan26081998 japan26081998 update cover picture.', NULL, NULL, NULL, NULL, NULL),
(22, '2020-11-04 14:40:33', 4, 'japan26081998 japan26081998 update own location.', NULL, NULL, NULL, NULL, NULL),
(23, '2020-11-04 14:41:10', 4, 'embebibo1 embebibo1 profile visited.', NULL, NULL, NULL, NULL, NULL),
(24, '2020-11-04 14:41:16', 4, 'embebibo1 embebibo1 profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(25, '2020-11-04 14:41:52', 4, 'embebibo1 embebibo1 profile liked.', NULL, NULL, NULL, NULL, NULL),
(26, '2020-11-06 14:56:56', 5, 'embebibo2 embebibo2 update profile picture.', NULL, NULL, NULL, NULL, NULL),
(27, '2020-11-06 14:57:05', 5, 'embebibo2 embebibo2 update cover picture.', NULL, NULL, NULL, NULL, NULL),
(28, '2020-11-06 15:03:08', 5, 'embebibo2 embebibo2 update own location.', NULL, NULL, NULL, NULL, NULL),
(29, '2020-11-06 15:03:18', 5, 'embebibo2 embebibo2 update own location.', NULL, NULL, NULL, NULL, NULL),
(30, '2020-11-06 15:04:12', 5, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(31, '2020-11-06 15:09:01', 5, 'embebibo2 embebibo2 upload new photos.', NULL, NULL, NULL, NULL, NULL),
(32, '2020-11-06 15:09:11', 5, 'embebibo2 embebibo2 upload new photos.', NULL, NULL, NULL, NULL, NULL),
(33, '2020-11-06 15:18:57', 6, 'embebibo3 embebibo3 update profile picture.', NULL, NULL, NULL, NULL, NULL),
(34, '2020-11-06 15:19:04', 6, 'embebibo3 embebibo3 update cover picture.', NULL, NULL, NULL, NULL, NULL),
(35, '2020-11-06 15:19:15', 6, 'embebibo3 embebibo3 update own location.', NULL, NULL, NULL, NULL, NULL),
(36, '2020-11-25 05:44:42', 7, 'embebibo embebibo update profile picture.', NULL, NULL, NULL, NULL, NULL),
(37, '2020-11-25 05:44:45', 7, 'embebibo embebibo update cover picture.', NULL, NULL, NULL, NULL, NULL),
(38, '2020-11-25 05:45:22', 7, 'embebibo embebibo update own location.', NULL, NULL, NULL, NULL, NULL),
(39, '2020-11-25 06:31:04', 7, 'embebibo3 embebibo3 profile visited.', NULL, NULL, NULL, NULL, NULL),
(40, '2020-11-25 06:44:45', 7, 'embebibo2 embebibo2 profile visited.', NULL, NULL, NULL, NULL, NULL),
(41, '2020-11-26 14:16:28', 7, 'dep sticker created. ', NULL, NULL, NULL, NULL, NULL),
(42, '2020-11-26 14:16:30', 7, 'dep sticker created. ', NULL, NULL, NULL, NULL, NULL),
(43, '2020-11-26 14:18:04', 7, 'embebibo2 embebibo2 user verified.', NULL, NULL, NULL, NULL, NULL),
(44, '2020-11-26 14:20:54', 7, 'dep page created. ', NULL, NULL, NULL, NULL, NULL),
(45, '2020-11-26 16:14:02', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(46, '2020-11-26 16:14:11', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(47, '2020-11-26 16:15:10', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(48, '2020-11-26 16:15:19', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(49, '2020-11-26 16:15:26', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(50, '2020-11-26 16:15:41', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(51, '2020-11-26 16:16:35', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(52, '2020-11-26 16:19:42', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(53, '2020-11-26 16:19:56', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(54, '2020-11-26 16:20:11', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(55, '2020-11-26 16:20:17', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(56, '2020-11-26 16:22:30', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(57, '2020-11-26 16:22:37', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(58, '2020-11-26 16:23:17', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(59, '2020-11-26 16:23:39', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(60, '2020-11-26 16:24:41', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(61, '2020-11-26 16:25:21', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(62, '2020-11-27 09:08:55', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(63, '2020-11-27 10:08:51', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(64, '2020-11-27 15:31:03', 7, 'Abuse Report Moderated by embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(65, '2020-11-27 15:31:50', 7, 'User settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(66, '2020-11-27 16:56:49', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(67, '2020-11-27 17:14:23', 7, 'japan26081998 japan26081998 profile visited.', NULL, NULL, NULL, NULL, NULL),
(68, '2020-11-27 17:18:52', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(69, '2020-11-27 17:24:55', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(70, '2020-11-27 17:24:55', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(71, '2020-11-27 17:24:55', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(72, '2020-11-27 17:25:01', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(73, '2020-11-27 17:25:01', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(74, '2020-11-27 17:25:01', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(75, '2020-11-27 17:25:04', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(76, '2020-11-27 17:25:04', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(77, '2020-11-27 17:25:04', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(78, '2020-11-27 17:25:07', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(79, '2020-11-27 17:25:07', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(80, '2020-11-27 17:25:07', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(81, '2020-11-27 17:26:15', 7, 'Christa McKenzie profile visited.', NULL, NULL, NULL, NULL, NULL),
(82, '2020-11-27 17:26:55', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(83, '2020-11-27 17:26:55', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(84, '2020-11-27 17:26:55', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(85, '2020-11-27 17:26:58', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(86, '2020-11-27 17:26:58', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(87, '2020-11-27 17:26:58', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(88, '2020-11-27 17:27:19', 7, 'Murl Welch profile visited.', NULL, NULL, NULL, NULL, NULL),
(89, '2020-11-27 17:37:14', 7, 'Tanya Halvorson profile liked.', NULL, NULL, NULL, NULL, NULL),
(90, '2020-11-27 17:37:43', 7, 'Kiarra Jast profile liked.', NULL, NULL, NULL, NULL, NULL),
(91, '2020-11-27 17:37:57', 7, 'Murl Welch profile liked.', NULL, NULL, NULL, NULL, NULL),
(92, '2020-11-27 17:38:20', 7, 'embebibo3 embebibo3 profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(93, '2020-11-27 17:38:48', 7, 'Christa McKenzie profile liked.', NULL, NULL, NULL, NULL, NULL),
(94, '2020-11-27 17:43:22', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(95, '2020-11-27 17:43:36', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(96, '2020-11-27 17:43:44', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(97, '2020-11-27 17:44:11', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(98, '2020-11-27 17:44:27', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(99, '2020-11-27 17:44:46', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(100, '2020-11-27 17:45:37', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(101, '2020-11-27 17:45:37', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(102, '2020-11-27 17:45:37', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(103, '2020-11-27 17:45:40', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(104, '2020-11-27 17:45:40', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(105, '2020-11-27 17:45:40', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(106, '2020-11-27 17:45:43', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(107, '2020-11-27 17:45:43', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(108, '2020-11-27 17:45:43', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(109, '2020-11-27 17:45:52', 7, 'Earline Effertz profile liked.', NULL, NULL, NULL, NULL, NULL),
(110, '2020-11-27 17:52:14', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(111, '2020-11-27 17:53:21', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(112, '2020-11-27 17:57:07', 7, '1m52 package created. ', NULL, NULL, NULL, NULL, NULL),
(113, '2020-11-27 18:01:03', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(114, '2020-11-28 09:27:20', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(115, '2020-11-28 10:11:56', 7, 'embebibo1 embebibo1 profile visited.', NULL, NULL, NULL, NULL, NULL),
(116, '2020-11-28 10:12:03', 7, 'embebibo1 embebibo1 profile liked.', NULL, NULL, NULL, NULL, NULL),
(117, '2020-11-28 10:26:32', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(118, '2020-11-28 10:27:21', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(119, '2020-11-28 10:29:23', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(120, '2020-11-29 08:54:13', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(121, '2020-11-30 09:04:11', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(122, '2020-11-30 09:19:13', 21, 'Long Nhật update profile picture.', NULL, NULL, NULL, NULL, NULL),
(123, '2020-11-30 09:19:18', 21, 'Long Nhật update cover picture.', NULL, NULL, NULL, NULL, NULL),
(124, '2020-11-30 09:19:31', 21, 'Long Nhật update own user profile.', NULL, NULL, NULL, NULL, NULL),
(125, '2020-11-30 09:19:54', 21, 'Long Nhật update own location.', NULL, NULL, NULL, NULL, NULL),
(126, '2020-11-30 15:51:49', 7, 'Tobin Dooley profile visited.', NULL, NULL, NULL, NULL, NULL),
(127, '2020-12-01 10:45:45', 7, 'Long Nhật profile visited.', NULL, NULL, NULL, NULL, NULL),
(128, '2020-12-01 10:48:20', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(129, '2020-12-01 10:54:34', 21, 'embebibo embebibo profile visited.', NULL, NULL, NULL, NULL, NULL),
(130, '2020-12-01 11:00:32', 22, 'embebibo7 embebibo7 update profile picture.', NULL, NULL, NULL, NULL, NULL),
(131, '2020-12-01 11:00:36', 22, 'embebibo7 embebibo7 update cover picture.', NULL, NULL, NULL, NULL, NULL),
(132, '2020-12-01 11:00:53', 22, 'embebibo7 embebibo7 update own location.', NULL, NULL, NULL, NULL, NULL),
(133, '2020-12-01 11:01:15', 22, 'Long Nhật profile visited.', NULL, NULL, NULL, NULL, NULL),
(134, '2020-12-01 13:31:10', 21, 'Long Nhật upload new photos.', NULL, NULL, NULL, NULL, NULL),
(135, '2020-12-01 13:43:41', 21, 'Long Nhật update profile picture.', NULL, NULL, NULL, NULL, NULL),
(136, '2020-12-01 13:43:53', 21, 'Long Nhật update cover picture.', NULL, NULL, NULL, NULL, NULL),
(137, '2020-12-01 13:57:34', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(138, '2020-12-01 14:22:26', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(139, '2020-12-01 14:31:16', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(140, '2020-12-01 14:59:31', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(141, '2020-12-01 14:59:53', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(142, '2020-12-01 15:18:50', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(143, '2020-12-02 06:51:47', 21, 'embebibo7 embebibo7 profile visited.', NULL, NULL, NULL, NULL, NULL),
(144, '2020-12-02 09:25:14', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(145, '2020-12-02 09:25:17', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(146, '2020-12-02 09:25:22', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(147, '2020-12-02 09:25:25', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(148, '2020-12-02 09:29:13', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(149, '2020-12-02 09:37:01', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(150, '2020-12-02 09:37:04', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(151, '2020-12-02 09:37:09', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(152, '2020-12-02 09:38:40', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(153, '2020-12-02 10:00:47', 22, 'embebibo7 embebibo7 upload new photos.', NULL, NULL, NULL, NULL, NULL),
(154, '2020-12-02 10:03:20', 22, 'embebibo7 embebibo7 upload new photos.', NULL, NULL, NULL, NULL, NULL),
(155, '2020-12-02 10:03:35', 22, 'longnhatdz98 longnhatdz98 profile visited.', NULL, NULL, NULL, NULL, NULL),
(156, '2020-12-02 10:07:20', 22, 'embebibo7 embebibo7 upload new photos.', NULL, NULL, NULL, NULL, NULL),
(157, '2020-12-02 10:09:12', 22, 'embebibo7 embebibo7 upload new photos.', NULL, NULL, NULL, NULL, NULL),
(158, '2020-12-02 10:18:13', 7, 'embebibo embebibo upload new photos.', NULL, NULL, NULL, NULL, NULL),
(159, '2020-12-03 04:52:35', 24, 'embebibo3 embebibo3 update cover picture.', NULL, NULL, NULL, NULL, NULL),
(160, '2020-12-03 04:52:40', 24, 'embebibo3 embebibo3 update profile picture.', NULL, NULL, NULL, NULL, NULL),
(161, '2020-12-03 05:18:38', 24, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(162, '2020-12-03 05:18:59', 24, 'embebibo3 embebibo3Cập nhật ảnh hồ sơ', NULL, NULL, NULL, NULL, NULL),
(163, '2020-12-03 05:21:57', 24, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(164, '2020-12-03 05:24:52', 24, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(165, '2020-12-03 06:06:04', 24, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(166, '2020-12-03 06:06:16', 24, 'embebibo3 embebibo3Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(167, '2020-12-03 06:07:00', 24, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(168, '2020-12-03 06:07:07', 24, 'embebibo3 embebibo3Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(169, '2020-12-03 06:15:24', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(170, '2020-12-03 06:16:33', 24, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(171, '2020-12-03 06:16:41', 24, 'embebibo3 embebibo3Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(172, '2020-12-03 06:18:21', 24, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(173, '2020-12-03 06:18:31', 24, 'embebibo3 embebibo3Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(174, '2020-12-03 06:20:07', 24, 'embebibo3 embebibo3 update cover picture.', NULL, NULL, NULL, NULL, NULL),
(175, '2020-12-03 06:20:15', 24, 'embebibo3 embebibo3 update profile picture.', NULL, NULL, NULL, NULL, NULL),
(176, '2020-12-03 06:28:55', 25, 'embebibo4 embebibo4 update cover picture.', NULL, NULL, NULL, NULL, NULL),
(177, '2020-12-03 06:29:01', 25, 'embebibo4 embebibo4 update profile picture.', NULL, NULL, NULL, NULL, NULL),
(178, '2020-12-03 06:38:28', 24, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(179, '2020-12-03 06:38:35', 24, 'embebibo3 embebibo3Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(180, '2020-12-03 06:38:55', 24, 'embebibo3 embebibo3 Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(181, '2020-12-03 06:39:27', 24, 'embebibo3 embebibo3 Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(182, '2020-12-03 06:41:34', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(183, '2020-12-03 07:01:54', 7, 'embebibo embebibo Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(184, '2020-12-03 16:59:08', 21, 'embebibo embebibo hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(185, '2020-12-03 16:59:14', 21, 'embebibo embebibo hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(186, '2020-12-03 16:59:27', 21, 'embebibo embebibo hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(187, '2020-12-03 16:59:39', 21, 'embebibo embebibo hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(188, '2020-12-03 17:00:02', 21, 'embebibo embebibo hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(189, '2020-12-03 17:00:10', 21, 'embebibo embebibo hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(190, '2020-12-03 17:00:15', 21, 'embebibo embebibo hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(191, '2020-12-03 17:04:36', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(192, '2020-12-03 17:04:45', 7, 'Long Nhật hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(193, '2020-12-03 10:05:59', 7, 'embebibo3 embebibo3 profile visited.', NULL, NULL, NULL, NULL, NULL),
(194, '2020-12-03 10:07:38', 7, 'embebibo3 embebibo3 profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(195, '2020-12-03 10:07:45', 7, 'embebibo3 embebibo3 profile liked.', NULL, NULL, NULL, NULL, NULL),
(196, '2020-12-03 10:07:50', 7, 'embebibo3 embebibo3 profile liked.', NULL, NULL, NULL, NULL, NULL),
(197, '2020-12-03 17:08:31', 7, 'embebibo3 embebibo3 hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(198, '2020-12-03 17:08:41', 7, 'embebibo3 embebibo3 hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(199, '2020-12-03 17:09:43', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(200, '2020-12-03 17:13:08', 7, 'Long Nhật hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(201, '2020-12-03 17:13:17', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(202, '2020-12-03 17:16:35', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(203, '2020-12-03 17:21:41', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(204, '2020-12-03 17:21:53', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(205, '2020-12-03 17:22:02', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(206, '2020-12-03 17:22:20', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(207, '2020-12-03 17:27:13', 7, 'Long Nhật profile liked.', NULL, NULL, NULL, NULL, NULL),
(208, '2020-12-03 17:27:22', 7, 'Long Nhật profile liked.', NULL, NULL, NULL, NULL, NULL),
(209, '2020-12-03 17:29:48', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(210, '2020-12-03 17:29:52', 7, 'Long Nhật hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(211, '2020-12-03 17:29:56', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(212, '2020-12-03 17:30:01', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(213, '2020-12-03 17:30:16', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(214, '2020-12-03 17:30:33', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(215, '2020-12-03 17:30:49', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(216, '2020-12-03 17:31:02', 7, 'Long Nhật hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(217, '2020-12-03 17:35:58', 7, 'Long Nhật profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(218, '2020-12-03 17:36:03', 7, 'Long Nhật profile liked.', NULL, NULL, NULL, NULL, NULL),
(219, '2020-12-03 17:36:08', 7, 'Long Nhật profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(220, '2020-12-03 17:37:42', 7, 'Long Nhật hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(221, '2020-12-03 17:41:08', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(222, '2020-12-03 17:41:14', 7, 'Long Nhật profile liked.', NULL, NULL, NULL, NULL, NULL),
(223, '2020-12-03 17:41:25', 7, 'Long Nhật hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(224, '2020-12-03 17:41:31', 7, 'Long Nhật profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(225, '2020-12-03 17:43:15', 7, 'Long Nhật profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(226, '2020-12-03 17:43:21', 7, 'Long Nhật hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(227, '2020-12-03 17:43:28', 7, 'Long Nhật hồ sơ không thích.', NULL, NULL, NULL, NULL, NULL),
(228, '2020-12-03 17:43:35', 7, 'Long Nhật hồ sơ đã thích.', NULL, NULL, NULL, NULL, NULL),
(229, '2020-12-03 17:44:28', 7, 'Long Nhật profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(230, '2020-12-03 17:44:35', 7, 'Long Nhật profile Disliked.', NULL, NULL, NULL, NULL, NULL),
(231, '2020-12-03 17:44:38', 7, 'Long Nhật profile liked.', NULL, NULL, NULL, NULL, NULL),
(232, '2020-12-03 17:56:08', 7, 'Long Nhật hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(233, '2020-12-03 17:56:13', 7, 'Long Nhật hồ sơ đã thích', NULL, NULL, NULL, NULL, NULL),
(234, '2020-12-03 17:56:18', 7, 'Long Nhật hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(235, '2020-12-03 17:56:21', 7, 'Long Nhật hồ sơ đã thích', NULL, NULL, NULL, NULL, NULL),
(236, '2020-12-03 17:58:51', 7, 'Long Nhật hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(237, '2020-12-03 17:58:55', 7, 'Long Nhật hồ sơ đã thích', NULL, NULL, NULL, NULL, NULL),
(238, '2020-12-03 17:59:03', 7, 'Long Nhật hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(239, '2020-12-03 17:59:12', 7, 'Long Nhật hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(240, '2020-12-03 18:00:58', 7, 'Long Nhật hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(241, '2020-12-03 18:01:08', 7, 'Long Nhật hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(242, '2020-12-03 18:01:16', 7, 'Long Nhật hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(243, '2020-12-04 10:23:26', 7, 'Long Nhật hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(244, '2020-12-04 10:23:30', 7, 'Long Nhật hồ sơ đã thích', NULL, NULL, NULL, NULL, NULL),
(245, '2020-12-04 16:18:15', 7, 'embebibo7 embebibo7 profile visited.', NULL, NULL, NULL, NULL, NULL),
(246, '2020-12-04 16:18:23', 7, 'embebibo7 embebibo7 hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(247, '2020-12-04 16:18:26', 7, 'embebibo7 embebibo7 hồ sơ đã thích', NULL, NULL, NULL, NULL, NULL),
(248, '2020-12-04 21:41:56', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(249, '2020-12-04 21:56:47', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(250, '2020-12-04 22:37:51', 26, 'embebibo2 embebibo2 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(251, '2020-12-04 22:37:55', 26, 'embebibo2 embebibo2Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(252, '2020-12-04 22:38:11', 26, 'embebibo2 embebibo2 Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(253, '2020-12-04 22:44:28', 26, 'embebibo embebibo profile visited.', NULL, NULL, NULL, NULL, NULL),
(254, '2020-12-04 22:47:23', 7, 'embebibo2 embebibo2 profile visited.', NULL, NULL, NULL, NULL, NULL),
(255, '2020-12-04 22:50:13', 27, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(256, '2020-12-04 22:50:17', 27, 'embebibo3 embebibo3Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(257, '2020-12-04 22:50:31', 27, 'embebibo3 embebibo3 Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(258, '2020-12-04 22:51:16', 27, 'embebibo2 embebibo2 profile visited.', NULL, NULL, NULL, NULL, NULL),
(259, '2020-12-04 22:51:29', 27, 'Long Nhật profile visited.', NULL, NULL, NULL, NULL, NULL),
(260, '2020-12-04 22:51:41', 27, 'embebibo embebibo profile visited.', NULL, NULL, NULL, NULL, NULL),
(261, '2020-12-04 22:52:04', 27, 'embebibo3 embebibo3 Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(262, '2020-12-04 22:54:07', 7, 'embebibo3 embebibo3 profile visited.', NULL, NULL, NULL, NULL, NULL),
(263, '2020-12-04 23:29:42', 21, 'embebibo3 embebibo3 profile visited.', NULL, NULL, NULL, NULL, NULL),
(264, '2020-12-04 23:59:41', 28, 'embebibo4 embebibo4 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(265, '2020-12-04 23:59:47', 28, 'embebibo4 embebibo4Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(266, '2020-12-05 00:00:04', 28, 'embebibo4 embebibo4 Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(267, '2020-12-05 00:02:09', 28, 'embebibo4 embebibo4 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(268, '2020-12-05 00:02:17', 28, 'embebibo4 embebibo4Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(269, '2020-12-05 00:04:03', 28, 'embebibo4 embebibo4Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(270, '2020-12-05 00:05:25', 28, 'embebibo4 embebibo4Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(271, '2020-12-05 00:08:55', 29, 'embebibo6 embebibo6 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(272, '2020-12-05 00:09:06', 29, 'embebibo6 embebibo6Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(273, '2020-12-05 00:09:20', 29, 'embebibo6 embebibo6 Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(274, '2020-12-05 00:09:41', 29, 'embebibo6 embebibo6 Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(275, '2020-12-05 00:11:07', 29, 'embebibo6 embebibo6 upload new photos.', NULL, NULL, NULL, NULL, NULL),
(276, '2020-12-05 00:11:31', 29, 'embebibo6 embebibo6 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(277, '2020-12-05 00:11:42', 29, 'embebibo6 embebibo6Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(278, '2020-12-05 00:14:26', 29, 'embebibo6 embebibo6 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(279, '2020-12-05 00:14:35', 29, 'embebibo6 embebibo6Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(280, '2020-12-05 00:15:43', 26, 'embebibo2 embebibo2 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(281, '2020-12-05 00:15:48', 26, 'embebibo2 embebibo2Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(282, '2020-12-05 00:50:20', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(283, '2020-12-05 00:56:42', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(284, '2020-12-05 00:58:49', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(285, '2020-12-05 01:19:27', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(286, '2020-12-05 08:40:00', 21, 'embebibo2 embebibo2 profile visited.', NULL, NULL, NULL, NULL, NULL),
(287, '2020-12-05 08:41:27', 29, 'embebibo2 embebibo2 profile visited.', NULL, NULL, NULL, NULL, NULL),
(288, '2020-12-05 08:42:00', 29, 'embebibo6 embebibo6 blocked by. embebibo2 embebibo2', NULL, NULL, NULL, NULL, NULL),
(289, '2020-12-05 08:42:14', 29, 'embebibo4 embebibo4 profile visited.', NULL, NULL, NULL, NULL, NULL),
(290, '2020-12-05 15:45:04', 21, 'embebibo4 embebibo4 profile visited.', NULL, NULL, NULL, NULL, NULL),
(291, '2020-12-05 15:48:58', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(292, '2020-12-05 15:48:58', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(293, '2020-12-05 15:48:58', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(294, '2020-12-05 15:49:55', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(295, '2020-12-05 15:49:55', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(296, '2020-12-05 15:49:55', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(297, '2020-12-05 15:53:00', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(298, '2020-12-05 16:13:30', 7, 'Albert Muller user verified.', NULL, NULL, NULL, NULL, NULL),
(299, '2020-12-05 16:13:37', 7, 'Reece Wolff user verified.', NULL, NULL, NULL, NULL, NULL),
(300, '2020-12-05 16:13:57', 7, 'Earline Effertz user soft deleted.', NULL, NULL, NULL, NULL, NULL),
(301, '2020-12-05 16:19:36', 7, '1 fake users created.', NULL, NULL, NULL, NULL, NULL),
(302, '2020-12-05 16:19:36', 7, '1 fake users authority created.', NULL, NULL, NULL, NULL, NULL),
(303, '2020-12-05 16:19:36', 7, '1 fake users profiles created.', NULL, NULL, NULL, NULL, NULL),
(304, '2020-12-05 17:30:24', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(305, '2020-12-06 17:05:30', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(306, '2020-12-06 17:05:36', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(307, '2020-12-06 17:05:44', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(308, '2020-12-06 17:05:56', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(309, '2020-12-06 17:06:04', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(310, '2020-12-06 17:06:09', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(311, '2020-12-06 17:06:17', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(312, '2020-12-06 17:06:22', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(313, '2020-12-06 17:13:02', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(314, '2020-12-06 17:13:11', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(315, '2020-12-06 17:13:18', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(316, '2020-12-06 17:13:25', 7, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(317, '2020-12-06 17:23:36', 7, 'embebibo embebibo Cập nhật hồ sơ người dùng riêng', NULL, NULL, NULL, NULL, NULL),
(318, '2020-12-06 17:26:43', 7, 'embebibo embebibo Cập nhật hồ sơ người dùng riêng', NULL, NULL, NULL, NULL, NULL),
(319, '2020-12-06 17:26:45', 7, 'embebibo embebibo Cập nhật hồ sơ người dùng riêng', NULL, NULL, NULL, NULL, NULL),
(320, '2020-12-06 18:11:22', 7, 'embebibo embebibo Cập nhật vị trí riêng', NULL, NULL, NULL, NULL, NULL),
(321, '2020-12-06 21:33:42', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(322, '2020-12-06 22:22:18', 26, 'Booster activated by user embebibo2 embebibo2', NULL, NULL, NULL, NULL, NULL),
(323, '2020-12-06 23:16:41', 7, 'dep gift created. ', NULL, NULL, NULL, NULL, NULL),
(324, '2020-12-06 23:17:53', 7, 'dep sticker deleted. ', NULL, NULL, NULL, NULL, NULL),
(325, '2020-12-06 23:21:24', 7, 'yeu sticker created. ', NULL, NULL, NULL, NULL, NULL),
(326, '2020-12-06 23:36:07', 26, 'Long Nhật hồ sơ đã truy cập.', NULL, NULL, NULL, NULL, NULL),
(327, '2020-12-07 00:23:45', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(328, '2020-12-07 00:36:46', 7, 'yeu 2 gift created. ', NULL, NULL, NULL, NULL, NULL),
(329, '2020-12-07 00:38:45', 7, 'yeu 3 gift created. ', NULL, NULL, NULL, NULL, NULL),
(330, '2020-12-07 00:46:39', 7, 'yeu 4 gift created. ', NULL, NULL, NULL, NULL, NULL),
(331, '2020-12-07 00:48:31', 26, 'Long Nhật send gift.', NULL, NULL, NULL, NULL, NULL),
(332, '2020-12-07 01:01:34', 26, 'Cài đặt người dùng được lưu trữ / cập nhật', NULL, NULL, NULL, NULL, NULL),
(333, '2020-12-07 10:11:49', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(334, '2020-12-07 10:21:09', 21, 'embebibo embebibo hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(335, '2020-12-07 10:21:39', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(336, '2020-12-07 10:21:48', 7, 'embebibo embebibo hồ sơ đã thích', NULL, NULL, NULL, NULL, NULL),
(337, '2020-12-07 10:22:07', 21, 'embebibo embebibo hồ sơ đã thích', NULL, NULL, NULL, NULL, NULL),
(338, '2020-12-07 10:22:16', 21, 'Tanya Halvorson hồ sơ không thích', NULL, NULL, NULL, NULL, NULL),
(339, '2020-12-07 10:23:18', 21, 'Albert Muller hồ sơ đã truy cập.', NULL, NULL, NULL, NULL, NULL),
(340, '2020-12-07 10:23:26', 21, 'Long Nhật Bị chặn bởi. Albert Muller', NULL, NULL, NULL, NULL, NULL),
(341, '2020-12-07 10:41:40', 7, 'Sabrina Williamson hồ sơ đã truy cập.', NULL, NULL, NULL, NULL, NULL),
(342, '2020-12-07 15:25:09', 7, 'Booster activated by user embebibo embebibo', NULL, NULL, NULL, NULL, NULL),
(343, '2020-12-08 10:12:18', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(344, '2020-12-08 10:12:33', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(345, '2020-12-08 10:12:44', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(346, '2020-12-08 10:18:02', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(347, '2020-12-08 10:20:57', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(348, '2020-12-08 10:27:13', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(349, '2020-12-08 10:41:15', 7, 'Albert Muller hồ sơ đã truy cập.', NULL, NULL, NULL, NULL, NULL),
(350, '2020-12-08 10:51:10', 7, 'embebibo4 embebibo4 hồ sơ đã truy cập.', NULL, NULL, NULL, NULL, NULL),
(351, '2020-12-08 16:04:16', 7, 'Earline Effertz user deleted.', NULL, NULL, NULL, NULL, NULL),
(352, '2020-12-08 16:04:16', 7, 'Earline Effertz user permanent deleted.', NULL, NULL, NULL, NULL, NULL),
(353, '2020-12-08 20:30:38', 7, 'embebibo6 embebibo6 user verified.', NULL, NULL, NULL, NULL, NULL),
(354, '2020-12-08 20:38:11', 7, 'Delete all test transactions', NULL, NULL, NULL, NULL, NULL),
(355, '2020-12-08 20:54:11', 7, 'Orpha Leffler hồ sơ đã truy cập.', NULL, NULL, NULL, NULL, NULL),
(356, '2020-12-08 20:54:17', 7, 'embebibo embebibo Bị chặn bởi. Orpha Leffler', NULL, NULL, NULL, NULL, NULL),
(357, '2020-12-08 20:54:55', 7, 'Sabrina Williamson user blocked.', NULL, NULL, NULL, NULL, NULL),
(358, '2020-12-08 20:55:33', 7, 'Albert Muller user soft deleted.', NULL, NULL, NULL, NULL, NULL),
(359, '2020-12-08 20:56:10', 7, 'embebibo6 embebibo6 user blocked.', NULL, NULL, NULL, NULL, NULL),
(360, '2020-12-08 20:56:48', 7, 'embebibo6 embebibo6 user unblocked.', NULL, NULL, NULL, NULL, NULL),
(361, '2020-12-08 20:57:25', 7, 'Albert Muller user deleted.', NULL, NULL, NULL, NULL, NULL),
(362, '2020-12-08 20:57:25', 7, 'Albert Muller user permanent deleted.', NULL, NULL, NULL, NULL, NULL),
(363, '2020-12-08 23:09:03', 27, 'embebibo3 embebibo3Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(364, '2020-12-08 23:09:25', 27, 'embebibo3 embebibo3Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(365, '2020-12-08 23:09:31', 27, 'embebibo3 embebibo3 Cập nhật ảnh bìa', NULL, NULL, NULL, NULL, NULL),
(366, '2020-12-08 23:10:25', 26, 'Booster activated by user embebibo2 embebibo2', NULL, NULL, NULL, NULL, NULL),
(367, '2020-12-08 23:14:22', 29, 'embebibo6 embebibo6 Cập nhật hồ sơ người dùng riêng', NULL, NULL, NULL, NULL, NULL),
(368, '2020-12-08 23:14:26', 29, 'embebibo6 embebibo6 Cập nhật hồ sơ người dùng riêng', NULL, NULL, NULL, NULL, NULL),
(369, '2020-12-08 23:14:36', 29, 'embebibo6 embebibo6 Cập nhật thông tin người dùng riêng', NULL, NULL, NULL, NULL, NULL),
(370, '2020-12-08 23:14:48', 29, 'embebibo6 embebibo6 Cập nhật hồ sơ người dùng riêng', NULL, NULL, NULL, NULL, NULL),
(371, '2020-12-08 23:17:50', 29, 'Long Nhật hồ sơ đã truy cập.', NULL, NULL, NULL, NULL, NULL),
(372, '2020-12-08 23:26:36', 7, 'Reece Wolff user blocked.', NULL, NULL, NULL, NULL, NULL),
(373, '2020-12-15 15:18:30', 7, 'embebibo embebibo blocked by. Long Nhật', NULL, NULL, NULL, NULL, NULL),
(374, '2020-12-15 15:18:40', 7, 'embebibo embebibo Unblock by. Long Nhật', NULL, NULL, NULL, NULL, NULL),
(375, '2020-12-16 01:19:37', 26, 'Long Nhật hồ sơ đã thích', NULL, NULL, NULL, NULL, NULL),
(376, '2020-12-16 06:12:03', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL),
(377, '2020-12-16 06:12:17', 7, 'Site configuration settings stored / updated.', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chats`
--

CREATE TABLE `chats` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT 'Sent,delivered,seen/read',
  `message` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL COMMENT 'Text,image,emoji,video,audio, audio call init, video call init, giphy, accept message. Declined message',
  `from_users__id` int(10) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `items__id` int(10) UNSIGNED DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `integrity_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `chats`
--

INSERT INTO `chats` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `message`, `type`, `from_users__id`, `to_users__id`, `items__id`, `users__id`, `integrity_id`) VALUES
(19, 'c04e9aab-a15a-4723-a887-5acbc25d3ba7', '2020-11-27 17:14:49', '2020-11-27 17:14:49', 1, 'Message Request', 9, 7, 4, NULL, 7, 'd0db17f6-cdd3-4f4b-a2b6-31fb560ea736'),
(20, '03785b46-0c44-4436-a956-00dd1ec127f8', '2020-11-27 17:14:49', '2020-11-27 17:14:49', 1, 'Message Request', 9, 7, 4, NULL, 4, 'd0db17f6-cdd3-4f4b-a2b6-31fb560ea736'),
(21, '303922fe-42e5-447c-95ff-18dd3fc5342d', '2020-11-27 17:14:49', '2020-11-27 17:14:49', 1, 'njj', 1, 7, 4, NULL, 7, '2d6ccedd-3263-40cc-b4aa-da7ad63e6733'),
(22, 'd6bdcb84-62aa-4fdd-8f02-cae516007b72', '2020-11-27 17:14:49', '2020-11-27 17:14:49', 1, 'njj', 1, 7, 4, NULL, 4, '2d6ccedd-3263-40cc-b4aa-da7ad63e6733'),
(31, 'd103066c-a81d-4407-9df9-e0d8b14e7421', '2020-12-01 10:45:59', '2020-12-01 10:45:59', 1, 'Message Request', 10, 7, 21, NULL, 7, 'db099009-80e5-40c7-86f0-ca3cb685ee13'),
(32, '3616025a-62ea-48c3-8097-176e5352de71', '2020-12-01 10:45:59', '2020-12-01 10:45:59', 1, 'Message Request', 10, 7, 21, NULL, 21, 'db099009-80e5-40c7-86f0-ca3cb685ee13'),
(33, '55e058d4-1207-42a8-a91d-a6323b6c2ccc', '2020-12-01 10:45:59', '2020-12-01 10:45:59', 1, 'abc', 1, 7, 21, NULL, 7, '212f44c2-8ddf-49e9-bb0a-360fd9ddc3db'),
(36, 'b9d703c7-9237-43de-9e73-41034d60c13d', '2020-12-01 10:46:14', '2020-12-01 10:46:14', 1, 'nhat', 1, 21, 7, NULL, 7, '18ef4b2d-1fe5-41e1-9b4f-4cef8c21d126'),
(37, 'b07e5940-cff3-4062-a1b7-d02f54ec16d1', '2020-12-01 10:46:25', '2020-12-01 10:46:25', 1, 'acbcc', 1, 7, 21, NULL, 7, '420332cc-1326-41bd-a038-26107199e366'),
(39, '3d8161fc-f9d3-4d1a-991b-e0b8dbee99ba', '2020-12-01 10:48:56', '2020-12-01 10:48:56', 1, 'cbd', 1, 7, 21, NULL, 7, '940f7707-817d-4eec-bc04-b181f417239a'),
(42, '18546511-0256-4ddf-b8ce-c9d2ea3a90ea', '2020-12-01 10:49:12', '2020-12-01 10:49:12', 1, 'nhật', 1, 21, 7, NULL, 7, '50304083-d628-4139-8006-bcbdce4928b6'),
(44, '6a3f1fca-b7cc-4554-8217-17f16d2ba6a4', '2020-12-01 10:54:50', '2020-12-01 10:54:50', 1, 'nhạt\'', 1, 21, 7, NULL, 7, '3aca16b1-8f5b-4378-be02-db31f152e019'),
(45, 'dffd0a2f-fb09-4f0c-a8f8-8ba28b9c41a9', '2020-12-01 10:55:19', '2020-12-01 10:55:19', 1, 'c', 1, 7, 21, NULL, 7, '9ee441eb-5525-4660-b21b-233223697273'),
(48, 'df752d0e-eea4-4abb-bf30-3ae70ea238ca', '2020-12-01 10:55:50', '2020-12-01 10:55:50', 1, 'nhật', 1, 21, 7, NULL, 7, '51d38f6e-776b-44c2-a2c6-31faf4f31f0f'),
(50, 'b979a35b-2d87-441c-8743-df7f773c85b8', '2020-12-01 10:56:56', '2020-12-01 10:56:56', 1, 'nhật', 1, 21, 7, NULL, 7, 'd205f0c5-4662-49ed-84dc-377906bb1328'),
(51, '31a1eda8-d5cc-40bf-81fc-bbe6773a9dbf', '2020-12-01 10:57:06', '2020-12-01 10:57:06', 1, 'cbv', 1, 7, 21, NULL, 7, '7991d244-ed02-42a6-a222-0968cfdc4c9b'),
(54, 'e94b3102-4969-420d-a6f8-f9fc734d8f7f', '2020-12-01 10:57:39', '2020-12-01 10:57:39', 1, 'mjmjmjmjmjm', 1, 21, 7, NULL, 7, 'c84caade-13ac-4efd-8fac-54eae7b26782'),
(71, '552d7261-bbd2-4621-8bbb-afc3c84ecefd', '2020-12-01 13:26:51', '2020-12-01 13:26:51', 1, 'gaixinh.png', 2, 21, 7, NULL, 21, '8fb57638-b477-4d9a-b3c8-7b78a87f7915'),
(72, '88f0c345-8989-42ad-ab16-d5fdbba0eb7f', '2020-12-01 13:26:51', '2020-12-01 13:26:51', 1, 'gaixinh.png', 2, 21, 7, NULL, 7, '8fb57638-b477-4d9a-b3c8-7b78a87f7915'),
(73, '5ebb6edd-5362-4a8b-b948-bb2595b29100', '2020-12-01 13:27:24', '2020-12-01 13:27:24', 1, '//', 1, 21, 7, NULL, 21, '57cf2c2d-ac0b-42ed-aa48-bbe4fd55dc9d'),
(74, 'd2e213d7-02d5-4ced-a050-a9f2d4ec0da4', '2020-12-01 13:27:24', '2020-12-01 13:27:24', 1, '//', 1, 21, 7, NULL, 7, '57cf2c2d-ac0b-42ed-aa48-bbe4fd55dc9d'),
(75, '972fbb44-0f06-463d-9a3f-18988ab0ba5a', '2020-12-01 13:27:36', '2020-12-01 13:27:36', 1, 'cmsn7.jpg', 2, 21, 7, NULL, 21, 'fcf247ef-d063-4d3c-9100-27b7163b6972'),
(76, '388859cc-670e-4ae1-917a-c33f512c1b5a', '2020-12-01 13:27:36', '2020-12-01 13:27:36', 1, 'cmsn7.jpg', 2, 21, 7, NULL, 7, 'fcf247ef-d063-4d3c-9100-27b7163b6972'),
(81, 'a1a4f5e3-82c5-4143-a26d-6b26fceb43cd', '2020-12-01 13:44:38', '2020-12-01 13:44:38', 1, 'nhật', 1, 7, 21, NULL, 7, '7b022575-d62d-45a0-9331-81ea67522a68'),
(82, '39ab4941-02a4-4d28-a726-1ab7a7fd43ae', '2020-12-01 13:44:38', '2020-12-01 13:44:38', 1, 'nhật', 1, 7, 21, NULL, 21, '7b022575-d62d-45a0-9331-81ea67522a68'),
(85, 'c1a470f0-01dc-45f7-a3c6-3eb250ae0898', '2020-12-01 13:45:42', '2020-12-01 13:45:42', 1, '2342432', 1, 21, 7, NULL, 21, 'aad49742-fa2c-49a1-a8e4-9fb523a3cfc3'),
(86, '3670bebd-d76a-4f6e-ad92-ce86e98ac85c', '2020-12-01 13:45:42', '2020-12-01 13:45:42', 1, '2342432', 1, 21, 7, NULL, 7, 'aad49742-fa2c-49a1-a8e4-9fb523a3cfc3'),
(87, 'e7c2247c-e74d-48c1-acdc-61963912094e', '2020-12-01 13:45:49', '2020-12-01 13:45:49', 1, 'fdgdfgdf', 1, 7, 21, NULL, 7, '5e9d54af-e521-4938-a9fc-f6528b8e5f4a'),
(88, '2fa853e2-9fa4-46ee-a5aa-8d17b31715d2', '2020-12-01 13:45:49', '2020-12-01 13:45:49', 1, 'fdgdfgdf', 1, 7, 21, NULL, 21, '5e9d54af-e521-4938-a9fc-f6528b8e5f4a'),
(89, '4f54968a-6ff9-4dca-b0f9-bb46b3cf5ac4', '2020-12-01 13:45:59', '2020-12-01 13:45:59', 1, 'dfgdfgfd', 1, 7, 21, NULL, 7, '4d55dfac-2c61-4460-8907-3253d8f60fe5'),
(90, '72ceaf28-c987-418d-8a9b-b0badc16e8e8', '2020-12-01 13:45:59', '2020-12-01 13:45:59', 1, 'dfgdfgfd', 1, 7, 21, NULL, 21, '4d55dfac-2c61-4460-8907-3253d8f60fe5'),
(93, '5850dc28-487d-450b-a6dc-1fcfb066f415', '2020-12-01 13:46:20', '2020-12-01 13:46:20', 1, 'ghgfhg', 1, 7, 21, NULL, 7, '12e91e7d-e36f-43b0-99e0-47c6fdb52224'),
(94, '2cd53b85-6ee5-4ba7-809e-71e6c1e057b3', '2020-12-01 13:46:20', '2020-12-01 13:46:20', 1, 'ghgfhg', 1, 7, 21, NULL, 21, '12e91e7d-e36f-43b0-99e0-47c6fdb52224'),
(95, '10607f6c-242c-44f9-9f9c-e2bf86c79df0', '2020-12-01 13:46:37', '2020-12-01 13:46:37', 1, 'fdgfdgfd', 1, 7, 21, NULL, 7, 'ec14182d-4784-432f-b41b-7958b137f695'),
(96, '5ccd7349-f648-4e22-aa66-d179873e6ee1', '2020-12-01 13:46:37', '2020-12-01 13:46:37', 1, 'fdgfdgfd', 1, 7, 21, NULL, 21, 'ec14182d-4784-432f-b41b-7958b137f695'),
(97, 'a1d7660e-5687-4611-bb09-9c3c7e33fd33', '2020-12-01 13:46:50', '2020-12-01 13:46:50', 1, 'sdfds', 1, 7, 21, NULL, 7, 'b99f7c1a-00f0-45db-8d1e-74da9b77029b'),
(98, 'b2932d9b-6f9f-4814-8505-265be6d475a1', '2020-12-01 13:46:50', '2020-12-01 13:46:50', 1, 'sdfds', 1, 7, 21, NULL, 21, 'b99f7c1a-00f0-45db-8d1e-74da9b77029b'),
(109, '72c1e9e8-eef5-4612-a4cd-0f630a3c486d', '2020-12-03 16:57:12', '2020-12-03 16:57:12', 1, 'nhật', 1, 7, 21, NULL, 7, '7bf783a4-85ad-42c4-814f-2973f5c55a71'),
(110, '77d97756-8237-4758-9abc-cc28fedf37bb', '2020-12-03 16:57:12', '2020-12-03 16:57:12', 1, 'nhật', 1, 7, 21, NULL, 21, '7bf783a4-85ad-42c4-814f-2973f5c55a71'),
(111, '06fecae5-64cf-4f37-825d-4a91b26962e0', '2020-12-03 16:58:29', '2020-12-03 16:58:29', 1, 'abccc', 1, 21, 7, NULL, 21, 'bc149642-9a69-451d-a560-98f22ef7e581'),
(112, '56f8795a-77da-4c8a-8b27-2a700c3978ff', '2020-12-03 16:58:29', '2020-12-03 16:58:29', 1, 'abccc', 1, 21, 7, NULL, 7, 'bc149642-9a69-451d-a560-98f22ef7e581'),
(113, 'b58e50f6-e7c6-4507-b7a6-5e4f02c7ae07', '2020-12-04 17:45:16', '2020-12-04 17:45:16', 1, 'chào b', 1, 7, 21, NULL, 7, '1c4dc19d-619d-4e21-bdac-a346b856da6a'),
(114, '809b7e3b-0181-4c6f-b119-0e2f830e66f9', '2020-12-04 17:45:16', '2020-12-04 17:45:16', 1, 'chào b', 1, 7, 21, NULL, 21, '1c4dc19d-619d-4e21-bdac-a346b856da6a'),
(115, 'f94855e7-814b-4d50-a4e5-3c4ea590a51c', '2020-12-04 17:52:09', '2020-12-04 17:52:09', 1, 'chào b', 1, 21, 7, NULL, 21, 'b971bf71-161c-43b0-8ce7-2c994510eaaa'),
(116, '387a1f88-3c01-4672-b44a-c12e2bbda1d4', '2020-12-04 17:52:09', '2020-12-04 17:52:09', 1, 'chào b', 1, 21, 7, NULL, 7, 'b971bf71-161c-43b0-8ce7-2c994510eaaa'),
(117, '618ad581-0e85-4f19-a09e-8925d62d08f0', '2020-12-04 17:52:13', '2020-12-04 17:52:13', 1, 'mình là nhật', 1, 21, 7, NULL, 21, '340c09c6-fc02-4876-aaba-a969f5675d87'),
(118, '2f50802e-70b4-4502-b882-94783c5c1e37', '2020-12-04 17:52:13', '2020-12-04 17:52:13', 1, 'mình là nhật', 1, 21, 7, NULL, 7, '340c09c6-fc02-4876-aaba-a969f5675d87'),
(119, '3463587f-448d-48fa-900a-7710f2751f6a', '2020-12-04 17:52:20', '2020-12-04 17:52:20', 1, 'có việc gì không bạn', 1, 21, 7, NULL, 21, '25ca4de5-bc61-4017-95bc-5a6930d218a0'),
(120, '92670931-5438-4395-b520-bc011df1eb98', '2020-12-04 17:52:20', '2020-12-04 17:52:20', 1, 'có việc gì không bạn', 1, 21, 7, NULL, 7, '25ca4de5-bc61-4017-95bc-5a6930d218a0'),
(121, '14f0366e-f366-4c68-8108-2df4757c2031', '2020-12-04 17:54:18', '2020-12-04 17:54:18', 1, 'hehe', 1, 21, 7, NULL, 21, '595b3c53-03f8-418a-a7c0-ea4d738b6645'),
(122, '108c1a26-0d5a-4b9e-9ed8-ce3e30c9607b', '2020-12-04 17:54:18', '2020-12-04 17:54:18', 1, 'hehe', 1, 21, 7, NULL, 7, '595b3c53-03f8-418a-a7c0-ea4d738b6645'),
(123, '4ecc22be-cfe4-484e-8bc5-7a501ca5f5c2', '2020-12-04 17:54:19', '2020-12-04 17:54:19', 1, 'chào ', 1, 21, 7, NULL, 21, '42e2b697-d0d4-4da2-b50b-b8eba4214221'),
(124, 'c35ec955-18f5-4784-bc95-86e5c33cdbb7', '2020-12-04 17:54:19', '2020-12-04 17:54:19', 1, 'chào ', 1, 21, 7, NULL, 7, '42e2b697-d0d4-4da2-b50b-b8eba4214221'),
(125, '5f180761-a7b6-4f11-8119-8814d74b1e54', '2020-12-07 00:50:23', '2020-12-07 00:50:23', 1, 'Message Request', 10, 26, 21, NULL, 26, '2a1e54b3-3aaa-4576-8d4f-3ff086b8389e'),
(126, 'c5e4c9c2-bdc7-4917-89e6-02108f80005a', '2020-12-07 00:50:23', '2020-12-07 00:50:23', 1, 'Message Request', 10, 26, 21, NULL, 21, '2a1e54b3-3aaa-4576-8d4f-3ff086b8389e'),
(127, 'b047e775-7c4b-4c5d-87ab-025716271192', '2020-12-07 00:50:23', '2020-12-07 00:50:23', 1, 'http://localhost:8000/media-storage/sticker/5c813aa5-54e8-419d-ad31-0ab222aea107/000.jpg', 12, 26, 21, 1, 26, '9ff4a1e2-489c-4b3b-9264-a4c6abba64b8'),
(128, '76f978cb-1429-4ecd-b4a9-720f98d082f7', '2020-12-07 00:50:23', '2020-12-07 00:50:23', 1, 'http://localhost:8000/media-storage/sticker/5c813aa5-54e8-419d-ad31-0ab222aea107/000.jpg', 12, 26, 21, 1, 21, '9ff4a1e2-489c-4b3b-9264-a4c6abba64b8'),
(129, '7a887840-fa40-4610-91cf-ca2215ad44a5', '2020-12-07 10:10:44', '2020-12-07 10:10:44', 1, 'vvbvb', 1, 7, 21, NULL, 7, '1af61477-e871-4f69-9082-82bfbae3517b'),
(130, '02ed2c66-e80c-4e98-80d3-9bdb34a6b025', '2020-12-07 10:10:44', '2020-12-07 10:10:44', 1, 'vvbvb', 1, 7, 21, NULL, 21, '1af61477-e871-4f69-9082-82bfbae3517b'),
(131, 'a6c3904c-d439-415e-b95a-a2f190d27771', '2020-12-07 10:10:48', '2020-12-07 10:10:48', 1, 'gfgdgdfgdfgdf', 1, 7, 21, NULL, 7, 'cc6ee69e-27db-475e-a081-6f8642bd766a'),
(132, 'f897e195-9e87-4abe-984a-350e1ae27056', '2020-12-07 10:10:48', '2020-12-07 10:10:48', 1, 'gfgdgdfgdfgdf', 1, 7, 21, NULL, 21, 'cc6ee69e-27db-475e-a081-6f8642bd766a'),
(133, '42bf9d5a-fed6-4a51-8e33-545428737a1c', '2020-12-07 10:10:51', '2020-12-07 10:10:51', 1, 'erytreyeryer', 1, 7, 21, NULL, 7, 'bfbe710e-4a86-4b80-bb56-a0f2ad11f314'),
(134, 'fd26d77e-67e5-4be7-acad-e1d19e290329', '2020-12-07 10:10:51', '2020-12-07 10:10:51', 1, 'erytreyeryer', 1, 7, 21, NULL, 21, 'bfbe710e-4a86-4b80-bb56-a0f2ad11f314'),
(135, '69ddc97e-333a-4aed-a480-aeecb5cd804e', '2020-12-07 10:27:43', '2020-12-07 10:27:43', 1, 'ggf', 1, 21, 26, NULL, 21, '68050c6a-1b16-48c9-9fd9-5ad987b352b1'),
(136, '927df275-7031-429f-b415-94421af6b840', '2020-12-07 10:27:43', '2020-12-07 10:27:43', 1, 'ggf', 1, 21, 26, NULL, 26, '68050c6a-1b16-48c9-9fd9-5ad987b352b1'),
(137, 'c920dc7e-2df0-4d88-9e98-edacad417949', '2020-12-07 10:28:12', '2020-12-07 10:28:12', 1, 'aaaaa', 1, 21, 26, NULL, 21, '4d51cb28-8857-4ab0-a135-38419cf3f7a1'),
(138, '265a8164-7055-4d14-878b-c131c598696a', '2020-12-07 10:28:12', '2020-12-07 10:28:12', 1, 'aaaaa', 1, 21, 26, NULL, 26, '4d51cb28-8857-4ab0-a135-38419cf3f7a1'),
(139, '75be377e-6d80-4720-ae02-a41b40d7a354', '2020-12-07 10:28:33', '2020-12-07 10:28:33', 1, 'fgfdgdfgdfg', 1, 7, 21, NULL, 7, 'c8a12c47-5a9a-45ea-b051-9b52621daa65'),
(140, '91b74bf9-bc83-4b1a-b999-09fd44edbe6a', '2020-12-07 10:28:33', '2020-12-07 10:28:33', 1, 'fgfdgdfgdfg', 1, 7, 21, NULL, 21, 'c8a12c47-5a9a-45ea-b051-9b52621daa65'),
(141, '7fcf4ae6-f219-450c-a49c-908d3e7e5454', '2020-12-07 10:28:35', '2020-12-07 10:28:35', 1, 'dsfdsfsdfdsfsd', 1, 7, 21, NULL, 7, '811e0243-7b59-4bc0-a37a-6595e9781c12'),
(142, 'cff83931-600e-4e8e-9f3d-1ec49a03eb09', '2020-12-07 10:28:35', '2020-12-07 10:28:35', 1, 'dsfdsfsdfdsfsd', 1, 7, 21, NULL, 21, '811e0243-7b59-4bc0-a37a-6595e9781c12'),
(143, '57eb14ad-cf65-494f-be5f-3a6e1c6f49d4', '2020-12-07 10:29:00', '2020-12-07 10:29:00', 1, 'aaaaa', 1, 21, 7, NULL, 21, '9670d0f4-24f8-4f24-ae3f-ad70bd0bb934'),
(144, 'cd3402cf-feb2-4466-aada-660cf944faef', '2020-12-07 10:29:00', '2020-12-07 10:29:00', 1, 'aaaaa', 1, 21, 7, NULL, 7, '9670d0f4-24f8-4f24-ae3f-ad70bd0bb934'),
(153, 'f6dca0c9-5e6a-4944-a42e-4f5a20e8d540', '2020-12-09 00:55:49', '2020-12-09 00:55:49', 1, 'hi con cặc', 1, 7, 4, NULL, 7, 'd5d037b8-b072-4253-a06a-af02e3058d24'),
(155, 'a2dcbc44-ba64-49a9-9b00-46d3575304de', '2020-12-09 00:55:57', '2020-12-09 00:55:57', 1, 'thằng bê đê', 1, 7, 4, NULL, 7, 'fcff0fdf-0d90-41b3-9012-9435eaf103bb'),
(157, '8fe93de5-bb1b-4a0a-a500-ce319f7e4f64', '2020-12-12 20:01:35', '2020-12-12 20:01:35', 1, 'https://media0.giphy.com/media/l3IbUcsosHdyYAMFou/giphy-preview.gif?cid=bcbdc2dbtdqmpamxfbfchl5f772en2slz5v2rjebsr9hkklp&rid=giphy-preview.gif', 8, 7, 4, NULL, 7, '574b10b6-a447-45da-b162-f9d2049087dc'),
(158, '9e62e6e0-9e68-46aa-88b2-922ebe054d1d', '2020-12-12 20:01:35', '2020-12-12 20:01:35', 1, 'https://media0.giphy.com/media/l3IbUcsosHdyYAMFou/giphy-preview.gif?cid=bcbdc2dbtdqmpamxfbfchl5f772en2slz5v2rjebsr9hkklp&rid=giphy-preview.gif', 8, 7, 4, NULL, 4, '574b10b6-a447-45da-b162-f9d2049087dc'),
(159, 'b0bd5ad2-1a71-490c-a95f-487f8c97f8ff', '2020-12-12 20:02:30', '2020-12-12 20:02:30', 1, 'https://media2.giphy.com/media/AquHNi15gZhI6JHjHg/giphy-preview.gif?cid=bcbdc2dbx6zmsvcanaz6vw5ev360juqhrrvziqifiko7c0x8&rid=giphy-preview.gif', 8, 7, 4, NULL, 7, 'fc6de00f-ffa3-4251-a0a5-d0e1cc9a0543'),
(160, 'c41cfa1e-91a9-4a2b-8d7b-71ba44438798', '2020-12-12 20:02:30', '2020-12-12 20:02:30', 1, 'https://media2.giphy.com/media/AquHNi15gZhI6JHjHg/giphy-preview.gif?cid=bcbdc2dbx6zmsvcanaz6vw5ev360juqhrrvziqifiko7c0x8&rid=giphy-preview.gif', 8, 7, 4, NULL, 4, 'fc6de00f-ffa3-4251-a0a5-d0e1cc9a0543'),
(161, '2b28c072-e31c-43c8-abaa-15ba34860c97', '2020-12-15 21:34:45', '2020-12-15 21:34:45', 1, 'Yêu cầu tin nhắn', 9, 7, 42, NULL, 7, '46c6906b-24e8-4999-8215-039096dc7ec5'),
(162, '3ba6d980-b016-428f-a3be-ffdf2928fc89', '2020-12-15 21:34:45', '2020-12-15 21:34:45', 1, 'Yêu cầu tin nhắn', 9, 7, 42, NULL, 42, '46c6906b-24e8-4999-8215-039096dc7ec5'),
(163, 'c8389482-387c-42a5-8a6d-32c486cf13d6', '2020-12-15 21:34:45', '2020-12-15 21:34:45', 1, 'dfsdfsd', 1, 7, 42, NULL, 7, '39973ab0-c195-4458-b6ab-4e6265995867'),
(164, '9cd6b5db-660b-49ab-bd74-f2d17caa0feb', '2020-12-15 21:34:45', '2020-12-15 21:34:45', 1, 'dfsdfsd', 1, 7, 42, NULL, 42, '39973ab0-c195-4458-b6ab-4e6265995867'),
(165, 'a6e5f229-5b15-42ee-a61a-ef8a86bc98ef', '2020-12-15 21:35:13', '2020-12-15 21:35:13', 1, 'dfgdfg', 1, 7, 42, NULL, 7, '35af7eec-8722-4438-bc38-703c22a21db7'),
(166, '5113e4aa-c212-43f4-9caa-4c02e844e40d', '2020-12-15 21:35:13', '2020-12-15 21:35:13', 1, 'dfgdfg', 1, 7, 42, NULL, 42, '35af7eec-8722-4438-bc38-703c22a21db7'),
(167, '2ada9569-f046-419f-8a88-f491ff1ac29c', '2020-12-19 00:19:19', '2020-12-19 00:19:19', 1, 'http://localhost:8000/media-storage/sticker/a7d3f1c9-7a9c-4dd6-8a53-561230d0ce23/vang.png', 12, 7, 21, 8, 7, '9ebda9c8-7bf2-4565-8f6b-dcd17882b408'),
(168, 'f97eaed9-1c3c-48b6-996c-2f38be73cb85', '2020-12-19 00:19:19', '2020-12-19 00:19:19', 1, 'http://localhost:8000/media-storage/sticker/a7d3f1c9-7a9c-4dd6-8a53-561230d0ce23/vang.png', 12, 7, 21, 8, 21, '9ebda9c8-7bf2-4565-8f6b-dcd17882b408'),
(169, '40cd8321-0d2c-4b9f-a973-7ee9fdf1274b', '2020-12-19 00:19:27', '2020-12-19 00:19:27', 1, 'http://localhost:8000/media-storage/sticker/244755ac-3c52-49a0-a47b-5727ea6b2e18/99-995151-strawberry-icons-strawberry-icon-ico-clipart.png', 12, 7, 21, 12, 7, 'c1f44323-8509-494d-8690-e4b768495518'),
(170, '6dd50cd8-fd02-4cdb-91f9-f7917a18de7a', '2020-12-19 00:19:27', '2020-12-19 00:19:27', 1, 'http://localhost:8000/media-storage/sticker/244755ac-3c52-49a0-a47b-5727ea6b2e18/99-995151-strawberry-icons-strawberry-icon-ico-clipart.png', 12, 7, 21, 12, 21, 'c1f44323-8509-494d-8690-e4b768495518'),
(171, '6db93757-d46b-4ab3-830f-7bd5a7cefeee', '2020-12-19 00:20:08', '2020-12-19 00:20:08', 1, 'http://localhost:8000/media-storage/sticker/244755ac-3c52-49a0-a47b-5727ea6b2e18/99-995151-strawberry-icons-strawberry-icon-ico-clipart.png', 12, 7, 21, 12, 7, '1f4bc5e6-6e16-4771-a670-654da9380e89'),
(172, 'd1ac40a1-24e7-4825-970d-03485731d5d7', '2020-12-19 00:20:08', '2020-12-19 00:20:08', 1, 'http://localhost:8000/media-storage/sticker/244755ac-3c52-49a0-a47b-5727ea6b2e18/99-995151-strawberry-icons-strawberry-icon-ico-clipart.png', 12, 7, 21, 12, 21, '1f4bc5e6-6e16-4771-a670-654da9380e89'),
(173, '6298d2f3-39b0-46ba-bd56-ac103712654a', '2020-12-19 00:20:24', '2020-12-19 00:20:24', 1, 'http://localhost:8000/media-storage/sticker/244755ac-3c52-49a0-a47b-5727ea6b2e18/99-995151-strawberry-icons-strawberry-icon-ico-clipart.png', 12, 7, 21, 12, 7, '60447c1e-53dc-4908-8ab3-a8337bbcf91b'),
(174, '0b571322-aede-4471-aed5-da1779fa654e', '2020-12-19 00:20:24', '2020-12-19 00:20:24', 1, 'http://localhost:8000/media-storage/sticker/244755ac-3c52-49a0-a47b-5727ea6b2e18/99-995151-strawberry-icons-strawberry-icon-ico-clipart.png', 12, 7, 21, 12, 21, '60447c1e-53dc-4908-8ab3-a8337bbcf91b'),
(175, '7f563964-5933-4e50-a90f-680f93d9af7c', '2020-12-19 00:23:47', '2020-12-19 00:23:47', 1, 'http://localhost:8000/media-storage/sticker/a7d3f1c9-7a9c-4dd6-8a53-561230d0ce23/vang.png', 12, 7, 21, 8, 7, '4364639d-68ed-44a5-ba41-3e17abb12bca'),
(176, '61288edb-f772-4db4-9342-c630e30ffd40', '2020-12-19 00:23:47', '2020-12-19 00:23:47', 1, 'http://localhost:8000/media-storage/sticker/a7d3f1c9-7a9c-4dd6-8a53-561230d0ce23/vang.png', 12, 7, 21, 8, 21, '4364639d-68ed-44a5-ba41-3e17abb12bca'),
(177, 'c757ecec-2fbc-4cb7-8c4f-e99f3093635c', '2020-12-19 00:23:58', '2020-12-19 00:23:58', 1, 'http://localhost:8000/media-storage/sticker/a7d3f1c9-7a9c-4dd6-8a53-561230d0ce23/vang.png', 12, 7, 21, 8, 7, '9febf2d1-e2bf-47c6-8fe4-f604b3ed60bb'),
(178, 'd812cca4-a00b-4155-8d99-1617962f3e38', '2020-12-19 00:23:58', '2020-12-19 00:23:58', 1, 'http://localhost:8000/media-storage/sticker/a7d3f1c9-7a9c-4dd6-8a53-561230d0ce23/vang.png', 12, 7, 21, 8, 21, '9febf2d1-e2bf-47c6-8fe4-f604b3ed60bb'),
(179, 'cb427daa-3bc9-4892-8b61-c05db6f6727e', '2020-12-19 00:24:24', '2020-12-19 00:24:24', 1, 'http://localhost:8000/media-storage/sticker/244755ac-3c52-49a0-a47b-5727ea6b2e18/99-995151-strawberry-icons-strawberry-icon-ico-clipart.png', 12, 7, 4, 12, 7, '06c6dbc3-9c54-4c55-8b72-878d999b510a'),
(180, '3d02db6e-52b4-46a2-a0e1-8269c0e06577', '2020-12-19 00:24:24', '2020-12-19 00:24:24', 1, 'http://localhost:8000/media-storage/sticker/244755ac-3c52-49a0-a47b-5727ea6b2e18/99-995151-strawberry-icons-strawberry-icon-ico-clipart.png', 12, 7, 4, 12, 4, '06c6dbc3-9c54-4c55-8b72-878d999b510a'),
(181, '59afd67f-52e2-453d-bd70-694fc90665f8', '2020-12-19 00:25:23', '2020-12-19 00:25:23', 1, 'https://media4.giphy.com/media/3oriNWeb2gzrZufbZ6/giphy-preview.gif?cid=bcbdc2dbsuhlr12dneeyp2kbn1nrko1eblxvakxr2w8u5ege&rid=giphy-preview.gif', 8, 7, 4, NULL, 7, '423c4205-14fe-47a3-bfb5-fb7fe0187583'),
(182, '037910d1-48dc-4d41-b0ea-d794ca590149', '2020-12-19 00:25:23', '2020-12-19 00:25:23', 1, 'https://media4.giphy.com/media/3oriNWeb2gzrZufbZ6/giphy-preview.gif?cid=bcbdc2dbsuhlr12dneeyp2kbn1nrko1eblxvakxr2w8u5ege&rid=giphy-preview.gif', 8, 7, 4, NULL, 4, '423c4205-14fe-47a3-bfb5-fb7fe0187583'),
(183, '0b504239-edda-4ce2-952b-e52489bb2d5f', '2020-12-19 00:37:49', '2020-12-19 00:37:49', 1, 'chaafo bạn', 1, 21, 7, NULL, 21, 'b3042db0-91c9-49a9-9f34-4c50dfc797c8'),
(184, '7f0c1af2-65c2-4e7a-9bca-b2ad5dff078d', '2020-12-19 00:37:49', '2020-12-19 00:37:49', 1, 'chaafo bạn', 1, 21, 7, NULL, 7, 'b3042db0-91c9-49a9-9f34-4c50dfc797c8'),
(185, '0d119eba-7993-48e7-a62d-9bfc321fb1b4', '2020-12-19 00:38:21', '2020-12-19 00:38:21', 1, 'chào', 1, 7, 21, NULL, 7, '0b999030-a7a2-4815-982e-b6b1fdf8e8e4'),
(186, '6e04d162-9617-4e5d-b840-b3963804a72b', '2020-12-19 00:38:21', '2020-12-19 00:38:21', 1, 'chào', 1, 7, 21, NULL, 21, '0b999030-a7a2-4815-982e-b6b1fdf8e8e4'),
(187, 'ef1b2922-739d-4ef5-8bfe-302c8d0849ba', '2020-12-19 00:38:27', '2020-12-19 00:38:27', 1, 'ok ', 1, 7, 21, NULL, 7, '17bf78fd-3ce1-471d-b8f6-b1ce8132dc6f'),
(188, 'd7f8bce7-92c2-4264-b7a8-5dd3894ec51e', '2020-12-19 00:38:27', '2020-12-19 00:38:27', 1, 'ok ', 1, 7, 21, NULL, 21, '17bf78fd-3ce1-471d-b8f6-b1ce8132dc6f'),
(189, 'e5eb3edd-7b5b-4580-a0b1-6d12b5365e19', '2020-12-19 00:38:32', '2020-12-19 00:38:32', 1, 'ok', 1, 21, 7, NULL, 21, '9d6b03c7-db8f-4dd2-be81-05c331338b10'),
(190, '00067ce5-7d60-40ad-874a-fdc93813b5d4', '2020-12-19 00:38:32', '2020-12-19 00:38:32', 1, 'ok', 1, 21, 7, NULL, 7, '9d6b03c7-db8f-4dd2-be81-05c331338b10'),
(191, '43de3204-696a-4dbd-9f19-f6efd455b23f', '2020-12-19 00:39:45', '2020-12-19 00:39:45', 1, 'alo', 1, 21, 7, NULL, 21, 'a7d9a6e3-d7eb-4c9e-9882-24527ecae7da'),
(192, '914ffaf0-23c0-4c40-831a-749351a2ff2b', '2020-12-19 00:39:45', '2020-12-19 00:39:45', 1, 'alo', 1, 21, 7, NULL, 7, 'a7d9a6e3-d7eb-4c9e-9882-24527ecae7da'),
(193, 'e753bf52-4617-412b-aef6-e26893341d07', '2020-12-19 00:39:51', '2020-12-19 00:39:51', 1, 'chi', 1, 7, 21, NULL, 7, '46379801-abc2-4b6b-b1a3-0c591c1f4f98'),
(194, 'b70f1b35-cc5c-419d-8e30-0cd41c041615', '2020-12-19 00:39:51', '2020-12-19 00:39:51', 1, 'chi', 1, 7, 21, NULL, 21, '46379801-abc2-4b6b-b1a3-0c591c1f4f98'),
(195, '225bf4a7-9100-4c54-954d-6eee68b9e1dd', '2020-12-19 17:45:07', '2020-12-19 17:45:07', 1, 'nhật', 1, 7, 21, NULL, 7, 'b9b6b85a-e02b-4b12-b634-1f4c8a332177'),
(196, '10967811-16e5-422c-9eb1-dfeea73ea2ab', '2020-12-19 17:45:07', '2020-12-19 17:45:07', 1, 'nhật', 1, 7, 21, NULL, 21, 'b9b6b85a-e02b-4b12-b634-1f4c8a332177'),
(197, '113bfdc3-f616-4382-8dbf-cd3d173051eb', '2020-12-19 17:45:12', '2020-12-19 17:45:12', 1, 'http://localhost:8000/media-storage/sticker/a7d3f1c9-7a9c-4dd6-8a53-561230d0ce23/vang.png', 12, 7, 21, 8, 7, '4fe7c000-e3b8-45ff-9bc5-b0fdf43dd062'),
(198, 'e98e0be2-edae-4d9b-a7a1-41fd6df69161', '2020-12-19 17:45:12', '2020-12-19 17:45:12', 1, 'http://localhost:8000/media-storage/sticker/a7d3f1c9-7a9c-4dd6-8a53-561230d0ce23/vang.png', 12, 7, 21, 8, 21, '4fe7c000-e3b8-45ff-9bc5-b0fdf43dd062');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configurations`
--

CREATE TABLE `configurations` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text DEFAULT NULL,
  `data_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `configurations`
--

INSERT INTO `configurations` (`_id`, `created_at`, `updated_at`, `name`, `value`, `data_type`) VALUES
(10, '2020-11-26 15:47:57', '2020-11-26 15:47:57', 'translation_languages', '{\"en\":{\"id\":\"en\",\"name\":\"English\",\"status\":true,\"created_at\":\"2020-11-26 15:46:19\",\"updated_at\":\"2020-11-26 15:46:19\",\"is_rtl\":false},\"fi\":{\"id\":\"fi\",\"name\":\"Finnish\",\"status\":true,\"created_at\":\"2020-11-26 15:47:57\",\"updated_at\":\"2020-11-26 15:47:57\",\"is_rtl\":false}}', 4),
(11, '2020-11-27 16:56:49', '2020-11-27 16:56:49', 'feature_plans', '{\"no_adds\":{\"select_user\":\"1\"},\"browse_incognito_mode\":{\"select_user\":\"2\"},\"show_like\":{\"select_user\":\"1\"},\"audio_call_via_messenger\":{\"select_user\":\"1\"},\"video_call_via_messenger\":{\"select_user\":\"1\"},\"user_encounter\":{\"select_user\":\"1\",\"encounter_all_user_count\":\"1000\"}}', 4),
(12, '2020-11-27 17:18:52', '2020-11-27 17:18:52', 'header_advertisement', '{\"title\":\"X (Appear in Header)\",\"height\":\"728\",\"width\":\"90\",\"status\":\"false\",\"content\":\"nguy\\u1ec5n v\\u0103n nh\\u1eadt\"}', 4),
(13, '2020-11-27 17:18:52', '2020-11-27 17:18:52', 'footer_advertisement', '{\"title\":\"X (Appear in Footer)\",\"height\":\"728\",\"width\":\"90\",\"status\":\"true\",\"content\":\"nh\\u1eadt\"}', 4),
(14, '2020-11-27 17:18:52', '2020-11-27 17:18:52', 'user_sidebar_advertisement', '{\"title\":\"X (Appear in User Sidebar)\",\"height\":\"200\",\"width\":\"200\",\"status\":\"true\",\"content\":\"nh\\u1eadt\"}', 4),
(15, '2020-11-27 18:01:03', '2020-11-27 18:01:03', 'enable_paypal', '1', 2),
(16, '2020-11-27 18:01:03', '2020-11-27 18:01:03', 'use_test_paypal_checkout', '1', 2),
(17, '2020-11-27 18:01:03', '2020-11-27 18:01:03', 'paypal_checkout_testing_client_id', 'AQ-r5AwsTk0yFeW8EO-0J24l8GJEa8N9EmlME3Qf7vuXiJ4c3odatqh8BODn7pNtFIRAg9Jl-CilMqRd', 1),
(18, '2020-11-27 18:01:03', '2020-11-27 18:01:03', 'paypal_checkout_testing_secret_key', 'EA2qwsn2KbPZeIpn5cPJDV3TdKuB_G1kXc7Ecb4A7lTirHHeTkvVWyH452hMcjP7JhHrTh-hTqGPaWSq', 1),
(20, '2020-11-29 08:54:13', '2020-11-29 08:54:13', 'mail_from_address', 'hoanghaonam94@gmail.com', 1),
(21, '2020-11-29 08:54:13', '2020-11-29 08:54:13', 'mail_from_name', 'Daty - Hẹn Hò Trực Tuyến', 1),
(23, '2020-11-29 08:54:13', '2020-11-29 08:54:13', 'smtp_mail_host', 'smtp.gmail.com', 1),
(24, '2020-11-29 08:54:13', '2020-11-29 08:54:13', 'smtp_mail_port', '587', 3),
(25, '2020-11-29 08:54:13', '2020-11-29 08:54:13', 'smtp_mail_encryption', 'tls', 1),
(26, '2020-11-29 08:54:13', '2020-11-29 08:54:13', 'smtp_mail_username', 'hoanghaonam94@gmail.com', 1),
(27, '2020-11-29 08:54:13', '2020-11-29 08:54:13', 'smtp_mail_password_or_apikey', 'svbtqtmsshxvjxiw', 1),
(29, '2020-11-30 09:04:11', '2020-11-30 09:04:11', 'facebook_client_id', '177933770644534', 1),
(30, '2020-11-30 09:04:11', '2020-11-30 09:04:11', 'facebook_client_secret', '44d81c25f8441aac737682b5b2e14ee4', 1),
(32, '2020-12-01 10:48:19', '2020-12-01 10:48:19', 'pusher_app_id', '1115939', 1),
(33, '2020-12-01 10:48:19', '2020-12-01 10:48:19', 'pusher_app_key', 'd51d08e6993f77e62370', 1),
(34, '2020-12-01 10:48:19', '2020-12-01 10:48:19', 'pusher_app_secret', 'fca8710e140c549d188c', 1),
(35, '2020-12-01 10:48:19', '2020-12-01 10:48:19', 'pusher_app_cluster_key', 'ap1', 1),
(37, '2020-12-01 13:57:34', '2020-12-01 13:57:34', 'agora_app_id', 'dcc6dff525f64b3ba239460c37a2f565', 1),
(38, '2020-12-01 13:57:34', '2020-12-01 13:57:34', 'agora_app_certificate_key', 'eafbd6d8c7e140779c361966fb57bcf4', 1),
(40, '2020-12-01 14:22:26', '2020-12-01 14:22:26', 'google_map_key', 'AIzaSyCBwpleEmc4oKhfWXP5cVFXIHNC1nXAwhg', 1),
(41, '2020-12-01 14:31:16', '2020-12-01 14:31:16', 'sparkpost_mail_password_or_apikey', '8617a60bb74a8a04e8569254a1a32074732d286f', 1),
(46, '2020-12-05 00:58:49', '2020-12-05 00:58:49', 'use_env_default_email_settings', '0', 2),
(48, '2020-12-05 01:19:27', '2020-12-05 01:19:27', 'google_client_id', '337756151990-7hkh99q52ubnntimjbis2tgn595p7k4q.apps.googleusercontent.com', 1),
(49, '2020-12-05 01:19:27', '2020-12-05 01:19:27', 'google_client_secret', 'M5XpZ6i79mpUqnKtppjGF4Lb', 1),
(50, '2020-12-05 15:53:00', '2020-12-05 15:53:00', 'activation_required_for_new_user', '1', 2),
(51, '2020-12-05 15:53:00', '2020-12-05 15:53:00', 'activation_required_for_change_email', '1', 2),
(52, '2020-12-05 15:53:00', '2020-12-05 15:53:00', 'terms_and_conditions_url', 'http://localhost:8000/admin/configuration/user', 1),
(53, '2020-12-06 21:33:42', '2020-12-06 21:33:42', 'enable_bonus_credits', '1', 2),
(54, '2020-12-07 00:23:45', '2020-12-07 00:23:45', 'currency', 'USD', 1),
(55, '2020-12-07 00:23:45', '2020-12-07 00:23:45', 'currency_value', 'VND', 1),
(56, '2020-12-07 00:23:45', '2020-12-07 00:23:45', 'currency_symbol', '&#36;', 1),
(57, '2020-12-07 00:23:45', '2020-12-07 00:23:45', 'round_zero_decimal_currency', '1', 2),
(59, '2020-12-08 10:12:33', '2020-12-08 10:12:33', 'small_logo_name', 'cau-truc-css.png', 1),
(60, '2020-12-08 10:12:44', '2020-12-08 10:12:44', 'favicon_name', 'logo.png', 1),
(69, '2020-12-11 00:22:50', '2020-12-11 00:22:50', 'contact_email', 'NhatNV62@wru.vn', 1),
(73, '2020-12-12 19:45:46', '2020-12-12 19:45:46', 'use_test_stripe', '1', 2),
(74, '2020-12-12 19:45:46', '2020-12-12 19:45:46', 'stripe_testing_secret_key', 'sk_test_51HxXVuHiZeIV9OSpk4By4Vc3yG6GNF7XFDisM5ti0Nh6oDyFZ39jr0BmfilKye5PeEjP9YUaUO4sFi7Xozlpaexv00VTQ4cl2g', 1),
(75, '2020-12-12 19:45:46', '2020-12-12 19:45:46', 'stripe_testing_publishable_key', 'pk_test_51HxXVuHiZeIV9OSpqltdIzzixaEI9PLdaju7MEXwWdUTnJGB70Fjylr4z8sCQMqrKAwaQD0lpWxrDOoK8GPvweME00jZhHaiqk', 1),
(77, '2020-12-12 19:59:50', '2020-12-12 19:59:50', 'giphy_key', 'WifITyS7ZaVI38sJlmlnmbprC3baGCfK', 1),
(78, '2020-12-15 22:11:33', '2020-12-15 22:11:33', 'plan_duration', '{\"one_week\":{\"enable\":true,\"price\":\"23000\"},\"one_month\":{\"enable\":true,\"price\":\"69000\"},\"three_month\":{\"enable\":true,\"price\":\"138000\"},\"half_year\":{\"enable\":true,\"price\":\"230000\"},\"year\":{\"enable\":true,\"price\":\"345000\"},\"life_time\":{\"enable\":true,\"price\":\"460000\"}}', 4),
(81, '2020-12-15 19:31:26', '2020-12-15 19:31:26', 'logo_name', 'logo.png', 1),
(86, '2020-12-16 12:45:26', '2020-12-16 12:45:26', 'timezone', 'Asia/Ho_Chi_Minh', 1),
(87, '2020-12-16 12:49:43', '2020-12-16 12:49:43', 'allow_facebook_login', '1', 2),
(88, '2020-12-16 12:49:43', '2020-12-16 12:49:43', 'allow_google_login', '1', 2),
(91, '2020-12-16 13:02:18', '2020-12-16 13:02:18', 'allow_pusher', '1', 2),
(92, '2020-12-16 13:02:18', '2020-12-16 13:02:18', 'allow_agora', '1', 2),
(93, '2020-12-16 13:02:18', '2020-12-16 13:02:18', 'allow_google_map', '1', 2),
(94, '2020-12-16 13:02:18', '2020-12-16 13:02:18', 'allow_giphy', '1', 2),
(95, '2020-12-18 22:24:02', '2020-12-18 22:24:02', 'enable_stripe', '1', 2),
(96, '2020-12-18 23:57:30', '2020-12-18 23:57:30', 'booster_period', '5', 3),
(97, '2020-12-18 23:57:30', '2020-12-18 23:57:30', 'booster_price', '100', 3),
(98, '2020-12-18 23:57:30', '2020-12-18 23:57:30', 'booster_price_for_premium_user', '100', 3),
(106, '2020-12-19 15:40:19', '2020-12-19 15:40:19', 'business_email', 'embebiboofficial@gmail.com', 1),
(108, '2020-12-19 15:41:59', '2020-12-19 15:41:59', 'name', 'Daty', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `_id` smallint(5) UNSIGNED NOT NULL,
  `iso_code` char(2) DEFAULT NULL,
  `name_capitalized` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `iso3_code` char(3) DEFAULT NULL,
  `iso_num_code` smallint(6) DEFAULT NULL,
  `phone_code` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`_id`, `iso_code`, `name_capitalized`, `name`, `iso3_code`, `iso_num_code`, `phone_code`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 243),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 7),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `credit_packages`
--

CREATE TABLE `credit_packages` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `credits` int(10) UNSIGNED NOT NULL,
  `price` decimal(13,4) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `users__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `credit_packages`
--

INSERT INTO `credit_packages` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `title`, `credits`, `price`, `image`, `users__id`) VALUES
(4, '0926a397-6a93-43d8-8753-beefd3dec969', '2020-12-18 22:13:32', '2020-12-18 22:13:43', 1, 'Cơ bản', 115000, '115000.0000', 'tien.jpg', 7),
(6, '7b0b1765-41dc-4b1c-8d27-8d40deb85533', '2020-12-18 22:15:14', '2020-12-18 22:15:14', 1, 'Vàng', 437000, '460000.0000', 'dong.jpg', 7),
(7, '20f3348c-eb79-4981-ab7e-c2dd8e9f497f', '2020-12-18 22:16:02', '2020-12-18 22:16:02', 1, 'Kim cương', 874000, '920000.0000', 'kim-cuong.jpg', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `credit_wallet_transactions`
--

CREATE TABLE `credit_wallet_transactions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `credits` int(11) NOT NULL COMMENT '- (minus) for debit & + for credit',
  `financial_transactions__id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `credit_type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Purchased, bonuses'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `credit_wallet_transactions`
--

INSERT INTO `credit_wallet_transactions` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `users__id`, `credits`, `financial_transactions__id`, `description`, `credit_type`) VALUES
(2, '2ced4e2f-a6d1-4d0d-b82d-a0e22405dafb', '2020-11-27 17:52:14', '2020-11-27 17:52:14', 1, 7, 0, NULL, NULL, NULL),
(3, '9b1afaf1-ecc6-44ff-a5e6-8f151a6101d5', '2020-11-27 17:53:21', '2020-11-27 17:53:21', 1, 7, 0, NULL, NULL, NULL),
(4, 'a8a3b1b4-a836-4b9a-a908-3c2a523c7bf3', '2020-11-28 09:27:19', '2020-11-28 09:27:19', 1, 7, 0, NULL, NULL, NULL),
(5, '4e4471fa-d94e-411e-8751-d98223c93715', '2020-11-28 10:26:32', '2020-11-28 10:26:32', 1, 7, 0, NULL, NULL, NULL),
(6, 'e3a8e697-7e77-4b31-8aa9-db9e732082fe', '2020-11-28 10:27:21', '2020-11-28 10:27:21', 1, 7, 0, NULL, NULL, NULL),
(7, 'd11dfc98-74af-4087-8489-9c3a3805e64f', '2020-11-28 10:29:23', '2020-11-28 10:29:23', 1, 7, 0, NULL, NULL, NULL),
(8, '746fa3bb-7aec-48c8-919c-6b9c3432e567', '2020-12-04 21:41:56', '2020-12-04 21:41:56', 1, 7, 0, NULL, NULL, NULL),
(9, 'd48253f1-46de-4e34-bbb3-9deb2a23950d', '2020-12-04 21:56:47', '2020-12-04 21:56:47', 1, 7, 0, NULL, NULL, NULL),
(10, 'f6b7ace9-5e8e-456e-9470-123f4190498a', '2020-12-06 22:11:46', '2020-12-06 22:11:46', 1, 26, 52, NULL, NULL, 2),
(11, 'b8e914e3-1e80-4958-ab92-f96cffdb8f27', '2020-12-06 22:22:18', '2020-12-06 22:22:18', 1, 26, 0, NULL, NULL, NULL),
(12, 'de3dcd4c-2401-4d83-be94-40942f22ea2a', '2020-12-06 22:23:59', '2020-12-06 22:23:59', 1, 26, -1, NULL, NULL, NULL),
(13, 'b8786045-de5f-492f-8c90-c84b51ffdee9', '2020-12-07 00:48:30', '2020-12-07 00:48:30', 1, 26, -1, NULL, NULL, NULL),
(14, '4416275e-7a87-402f-824f-22589e23e8f8', '2020-12-07 00:49:43', '2020-12-07 00:49:43', 1, 26, -5, NULL, NULL, NULL),
(15, 'b295eaf8-6465-43de-8f17-b034597d4119', '2020-12-07 01:19:41', '2020-12-07 01:19:41', 1, 26, 52, NULL, NULL, 2),
(16, 'c606e306-d118-446e-8d07-cdb0fb9b9a57', '2020-12-07 01:29:12', '2020-12-07 01:29:12', 1, 26, 52, NULL, NULL, 2),
(17, '148700e8-41b8-4828-8edf-f7ed7986d1b0', '2020-12-07 01:42:10', '2020-12-07 01:42:10', 1, 26, 52, NULL, NULL, 2),
(18, '3a450177-dbd0-40ea-9b94-a13ed6f7b714', '2020-12-07 01:48:18', '2020-12-07 01:48:18', 1, 26, 52, NULL, NULL, 2),
(19, 'ebaf1d00-57ef-4524-86d8-156279fc4d7b', '2020-12-07 01:50:39', '2020-12-07 01:50:39', 1, 26, 52, NULL, NULL, 2),
(20, '0f9f642e-c5cc-4ad5-a971-49859649e390', '2020-12-07 01:57:03', '2020-12-07 01:57:03', 1, 26, 52, NULL, NULL, 2),
(21, '1ff77f6f-e722-4780-b31a-cb35ff120b35', '2020-12-07 10:11:49', '2020-12-07 10:11:49', 1, 7, 0, NULL, NULL, NULL),
(22, '6d033ff3-99ed-44e5-8c9a-c9bb6121f49d', '2020-12-07 10:21:39', '2020-12-07 10:21:39', 1, 7, 0, NULL, NULL, NULL),
(23, 'fa46c1f2-b095-4a21-9f33-be7cb81cf158', '2020-12-07 15:25:08', '2020-12-07 15:25:08', 1, 7, 0, NULL, NULL, NULL),
(24, '8e5fe664-07b3-4ecd-969e-265d3bce87cd', '2020-12-08 23:10:25', '2020-12-08 23:10:25', 1, 26, 0, NULL, NULL, NULL),
(30, 'e368fef0-4d0d-4d86-94c0-e2690f63843d', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 38, 0, NULL, NULL, 1),
(31, '83e560c0-5de4-4fa3-9abc-1affd19ee385', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 39, 0, NULL, NULL, 1),
(32, '29ea8cf1-a674-40be-b475-f73c60904df6', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 40, 0, NULL, NULL, 1),
(33, 'de65eb0a-7bd7-4fee-a1aa-7853bfb80938', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 41, 0, NULL, NULL, 1),
(34, '03c1d7cf-ce7c-4850-ad14-36178a0ada16', '2020-12-12 19:52:59', '2020-12-12 19:52:59', 1, 7, 52, NULL, NULL, 2),
(35, '43236405-2335-4b97-b19c-d602767b7343', '2020-12-12 19:54:03', '2020-12-12 19:54:03', 1, 7, 52, 10, NULL, 2),
(36, '670f7b59-dead-4a4d-a218-ddaaa11a9581', '2020-12-12 20:41:55', '2020-12-12 20:41:55', 1, 7, 52, 11, NULL, 2),
(37, '080d58da-2626-4f81-8a35-ff006e2a42cd', '2020-12-12 20:42:47', '2020-12-12 20:42:47', 1, 7, 52, NULL, NULL, 2),
(38, 'c94feca3-3620-4f1b-800d-ae834af712c8', '2020-12-15 21:17:06', '2020-12-15 21:17:06', 1, 42, 0, NULL, NULL, 1),
(39, 'c82a4c38-e529-4e52-9d43-134af5a02188', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 43, 0, NULL, NULL, 1),
(40, 'bd9b61dd-dffd-4446-9465-778d742e9974', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 44, 0, NULL, NULL, 1),
(41, '77e06f12-b8fd-427b-a4be-1cb2515703f3', '2020-12-15 22:11:41', '2020-12-15 22:11:41', 1, 7, -1, NULL, NULL, NULL),
(42, '87e2c993-0da7-4803-81d4-6d55687ada6e', '2020-12-15 22:13:20', '2020-12-15 22:13:20', 1, 26, -1, NULL, NULL, NULL),
(43, '5803111d-66e6-4530-8004-57a2feeab227', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 45, 0, NULL, NULL, 1),
(44, 'e663f7bd-361c-4b28-8eb7-16e46ac77bd3', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 46, 0, NULL, NULL, 1),
(45, 'dcc8d604-a16e-4758-97e3-455e569d5c95', '2020-12-18 20:56:33', '2020-12-18 20:56:33', 1, 7, 52, NULL, NULL, 2),
(46, '2b50325e-894b-4ca8-ae22-02e863c72a03', '2020-12-18 20:57:21', '2020-12-18 20:57:21', 1, 7, 52, NULL, NULL, 2),
(47, '7e5f3dea-8bef-4ac1-9e39-fb53c577a0e7', '2020-12-18 22:17:15', '2020-12-18 22:17:15', 1, 7, 115000, NULL, NULL, 2),
(48, 'c7532b1b-d7fd-433b-bc4d-374d484a91b9', '2020-12-18 22:51:41', '2020-12-18 22:51:41', 1, 7, -230, NULL, NULL, NULL),
(49, '4f5db1cf-69a1-45ff-91af-7f2a09353201', '2020-12-18 23:09:43', '2020-12-18 23:09:43', 1, 7, 115000, 16, NULL, 2),
(50, 'ce6276fd-6e60-40c6-8e93-cde75f628f1f', '2020-12-18 23:18:20', '2020-12-18 23:18:20', 1, 7, -2000, NULL, NULL, NULL),
(51, 'fdde88ad-6659-446f-894b-7d26ea2e5731', '2020-12-18 23:59:08', '2020-12-18 23:59:08', 1, 7, -100, NULL, NULL, NULL),
(52, '2641c35b-a0fc-4dcf-82cf-bd3229c9bc3c', '2020-12-19 00:00:56', '2020-12-19 00:00:56', 1, 7, 100, NULL, NULL, NULL),
(53, '653aa78c-3a4f-4ee0-8554-1a9b4a30519f', '2020-12-19 00:01:24', '2020-12-19 00:01:24', 1, 7, 100, NULL, NULL, NULL),
(54, '1fc14dea-6f51-4e5f-99b7-8cc775c71b5c', '2020-12-19 16:19:52', '2020-12-19 16:19:52', 1, 7, -100, NULL, NULL, NULL),
(55, 'a3b294f1-fbd8-40d8-ad62-05441215647d', '2020-12-19 17:44:45', '2020-12-19 17:44:45', 1, 7, -100, NULL, NULL, NULL),
(56, '95201bb8-4b9c-4139-b0fd-67a98a6ff191', '2020-12-20 15:45:45', '2020-12-20 15:45:45', 1, 7, 874000, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `financial_transactions`
--

CREATE TABLE `financial_transactions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `amount` decimal(13,4) DEFAULT NULL,
  `__data` text DEFAULT NULL,
  `users__id` int(10) UNSIGNED DEFAULT NULL,
  `method` varchar(15) NOT NULL,
  `currency_code` varchar(5) DEFAULT NULL,
  `is_test` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `financial_transactions`
--

INSERT INTO `financial_transactions` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `amount`, `__data`, `users__id`, `method`, `currency_code`, `is_test`) VALUES
(10, '7a0ddb80-f50b-4dd4-8e06-e9ad45663c8b', '2020-12-12 19:54:02', '2020-12-12 19:54:02', 2, '52.0000', '{\"rawPaymentData\":\"{\\\"id\\\":\\\"pi_1HxXbDHiZeIV9OSpzmbIneuN\\\",\\\"object\\\":\\\"payment_intent\\\",\\\"amount\\\":5200,\\\"amount_capturable\\\":0,\\\"amount_received\\\":5200,\\\"application\\\":null,\\\"application_fee_amount\\\":null,\\\"canceled_at\\\":null,\\\"cancellation_reason\\\":null,\\\"capture_method\\\":\\\"automatic\\\",\\\"charges\\\":{\\\"object\\\":\\\"list\\\",\\\"data\\\":[{\\\"id\\\":\\\"ch_1HxXbnHiZeIV9OSpmkWoIPSS\\\",\\\"object\\\":\\\"charge\\\",\\\"amount\\\":5200,\\\"amount_captured\\\":5200,\\\"amount_refunded\\\":0,\\\"application\\\":null,\\\"application_fee\\\":null,\\\"application_fee_amount\\\":null,\\\"balance_transaction\\\":\\\"txn_1HxXbnHiZeIV9OSpWEU6aE8V\\\",\\\"billing_details\\\":{\\\"address\\\":{\\\"city\\\":null,\\\"country\\\":\\\"VN\\\",\\\"line1\\\":null,\\\"line2\\\":null,\\\"postal_code\\\":null,\\\"state\\\":null},\\\"email\\\":\\\"doan@gmail.com\\\",\\\"name\\\":\\\"do an\\\",\\\"phone\\\":null},\\\"calculated_statement_descriptor\\\":\\\"Stripe\\\",\\\"captured\\\":true,\\\"created\\\":1607777639,\\\"currency\\\":\\\"usd\\\",\\\"customer\\\":\\\"cus_IYevgcQiD9Gmdh\\\",\\\"description\\\":null,\\\"destination\\\":null,\\\"dispute\\\":null,\\\"disputed\\\":false,\\\"failure_code\\\":null,\\\"failure_message\\\":null,\\\"fraud_details\\\":[],\\\"invoice\\\":null,\\\"livemode\\\":false,\\\"metadata\\\":[],\\\"on_behalf_of\\\":null,\\\"order\\\":null,\\\"outcome\\\":{\\\"network_status\\\":\\\"approved_by_network\\\",\\\"reason\\\":null,\\\"risk_level\\\":\\\"normal\\\",\\\"risk_score\\\":20,\\\"seller_message\\\":\\\"Payment complete.\\\",\\\"type\\\":\\\"authorized\\\"},\\\"paid\\\":true,\\\"payment_intent\\\":\\\"pi_1HxXbDHiZeIV9OSpzmbIneuN\\\",\\\"payment_method\\\":\\\"pm_1HxXbmHiZeIV9OSpC5NvejLG\\\",\\\"payment_method_details\\\":{\\\"card\\\":{\\\"brand\\\":\\\"visa\\\",\\\"checks\\\":{\\\"address_line1_check\\\":null,\\\"address_postal_code_check\\\":null,\\\"cvc_check\\\":\\\"pass\\\"},\\\"country\\\":\\\"US\\\",\\\"exp_month\\\":2,\\\"exp_year\\\":2023,\\\"fingerprint\\\":\\\"LDsz0riE3qyTEVwT\\\",\\\"funding\\\":\\\"credit\\\",\\\"installments\\\":null,\\\"last4\\\":\\\"4242\\\",\\\"network\\\":\\\"visa\\\",\\\"three_d_secure\\\":null,\\\"wallet\\\":null},\\\"type\\\":\\\"card\\\"},\\\"receipt_email\\\":null,\\\"receipt_number\\\":null,\\\"receipt_url\\\":\\\"https:\\\\\\/\\\\\\/pay.stripe.com\\\\\\/receipts\\\\\\/acct_1HxXVuHiZeIV9OSp\\\\\\/ch_1HxXbnHiZeIV9OSpmkWoIPSS\\\\\\/rcpt_IYevDpPZvwNXR49ZpqjUqxEwc5uGXDY\\\",\\\"refunded\\\":false,\\\"refunds\\\":{\\\"object\\\":\\\"list\\\",\\\"data\\\":[],\\\"has_more\\\":false,\\\"total_count\\\":0,\\\"url\\\":\\\"\\\\\\/v1\\\\\\/charges\\\\\\/ch_1HxXbnHiZeIV9OSpmkWoIPSS\\\\\\/refunds\\\"},\\\"review\\\":null,\\\"shipping\\\":null,\\\"source\\\":null,\\\"source_transfer\\\":null,\\\"statement_descriptor\\\":null,\\\"statement_descriptor_suffix\\\":null,\\\"status\\\":\\\"succeeded\\\",\\\"transfer_data\\\":null,\\\"transfer_group\\\":null}],\\\"has_more\\\":false,\\\"total_count\\\":1,\\\"url\\\":\\\"\\\\\\/v1\\\\\\/charges?payment_intent=pi_1HxXbDHiZeIV9OSpzmbIneuN\\\"},\\\"client_secret\\\":\\\"pi_1HxXbDHiZeIV9OSpzmbIneuN_secret_3h5IuLbKZnOrE0LFk3DDMaJKK\\\",\\\"confirmation_method\\\":\\\"automatic\\\",\\\"created\\\":1607777603,\\\"currency\\\":\\\"usd\\\",\\\"customer\\\":\\\"cus_IYevgcQiD9Gmdh\\\",\\\"description\\\":null,\\\"invoice\\\":null,\\\"last_payment_error\\\":null,\\\"livemode\\\":false,\\\"metadata\\\":[],\\\"next_action\\\":null,\\\"on_behalf_of\\\":null,\\\"payment_method\\\":\\\"pm_1HxXbmHiZeIV9OSpC5NvejLG\\\",\\\"payment_method_options\\\":{\\\"card\\\":{\\\"installments\\\":null,\\\"network\\\":null,\\\"request_three_d_secure\\\":\\\"automatic\\\"}},\\\"payment_method_types\\\":[\\\"card\\\"],\\\"receipt_email\\\":null,\\\"review\\\":null,\\\"setup_future_usage\\\":null,\\\"shipping\\\":null,\\\"source\\\":null,\\\"statement_descriptor\\\":null,\\\"statement_descriptor_suffix\\\":null,\\\"status\\\":\\\"succeeded\\\",\\\"transfer_data\\\":null,\\\"transfer_group\\\":null}\",\"packageName\":\"1m52\"}', 7, 'Stripe', 'USD', 1),
(11, '8c4b7859-55a6-43bc-997d-80421b230035', '2020-12-12 20:41:55', '2020-12-12 20:41:55', 2, '52.0000', '{\"rawPaymentData\":\"{\\\"id\\\":\\\"41G55913GV888071P\\\",\\\"intent\\\":\\\"CAPTURE\\\",\\\"status\\\":\\\"COMPLETED\\\",\\\"purchase_units\\\":[{\\\"reference_id\\\":\\\"default\\\",\\\"amount\\\":{\\\"currency_code\\\":\\\"USD\\\",\\\"value\\\":\\\"52.00\\\"},\\\"payee\\\":{\\\"email_address\\\":\\\"sb-jeqg1402327@business.example.com\\\",\\\"merchant_id\\\":\\\"VQNF5AA8MWNX2\\\"},\\\"shipping\\\":{\\\"name\\\":{\\\"full_name\\\":\\\"John Doe\\\"},\\\"address\\\":{\\\"address_line_1\\\":\\\"1 Main St\\\",\\\"admin_area_2\\\":\\\"San Jose\\\",\\\"admin_area_1\\\":\\\"CA\\\",\\\"postal_code\\\":\\\"95131\\\",\\\"country_code\\\":\\\"US\\\"}},\\\"payments\\\":{\\\"captures\\\":[{\\\"id\\\":\\\"4CE68751T59575036\\\",\\\"status\\\":\\\"COMPLETED\\\",\\\"amount\\\":{\\\"currency_code\\\":\\\"USD\\\",\\\"value\\\":\\\"52.00\\\"},\\\"final_capture\\\":true,\\\"seller_protection\\\":{\\\"status\\\":\\\"ELIGIBLE\\\",\\\"dispute_categories\\\":[\\\"ITEM_NOT_RECEIVED\\\",\\\"UNAUTHORIZED_TRANSACTION\\\"]},\\\"seller_receivable_breakdown\\\":{\\\"gross_amount\\\":{\\\"currency_code\\\":\\\"USD\\\",\\\"value\\\":\\\"52.00\\\"},\\\"paypal_fee\\\":{\\\"currency_code\\\":\\\"USD\\\",\\\"value\\\":\\\"1.81\\\"},\\\"net_amount\\\":{\\\"currency_code\\\":\\\"USD\\\",\\\"value\\\":\\\"50.19\\\"}},\\\"links\\\":[{\\\"href\\\":\\\"https:\\\\\\/\\\\\\/api.sandbox.paypal.com\\\\\\/v2\\\\\\/payments\\\\\\/captures\\\\\\/4CE68751T59575036\\\",\\\"rel\\\":\\\"self\\\",\\\"method\\\":\\\"GET\\\"},{\\\"href\\\":\\\"https:\\\\\\/\\\\\\/api.sandbox.paypal.com\\\\\\/v2\\\\\\/payments\\\\\\/captures\\\\\\/4CE68751T59575036\\\\\\/refund\\\",\\\"rel\\\":\\\"refund\\\",\\\"method\\\":\\\"POST\\\"},{\\\"href\\\":\\\"https:\\\\\\/\\\\\\/api.sandbox.paypal.com\\\\\\/v2\\\\\\/checkout\\\\\\/orders\\\\\\/41G55913GV888071P\\\",\\\"rel\\\":\\\"up\\\",\\\"method\\\":\\\"GET\\\"}],\\\"create_time\\\":\\\"2020-12-12T13:41:45Z\\\",\\\"update_time\\\":\\\"2020-12-12T13:41:45Z\\\"}]}}],\\\"payer\\\":{\\\"name\\\":{\\\"given_name\\\":\\\"John\\\",\\\"surname\\\":\\\"Doe\\\"},\\\"email_address\\\":\\\"sb-wqtin3992351@personal.example.com\\\",\\\"payer_id\\\":\\\"4MH5KEQFVMAW8\\\",\\\"address\\\":{\\\"country_code\\\":\\\"US\\\"}},\\\"create_time\\\":\\\"2020-12-12T13:41:00Z\\\",\\\"update_time\\\":\\\"2020-12-12T13:41:45Z\\\",\\\"links\\\":[{\\\"href\\\":\\\"https:\\\\\\/\\\\\\/api.sandbox.paypal.com\\\\\\/v2\\\\\\/checkout\\\\\\/orders\\\\\\/41G55913GV888071P\\\",\\\"rel\\\":\\\"self\\\",\\\"method\\\":\\\"GET\\\"}]}\",\"packageName\":\"1m52\"}', 7, 'PayPal', 'USD', 1),
(16, '05c9b752-f6c2-4bab-93bd-be77b6ce3086', '2020-12-18 23:09:43', '2020-12-18 23:09:43', 2, '5.0000', '{\"rawPaymentData\":\"{\\\"id\\\":\\\"pi_1HzlVqHiZeIV9OSpRuxT0ve9\\\",\\\"object\\\":\\\"payment_intent\\\",\\\"amount\\\":500,\\\"amount_capturable\\\":0,\\\"amount_received\\\":500,\\\"application\\\":null,\\\"application_fee_amount\\\":null,\\\"canceled_at\\\":null,\\\"cancellation_reason\\\":null,\\\"capture_method\\\":\\\"automatic\\\",\\\"charges\\\":{\\\"object\\\":\\\"list\\\",\\\"data\\\":[{\\\"id\\\":\\\"ch_1HzlWSHiZeIV9OSpdZrd5UKI\\\",\\\"object\\\":\\\"charge\\\",\\\"amount\\\":500,\\\"amount_captured\\\":500,\\\"amount_refunded\\\":0,\\\"application\\\":null,\\\"application_fee\\\":null,\\\"application_fee_amount\\\":null,\\\"balance_transaction\\\":\\\"txn_1HzlWSHiZeIV9OSpFuZMYUpf\\\",\\\"billing_details\\\":{\\\"address\\\":{\\\"city\\\":null,\\\"country\\\":\\\"VN\\\",\\\"line1\\\":null,\\\"line2\\\":null,\\\"postal_code\\\":null,\\\"state\\\":null},\\\"email\\\":\\\"doan@gmail.com\\\",\\\"name\\\":\\\"do an\\\",\\\"phone\\\":null},\\\"calculated_statement_descriptor\\\":\\\"Stripe\\\",\\\"captured\\\":true,\\\"created\\\":1608307780,\\\"currency\\\":\\\"usd\\\",\\\"customer\\\":\\\"cus_IaxRsqfI5dXryw\\\",\\\"description\\\":null,\\\"destination\\\":null,\\\"dispute\\\":null,\\\"disputed\\\":false,\\\"failure_code\\\":null,\\\"failure_message\\\":null,\\\"fraud_details\\\":[],\\\"invoice\\\":null,\\\"livemode\\\":false,\\\"metadata\\\":[],\\\"on_behalf_of\\\":null,\\\"order\\\":null,\\\"outcome\\\":{\\\"network_status\\\":\\\"approved_by_network\\\",\\\"reason\\\":null,\\\"risk_level\\\":\\\"normal\\\",\\\"risk_score\\\":34,\\\"seller_message\\\":\\\"Payment complete.\\\",\\\"type\\\":\\\"authorized\\\"},\\\"paid\\\":true,\\\"payment_intent\\\":\\\"pi_1HzlVqHiZeIV9OSpRuxT0ve9\\\",\\\"payment_method\\\":\\\"pm_1HzlWQHiZeIV9OSpC7LeYbxt\\\",\\\"payment_method_details\\\":{\\\"card\\\":{\\\"brand\\\":\\\"visa\\\",\\\"checks\\\":{\\\"address_line1_check\\\":null,\\\"address_postal_code_check\\\":null,\\\"cvc_check\\\":\\\"pass\\\"},\\\"country\\\":\\\"US\\\",\\\"exp_month\\\":2,\\\"exp_year\\\":2025,\\\"fingerprint\\\":\\\"LDsz0riE3qyTEVwT\\\",\\\"funding\\\":\\\"credit\\\",\\\"installments\\\":null,\\\"last4\\\":\\\"4242\\\",\\\"network\\\":\\\"visa\\\",\\\"three_d_secure\\\":null,\\\"wallet\\\":null},\\\"type\\\":\\\"card\\\"},\\\"receipt_email\\\":null,\\\"receipt_number\\\":null,\\\"receipt_url\\\":\\\"https:\\\\\\/\\\\\\/pay.stripe.com\\\\\\/receipts\\\\\\/acct_1HxXVuHiZeIV9OSp\\\\\\/ch_1HzlWSHiZeIV9OSpdZrd5UKI\\\\\\/rcpt_IaxR43Gyv3WGHLQcTIpnRDLJKk8xLY1\\\",\\\"refunded\\\":false,\\\"refunds\\\":{\\\"object\\\":\\\"list\\\",\\\"data\\\":[],\\\"has_more\\\":false,\\\"total_count\\\":0,\\\"url\\\":\\\"\\\\\\/v1\\\\\\/charges\\\\\\/ch_1HzlWSHiZeIV9OSpdZrd5UKI\\\\\\/refunds\\\"},\\\"review\\\":null,\\\"shipping\\\":null,\\\"source\\\":null,\\\"source_transfer\\\":null,\\\"statement_descriptor\\\":null,\\\"statement_descriptor_suffix\\\":null,\\\"status\\\":\\\"succeeded\\\",\\\"transfer_data\\\":null,\\\"transfer_group\\\":null}],\\\"has_more\\\":false,\\\"total_count\\\":1,\\\"url\\\":\\\"\\\\\\/v1\\\\\\/charges?payment_intent=pi_1HzlVqHiZeIV9OSpRuxT0ve9\\\"},\\\"client_secret\\\":\\\"pi_1HzlVqHiZeIV9OSpRuxT0ve9_secret_UguDIKfaCHUTr9BkRRV26picF\\\",\\\"confirmation_method\\\":\\\"automatic\\\",\\\"created\\\":1608307742,\\\"currency\\\":\\\"usd\\\",\\\"customer\\\":\\\"cus_IaxRsqfI5dXryw\\\",\\\"description\\\":null,\\\"invoice\\\":null,\\\"last_payment_error\\\":null,\\\"livemode\\\":false,\\\"metadata\\\":[],\\\"next_action\\\":null,\\\"on_behalf_of\\\":null,\\\"payment_method\\\":\\\"pm_1HzlWQHiZeIV9OSpC7LeYbxt\\\",\\\"payment_method_options\\\":{\\\"card\\\":{\\\"installments\\\":null,\\\"network\\\":null,\\\"request_three_d_secure\\\":\\\"automatic\\\"}},\\\"payment_method_types\\\":[\\\"card\\\"],\\\"receipt_email\\\":null,\\\"review\\\":null,\\\"setup_future_usage\\\":null,\\\"shipping\\\":null,\\\"source\\\":null,\\\"statement_descriptor\\\":null,\\\"statement_descriptor_suffix\\\":null,\\\"status\\\":\\\"succeeded\\\",\\\"transfer_data\\\":null,\\\"transfer_group\\\":null}\",\"packageName\":\"C\\u01a1 b\\u1ea3n\"}', 7, 'Stripe', 'USD', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `items`
--

CREATE TABLE `items` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT 'Gift or Sticker',
  `title` varchar(150) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `normal_price` decimal(13,4) DEFAULT NULL,
  `premium_price` varchar(45) DEFAULT NULL,
  `user_authorities__id` int(10) UNSIGNED DEFAULT NULL,
  `premium_only` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `items`
--

INSERT INTO `items` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `type`, `title`, `file_name`, `normal_price`, `premium_price`, `user_authorities__id`, `premium_only`) VALUES
(1, '5c813aa5-54e8-419d-ad31-0ab222aea107', '2020-11-25 14:16:28', '2020-11-26 14:16:28', 1, 2, 'dep', '000.jpg', '5.0000', '5', 7, NULL),
(3, '8d96e761-6dcf-4c8d-8b4f-ab5729b5af06', '2020-12-06 23:16:41', '2020-12-12 20:46:32', 1, 1, 'cơ bản', 'cmsn4.jpg', '1000.0000', '2000', 7, NULL),
(5, '0c558b7f-6265-413d-8750-decff737e3a0', '2020-12-07 00:36:46', '2020-12-07 00:36:46', 1, 1, 'yeu 2', 'cmsn6.jpg', '1000.0000', '2000', 7, NULL),
(6, '88069730-f01d-4c0a-a2ce-8c9010d30f5b', '2020-12-07 00:38:45', '2020-12-07 00:38:45', 1, 1, 'yeu 3', 'cmsn7.jpg', '1000.0000', '1000', 7, NULL),
(8, 'a7d3f1c9-7a9c-4dd6-8a53-561230d0ce23', '2020-12-18 22:44:39', '2020-12-18 22:44:39', 1, 2, 'Vàng', 'vang.png', '230.0000', '230', 7, NULL),
(9, '6d4f6160-0983-4932-ac5a-c60139de6270', '2020-12-18 22:46:22', '2020-12-18 22:46:22', 1, 2, 'Bạc', 'bac.png', '115.0000', '115', 7, NULL),
(10, '783a205e-df9d-4675-aead-c5152c560a6f', '2020-12-18 22:47:19', '2020-12-18 22:47:19', 1, 1, 'Kim cương', 'kim-cuong.png', '11500.0000', '11500', 7, NULL),
(11, '538960c2-5564-484d-a3be-42042d58ed02', '2020-12-18 22:47:52', '2020-12-18 22:47:52', 1, 1, 'Đồng', 'dong.png', '4600.0000', '4600', 7, NULL),
(12, '244755ac-3c52-49a0-a47b-5727ea6b2e18', '2020-12-18 23:01:48', '2020-12-18 23:01:48', 1, 2, 'Dâu', '99-995151-strawberry-icons-strawberry-icon-ico-clipart.png', '0.0000', '0', 7, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `like_dislikes`
--

CREATE TABLE `like_dislikes` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL,
  `like` tinyint(3) UNSIGNED NOT NULL COMMENT '0 for dislike, 1 for like',
  `why` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `like_dislikes`
--

INSERT INTO `like_dislikes` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `to_users__id`, `by_users__id`, `like`, `why`) VALUES
(52, '0dbe93e0-d9eb-4eff-adf5-04a8dbbf4ae4', '2020-12-04 10:23:26', '2020-12-04 10:23:30', 1, 21, 7, 1, NULL),
(54, 'a2ee356a-d83f-4bdd-918c-c715594d6468', '2020-12-07 10:21:09', '2020-12-07 10:22:07', 1, 7, 21, 1, NULL),
(55, 'bb906c9a-6d1e-4615-91df-cc3c89ffabe3', '2020-12-07 10:21:48', '2020-12-07 10:21:48', 1, 7, 7, 1, NULL),
(57, '5bc6e944-98fa-488c-b93f-a2f19f989c03', '2020-12-15 21:25:39', '2020-12-15 21:25:43', 1, 26, 42, 1, NULL),
(58, '49a4e2e1-5d5f-4466-a13c-64ac68019cef', '2020-12-15 21:32:19', '2020-12-15 21:32:19', 1, 21, 42, 0, NULL),
(61, '0eedf5c3-b613-4ee5-8bf6-1cfb1b24084a', '2020-12-15 21:39:41', '2020-12-15 21:39:41', 1, 42, 7, 1, NULL),
(62, 'f2386cd6-992a-465a-82b5-3c5f3e5565c0', '2020-12-15 22:05:45', '2020-12-15 22:05:45', 1, 7, 42, 0, NULL),
(63, 'e71a71ea-8f0d-4d8d-8b8f-671832b937d4', '2020-12-15 22:14:08', '2020-12-15 22:14:08', 1, 7, 26, 1, NULL),
(64, '6aefb8a5-bdd7-49e9-9278-0a8ca2e6c76f', '2020-12-16 01:19:37', '2020-12-19 00:45:40', 1, 21, 26, 1, NULL),
(65, 'b06d8a78-3e92-4ac5-bae7-f7090ad071a1', '2020-12-18 15:53:51', '2020-12-18 15:53:51', 1, 45, 7, 0, NULL),
(66, 'a8ac471d-2833-4606-977c-0d55b1183afb', '2020-12-19 17:42:43', '2020-12-19 17:42:47', 1, 26, 7, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `message` varchar(500) NOT NULL,
  `action` varchar(255) NOT NULL,
  `is_read` tinyint(3) UNSIGNED DEFAULT 0,
  `users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `message`, `action`, `is_read`, `users__id`) VALUES
(10, 'a6d3a71e-bed9-46f3-b42f-4f5a16906505', '2020-11-27 17:14:49', '2020-11-27 17:14:49', 1, 'Message request received from  embebibo embebibo', 'http://localhost:8000/@embebibo5', NULL, 4),
(19, 'dfde0798-9d1c-4e53-a333-e5587bd65941', '2020-12-01 10:45:59', '2020-12-01 10:45:59', 1, 'Message request received from  embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(20, '3e3f0cb8-6e74-48bc-9bba-078c6de2af7d', '2020-12-01 11:01:37', '2020-12-01 11:01:37', 1, 'Message request received from  embebibo7 embebibo7', 'http://localhost:8000/@embebibo7', 1, 21),
(21, 'fc99de2f-9a89-4afb-9c2b-943c5ed3536f', '2020-12-03 16:59:08', '2020-12-03 16:59:08', 1, 'Hồ sơ được thích bởi Long Nhật', 'http://localhost:8000/@long-nhat', 1, 7),
(22, 'f1810370-69a3-4d2f-a9e0-3fd05f2e396f', '2020-12-03 16:59:27', '2020-12-03 16:59:27', 1, 'Hồ sơ được thích bởi Long Nhật', 'http://localhost:8000/@long-nhat', 1, 7),
(23, 'e62f72be-cd10-408c-bae3-09bc29213e0f', '2020-12-03 16:59:39', '2020-12-03 16:59:39', 1, 'Hồ sơ được thích bởi Long Nhật', 'http://localhost:8000/@long-nhat', 1, 7),
(24, 'c6b8ebae-866b-4ad9-9252-6ce4d474ab7d', '2020-12-03 17:00:15', '2020-12-03 17:00:15', 1, 'Hồ sơ được thích bởi Long Nhật', 'http://localhost:8000/@long-nhat', 1, 7),
(25, 'ba2ff92c-3352-44b7-ac95-ce48622f0bc3', '2020-12-03 17:04:45', '2020-12-03 17:04:45', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(26, '9602181b-f5fb-445a-8bed-847ea4a4676a', '2020-12-03 17:13:08', '2020-12-03 17:13:08', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(27, '2bb5e045-3fcd-4e5e-b774-12bfb71da71d', '2020-12-03 17:27:13', '2020-12-03 17:27:13', 1, 'Profile liked by embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(28, '45af622b-04db-4245-81f9-ffcce8706c12', '2020-12-03 17:27:22', '2020-12-03 17:27:22', 1, 'Profile liked by embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(29, '2b7c8c1d-4d31-42cb-a917-0e418f1fe74a', '2020-12-03 17:29:52', '2020-12-03 17:29:52', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(30, '1220d4fe-0b87-443b-9ad4-5246ddf92e9a', '2020-12-03 17:31:02', '2020-12-03 17:31:02', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(31, '8e4eb08d-8548-4556-9547-a88fc32b7a02', '2020-12-03 17:36:03', '2020-12-03 17:36:03', 1, 'Profile liked by embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(32, '6a46d8b0-cc00-41dd-bd14-8998a11a8041', '2020-12-03 17:37:42', '2020-12-03 17:37:42', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(33, '01cc4a5e-243f-45b6-82a6-126e91342171', '2020-12-03 17:41:14', '2020-12-03 17:41:14', 1, 'Profile liked by embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(34, '4d000cee-0620-4059-9985-54ac58c74a8c', '2020-12-03 17:41:25', '2020-12-03 17:41:25', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(35, 'c1670f15-3838-46e1-b907-dc34790fdcb1', '2020-12-03 17:43:21', '2020-12-03 17:43:21', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(36, '12cc0d38-caa1-4baf-8582-71f2dc2a2171', '2020-12-03 17:43:35', '2020-12-03 17:43:35', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(37, '4e3b560d-0938-41f3-8e6e-f6cf78e45f49', '2020-12-03 17:44:38', '2020-12-03 17:44:38', 1, 'Profile liked by embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(38, '39564ba6-0690-4e01-85de-845500d3c265', '2020-12-03 17:56:13', '2020-12-03 17:56:13', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(39, 'ae301a91-b3d1-4d26-8c8b-22fde87420e7', '2020-12-03 17:56:22', '2020-12-03 17:56:22', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(40, '376184df-ce0f-449d-b473-d571ce55fe69', '2020-12-03 17:58:55', '2020-12-03 17:58:55', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(41, '37a9d1a1-fce2-4342-8f81-0176717d8963', '2020-12-04 10:23:31', '2020-12-04 10:23:31', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 21),
(43, '05511ef7-e4f4-4504-9196-5b61d3af39c4', '2020-12-05 08:41:28', '2020-12-05 08:41:28', 1, 'Profile visited by embebibo6 embebibo6', 'http://localhost:8000/@embebibo6', 1, 26),
(45, '968aa563-39f8-4178-88cf-3bbac013d8a4', '2020-12-07 00:48:31', '2020-12-07 00:48:31', 1, 'Gift send by embebibo2 embebibo2', 'http://localhost:8000/@embebibo2', 1, 21),
(46, '317fe3f9-ae59-426e-8dc3-ae04300ac77a', '2020-12-07 00:50:23', '2020-12-07 00:50:23', 1, 'Message request received from  embebibo2 embebibo2', 'http://localhost:8000/@embebibo2', 1, 21),
(47, 'a1661972-2816-4851-90e6-ff51e07c3615', '2020-12-07 10:21:48', '2020-12-07 10:21:48', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 7),
(48, '4d4d3e99-59fc-49e8-9b1f-cb676d0b6e4f', '2020-12-07 10:22:07', '2020-12-07 10:22:07', 1, 'Hồ sơ được thích bởi Long Nhật', 'http://localhost:8000/@long-nhat', 1, 7),
(49, '86f8c792-f4bb-4739-9062-8b4e629c19af', '2020-12-07 15:24:18', '2020-12-07 15:24:18', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(50, '071f4059-4ab1-4f4b-9b69-74cf9737095c', '2020-12-07 15:24:19', '2020-12-07 15:24:19', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(51, 'c987b737-4e07-4a3c-b145-982dde68a460', '2020-12-07 21:36:21', '2020-12-07 21:36:21', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(52, '0a0f070f-46b8-4424-98b9-64097f61bac4', '2020-12-07 21:36:28', '2020-12-07 21:36:28', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(53, '6f73c61c-bfc2-446c-889b-fb9e6b38d6c9', '2020-12-08 09:58:54', '2020-12-08 09:58:54', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(54, 'a46844f3-175e-4d05-8bd9-c515121a19fa', '2020-12-08 09:58:54', '2020-12-08 09:58:54', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(55, '1ff2f36b-45a3-4656-926c-219c3dd94ac8', '2020-12-08 10:26:54', '2020-12-08 10:26:54', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(56, 'e6d8324b-5cda-4505-b88f-e9454051d949', '2020-12-08 10:26:54', '2020-12-08 10:26:54', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(57, '98ec9e67-336a-4c65-9eef-6d1a5439306a', '2020-12-08 10:36:24', '2020-12-08 10:36:24', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(58, 'e015dc3e-1fd7-47df-8364-ceed5cf83a08', '2020-12-08 10:36:24', '2020-12-08 10:36:24', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(59, '8aedb626-74f2-4b13-841a-f4e75cae991b', '2020-12-08 10:36:43', '2020-12-08 10:36:43', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(60, 'd0834a3c-96d4-437f-88e0-651b52ebdae6', '2020-12-08 10:36:43', '2020-12-08 10:36:43', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(61, 'c6f1f22e-6369-466b-be50-474e5769c387', '2020-12-08 10:50:49', '2020-12-08 10:50:49', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(62, 'fb79ec4d-f95b-4cc8-88a8-305ae839dbae', '2020-12-08 10:50:49', '2020-12-08 10:50:49', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(63, 'ebf5b4d6-cb1a-41a0-a0a5-06cc9ecee4e7', '2020-12-08 15:10:16', '2020-12-08 15:10:16', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(64, 'eb3378b2-f006-455b-baca-72e163317251', '2020-12-08 15:10:17', '2020-12-08 15:10:17', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(65, '73d4e615-2fdb-4c9d-8c80-1079ca2f7209', '2020-12-08 20:30:12', '2020-12-08 20:30:12', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(66, '04f9b2b0-828f-43a1-ad9d-58b30fff347e', '2020-12-08 20:30:13', '2020-12-08 20:30:13', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(67, '1d35431e-0832-41b6-8c04-154907138a5a', '2020-12-08 23:18:04', '2020-12-08 23:18:04', 1, 'Yêu cầu tin nhắn từ  embebibo6 embebibo6', 'http://localhost:8000/@embebibo6', 1, 21),
(68, '253a79c1-9c90-411a-9e08-79d93b551e23', '2020-12-08 23:22:17', '2020-12-08 23:22:17', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(69, '82baa7fd-179a-4df3-9b63-da01b933d2b5', '2020-12-08 23:22:17', '2020-12-08 23:22:17', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(70, '7ada935d-c2fb-4759-b0f3-f7e0d5bc8104', '2020-12-11 00:52:11', '2020-12-11 00:52:11', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(71, 'a3f5e7a9-bfea-41c4-b3d3-696930587748', '2020-12-11 00:52:12', '2020-12-11 00:52:12', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(72, '1a290fb8-c950-4861-9100-b50fa0bd25c4', '2020-12-12 17:06:30', '2020-12-12 17:06:30', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(73, '5816002a-9105-4c83-8d60-f1bd08295bbc', '2020-12-12 17:06:31', '2020-12-12 17:06:31', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(74, '6df0d924-d9b5-44f7-8d9f-e055b17e8397', '2020-12-12 20:11:58', '2020-12-12 20:11:58', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(75, 'e603d32f-271b-4470-82fa-d344347a8142', '2020-12-12 20:11:59', '2020-12-12 20:11:59', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(76, '248687fa-cd0a-4abc-84d5-1d038f7bff59', '2020-12-12 20:15:56', '2020-12-12 20:15:56', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(77, '5f5a8dcd-5975-4147-8920-01ebea1170ac', '2020-12-12 20:15:56', '2020-12-12 20:15:56', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(78, 'a49f57cf-ce41-44dc-aace-9d9d92e16e04', '2020-12-12 23:08:11', '2020-12-12 23:08:11', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(79, '91a017c0-833e-4d66-9573-6cc73d0045b3', '2020-12-12 23:08:12', '2020-12-12 23:08:12', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(80, '664af786-aae4-4c86-9f59-96d0bb552103', '2020-12-13 22:02:30', '2020-12-13 22:02:30', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(81, '828ae848-2911-442d-8c24-b1be72cd0cf5', '2020-12-13 22:02:31', '2020-12-13 22:02:31', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(82, '5281c3ce-0891-4bb0-9846-d16e24207b56', '2020-12-15 16:05:11', '2020-12-15 16:05:11', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(83, '9344e9e0-5c54-4c6a-a866-2fefa8ea9b7d', '2020-12-15 16:05:12', '2020-12-15 16:05:12', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(84, '02c25507-6709-457d-9515-43f0e3b776ad', '2020-12-15 21:18:36', '2020-12-15 21:18:36', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(85, 'a4c27713-fc9c-4a50-92c4-4ea0d232e7a1', '2020-12-15 21:18:36', '2020-12-15 21:18:36', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(86, '04fa331f-5d98-42a0-9038-ca9bfc0168c5', '2020-12-15 21:34:45', '2020-12-15 21:34:45', 1, 'Yêu cầu tin nhắn từ  embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 42),
(87, '9ba1254f-7071-4112-bcac-8c7f056a1394', '2020-12-15 21:35:31', '2020-12-15 21:35:31', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', 1, 42),
(88, 'd718e6a4-ab34-4564-8b4b-61e5a85c3ada', '2020-12-15 21:38:22', '2020-12-15 21:38:22', 1, 'Hồ sơ được thích bởi embebiboxx embebiboxx', 'http://localhost:8000/@embebiboxx', 1, 7),
(89, '44653eb8-4f89-4eeb-81d2-079772046626', '2020-12-15 21:39:41', '2020-12-15 21:39:41', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', NULL, 42),
(90, 'bf80d545-d14d-4324-9205-feed1687e58d', '2020-12-15 22:12:47', '2020-12-15 22:12:47', 1, 'embebibo2 embebibo2 là Đăng nhập. ', 'http://localhost:8000/@embebibo2', NULL, 42),
(91, '1706ea5e-0d4a-4a5b-823e-429f71f7e2d7', '2020-12-15 22:14:08', '2020-12-15 22:14:08', 1, 'Hồ sơ được thích bởi embebibo2 embebibo2', 'http://localhost:8000/@embebibo2', 1, 7),
(92, '2371c296-af7e-4743-8de3-dddc3353ccbc', '2020-12-15 23:34:58', '2020-12-15 23:34:58', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(93, 'c2c993b9-7c42-472f-97de-096daf384132', '2020-12-15 23:35:00', '2020-12-15 23:35:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(94, '1386f67c-904c-4b0d-919c-ab0516aa3fef', '2020-12-15 23:35:00', '2020-12-15 23:35:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(95, '3891f1b7-9e88-4a14-ae40-ed705b30cb3f', '2020-12-15 23:54:08', '2020-12-15 23:54:08', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(96, '555d3d2d-f05d-49f5-b794-afdfdb3e70dd', '2020-12-15 23:54:09', '2020-12-15 23:54:09', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(97, '42cca357-16d2-41fa-b52b-b354e94e0303', '2020-12-15 23:54:09', '2020-12-15 23:54:09', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(98, '8a73c904-23fc-4ffd-aff8-54f7291d6636', '2020-12-15 23:55:21', '2020-12-15 23:55:21', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(99, 'df1b7d3f-173e-4910-87ac-413c1117f0f8', '2020-12-15 23:55:21', '2020-12-15 23:55:21', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(100, '06cd9a12-5869-4c56-84c9-66bdbd75de33', '2020-12-15 23:55:22', '2020-12-15 23:55:22', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(101, 'b8a39c64-b79b-44f8-ac7d-008c11bd9ecf', '2020-12-15 23:56:53', '2020-12-15 23:56:53', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(102, 'f8f37412-75b8-4911-abcf-022d465a382b', '2020-12-15 23:56:54', '2020-12-15 23:56:54', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(103, '97dbb1ac-d817-4d2c-ac9b-a58d3a402221', '2020-12-15 23:56:55', '2020-12-15 23:56:55', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(104, '175a49a2-ebdd-49c3-99b1-ddd3041ebbfa', '2020-12-16 00:03:20', '2020-12-16 00:03:20', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(105, '65c243be-3a31-48a6-81c0-2b52c680dce4', '2020-12-16 00:03:20', '2020-12-16 00:03:20', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(106, 'bac39c41-b9e4-4fd6-ae92-1be8ce66fc44', '2020-12-16 00:03:20', '2020-12-16 00:03:20', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(107, 'f23023b0-dc36-44c1-8b95-72fdae051c1d', '2020-12-16 00:04:42', '2020-12-16 00:04:42', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(108, 'fea19b57-7f98-461c-a291-9d22efd136fb', '2020-12-16 00:04:43', '2020-12-16 00:04:43', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(109, '82320e71-8c0e-49e2-a28d-c5d8c21b5351', '2020-12-16 00:04:43', '2020-12-16 00:04:43', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(110, '56fb21c6-3dee-49da-bcfd-b8aed1f15c3c', '2020-12-16 00:05:49', '2020-12-16 00:05:49', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(111, '5bc23902-c4a2-4b2d-8baf-89f554553f2f', '2020-12-16 00:05:50', '2020-12-16 00:05:50', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(112, '503245f3-d016-4fd8-8b6a-4d1a6cd047b1', '2020-12-16 00:05:50', '2020-12-16 00:05:50', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(113, '0921b10e-520d-48aa-9e14-21700af29fd0', '2020-12-16 00:08:59', '2020-12-16 00:08:59', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(114, '9d83a877-8c34-4450-82ee-3116ba3446d8', '2020-12-16 00:09:00', '2020-12-16 00:09:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(115, 'fec7f9db-f04e-49ec-9918-6b9da48c2968', '2020-12-16 00:09:00', '2020-12-16 00:09:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(116, '97c87486-4e26-40a2-9491-8b5d0ebf1505', '2020-12-16 00:09:43', '2020-12-16 00:09:43', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(117, '133a3bd0-7a85-4f08-a672-02b2eacc8166', '2020-12-16 00:09:43', '2020-12-16 00:09:43', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(118, '8b29d36e-3764-49de-ae9c-14d144e29ed2', '2020-12-16 00:09:44', '2020-12-16 00:09:44', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(119, '8a7d2e81-f9de-4775-96ec-f72a0faf3b6d', '2020-12-16 00:10:26', '2020-12-16 00:10:26', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(120, '888bd2b4-414c-4ce1-8aac-58d533726a5a', '2020-12-16 00:10:27', '2020-12-16 00:10:27', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(121, '066e0760-5974-4489-8dda-b4e3f4c4af23', '2020-12-16 00:10:27', '2020-12-16 00:10:27', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(122, 'e5a017d5-5d61-4665-9f76-91a97cfb7ef3', '2020-12-16 00:12:21', '2020-12-16 00:12:21', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(123, '677852d5-2212-4826-a273-95adcecc47a5', '2020-12-16 00:12:23', '2020-12-16 00:12:23', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(124, '1cb48350-a70f-466e-accd-92ca713d14b8', '2020-12-16 00:12:23', '2020-12-16 00:12:23', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(125, '3b997fbe-e314-476e-a1da-8eeb7610e6f9', '2020-12-16 00:26:27', '2020-12-16 00:26:27', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(126, '77e62f38-a3f3-45b9-a3c1-78984d37ddeb', '2020-12-16 00:26:28', '2020-12-16 00:26:28', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(127, '1a577d50-781e-45d3-8c93-59ed62ffb3fa', '2020-12-16 00:26:28', '2020-12-16 00:26:28', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(128, '8aea450f-9525-4114-9d9c-fbdf205d920e', '2020-12-16 00:29:40', '2020-12-16 00:29:40', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(129, '26c8eb24-beea-42a8-adb1-4f62583ee178', '2020-12-16 00:29:41', '2020-12-16 00:29:41', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(130, '70db5760-f516-4506-8b20-6a4792e28785', '2020-12-16 00:29:41', '2020-12-16 00:29:41', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(131, '45d0fbfb-d6af-4d7f-b152-e0e05c60b531', '2020-12-16 00:30:45', '2020-12-16 00:30:45', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(132, '55fbe0b0-c5ab-4a07-a390-6697e2aa3cd6', '2020-12-16 00:30:46', '2020-12-16 00:30:46', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(133, '85d65d9a-e2b7-4d6e-b027-eab32840072a', '2020-12-16 00:30:46', '2020-12-16 00:30:46', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(134, '55577669-1124-455b-b52a-17d960be79ef', '2020-12-16 00:33:30', '2020-12-16 00:33:30', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(135, '20e13bf6-a6b7-453e-b1cd-91a96e1d0a84', '2020-12-16 00:33:30', '2020-12-16 00:33:30', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(136, 'f3b5832f-73a0-4576-b268-738d2bf61346', '2020-12-16 00:33:31', '2020-12-16 00:33:31', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(137, '71a047f2-a5bb-4de9-a4c6-595b68fcd68b', '2020-12-16 00:36:57', '2020-12-16 00:36:57', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(138, '11ab16d9-6f41-4b99-9326-616cf16b17d7', '2020-12-16 00:36:58', '2020-12-16 00:36:58', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(139, '141b3f86-96d6-4c56-841c-fb62f98eb4a1', '2020-12-16 00:36:58', '2020-12-16 00:36:58', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(140, '316cacd0-5e87-4ed9-907b-03df7bddd46d', '2020-12-16 00:45:06', '2020-12-16 00:45:06', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(141, 'c2570385-adec-4a37-9e87-e3a4e13a624a', '2020-12-16 00:45:06', '2020-12-16 00:45:06', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(142, 'eb92ca6b-3d9f-4be6-9e87-9c29ae8bf25b', '2020-12-16 00:45:06', '2020-12-16 00:45:06', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(143, '8055deb3-a182-4c47-b739-2854983c80b1', '2020-12-16 00:52:01', '2020-12-16 00:52:01', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(144, 'fb5ac7bc-8915-4fd2-8534-464f25dc2f12', '2020-12-16 00:52:02', '2020-12-16 00:52:02', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(145, '29806c07-3b1b-4140-9374-64cb71838ac2', '2020-12-16 00:52:02', '2020-12-16 00:52:02', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(146, 'd72fe03f-563a-4f80-866b-47ed869a16f8', '2020-12-16 01:03:07', '2020-12-16 01:03:07', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(147, '5f5ea570-a2da-481d-8c9b-5f22d01c92e1', '2020-12-16 01:03:07', '2020-12-16 01:03:07', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(148, '0c15734d-7758-451d-95f0-ceda640aa3fa', '2020-12-16 01:03:07', '2020-12-16 01:03:07', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(149, '65610cb2-dadf-4012-8540-088e5c11f19b', '2020-12-16 01:11:00', '2020-12-16 01:11:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(150, '26dfaef4-979b-42ff-a44b-310395673eaa', '2020-12-16 01:11:02', '2020-12-16 01:11:02', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(151, '497715e4-55a1-4ed3-bd54-91e54982071c', '2020-12-16 01:11:05', '2020-12-16 01:11:05', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(152, 'db288083-577e-47fc-a38c-62c9cccde635', '2020-12-16 01:12:37', '2020-12-16 01:12:37', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(153, '004d6d22-be6e-4178-800a-4de0bd54f571', '2020-12-16 01:12:37', '2020-12-16 01:12:37', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(154, '5adba3b9-56f8-4b49-b103-73503ed2a420', '2020-12-16 01:12:38', '2020-12-16 01:12:38', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(155, 'eec9d26d-5617-4bcd-a925-87b369d70db5', '2020-12-16 01:19:07', '2020-12-16 01:19:07', 1, 'embebibo2 embebibo2 là Đăng nhập. ', 'http://localhost:8000/@embebibo2', NULL, 42),
(156, 'c4622a10-9020-4a13-9ccf-80d27c001ba3', '2020-12-16 01:19:37', '2020-12-16 01:19:37', 1, 'Hồ sơ được thích bởi embebibo2 embebibo2', 'http://localhost:8000/@embebibo2', 1, 21),
(157, '0ffeee49-07d7-4c4d-be0e-c05a845b172a', '2020-12-16 01:40:45', '2020-12-16 01:40:45', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(158, '73c2d184-f869-4fd6-ad01-515089ed42db', '2020-12-16 01:40:45', '2020-12-16 01:40:45', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(159, '7bfe1482-5554-44de-8f6d-89179e2249b3', '2020-12-16 01:40:46', '2020-12-16 01:40:46', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(160, '8295020d-a38b-4e65-a73e-f8156af6a141', '2020-12-16 01:48:26', '2020-12-16 01:48:26', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(161, 'ddb9482f-4a3b-43ac-9b01-a34b16e1f7b6', '2020-12-16 01:48:28', '2020-12-16 01:48:28', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(162, 'e73b2dd1-af3e-47ff-a212-d11882e8d5fe', '2020-12-16 01:48:29', '2020-12-16 01:48:29', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(163, '56907338-a4b8-42e6-9b10-e5ca036cf0a3', '2020-12-16 01:50:45', '2020-12-16 01:50:45', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(164, '75493695-59e9-41bb-81fc-76069d0e33b0', '2020-12-16 01:50:47', '2020-12-16 01:50:47', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(165, 'dfaaadf5-8222-4e4e-aea8-4536c8b9059a', '2020-12-16 01:50:47', '2020-12-16 01:50:47', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(166, '8e1f9380-5ebd-403c-84f8-38845f3fe96e', '2020-12-16 01:56:47', '2020-12-16 01:56:47', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(167, 'a90211f8-0381-47af-9a24-9892e08d6e31', '2020-12-16 01:56:50', '2020-12-16 01:56:50', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(168, 'a312d5fe-6651-4402-b4c8-aee07790186d', '2020-12-16 01:56:50', '2020-12-16 01:56:50', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(169, '78405443-9c03-4feb-bd24-b8ef768426f9', '2020-12-16 01:59:05', '2020-12-16 01:59:05', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(170, 'c39161fe-e5a3-49e1-809d-477652f981b9', '2020-12-16 01:59:09', '2020-12-16 01:59:09', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(171, '001a84b8-d62d-46e0-ae32-35553195ba12', '2020-12-16 01:59:09', '2020-12-16 01:59:09', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(172, '6fa32cca-a5d5-4e7c-aa50-e7dcb59d9005', '2020-12-15 19:28:35', '2020-12-15 19:28:35', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(173, '15026635-10da-4320-a352-f73857d95530', '2020-12-15 19:28:35', '2020-12-15 19:28:35', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(174, '407ca861-d3c3-4a9d-9a75-712e30f63415', '2020-12-15 19:28:35', '2020-12-15 19:28:35', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(175, '7d329b2f-ca65-4cca-b187-60c8adcd30ed', '2020-12-15 19:30:48', '2020-12-15 19:30:48', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(176, '43f224ec-d25b-4f77-b34c-f31c64aa422f', '2020-12-15 19:30:48', '2020-12-15 19:30:48', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(177, 'cfc66f50-ecf1-4f9e-a39c-38ad9bee5501', '2020-12-15 19:30:48', '2020-12-15 19:30:48', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(178, 'ccab068f-5165-436d-b2e5-ff108981c241', '2020-12-15 19:33:22', '2020-12-15 19:33:22', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(179, '512ab84e-2257-4851-b3a9-fa006992772a', '2020-12-15 19:33:24', '2020-12-15 19:33:24', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(180, '78b1e04b-a9c4-45e5-a9b2-baff4b3bacd4', '2020-12-15 19:33:24', '2020-12-15 19:33:24', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(181, '04eafa31-2251-4804-bb20-4c2cfbc05db5', '2020-12-16 02:54:23', '2020-12-16 02:54:23', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(182, 'c26fa020-c2e5-407f-9eff-dce7ee752a86', '2020-12-16 02:54:25', '2020-12-16 02:54:25', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(183, '0288aa98-b6fd-4c94-94d6-a0c3153e95c5', '2020-12-16 02:54:27', '2020-12-16 02:54:27', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(184, 'b60af9ee-bac7-42e5-a18d-1c7bd4f07412', '2020-12-16 02:54:42', '2020-12-16 02:54:42', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(185, 'e97379ce-f7d0-4a20-8a4d-4a4a3182629b', '2020-12-16 02:54:43', '2020-12-16 02:54:43', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(186, '1ef28857-900f-42a4-b877-a412c6e64f05', '2020-12-16 02:54:44', '2020-12-16 02:54:44', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(187, 'aa6e5c66-229f-4eba-8f61-603f2848e854', '2020-12-16 08:51:46', '2020-12-16 08:51:46', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(188, '1bf4bbc5-e1c9-4e67-8e1a-eca2bd262756', '2020-12-16 08:51:47', '2020-12-16 08:51:47', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(189, '393860b5-73c6-4840-b863-26d35153d5a9', '2020-12-16 08:51:47', '2020-12-16 08:51:47', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(190, 'c6bea045-19c7-446e-93d5-8a2810abf74c', '2020-12-16 09:01:58', '2020-12-16 09:01:58', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(191, '6ad2bc84-cd03-44e4-ad36-853024235e7a', '2020-12-16 09:01:58', '2020-12-16 09:01:58', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(192, '9a02cf63-36c2-4ccd-a462-7f80138060dc', '2020-12-16 09:01:58', '2020-12-16 09:01:58', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(193, 'c8f12f80-11df-4e01-ba72-26a538e93d12', '2020-12-16 03:47:27', '2020-12-16 03:47:27', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(194, '6b5937f3-a402-4f68-9b59-28971a4bd212', '2020-12-16 03:47:28', '2020-12-16 03:47:28', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(195, 'ba2c3118-5277-4733-afff-4295fe2ab25f', '2020-12-16 03:47:28', '2020-12-16 03:47:28', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(196, '7ea71afc-b2cb-4cbd-9995-e01f8b16af8a', '2020-12-16 03:52:16', '2020-12-16 03:52:16', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(197, '8be2bdaf-d9fd-467b-a0c6-cd1241129b53', '2020-12-16 03:52:16', '2020-12-16 03:52:16', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(198, '9e946b7b-00f0-4866-8af1-27872293598b', '2020-12-16 03:52:16', '2020-12-16 03:52:16', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(199, '69947cb0-ea9e-4e54-8220-6325de74e817', '2020-12-16 03:58:51', '2020-12-16 03:58:51', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(200, '91a62aad-9d46-4be9-aeb8-45471faed403', '2020-12-16 03:58:53', '2020-12-16 03:58:53', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(201, 'bfc854b4-6b56-4e40-be11-d9c839ec691d', '2020-12-16 03:58:53', '2020-12-16 03:58:53', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(202, '3007e272-f2eb-4a19-846a-ff208e20242c', '2020-12-16 11:08:24', '2020-12-16 11:08:24', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(203, '88b410ee-3c61-427c-a238-3a72c3c623c6', '2020-12-16 11:08:25', '2020-12-16 11:08:25', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(204, '60b0b6e7-ac78-467e-b46f-d6c00fae5c40', '2020-12-16 11:08:25', '2020-12-16 11:08:25', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(205, '3476d036-13b6-4832-9410-9fbe51d5ab14', '2020-12-16 11:15:55', '2020-12-16 11:15:55', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(206, '6354f259-c17d-4b3c-91f7-929638214be6', '2020-12-16 11:15:55', '2020-12-16 11:15:55', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(207, 'a8b586bc-8202-4a00-b388-4e0c92437347', '2020-12-16 11:15:56', '2020-12-16 11:15:56', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(208, '0b986dbc-a07d-4c9f-af27-6ea0b0c804ff', '2020-12-16 11:27:41', '2020-12-16 11:27:41', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(209, 'a1c1db2a-6aa0-47f6-8886-705e422bbd44', '2020-12-16 11:27:41', '2020-12-16 11:27:41', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(210, 'efe2cb70-fbeb-41e4-bc05-57b8a572735d', '2020-12-16 11:27:41', '2020-12-16 11:27:41', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(211, '74108584-979d-4265-882b-981dcb529519', '2020-12-16 11:34:50', '2020-12-16 11:34:50', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(212, '8561052a-d9fd-4997-a69d-1484553d5351', '2020-12-16 11:34:50', '2020-12-16 11:34:50', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(213, 'b88eb2a4-e511-4eee-92e7-7d695a2c6b21', '2020-12-16 11:34:50', '2020-12-16 11:34:50', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(214, 'd7beb83a-b32b-4e67-948c-fc18a4c728cf', '2020-12-16 11:41:00', '2020-12-16 11:41:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(215, 'c0aaca4a-2189-49ad-b423-cef14b399120', '2020-12-16 11:41:00', '2020-12-16 11:41:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(216, 'a7e6ce93-67f9-4ad1-9ab1-04a7d0f5797a', '2020-12-16 11:41:00', '2020-12-16 11:41:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(217, '959e63dc-d2be-4d4d-a2d0-682cad5e87cc', '2020-12-16 11:46:13', '2020-12-16 11:46:13', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(218, '9a3cbd8c-5a0e-4627-bab0-3b9030fb5214', '2020-12-16 11:46:13', '2020-12-16 11:46:13', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(219, 'ee19ad65-365a-4bef-874d-676b3f6a249f', '2020-12-16 11:46:13', '2020-12-16 11:46:13', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(220, '9791d189-a4aa-41a7-b497-700c6465a148', '2020-12-16 11:50:09', '2020-12-16 11:50:09', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(221, '285947ea-0a5c-42ee-a391-25f1d9dc293d', '2020-12-16 11:50:10', '2020-12-16 11:50:10', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(222, '79d174ad-f774-4caa-9d9f-d6227a31f290', '2020-12-16 11:50:10', '2020-12-16 11:50:10', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(223, 'c00f5e4e-4434-4fa0-a16d-cf87b0fed922', '2020-12-16 11:55:22', '2020-12-16 11:55:22', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(224, '8da9af1b-493e-4f29-bcd5-1faf12d590ec', '2020-12-16 11:55:22', '2020-12-16 11:55:22', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(225, 'e0576d7d-a610-4f85-a1a1-29e15e11dcb1', '2020-12-16 11:55:22', '2020-12-16 11:55:22', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(226, '1c148668-9ff5-4e6d-b315-fdcf4924dfab', '2020-12-16 12:10:44', '2020-12-16 12:10:44', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(227, '2ca26fa2-0c3a-46aa-bf22-50a0a7e88baf', '2020-12-16 12:10:47', '2020-12-16 12:10:47', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(228, '671f0eb3-f438-4e73-8060-907ed284dcab', '2020-12-16 12:10:47', '2020-12-16 12:10:47', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(229, '6513b1c4-e075-46eb-9c27-ac193f719d03', '2020-12-16 12:13:36', '2020-12-16 12:13:36', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(230, '7ca61b04-389f-4eea-8b6d-f6a22acb8672', '2020-12-16 12:13:37', '2020-12-16 12:13:37', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(231, 'e6791da9-641e-496a-8428-569672c3350a', '2020-12-16 12:13:38', '2020-12-16 12:13:38', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(232, '46a5ada4-45f0-4675-bd0b-9ae8fc15d6c0', '2020-12-16 12:16:43', '2020-12-16 12:16:43', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(233, '61d643ed-ab1a-4ab4-a38b-ba268fd3c7e5', '2020-12-16 12:16:44', '2020-12-16 12:16:44', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(234, '44fdf910-c499-4952-b815-7b410e3edc42', '2020-12-16 12:16:44', '2020-12-16 12:16:44', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(235, '5e6bba36-d45f-40f9-8d05-0dcc2cbcdadd', '2020-12-16 12:18:35', '2020-12-16 12:18:35', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(236, '70fbf977-86d8-416e-82ef-caa820a426b6', '2020-12-16 12:18:35', '2020-12-16 12:18:35', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(237, '36a2b8d1-1310-4774-82ed-140f11f8a32c', '2020-12-16 12:18:35', '2020-12-16 12:18:35', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(238, '9ea88177-8a2b-446b-8a76-a4eaf97152a1', '2020-12-16 12:20:27', '2020-12-16 12:20:27', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(239, 'b6fba2e2-d70e-4565-a6e2-7c06ef29a7bc', '2020-12-16 12:20:28', '2020-12-16 12:20:28', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(240, 'b84d29d0-f01f-44c7-8ff5-84fe646003a2', '2020-12-16 12:20:28', '2020-12-16 12:20:28', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(241, '9e9da2a3-cfd3-4bee-a359-175d72a51f8d', '2020-12-16 12:23:19', '2020-12-16 12:23:19', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(242, '147a4483-b49a-45ca-a0c1-8c9350d3f651', '2020-12-16 12:23:19', '2020-12-16 12:23:19', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(243, '92ef4050-4cea-468a-a838-113af7ef29c4', '2020-12-16 12:23:19', '2020-12-16 12:23:19', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(244, 'd252d4f4-6128-45b2-b4ff-6dd636922ec7', '2020-12-16 12:36:36', '2020-12-16 12:36:36', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(245, '307ee01d-01b0-485f-a1a1-d3f16bb59a9a', '2020-12-16 12:36:37', '2020-12-16 12:36:37', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(246, '514b005d-fc5e-4009-a951-1be75c78d803', '2020-12-16 12:36:37', '2020-12-16 12:36:37', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(247, 'c0acd157-7b7a-4b8a-a053-e108843cc267', '2020-12-16 12:40:06', '2020-12-16 12:40:06', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(248, 'c0c1a1d8-20e0-45fa-ab03-2fcb8b0027cd', '2020-12-16 12:40:06', '2020-12-16 12:40:06', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(249, '1f71cc0e-a893-4995-9a69-1cca9f5c187d', '2020-12-16 12:40:06', '2020-12-16 12:40:06', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(250, '1571fed1-fa67-4830-afb0-caa96f0a70af', '2020-12-16 12:48:40', '2020-12-16 12:48:40', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(251, '79af79db-7309-4baa-9fb2-bfc2f451da7a', '2020-12-16 12:48:40', '2020-12-16 12:48:40', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(252, '347a1aed-ec98-4571-ade1-1359be5629f5', '2020-12-16 12:48:41', '2020-12-16 12:48:41', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(253, '9a7dd44a-5f44-4649-a308-344eed2723d6', '2020-12-16 12:48:53', '2020-12-16 12:48:53', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(254, 'fa8beab5-2e6d-4c34-a753-dbe363298eac', '2020-12-16 12:48:53', '2020-12-16 12:48:53', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(255, 'eca091ee-fe16-4d2d-997c-87aa7e1c2735', '2020-12-16 12:48:53', '2020-12-16 12:48:53', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(256, '3acf9d6f-65ac-4c36-a48f-00a1fbf809bf', '2020-12-16 12:50:00', '2020-12-16 12:50:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(257, 'f5ed663c-5b94-4bf9-bc72-165d2d3c11ad', '2020-12-16 12:50:01', '2020-12-16 12:50:01', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(258, '29579ea4-4881-4ce9-8333-054dc838824d', '2020-12-16 12:50:01', '2020-12-16 12:50:01', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(259, '67247c69-70df-4581-a30b-8405aacbc273', '2020-12-16 12:52:04', '2020-12-16 12:52:04', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(260, 'af7dcb01-2982-4ca5-9342-7871982e6c95', '2020-12-16 12:52:04', '2020-12-16 12:52:04', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(261, '96dc6afe-d314-45cc-99b8-12c3950e7f0a', '2020-12-16 12:52:04', '2020-12-16 12:52:04', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(262, '1a6388e6-ca9e-47d7-98ab-1037d3d05eda', '2020-12-16 12:57:08', '2020-12-16 12:57:08', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(263, '94c0ea89-e98a-4948-ac32-76c6fda03e61', '2020-12-16 12:57:09', '2020-12-16 12:57:09', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(264, 'd68d7411-c6d0-41f7-aa32-1e755524b699', '2020-12-16 12:57:09', '2020-12-16 12:57:09', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(265, '0c489847-7895-42bb-be51-aa727e3349e6', '2020-12-17 17:01:12', '2020-12-17 17:01:12', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(266, 'cf6656f8-dc44-4ab2-913e-b7b0f771c68e', '2020-12-17 17:01:13', '2020-12-17 17:01:13', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(267, '82a32314-a592-4d35-99db-d1e6caff46c4', '2020-12-17 17:01:14', '2020-12-17 17:01:14', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(268, 'be4dc934-5fcd-4c99-b74b-0d0a9b05dcfb', '2020-12-18 15:24:50', '2020-12-18 15:24:50', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(269, '575e7c89-b7ba-43ee-8886-2b5c9de975f9', '2020-12-18 15:24:52', '2020-12-18 15:24:52', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(270, 'e06b2028-8351-45f7-986d-04eeb3cee5da', '2020-12-18 15:24:52', '2020-12-18 15:24:52', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(271, '2e3dcf6f-c870-4d23-9acb-abaff89478db', '2020-12-18 15:25:11', '2020-12-18 15:25:11', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(272, 'e5f56dcb-e7f9-4004-8e4f-608a80c67e54', '2020-12-18 15:25:12', '2020-12-18 15:25:12', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(273, '67e1c4e3-df07-4146-a05f-3e86fe35b1a3', '2020-12-18 15:25:12', '2020-12-18 15:25:12', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(274, '952a4ab3-0e23-4e2d-ac9c-a3a49a3d8fcf', '2020-12-18 20:22:39', '2020-12-18 20:22:39', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(275, 'e4dfb127-ba68-4c99-b1c2-ec6cf04fa85a', '2020-12-18 20:22:39', '2020-12-18 20:22:39', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(276, 'f335fcbb-084e-4adf-8ec6-deddce969545', '2020-12-18 20:22:40', '2020-12-18 20:22:40', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(277, 'c4f8510e-12aa-4f15-976c-c765e893f2d7', '2020-12-18 22:18:47', '2020-12-18 22:18:47', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(278, 'd58d7b09-a25b-4771-b977-eedfd756a04b', '2020-12-18 22:18:48', '2020-12-18 22:18:48', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(279, '4de7ac48-d584-4818-b31e-62a7ea8826dd', '2020-12-18 22:18:48', '2020-12-18 22:18:48', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(280, 'dc68e726-f271-4ca6-bef0-a586c998f6a0', '2020-12-18 22:21:45', '2020-12-18 22:21:45', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(281, '1d4ef454-75ed-4380-af37-4c0e89168d67', '2020-12-18 22:21:46', '2020-12-18 22:21:46', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(282, '4e7b9032-8971-451b-83d1-30cb9dfa0648', '2020-12-18 22:21:46', '2020-12-18 22:21:46', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(283, '66c3471c-6b98-46ca-9ca5-1d526c6586ad', '2020-12-18 22:24:55', '2020-12-18 22:24:55', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(284, 'dffcae5b-9230-47d2-b8e4-9e975d6e51e4', '2020-12-18 22:24:56', '2020-12-18 22:24:56', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(285, '8be76b26-8623-438c-b8ed-cd546b9aa7ac', '2020-12-18 22:24:57', '2020-12-18 22:24:57', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(286, 'e1fcda87-941f-46b5-96bd-7138cf316d82', '2020-12-18 22:29:02', '2020-12-18 22:29:02', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 21),
(287, '939e7933-84ec-4723-88ea-2c0490b654a3', '2020-12-18 22:29:03', '2020-12-18 22:29:03', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(288, '38d54512-542f-4215-8303-fb8ab8d28175', '2020-12-18 22:29:03', '2020-12-18 22:29:03', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 26),
(289, '083bc663-8f39-4efe-a53b-96a99349b942', '2020-12-18 23:18:20', '2020-12-18 23:18:20', 1, 'Gift send by embebibo embebibo', 'http://localhost:8000/@embebibo5', NULL, 44),
(290, 'd1e3bed2-dc14-4b30-8055-b56989d66c1b', '2020-12-19 00:44:07', '2020-12-19 00:44:07', 1, 'embebibo2 embebibo2 là Đăng nhập. ', 'http://localhost:8000/@embebibo2', NULL, 42),
(291, '68cb2fc1-0eaf-418c-9f31-daf4a7fd5054', '2020-12-19 00:45:40', '2020-12-19 00:45:40', 1, 'Hồ sơ được thích bởi embebibo2 embebibo2', 'http://localhost:8000/@embebibo2', NULL, 21),
(292, '4e4af825-1457-4319-acd1-3aee6236e2a5', '2020-12-19 10:14:04', '2020-12-19 10:14:04', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 21),
(293, '35992122-34f7-4b4d-a780-174c26563be2', '2020-12-19 10:14:04', '2020-12-19 10:14:04', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(294, 'a9f33f08-9d92-4caf-adfc-385c08f94315', '2020-12-19 10:14:04', '2020-12-19 10:14:04', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 26),
(295, '82a40379-d7ce-415c-a596-64b329048af9', '2020-12-19 11:16:00', '2020-12-19 11:16:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 21),
(296, 'f4a5fdc1-89b2-49a4-8295-6b0030250bc9', '2020-12-19 11:16:01', '2020-12-19 11:16:01', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(297, 'e70f9aa2-8deb-493c-b01a-8a110fefe5a7', '2020-12-19 11:16:01', '2020-12-19 11:16:01', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 26),
(298, '9640b709-7914-4e77-b98a-98ada9d7575d', '2020-12-19 14:52:47', '2020-12-19 14:52:47', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 21),
(299, '875e7763-2a33-4621-bccb-fb677d34eb24', '2020-12-19 15:01:08', '2020-12-19 15:01:08', 1, 'embebibo2 embebibo2 là Đăng nhập. ', 'http://localhost:8000/@embebibo2', NULL, 42),
(300, '77a8981d-6320-4af5-a8b4-b4e9300f6d8d', '2020-12-19 17:42:05', '2020-12-19 17:42:05', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 21),
(301, '4ba3b29a-c794-4b86-b89e-438ac82e1475', '2020-12-19 17:42:06', '2020-12-19 17:42:06', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(302, '5dbc4ede-aac7-4e9e-9da5-ec0b27653c1c', '2020-12-19 17:42:06', '2020-12-19 17:42:06', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 26),
(303, 'a7c2adda-0953-4a27-a837-57f9ac554ad2', '2020-12-19 17:42:43', '2020-12-19 17:42:43', 1, 'Hồ sơ được thích bởi embebibo embebibo', 'http://localhost:8000/@embebibo5', NULL, 26),
(304, 'aeee7b84-d7ee-4c86-b77e-b9f45bd0ea2d', '2020-12-20 11:03:37', '2020-12-20 11:03:37', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 21),
(305, '89414b42-d74d-40d8-a1fc-91fc091ecbfc', '2020-12-20 11:03:38', '2020-12-20 11:03:38', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(306, '483f9d89-ef5a-44c1-b402-7606cd34de25', '2020-12-20 11:03:38', '2020-12-20 11:03:38', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 26);
INSERT INTO `notifications` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `message`, `action`, `is_read`, `users__id`) VALUES
(307, '58ac7509-02b2-43d5-8b85-2820a6a6ad57', '2020-12-20 15:12:19', '2020-12-20 15:12:19', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 21),
(308, 'd8c43b17-9c6f-4415-a132-69b1320adc7e', '2020-12-20 15:12:20', '2020-12-20 15:12:20', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', 1, 7),
(309, '0b06d7ea-2ea1-4cd8-b816-6f8b8394c563', '2020-12-20 15:12:20', '2020-12-20 15:12:20', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 26),
(310, 'b9297a7d-a08d-4c7e-99ab-90b56d678d12', '2020-12-20 15:25:39', '2020-12-20 15:25:39', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 21),
(311, '029b5389-1a0c-45f5-849d-d979598a2136', '2020-12-20 15:25:41', '2020-12-20 15:25:41', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 7),
(312, 'ecee739f-1787-46a5-ab43-c8b91e5f64c4', '2020-12-20 15:25:42', '2020-12-20 15:25:42', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 26),
(313, '48a932b5-1b22-4dd1-aa10-3fc67509145b', '2020-12-20 15:35:59', '2020-12-20 15:35:59', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 21),
(314, '173bdff4-c842-4a29-97b2-b6a13d0cfd5e', '2020-12-20 15:36:00', '2020-12-20 15:36:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 7),
(315, '67105d08-40af-40eb-b17b-3ba39d50bd20', '2020-12-20 15:36:00', '2020-12-20 15:36:00', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 26),
(316, '8b3d45fa-6293-4ff6-b819-58a089eade31', '2020-12-21 12:49:28', '2020-12-21 12:49:28', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 21),
(317, '1efcc90b-cca1-427a-a10a-b475de3c2e19', '2020-12-21 12:49:29', '2020-12-21 12:49:29', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 7),
(318, 'e033a626-f9b8-4c81-a6db-2a470d9f28be', '2020-12-21 12:49:29', '2020-12-21 12:49:29', 1, 'embebibo embebibo là Đăng nhập. ', 'http://localhost:8000/@embebibo5', NULL, 26);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`_id`, `_uid`, `created_at`, `updated_at`, `email`, `token`) VALUES
(11, '04173768-feaf-4d14-aabd-c8b13e8fe9c5', '2020-12-05 00:52:36', '2020-12-05 00:52:36', 'embebiboofficial@gmail.com', '73683f81-2c5e-458c-863e-6494fb720d1b'),
(17, '77c2f3f3-ec26-432c-80fe-e213c0ae3250', '2020-12-05 01:02:17', '2020-12-05 01:02:17', 'NhatNV62@wru.vn', '7031892a-bf7e-4bd8-b232-30b65d632456'),
(18, '239d0b68-2de2-4266-a4f1-2a681a4a3a9e', '2020-12-05 16:00:44', '2020-12-05 16:00:44', 'japan26081998@gmail.com', 'bf4b7835-fc7b-49d1-a5e6-6546d91d6c81');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile_boosts`
--

CREATE TABLE `profile_boosts` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `for_users__id` int(10) UNSIGNED NOT NULL,
  `expiry_at` datetime NOT NULL,
  `credit_wallet_transactions__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `profile_boosts`
--

INSERT INTO `profile_boosts` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `for_users__id`, `expiry_at`, `credit_wallet_transactions__id`) VALUES
(2, '001893a2-d41a-4232-a163-a34ca0ee7b89', '2020-11-27 17:52:14', '2020-11-27 17:52:14', 1, 7, '2020-11-27 17:57:14', 2),
(3, 'd744993f-e80e-44c4-9284-d3ee5c3e7c8d', '2020-11-27 17:53:21', '2020-11-27 17:53:21', 1, 7, '2020-11-27 18:02:13', 3),
(4, 'd3be4fbd-6b5a-4669-ac7d-63d2561b16ff', '2020-11-28 09:27:20', '2020-11-28 09:27:20', 1, 7, '2020-11-28 09:32:20', 4),
(5, '4db605c5-3554-47d7-a23e-cc15725cbec1', '2020-11-28 10:26:32', '2020-11-28 10:26:32', 1, 7, '2020-11-28 10:31:32', 5),
(6, 'cb236e50-4132-4997-809f-6212614c59b6', '2020-11-28 10:27:21', '2020-11-28 10:27:21', 1, 7, '2020-11-28 10:36:31', 6),
(7, 'a040bf81-82dc-4754-a762-74dd86575a2e', '2020-11-28 10:29:23', '2020-11-28 10:29:23', 1, 7, '2020-11-28 10:41:30', 7),
(8, '37dd7bb2-51e3-4a01-bb85-f6d1e0557fe5', '2020-12-04 21:41:56', '2020-12-04 21:41:56', 1, 7, '2020-12-04 21:46:56', 8),
(9, '38026eb6-008c-4917-aa6b-638fef342523', '2020-12-04 21:56:47', '2020-12-04 21:56:47', 1, 7, '2020-12-04 22:01:47', 9),
(10, '0f59d191-c751-4c36-8012-48730e5a6416', '2020-12-06 22:22:18', '2020-12-06 22:22:18', 1, 26, '2020-12-06 22:27:18', 11),
(11, 'a12b8be7-5b34-4d21-9b77-fb8dd2d3d993', '2020-12-07 10:11:49', '2020-12-07 10:11:49', 1, 7, '2020-12-07 10:16:49', 21),
(12, '2dee6bd5-7a22-41ee-8289-7750b624219f', '2020-12-07 10:21:39', '2020-12-07 10:21:39', 1, 7, '2020-12-07 10:26:39', 22),
(13, '1c4acc5a-9918-4b48-bdd6-5ef535e5d4fd', '2020-12-07 15:25:09', '2020-12-07 15:25:09', 1, 7, '2020-12-07 15:30:09', 23),
(14, 'fe542c46-538c-4663-97ca-0136c8b693ff', '2020-12-08 23:10:25', '2020-12-08 23:10:25', 1, 26, '2020-12-08 23:15:25', 24),
(15, '4840084f-b38b-481d-993a-fa08eb8972c5', '2020-12-18 23:59:08', '2020-12-18 23:59:08', 1, 7, '2020-12-19 00:04:08', 51),
(16, 'd96f85dc-896e-4632-9536-4369734503d8', '2020-12-19 00:00:56', '2020-12-19 00:00:56', 1, 7, '2020-12-19 00:09:07', 52),
(17, '8958bed2-2847-4abb-b9ba-cd8801fd47f6', '2020-12-19 00:01:24', '2020-12-19 00:01:24', 1, 7, '2020-12-19 00:14:07', 53),
(18, 'b03281f5-495f-4315-8e01-2c986270dc3f', '2020-12-19 16:19:52', '2020-12-19 16:19:52', 1, 7, '2020-12-19 16:24:52', 54),
(19, 'eed38e22-8307-4da9-b0ee-0ac26dd20e3d', '2020-12-19 17:44:45', '2020-12-19 17:44:45', 1, 7, '2020-12-19 17:49:45', 55);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile_visitors`
--

CREATE TABLE `profile_visitors` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `profile_visitors`
--

INSERT INTO `profile_visitors` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `to_users__id`, `by_users__id`) VALUES
(6, 'a4471d96-4ced-4b28-9155-d82a40f28306', '2020-11-27 17:14:23', '2020-11-27 17:14:23', 1, 4, 7),
(11, '191c08ff-98ee-46a6-88f2-3dbcd059dfda', '2020-12-01 10:45:45', '2020-12-01 10:45:45', 1, 21, 7),
(12, 'f17d8beb-6c85-4639-b83b-1f4ed5895c34', '2020-12-01 10:54:34', '2020-12-01 10:54:34', 1, 7, 21),
(18, 'b3c7b0ef-ab57-4dd1-9adf-6ac8714d5329', '2020-12-04 22:44:28', '2020-12-04 22:44:28', 1, 7, 26),
(19, '93240c9b-edd5-412c-b1be-d84d79c51baa', '2020-12-04 22:47:23', '2020-12-04 22:47:23', 1, 26, 7),
(25, '2a9cc1b1-5efe-4fa1-a713-97d767b28e30', '2020-12-05 08:40:00', '2020-12-05 08:40:00', 1, 26, 21),
(29, 'a223ed42-e7fa-4661-9952-e3ddd501dcea', '2020-12-06 23:36:07', '2020-12-06 23:36:07', 1, 21, 26),
(36, 'f4d2be1a-c1e0-4da0-800a-6549408ce56b', '2020-12-11 00:57:07', '2020-12-11 00:57:07', 1, 41, 7),
(37, 'aa1db18a-2f46-485a-b435-b9ec0d2ec7f9', '2020-12-15 21:25:23', '2020-12-15 21:25:23', 1, 4, 42),
(38, '5bc5d6d0-0966-48fb-bb54-1f6c46bb34f3', '2020-12-15 21:25:35', '2020-12-15 21:25:35', 1, 26, 42),
(39, '80bbf3b2-a9bc-4d82-8f14-1c5ae67591d2', '2020-12-15 21:32:15', '2020-12-15 21:32:15', 1, 21, 42),
(40, '061f7ea6-2d5e-4252-8b93-9878a68e9e69', '2020-12-15 21:32:43', '2020-12-15 21:32:43', 1, 42, 7),
(41, 'de1b5b29-23dd-4b9d-a5e3-663dc74c8123', '2020-12-15 21:38:15', '2020-12-15 21:38:15', 1, 7, 42),
(42, '78d0b381-0952-4e3e-b4cf-d7db58702f85', '2020-12-15 21:42:58', '2020-12-15 21:42:58', 1, 43, 42),
(44, '9ba98caa-4e99-4e82-9b7a-7a2ba8bbc6f9', '2020-12-15 22:33:11', '2020-12-15 22:33:11', 1, 42, 26),
(45, 'e096d245-0f6d-4124-96c6-3c95d0d60358', '2020-12-15 23:04:34', '2020-12-15 23:04:34', 1, 43, 7),
(46, 'eb498797-02b3-4844-9c76-a6a747cd2d87', '2020-12-18 15:53:45', '2020-12-18 15:53:45', 1, 45, 7),
(47, 'b26a7934-facd-42e0-b3fc-a9d0867b7376', '2020-12-18 16:02:33', '2020-12-18 16:02:33', 1, 46, 7),
(48, '97257c2e-ec25-42dc-8568-18cbc81586e2', '2020-12-18 23:10:16', '2020-12-18 23:10:16', 1, 44, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL,
  `registered_via` varchar(15) DEFAULT NULL,
  `block_reason` varchar(255) DEFAULT NULL,
  `is_fake` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`_id`, `_uid`, `created_at`, `updated_at`, `username`, `email`, `password`, `status`, `remember_token`, `first_name`, `last_name`, `designation`, `mobile_number`, `timezone`, `registered_via`, `block_reason`, `is_fake`) VALUES
(1, '50ee1967-7341-4c3a-b071-f2ea0722b179', '2020-11-03 02:56:11', '2020-11-03 02:56:11', 'admin', 'firstadmin@domain.com', '$2y$10$0MFZ3GWf7JSlfFjpPQ0gke7Sq9lZ/s3yhKwCjY7z00mRAjwDnE4um', 1, 'O4G7hgyto34OhcWQUYM9ULx3kSEMNTrFIsflasaiq0AgfeBWVBxGeK9Kwp', 'loveria', 'Admin', 'Admin', '9999999999', NULL, NULL, NULL, NULL),
(4, '087d4f3a-4d25-4d29-80b6-8963473d866e', '2020-09-30 14:38:39', '2020-09-30 14:38:39', 'japan26081998', 'japan26081998@gmail.com', '$2y$10$AfN6ipKIXwzyq3w2yQ0rJuEMloCgeO0G6fJNLwIMpuQ7llfjaeIle', 1, 'e799936a-3113-4b56-9224-8e91445e56b4', 'japan26081998', 'japan26081998', NULL, '0955555555', NULL, NULL, NULL, NULL),
(7, 'aab0338e-3254-4632-b70e-1baee15b6c05', '2020-11-25 03:35:26', '2020-11-25 03:35:26', 'embebibo5', 'embebiboofficial.5@gmail.com', '$2y$10$O11qYxUBNEmsw7oAmKCgOO.8oTHYU.zO9wVMr8UqY2p6kXr9z6ecK', 1, '9zs2H16ARd82lDgnPr974lVrjfRsh8syJrTLoE8JyFBXFjL5yd7XlYYCXoKM', 'embebibo', 'embebibo', NULL, '0966666666', NULL, NULL, NULL, NULL),
(21, 'fecf5274-a44e-41a3-957a-45cc239cb510', '2020-11-30 09:18:52', '2020-11-30 09:18:52', 'long-nhat', 'nhatnv62@wru.vn', 'NO_PASSWORD', 1, NULL, 'Long', 'Nhật', 'User', NULL, NULL, 'facebook', NULL, NULL),
(26, 'c055750c-88dd-434e-92f9-b6ba7b36b1e7', '2020-12-04 22:37:07', '2020-12-06 21:50:08', 'embebibo2', 'embebiboofficial@gmail.com', '$2y$10$nQlISY6RVa3BpD/uyIm9jO.V9axKOuwJkcS2Ym98jDpRxFD3Nh8Nm', 1, 'DLlKCsRUX3WphnVE9ARZvWwKnC43oxVwmtYb70ItN67YhJTohtUOi56WUFMw', 'embebibo2', 'embebibo2', NULL, '0965598789', NULL, NULL, NULL, NULL),
(32, '41c9cacf-6fdc-4b61-94b5-ddfb85ff52a1', '2020-12-05 15:54:25', '2020-12-05 15:54:25', 'longnhatdz98', 'longnhatdz98@gmail.com', '$2y$10$bANrd3mbmuewSkPaNL98GeMGs43FyotsXOuaw94W10TIkM99cV9rK', 4, 'e9ce161f-c95e-4424-99d2-6a6b7d9c05f0', 'longnhatdz98', 'longnhatdz98', NULL, '03333333', NULL, NULL, NULL, NULL),
(38, 'd5add73b-2c94-43f6-a172-cc0f9073bc12', '2020-12-11 00:56:21', '2020-12-11 00:56:21', 'virgil.cartwright', 'melvina.conn@example.com', '$2y$10$.v4YGVLm1qG18jzr2qNR8eHei4b7KCK2jXfmp6/GmJvG6WrFKmILq', 1, NULL, 'Brando', 'Herzog', NULL, '+3763608510394', 'Australia/Adelaide', NULL, NULL, 1),
(39, '4dfb5713-905e-46d3-a93c-313ace28b417', '2020-12-11 00:56:24', '2020-12-11 00:56:24', 'waelchi.jamey', 'austen75@example.org', '$2y$10$HfS8SnHZWuBsXWdyoWHdm.cBgpXNkCqPSVI5SCCvpCJQArlrEWBEu', 1, NULL, 'Yvette', 'Treutel', NULL, '+1380816225083', 'Africa/Libreville', NULL, NULL, 1),
(40, 'fd6b52df-0973-4e9b-9b8a-6bd2e902dfa2', '2020-12-11 00:56:26', '2020-12-11 00:56:26', 'carmela58', 'hane.devante@example.com', '$2y$10$IcwjU9YRdPXLyPEIMTWWoOZ4Mo2Gw2lSRzX1WniAv8mhR2D9KLJg.', 1, NULL, 'Madonna', 'Romaguera', NULL, '+8387376372364', 'America/Lima', NULL, NULL, 1),
(41, 'febc2b63-9372-454f-baf6-373d16b48b61', '2020-12-11 00:56:29', '2020-12-11 00:56:29', 'fschaden', 'kenya.streich@example.org', '$2y$10$HycsLWW4mybj.n.GKpV1Ou.N52ChL3qtvroy3sXGa29C8MjP0XTj.', 1, NULL, 'Marta', 'Sanford', NULL, '+3782606769951', 'Europe/Riga', NULL, NULL, 1),
(42, '783376d6-1355-404f-b867-ef0a6bc0aeb9', '2020-12-15 21:17:06', '2020-12-15 21:20:24', 'embebiboxx', 'embebiboofficialxx@gmail.com', '$2y$10$WLNfIUlNt6EDslIKjCCefe.8i4r70fFO1CG6xqUsd4Ijt1WP4WZrm', 1, 'TZVdbPVWVLkMtRqW8qeOBRwCZ6ISkXFMnEQ9470XiTKx3Ho9CvmI5RhikJgn', 'embebiboxx', 'embebiboxx', NULL, '0323232323', NULL, NULL, NULL, NULL),
(43, 'd6be54a3-7bc5-4988-ae0e-ebadd0c5b1bd', '2020-12-15 21:42:38', '2020-12-15 21:42:38', 'lonie.quitzon', 'cicero.feil@example.org', '$2y$10$DnDqZChgrZZqlUqo/Ty4UeGTGxFFIWDCvlf4cKeUeFdYTWcwS8xVm', 1, NULL, 'Kevon', 'Schiller', NULL, '+6559269683745', 'Australia/Sydney', NULL, NULL, 1),
(44, 'dae2bf8d-6c97-4f1f-b383-deb7530c4fd2', '2020-12-15 21:42:41', '2020-12-15 21:42:41', 'iboehm', 'linnea67@example.org', '$2y$10$DfSIN2GacSKKgb93AmM7Y.28HL/hTWyOhJdh4SWNV6.H4VcuBcPZS', 1, NULL, 'Darion', 'Upton', NULL, '+4690414716198', 'Asia/Famagusta', NULL, NULL, 1),
(45, '798ce262-15e1-48a5-a193-04c1fe6c78ef', '2020-12-17 17:57:38', '2020-12-17 17:57:38', 'sullrich', 'lueilwitz.art@example.org', '$2y$10$7LNm97avnnwJM/zP4Hyksu5hGz/JYjd2Uczfsuz7cf.fJ3S2OyuQ6', 1, NULL, 'Isac', 'Hessel', NULL, '+7289163896917', 'Europe/Vatican', NULL, NULL, 1),
(46, '18fc0f58-411b-4bfe-901b-b04aa2572db7', '2020-12-17 17:57:42', '2020-12-17 17:57:42', 'cleora.williamson', 'mberge@example.org', '$2y$10$cMt9vyI94sGdCJ1lgPnmZOhmopLeb0Cuj5B/GiMJAR9JOQy37GvH2', 1, NULL, 'Holly', 'Rice', NULL, '+4894080886170', 'Indian/Mayotte', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_authorities`
--

CREATE TABLE `user_authorities` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `user_roles__id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_authorities`
--

INSERT INTO `user_authorities` (`_id`, `_uid`, `status`, `created_at`, `updated_at`, `users__id`, `user_roles__id`) VALUES
(1, '307303c0-6dae-4066-a613-b26a8146df59', 1, '2020-11-03 02:56:11', '2020-11-03 02:56:11', 1, 1),
(4, '35c2ba83-2cee-4609-8d17-9dcdb2210477', 1, '2020-11-04 14:38:39', '2020-12-05 01:31:19', 4, 2),
(7, '5c964f86-a835-44bb-83d0-a8ddb602099e', 1, '2020-11-25 03:35:26', '2020-12-21 12:49:50', 7, 1),
(21, 'ba9f8291-72be-452d-af9c-fa2f4091e68c', 1, '2020-11-30 09:18:52', '2020-12-19 01:11:18', 21, 2),
(26, '2adbf70a-eab3-4ae6-9d57-8d825b5760a3', 1, '2020-12-04 22:37:07', '2020-12-19 15:01:28', 26, 2),
(32, 'b586f5c4-1f61-4a4e-9c41-80704091eeab', 1, '2020-12-05 15:54:25', '2020-12-05 15:54:25', 32, 2),
(38, '8ac60028-b2a0-4000-96e7-b7af97eb846b', 1, '2020-12-11 00:56:22', '2020-12-11 00:56:22', 38, 2),
(39, 'a4403607-acb0-4625-a747-3aada8e6bb67', 1, '2020-12-11 00:56:24', '2020-12-11 00:56:24', 39, 2),
(40, '84fd90c8-b36d-451c-9e37-c4af59a861dc', 1, '2020-12-11 00:56:27', '2020-12-11 00:56:27', 40, 2),
(41, 'a64a25b9-9dbf-4ac0-b24a-aab0438c1894', 1, '2020-12-11 00:56:29', '2020-12-11 00:56:29', 41, 2),
(42, 'f6f698e2-165f-47af-a428-d4710dc8ed71', 1, '2020-12-15 21:17:06', '2020-12-15 22:10:25', 42, 2),
(43, 'bedd51d4-d398-4792-8481-17b8efa8e7af', 1, '2020-12-15 21:42:38', '2020-12-15 21:42:38', 43, 2),
(44, '5dba191e-625e-4bbd-b4db-dfa32811d451', 1, '2020-12-15 21:42:41', '2020-12-15 21:42:41', 44, 2),
(45, 'e1af78c5-3232-4164-869d-1a02fb4a1a66', 1, '2020-12-17 17:57:39', '2020-12-17 17:57:39', 45, 2),
(46, '418837a2-452e-4407-9b59-9d82cfee13aa', 1, '2020-12-17 17:57:43', '2020-12-17 17:57:43', 46, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_block_users`
--

CREATE TABLE `user_block_users` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_block_users`
--

INSERT INTO `user_block_users` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `to_users__id`, `by_users__id`) VALUES
(9, 'e97b1131-9a2d-48a5-8b1e-efd87cda29e8', '2020-12-15 23:04:42', '2020-12-15 23:04:42', 1, 43, 7),
(10, '7e0d394f-90c1-42a3-9008-4af29bdf387d', '2020-12-16 04:01:20', '2020-12-16 04:01:20', 1, 4, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_encounters`
--

CREATE TABLE `user_encounters` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_encounters`
--

INSERT INTO `user_encounters` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `by_users__id`, `to_users__id`) VALUES
(1, '995895db-cecf-4bd8-8f35-52c63db13bfd', '2020-11-27 16:57:22', '2020-11-27 16:57:22', 1, 7, 4),
(14, '7be44175-acc2-4f22-8611-f4645f8121dc', '2020-12-04 21:40:34', '2020-12-04 21:40:34', 1, 7, 4),
(15, '34d76c55-fd87-47ec-8d15-dccdaf03bbbd', '2020-12-04 21:56:58', '2020-12-04 21:56:58', 1, 7, 7),
(16, '973295a4-70a1-4953-aa07-185be5a178b9', '2020-12-04 21:57:08', '2020-12-04 21:57:08', 1, 7, 7),
(17, '484b3466-0b78-479e-a733-66727036283b', '2020-12-04 21:57:20', '2020-12-04 21:57:20', 1, 7, 7),
(18, 'cac8c7ce-b2af-4e9b-83bf-a6c4f3df9998', '2020-12-04 22:40:25', '2020-12-04 22:40:25', 1, 26, 4),
(24, '62f06fa2-da87-4b32-a2cd-cdabfa4d261b', '2020-12-04 23:29:01', '2020-12-04 23:29:01', 1, 7, 26),
(26, '9ecd47ce-231b-4d6f-adb6-5d624729a684', '2020-12-04 23:29:53', '2020-12-04 23:29:53', 1, 21, 26),
(37, '7a0f1a39-ed17-4dbd-8366-38365335d84c', '2020-12-07 10:09:11', '2020-12-07 10:09:11', 1, 7, 4),
(41, '7d1a531b-9955-4559-8cef-69609ab5e913', '2020-12-07 10:09:41', '2020-12-07 10:09:41', 1, 7, 26),
(49, '50978580-d032-4eaf-91a8-12cf03152fff', '2020-12-07 10:12:22', '2020-12-07 10:12:22', 1, 7, 7),
(50, '9b9c2be7-9fb7-4dac-b805-3682003dc30b', '2020-12-07 10:12:27', '2020-12-07 10:12:27', 1, 7, 7),
(53, 'c63f04a6-1336-4ecd-bb86-10556607f7ae', '2020-12-07 10:23:10', '2020-12-07 10:23:10', 1, 21, 7),
(54, '67155e13-70b9-485b-912d-f454edd1b054', '2020-12-07 15:25:19', '2020-12-07 15:25:19', 1, 7, 7),
(62, '1f3d4d4b-6cfc-4b00-b572-4bebe9472edf', '2020-12-08 23:08:11', '2020-12-08 23:08:11', 1, 26, 4),
(70, 'e3a887dd-def8-4c4d-bcc3-97767b3f8448', '2020-12-08 23:09:58', '2020-12-08 23:09:58', 1, 26, 21),
(73, 'eb0c4c0d-6177-4a71-a627-bbfb820bbd11', '2020-12-08 23:10:33', '2020-12-08 23:10:33', 1, 26, 26),
(74, '6d4d9926-a45a-4da9-922f-9b3f19142738', '2020-12-08 23:10:43', '2020-12-08 23:10:43', 1, 26, 26),
(75, '6ebdec1d-6740-4047-a431-0bb61885ea44', '2020-12-08 23:10:48', '2020-12-08 23:10:48', 1, 26, 26),
(87, '157facc9-4268-4fe7-9714-7de6b74716b7', '2020-12-15 23:04:22', '2020-12-15 23:04:22', 1, 7, 26),
(88, '3ed491df-d085-4fd1-b387-29767cca1165', '2020-12-16 04:00:50', '2020-12-16 04:00:50', 1, 7, 40),
(89, '10bc1eb0-95a2-427f-8c80-14ca9cee26a9', '2020-12-16 04:01:02', '2020-12-16 04:01:02', 1, 7, 38),
(90, 'f2d25f15-ef7a-47b8-921b-5e8df84e553e', '2020-12-18 16:02:28', '2020-12-18 16:02:28', 1, 7, 26),
(91, 'ffffa7de-c10d-4a20-b6ac-46a6aa1cbd7b', '2020-12-19 00:41:52', '2020-12-19 00:41:52', 1, 21, 44),
(92, '9648c9c2-9383-46e0-be2b-0a3b2c0f1536', '2020-12-19 00:42:10', '2020-12-19 00:42:10', 1, 7, 41),
(93, 'e614cc7c-7f93-47fe-881d-4d387d24db64', '2020-12-19 14:59:13', '2020-12-19 14:59:13', 1, 7, 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_gifts`
--

CREATE TABLE `user_gifts` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `from_users__id` int(10) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `items__id` int(10) UNSIGNED NOT NULL,
  `price` decimal(13,4) DEFAULT NULL,
  `credit_wallet_transactions__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_gifts`
--

INSERT INTO `user_gifts` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `from_users__id`, `to_users__id`, `items__id`, `price`, `credit_wallet_transactions__id`) VALUES
(2, '7e0ac147-580b-423f-af69-233407293894', '2020-12-18 23:18:20', '2020-12-18 23:18:20', 0, 7, 44, 3, '1000.0000', 50);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_items`
--

CREATE TABLE `user_items` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `items__id` int(10) UNSIGNED NOT NULL,
  `price` decimal(13,4) DEFAULT NULL,
  `credit_wallet_transactions__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_items`
--

INSERT INTO `user_items` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `users__id`, `items__id`, `price`, `credit_wallet_transactions__id`) VALUES
(1, '7720ea91-0531-43d8-9265-cfac0af4138a', '2020-12-07 00:49:43', '2020-12-07 00:49:43', 1, 26, 1, '5.0000', 14),
(2, 'da73d2fe-4ef1-465c-8310-8f37dd499fcc', '2020-12-18 22:51:41', '2020-12-18 22:51:41', 1, 7, 8, '230.0000', 48);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_photos`
--

CREATE TABLE `user_photos` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_photos`
--

INSERT INTO `user_photos` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `users__id`, `file`) VALUES
(4, '40602406-06ac-4213-bee2-0191acfdd869', '2020-11-27 09:08:55', '2020-11-27 09:08:55', 1, 7, '1m52.jpg'),
(5, '398a5bf6-f913-48a0-85f6-528c361bff72', '2020-12-01 13:31:10', '2020-12-01 13:31:10', 1, 21, 'cmsn3.jpg'),
(21, '8bf245fc-d6fa-45e7-b0ab-0eb2050eb735', '2020-12-15 21:23:03', '2020-12-15 21:23:03', 1, 42, 'cmsn1.jpg'),
(22, '2de67c9b-c7e1-42e5-83af-4887b4739e08', '2020-12-15 21:24:24', '2020-12-15 21:24:24', 1, 42, '1m52.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_profiles`
--

CREATE TABLE `user_profiles` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `__data` text DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `countries__id` smallint(5) UNSIGNED DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `about_me` varchar(500) DEFAULT NULL,
  `location_latitude` decimal(11,8) DEFAULT NULL,
  `location_longitude` decimal(11,8) DEFAULT NULL,
  `preferred_language` varchar(15) DEFAULT NULL,
  `relationship_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `work_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `education` tinyint(4) DEFAULT NULL,
  `cover_picture` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(3) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_profiles`
--

INSERT INTO `user_profiles` (`_id`, `_uid`, `created_at`, `updated_at`, `__data`, `users__id`, `countries__id`, `profile_picture`, `gender`, `dob`, `city`, `about_me`, `location_latitude`, `location_longitude`, `preferred_language`, `relationship_status`, `work_status`, `education`, `cover_picture`, `is_verified`, `status`) VALUES
(6, '9c9bdb81-3ebc-4431-9aed-f0f662d748e8', '2020-11-25 03:35:26', '2020-12-19 17:43:34', NULL, 7, 232, '000.jpg', 1, '2000-12-12', '', NULL, '21.03767510', '105.77408180', '2', 1, 2, NULL, '1m52.jpg', NULL, 2),
(20, '5f7843c5-37a7-4599-9ef1-3c2149d0e110', '2020-11-30 09:18:54', '2020-12-01 13:43:53', NULL, 21, 232, 'trai-dep.png', 1, '1998-02-02', NULL, NULL, '20.99598190', '105.80972440', NULL, NULL, NULL, NULL, 'tai-xuong.jpg', NULL, 2),
(25, '7c0f60f3-266e-4b92-94c6-f0f4b64d2fe7', '2020-12-04 22:37:07', '2020-12-19 15:01:27', NULL, 26, 232, 'love-4.jpg', 1, '2000-12-12', 'Hà Nội', NULL, '21.02776440', '105.83415980', '2', 1, 1, 1, 'love-4.jpg', NULL, 2),
(29, '3febcce5-02e4-4310-ba23-bec6412f8c6f', '2020-12-05 01:31:19', '2020-12-05 01:31:19', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(32, 'd5807d1e-8262-4c22-a704-3a509f80c723', '2020-12-05 15:54:25', '2020-12-05 15:54:25', NULL, 32, NULL, NULL, 1, '2000-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(38, '53e5762c-ae2a-4528-808b-31e9660682c6', '2020-12-11 00:56:22', '2020-12-11 00:56:22', NULL, 38, 232, 'https://picsum.photos/id/82/360/360.jpg', 1, '0000-00-00', 'Andersonborough', 'Quia quos esse rerum illo alias id. Facilis repellendus non saepe eos accusantium. Esse quis rerum officiis ex. Ut doloribus pariatur doloribus consequatur quas.', '-88.36777200', '-115.92754500', '1', 2, 5, 3, 'https://picsum.photos/id/1/820/360.jpg', 1, 0),
(39, 'b88dc812-0273-4c71-b081-ee754570788d', '2020-12-11 00:56:24', '2020-12-11 00:56:24', NULL, 39, 232, 'https://picsum.photos/id/56/360/360.jpg', 2, '0000-00-00', 'Vellachester', 'Officiis architecto corporis fuga corporis et. Ex et officiis debitis consequatur quibusdam possimus. Hic vel quae at voluptatem minima repellat et.', '86.07777700', '-163.14084900', '1', 2, 1, 5, 'https://picsum.photos/id/26/820/360.jpg', 1, 0),
(40, 'ffe1908a-149a-4538-ad6b-cabae21a33e7', '2020-12-11 00:56:27', '2020-12-11 00:56:27', NULL, 40, 232, 'https://picsum.photos/id/97/360/360.jpg', 1, '0000-00-00', 'Shanamouth', 'Ipsam non non aliquam in molestiae. Ea eligendi et et eligendi labore sed aut. Sunt voluptate voluptas sint ab repellat. Assumenda et quis dolore in fugiat corporis beatae. Impedit modi optio quia eum consectetur voluptatem.', '11.33601100', '175.53759300', '1', 1, 5, 2, 'https://picsum.photos/id/75/820/360.jpg', 1, 0),
(41, '4bcd1ed1-7faa-4f75-b650-6e22e5cd35fb', '2020-12-11 00:56:29', '2020-12-11 00:56:29', NULL, 41, 232, 'https://picsum.photos/id/8/360/360.jpg', 1, '0000-00-00', 'Eichmannshire', 'Vero facilis et ratione doloribus libero hic. Molestias odit et aperiam qui sint. Natus distinctio ea voluptas incidunt animi asperiores. Enim consequatur qui aut error facere. In fugiat aut itaque amet veritatis. Soluta impedit enim ea et nulla facilis. Ut veniam et eos quia voluptas officia autem. Fuga aut impedit omnis ut iure. Nihil corrupti cumque recusandae rerum ipsum. Nesciunt unde sequi impedit vel sed deleniti. Eligendi rem et ad deserunt.', '82.69531900', '-78.51441200', '1', 3, 3, 5, 'https://picsum.photos/id/47/820/360.jpg', 1, 0),
(42, '908ef5b5-d487-4b39-bde0-16a4064eb4cc', '2020-12-15 21:17:06', '2020-12-15 21:22:39', NULL, 42, 232, '011111-copy-copy-copy.jpg', 1, '2000-12-12', 'Hà Nội', 'không có gì cả', '21.02776440', '105.83415980', NULL, 1, 1, NULL, 'cmsn4.jpg', NULL, 2),
(43, '05073d7c-d91a-4bcd-8041-81ce03a573db', '2020-12-15 21:42:38', '2020-12-15 21:42:38', NULL, 43, 17, 'https://picsum.photos/id/25/360/360.jpg', 2, '0000-00-00', 'Funkstad', 'Enim beatae nobis maxime porro assumenda. Sed voluptates rerum officia blanditiis ut perspiciatis et. Nihil saepe dolores in explicabo consequatur. Nostrum voluptatum voluptatem eum quia ipsum fugit dolores. Velit ducimus eos temporibus iste aliquam error. Ut laborum dolorem tempora velit aliquam nemo animi ut. Rerum dolores laborum asperiores sed nobis ut hic non. Et eum ea voluptatibus illum velit. Aperiam nobis quod possimus.', '-16.39567900', '77.80633700', '5', 2, 5, 6, 'https://picsum.photos/id/5/820/360.jpg', 1, 0),
(44, '0c55ad1e-6dce-4d67-8b5a-f9344a1e3ee4', '2020-12-15 21:42:41', '2020-12-15 21:42:41', NULL, 44, 138, 'https://picsum.photos/id/31/360/360.jpg', 3, '0000-00-00', 'Cummeratamouth', 'Id dolor dignissimos id reiciendis.', '12.97616500', '-175.25979300', '3', 2, 4, 4, 'https://picsum.photos/id/90/820/360.jpg', 1, 0),
(45, 'adeb6e4b-04bc-48b1-85da-f5d371354476', '2020-12-17 17:57:39', '2020-12-17 17:57:39', NULL, 45, 232, 'https://picsum.photos/id/47/360/360.jpg', 2, '0000-00-00', 'Okeymouth', 'Qui accusantium sit enim facere. Consequatur ad distinctio reprehenderit est et blanditiis est. Nobis omnis aspernatur non ab.', '9.08136400', '45.55557300', '7', 1, 2, 6, 'https://picsum.photos/id/65/820/360.jpg', 0, 0),
(46, 'c13556cc-8fb4-486a-b122-d8f3659e7237', '2020-12-17 17:57:43', '2020-12-17 17:57:43', NULL, 46, 232, 'https://picsum.photos/id/35/360/360.jpg', 2, '0000-00-00', 'Dibbertview', 'Perspiciatis officiis iure error placeat. Voluptas sunt saepe sit reprehenderit sapiente quis quisquam. Dolor non animi voluptas quia voluptates modi. Nihil sed in modi. Nulla reprehenderit dolorem facilis consectetur. Similique consequatur possimus et est provident rerum qui explicabo. Placeat assumenda doloremque consequatur ipsum repellendus voluptatem.', '50.23129400', '47.31348700', '8', 2, 1, 2, 'https://picsum.photos/id/60/820/360.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `_id` tinyint(3) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_roles`
--

INSERT INTO `user_roles` (`_id`, `_uid`, `status`, `created_at`, `updated_at`, `title`) VALUES
(1, '15f21c9f-88bb-4fec-bad4-03eb9d9065f8', 1, '2020-11-03 02:56:11', '2020-11-03 02:56:11', 'Admin'),
(2, '287133c4-2afc-4f65-ab3c-28b0df8a099a', 1, '2020-11-03 02:56:11', '2020-11-03 02:56:11', 'Member');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_settings`
--

CREATE TABLE `user_settings` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `key_name` varchar(45) NOT NULL,
  `value` text DEFAULT NULL,
  `data_type` tinyint(4) DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_settings`
--

INSERT INTO `user_settings` (`_id`, `created_at`, `updated_at`, `key_name`, `value`, `data_type`, `users__id`) VALUES
(9, '2020-11-26 16:19:42', '2020-11-26 16:19:42', 'max_age', '22', 3, 7),
(12, '2020-12-06 17:05:56', '2020-12-06 17:05:56', 'distance', '100', 3, 7),
(15, '2020-12-07 01:01:34', '2020-12-07 01:01:34', 'distance', '10', 3, 26),
(16, '2020-12-15 21:41:17', '2020-12-15 21:41:17', 'distance', '100', 3, 42);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_specifications`
--

CREATE TABLE `user_specifications` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `specification_key` varchar(15) NOT NULL,
  `specification_value` varchar(150) DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_specifications`
--

INSERT INTO `user_specifications` (`_id`, `_uid`, `created_at`, `updated_at`, `type`, `status`, `specification_key`, `specification_value`, `users__id`) VALUES
(225, 'e8cb4dba-1d09-426c-a2eb-44d620a8368e', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'ethnicity', 'dao', 38),
(226, '96b250f6-ca64-4ca6-ac66-4d791da915f8', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'body_type', 'average', 38),
(227, '8a58bd1e-e1cb-45a0-9b9a-a480a5690e85', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'height', '144', 38),
(228, '955fefd6-2992-4bca-b799-ac8fab0df3d9', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'hair_color', 'blue', 38),
(229, '93a208fb-d314-43a3-9fcb-1538e1b0354a', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'nature', 'adventurous', 38),
(230, 'e372c01f-fee9-4ad7-a957-2ee59e9c2743', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'friends', 'some_friends', 38),
(231, '1d76d2db-a902-4292-9bad-e780229c6375', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'children', 'expecting', 38),
(232, 'b7bf8119-d654-451a-9c09-01a7d9cf449e', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'pets', 'none', 38),
(233, '34fba59b-0165-4a98-a530-14ca9164590a', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'religion', 'hindu', 38),
(234, '56a2805b-c9f5-40a6-a0d2-dacdfb09e468', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'i_live_with', 'friends', 38),
(235, 'e7da8d2c-19f4-41e3-be19-1c46fa356249', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'car', 'my_own_car', 38),
(236, '9e233f60-93d3-4866-814d-1ac7351a2d06', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'travel', 'not_very_much', 38),
(237, 'e403b345-2ae1-4f1b-9682-0a59f754f73b', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'smoke', 'never', 38),
(238, 'ca76dea2-ab06-43e0-96d2-eb87a0230831', '2020-12-11 00:55:22', '2020-12-11 00:55:22', 1, 1, 'drink', 'i_drink_sometimes', 38),
(239, 'af10e16e-953c-447f-99ca-a6318902646f', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'ethnicity', 'muong', 39),
(240, 'b2d8a7be-ba07-4df2-8e30-15d11d297910', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'body_type', 'other', 39),
(241, 'de3c66ab-da8c-446b-a62a-229e210e3f98', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'height', '156', 39),
(242, 'e3ccc45e-f46c-44f8-9059-2c3cc562c14a', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'hair_color', 'yellow', 39),
(243, 'ab9462bb-90f3-4f21-872f-b99f3a3b7c6c', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'nature', 'careful', 39),
(244, '2c8a3afd-d32a-4c21-b726-f8b54a535662', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'friends', 'many_friends', 39),
(245, '23ce43d8-db1e-4cf6-b6be-4d55c538cb34', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'children', 'someday_maybe', 39),
(246, '7b74952d-49a1-4969-86f5-3e97cdae5b84', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'pets', 'none', 39),
(247, 'de4a421f-dc41-4909-8537-0c192dc6e33e', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'religion', 'agnostic', 39),
(248, '3f8efec8-b67f-42f7-975c-1602261d809e', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'i_live_with', 'alone', 39),
(249, 'e7e72ac1-4369-444f-be3e-f505d24ee50c', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'car', 'my_own_car', 39),
(250, 'cf935181-615e-42e0-aca1-22c434e22cac', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'travel', 'yes_all_the_time', 39),
(251, '47538d51-17c1-4bcd-8b1e-e3b93cc0aeba', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'smoke', 'i_some_sometimes', 39),
(252, '09230c14-a613-4ce5-a419-06e915ed8b94', '2020-12-11 00:55:24', '2020-12-11 00:55:24', 1, 1, 'drink', 'i_drink_sometimes', 39),
(253, '04094828-d45e-4d81-bb08-d7c2ba2e06e2', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'ethnicity', 'kinh', 40),
(254, 'a31d157f-e971-4383-81ab-fb3a649db209', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'body_type', 'sporty', 40),
(255, '145be9ba-1f80-4db3-a4f2-e599b37e4e54', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'height', '141', 40),
(256, '97ec3e3e-3186-4e41-a130-ef7580684483', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'hair_color', 'blue', 40),
(257, 'cfc2a336-3474-4c96-9e56-9afb905c88e1', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'nature', 'extroverted', 40),
(258, '273ee489-bbf8-41af-907c-f67231b5ac75', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'friends', 'only_good_friends', 40),
(259, '8c056087-d136-4f1b-a114-a7bd49a0ebb7', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'children', 'someday_maybe', 40),
(260, '1c1aedfe-81dd-4e23-b110-155b135fe954', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'pets', 'none', 40),
(261, '30256982-0825-487c-98c7-5af59c9aa974', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'religion', 'muslim', 40),
(262, 'ecf6c873-96f5-4069-bbc3-7d25721e3db1', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'i_live_with', 'alone', 40),
(263, '910b6e91-8695-4d0b-9e8c-76caddc23369', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'car', 'none', 40),
(264, 'ff8f0cca-bbf4-4778-95d4-65f20b25b1a2', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'travel', 'yes_sometimes', 40),
(265, 'd5d65670-d263-4c91-9e2b-866470915bda', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'smoke', 'chain_smoker', 40),
(266, '0b4f63e8-cd62-45e0-a5d6-c3e38c16949b', '2020-12-11 00:55:27', '2020-12-11 00:55:27', 1, 1, 'drink', 'never', 40),
(267, 'b1534b64-31da-4d90-85e0-6b930a618494', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'ethnicity', 'hoa', 41),
(268, '78634592-9105-4c1e-a534-66991362f000', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'body_type', 'round', 41),
(269, '8b7133f0-ca29-487a-8571-6f13a2414c67', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'height', '173', 41),
(270, '5c48ff83-5208-4e8f-ac2c-bc54efc4d7cd', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'hair_color', 'purple', 41),
(271, '14ca9da8-6ecd-4e74-9096-92ffd924a9ad', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'nature', 'quiet', 41),
(272, '877c0545-6b2b-43c5-9310-369ade4db2b2', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'friends', 'some_friends', 41),
(273, 'ca132f1b-51d8-4385-b2a7-5e629684017c', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'children', 'i_already_have_kids', 41),
(274, '80c4bc2f-3941-4876-9b59-eb2cfa49aabb', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'pets', 'have_pets', 41),
(275, 'c5143bec-6976-41d6-919c-b106a112f0c7', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'religion', 'muslim', 41),
(276, '8933e672-63ea-403c-a15d-6e4082e7af21', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'i_live_with', 'partner', 41),
(277, 'eb071efc-de00-4009-8eaa-a1b0399d39ce', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'car', 'none', 41),
(278, 'c4492a62-19ed-434b-b269-6417774f914e', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'travel', 'not_very_much', 41),
(279, 'be843a46-3c51-4fbf-915d-48b533624842', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'smoke', 'chain_smoker', 41),
(280, '24ac4735-449e-45be-82c4-7704ac547fd0', '2020-12-11 00:55:29', '2020-12-11 00:55:29', 1, 1, 'drink', 'never', 41),
(281, 'b12260dd-ca62-4ae3-a1cf-8d2ec725ca5a', '2020-12-15 21:27:12', '2020-12-15 21:27:12', 1, 1, 'ethnicity', 'kinh', 42),
(282, 'a4c1ac09-93cc-48bc-81b2-d1e9aa057c02', '2020-12-15 21:27:19', '2020-12-15 21:27:19', 1, 1, 'height', '188', 42),
(283, '3e4e2ef7-65cd-4db0-a6ae-cc6127603659', '2020-12-15 21:27:25', '2020-12-15 21:27:25', 1, 1, 'hair_color', 'black', 42),
(284, '83f42805-eef9-4ba5-8cb5-0a1ad8753559', '2020-12-15 21:27:53', '2020-12-15 21:27:53', 1, 1, 'nature', 'affection', 42),
(285, '4942b6aa-e0fc-40d8-8518-d5991bb8e418', '2020-12-15 21:28:01', '2020-12-15 21:28:01', 1, 1, 'friends', 'many_friends', 42),
(286, 'cc447796-d28a-45aa-8bd1-f002f69cf905', '2020-12-15 21:28:06', '2020-12-15 21:28:06', 1, 1, 'pets', 'none', 42),
(287, '8779bef6-b6ce-446c-9676-e22b11fae2ba', '2020-12-15 21:28:08', '2020-12-15 21:28:08', 1, 1, 'children', 'i_already_have_kids', 42),
(288, '18acf543-2d10-4963-9481-2608095b5e16', '2020-12-15 21:28:14', '2020-12-15 21:28:14', 1, 1, 'religion', 'buddhist', 42),
(289, 'ed4f2a7a-7dbb-4259-bf64-aef3d603378c', '2020-12-15 21:28:18', '2020-12-15 21:28:18', 1, 1, 'i_live_with', 'alone', 42),
(290, '6d765c2b-2411-4ec2-8c38-745ea0dd958e', '2020-12-15 21:28:23', '2020-12-15 21:28:23', 1, 1, 'travel', 'not_very_much', 42),
(291, '72cc1346-f7b7-40fb-9adb-e8630058bd17', '2020-12-15 21:28:31', '2020-12-15 21:28:31', 1, 1, 'music_genre', 'sàn', 42),
(292, 'a5bcd507-5d42-446f-8b36-6eb260f2f9a7', '2020-12-15 21:28:37', '2020-12-15 21:28:37', 1, 1, 'singer', 'nhat', 42),
(293, 'd312f671-8312-4e86-b4a8-da23e9613cd8', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'ethnicity', 'muong', 43),
(294, 'ea591280-856e-46bc-98e9-1ac09e1fcdbb', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'body_type', 'curvy', 43),
(295, '1a7f74d2-6a7c-4fb7-865d-868ae8209d73', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'height', '174', 43),
(296, '1f268892-bbd4-4f94-8e56-ce55e0606800', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'hair_color', 'white', 43),
(297, '9ee4ac13-aa20-4c00-b776-c215c3247e5a', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'nature', 'lively', 43),
(298, 'c0777354-dda5-4471-b89f-c7b1b5f78385', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'friends', 'many_friends', 43),
(299, 'bbfca7bb-28cd-4da1-9d71-0b3cf77f5ad9', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'children', 'i_already_have_kids', 43),
(300, 'b6e94398-5d1a-48c6-a650-d2ab2e62faf1', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'pets', 'have_pets', 43),
(301, '60d92285-f704-43b8-a317-9bc661880192', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'religion', 'catholic', 43),
(302, 'ec7aea30-2ed2-40f6-880f-328dfbca1336', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'i_live_with', 'alone', 43),
(303, '5e67aa6f-f759-4b1c-b842-fc425c1e1ee8', '2020-12-15 21:41:38', '2020-12-15 21:41:38', 1, 1, 'travel', 'not_very_much', 43),
(304, 'be426de6-f49b-4354-bcd5-de1c0862b11f', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'ethnicity', 'khac', 44),
(305, 'ac2acab1-3c16-4f66-8c5c-55c8e95fac59', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'body_type', 'average', 44),
(306, '5ca836a7-972a-4973-b6f3-223601f00436', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'height', '175', 44),
(307, 'd7fb08c9-da63-4150-9e20-7d5377d25421', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'hair_color', 'red', 44),
(308, '476c8c3f-688f-480f-add4-73f74e706760', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'nature', 'affection', 44),
(309, '31fc8fcd-badc-44a4-afaf-47ba980484ce', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'friends', 'no_friends', 44),
(310, 'd6f1c858-f562-4929-818c-e14cf800f9c4', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'children', 'i_already_have_kids', 44),
(311, '36c5dc7e-67da-4d7c-ba3d-0ee8ac9bae54', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'pets', 'have_pets', 44),
(312, '3d314bbd-55b6-49c0-a654-b0a46499b6e3', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'religion', 'catholic', 44),
(313, 'd5c0682d-6c00-45d5-a582-b4bb4fba208f', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'i_live_with', 'friends', 44),
(314, '36bd234f-efa1-4df2-81b3-466939129ef4', '2020-12-15 21:41:41', '2020-12-15 21:41:41', 1, 1, 'travel', 'yes_sometimes', 44),
(315, '91b0574b-a5db-4dc9-a72f-f0a7ca62393e', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'ethnicity', 'nung', 45),
(316, '21c1eb4d-0752-4b9d-9a04-b9b68fb628dd', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'body_type', 'supermodel', 45),
(317, 'e4eb7f64-534f-49b3-b941-875aa21a988e', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'height', '155', 45),
(318, '8ac59635-5844-41a4-8c85-f4f34435fc98', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'hair_color', 'gray', 45),
(319, '9ff99fee-1e93-43da-a016-33883f2b498f', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'nature', 'friendly', 45),
(320, 'cccd7e0b-874f-4c68-bbf8-1fe4f564c422', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'friends', 'no_friends', 45),
(321, 'c7dcb314-07b8-4b25-92c7-f43071339395', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'children', 'no_never', 45),
(322, '62ed2173-0063-4ed9-8f4a-14925fb96be0', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'pets', 'none', 45),
(323, 'b698aaaa-1b80-4740-8db1-3d0526f8cf6b', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'religion', 'catholic', 45),
(324, '2b5985ed-cc8f-4e88-b59c-b46d3b406910', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'i_live_with', 'other', 45),
(325, '242db501-ea79-4e24-8bfa-ddd8d6c6839b', '2020-12-17 17:56:39', '2020-12-17 17:56:39', 1, 1, 'travel', 'yes_sometimes', 45),
(326, 'e47b91c5-7513-45aa-af04-aba8e76cac63', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'ethnicity', 'tay', 46),
(327, 'f6dca59b-c600-4807-a43f-366e8c10a3cd', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'body_type', 'curvy', 46),
(328, '8077fc6e-3a81-4745-bc8d-46b1398bfa67', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'height', '170', 46),
(329, 'c18f5f14-8db1-44de-ac93-a8ae873ade84', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'hair_color', 'white', 46),
(330, '8c9c2e8b-8857-4042-a802-dfe626692027', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'nature', 'friendly', 46),
(331, 'eef347ca-aaaf-4edc-9fd8-aba0801afbb9', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'friends', 'many_friends', 46),
(332, 'f7746158-11f7-4408-a5c6-959573cc6348', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'children', 'someday_maybe', 46),
(333, 'a84db4d5-15d7-46a6-a46a-3922ca8cc146', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'pets', 'none', 46),
(334, 'c518e4e5-dc4f-4ae2-aad1-148722b259e8', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'religion', 'buddhist', 46),
(335, 'e1733cf7-6e1d-4f1e-85f8-c5d6d5d35bbd', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'i_live_with', 'other', 46),
(336, 'd7b05d35-5fcf-490a-bbcf-b51bc36fda1a', '2020-12-17 17:56:43', '2020-12-17 17:56:43', 1, 1, 'travel', 'not_very_much', 46),
(337, '72a24826-2b58-441f-8827-6d634e45dbce', '2020-12-19 15:02:37', '2020-12-19 15:02:37', 1, 1, 'ethnicity', 'kinh', 7),
(338, '7ac4fefe-25b8-4f68-b64d-4d7db4144f0a', '2020-12-19 15:02:38', '2020-12-19 15:02:38', 1, 1, 'body_type', 'slim', 7),
(339, '9b2c745d-15ff-4863-969b-254033bf3829', '2020-12-19 15:02:41', '2020-12-19 15:02:41', 1, 1, 'height', '157', 7),
(340, '1ebf6b30-6175-47f8-9f39-ab51eec2bacb', '2020-12-19 15:02:43', '2020-12-19 15:02:43', 1, 1, 'hair_color', 'black', 7),
(341, 'cd927f09-4f08-4097-9d3d-06b254cc4cc5', '2020-12-19 15:02:48', '2020-12-19 15:02:48', 1, 1, 'religion', 'buddhist', 7),
(342, '7713237e-fbbb-4835-acf9-78fb391263ef', '2020-12-19 17:43:43', '2020-12-19 17:43:43', 1, 1, 'friends', 'no_friends', 7),
(343, 'd835542d-0110-42ae-a52d-d4519713ffbf', '2020-12-19 17:43:45', '2020-12-19 17:43:45', 1, 1, 'nature', 'careful', 7),
(344, '84702048-f1a1-44ab-b693-12e0e182ad1c', '2020-12-19 17:43:47', '2020-12-19 17:43:47', 1, 1, 'children', 'no_never', 7),
(345, 'b4d72e61-5e27-41e6-8545-80d31f748592', '2020-12-19 17:43:49', '2020-12-19 17:43:49', 1, 1, 'pets', 'none', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `expiry_at` datetime DEFAULT NULL,
  `credit_wallet_transactions__id` int(10) UNSIGNED DEFAULT NULL,
  `plan_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`_id`, `_uid`, `created_at`, `updated_at`, `status`, `users__id`, `expiry_at`, `credit_wallet_transactions__id`, `plan_id`) VALUES
(1, '42d6904c-e601-43e1-ae83-45d103dc547a', '2020-12-06 22:23:59', '2020-12-06 22:23:59', 1, 26, '2020-12-07 22:23:59', 12, 'one_day'),
(2, '3b95d00f-c47d-4835-9a14-674ef27cd8e9', '2020-12-15 22:11:41', '2020-12-15 22:11:41', 1, 7, '2020-12-22 22:11:41', 41, 'one_week'),
(3, '7a7b0c8c-13f6-47fd-8ce6-e93f3194dacf', '2020-12-15 22:13:20', '2020-12-15 22:13:20', 1, 26, '2020-12-22 22:13:20', 42, 'one_week');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `abuse_reports`
--
ALTER TABLE `abuse_reports`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_abuse_reports_users1_idx` (`for_users__id`),
  ADD KEY `fk_abuse_reports_users2_idx` (`by_users__id`),
  ADD KEY `fk_abuse_reports_users3_idx` (`moderated_by_users__id`);

--
-- Chỉ mục cho bảng `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`_id`);

--
-- Chỉ mục cho bảng `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_chats_users1_idx` (`from_users__id`),
  ADD KEY `fk_chats_users2_idx` (`to_users__id`),
  ADD KEY `fk_chats_items1_idx` (`items__id`),
  ADD KEY `fk_chats_users3_idx` (`users__id`);

--
-- Chỉ mục cho bảng `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`_id`);

--
-- Chỉ mục cho bảng `credit_packages`
--
ALTER TABLE `credit_packages`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_credit_packages_users1_idx` (`users__id`);

--
-- Chỉ mục cho bảng `credit_wallet_transactions`
--
ALTER TABLE `credit_wallet_transactions`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_credit_wallet_transactions_users1_idx` (`users__id`),
  ADD KEY `fk_credit_wallet_transactions_financial_transactions1_idx` (`financial_transactions__id`);

--
-- Chỉ mục cho bảng `financial_transactions`
--
ALTER TABLE `financial_transactions`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_financial_transactions_users1_idx` (`users__id`);

--
-- Chỉ mục cho bảng `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_gifts_user_authorities1_idx` (`user_authorities__id`);

--
-- Chỉ mục cho bảng `like_dislikes`
--
ALTER TABLE `like_dislikes`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_like_dislikes_users1_idx` (`to_users__id`),
  ADD KEY `fk_like_dislikes_users2_idx` (`by_users__id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_notifications_users1_idx` (`users__id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`);

--
-- Chỉ mục cho bảng `profile_boosts`
--
ALTER TABLE `profile_boosts`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_profile_boosts_users1_idx` (`for_users__id`),
  ADD KEY `fk_profile_boosts_credit_wallet_transactions1_idx` (`credit_wallet_transactions__id`);

--
-- Chỉ mục cho bảng `profile_visitors`
--
ALTER TABLE `profile_visitors`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_profile_visitors_users1_idx` (`to_users__id`),
  ADD KEY `fk_profile_visitors_users2_idx` (`by_users__id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`);

--
-- Chỉ mục cho bảng `user_authorities`
--
ALTER TABLE `user_authorities`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_authorities_users1_idx` (`users__id`),
  ADD KEY `fk_user_authorities_user_roles1_idx` (`user_roles__id`);

--
-- Chỉ mục cho bảng `user_block_users`
--
ALTER TABLE `user_block_users`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_block_users1_idx` (`to_users__id`),
  ADD KEY `fk_user_block_users2_idx` (`by_users__id`);

--
-- Chỉ mục cho bảng `user_encounters`
--
ALTER TABLE `user_encounters`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_encounters_users1_idx` (`by_users__id`),
  ADD KEY `fk_user_encounters_users2_idx` (`to_users__id`);

--
-- Chỉ mục cho bảng `user_gifts`
--
ALTER TABLE `user_gifts`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_gifts_users1_idx` (`from_users__id`),
  ADD KEY `fk_user_gifts_users2_idx` (`to_users__id`),
  ADD KEY `fk_user_gifts_items1_idx` (`items__id`),
  ADD KEY `fk_user_gifts_credit_wallet_transactions1_idx` (`credit_wallet_transactions__id`);

--
-- Chỉ mục cho bảng `user_items`
--
ALTER TABLE `user_items`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_items_users1_idx` (`users__id`),
  ADD KEY `fk_user_items_items1_idx` (`items__id`),
  ADD KEY `fk_user_items_credit_wallet_transactions1_idx` (`credit_wallet_transactions__id`);

--
-- Chỉ mục cho bảng `user_photos`
--
ALTER TABLE `user_photos`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_photos_users1_idx` (`users__id`);

--
-- Chỉ mục cho bảng `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD KEY `fk_user_profiles_users1_idx` (`users__id`),
  ADD KEY `fk_user_profiles_countries1_idx` (`countries__id`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`);

--
-- Chỉ mục cho bảng `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `name` (`key_name`),
  ADD KEY `fk_user_settings_users1_idx` (`users__id`);

--
-- Chỉ mục cho bảng `user_specifications`
--
ALTER TABLE `user_specifications`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_favorites_users1_idx` (`users__id`);

--
-- Chỉ mục cho bảng `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_subscriptions_users1_idx` (`users__id`),
  ADD KEY `fk_user_subscriptions_credit_wallet_transactions1_idx` (`credit_wallet_transactions__id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `abuse_reports`
--
ALTER TABLE `abuse_reports`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT cho bảng `chats`
--
ALTER TABLE `chats`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT cho bảng `configurations`
--
ALTER TABLE `configurations`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT cho bảng `credit_packages`
--
ALTER TABLE `credit_packages`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `credit_wallet_transactions`
--
ALTER TABLE `credit_wallet_transactions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `financial_transactions`
--
ALTER TABLE `financial_transactions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `items`
--
ALTER TABLE `items`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `like_dislikes`
--
ALTER TABLE `like_dislikes`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `profile_boosts`
--
ALTER TABLE `profile_boosts`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `profile_visitors`
--
ALTER TABLE `profile_visitors`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `user_authorities`
--
ALTER TABLE `user_authorities`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `user_block_users`
--
ALTER TABLE `user_block_users`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `user_encounters`
--
ALTER TABLE `user_encounters`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT cho bảng `user_gifts`
--
ALTER TABLE `user_gifts`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user_items`
--
ALTER TABLE `user_items`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user_photos`
--
ALTER TABLE `user_photos`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `user_specifications`
--
ALTER TABLE `user_specifications`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT cho bảng `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `abuse_reports`
--
ALTER TABLE `abuse_reports`
  ADD CONSTRAINT `fk_abuse_reports_users1` FOREIGN KEY (`for_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_abuse_reports_users2` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_abuse_reports_users3` FOREIGN KEY (`moderated_by_users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `fk_chats_items1` FOREIGN KEY (`items__id`) REFERENCES `items` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chats_users1` FOREIGN KEY (`from_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chats_users2` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chats_users3` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `credit_packages`
--
ALTER TABLE `credit_packages`
  ADD CONSTRAINT `fk_credit_packages_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `credit_wallet_transactions`
--
ALTER TABLE `credit_wallet_transactions`
  ADD CONSTRAINT `fk_credit_wallet_transactions_financial_transactions1` FOREIGN KEY (`financial_transactions__id`) REFERENCES `financial_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_credit_wallet_transactions_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `financial_transactions`
--
ALTER TABLE `financial_transactions`
  ADD CONSTRAINT `fk_financial_transactions_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_gifts_user_authorities1` FOREIGN KEY (`user_authorities__id`) REFERENCES `user_authorities` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `like_dislikes`
--
ALTER TABLE `like_dislikes`
  ADD CONSTRAINT `fk_like_dislikes_users1` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_like_dislikes_users2` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `profile_boosts`
--
ALTER TABLE `profile_boosts`
  ADD CONSTRAINT `fk_profile_boosts_credit_wallet_transactions1` FOREIGN KEY (`credit_wallet_transactions__id`) REFERENCES `credit_wallet_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_profile_boosts_users1` FOREIGN KEY (`for_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `profile_visitors`
--
ALTER TABLE `profile_visitors`
  ADD CONSTRAINT `fk_profile_visitors_users1` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_profile_visitors_users2` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_authorities`
--
ALTER TABLE `user_authorities`
  ADD CONSTRAINT `fk_user_authorities_user_roles1` FOREIGN KEY (`user_roles__id`) REFERENCES `user_roles` (`_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_authorities_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_block_users`
--
ALTER TABLE `user_block_users`
  ADD CONSTRAINT `fk_user_block_users1` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_block_users2` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_encounters`
--
ALTER TABLE `user_encounters`
  ADD CONSTRAINT `fk_user_encounters_users1` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_encounters_users2` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_gifts`
--
ALTER TABLE `user_gifts`
  ADD CONSTRAINT `fk_user_gifts_credit_wallet_transactions1` FOREIGN KEY (`credit_wallet_transactions__id`) REFERENCES `credit_wallet_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_gifts_items1` FOREIGN KEY (`items__id`) REFERENCES `items` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_gifts_users1` FOREIGN KEY (`from_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_gifts_users2` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_items`
--
ALTER TABLE `user_items`
  ADD CONSTRAINT `fk_user_items_credit_wallet_transactions1` FOREIGN KEY (`credit_wallet_transactions__id`) REFERENCES `credit_wallet_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_items_items1` FOREIGN KEY (`items__id`) REFERENCES `items` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_items_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_photos`
--
ALTER TABLE `user_photos`
  ADD CONSTRAINT `fk_user_photos_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `fk_user_profiles_countries1` FOREIGN KEY (`countries__id`) REFERENCES `countries` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_profiles_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_settings`
--
ALTER TABLE `user_settings`
  ADD CONSTRAINT `fk_user_settings_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_specifications`
--
ALTER TABLE `user_specifications`
  ADD CONSTRAINT `fk_user_favorites_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD CONSTRAINT `fk_user_subscriptions_credit_wallet_transactions1` FOREIGN KEY (`credit_wallet_transactions__id`) REFERENCES `credit_wallet_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_subscriptions_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
