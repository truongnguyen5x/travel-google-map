-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2018 at 05:47 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelgmap`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `trip_id`, `user_id`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`, `address`) VALUES
(3, 'two', 2, 10, 2, 'App\\Models\\Trip', '2018-08-08 07:02:08', '2018-08-08 07:02:08', 'CD3, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam'),
(4, 'one', 2, 11, 2, 'App\\Models\\Trip', '2018-08-08 07:03:17', '2018-08-08 07:03:17', NULL),
(5, 'wow', NULL, 10, 4, 'App\\Models\\Comment', '2018-08-08 07:03:40', '2018-08-08 07:03:40', '32 Đỗ Đức Dục, Mễ Trì, Nam Từ Liêm, Hà Nội, Vietnam'),
(6, 'one comment', 7, 10, 7, 'App\\Models\\Trip', '2018-08-08 07:12:48', '2018-08-08 07:12:48', 'CD3, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam'),
(7, 'abc', 8, 8, 8, 'App\\Models\\Trip', '2018-08-08 07:17:29', '2018-08-08 07:17:29', NULL),
(8, '1', 9, 8, 9, 'App\\Models\\Trip', '2018-08-08 07:27:30', '2018-08-08 07:27:30', NULL),
(9, '2', 9, 8, 9, 'App\\Models\\Trip', '2018-08-08 07:27:35', '2018-08-08 07:27:35', NULL),
(10, '3', 9, 8, 9, 'App\\Models\\Trip', '2018-08-08 07:27:41', '2018-08-08 07:27:41', NULL),
(11, '4', 9, 10, 9, 'App\\Models\\Trip', '2018-08-08 07:27:56', '2018-08-08 07:27:56', NULL),
(12, '5', 9, 10, 9, 'App\\Models\\Trip', '2018-08-08 07:28:01', '2018-08-08 07:28:01', NULL),
(13, '6', 9, 10, 9, 'App\\Models\\Trip', '2018-08-08 07:28:12', '2018-08-08 07:28:12', NULL),
(14, 'không bật vị trí', 2, 10, 2, 'App\\Models\\Trip', '2018-08-08 07:48:12', '2018-08-08 07:48:12', NULL),
(15, 'bật vị trí', 2, 10, 2, 'App\\Models\\Trip', '2018-08-08 07:48:30', '2018-08-08 07:48:30', 'Keangnam Hanoi Landmark Tower, Mễ Trì, Từ Liêm, Hà Nội, Vietnam'),
(17, 'ss', 8, 13, 8, 'App\\Models\\Trip', '2018-08-10 01:20:59', '2018-08-10 01:20:59', 'Phố ẩm thực Keangnam, Mễ Trì, Từ Liêm, Hà Nội, Vietnam'),
(18, 'ssssss', NULL, 13, 16, 'App\\Models\\Comment', '2018-08-10 01:21:08', '2018-08-10 01:21:08', 'Phố ẩm thực Keangnam, Mễ Trì, Từ Liêm, Hà Nội, Vietnam');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(11) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `comment_id`, `url`, `created_at`, `updated_at`) VALUES
(9, 3, 'image/comment/5b6a95708375d.png', '2018-08-08 07:02:08', '2018-08-08 07:02:08'),
(10, 3, 'image/comment/U09K_Jellyfish.jpg', '2018-08-08 07:02:08', '2018-08-08 07:02:08'),
(11, 3, 'image/comment/tVMz_Koala.jpg', '2018-08-08 07:02:08', '2018-08-08 07:02:08'),
(12, 3, 'image/comment/3OjL_Lighthouse.jpg', '2018-08-08 07:02:08', '2018-08-08 07:02:08'),
(13, 3, 'image/comment/0Fpg_Penguins.jpg', '2018-08-08 07:02:08', '2018-08-08 07:02:08'),
(20, 17, 'image/comment/5b6ce87b339dd.png', '2018-08-10 01:20:59', '2018-08-10 01:20:59'),
(21, 17, 'image/comment/zV2V_avatar-user-business-man-399587fe24739d5a-512x512.png', '2018-08-10 01:20:59', '2018-08-10 01:20:59'),
(22, 17, 'image/comment/xGgP_avatar-user-teacher-312a499a08079a12-256x256.png', '2018-08-10 01:20:59', '2018-08-10 01:20:59'),
(23, 17, 'image/comment/Hj0K_Chrysanthemum.jpg', '2018-08-10 01:20:59', '2018-08-10 01:20:59'),
(24, 17, 'image/comment/HmFl_da-nang-vietnam.jpg.jpg', '2018-08-10 01:20:59', '2018-08-10 01:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_07_16_032515_create_permission_tables', 1),
(4, '2018_07_23_012035_create_user_trip', 2),
(5, '2018_07_23_012303_comments', 2),
(6, '2018_07_23_012414_trips', 2),
(7, '2018_07_23_012456_images', 2),
(8, '2018_07_23_012649_way_points', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 13);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Access Admin', 'web', '2018-07-17 19:31:52', '2018-07-17 19:31:52'),
(2, 'edit', 'web', '2018-08-10 01:51:36', '2018-08-10 01:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2018-07-15 23:35:52', '2018-07-15 23:35:52'),
(2, 'moderator', 'web', '2018-07-15 23:35:52', '2018-07-15 23:35:52'),
(3, 'test', 'web', '2018-08-10 01:51:53', '2018-08-10 01:51:53');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_number` int(11) NOT NULL DEFAULT '1',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'planning',
  `owner_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `name`, `image_url`, `people_number`, `status`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 'test1', 'image/trip/bLuy_Desert.jpg', 1, 'closed', 10, '2018-08-08 03:18:21', '2018-08-08 03:18:21'),
(2, 'test2', NULL, 2, 'in process', 10, '2018-08-08 06:57:40', '2018-08-08 07:04:13'),
(3, 'no people follow', NULL, 1, 'planning', 10, '2018-08-08 07:08:23', '2018-08-08 07:08:23'),
(5, 'one people follow', NULL, 1, 'planning', 10, '2018-08-08 07:09:27', '2018-08-08 07:09:27'),
(6, 'one people follow + one people join', 'image/trip/BsSq_Jellyfish.jpg', 2, 'in process', 10, '2018-08-08 07:10:39', '2018-08-08 07:11:11'),
(7, 'one people follow + one people join + one comment', NULL, 2, 'planning', 10, '2018-08-08 07:12:10', '2018-08-08 07:13:40'),
(8, 'two people follow + one comment + one join', 'image/trip/PoPO_Penguins.jpg', 2, 'planning', 11, '2018-08-08 07:14:40', '2018-08-08 07:15:31'),
(9, 'no follow + no Join + 10 comment', NULL, 1, 'in process', 8, '2018-08-08 07:27:19', '2018-08-08 07:27:19'),
(10, 'two follow + no join +no comment', NULL, 1, 'planning', 10, '2018-08-08 07:29:35', '2018-08-08 07:29:35'),
(11, 'time out and change \"in process\" in 9h 9/8/2018', NULL, 1, 'closed', 11, '2018-08-08 07:35:12', '2018-08-08 07:35:12'),
(12, 'closed in 2h44 PM 8/8', 'image/trip/9GC7_Jellyfish.jpg', 1, 'closed', 11, '2018-08-08 07:39:10', '2018-08-08 07:39:10'),
(14, 'đá', NULL, 1, 'planning', 1, '2018-08-10 02:05:24', '2018-08-10 02:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_avatar_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'avatar/no-avatar.jpg',
  `g_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `phone`, `name`, `password`, `g_avatar_url`, `g_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', NULL, 'Quang Hưng', '$2y$10$seDIKao8bmF0.tP5.csLiOeGGbN3wDlYmYFhUPiRAZbRN9SKPKH8G', 'avatar/Qcah_travel-google-mapv1.png', NULL, 'TXHakSL4isiPul1Xn3YOYTPlSuA57gyuWKfQA8SRRQtaQix4pvODQXLfGeXd', '2018-07-15 23:35:52', '2018-07-25 18:21:38'),
(3, 'nguyenthanhtung200997@gmail.com', NULL, 'Tùng Nguyễn Thanh', NULL, 'https://lh6.googleusercontent.com/-Xn5YKU01wyc/AAAAAAAAAAI/AAAAAAAAAAA/AAnnY7qYZv1jthygTkCnyM_q5jbGALXeEQ/mo/photo.jpg?sz=50', '114676674578937915822', 'YlrFTQFxmudemq1m79HP2vycoB6vatU8IQDmu7soQMVBcayjvanBNrODw6Mz', '2018-07-16 00:41:27', '2018-07-16 00:41:27'),
(7, 'tung@gmail.com', NULL, 'tung', '$2y$10$bGHsFHgpDrC948iCgquA6Oru/RG2UcpVazwFWfy6nyRqiPWqEzNqi', NULL, NULL, NULL, '2018-08-03 01:53:31', '2018-08-03 01:53:31'),
(8, 'abc123@abc123.com', NULL, 'user1', '$2y$10$cjjm9j4Agp2GiisS6g8jbO./7of34GudPsQSTvBYaE2J3RB9.fruK', 'avatar/VRzm_avatar-user-business-man-399587fe24739d5a-512x512.png', NULL, 'zghNGUI0yM5451NnTk7jEYpo2w3oQi7LqHQdXrmAc3qwu3jkO4pXJrVH1gnm', '2018-08-04 05:16:43', '2018-08-10 01:08:47'),
(10, 'hungcan1997@gmail.com', NULL, 'Quang Hưng Trần', NULL, 'https://lh4.googleusercontent.com/-j_E1eYBPbic/AAAAAAAAAAI/AAAAAAAAAAA/AAnnY7q3o6kWSyWYIKF7dv8DqEemggRi3w/mo/photo.jpg?sz=50', '112729585459554987105', 'FwSvjQWBS5z4Nd1CCqcAYh5kMKdQncfdwpvrX9ReWqAszqQh2z0eqDxH14Bw', '2018-08-07 01:47:09', '2018-08-07 01:47:09'),
(11, 'hungcan197@gmail.com', NULL, 'hung tran', NULL, 'https://lh6.googleusercontent.com/-lore8dRwey0/AAAAAAAAAAI/AAAAAAAAAAA/AAnnY7obuGZ6z4xUb_7sy5Cnx4gb0R36UA/mo/photo.jpg?sz=50', '112647278623852609267', 'bnFHVgRfLV7NeUNaP2kKuN5BbVk2N3lyrKWzaW1MowHtSuuGxiyMreO2fNbn', '2018-08-07 02:06:54', '2018-08-07 02:06:54'),
(12, 'hungcan19997@gmail.com', NULL, 'hung Tran', NULL, 'https://lh6.googleusercontent.com/-SuY-D7KdHj0/AAAAAAAAAAI/AAAAAAAAAAA/AAnnY7qUYxal99-dDBbuZ45JYGXscASQTQ/mo/photo.jpg?sz=50', '102495403465842246716', '0SAI3DqNvVuEJAuljyxqQwnd1iDd6wnLTg465gaxLZ4E7WTQBIo96poMW8r0', '2018-08-08 07:30:35', '2018-08-08 07:30:35'),
(13, 'test@gmail.com', NULL, 'test', '$2y$10$a7X./MidmboiuDaXl9ypuuAu41AGPiqohaZ0YUEUUl69KEaIaZFAK', 'avatar/44Yp_avatar-user-business-man-399587fe24739d5a-512x512.png', NULL, 'EQyfzW6J9mUcjkOjmT7g2jyHFQ7mVZJVOUoqHcHNKDxJhZOr6GFzp5hW6mgT', '2018-08-10 01:18:02', '2018-08-10 01:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_trip`
--

CREATE TABLE `user_trip` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_trip`
--

INSERT INTO `user_trip` (`id`, `status`, `user_id`, `trip_id`, `created_at`, `updated_at`) VALUES
(3, 'join', 11, 2, NULL, NULL),
(4, 'follow', 11, 5, NULL, NULL),
(5, 'follow', 11, 6, NULL, NULL),
(6, 'join', 11, 6, NULL, NULL),
(7, 'follow', 11, 7, NULL, NULL),
(8, 'join', 11, 7, NULL, NULL),
(9, 'follow', 10, 8, NULL, NULL),
(10, 'join', 10, 8, NULL, NULL),
(11, 'follow', 8, 8, NULL, NULL),
(12, 'follow', 8, 10, NULL, NULL),
(13, 'follow', 12, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `way_points`
--

CREATE TABLE `way_points` (
  `id` int(10) UNSIGNED NOT NULL,
  `lat` double(9,6) NOT NULL,
  `lng` double(9,6) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'moving',
  `leave_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `trip_id` int(11) NOT NULL,
  `order_num` int(11) NOT NULL,
  `vehicle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'motorbike or car',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `way_points`
--

INSERT INTO `way_points` (`id`, `lat`, `lng`, `address`, `action`, `leave_time`, `arrival_time`, `trip_id`, `order_num`, `vehicle`, `created_at`, `updated_at`) VALUES
(13, 21.023287, 105.789049, '2 Lộc Vừng, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-09 10:17:00', '2018-08-10 10:17:00', 1, 0, 'motorbike or car', '2018-08-08 06:36:45', '2018-08-08 06:36:45'),
(14, 20.761029, 105.875663, 'Unnamed Road, Đại Thắng, Phú Xuyên, Hà Nội, Vietnam', 'moving', NULL, NULL, 1, 1, 'motorbike or car', '2018-08-08 06:36:45', '2018-08-08 06:36:45'),
(15, 20.987118, 105.995493, 'Unnamed Road, tt. Như Quỳnh, Văn Lâm, Hưng Yên, Vietnam', 'moving', NULL, NULL, 1, 2, 'motorbike or car', '2018-08-08 06:36:45', '2018-08-08 06:36:45'),
(24, 21.023314, 105.794533, '129 Đường Yên Hòa, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-09 09:56:00', '2018-08-25 13:56:00', 2, 0, 'motorbike or car', '2018-08-08 07:07:04', '2018-08-08 07:47:45'),
(25, 20.999159, 105.834480, '167 Trường Chinh, Khương Mai, Đống Đa, Hà Nội, Vietnam', 'activity', '2018-08-11 14:46:00', '2018-08-10 14:46:00', 2, 1, 'motorbike or car', '2018-08-08 07:07:04', '2018-08-08 07:47:46'),
(26, 21.035039, 105.748817, '100 Phương Canh, Thị Cấm, Xuân Phương, Từ Liêm, Hà Nội, Vietnam', 'moving', '2018-08-13 14:46:00', '2018-08-12 14:46:00', 2, 2, 'motorbike or car', '2018-08-08 07:07:04', '2018-08-08 07:47:46'),
(27, 20.978205, 105.791430, '8 Đường 19/5, P. Văn Quán, Hà Đông, Hà Nội, Vietnam', 'moving', '2018-08-15 14:47:00', '2018-08-14 14:47:00', 2, 3, 'motorbike or car', '2018-08-08 07:07:04', '2018-08-08 07:47:46'),
(28, 21.053375, 105.739201, 'Ngõ 162 Đường Cầu Diễn, Nguyên Xá, Minh Khai, Từ Liêm, Hà Nội, Vietnam', 'activity', '2018-08-17 14:47:00', '2018-08-16 14:47:00', 2, 4, 'motorbike or car', '2018-08-08 07:07:04', '2018-08-08 07:47:46'),
(29, 20.969637, 105.690667, 'Unnamed Road, Quốc Oai, Hà Nội, Vietnam', 'moving', '2018-08-19 14:47:00', '2018-08-18 14:47:00', 2, 5, 'motorbike or car', '2018-08-08 07:07:04', '2018-08-08 07:47:46'),
(30, 20.953039, 105.738607, 'Đường Nghĩa Lộ, Yên Nghĩa, Hà Đông, Hà Nội, Vietnam', 'moving', '2018-08-21 14:47:00', '2018-08-20 14:47:00', 2, 6, 'motorbike or car', '2018-08-08 07:07:04', '2018-08-08 07:47:46'),
(31, 21.016795, 105.740120, '108 Do Nha, Tây Mỗ, Từ Liêm, Hà Nội, Vietnam', 'activity', '2018-08-23 14:47:00', '2018-08-22 14:47:00', 2, 7, 'motorbike or car', '2018-08-08 07:07:04', '2018-08-08 07:47:46'),
(34, 21.019136, 105.790161, '19 Ngõ 219 Trung Kính, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-19 14:09:00', '2018-08-20 14:09:00', 5, 0, 'motorbike or car', '2018-08-08 07:09:27', '2018-08-08 07:09:27'),
(35, 21.015696, 105.785906, 'CD2, Khu đô thị Nam Trung Yên, Mễ Trì, Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 5, 1, 'motorbike or car', '2018-08-08 07:09:27', '2018-08-08 07:09:27'),
(36, 21.017988, 105.782532, 'Dương Đình Nghệ, Mễ Trì, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-09 14:10:00', '2018-08-16 14:10:00', 6, 0, 'motorbike or car', '2018-08-08 07:10:39', '2018-08-08 07:10:39'),
(37, 21.016239, 105.785730, 'Nam Trung Yên, Khu đô thị Nam Trung Yên, Mễ Trì, Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 6, 1, 'motorbike or car', '2018-08-08 07:10:39', '2018-08-08 07:10:39'),
(38, 21.020322, 105.785313, '68 Dương Đình Nghệ, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-16 14:11:00', '2018-08-24 14:12:00', 7, 0, 'motorbike or car', '2018-08-08 07:12:10', '2018-08-08 07:12:10'),
(39, 21.017846, 105.786396, 'LS4, Khu đô thị Nam Trung Yên, Hà Nội, Vietnam', 'moving', '2018-08-17 14:14:00', '2018-08-25 14:14:00', 8, 0, 'motorbike or car', '2018-08-08 07:14:40', '2018-08-08 07:14:40'),
(40, 21.018185, 105.788523, 'Nam Trung Yên, Khu đô thị Nam Trung Yên, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-09 14:27:00', '2018-08-10 14:27:00', 9, 0, 'motorbike or car', '2018-08-08 07:27:19', '2018-08-08 07:27:19'),
(41, 21.015069, 105.781205, 'Mễ Trì Hạ, Mễ Trì, Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 9, 1, 'motorbike or car', '2018-08-08 07:27:19', '2018-08-08 07:27:19'),
(42, 21.020322, 105.785313, '68 Dương Đình Nghệ, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-24 14:29:00', '2018-08-29 14:29:00', 10, 0, 'motorbike or car', '2018-08-08 07:29:35', '2018-08-08 07:29:35'),
(43, 21.018905, 105.787000, '148 Nguyễn Chánh, Khu đô thị Nam Trung Yên, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-09 09:00:00', '2018-08-09 14:34:00', 11, 0, 'motorbike or car', '2018-08-08 07:35:12', '2018-08-08 07:35:12'),
(44, 21.016929, 105.786043, 'AR7, Khu đô thị Nam Trung Yên, Mễ Trì, Nam Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 11, 1, 'motorbike or car', '2018-08-08 07:35:12', '2018-08-08 07:35:12'),
(45, 21.020322, 105.785313, '68 Dương Đình Nghệ, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-08 14:40:00', '2018-08-08 14:44:00', 12, 0, 'motorbike or car', '2018-08-08 07:39:10', '2018-08-08 07:39:10'),
(49, 21.017846, 105.785045, 'CD2, Mễ Trì, Nam Từ Liêm, Hà Nội, Vietnam', 'moving', '2018-08-10 14:08:00', '2018-08-11 14:08:00', 3, 0, 'motorbike or car', '2018-08-09 09:50:52', '2018-08-09 09:50:52'),
(57, 21.028138, 105.797867, '64 Đường Cầu Giấy, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam', 'moving', '2018-08-11 09:04:00', '2018-08-13 09:04:00', 14, 0, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(58, 21.007950, 105.756000, 'ĐCT08, Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 1, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(59, 20.995463, 105.791102, '35 Tố Hữu, Trung Văn, Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 2, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(60, 21.030497, 105.759298, '121 K2, Cầu Diễn, Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 3, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(61, 21.004286, 105.742875, '51 Cầu Cốc, Tây Mỗ, Nam Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 4, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(62, 21.023258, 105.798365, '225 Nguyễn Khang, Yên Hoà, Cầu Giấy, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 5, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(63, 21.020447, 105.743708, '1 Tây Mỗ, Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 6, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(64, 21.040457, 105.779350, '12 Doãn Kế Thiện, Mai Dịch, Cầu Giấy, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 7, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(65, 21.000359, 105.807621, '86 Vũ Trọng Phụng, Thanh Xuân Trung, Thanh Xuân, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 8, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(66, 21.023293, 105.804883, '105 Chùa Láng, Láng Thượng, Đống Đa, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 9, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(67, 21.022880, 105.755613, '614 K2, Cầu Diễn, Từ Liêm, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 10, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(68, 21.019474, 105.812357, '65 Nguyên Hồng, Thành Công, Ba Đình, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 11, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(69, 20.947478, 105.700390, 'Phụng Châu, Chương Mỹ, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 12, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(70, 20.969927, 105.806679, 'Nguyễn Xiển Xa La, Thanh Liệt, Hoàng Mai, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 13, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24'),
(71, 21.021654, 105.895848, '331 Bát Khối, p. Long Biên, Long Biên, Hà Nội, Vietnam', 'moving', NULL, NULL, 14, 14, 'motorbike or car', '2018-08-10 02:05:24', '2018-08-10 02:05:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_trip`
--
ALTER TABLE `user_trip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `way_points`
--
ALTER TABLE `way_points`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_trip`
--
ALTER TABLE `user_trip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `way_points`
--
ALTER TABLE `way_points`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
