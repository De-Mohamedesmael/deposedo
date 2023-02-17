-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2023 at 04:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deposedo_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role_id`, `deleted_at`, `created_at`, `phone`, `updated_at`) VALUES
(2, 'admin2', 'admin2@test.com', NULL, '$2y$10$3uM07lIPMCDfttJ3Tf3LGefqG4gPAM8Huju1aNwQJHAfjRB4liOEK', 'nna4EGlDzhVmGCcHrqLVyex247Hjw4NucVhhwwU5JEfV4S1LD2oEju4g6zXC', 1, NULL, '2021-11-08 17:11:33', '01009156765', '2022-06-06 17:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_password_resets`
--

INSERT INTO `admin_password_resets` (`email`, `token`, `created_at`) VALUES
('bluezone.adv@gmail.com', '$2y$10$l3ATWwuN81.1iZrTUJqsyuUnOnGefZeBwodCGn.xdffCqytDqsuW2', '2021-11-27 23:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(50) NOT NULL,
  `link` text NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'product',
  `in_app` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `position` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `img`, `link`, `type`, `in_app`, `created_at`, `updated_at`, `position`) VALUES
(1, '166160097127154.png', 'https://multi-kw.com/ar/vendor/51', 'product', 0, '2021-10-22 12:11:53', '2022-08-27 19:28:22', 1),
(7, '164920288351902.jpeg', '3', 'product', 1, '2021-11-03 04:13:41', '2022-04-06 09:54:44', 2),
(28, '166161803962145.png', 'https://multi-kw.com/ar/vendor/51', 'product', 0, '2022-05-10 16:59:32', '2022-08-27 19:33:59', 3),
(29, '166161772661000.png', 'https://multi-kw.com/ar/vendor/51', 'product', 0, '2022-05-21 15:10:44', '2022-08-27 19:28:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `shipping_price` double NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name_ar`, `name_en`, `slug`, `shipping_price`, `deleted_at`, `created_at`, `updated_at`, `country_id`) VALUES
(1, 'الجزائر', 'Algeria', 'algeria', 25, '2021-10-26 20:25:19', '2021-10-18 11:43:57', '2021-10-26 20:25:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `frontend_type` enum('select','radio','text','text_area','img') NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(11) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name_en`, `name_ar`, `frontend_type`, `is_required`, `sort`, `deleted_at`, `created_at`, `updated_at`) VALUES
(6, 'size', 'size', 'select', 1, 0, NULL, NULL, '2021-11-03 02:39:29'),
(7, 'color', 'color', 'select', 1, 0, NULL, NULL, '2021-11-03 02:39:24'),
(8, 'test', 'test', 'select', 0, 0, '2021-11-03 02:39:12', '2021-10-31 07:20:21', '2021-11-03 02:39:12'),
(9, 'old', 'old', 'select', 0, 0, '2021-11-18 18:49:18', '2021-11-14 23:11:58', '2021-11-18 18:49:18'),
(10, 'new', 'new', 'select', 0, 0, '2021-11-18 18:49:15', '2021-11-14 23:12:10', '2021-11-18 18:49:15'),
(11, 'Additional specifications', 'المواصفات الاضافيه', 'select', 0, 0, NULL, '2021-11-29 21:02:15', '2021-11-29 21:02:15'),
(12, 'material', 'الخامه', 'select', 0, 0, NULL, '2021-11-30 23:34:23', '2021-11-30 23:34:23'),
(13, 'Genuine leather', 'جلد طبيعي', 'select', 0, 0, NULL, '2022-04-12 09:38:58', '2022-04-12 09:39:46'),
(14, '4', '4', 'select', 0, 0, NULL, '2022-05-19 12:42:19', '2022-05-19 12:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  `fcm_token` varchar(400) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `amount`, `fcm_token`, `product_id`, `created_at`, `updated_at`) VALUES
(5, NULL, 2, 'ujtythgjuyjkuytik', 204, '2023-01-16 11:10:09', '2023-01-16 11:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `sort` int(11) DEFAULT 0,
  `parent_id` int(11) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `img` varchar(50) DEFAULT 'default.svg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_ar`, `slug`, `sort`, `parent_id`, `deleted_at`, `created_at`, `updated_at`, `img`) VALUES
(1, 'Women\'s', 'النساء', 'alnsaaa', 8, 0, NULL, NULL, '2022-01-24 00:05:49', 'Women\'s1642953949.png'),
(2, 'Accessories', 'اكسسوارات', 'akssoarat', 1, 0, '2021-12-21 17:50:09', NULL, '2021-12-21 17:50:09', 'Accessories1638637336.png'),
(3, 'Men\'s', 'الرجال', 'alrgal', 7, 0, '2022-04-20 03:54:24', NULL, '2022-04-20 03:54:24', 'men clothing1642436218.png'),
(4, 'princesses week', 'أسبوع الأميرات', 'asboaa-alamyrat', 6, 0, NULL, NULL, '2022-08-27 15:50:08', 'children clothes1642436494.jpg'),
(5, 'Skincare', 'عناية بالبشرة', 'aanay-balbshr', 100, 1, '2022-02-12 22:41:53', NULL, '2022-02-12 22:41:53', 'Skincare1640081668.png'),
(6, 'home', 'المنزل', 'almnzl', 99, 1, '2021-12-21 18:23:25', NULL, '2021-12-21 18:23:25', 'home1638637717.png'),
(7, 'Women\'s perfume', 'عطور نسائية', 'aator-nsayy', 98, 1, '2022-02-20 17:41:06', NULL, '2022-02-20 17:41:06', 'Women\'s perfume1640082999.png'),
(8, 'shoes', 'احذية', 'ahthy', 100, 21, '2021-12-21 17:48:45', NULL, '2021-12-21 17:48:45', 'shoes1638637793.png'),
(9, 'electronics', 'الكترونيات', 'alktronyat', 99, 4, '2022-02-12 22:42:15', NULL, '2022-02-12 22:42:15', 'electronics1638637832.png'),
(10, 'adoat-hndsy', 'آلات تيكنيك', 'adoat-hndsy', 98, 4, '2021-12-05 01:05:08', NULL, '2021-12-05 01:05:08', 'adoat-hndsy.svg'),
(11, 'Man clothis', 'ملابس الرجال', 'mlabs-alrgal', 97, 3, '2021-12-21 18:03:43', NULL, '2021-12-21 18:03:43', 'Man clothis1638637558.png'),
(12, 'kitchen tools', 'ادوات امطبخ', 'adoat-amtbkh', 96, 1, '2022-02-12 22:42:02', NULL, '2022-02-12 22:42:02', 'kitchen tools1640082308.png'),
(13, 'clothes', 'ملابس', 'mlabs', 95, 3, '2021-11-30 19:36:18', NULL, '2021-11-30 19:36:18', 'clothes.svg'),
(14, 'bags', 'شنط', 'shnt', 94, 2, '2021-11-30 19:26:07', NULL, '2021-11-30 19:26:07', 'bags.svg'),
(15, 'Mans', 'الرجال', 'alrgal', 5, 0, NULL, '2021-10-25 20:35:41', '2022-05-28 13:18:18', 'Mans1653733098.png'),
(16, 'clothes', 'ملابس', 'mlabs', 0, 3, '2021-11-30 19:26:10', '2021-10-25 20:38:42', '2021-11-30 19:26:10', 'clothes.svg'),
(17, 'clothes', 'ملابس', 'mlabs', 0, 3, '2021-11-30 18:54:12', '2021-10-26 18:27:11', '2021-11-30 18:54:12', 'clothes.svg'),
(18, 'electronics', 'الكترونيات', 'alktronyat', 0, 2, '2021-11-30 18:54:09', '2021-10-26 18:36:14', '2021-11-30 18:54:09', 'electronics.svg'),
(19, 'jknk', 'قسم 5', 'nlkjnkj', 0, 1, '2021-10-26 20:38:03', '2021-10-26 18:41:36', '2021-10-26 20:38:03', 'jknk.svg'),
(20, 'Beautifying', 'تجميل', 'tgmyl', 0, 15, '2021-11-30 18:54:05', '2021-11-30 14:57:42', '2021-11-30 18:54:05', 'Beautifying.svg'),
(21, 'shoes', 'احذية', 'ahthy', 2, 0, '2021-12-21 17:49:32', '2021-11-30 17:45:53', '2021-12-21 17:49:32', 'shoes1638637392.png'),
(22, 'bags', 'شنط', 'shnt', 3, 0, '2021-12-21 17:51:10', '2021-11-30 17:51:09', '2021-12-21 17:51:10', 'bags1638637400.png'),
(23, 'Accessories', 'اكسسوارات', 'akssoarat', 4, 0, NULL, '2021-11-30 17:51:33', '2022-05-28 13:19:04', 'Accessories1653733144.png'),
(24, 'name in En', 'الاسم بالعربى', 'alasm-balaarb', 0, 0, '2021-12-05 00:58:54', '2021-12-01 14:57:19', '2021-12-05 00:58:54', 'name in Enpng'),
(25, 'Baby-Kids', 'أطفال', 'atfal', 0, 0, '2022-01-18 00:48:54', '2021-12-21 17:30:24', '2022-01-18 00:48:54', 'Baby-Kids1640079988.png'),
(26, 'Food', 'طعام', 'taaam', 0, 0, '2022-01-18 00:48:50', '2021-12-21 17:30:57', '2022-01-18 00:48:50', 'Food1640079057.png'),
(27, 'Stationery', 'قرطاسيه', 'krtasyh', 0, 0, '2022-01-18 00:48:47', '2021-12-21 17:32:25', '2022-01-18 00:48:47', 'Stationery1640079145.png'),
(28, 'Books / Music', 'كتب / موسيقى', 'ktb-mosyk', 0, 0, '2021-12-21 17:44:22', '2021-12-21 17:41:23', '2021-12-21 17:44:22', 'Books / Music1640079804.png'),
(29, 'Books-Music', 'كتب وموسيقي', 'ktb-omosyky', 0, 0, '2022-01-18 00:48:37', '2021-12-21 17:44:40', '2022-01-18 00:48:37', 'Books-Music1640079939.png'),
(30, 'shoes', 'احذية', 'ahthy', 0, 3, '2022-02-12 21:52:55', '2021-12-21 17:49:15', '2022-02-12 21:52:55', 'shoes1640080155.png'),
(31, 'Accessories', 'اكسسوارات', 'akssoarat', 0, 3, '2021-12-21 18:22:12', '2021-12-21 17:50:41', '2021-12-21 18:22:12', 'Accessories1640080241.png'),
(32, 'bage', 'شنط', 'shnt', 1, 23, NULL, '2021-12-21 17:51:37', '2022-04-20 04:05:32', 'bage1640080297.png'),
(33, 'Makeup', 'مكياج', 'mkyag', 0, 1, '2022-02-12 22:25:35', '2021-12-21 18:14:54', '2022-02-12 22:25:35', 'Makeup1640081694.png'),
(34, 'Body-Hair', 'شعر الجسم', 'shaar-algsm', 0, 15, '2022-02-12 22:42:11', '2021-12-21 18:16:24', '2022-02-12 22:42:11', 'Body-Hair1640081882.png'),
(35, 'Accessories', 'اكسسوارات', 'akssoarat', 0, 0, '2022-01-18 00:48:44', '2021-12-21 18:21:39', '2022-01-18 00:48:44', 'Accessories1640082099.png'),
(36, 'Men\'s perfume', 'عطور رجالي', 'aator-rgaly', 0, 3, '2022-02-12 22:24:44', '2021-12-21 18:37:11', '2022-02-12 22:24:44', 'Men\'s perfume1640083031.png'),
(37, 'Western clo', 'ملابس النساء', 'mlabs-alnsaaa', 0, 1, '2022-02-12 20:24:15', '2022-02-12 20:23:44', '2022-02-12 20:24:15', 'Western clo1644668624.jpg'),
(38, 'ALL', 'الكل', 'alkl', 9, 1, NULL, '2022-02-12 20:49:53', '2022-05-07 16:01:16', 'closes1644675821.jpg'),
(39, 'lingerie', 'لانجري', 'langry', 2, 1, '2022-04-20 04:06:20', '2022-02-12 21:20:00', '2022-04-20 04:06:20', 'home clothes1644672000.png'),
(40, 'summer clothes', 'ملابس صيفي', 'mlabs-syfy', 3, 1, NULL, '2022-02-12 21:21:38', '2022-05-15 12:41:20', 'winter clothes1644675753.png'),
(41, 'outdoor pants', 'بناطيل خروج', 'bnatyl-khrog', 0, 1, '2022-03-01 21:07:54', '2022-02-12 21:22:51', '2022-03-01 21:07:54', 'outdoor pants1644675504.jpg'),
(42, 'sport pants', 'بناطيل رياضية', 'bnatyl-ryady', 0, 1, '2022-03-01 21:08:05', '2022-02-12 21:23:32', '2022-03-01 21:08:05', 'sport pants1644675402.jpg'),
(43, 'shoes', 'احذية', 'ahthy', 0, 0, '2022-04-17 11:05:53', '2022-02-12 21:25:53', '2022-04-17 11:05:53', 'shoes1644742408.jpg'),
(44, 'Women\'s shoes', 'احذية حريمي', 'ahthy-hrymy', 0, 43, '2022-04-20 03:55:35', '2022-02-12 21:27:33', '2022-04-20 03:55:35', 'Women\'s shoes1644675242.jpg'),
(45, 'Men Shoes', 'احذية رجالي', 'ahthy-rgaly', 0, 43, '2022-04-20 03:55:23', '2022-02-12 21:27:56', '2022-04-20 03:55:23', 'Men Shoes1644675194.jpg'),
(46, 'My children\'s shoes', 'احذية اولاد', 'ahthy-aolad', 0, 43, '2022-04-20 03:55:38', '2022-02-12 21:28:39', '2022-04-20 03:55:38', 'My children\'s shoes1644675654.jpg'),
(47, 'baby girls shoes', 'احذية بنات', 'ahthy-bnat', 0, 43, '2022-04-20 03:55:42', '2022-02-12 21:29:13', '2022-04-20 03:55:42', 'My baby girls shoes1644675559.jpg'),
(48, 'Men\'s pants', 'بناطيل رجالي', 'bnatyl-rgaly', 0, 3, '2022-03-01 21:06:07', '2022-02-12 21:54:51', '2022-03-01 21:06:07', 'Men\'s pants1644674091.jpg'),
(49, 'track pants', 'بناطيل رياضية', 'bnatyl-ryady', 0, 3, '2022-03-01 21:06:29', '2022-02-12 21:55:17', '2022-03-01 21:06:29', 'track pants1644674117.jpg'),
(50, 'clothes', 'ملابس', 'mlabs', 0, 3, '2022-04-20 03:55:47', '2022-02-12 21:55:40', '2022-04-20 03:55:47', 'clothes1644674140.jpg'),
(51, 'princesses show', 'عرض الاميرات', 'aard-alamyrat', 3, 4, NULL, '2022-02-12 22:03:52', '2022-08-27 18:48:18', 'girls clothes1644674632.jpg'),
(52, 'Boys clothes', 'ملابس اولاد', 'mlabs-aolad', 0, 4, '2022-04-17 11:06:49', '2022-02-12 22:04:22', '2022-04-17 11:06:49', 'Boys clothes1644674662.jpg'),
(53, 'toys', 'العاب اطفال', 'alaaab-atfal', 0, 4, '2022-02-12 22:42:47', '2022-02-12 22:05:59', '2022-02-12 22:42:47', 'toys1644674759.jpg'),
(54, 'baby', 'شباصة اطفال', 'shbas-atfal', 0, 4, '2022-03-01 21:07:39', '2022-02-12 22:08:26', '2022-03-01 21:07:39', 'baby1644674906.jpg'),
(55, 'mackup', 'مكياج', 'mkyag', 0, 0, '2022-04-17 11:05:53', '2022-02-12 22:26:08', '2022-04-17 11:05:53', 'mackup1644742303.jpg'),
(56, 'bags & shoes', 'شنط واحذية', 'shnt-oahthy', 0, 0, NULL, '2022-02-12 22:26:31', '2022-05-28 13:19:48', 'bags & shoes1653733188.jpg'),
(57, 'women', 'حريمي', 'hrymy', 1, 56, NULL, '2022-02-12 22:26:53', '2022-04-20 04:05:32', 'women1644676013.jpg'),
(58, 'mens', 'رجالي', 'rgaly', 0, 56, '2022-04-17 11:06:49', '2022-02-12 22:27:11', '2022-04-17 11:06:49', 'mens1644676031.jpg'),
(59, 'mens bags', 'شنط رجالي', 'shnt-rgaly', 0, 23, '2022-04-17 11:06:49', '2022-02-12 22:29:30', '2022-04-17 11:06:49', 'mens bags1644676170.jpg'),
(60, 'white gold', 'ذهب ابيض', 'thhb-abyd', 0, 15, '2022-04-17 11:06:49', '2022-02-12 22:31:23', '2022-04-17 11:06:49', 'white gold1644676283.jpg'),
(61, 'gold', 'ذهب اصفر', 'thhb-asfr', 0, 15, '2022-04-17 11:06:49', '2022-02-12 22:32:37', '2022-04-17 11:06:49', 'gold1644676357.jpg'),
(62, 'Evening Dresses', 'فساتين سهره', 'fsatyn-shrh', 0, 1, '2022-02-20 22:37:04', '2022-02-12 22:43:42', '2022-02-20 22:37:04', 'Evening Dresses1644677022.jpg'),
(63, 'abaya', 'عبايات', 'aabayat', 10, 1, NULL, '2022-02-12 22:44:48', '2022-04-20 04:05:32', 'abaya1644677088.jpg'),
(64, 'baby shose boy', 'احذية رضع اولاد', 'ahthy-rdaa-aolad', 0, 4, '2022-04-17 11:06:49', '2022-02-12 22:47:10', '2022-04-17 11:06:49', 'baby shose1644677230.jpg'),
(65, 'Boys clothes', 'ملابس اولاد', 'mlabs-aolad', 4, 4, NULL, '2022-02-12 22:47:55', '2022-04-20 04:05:32', 'Boys clothes1650391115.jpg'),
(66, 'babay boy closes', 'ملابس رضع اولاد', 'mlabs-rdaa-aolad', 0, 4, '2022-04-17 11:06:49', '2022-02-12 22:48:35', '2022-04-17 11:06:49', 'babay boy closes1644677315.jpg'),
(67, 'baby girl shoes', 'احذية رضع بنات', 'ahthy-rdaa-bnat', 0, 4, '2022-04-17 11:06:49', '2022-02-12 22:51:05', '2022-04-17 11:06:49', 'baby girl shoes1644677465.jpg'),
(68, 'dress', 'فساتين', 'fsatyn', 11, 1, NULL, '2022-02-13 17:55:45', '2022-04-20 04:05:32', 'dress1644746145.jpg'),
(69, 'Tops', 'ملابس علوية', 'mlabs-aaloy', 4, 1, NULL, '2022-02-13 19:24:15', '2022-04-20 04:05:32', 'Tops1644751455.jpg'),
(70, 'pants', 'بناطيل', 'bnatyl', 5, 1, NULL, '2022-02-13 19:25:01', '2022-04-20 04:05:32', 'bottoms1644751501.jpg'),
(71, '2-piece set', 'طقم قطعتين', 'tkm-ktaatyn', 8, 1, NULL, '2022-02-13 19:26:08', '2022-04-20 04:05:32', '2-piece set1644751568.webp'),
(72, 'jumpsuit', 'جمبسوت', 'gmbsot', 6, 1, NULL, '2022-02-13 19:30:26', '2022-04-20 04:05:32', 'jumpsuit1644751826.webp'),
(73, 'Women\'s suits', 'بدل واطقم', 'bdl-oatkm', 7, 1, NULL, '2022-02-13 19:31:21', '2022-04-20 04:05:32', 'Women\'s suits1650391437.jpg'),
(74, 'beachwear', 'ملابس بحر', 'mlabs-bhr', 1, 1, NULL, '2022-02-13 19:32:19', '2022-04-20 04:05:32', 'beachwear1644751939.jpg'),
(75, 'bottoms', 'ملابس سفلية', 'mlabs-sfly', 0, 3, '2022-04-17 11:06:49', '2022-02-13 19:34:17', '2022-04-17 11:06:49', 'bottoms1644752057.webp'),
(76, 'Tops', 'ملابس علوية', 'mlabs-aaloy', 0, 3, '2022-04-17 11:06:49', '2022-02-13 19:35:48', '2022-04-17 11:06:49', 'Tops1644752148.jpg'),
(77, 'brushes', 'فرش', 'frsh', 0, 55, '2022-04-17 09:18:56', '2022-02-13 20:13:10', '2022-04-17 09:18:56', 'brushes1644754390.jpg'),
(78, 'Tyler Miranda', 'Joelle Hopper', 'joelle-hopper', 0, 56, '2022-04-17 09:18:49', '2022-03-30 02:41:31', '2022-04-17 09:18:49', 'Tyler Miranda1648572091.png'),
(79, 'baby clothes', 'ملابس رضع', 'mlabs-rdaa', 2, 4, NULL, '2022-04-20 03:59:58', '2022-04-20 04:05:32', 'baby clothes1650391198.jpg'),
(80, 'Children\'s Accessories', 'اكسسوارات اطفال', 'akssoarat-atfal', 1, 4, NULL, '2022-04-20 04:01:41', '2022-04-20 04:05:32', 'Children\'s Accessories1650391342.jpg'),
(81, 'home clothes', 'ملابس منزلية', 'mlabs-mnzly', 0, 1, NULL, '2022-04-20 04:08:29', '2022-04-20 04:08:29', 'home clothes1650391709.jpg'),
(82, 'Jackets and coats', 'جواكيت ومعاطف', 'goakyt-omaaatf', 0, 1, NULL, '2022-04-21 08:06:07', '2022-04-21 08:06:07', 'Jackets and coats1650492367.jpeg'),
(83, 'Women', 'النساء', 'alnsaaa', 0, 15, '2022-05-28 13:38:20', '2022-05-11 18:50:54', '2022-05-28 13:38:20', 'default.svg'),
(84, 'confusing ages', 'اعمار محيرة', 'aaamar-mhyr', 0, 4, NULL, '2022-05-19 12:40:05', '2022-05-19 12:43:24', 'default.svg'),
(85, 'Shirts & blouses', 'قمصان وبلايز', 'kmsan-oblayz', 0, 1, NULL, '2022-05-22 12:32:53', '2022-05-22 12:32:53', 'default.svg'),
(86, 'perfume', 'عطور', 'aator', 0, 0, NULL, '2022-05-28 13:24:20', '2022-05-28 13:24:20', 'perfume1653733460.png'),
(87, 'ALL', 'الكل', 'alkl', 0, 15, NULL, '2022-05-28 13:26:30', '2022-05-28 13:26:30', 'default.svg'),
(88, 'high fashion', 'اخر صيحات الموضة', 'akhr-syhat-almod', 0, 15, NULL, '2022-05-28 13:32:47', '2022-05-28 13:39:35', 'default.svg'),
(89, 'sports clothes', 'ملابس الرياضه', 'mlabs-alryadh', 0, 15, NULL, '2022-05-28 13:36:05', '2022-05-28 13:36:05', 'default.svg'),
(90, 'home clothes', 'ملابس المنزل', 'mlabs-almnzl', 0, 15, NULL, '2022-05-28 13:36:37', '2022-05-28 13:36:37', 'default.svg'),
(91, 'beachwear', 'ملابس البحر', 'mlabs-albhr', 0, 15, NULL, '2022-05-28 13:37:05', '2022-05-28 13:37:05', 'default.svg'),
(92, 'orders', 'علي الطلب', 'aaly-altlb', 0, 4, NULL, '2022-08-27 18:34:07', '2022-08-27 18:34:07', 'default.svg');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `message`, `created_at`, `updated_at`, `title`) VALUES
(152, 'bhhhhh', 'kusaq8@gmil.com', 'jejsjje', 'Bsbbsbs', '2022-03-21 20:49:06', '2022-03-21 20:49:06', 'سوال عن فستان بشريط A بتفاصيل حجر الراين'),
(153, 'تا', 'a@gmail.com', '555', 'hhggf', '2022-03-29 22:08:15', '2022-03-29 22:08:15', 'سوال عن فستان بشريط A بتفاصيل حجر الراين'),
(154, 'nermeen', 'gg@gmail.com', '99558860', 'what material of this product', '2022-04-14 20:46:36', '2022-04-14 20:46:36', 'سوال عن فستان محجبات'),
(155, 'nn', 'nn@gmail.com', '44444444', 'fffffffffffffffffffffffffffffffffffff', '2022-04-14 21:11:31', '2022-04-14 21:11:31', 'سوال عن أطقم بدلات نسائية الثنية سستة الصاف أنيق'),
(156, 'mmm', 'mh.1983@hotmail.com', '97244282', 'asb', '2022-04-17 09:39:10', '2022-04-17 09:39:10', 'سوال عن بنطلون بساق واسع زرار وهمي خصر عالي');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT 1,
  `code_phone` varchar(50) NOT NULL,
  `count_number_phone` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `flag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name_ar`, `name_en`, `slug`, `currency_id`, `code_phone`, `count_number_phone`, `deleted_at`, `created_at`, `updated_at`, `flag`) VALUES
(1, 'الجزائر', 'Algeria', 'algeria', 1, '+213', 9, NULL, '2021-10-18 11:41:55', '2021-11-03 06:08:58', 'yemen.png');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 0,
  `min_price` double NOT NULL DEFAULT 0,
  `limit` int(11) NOT NULL DEFAULT 1,
  `limit_user` int(11) NOT NULL DEFAULT 1,
  `use` int(11) NOT NULL DEFAULT 0,
  `brand_id` int(11) NOT NULL DEFAULT 0,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_discount` enum('price','percentage') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `code`, `is_active`, `discount`, `min_price`, `limit`, `limit_user`, `use`, `brand_id`, `admin_id`, `end_date`, `created_at`, `updated_at`, `type_discount`) VALUES
(4, 'كوبون الأعياد', '123456', 1, 20, 100, 100, 1, 0, 0, 2, '2021-12-30', '2021-11-30 23:53:47', '2021-12-01 00:09:09', 'price'),
(6, 'hamza', 'BLUE2020', 1, 10, 100, 10000, 1, 0, 0, 2, '2022-01-02', '2021-12-03 00:11:10', '2022-04-06 09:40:17', 'percentage'),
(7, 'مالتي', 'dalia2022', 1, 10, 50, 100, 1, 0, 0, 2, '2022-06-30', '2022-04-17 09:28:44', '2022-06-05 19:59:59', 'price'),
(8, 'خصم مالتي', 'yomna2022', 1, 10, 50, 1000, 1, 0, 0, 2, '2022-06-15', '2022-04-28 05:03:28', '2022-06-05 19:50:34', 'price'),
(24, 'Gay Garrett', 'Ullamco consequatur', 1, 75, 482, 94, 1, 0, 0, 2, '1988-09-28', '2022-07-05 16:25:15', '2022-07-05 16:25:15', 'price');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` varchar(191) NOT NULL,
  `code_en` varchar(191) NOT NULL,
  `code_ar` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `rate`, `code_en`, `code_ar`, `created_at`, `updated_at`) VALUES
(1, 'دينار جزائري', '1', 'DZD', 'د.ج', '2021-11-16 19:10:04', '2021-12-30 17:48:21');

-- --------------------------------------------------------

--
-- Table structure for table `designs`
--

CREATE TABLE `designs` (
  `id` int(11) NOT NULL,
  `user_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `email` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `design_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `designs`
--

INSERT INTO `designs` (`id`, `user_name`, `status`, `email`, `phone`, `design_name`, `note`, `updated_at`, `created_at`) VALUES
(2, 'ahmed2', 1, 'no@gmail.com2', '25454875542', 'تصميم شبابي2', 'تصميم لشباب كجول رجالي2', '2022-03-28 15:59:38', '2022-03-28 15:59:38'),
(6, 'jsjsj', 1, 'kusaq8@gmil.com', '97244282', 'hshs', 'Hhhh', '2022-03-31 22:20:18', '2022-03-30 06:30:54'),
(7, 'ahmed2', 1, 'no@gmail.com2', '25454875542', 'تصميم شبابي2', 'تصميم لشباب كجول رجالي2', '2022-04-06 08:20:30', '2022-04-02 19:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `design_images`
--

CREATE TABLE `design_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `src` varchar(100) NOT NULL,
  `design_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `design_images`
--

INSERT INTO `design_images` (`id`, `src`, `design_id`) VALUES
(456, 'public/assets/images/designs/1_0_1648457958.jpg', 1),
(457, 'public/assets/images/designs/1_1_1648457958.jpg', 1),
(458, 'public/assets/images/designs/2_0_1648457978.jpg', 2),
(459, 'public/assets/images/designs/2_1_1648457979.jpg', 2),
(460, 'public/assets/images/designs/5_0_1648506679.jpg', 5),
(461, 'public/assets/images/designs/5_1_1648506679.jpg', 5),
(462, 'public/assets/images/designs/5_2_1648506679.jpg', 5),
(463, 'public/assets/images/designs/6_0_1648585854.jpg', 6),
(464, 'public/assets/images/designs/6_1_1648585854.jpg', 6),
(465, 'public/assets/images/designs/6_2_1648585854.jpg', 6),
(466, 'public/assets/images/designs/7_0_1648893178.jpg', 7),
(467, 'public/assets/images/designs/7_1_1648893180.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `design_ratings`
--

CREATE TABLE `design_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `design_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `design_ratings`
--

INSERT INTO `design_ratings` (`id`, `rating`, `comment`, `status`, `created_at`, `updated_at`, `design_id`, `user_id`) VALUES
(161, 5, 'good', 1, NULL, NULL, 1, 2),
(162, 4, 'good', 1, NULL, NULL, 1, 3),
(163, 5, 'التصميم جيد جدا', 1, NULL, NULL, 2, 202),
(165, 5, 'التصميم جيد جدا', 1, NULL, NULL, 2, 202),
(166, 5, 'التصميم جيد جدا', 1, NULL, NULL, 2, 202),
(184, 4, 'good', 1, NULL, NULL, 2, 186),
(185, 5, 'ممتاز', 1, NULL, NULL, 6, 186),
(192, 5, 'ممتاز', 1, NULL, NULL, 3, 203);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fcm_tokens`
--

CREATE TABLE `fcm_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(350) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fcm_tokens`
--

INSERT INTO `fcm_tokens` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(7, 194, 'c9FHNN5rQlyaM07Didfkl_:APA91bH_OC2-rosOjc94CN2FpkvWuUO4hnPTV_gV2ARBBCMTSeulb70t9Q27iUIcQtMGMB0cEYFHg99Yh69YcYAxxGf4KQxBX3mVst-I3adSQGtzSw3E-M5Q_G7Wwfc-q47fQwY6FrLE', '2022-07-04 22:58:21', '2022-07-25 14:51:23'),
(8, NULL, 'f25ex1CJR3Cz8rsHeDQwNk:APA91bHhU98b3oCrOqKC63dCIbSNppinp5w6UyiZ6RiHfw-tQgsVg3Ei_C3Mo-Raew8VLCGcHSjgMOfYKnRKVgKA6mjtA9nN6eCR8pRnuHphNGl-p75BaaEva-O98naLjDQdYH81q7Xv', '2022-07-05 13:27:35', '2022-07-05 13:27:35'),
(9, NULL, 'cZL91zq0Ssa3pXbHdYBd7n:APA91bF_hmfZezf5GleQCxzpx4mPzXmUR63WZjhdeTbECFPF4mQ4kUXsqD_1KJsUiCKQiD63zxiEzFlJWW7nXoU0KiOc05BZ8HUApI8GM20hf3W3NEUwH-qkl1XEp_8oinaekVkWdYhx', '2022-07-05 14:53:40', '2022-07-05 14:53:40'),
(10, NULL, 'cw-0Q2aATRq7wa8bTiY6Bi:APA91bFhyhMWgDuFASZHuO3RbFZYi77epubF5T-1WuyIW_zYttWaXrq00nbLbo-JWK7aUkMhX8rxpOvPvVi5fdF2WrMr4p5y2JkT1WghZkJ9CycFWyh9Fw0PJWbw2rqVYPPjCYx9L2co', '2022-07-05 16:23:50', '2022-07-05 16:23:50'),
(11, NULL, 'e3bvIeCFSI-EUDmaJG6cD_:APA91bHoRfdn_zg2jjcDQcMHVvDlhxmz5gydj5aI2PKrAgBcM4y0QcakgfhI0RnwN3CRGcjf1ex7vCcrvQS4Z2H6GBaF4K5SD1UzaCu0-TGahOkb6EuVUWsNItuDT-kgua6PupIkRDgl', '2022-07-05 16:51:20', '2022-07-05 16:51:20'),
(12, NULL, 'evJtUalbSWmVH9H17dlF-N:APA91bG1kBHUa-OM3SFNEtAmrFBFZpv_wPw_ZKiCZmGfpwHyqkaQioBaDTbdDdXKA_zUmniq7uvM1iZEFvtNPN7-aC5QVr3PoF2t1XEtDL9GC05aoTARPmIEfou7Nt9bIfIODlFt9Duk', '2022-07-05 17:34:56', '2022-07-05 17:34:56'),
(13, NULL, 'c-RAU7GGR1-d9oH7mH0ojp:APA91bGIOX2px5PazRtkORAg0m_WqhjTQqwiN3uEN3rRP0yFaiax3llCNPcqN6JGe9fxkKI88nqd4843v9BJejLMY_t5wTCSTMFmyZ8ZXu9n7m_fyYKXAuUCl6-7X1ooRIPfpqYnqPbX', '2022-07-06 14:09:22', '2022-07-06 14:09:22'),
(14, NULL, 'fVahKj_lT-2pSE8k2mYU6o:APA91bEZPQLDnzqTQdXvUBLOc127Z833YaYQL9ChCGMy6NRjke0CSzRlUMqGc-0iE39E3TIUXRncqtDC-BkPhuGg6pj66RHkMGNXkFZwyjQM9eXcP_a2a0lpJ5_-IY6QlCOw69zDFzPa', '2022-07-06 15:37:46', '2022-07-06 15:37:46'),
(16, 203, 'caDzdspuikN9g3yug9-FdG:APA91bEnUZSl8U0Y8qQ49aIaZo0FXlRuvoL9Hd9ZVOzDbK3VwDM78_YOTU9eECv_an9GH8m2yeBcP82eLKxHmsTZfYW_xNAYpyjcA1SqHXhmt6bK-szruK2N6iuNKzjI3i7Cvnb5FhDL', '2022-07-11 13:59:37', '2022-07-26 14:34:04'),
(17, NULL, 'c36EvEpcReivmfehSgJ2Ha:APA91bEH60zgcLFOHAN7mBBVi3Ib9W96LaWpzyCEEN5BNwY5y6aQ_kCpVoT2oj0d91Vfb5XYmhV3Xg6MmoeNlNbeE2nawPQ2KIbEqtW9ef_WDmpbW_kTGWv9eCA8dk7f_HfvTFeOUuTp', '2022-07-12 20:22:20', '2022-07-12 20:22:20'),
(18, NULL, 'cdM64QS1TV2rNnyZ-eBXLy:APA91bF3XixWopy9qPylPEcwXyICVphIY6KqQvPfNl6_2zin504-N7nov12056dXZsrW647KRlRBiMO21yv7no9scRLvgZP2SGG-Ef4k2ABWmZw2AgLWdsPAnufrPcwlXoJEbi8Itzkh', '2022-07-17 15:00:56', '2022-07-17 15:00:56'),
(19, NULL, 'dgtoqB48RdSy-CIL7TbBR2:APA91bFty3KGQw88j_3FkRM2oCFzat8LCGi2rfEYDT16hIJ9I5xv9pC1JcOPW1tPyQFn7YNnhLizWE0sTocsTvJIZqRc2rhgpibobSRSIUYcvrzSprXKB1tV0Y82lr8O7AoYjV8rNnbq', '2022-07-17 16:11:09', '2022-07-17 16:11:09'),
(20, NULL, 'dP_4H2PeQuOXN-nv7gSImp:APA91bGb0YGoUSZjjoTSrfDe-rwiQz_JRXzK44sjFvJMB--a3RVJLQol3w7K3L5qaOymn5hf49QFJEv1SO541TUXz-0g-nE0Epe7xPZeQA1rprJMkV4rOKVfDMda6NzeYtO8uHG2_buc', '2022-07-17 16:26:54', '2022-07-17 16:26:54'),
(21, NULL, 'd4GMxgcOS0CV4ltWeEYjGA:APA91bF7Z_DQijEGHRtvuoUojCS08w6iEOG5ySsZUZ-b6uUIG7oN_O30Qo8uPv1Ra7j10dhmyhCOgCtlAZHFatMxjAgilSx8jhA6N5k2RGWI3pv-VE5FbtjJElm-hgdi4oXPxvbDN5lt', '2022-07-17 17:05:17', '2022-07-17 17:05:17'),
(22, NULL, 'fjKJ3ccai0ZXqJc9xpckH_:APA91bGy2ZpNn6AVwQu0izOLg-zPiJx-lA-ytvSxJkjrbZ5SKwZztW2Ni_RnYgim7-WL0HiJH5Lw6sqLGlYGuRh1VFuLU81ZLh5oaI2r_qNquGoo8_NbMWz022QCNNVA_8gsGI3hS2f9', '2022-07-17 18:24:39', '2022-07-17 18:24:39'),
(23, 207, 'cJHTtE4VhUmjqDpYlaFW2v:APA91bHxsYXR57MwEWfuDGfSzqCVrk4KaoBRmU1nbytRqMqRMTUGy0HQ-xv_sPt7fdLvVc7YP5wgbDNe9WdsKqdIukalmua0lCbLVoDrNUp5bo7rk9sA43o2pNuKJb1gRHXPn5LFtc5r', '2022-07-18 11:24:01', '2022-07-25 14:18:58'),
(24, NULL, 'e5AV0-9IRk2DS3YE9o1FOm:APA91bHGVI7dcifLevaShtRp_OsuCd6nltkyPzYpqXYtTjaqgcN6FyIZqD2iJlVYMQG4sJgEBkSAKgz_QRKeg0seAi3S95bMABJjAnbhdaExJFtrJjhD1M9R_vO3zIBbCSXqNW44RQfr', '2022-07-18 17:08:50', '2022-07-18 17:08:50'),
(25, NULL, 'dFd4OWvKQOqXcZy2Tpi5fZ:APA91bF8d3SSmF1cVUTUihOBOFC-c9UIFa2C-iHMUjuNF7IbXYK7GInbUmL8snDerpxplij3TPAnMMF7mroA-maGlmPYNfA95sAmLGfgvCjcMlNDrVF7s73phfD6rGsf1cXgQ1uPzCN4', '2022-07-18 20:14:31', '2022-07-18 20:14:31'),
(26, 270, 'fFQKzorlSj-KnoABVRQixh:APA91bFVDC8hacOXFBGw0y6ucnvPuF7Sc0514xVH07ibVfGFAtAhCHPyVQkhoKRz_CZ-OxeyVZtqFn8QxS-SuUYS6DtXCeRPd1B0dzlXeoNPuh0-uyW1Dqx-ktfVhYCGItmm5jSp3JZh', '2022-07-19 01:30:26', '2022-07-19 01:33:15'),
(27, NULL, 'dygeWyMvTmKUUEU_k7cDMn:APA91bG_lulBS3j--qNokdj2FQH5YaKdrvwpwKWtouMkKc-J65X7XVkoSEddVzWl21-LTqr2XvAIjyha41alCAYe0Y2kWL0utlrDxTfz-p_HPwHcdrdinE6290Ebmq63HyJdUAgidYwW', '2022-07-19 10:40:17', '2022-07-19 10:40:17'),
(28, NULL, 'c_LFf6fz-kUEtKcGcqgFea:APA91bHZDFzgPDapk8ldjesvYCZ11Nl-wBMnM9OaQJ9hHtb2L-e6vLQnihC4KvaJcYbhS8TCUYgGXgGBsnJMAeTHzxmrUnawkd9PuJnwd13u6EmH_e6K0eeMp0tG5IfHWTlV4tz7JRIO', '2022-07-19 13:57:05', '2022-07-19 13:57:05'),
(29, NULL, 'dTe1fhmX90MSuTHSyjh-jZ:APA91bHjWbqbVjrwlGn6LvwiNPdxVyNnLEH3WxuSd_MMMPrCFvV0oYtSRNFxnwQGKXOIlJOT7dW7-a4Qw6Ju7nHM0Ru0JQPF0PUmSums0CaOlRxUHslWqJaOI6GjxzvHKfQU4R118E2T', '2022-07-19 14:00:48', '2022-07-19 14:00:48'),
(30, NULL, 'clo5rjTXkEc2gJD3wmYZPT:APA91bE5RUVqUwg5ReHNB6CmiDufzhNZPipp0oGsQ5leRkmaRirBblPm3HANRh4jjkaDvZO-ttgkDkrsfI1CNAPtfQ-SyoqxizC9aY2JMXB8RoZk2s_btwnvtLMOif_LxQ9P2XwXYLUC', '2022-07-19 19:51:45', '2022-07-19 19:51:45'),
(31, 205, 'd0N_3bDKSRmuIpEViStZ7h:APA91bHkZW58gAfgitVZTOKk9OPRt7vL8n5BO8Vd4XrEt5Tr_4Uc3cdK32eOcbL9P1C_np3X0_seK4f9Ko7Z7QEPwgUwpVP5YcHSqLff9CDkkypj1O6dWXeHZvEustCQ-MUGdME9N_Qh', '2022-07-19 22:39:49', '2022-08-23 15:46:52'),
(32, NULL, 'dmb7DiEQQLWP34m9fD5-Lj:APA91bGFlhIWTstITRO9ezBBWtMPnUBFsyQyg-fZG4CEhBrbbX44UChz56r16nSNqtoxwadbS5tSqEAy_1gqED97ee0hqogBPHgtYrOM8xmNfyKa-4pV6M7tyiHudVPz-g4IgoSqvT1c', '2022-07-20 01:36:32', '2022-07-20 01:36:32'),
(33, NULL, 'cc0qJOtsRxqSqjVJVDY8-I:APA91bE1EXAEWMZQMr1BN0Xd-1TF_dCYiS81E54HgUgHwd-Zv_ZQa39PV6rkqpDX8cBH2-G_TRu3NOM_WvPEJCqWw135xbM9bqh3KFBZJ0fEyU2EHS864xkpHlpul3_8UmXZ2C8Vjb0z', '2022-07-20 10:55:48', '2022-07-20 10:55:48'),
(34, NULL, 'f0QH0Lr2JUadreg09HR0Ij:APA91bHoxz54V461jHMnT06wQgXzOpI9atuIQcdUFXk0sGuMGB-P-vin5B-zcWZpRJDsPIx-JvjdjauP1L98jrv9DV4zFdIz3LCeWhGg4485Im_aOjpwbRH3xMlS_m4UJ24aK4rJ2Ks8', '2022-07-21 00:28:00', '2022-07-21 00:28:00'),
(35, NULL, 'c3qNNYsST9-agSeaodECws:APA91bGiWgUz5JOEDe2EswVHtRTCbrnttDKHiPq6Jmrt7p4_eJeZxtX8N8yLPRY4YxEJExYdaB0FgUl10Jftzu4p8NY_758LDAlZjiyITQ69rb1lmQvdz-Pzd8yXy9uMIhdznARHsHBd', '2022-07-21 11:05:17', '2022-07-21 11:05:17'),
(36, NULL, 'fsq4U6S9SQu7x4r862yPhG:APA91bFVQDFt_xOl0_GD-YO9gbFWB_WdEQXO-SLySDcj5Sz9Ub6Wdln8RzZs8lYmmR2HPyZ5RG_tBQc_d1ojK7MHAwGrEiYuzwcNTQhqjKx_EQTONEOf--uoq5Fodo9O_2si4ZKf5ddM', '2022-07-22 17:49:43', '2022-07-22 17:49:43'),
(37, NULL, 'caDzdspuikN9g3yug9-FdG:APA91bEnUZSl8U0Y8qQ49aIaZo0FXlRuvoL9Hd9ZVOzDbK3VwDM78_YOTU9eECv_an9GH8m2yeBcP82eLKxHmsTZfYW_xNAYpyjcA1SqHXhmt6bK-szruK2N6iuNKzjI3i7Cvnb5FhDL', '2022-07-22 17:50:57', '2022-07-22 17:50:57'),
(38, NULL, 'eiA9nG94AUCNgKy8S1Bwpw:APA91bEeAB74c96wN_7S7NGUm7B0E37xzaXYs796lGMcma5a8i1SasNHcUUitqNXKFce8_Nb7f5F4eHrqCi9j8UZuqtNAR1c1AIcK9SB_CxBySzqPF3C_qZcDZ8TGo9Oew9egmnTicTp', '2022-07-23 11:29:58', '2022-07-23 11:29:58'),
(40, NULL, 'fIBNkULXQWePv5LbhlUulf:APA91bEeaXbEsP2tAqvMh0IcD1dCUHgsWPAoNhkQJlEbUh11eXc5Dv2_ObQRDQiWyrfK7KZL3mYXI7QhIsDm3OryBjG_0a2NO7aGx-gZffWhGNHZozyZjFeWU4YzVS-scWuxAkrJvi-g', '2022-07-23 14:10:30', '2022-07-23 14:10:30'),
(41, NULL, 'dxySVyFCTgKuTj3uddwhrJ:APA91bHHXYYcqSoXXAfIw3SbDjo872n-WCwzaqyimD_G2Abgv6fQLeYLuQw_6FlB1MiTSOJZEtl2dglODLg9JKzgkHxLJvyx9rDD4hJwWWeo6XqdrwvXLx42JtieuIh_NF0fuP-sVHKs', '2022-07-23 14:35:32', '2022-07-23 14:35:32'),
(42, 274, 'era0NBW-TvOQFnynUjTRMe:APA91bGQxmjII_je_kETbBzcwpxP-0pd0VwCF1bZGaBJgoZVdkP2JliLYw43A8SNG4BI2MUzsZsC2tW-ckbBFK8Q3JyOVRP9SmI3klgEPISLnwnGn60WY7NgSmYH6-Rex-stUGYWN8wB', '2022-07-23 15:43:32', '2022-07-26 23:01:57'),
(43, NULL, 'dII5pi9OQs2OGp-r3DRGJr:APA91bFvMFb067mSgjcRSUgxs7dVbvQu1g16WRXj8Icj6vsk20MD_JtC4Qm--l7OEjLPlOsQLRjActILtOpRNtuxM4jdiHqbDcmGmvKwWjeXhGGq8tB1tiC930X80Bc-6wXm7Vjenvow', '2022-07-24 10:38:39', '2022-07-24 10:38:39'),
(44, NULL, 'ff_DNO9LQSSBsFtOuncmm-:APA91bHmyALiZB1LYZNqOIOjrtu_-N6bRWLCIZbIUtsn2wRtfTGnqxEyu3ir00Qe2M8u0Ygh5Ww6miCVgQsXOQiUAqSK75QtsU1XBkgrkqQuvZaYuhdgVB19gbiuoCMxE4C--W1I8YuV', '2022-07-24 12:07:58', '2022-07-24 12:07:58'),
(45, NULL, 'fZUZPyaFOE7SltfV4RorPi:APA91bEI1AKXXl97gSKsWRUrQA_G2kK45PSbXf8lEcq5uqyDIWnPSZPsiD6gBMGADEZL41DZvBnFAypZbYXaU4OzeGc1KNie2U5a0C4c-xato_vubQ6SBTbm_-lHmNAYglXaprbLiai_', '2022-07-24 12:45:59', '2022-07-24 12:45:59'),
(46, NULL, 'f4-K5gtNSBaQRyaSJDBsyk:APA91bH4S7YwfPu19-ytwU2MHEIQ5Lp0Z7SNKSj76bK33fykpAQ202tr_HgQlUcnvQFsUf2ccMch5loZxPI0JSAOXleZrfuZeIsh5XfHv2W9eEdvtEvf1wJPtpaLljWeeXsqVPqmCfI-', '2022-07-25 10:46:22', '2022-07-25 10:46:22'),
(47, NULL, 'ci6AkX6LSYWvjncNqWhvaP:APA91bGmg2N3HM5c_C5TvNZn247BsHXXt73nNYwtxxmRcU5Nf67mEuEfPgjlAFBnX_mWKKua7flBL1qnpY_ZYuD-tCeg4gQOPhiwat_QJu1sBtAuFx_V4wp0Vm7m4b1HF9-pRKvzK5BG', '2022-07-25 12:09:56', '2022-07-25 12:09:56'),
(48, NULL, 'fsTzOM3aQa-P7mxNkP5N-C:APA91bFj7P6osalO-JQtf6jM8iudI03D59Pyzgw1FhTbmPRG4IoDyguxQotdeVsRC7s_bg44XjEJHl8YgXFXPRWbycYW-AkVr6yqTOmm9YxswhW1pFcE87lz3-eEa-nt8aVb34tAhcUv', '2022-07-25 12:36:19', '2022-07-25 12:36:19'),
(49, NULL, 'caoRKAkoRUPduHYHp-pwmC:APA91bHTjLLZwlzvkTBd7LR6d03CtiKuX7dTw_eP1DYcEjKyUa6F_2M4HmJRjnu4lG8ihNUj97O4nVy5YkAvinW7R4zHxDnrHSgZWixkwfK8xn93A_l3DHmGyIRFFdN-sV3xL7l-xVfc', '2022-07-25 13:34:31', '2022-07-25 13:34:31'),
(50, NULL, 'cJHTtE4VhUmjqDpYlaFW2v:APA91bHxsYXR57MwEWfuDGfSzqCVrk4KaoBRmU1nbytRqMqRMTUGy0HQ-xv_sPt7fdLvVc7YP5wgbDNe9WdsKqdIukalmua0lCbLVoDrNUp5bo7rk9sA43o2pNuKJb1gRHXPn5LFtc5r', '2022-07-25 14:05:49', '2022-07-25 14:05:49'),
(51, NULL, 'c9FHNN5rQlyaM07Didfkl_:APA91bH_OC2-rosOjc94CN2FpkvWuUO4hnPTV_gV2ARBBCMTSeulb70t9Q27iUIcQtMGMB0cEYFHg99Yh69YcYAxxGf4KQxBX3mVst-I3adSQGtzSw3E-M5Q_G7Wwfc-q47fQwY6FrLE', NULL, NULL),
(52, NULL, 'cbg7NiMhRWG5mZf2SuIlju:APA91bGoWVm5uxuL0ltjMZLzMv3HIexQEsdTTtusiH-kFCCaAWRY4f2m4XCOBxG_duVrnyTnK6IYwhFalIChuNxok9kZPfImNDrlTFgmyK06nlwwYqeg-vSr-fEsVGw-P-dTIaO9csvT', '2022-07-25 19:12:25', '2022-07-25 19:12:25'),
(53, NULL, 'd06cxgB0TkJfswYdLVbmGJ:APA91bH7maLlJMOqt_A-8KjNE4KN2f9osvrbJhd7OEIIaar7e8Tkc_V9-FbZm9LKyYE7zWIF_8mr7R5ugmio4nninV6i-FXj-xRJxrNHVU-MI5BfaRfD5-5Ogy2XBFgjS31Dayz1yb5b', '2022-07-25 21:34:00', '2022-07-25 21:34:00'),
(55, NULL, 'cKW5gjpBLk1HkkaLcCIql5:APA91bE-Ms0uy62mmVeEjC8SbRoyaB45bBVb4YPOiqjY--NoD4ghLAB_1TvVMFJ1XNPxCvzGpJDtnMCfEJllVH8ADy_J8PD1tXWm-tnxkoOyIWNJHPXhChKR2bklcC9jNw8p4v7yWXWM', '2022-07-26 16:40:22', '2022-07-26 16:40:22'),
(56, NULL, 'dyDn7DwgwUpfkzTLwZkc5W:APA91bEOzPSt-m7nKe1z1-BaLYGLSi4Qyc6jiX3IuED_A_0e8lWEcM32-n30ehNLG6wFOCumGIzqC7r3VNXikxLLiQn0BRuo3A67ietoHLPngaNMvdUyNPVvt0uCDscrHov41DP2l44w', '2022-07-26 16:40:35', '2022-07-26 16:40:35'),
(57, NULL, 'd46r1QDJYE98tEO0Hk7gTq:APA91bG7FY5gyTS3iILRbSzJAydq8acEjfJNaVZfObMOSF-EtlEcWLprr1RjsUPHPclYNssQCTJt0hbbZMA_HjyMqeTdAagFvUiE-4LJ36HIXtHr7k8As4qeshUxHg0UP2c9bABi-GRc', '2022-07-26 20:52:50', '2022-07-26 20:52:50'),
(58, NULL, 'eIpNvesQcEAIhOan2QhYcI:APA91bH6TGfiHkVowzz84aNPO5s2NcdKOyzVkRkPbsyu1mR_r3abEgPiyY9SRByyoKwucgZE60RmfXj-izEfHFdXpOTXSxBD6KNVQCObSDKMxAwoc6BfKSHmNwFQ4gugBxyHlBdJI5oe', '2022-07-28 09:20:56', '2022-07-28 09:20:56'),
(59, NULL, 'eXYfjqLlpE1IrnxDW2LbsY:APA91bFVVMdrYTDst-5P4dj0jlOElRonTYi0tRPVPrFSjYG7IeCvSMNkKOgog1oTTa2hJb7n01wwp5RgGnFme-h6d3tqBIfT41jILDF85_mGnHkTlIWi-u1jfEgbadztyaAB7DjGT_2P', '2022-07-28 10:29:46', '2022-07-28 10:29:46'),
(60, NULL, 'cZmePl4VfUyrmsr_8ETlQi:APA91bFBQprPxM_FMpgY033z4j_CWrFPzrRACZgIwt0jHuuQYbGjaFPa_82cg3j8sqEH1I164go8lP58KAViohvsV_Z6SbmS7WxKcw6uwAqGiAS1ux4k4fqYjfV9DA3jVMyg98eBw-Ca', '2022-07-28 14:30:35', '2022-07-28 14:30:35'),
(61, NULL, 'dy3xLDseRbSr-BTyvgKo2a:APA91bG-IV1L4DvzA6hEi4LJLeVofy1mjsRvKbHHGWUHk50jp_FNwW8ea58FHYkavbOMehHlSCR4XAvMOeTrJgEIli9rc-MgYnlSM-nYRVmVd2a4BmyUJF8OtvkHo5JF1D5QG12vAMPG', '2022-07-28 15:53:14', '2022-07-28 15:53:14'),
(62, 277, 'coRuOUxwG0Romout-w4Rkp:APA91bFgAUwtTzxqaZS1nq8vfh4qnd_vnGdoCOnP7G0alowiCdAl7iRpLBqNjTMtJFsgNQpueYNo7QcdoYmjIMW2DILqpr3VsSPWq7-pZYV1R7Xy6h9rindZ5k--OBEwCN0R7A8e-VZH', '2022-07-31 01:20:14', '2022-07-31 01:21:29'),
(63, NULL, 'f7VTvC51wUj_vctz2TSwLn:APA91bF88Lti1FxExSfFX4fTGM5HicLOAS66EM163Uh-PggfHAUAynbzAkP7yKdRR-FELXFOpxctwV5MGJirFSBZZt2zSQsX4RIYKn7EnAqT_h7JzARZWnueGeSEcgYxtPGolY8j-V4i', '2022-07-31 08:20:54', '2022-07-31 08:20:54'),
(64, NULL, 'dFIKmB0S_kZun1erdDDUly:APA91bFbwQEStuHnEjTiudQPW4VFsMHc_MkeiMwmKPOdwSfglMGoAXNyeKVKY7NeAd06sMhM_gSeq4Au-dahVMgRli8GzVDcL306UTZeBdo07015O3oP1xJ5SmiVzR_rq72EBusS-VUJ', '2022-08-01 18:36:57', '2022-08-01 18:36:57'),
(65, NULL, 'dwema9hnDkXKmScxgkSVTL:APA91bGSSh0MmwQDBWSX_MNYvibVBSVvok5bQ-9eIEjd-H-GvRkXA_z9aazh5rHs049q5_6f_C1bMxA3UoXsA3R-Cwj0AvLc48ubf4Gp5LQrsmBPDm6hz_25DZthhJr2VXofO2OlPAem', '2022-08-01 23:52:32', '2022-08-01 23:52:32'),
(66, NULL, 'f4csJjLVQRWLYzr73TKJGV:APA91bEoSACHJyf-9WiGJqu0s3OytTPrGiy5uT7qAck-2ouXaxBREuZDlC4fCecdW9qJRMqowC-gVVedqUQkctO1i1sFFu0yJz8Qx_suBa_kBByeNqVoZmuM-wTqEhWxYJQrOv_8uY-o', '2022-08-02 10:14:59', '2022-08-02 10:14:59'),
(67, NULL, 'ca8RQRAwmUgUrAAFNQO4H5:APA91bENxoYYF4BzmKy2pVnkyN3Ug-vrSswroCB-cdgGk1Wd_jFygnUF7F0-YbskHIpBMJNkZ5dYwuJZ6Ot4Rtm2XyYwtR51UCs3VZfom5MzEMW2jREISGs9Ed27Tbq_TUqFENDwWG1G', '2022-08-02 17:43:22', '2022-08-02 17:43:22'),
(68, NULL, 'edXJHjumZEYpjwPg0NhfNg:APA91bHC7HjkOWkdzAjzv19Th6mlwrThAwkOwiGIod0J3uqdoj4kf6zNi8bVAu-m0XJVUeLginxiu0oXqC26IHDPWnzJL8xItz9Ku74s-YU8g7XOemiS83eOKN2GcZ7unHKLGuyTIL-1', '2022-08-04 08:52:41', '2022-08-04 08:52:41'),
(69, NULL, 'fd_MsJ0cGkjrhdqOapEacA:APA91bH9C_73vyKGHZwk1frfO1z2F1cxEPDJ-6-ERJM-BvU2FQixHe8FzM1mKbvlI-7aG_jGmQz5am9kvIMgJuIMqGWlfaQ13BSJ77eOUEEZFzzsXakQy-Aygi8FnWyZFLFfJdR4f8EN', '2022-08-06 17:21:41', '2022-08-06 17:21:41'),
(70, 278, 'eBZArUKW3U40ng50WcT465:APA91bELAa7ywyNY1Q7UNdV3_P_8gbdE8Ti4gx5uJtHi1CKaVQsXV_w3hEC4TSA1dWGUu2LogYf4uPfDx2fpzvtI6JM88Zr20n1glN9F5oMV4KxZPYFQNrSpDyNTcFsP7PwTB8KpdQiw', '2022-08-06 19:39:54', '2022-08-06 19:40:50'),
(71, NULL, 'd5KsO9qnv0ZHg_NBdl_7Mk:APA91bEbxm69kSIbmumuIoScvXq6EF-QhWTUQlNla6hhcfnLDeDRKHDM-q0jqkI9XJ6AO-iENWAPR5E1n7yLI1htsJzCwGaYxlbaFK7A2W4k2C2uMbS6IvVWtffHVujMuoopaP7HTV--', '2022-08-07 02:36:47', '2022-08-07 02:36:47'),
(72, NULL, 'fHIqL3Siw0afq-jcgvc-2s:APA91bFYIkgFx2wBzki1DqrcY1B9N6jvziMess3SozGIc6fbzyXKJL6VKCyp9E3F7Q1h4jyvgTf6V_HddZBhzBourflBgjT35xed5toEz2RiwR_NItc3IKXa5-ZIRY3MKzXoPX8SzoRK', '2022-08-08 08:28:02', '2022-08-08 08:28:02'),
(73, NULL, 'd29ntNHA-km5kfrUgHDfqB:APA91bG1eJg6h4_04F8-hEJzX6ehhuTy_9rXoEsSWV4YTjZqsyxd2tLhqTHUJtimMXQfmLAPGF7xQkH4Jx_AFdjo7__ItF3YfbqquX5VX4Aml9xJuPycS7GFfhFUmq5oewXGxv0QNowK', '2022-08-08 10:49:59', '2022-08-08 10:49:59'),
(74, NULL, 'e71ljvE6KE78u06gdjjTo9:APA91bH8bMD4LAcf2GRr1oDMTXbJRgX22NAmWJgOn9LONLK7oCXm0vbjaMI4jQy4lq7YD1hzLhCxhJafZHG8PJ_jN2T3Fbj9V1dSSZJQuppFAxfBE39gPjOUY_-r4U6gp_HJOfU4Kly1', '2022-08-08 15:03:14', '2022-08-08 15:03:14'),
(75, NULL, 'fXTYebE-RZCpToNYxhUw9E:APA91bGRtxtLvQpgXB1k77dRdp-_S5yqmiujm5N3_XixQxxtlNy9SyvGl5ASZ1FVoUdc9R2WgEHnj8msW7lxM92dadzDLtVrHQDTiF5bwuMDjEGcYXpQdHyGq1TmWQOFBFseS6iIyf0G', '2022-08-09 13:24:06', '2022-08-09 13:24:06'),
(76, NULL, 'ewfeE0hpu00BmjnSo7EbEo:APA91bGQKKfuHMc565eWnzONri7a4AjDw1MJRtuYpsuTRk0sGJiPk29PjGpYwh4W1Fky9b_CCAFWTwccrtlsuQszHA2-ssuCrFFKo33wjeQMdjSIvVPmvyL9me7NSLL3v5jxlLppIwtF', '2022-08-10 19:33:44', '2022-08-10 19:33:44'),
(77, NULL, 'cNNLJ1psDUdDmHINPWTfyu:APA91bFyW2zWl3z5a4fiPPztvS94BkY3fdqO2_Tlpd63SmqvGMLfOZSCrSRb_BnC9OX8tIa7Gbr7B_I12c0MlDbQ_vw8tyQIPZXNoK5wP7DFh-h2pSxr4APvw2GfGQC9oRG-081-NQ-W', '2022-08-11 01:45:16', '2022-08-11 01:45:16'),
(78, NULL, 'dTyVINd6SKewAZ6A0APbME:APA91bFVhGM_N99RPnk5gtkfAmzLkp2Ei3BdMMG86ZE59hpdDwml4DHrX-vvLhRqSyRJ9YxizKDeK3pE20yDQq1bnHnlnTS00YCHV6u3SIx-QY4CK5x3cKjr8b6pFZ2e1POxDi0jaaX9', '2022-08-12 12:25:21', '2022-08-12 12:25:21'),
(79, NULL, 'ctFcun8wB0X6otuXg82H9y:APA91bG_M16qimwl9SFba7qL2pxH8MGdGOQkbBfRzcYoa4t741ueexd45VMOnW8CjPXWWKCZJgDbpJlDnEKSHk4iaeqIH7GbpGjDwp1a-BoTMVWtXnsbJh9Ory0R0JemG8hUZrgTxnLs', '2022-08-13 16:00:26', '2022-08-13 16:00:26'),
(80, NULL, 'dTQeWqGQJku4iy-2IK7TJh:APA91bGjMhcXzCD1Stkyh8WtHfZLjUrKXkeh19YgnFHR2CWVJQR-sQSzdVK75p-xNWz1eOHnS64qcd9iMdCLKP_LSsk6dtU0PGb4tVsz3C06Hh3isEjmAdBIZsRffVj-zlZFPmidmg_W', '2022-08-14 07:21:39', '2022-08-14 07:21:39'),
(81, NULL, 'fvWE72BYxEXqiKtaF0-ZBb:APA91bGXWfRnJyoFbvStbJq2n5J-1QaSPbyV2Z_hvjW5Rd87evuxGYHPmzC970YkFoZ8nOfenjNIEjyfU2xzXvTq7HfkMBKX9E_KpvKFgr-_DItphh2o02jSWz_QkMXoxLhvyhKN6hFY', '2022-08-14 15:13:59', '2022-08-14 15:13:59'),
(82, NULL, 'fOAHNwXhZ0QDjSEK6W69nr:APA91bHlxhWGzejtdZ9QNSYk5MfTb16gqDKaE67QhWLWgWlBKRIycNFx3gZgnc4TTno4Pvts4eu6M2OvPEvNYZFZxJaDIidpLeIdIElZ5G6m2-igCb2SczGO0uj43izG90vuYVNgyiic', '2022-08-14 20:42:59', '2022-08-14 20:42:59'),
(83, NULL, 'ftxpM-O9_UZpkEeMBG6jvM:APA91bHdQOnHBsVmokRczUwn0F7RF1ttwcIPg5wZoGac0x4cW44Dq_8LGaFcPZROXXQi_rGCn9TSuiccCleTGzf7EXw_40vQTO8yie9jn82Ke6cYH4MC-9tfmqx5fq-5mgccZNgYL6-Z', '2022-08-14 21:10:42', '2022-08-14 21:10:42'),
(84, NULL, 'dGmY5tZYSha1SfkOzLJm3_:APA91bERXqOZ-dn6bxZDNrLRtfuUK2IfFx_ACwke84T2jx5CbXQxqFfRe8BFNMiz06mG-v7E7SfZ4E1ekEdnHMC7M8MbAv0eTNOOgHVJcXNkZHaVrSBNuVFt8wP-Tj5fSYg7aE8m2Cev', '2022-08-15 14:30:55', '2022-08-15 14:30:55'),
(85, NULL, 'czOIdS9n5UPuo6UgU7fqAS:APA91bHQYJX8NzxgLBz8UvPyJj0818LiZIRl3BPSfdMh6LLB4AC6Rp2CvxQ_tvvEioDlzUZWlmJTF3W5nqHfIpr-h050-r4xfNq5cNsjV-j7f2pd_RJ4bDV022ZOqsRqRhoHEkYm3Yon', '2022-08-16 18:38:18', '2022-08-16 18:38:18'),
(86, NULL, 'doFjCORjQa-vFv9qCH0pE2:APA91bHgL0nLTWGdknyX3t7HfkSXnXcSxAUIxhERIwBiO3PK0ir_2I_myARkkx4XVoNsv-MU9XNJ-9s9Ch3u72vLMB39S8tRB8IMP5kT0ss1eqUYYf4_in4hJ_o99BWyPbRZP3KhrpZ7', '2022-08-17 10:32:29', '2022-08-17 10:32:29'),
(87, NULL, 'd_IBA_5pTp-h2KqeUrNpMf:APA91bHDKzboIVnC1pNkHpXH44S3_1qvyZyyI7WRqr2yd0NAqXZzfmkdfxhsQJgd6rQXyNtHhJ8mt41fhfzoruUcRtjQ-_fw7XVSBP2Fl-s88yBQ9gIJr9ghAEHZV2L3BhknFeLGpUrL', '2022-08-17 11:16:42', '2022-08-17 11:16:42'),
(88, NULL, 'chA2s4r5R1uI6puwaPeTTM:APA91bFmHw2LAf6-7zG0gO8qkYalNjr2c1N-D57m2F3RM0QwzKRIHL_S2CVtXRGNyjPulKPpV_8NFqZ_a9DJzVGvflH4ejXVveeCRCP0CA612w_iU0OGwUPX-C-Xt7uK6TWO9ZoU9fN2', '2022-08-17 11:26:17', '2022-08-17 11:26:17'),
(89, NULL, 'fxpdBhkvTfee3_EwMjm6CR:APA91bEpoUa3LM8eT55F-mJ1I-61YFIn9pZUX-JhmczCR6rFnA_VZ2Svf9kenQtWXExef0ZzMWCFovTTxJ5bXb9fYzYBfqpnbvjHbNXh0lswvjhRKp9NyYw4Go2A0cws-ojUuaTD3G5M', '2022-08-17 14:31:08', '2022-08-17 14:31:08'),
(90, NULL, 'd9Pncn5jSVmcwoXXrFzB1K:APA91bGvOBYidUG_XY7cVmcBDInftFSKkrK62V9jJc1YSwv5FduEOv3LcdEV8OiZQop4A9O9lpSRxQaoCKQFEgsCtn0PftmgFkSQfDsQL4BAtRDtOxlMWQH-M0mN2d9Z04t16hWvKmOm', '2022-08-18 14:01:12', '2022-08-18 14:01:12'),
(91, NULL, 'fmzg8210SfmcLvvPeypYTJ:APA91bE2bxne34ycemx8m7r7zbedxpi9CG50TSPRoPiNOp-sDduarfQs5oUygL6Yhq9sIbwIf_d9aUabvOnWH2t8CXD_jj2mEdn4oDkYDICONORVBHqy7SW6Pgkle7pvIRvv1yvHeASc', '2022-08-19 13:14:31', '2022-08-19 13:14:31'),
(92, NULL, 'eV_t3hRzNUbIoaw1RK0Qx8:APA91bFC-2i3i0gMKorYGQugrQ_Pf5_HY3IBXs0ZTOXNIcr3-fmwdT0lpR30E7tidmsizD473_NSqa5yXLxrQjULiRvbHHpm0mo3RBVcN6oCF4Lne9sVOcX3DcwMMHhpmh_GgZzWfa5n', '2022-08-20 17:21:09', '2022-08-20 17:21:09'),
(93, NULL, 'cBrmX--jgkJuoQJ82IbJpV:APA91bHYDZM5k7SH5OrFCF3D8M5wI3At_cJrx2IQmLfCXMBWABo1-xI9kmr-Nd2CzqI2m8iQpilzvhIc0kJjUJ9j6Pm7mqkOOs0L1IflzGqq5pRrq0hvd97fvuf-AGCEzurnVc367a_K', '2022-08-20 21:30:20', '2022-08-20 21:30:20'),
(94, NULL, 'ej80eQt1dELtk1TwqCshaE:APA91bEmP6BchiFc1Bo_RT_lUgMleuw-WADjHa-zrZ5fIwCk-de7baiXqmQ-IsbqVE9SR263Q6eKRXjF-aeldsolQhEvA9lb1sreNyqL6l7PZuWHFV7sHJkSVpZ2tYkgh4BnOfQCDuWj', '2022-08-20 21:36:37', '2022-08-20 21:36:37'),
(95, NULL, 'dRpn6aeFN0KDuTajPtDJKS:APA91bF3d_-hswb9DQcF9kSr5r1c0ga5K-Yo0Vg58RDV6l-adDsvQO0IWJpDsnO_fbcDGqwTBq3QPH-QM39ozK_AWbKTUhBLX8dd2IhHYkFCf2Ax8ULdpJyQSOU-4Mcq-ImOGqP6YmId', '2022-08-20 21:36:42', '2022-08-20 21:36:42'),
(96, NULL, 'dVWsyFNrS0ZXsIiTz4PQGu:APA91bHfu4QcelEcsM6p5KY8jt6Q1Y8hSOZ5GeBDKEEpMgyUAuJtKJJGudvYm_naH3MTl7FrMwAW3D6MJsyqB37_N0shVVqgUqlXrPpVzYpwMgHBHyFhxS8caEEJEDjBCAcNCny2Nrly', '2022-08-20 22:32:34', '2022-08-20 22:32:34'),
(97, NULL, 'd7Og9kpQRNS5p0F5jGYiSi:APA91bFywmNlZPoc9QxHN3DNWnhE_icc_5aTFxlgnR6qfnuBBTilkRi3SenVQJbfBLo2my_wf684oLNcoc3Ou6XHMaCJoubk-Ed6p8Fgf1LB0p8oyH5o41LHcWTwmUCVUvhNhxZv6CcO', '2022-08-21 14:57:47', '2022-08-21 14:57:47'),
(98, NULL, 'fXsUdtSnk0GZt07WtATClh:APA91bHEJEgDRTkAhDXwMUBoCR843xxpoI_tMihxJbtjC5O7dZP5c6SabTjG411VCJnx22eZVphwXEvdoFawLZdZGgLBlPNrdNLRXPNvCM_cuYqjX9mxx9p75iCwpO0Aivy9k6kQ4luy', '2022-08-21 22:56:00', '2022-08-21 22:56:00'),
(99, NULL, 'fUI6ECwARBqbXRQRz3mjtE:APA91bHSmhXVC7sWdj3sNAI8UdBO23c9FNQDoHJhzdxuTQBdpH8G9iV9wE92_dYxPX1X2D7K4Q_oyR7fj4GtRyHSnrCvMJPtmtvKZvhwdMenoxLTwgO5oHWt78Xhk2gHd3VdG_y5Y81x', '2022-08-22 11:00:06', '2022-08-22 11:00:06'),
(100, NULL, 'dTFOgmvrR9SUefaORRmwZ8:APA91bG5YUlenivsQaEkEv3RuvZ5hA0XIkAVK6a9jkb1fFuNNlaX3dmqhxT4pGt28sS0v1zhZVuAgxuiEc0Zx6XWpjrxCOy6E4gfsNKWD3ShIlyEVmH695YlB0KuTVoZjjx8KoQF-lXz', '2022-08-22 11:49:05', '2022-08-22 11:49:05'),
(101, NULL, 'd6vOtXbSR0WEo-wGTTCS6t:APA91bGS7JPmk2TcIKE6b_HP8TmgkyPKTloerJU_KzTJQMBHVjLK48soDrIxQMMQ3p6cXOQmKFWtlDdYCTEv4nrpMGOd-6E8TS8DIgpaLSeUOu7IlY7RFwP_vXM4sEE1X-tYcc32Nrfm', '2022-08-22 12:16:13', '2022-08-22 12:16:13'),
(102, NULL, 'duLuRaWdSCOrWuS4hd6OC9:APA91bF8jq7RNI4adXlDRARVprEAao21Ze7Ij5hehWkftjsp84SbM9QFXXOqhgKqrdhLF3qp5R8FGyL2D6rHjHFrfKzT5rRW6lzhO-2Oj0stRwRwDkpQXGsPaOt2IBMBdbGBwib6Dsns', '2022-08-22 13:28:03', '2022-08-22 13:28:03'),
(103, NULL, 'eC57o_VVTtiLa_eZw4qCnC:APA91bGS9hC1EAeBJP2xg0n9OMShatbJNeUwKQk4vbToKVn4en7wZkoASOitELw_prXomcrdi6UD7hFTROBAZPOLcbNpblktY6EHmhIIckmU0Zjb2_m121T5kNn5Iuh3FAUmjD2OECcA', '2022-08-23 14:17:15', '2022-08-23 14:17:15'),
(104, NULL, 'd0N_3bDKSRmuIpEViStZ7h:APA91bHkZW58gAfgitVZTOKk9OPRt7vL8n5BO8Vd4XrEt5Tr_4Uc3cdK32eOcbL9P1C_np3X0_seK4f9Ko7Z7QEPwgUwpVP5YcHSqLff9CDkkypj1O6dWXeHZvEustCQ-MUGdME9N_Qh', '2022-08-23 15:44:42', '2022-08-23 15:44:42'),
(105, NULL, 'fsqeozoC9k7IhPppaeof0K:APA91bFbcU0w_jez7zA3v-xOT5BkVhkRX_Jz535gN3nHu7UWMxQmWx7EHSopdqK1J-QhkWKU4hGc2ShLWxa1PJrQb1m0slqLZhzXfRSaJFr5kV-BSlBWvGngg8GVdezSc4XAb5ThUifp', '2022-08-24 19:10:03', '2022-08-24 19:10:03'),
(106, NULL, 'f9r-IWU79EaRmHcJ5ABZ2j:APA91bGiI1506cUjSKmo5TW-goZPpO4jetSGyx3P5T2to4fSZXl_F8FDH9JI87JCTJ3vjMZhK3TA-63_E3cC4bBTgPtWg6CK7EQlW_d-7fpcwY05JsJoA_VPDTOI4hAxwkxoIzNadmOD', '2022-08-24 19:10:08', '2022-08-24 19:10:08'),
(107, NULL, 'dniV8vVYekfbh07DbGmZe4:APA91bEJEb1lezA03AosO-GUo2cKtn84vOi6IknsFbVSED00hFuxaA2wltznMhMZ7LVjY8pr3p0Q0ghETT15nSRDDdzs9HObULMSwR4oFNQSK5xEzaXAynC-0yF0Eg5Q90tRaYMXFdLd', '2022-08-25 04:42:13', '2022-08-25 04:42:13'),
(108, 280, 'fWeny9n2pkImufIDg2nUpV:APA91bGO2vfVzKAuUswVbCHK40R-UDAqLW3TQShHIoh3ks5t0gGUal3Z8NIX6D9B2IL9wCW4Rx7WD8fn8GzEw8IFvW1nWY537qVs9k48tGlPJH9FPBDIjJteOi92CFn8SD-kWPgsohVS', '2022-08-26 02:16:37', '2022-08-26 18:54:01'),
(109, NULL, 'f15gC1f4aEvXnjjQipFh7v:APA91bEBuPVoKFhCnwbq42ECrajTmDXRA4d2wvfBf0hsWzkdS7ekCAVwqzFDAhOGZo26ruVRDdiRm0kTbUouGSQOlZ18zL3BxK_yiwlqihkQNgdAK7gJX6TF5lwRoJezGE_h0beUIoUO', '2022-08-27 09:13:33', '2022-08-27 09:13:33'),
(110, NULL, 'd5iTWv-TIk9bkAlCWsC8Rr:APA91bHdWqBqjNnhyGWHU7oBwW7jPxexPl7Hf5ewbRHdPNb7WrQ1MS_pxi6MVGKJ6bfALGcySQXQRfqwTlOsjksCtxstOrqeo4h-oXp_m7TTeGwAmcPFA-fqr8vaUJSVnSn04pH61EwE', '2022-08-27 10:14:22', '2022-08-27 10:14:22'),
(111, NULL, 'cFH-lJmepEGuoc6yKEwZ2P:APA91bFjVAyZ6yAR3Ha7L7QHJ87w-zKINb2LlKKlVo7W1Xt6kK6yROHqGOOThQrsxF7Uk2cDzPUoXR5JGcMJc1_bJsTgbBU1c8n2bgpNlJCOR5ozBXdclJZ5kX0ZtE4iUrAR6C7QyJCs', '2022-08-29 00:21:44', '2022-08-29 00:21:44'),
(112, NULL, 'f1lucWVIqEudhNvC6Wj5dE:APA91bGolxvQ88z6DL-0u6I6q9YkMSTDT019xuL-2qZKzTUh5UH4zDemCif2J1yr72ImCcACshj8A1WcLiw9NSDWeaNZtX1vHHR7GtL1zy1FLqQHsX_0okzpsGw6_t8N50z59D14C7b5', '2022-08-29 13:23:55', '2022-08-29 13:23:55'),
(113, NULL, 'cLn8TJCvPE7YuY8eAAgKQn:APA91bEusYGGMf5YytRAEGA_3ih34B1P3hejQoYKFdCnbacmda109EE-BjunVKbsKhJBRAzgIBdA7Y292lWa4GHLDgErke7YZJdfSEKVz06JPnOtYBs_wjpvTPTC8iXUsntMTt5tSQUY', '2022-08-29 21:52:05', '2022-08-29 21:52:05'),
(114, NULL, 'egX-MvwpOEt-s98nSUWR_3:APA91bE1SsRhJnsjVmRnX46QEcrL5ON9L8Hj5BzpXHOunreSz4eALjUk8dwgDiMWGqeN39p_R1hjI8e27Zv-CyinXFSDWTdA-lOfD_B0HdLHiHhXHoMvQd0JVabsBjF5dxxC3hOhwTKA', '2022-08-30 09:49:33', '2022-08-30 09:49:33'),
(115, NULL, 'ftBxq_J1AEDSpfCs8FJV-y:APA91bG0925eEdl-O60aC4fs-OyoqvsGjD767qNB3zZ1rONytVqONS2Q-xqWg6gvbJne9T7z_ptjylHu6GvSobHr2tmCaNrnw7ev6xuRd1_KXS22mXDwwWbIFPyxpVjkf-98tZFLtwaD', '2022-09-01 12:50:52', '2022-09-01 12:50:52'),
(116, NULL, 'dGgRksnckEcVicYYjHQbN_:APA91bE1BXg9IWjFEqdmnHnRyvjSHkBA_GsL3mlLLMozg1DkhSzjt1iV2E7mf8oBAdl5AYFL_8s9KTlNKLrZyjyhoqf3joqecTQ-liRSHfsEMBCmx5ELfMDs14ozGmw272dPS0pcFk0T', '2022-09-01 14:39:34', '2022-09-01 14:39:34'),
(117, NULL, 'ftupHemjN0xZp5uLClmny1:APA91bEPUnv9ZaokR80TN8_Olfv5B4fbdahcceaZ1qvpYeWPKuv7s1iPMVoL_NAExv53IcofYIqBqxF-4E8STI7JFxr4QIGWtHm-LJvLI1AA5WtNZphtSGrXUPDRD_C1X24jD5yVuwbi', '2022-09-01 18:28:01', '2022-09-01 18:28:01'),
(118, NULL, 'ejpQndzzA0ZztLucn31Mjv:APA91bH9GNTRwpGaSwIZLogR92INta2c6K6Isl0GcISbcBf10ZXTqmCFqgG0LfSDuHjfYCfX_aeYJa9hI-XLdDAAqig-olMmK5Yo7JXNohU83aHGTTrq56lP2WqGuci-9fr6WMumcymu', '2022-09-01 18:31:36', '2022-09-01 18:31:36'),
(119, NULL, 'dLhxaOmLrEYuvevuMu39mU:APA91bHSSSs-10m458DMVpyw0BxG_ph-dXQ_DGIbiqcJaaIoQLTuL_DWindrJvgpIC4NnYbpnv2Np8qzdyr-dm1pVjs3a48ceOElDHcrC7bvqQN68OTd9B4GiditCZpVURkPOSlSSArR', '2022-09-02 08:23:18', '2022-09-02 08:23:18'),
(120, NULL, 'ckFeRVhbTUiL9_Sp8oKpcd:APA91bHLTrZaclpPp2MZ6ciVRU0pqND7SaYG45Wue3bXlcbQky0MZccPtMDY8dVdwNXaBtlnVEuuzUP89CbC2YIVOsKFiks-doGtJ42gmsBNU5JZcPZudgUARyw7DNebFcVskD1wdyku', '2022-09-02 09:03:49', '2022-09-02 09:03:49'),
(121, NULL, 'ctn_3542H0Q3sBtcZ4nla3:APA91bH25HYUFTp7O8EavsiNwN9WTTWFS9YtQHcv4YfMLMIGC3X2-ZbtuMVMR_itn-hIvZbAqo2IdqBxc14cnlMtMSgACpZH8qekqbmZAqtfXmBXrXcxU2VmQV_1r8hYw4QsmyB72QdY', '2022-09-03 02:03:47', '2022-09-03 02:03:47'),
(122, NULL, 'caXGNneIgkLaiAN315v-jV:APA91bGi8sAbIwuBxDuZNa4RfJI2ye3U5ikSs7Y3p5e8WK6kh7d2-jsAIoxpP6dBuXoNBXjGGNUKYqlhGyDB5bERmi-k9GjEOFWXTUYZAOP4ZasdK9v6jAnhI5LJLdu_lrj6jVlDJl88', '2022-09-03 16:09:47', '2022-09-03 16:09:47'),
(123, NULL, 'dTwP8FzgL0o8pjRRgHK32G:APA91bHgXjz2q_QHurr-qZqVqSM4xFuKyKuCR4macgS7L3LC-ZAPU6YpGK6HKZ-5GBtTW2LX-4sgYrrhiMqXKrSIMJuD5qfGfhzRdcLtfRkXOplNwMdlvF7cXzHl5sT03Lxx0A1xdzb9', '2022-09-05 09:27:43', '2022-09-05 09:27:43'),
(124, NULL, 'ejA1qleAD0tFuDRNHs9E8u:APA91bHMe3C_mt8uEd9bzf5utT7hToy3L1CCY6RPiUDq1Qlvyk4esudNwO8qcLAINo7xlb_kGNUQIY9McaFINi4p6qbK62_tYvalIZgVEPTcLnb2xIfJh-nQDf4RODBY0em-SaM1aTuj', '2022-09-07 04:17:51', '2022-09-07 04:17:51'),
(125, NULL, 'dj1JiOx2f0Pjrnrx-89Y-U:APA91bEOgXDVLZYsL8sOTcJAglPAgJgOFwhiFQNuDHcoAwENcvU-xTUqOgm7ZxYeAU3DtrslEaem7qoQyaYaaHtiBA8BEgtKENrX9zBijuPs5iBYSwYFDCRgZ1RrxErRv7mFyGhYG4ZL', '2022-09-07 04:25:20', '2022-09-07 04:25:20'),
(126, NULL, 'ekOBpt7dTL2_7SoKqDdG2L:APA91bF3dv37cbylV4Aw4tymYDzVBGAUb3WSiB-n9TH3n7tsaogdVlM5CE50gjUUkBbouEMCpHVDR-mxRlLafEGwDCncR18SAJ1tuVcop1RhjoIADhtQ5ud6tIMeaK_hhKQL0KwRekvp', '2022-09-09 05:48:25', '2022-09-09 05:48:25'),
(127, NULL, 'dv9SGaWNe0mWkF6z0x9QS9:APA91bElSL0jELVnGJYrOQwdFtjuhYknNVaBPfJpsKTH1MebjSr8vJhvnQdzxB-FV5DCQClRm1tLsZGLVz_Hc53lGxBkYslwEcl9YMimIXLMI29V9g3BaYjop1xm3p7bxlaZ-zWOcfKp', '2022-09-09 20:21:04', '2022-09-09 20:21:04'),
(128, NULL, 'd0hi4RBcDU2dvh9xuNu2O6:APA91bFAjitHzt9Lb6Kv3I6eucLkkEdtS-hyCgg0dAr817Usk0qI1Op3KkVK6UYLZ64mH8qJBAO3KY034Wq7Oou3EC_ZivHLTLg--3XHrp7JaalNeO7YX1yqLpSHCjMX6p4hjcTk-eaW', '2022-09-10 08:33:25', '2022-09-10 08:33:25'),
(129, NULL, 'dB4e0fEbWEnmipsS8Kx2LR:APA91bFjI_DlqKgwtcSSewRosAxT3hSTQnqIOn9svlwMQ4fij-dChGG9TV4FvyRTJxNbqAy0Oz5pr7_UjhdTGD_LgC4dHTC89Ju5BPhcunknAgCrxAsi6Ys51Ke2YEkzsOxzETQ4gUYW', '2022-09-10 16:10:52', '2022-09-10 16:10:52'),
(130, NULL, 'fKNZIzy38Ukjh1yQNhw93p:APA91bFHk6QEZ4aAufy-fAsuCS3WGn9Y5f7Fs_jaSTZgECDQZ3c2KOFgem479fECFr_XKNtWlGjR-dQDT0lUQqAyGjVldqUCT690D2Lr9ZXzJlkF9xhDpwa4KSIguAjzg4hDbrs34qpr', '2022-09-10 16:11:10', '2022-09-10 16:11:10'),
(131, NULL, 'd0BdSgCkTJem2og4m00fG3:APA91bHw32I8uAaHYLyrOlBmaF5dJ5hUsNum-FeS3zqmxraaI22w7R4rjMxpDFbDTM1USRUwh7NdWKBWzis3fdww0Z46M-0WMsdLF56-eB2PM7y1Z0I6eDigGyWQIBEi4iwatzy3eQ7A', '2022-09-12 18:25:46', '2022-09-12 18:25:46'),
(132, NULL, 'cDlEHS_o9kmNm9_9hIb0JK:APA91bEVl_8-AAiUN1rf0D62UjPXHbenjDacVzavNmHvIBdSD8xE19VrwVYS-I6bTj7l-8qiSzcihY-D_D0oOP2fSObZRLTJig6XBTbzvLrmgF0Ru14-ChgcDSa6DyyyZQ9cljofdL9v', '2022-09-12 23:18:56', '2022-09-12 23:18:56'),
(133, NULL, 'db27Y70tKkUfiUGiJ7Mp_z:APA91bGrjlg9lzvJYPhPoDT1MEJZdCcq7bFz59i5xC9iYqHO0L0V5e1DAaR1gunrXJKbY8_C745v2M-mGukiQSwKBeAwqm2PksVQv1-I_myKzMTkAmPGfXgTPa8y_Ilett6llhPOFOJ4', '2022-09-16 05:00:57', '2022-09-16 05:00:57'),
(134, NULL, 'c_ZEGJpc_k7dvF4SPuLY3c:APA91bEECGddDsdAqGeyB209tg49RaByavCoixHNj91Z-ApTjJUscWKFmCNz7CwneTsejnTizT_loCM6IXHIiYr3W3l1lkzhesshCuO3tHV5jLqQ7FOXYakfH5lF6AjanWLBU0ryGRkK', '2022-09-17 06:38:28', '2022-09-17 06:38:28'),
(135, NULL, 'dyhysBBe1EBSgJ6OqbCR0l:APA91bHtECFArEFk4HPYQFGwv0YacXStAVXqqhTIhyg033KGEZUcLxGJRe3y1-qfDck-gGaK4MHfsOgr8kRP3cpjZiWyz8psecEJmJN__syJwImhszeJGKG9shDLpmcsaI0jgLb73km9', '2022-09-20 21:49:53', '2022-09-20 21:49:53'),
(136, NULL, 'd15XPMckQ0RJm-B4wyKH5t:APA91bGrTgqudTzuY75vX9twxO2U5qjdWeH1XGJVYnri3U5j-Mwa5nuehH41noYGWRKp3H0s1cLzJ6w6UNtchgAbJlljIfgURNVC7gNrd7mTusKrwkTcktq3ewitvdzVu_OB7s0_Dh9u', '2022-09-22 02:44:28', '2022-09-22 02:44:28'),
(137, NULL, 'fy7dDR9rZkp-lEYA0RMGLJ:APA91bGRC3DniQ-6gMj1QctiUQvAntbs3ClTuj8WorQL6RhrVr9EizZ9LdxVvJtvSkEAIrkVnFRFVYV-vwuCtEjhwvo9nAm_DHdYTJJZBpw741X20GYaNUR1YMKEY2RTf9tAHRPkXmP1', '2022-09-25 11:09:58', '2022-09-25 11:09:58'),
(138, NULL, 'f8ZClC_9JEiBk62XwjE2V1:APA91bGp1vU4lRKnjjmUGxALlAvcS57l6L3dTXeuSjMwD2-h894ssAMY3Jxk3tx214xCkUitdr3fXRAi95nndkxeACDCZ-fQDl8QveoVK4ZYs1x02Twe6Au0hvSSJyjMQeY9gA4FfyR1', '2022-10-05 18:30:44', '2022-10-05 18:30:44'),
(139, NULL, 'cEIYgaqkS--9MTagCVTo_T:APA91bFFRfbMRVXlqH7XmkUGV-U4oQ12yzFSwEqGXCza3ULmscRXKdp3787LwKYT15Agmh3fvzZVmBokugVsLjkKmN-4RkXSI0Ghgy5NFvnfDwe469Gab6NIWrdDuCdUCf9XpfrCQj1p', '2022-10-06 00:37:41', '2022-10-06 00:37:41'),
(140, NULL, 'dpCwAeKOSv-VI2smtzjuWv:APA91bFESOHAW8gvnjutPHbp0ye-cav5sAT9MobUYv9wP3NqDhAtmx_-TYdFkfrbzOTh_s2wsbZO4pJ4MO6flvPEwng1MrRIMJeI_X6_yThz1CTzZ4geZFE8AsoR0wm3pHWvqY_E6_aH', '2022-10-06 21:47:12', '2022-10-06 21:47:12'),
(141, NULL, 'fCDMZCShT0Q8i-FOub0Pzy:APA91bHqb2QFM8oH_vEY5USO3wKKvzzFofdqUiHNHYdEzlMVig7iuTXB_MvXR79hKXT0KuNwCdAXjPLVgC5ddsZ6a9RjiurQNe46KhS9M13Ub16GFxFUPeWnY4Pf-Q6KmCxXbMN7Y3kJ', '2022-10-10 23:50:26', '2022-10-10 23:50:26'),
(142, NULL, 'cp39mJMRQPWaIAsSea-itq:APA91bFtgCLpy_Zzp7fjiCbm3oyXwbCG_xzWqDWh9FOeQB-a2B4-6wxa5ReVWJp6xvhQS2_l0epVcIGq0z7WZFMzNu44TcHvr6TnZjnP20s-Bw_-D0soKlDfIQ7KW3RsXYl2xahL_Ib5', '2022-10-15 00:17:35', '2022-10-15 00:17:35'),
(143, NULL, 'fY6l7GtplUxygpnsolmkKw:APA91bGLsYB8IEko27W_4dgXqcSmKD8BMjPan7olbg2m1PBgHGZAeREOL1Rr2yNu0ZoH4hWAukSKEMSzv9R6qWHIoSace9pDTjOtfhrEaRxOi9g5HZeSkJzRexs-awenCRfvfMKjRjRj', '2022-10-20 19:52:54', '2022-10-20 19:52:54'),
(144, NULL, 'dYmPlRNoQUeZuGtK5Rlc-_:APA91bEmq92_qSNDUSIBEoY3zYJP4rt5_EyX81dSJLxYYK-xQu2TUW9n1JxRQy_93OdUOXSEKb5eqXIeQRlTcQtlBbq5Fhevc4NQZAQYya97D-Nva4YYhyR0BWwdrO2eXQjS2dyKI2O0', '2022-10-22 10:57:48', '2022-10-22 10:57:48'),
(145, NULL, 'eGi2ylAT1kr7s3I96oJ-z8:APA91bGYQbCFvBcDiY7E34lehEe7Q6XoNpQSchO-95Q-M0ny9cyJ0qTvHAY_JVMjeiqiBt9nFTXxM-5TNvIdEPtQBgsjyL4oWACzCVomhXnkHNSv50q0bLR8EtZ0UD0MRvt97CKIWoMo', '2022-10-22 12:55:48', '2022-10-22 12:55:48'),
(146, NULL, 'f-0Z22S1nkgamvpiUMJxho:APA91bEpeUXdDeCh3p3OAE0nzyNxANGYWEB9zzZI85AtQw6sJDKSp87XT9DFErJrLfnp-tBKPRiUHtgRVnzWdBRGXZuGrTUSYoTwzEytH9PFiMdleaIRj_lWzSW9ytg2wk536h0F0FdA', '2022-10-24 06:11:19', '2022-10-24 06:11:19'),
(147, NULL, 'fCWDBVlWUURFuYixWmjhwx:APA91bHsFTVPX7HtuPbwskvNEKk8pDy87RuEXpQhekCOid7WNLROEbCG1YVcoW7X0OT-HIPy-CmGyrENPJE2bPVIzxBx51kXxFUTkoMU6vW22wYqmo1s7iHY3MjQesJ9iygcb4H5hM6O', '2022-11-02 12:02:10', '2022-11-02 12:02:10'),
(148, NULL, 'c35hIKuIRqC-oqm7vQ7-9n:APA91bGy7PSJjKOSj-d18QazbTZ_oShaU2hZJJ61MqcVSsOy9nYkvhLgdYtmFt5x_jVqCDOya8G-EIHYzzgVqOM79FiHYrn_H-Gfa5fhGsgYV_YhY3eZau9jFaA-n_n09y3zvRG88P5B', '2022-11-05 15:02:05', '2022-11-05 15:02:05'),
(149, NULL, 'eEVaUMaGTEJDob0LwqWZuA:APA91bEBoa59r5JZT908bXEBnkdbm0JOSB871GYQvFcfnl8rGHvJQmZXHCJLpic4k49jsuAIfymMAOvA3GseRoLg2d65hFken3T5xBSsIDsSg2ynJDzUfnpKCrIAt8V33wTEELXWyr5q', '2022-11-08 09:21:17', '2022-11-08 09:21:17'),
(150, NULL, 'fgAxdubkRU18pvFDX2kRmM:APA91bEr88zq7iMNClAigHO1pTwc83F53i6xsfRirgsfmuM1VoX0g7RXKHenWll1MxHGIG17neuyQdz4fLWlEtq9jz28yba81_i-fPx05qMQ1r_H2N6TFo6mCbj05BFibMqRgZqc3m02', '2022-11-12 08:53:51', '2022-11-12 08:53:51'),
(151, NULL, 'eqBG-wHenkKpnbcCtJRBWK:APA91bFar1aNDalgjFf4lSATSywd_sE3A5dyjDAOGXKtBD_pcu4sKIXwQX6OvMIle2JrItDqvzzXoNnsK9z-Os8wts9s7oekJnMRHI0YVXx3egxkkzPR_ZzPFMf-x5T_B7nwZExxgdUy', '2022-11-16 16:57:44', '2022-11-16 16:57:44'),
(152, NULL, 'eleauwqGfEQIjd_sUz9Rqp:APA91bFN1YF8m89sUuXw_H9burQCJTgartAWMqcLvwNigMPIH2zr8EqSR44D5KXWUuUNwX-liboBIZf_NNWUZJTucmL1r5Nq_2s0ubNxWJpUcBvP6b2LXE4C_ZhM1EVVPs9DvabZbIOt', '2022-11-16 17:01:37', '2022-11-16 17:01:37'),
(153, 281, 'e-TeAoDQVk3ql2UIgM6o7F:APA91bHx12h5PqyFsD-xApNthHYTOnQXRctV8AqVT8LWYOO4S5U7taj76nQdLUlYgFpwKartVN5FuHh_1fejrkqRArPixx0HuUcH1f0w6dH-wvLiI9k9lrImegbfwaa8DP2bxywxWoMd', '2022-11-25 10:47:04', '2022-11-25 10:47:04'),
(154, NULL, 'ch-rDs8vQJuDEPu3CoQ3j7:APA91bEiigWdwK7MY1gOrot-3b3aos1Rd7mzLWImkUUnwYXLKfmN-Xy3CSdLlm3CjF2y_4oYCMOSJsqeqbEZJSySBCC1t8ki_IFPkj_iXbOuN8tovQ4vOnuAFZ7_QiAR6FXe8PlNli8d', '2022-11-27 03:20:16', '2022-11-27 03:20:16'),
(155, NULL, 'dyrRSTsMdkGJvgBAlztaCP:APA91bEkeTwoNz3gAfxKAOtqwemM-YH_oGxJCb1wi-HeX7XF4tilVqqYP2t61LPYm4m5yWTHVN6-zkCOu0UFxeSfjB5m3lzvIKtdilHmm54IeWqGpPV509NEveSjKzOsLkREvhBYnfqr', '2022-11-30 11:06:28', '2022-11-30 11:06:28'),
(156, NULL, 'fvyGs6padUHKlKtq_8BVPR:APA91bHoA1QDkb5VLArPoQ0-EcajD1tdJf_TqHT84Fc0Y6GX0RuNhcYLMMIuizL71XdD2GCtWj0ETgtNWAPHWgTvvpDKuUr2BBTMWcsIrFNp9zgsjGfv8U0pW7HexrnYJ2JegCF4p-Ht', '2022-12-01 06:34:36', '2022-12-01 06:34:36'),
(157, NULL, 'du9zWLGQT_qnERb8lYry9X:APA91bG75rbSbWT40CUxzgtYdBbqIIWxqNNtLQVg3zEhHzC251xo3HpCAQ5aevstOJezfgXtQekqbxXO54NQXynAMJAU17QUOrQAVF3l8MsDoNeuJ7SMPUvaxJwrxFbU771yTmniBx7G', '2022-12-02 16:04:12', '2022-12-02 16:04:12'),
(158, NULL, 'cnnEmh-rTletWfNYzvG8V4:APA91bG0Ata9pv5TppB_Aq-3ZZPMnSKO2TVf84CP-OlNpUbP8mpYb5FHz7J2xBK_WktUMjSN80Niay1fTulWSe2eVBq3EBmwFJet7pRFt-8R5bQwuB0QqMOY-ZKRB8_2T0wFn4p4FlKB', '2022-12-03 13:50:52', '2022-12-03 13:50:52'),
(159, NULL, 'fQ-WESHpIEILpNrmE5wbAQ:APA91bEuFLWZV9BfsaU6fBjspfH5pHPxtRpNLeasK3mvEfQ0VzK3DJPV0fupb6ldXMAf95XMbLJB4ujXB9repfQp-__lS3-rtLFgL6003pq6mfxtD9jyQ8USdwnzPNetrOxrsIxtwYw8', '2022-12-03 19:26:11', '2022-12-03 19:26:11'),
(160, NULL, 'eQS-nFrjU0ZsniA1XUBXaV:APA91bF_HUe7QK8h6Q1slnQvIxPwNCWaA07nfAOzaT-_tk4t_Biw4MIoUvRftDCj5lwVma8E-DPKUtbU0GSapCL4NTHbP9t9PzzuPkTQzJrE1XysY9lRgLavUsyuBvpFJ3sfk0kWVG9l', '2022-12-06 18:21:52', '2022-12-06 18:21:52'),
(161, 282, 'fNm9qBDDQAiopPRflM6t96:APA91bFH6HA5X5aNuFgUCr7QxvloK6fgfL2ZT9jTk25WttfcEqgvF2qjgxMxQT42x7xJkaBGzN7LfFFw4Cadfh8CGzzDcZJ9DLV7FyMUb6eh4at1Aa1lQA4MetiURYITENwQfAZ6Q8W2', '2022-12-07 15:45:49', '2022-12-08 18:22:08'),
(162, NULL, 'f8xtgBGRmUG0ungaIaxfGE:APA91bGAwx-IqHW0tfLGYlLLTZpEh1WtrOuWFMKRyHaFvqrE46p-m5_hoCnCnUix3H00djKCGQzL7IqFj_BTR2w-rEDCkLKu8BCBvrQbjOuYjB9TZrpv9TmL9HBX4ybnSbLMUAYK1uYd', '2022-12-07 16:05:40', '2022-12-07 16:05:40'),
(163, NULL, 'e9BU8KpdEUyaiYVPCYQr87:APA91bHWW21rugZamkY1D-LLSe1sS-klLJtmcGgarMhass0cyFVNE3YBg7U3JkvbAejS76q1EF0MneZbMHCTtuj3aMf-QUmiU59ziz5AJ3VrNkVR-aHoghy_DjQiMLmdRsAVt7R7tmwZ', '2022-12-07 18:37:48', '2022-12-07 18:37:48'),
(164, NULL, 'fSZ5EcdAQ7Wn8narWHruQC:APA91bHsTr5etXfZ_ZUMKq6Dcp7ivQltUkMy3bFzyHZ38RfggSi6iZcCFWOAtHv9BwUYk_6yVNDD2-Fpm7j23LM3ihSlKZZWJUhe3x_sAQv3yokA49m5k5zYVtR2ZkI9r7IVsEwnrnhO', '2022-12-08 01:02:17', '2022-12-08 01:02:17'),
(165, NULL, 'fNm9qBDDQAiopPRflM6t96:APA91bFH6HA5X5aNuFgUCr7QxvloK6fgfL2ZT9jTk25WttfcEqgvF2qjgxMxQT42x7xJkaBGzN7LfFFw4Cadfh8CGzzDcZJ9DLV7FyMUb6eh4at1Aa1lQA4MetiURYITENwQfAZ6Q8W2', '2022-12-08 18:20:37', '2022-12-08 18:20:37'),
(166, NULL, 'cJBxk_y5QSmKI0wY_WFLAs:APA91bE751i473481fNAkjEDuWo3cVuJx2LHv36kHd7YDqzvesAZxFEyFDeFo_GvFxGRBgYXDuivFnQMLgyHCeJUzUJ2eu3FCCqWjDA05bZXrryTFylgQMG6OoKrXV1Q9rHsCkyGzNOz', '2022-12-08 19:31:36', '2022-12-08 19:31:36'),
(167, NULL, 'cIppfCIjTC2AE34877qDtS:APA91bEPC9vWS_A6_380rI3D95Yx-QRGUTCSnORW04qv1gOOXoKINMC7IMeUS6iRlpPH4bi9GBUqPCoQTngmkr7XceZHSaDHHl36ZQzdaVABOxP4s7v3Gcfh_HPRU4eIxlu3MnZ4CgWQ', '2022-12-08 19:59:57', '2022-12-08 19:59:57'),
(168, 286, 'cdyFh2yXRc-anE3F7TILxr:APA91bHutRdO80-u0tErhpLsTgfjqF-0ORY0n0XvkEqLhlaylPk27NV8h6z33MvjHc5VLuFTdaQmMBi-Ad08KvCEZycfqfI_5SCE9o3mUliYbPNmJGTVv-pKdRXZZxzg2Z0H4P4TASRQ', '2022-12-08 22:17:22', '2022-12-12 21:11:50'),
(169, NULL, 'coM7GQFRS8-CBeCicSmNQ3:APA91bGZK3JRQ93qwEd-pMZJdvtudU5cmdNY0kOjkvEI4B7LBUgYH8fDldeU-ee1Q8mCHde_TsEb0Ed9wyyIP0pNZLDeVX_wrZhGNjWySjWyBKkYVbTs40EmsHBnueZiYw_MAaM1fp-h', '2022-12-08 22:28:01', '2022-12-08 22:28:01'),
(170, 283, 'dAfTRyxZR7-VKbEABEMITf:APA91bE6H0rwvJrti-WBMvLRRrP5MNzDz_HwOAZQODVUXCrkXTR2fNL8DgoLCq31Gf4vg9R3GnJbQnTdGv6vJAdTgeBOa569mv5doNkE2YrtL965FLXWtq2TVjrjcIzfwfB1yKBekdKd', '2022-12-08 22:52:52', '2022-12-08 22:54:13'),
(171, NULL, 'cLAwm-iaRnS3TLMoMMZrw_:APA91bGqsFLieBx59HPEQ7A20xlbPDGc9DqsqxDfgg587Yh8uYANt-K56qYmhonNoxd5D_KfqElvc6xPObDOiXcDn5if-5vXlyn1hNWnOrIs_E0RGeh8PbofCOxjFcu4kjYo25zglECm', '2022-12-08 23:23:36', '2022-12-08 23:23:36'),
(172, NULL, 'cOiAnvuXT66BSeUGOnJUQE:APA91bF5GmLAi0bNsXFkDExzXNKnbu4jiiKarQf_NSyl5aFcjGDfH9p988xDC-f7uxCfn8fX29cVXQnr2aw_x6uTHaNKaXhDhnBs9JWwid0bXnLYHTrFqiNIXN2qSpXJ1XyE44gluXMr', '2022-12-09 08:28:24', '2022-12-09 08:28:24'),
(173, 284, 'dt1ozi9YRKinTg_-FmNhRN:APA91bEcWv8b2oXwOP9_oQGFK2RrkdnSPNUEHto_AZgLyj8tZArcS_37Zrvt_pfTJtS77KcASeEdPRUqbQp3RP4cY4oPuuFDbXyKomPnkbK4b6-xTfCcsfyuLDZzVoeCpdFvYhYHqU-Z', '2022-12-09 10:47:49', '2022-12-09 10:48:31'),
(174, NULL, 'coAk5a20Ty2Qeyw02_EfGw:APA91bGvSZxXmiGZe_XGW1N9D5w1wkjItTpv55P4iHnZ0xe7ZBsNtAmBDKsfm6eb2sy_NYSZZGztPbdE90N271cA5iJoJNORcj0oVaRnXaZmZZRp_YFWPBWNVgHSSfXg59TrvtRJnFbW', '2022-12-09 15:53:13', '2022-12-09 15:53:13'),
(175, NULL, 'e4tqfbo3Qx2v6dD2UO0djA:APA91bGFDNGvjCcfjg9fsGeHf2K4HkS0t0XjESCfxanHpbf9JdclkemwCKCVUxBB_4yTyyKbEnI_Xn_C0oyNNK0iNmmVb13vFv6lhoEi64UwqMSEIaC_8RBf_WkuMZnQhM584A2iMtrs', '2022-12-09 16:18:53', '2022-12-09 16:18:53'),
(176, NULL, 'fxuggGHMQLmPBSAOyBBZtY:APA91bFCMwFUHOpCY6BLAAtHsLWk1uqX0WDD2n5dJuLSF29wYh7uAw43RYKTwc659M0LQXFUMIzu6Jr4no-bTQPzhQyVGcr5gTKLXII68EzGuKvmaxB-eG3qc83JIuQG_I86eiVgm6Gv', '2022-12-09 16:19:10', '2022-12-09 16:19:10'),
(177, NULL, 'f1n3Av_ZQ-y65FYykg7DVU:APA91bHZuJ7T3POc60dr9WzIKYdhCFoA7cXG3-v7KltGOH9esi8gW4S_ULWQUGYYbQ5afpUqWCYTx4iDxH32Ifq9DM_ANEwD34YVuad8tKcepHBVJ0ylOWdoLo9dDcrgNnoFpl3QvqZ9', '2022-12-10 00:18:06', '2022-12-10 00:18:06'),
(178, NULL, 'f2WHfrFsQuixz6mrU1wtN0:APA91bE7w6a8G-_RxUhfloSsXYSV8lB1HWZQkmT9N-C-W326Dqdv2UEARP_5kHKLNHu0YSDm-kc9O3-5DeLILKHVMynqwHB7p3ToSiPAWH8AQMwZr2Q5VHPZFqiIBYKi5Wm7lAXFpQPc', '2022-12-11 16:11:33', '2022-12-11 16:11:33'),
(179, 285, 'ddS2rfAKR6uNfyp7Av_cXX:APA91bHHw0-76fEDSUgkB2h7VbgVByYR34KkdvzRa1SbeZwsb1KuIAEr0mCivXpIoo18dQwWR-zHw1B032eytVG_PePS1SFrjFOMY6zUSqPvSbL8trHO5bTS8JX4rVMgpYIXpF8ZcGql', '2022-12-12 19:22:51', '2022-12-12 19:25:05'),
(180, 287, 'cKbUTt_6zk9rkm_1LNyAIl:APA91bHmszd-ksu_8Yi3fJ8ehf0BmSS5PiFW9ks5cJf4XePqihcJ9DTDn5vGSg26h6i8fzb7A5qUBBhguipRgiyoH2rghC4MR_ThSGHI22WDdfoXRgK5rcWAoeJhhxXhhiSmUna0Pzz8', '2022-12-16 04:29:27', '2022-12-16 04:32:07'),
(181, 288, 'ctopDaiCSzC_-fsn3okuEs:APA91bFBVyEjhV5JmGHO4nESpjT2jU2mx0MZQq9vT-L2E54Z47wXQc5taM2jMfEQ5798970z7R508xb-qxCBiWWNVLlUDQg0cXtxIgNUBd4mJSbkiU__a7pZ0rR_oXxCgCKCkOin16I-', '2022-12-18 05:38:37', '2022-12-18 05:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `link` text NOT NULL,
  `type` varchar(20) DEFAULT 'icons',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`id`, `title`, `img`, `link`, `type`, `updated_at`, `created_at`) VALUES
(15, 'facebook', '164926746970148.png', 'http://127.0.0.1:8000/admin/icons/create', 'icon', '2022-04-07 03:51:09', '2021-10-25 13:22:08'),
(17, 'phone', '164926728115538.png', '201009156765', 'icon', '2022-04-07 03:50:13', '2021-10-25 13:22:08'),
(18, 'whatsapp', '164926729491308.png', '201009156765', 'icon', '2022-04-07 03:50:21', '2021-12-01 00:16:15'),
(19, 'instagram', '164920274952956.png', 'https://www.instagram.com/', 'icon', '2022-04-06 09:52:29', '2021-10-25 13:22:08'),
(20, 'snapchat', '164920269479238.png', 'https://www.snapchat.com/', 'icon', '2022-04-06 09:51:34', '2021-12-01 00:16:15'),
(21, 'google', '165323521636846.png', 'https://play.google.com/store/apps/details', 'icon', '2022-07-17 22:34:00', '2022-05-22 19:00:16'),
(22, 'iphone', '165815685784045.png', 'https://apps.apple.com/kw/app', 'information', '2022-07-18 18:08:02', '2022-05-22 19:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `src` varchar(100) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `src`, `product_id`) VALUES
(497, 'arrogant_165015006397426.jpeg', 212),
(498, 'fake-button-high-waist-wide-leg-pants_165015052397104.jpeg', 211),
(499, 'fake-button-high-waist-wide-leg-pants_1650150523390400.jpeg', 211),
(500, 'fake-button-high-waist-wide-leg-pants_1650150523849002.jpeg', 211),
(501, 'spring_1650150585362744.jpeg', 213),
(502, 'elegant-thigh-slit-dress_1650152708699057.jpeg', 212),
(506, 'soft-dream-dress_1650157515541744.jpeg', 210),
(507, 'soft-dream-dress_1650157515762467.jpeg', 210),
(508, 'soft-dream-dress_1650157515284730.jpeg', 210),
(517, 'carvings-set_165015864812744.jpeg', 219),
(518, 'carvings-set_1650158648837810.jpeg', 219),
(519, 'midriff_1650185142516760.jpeg', 220),
(520, 'midriff_1650185142130150.jpeg', 220),
(521, 'midriff_1650185142255698.jpeg', 220),
(522, 'elegant-jumpsuit_1650185320297932.jpeg', 221),
(523, 'elegant-jumpsuit_1650185320229862.jpeg', 221),
(524, 'multicolored-set_1650185631123376.jpeg', 222),
(525, 'elegant-dress-with-sleeves_1650185820791638.jpeg', 223),
(526, 'abaya-3-pieces_1650186315441482.jpeg', 224),
(527, 'short-black-and-white-dress_1650187460463930.jpeg', 225),
(528, 'short-dress_1650187784153135.jpeg', 226),
(529, 'summer-color-blouse_1650188069187741.jpeg', 227),
(535, 'blouse-with-slits_1650197906272726.jpeg', 229),
(536, 'blouse-with-slits_1650197906752480.jpeg', 229),
(537, 'short-color-dress_1650198204272406.jpeg', 230),
(538, 'wide-pants_1650198385561672.jpeg', 231),
(539, 'wide-pants_1650198385664612.jpeg', 231),
(541, 'occasions-jumpsuit_1650236688224300.jpeg', 232),
(542, 'occasions-jumpsuit_1650236688614569.jpeg', 232),
(543, 'soft-outfit_1650237052738754.jpeg', 233),
(544, 'sleeveless-blazer_1650245400607009.jpeg', 234),
(545, 'sleeveless-blazer_1650245401201048.jpeg', 234),
(546, 'sleeveless-blazer_1650245401589880.jpeg', 234),
(547, 'embroidered-blazer_1650245675550538.jpeg', 235),
(548, 'embroidered-blazer_165024567545192.jpeg', 235),
(553, 'outfit-3-pics-elegant_1650247092255108.jpeg', 237),
(554, 'stylish-3-piece-set-for-boys_1650390643460964.jpeg', 237),
(555, 'nautical_1650406057355337.jpeg', 233),
(556, 'nautical_1650406057251412.jpeg', 233),
(557, 'nautical_1650406057886771.jpeg', 233),
(558, 'maldives_1650407187275832.jpeg', 230),
(559, 'formal-suit_1650408138150575.jpeg', 228),
(560, 'formal-suit_1650408138256280.jpeg', 228),
(569, 'floried_1650411670590898.jpeg', 240),
(570, 'floried_1650411670701940.jpeg', 240),
(571, 'floried_1650411766527194.jpeg', 240),
(574, 'luxury_1650415239741192.jpeg', 242),
(575, 'luxury_1650415239468280.jpeg', 242),
(576, 'luxury_1650415239729177.jpeg', 242),
(577, 'abnormal_1650415637526400.jpeg', 243),
(578, 'abnormal_1650415637267440.jpeg', 243),
(579, 'abnormal_1650415637126784.jpeg', 243),
(580, 'abnormal_1650415637397137.jpeg', 243),
(581, 'abnormal_1650415637367695.jpeg', 243),
(582, 'abnormal_1650415637247686.jpeg', 243),
(583, 'three-piece-suit-jacket-skirt-and-belt_1650494389231974.jpeg', 244),
(584, 'three-piece-suit-jacket-skirt-and-belt_1650494389481537.jpeg', 244),
(585, 'yellow-floral-print-dress_1650494769604976.jpeg', 245),
(586, 'yellow-floral-print-dress_1650494769179845.jpeg', 245),
(603, 'comforts_1650577268262501.jpeg', 251),
(604, 'comforts_1650577268776880.jpeg', 251),
(610, 'exceptional_1650582508112099.jpeg', 224),
(611, 'exceptional_1650582508313435.jpeg', 224),
(612, 'fancy_165058444936889.jpeg', 257),
(613, 'fancy_1650584449334561.jpeg', 257),
(614, 'fancy_1650584449214358.jpeg', 257),
(615, 'fancy_165058444914159.jpeg', 257),
(616, 'eyes_1650584996611350.jpeg', 258),
(622, 'caraclan_1650732565167744.jpeg', 260),
(623, 'caraclan_1650732565437442.jpeg', 260),
(624, 'caraclan_1650732565758881.jpeg', 260),
(625, 'eid-dress_1650795043274265.jpeg', 207),
(626, 'eid-dress_1650795043200728.jpeg', 207),
(627, 'eid-dress_165079512444729.jpeg', 207),
(628, 'three-piece-suit-jacket-skirt-and-belt_1651005655518215.jpeg', 244),
(630, 'stupendous_1651007123656957.jpeg', 236),
(631, 'stupendous_1651007123427873.jpeg', 236),
(632, 'stupendous_1651007123721733.jpeg', 236),
(633, 'stupendous_1651007123579321.jpeg', 236),
(639, 'bdl-ktaatyn_1651660664746081.jpeg', 261),
(640, 'bdl-ktaatyn_1651660664889971.jpeg', 261),
(641, 'bdl-ktaatyn_1651660664371099.jpeg', 261),
(642, 'natural_1651660762147747.jpeg', 216),
(643, 'natural_1651660762209838.jpeg', 216),
(648, 'long-blouse-pants-set_1652605901239143.jpeg', 264),
(649, 'long-blouse-pants-set_1652605901104635.jpeg', 264),
(650, 'long-blouse-pants-set_1652605901187631.jpeg', 264),
(651, 'long-blouse-pants-set_1652605901138180.jpeg', 264),
(652, 'long-blouse-pants-set_165260590128317.jpeg', 264),
(654, 'floral-print-dress_165260752465392.jpeg', 213),
(655, 'floral-print-dress_1652607524722284.jpeg', 213),
(656, '2-piece-set-belt_1652692915689052.jpeg', 266),
(657, '2-piece-set-belt_1652692915361209.jpeg', 266),
(658, '2-piece-set-belt_1652692915138172.jpeg', 266),
(659, '2-piece-set-belt_1652692915323082.jpeg', 266),
(660, '2-piece-set-belt_1652692915714540.jpeg', 266),
(661, 'chiffon-dress-embroidered-on-the-chest_1652694246190225.jpeg', 267),
(662, 'chiffon-dress-embroidered-on-the-chest_1652694246796202.jpeg', 267),
(663, 'chiffon-dress-embroidered-on-the-chest_1652694246230470.jpeg', 267),
(664, 'chiffon-dress-embroidered-on-the-chest_1652694246614252.jpeg', 267),
(665, 'chiffon-dress-embroidered-on-the-chest_1652694246332994.jpeg', 267),
(666, 'chiffon-dress-embroidered-on-the-chest_1652694246108827.jpeg', 267),
(667, 'chiffon-dress-embroidered-on-the-chest_1652694247512045.jpeg', 267),
(668, 'chiffon-dress-embroidered-on-the-chest_1652694247601563.jpeg', 267),
(669, 'sequined-long-open-sleeves-soft-maxi-dress_1652697252612787.jpeg', 268),
(670, 'sequined-long-open-sleeves-soft-maxi-dress_1652697252323066.jpeg', 268),
(671, 'sequined-long-open-sleeves-soft-maxi-dress_1652697252814363.jpeg', 268),
(672, 'sequined-long-open-sleeves-soft-maxi-dress_1652697252695742.jpeg', 268),
(673, 'two-piece-set-sequins-on-the-shoulders-and-the-ch_1652701483806178.jpeg', 269),
(674, 'two-piece-set-sequins-on-the-shoulders-and-the-ch_1652701483431880.jpeg', 269),
(675, 'two-piece-set-sequins-on-the-shoulders-and-the-ch_1652701483102694.jpeg', 269),
(676, 'two-piece-set-sequins-on-the-shoulders-and-the-ch_165270148313298.jpeg', 269),
(677, 'two-piece-set-sequins-on-the-shoulders-and-the-ch_1652701483719444.jpeg', 269),
(679, 'two-piece-set-sequins-on-the-shoulders-and-the-ch_165270148322463.jpeg', 269),
(680, 'dress-jacket_1652869460531633.jpeg', 270),
(681, 'dress-jacket_165286946093415.jpeg', 270),
(682, 'dress-jacket_1652869460548226.jpeg', 270),
(683, 'dress-jacket_1652869460309481.jpeg', 270),
(684, 'dress-jacket_165286946024901.jpeg', 270),
(685, 'dress-jacket_1652869460219996.jpeg', 270),
(686, 'dress-jacket_1652869461395910.jpeg', 270),
(687, 'dress-jacket_1652869461490110.jpeg', 270),
(688, 'plain-short-dress_165291668510557.jpeg', 271),
(689, 'plain-short-dress_1652916685497165.jpeg', 271),
(690, 'short-sleeve-puff-sleeve-dress_1652916934112607.jpeg', 272),
(691, 'short-sleeve-puff-sleeve-dress_1652916934468244.jpeg', 272),
(697, 'fsta-ksyr-bnkoshat_1652918090201687.jpeg', 276),
(698, 'fluffy-dress_1652918258605133.jpeg', 277),
(699, 'fluffy-dress_1652918258384209.jpeg', 277),
(703, 'two-piece-dress_1652918898477613.jpeg', 280),
(704, 'two-piece-dress_1652918898768334.jpeg', 280),
(705, 'tkm-ktaatyn_1652919241643800.jpeg', 281),
(706, '2-piece-set_1652919576108048.jpeg', 282),
(707, 'stylish-dress-for-girls_1652951743829148.jpeg', 283),
(708, 'stylish-dress-for-girls_1652951744491122.jpeg', 283),
(709, 'stylish-dress-for-girls_1652951744270126.jpeg', 283),
(710, 'stylish-dress-for-girls_1652951744601022.jpeg', 283),
(711, 'stylish-dress-for-girls_165295174434586.jpeg', 283),
(712, 'stylish-dress-for-girls_1652951744466476.jpeg', 283),
(713, 'stylish-dress-for-girls_1652951744382792.jpeg', 283),
(714, 'stylish-girls-abaya_1652954635474972.jpeg', 284),
(715, 'stylish-girls-abaya_165295463514810.jpeg', 284),
(716, 'stylish-girls-abaya_1652954635543385.jpeg', 284),
(717, 'stylish-girls-abaya_1652954635898331.jpeg', 284),
(718, 'stylish-girls-abaya_1652954636135893.jpeg', 284),
(719, 'stylish-girls-abaya_1652954636697456.jpeg', 284),
(720, 'stylish-girls-abaya_165295463620613.jpeg', 284),
(721, 'stylish-girls-abaya_1652954636211257.jpeg', 284),
(722, 'stylish-girls-abaya_1652954636139109.jpeg', 284),
(723, 'summer-color-blouse_1653121870252758.jpeg', 227),
(729, '4-piece-suit_1653129303417439.jpeg', 286),
(730, '4-piece-suit_1653129303344804.jpeg', 286),
(731, '4-piece-suit_1653129303174005.jpeg', 286),
(732, '4-piece-suit_1653129304761073.jpeg', 286),
(733, '4-piece-suit_1653129304265794.jpeg', 286),
(734, '4-piece-suit_1653129304261424.jpeg', 286),
(735, '4-piece-suit_1653129304664850.jpeg', 286),
(736, '4-piece-suit_1653129304349959.jpeg', 286),
(737, '4-piece-suit_1653129304751507.jpeg', 286),
(738, 'draa-2022_1653129766593868.jpeg', 287),
(739, 'draa-2022_1653129766807426.jpeg', 287),
(740, 'draa-2022_1653129766310745.jpeg', 287),
(741, 'draa-2022_1653129767767455.jpeg', 287),
(742, 'draa-2022_1653129767802035.jpeg', 287),
(743, 'draa-2022_1653129767587348.jpeg', 287),
(744, 'tring-athlete_165313051157587.jpeg', 288),
(745, 'tring-athlete_1653130511397156.jpeg', 288),
(746, 'tring-athlete_1653130511809640.jpeg', 288),
(747, 'tring-athlete_1653130511422528.jpeg', 288),
(748, 'tring-athlete_1653130511131672.jpeg', 288),
(749, 'tring-athlete_1653130511541557.jpeg', 288),
(750, 'blouse-with-a-wide-neck-print_1653211942688491.jpeg', 289),
(751, 'blouse-with-a-wide-neck-print_1653211943165140.jpeg', 289),
(752, 'blouse-with-a-wide-neck-print_1653211943530971.jpeg', 289),
(753, 'blouse-with-a-wide-neck-print_1653211943664635.jpeg', 289),
(754, 'modern-draa_1653212466356004.jpeg', 290),
(755, 'modern-draa_1653212466501371.jpeg', 290),
(756, 'modern-draa_1653212466372007.jpeg', 290),
(757, 'modern-draa_165321246638855.jpeg', 290),
(758, 'modern-draa_1653212466614591.jpeg', 290),
(759, 'modern-draa_1653212466353361.jpeg', 290),
(760, 'modern-draa_1653212466425669.jpeg', 290),
(761, 'very-elegant-two-piece-set_1653221840316923.jpeg', 291),
(762, 'very-elegant-two-piece-set_1653221841762856.jpeg', 291),
(763, 'very-elegant-two-piece-set_1653221841726526.jpeg', 291),
(764, 'very-elegant-two-piece-set_1653221841576110.jpeg', 291),
(765, 'very-elegant-two-piece-set_165322184167719.jpeg', 291),
(766, 'very-elegant-two-piece-set_1653221841166744.jpeg', 291),
(767, 'very-elegant-two-piece-set_1653221841752037.jpeg', 291),
(769, 'tkm-rsmy_1653251082388845.jpeg', 204),
(770, 'multicolored-dress_1653296147762442.jpeg', 292),
(771, 'multicolored-dress_1653296147443615.jpeg', 292),
(772, 'womens-casual-two-piece-set_1653297776858364.jpeg', 293),
(773, 'womens-casual-two-piece-set_1653297776422286.jpeg', 293),
(774, 'womens-casual-two-piece-set_1653297776754255.jpeg', 293),
(775, 'tight-leg-jumpsuit-with-pleated-front-layers-and-o_1653299649339637.jpeg', 294),
(776, 'tight-leg-jumpsuit-with-pleated-front-layers-and-o_1653299649211251.jpeg', 294),
(777, 'tight-leg-jumpsuit-with-pleated-front-layers-and-o_1653299649795956.jpeg', 294),
(778, 'zara-jumpsuit_1653303482833437.jpeg', 295),
(779, 'zara-jumpsuit_1653303482842580.jpeg', 295),
(780, 'zara-jumpsuit_1653303483382758.jpeg', 295),
(781, 'elegant-veiled-dress_165339042531783.jpeg', 296),
(782, 'elegant-veiled-dress_1653390425362333.jpeg', 296),
(783, 'elegant-veiled-dress_1653390425669118.jpeg', 296),
(784, 'elegant-veiled-dress_1653390425660177.jpeg', 296),
(785, 'elegant-veiled-dress_1653390425245416.jpeg', 296),
(786, 'elegant-veiled-dress_1653390426158158.jpeg', 296),
(787, 'elegant-veiled-dress_1653390426799416.jpeg', 296),
(788, 'elegant-veiled-dress_1653390426406499.jpeg', 296),
(789, 'elegant-veiled-dress_1653390426810351.jpeg', 296),
(790, 'elegant-veiled-dress_1653390426109478.jpeg', 296),
(791, 'elegant-veiled-dress_165339042642110.jpeg', 296),
(792, 'elegant-veiled-dress_1653390426668598.jpeg', 296),
(793, 'elegant-veiled-dress_1653390426368374.jpeg', 296),
(794, 'elegant-veiled-dress_1653390426141709.jpeg', 296),
(795, 'elegant-veiled-dress_1653390426526738.jpeg', 296),
(796, 'elegant-veiled-dress_1653390426755339.jpeg', 296),
(797, 'elegant-veiled-dress_1653390426810790.jpeg', 296),
(798, 'elegant-veiled-dress_1653390426480385.jpeg', 296),
(799, 'elegant-veiled-dress_1653390426859253.jpeg', 296),
(800, 'evening-dresses_1653391382651870.jpeg', 297),
(801, 'evening-dresses_1653391382410457.jpeg', 297),
(802, 'evening-dresses_1653391382513403.jpeg', 297),
(803, 'evening-dresses_1653391382359016.jpeg', 297),
(804, 'evening-dresses_1653391382545980.jpeg', 297),
(805, 'evening-dresses_1653391382690446.jpeg', 297),
(806, 'evening-dresses_1653391382714020.jpeg', 297),
(807, 'evening-dresses_1653391382793416.jpeg', 297),
(808, 'evening-dresses_1653391382459525.jpeg', 297),
(809, 'evening-dresses_1653391382359307.jpeg', 297),
(810, 'evening-dresses_1653391382171622.jpeg', 297),
(811, 'evening-dresses_1653391382492025.jpeg', 297),
(812, 'evening-dresses_1653391382770234.jpeg', 297),
(813, 'evening-dresses_1653391382886586.jpeg', 297),
(814, 'evening-dresses_1653391383533966.jpeg', 297),
(815, 'evening-dresses_1653391383498706.jpeg', 297),
(816, 'floral-print-dress_1653413658687152.jpeg', 213),
(817, 'floral-print-dress_1653413658757571.jpeg', 213),
(819, 'lovers-two-piece-dress_1653729975223338.jpeg', 299),
(820, 'lovers-two-piece-dress_1653729975425360.jpeg', 299),
(821, 'lovers-two-piece-dress_1653729975288588.jpeg', 299),
(822, 'lovers-two-piece-dress_165372997599916.jpeg', 299),
(823, 'lovers-two-piece-dress_1653729975446340.jpeg', 299),
(824, 'lovers-two-piece-dress_1653729975882031.jpeg', 299),
(825, 'two-piece-set-blouse-pants_1653730249395092.jpeg', 300),
(826, 'two-piece-set-blouse-pants_1653730249880136.jpeg', 300),
(827, 'two-piece-set-blouse-pants_1653730249554094.jpeg', 300),
(828, 'two-piece-set-blouse-pants_1653730249314704.jpeg', 300),
(829, 'daraa_1653731150262826.jpeg', 301),
(830, 'daraa_1653731150601359.jpeg', 301),
(831, 'daraa_1653731151140300.jpeg', 301),
(832, 'daraa_1653731151298378.jpeg', 301),
(833, 'daraa_1653731151134996.jpeg', 301),
(834, 'daraa_165373115127300.jpeg', 301),
(835, 'daraa_1653731151483466.jpeg', 301),
(836, 'daraa_165373115120838.jpeg', 301),
(837, 'daraa_1653731151539400.jpeg', 301),
(838, 'couples-gym-outfit_1653731884584491.jpeg', 302),
(839, 'couples-gym-outfit_1653731884269764.jpeg', 302),
(840, 'couples-gym-outfit_1653731884687539.jpeg', 302),
(841, 'couples-gym-outfit_1653731884186800.jpeg', 302),
(842, 'couples-gym-outfit_1653731884429509.jpeg', 302),
(843, 'couples-gym-outfit_1653731884717419.jpeg', 302),
(844, 'couples-gym-outfit_165373188497346.jpeg', 302),
(845, 'couples-gym-outfit_1653731884148308.jpeg', 302),
(846, 'couples-gym-outfit_1653731884795715.jpeg', 302),
(847, 'couples-gym-outfit_1653731884793169.jpeg', 302),
(848, 'couples-gym-outfit_1653731884856590.jpeg', 302),
(849, 'couples-gym-outfit_1653731884695989.jpeg', 302),
(850, 'floral-print-dress_1653759714322303.jpeg', 303),
(851, 'floral-print-dress_1653759714384427.jpeg', 303),
(852, 'floral-print-dress_1653759714592705.jpeg', 303),
(853, 'floral-print-dress_1653759714208835.jpeg', 303),
(857, 'fstan-ksyr-ktaatyn_165436005542200.jpeg', 306),
(858, 'two-piece-set-blouse-and-pants_1655137763166792.jpeg', 307),
(859, 'two-piece-set-blouse-and-pants_1655137764554814.jpeg', 307),
(860, 'two-piece-set-blouse-and-pants_1655137764624739.jpeg', 307),
(861, 'two-piece-set-blouse-and-pants_1655137764479303.jpeg', 307),
(862, 'tkm-rsmy_165555489178295.jpeg', 204),
(863, 'tkm-rsmy_1655554891814186.jpeg', 204),
(864, 'zippered-short-dress_1656155821837926.jpeg', 308),
(865, 'embroidered-embroidered-dress_1656156176340170.jpeg', 310),
(866, 'long-flowy-dress_1656156471441478.jpeg', 311),
(867, 'dress-long_1656156649181529.jpeg', 312),
(868, 'long-dress_1656156915752980.jpeg', 313),
(871, 'three-piece-suit-jacket-skirt-and-belt_1656161424804748.jpeg', 244),
(876, 'wooden_1656324318608703.jpeg', 241),
(877, 'wooden_1656324318464699.jpeg', 241),
(878, 'unique_1656326328837436.jpeg', 316),
(879, 'unique_1656326328172377.jpeg', 316),
(880, 'unique_1656326328600645.jpeg', 316),
(881, 'unique_1656326328537061.jpeg', 316),
(882, 'unique_1656326328296086.jpeg', 316),
(883, 'comforts_1656335904400901.jpeg', 251),
(884, 'comforts_1656335904421827.jpeg', 251),
(885, 'comforts_165633590444038.jpeg', 251),
(886, 'comforts_1656335904246354.jpeg', 251),
(887, 'comforts_1656335904193906.jpeg', 251),
(888, 'bdl-ktaatyn_1656335958703632.jpeg', 261),
(889, 'bdl-ktaatyn_1656335958537840.jpeg', 261),
(890, 'bdl-ktaatyn_1656335958311214.jpeg', 261),
(891, 'bdl-ktaatyn_1656335958327704.jpeg', 261),
(892, 'princess-dress_165641373663574.jpeg', 317),
(893, 'princess-dress_1656413736604140.jpeg', 317),
(894, 'princess-dress_1656413736746392.jpeg', 317),
(895, 'princess-dress_1656413736110807.jpeg', 317),
(896, 'princess-dress_1656413736150924.jpeg', 317),
(897, 'princess-dress_1656413736737133.jpeg', 317),
(898, 'princess-dress_1656413736437556.jpeg', 317),
(899, 'princess-dress_1656413736863361.jpeg', 317),
(900, 'fluffy-chiffon-dress_1656413910795306.jpeg', 318),
(901, 'fluffy-chiffon-dress_165641391066068.jpeg', 318),
(902, 'fluffy-chiffon-dress_1656413910729398.jpeg', 318),
(903, 'fluffy-chiffon-dress_1656413910323546.jpeg', 318),
(904, 'fluffy-chiffon-dress_165641391026280.jpeg', 318),
(905, 'fluffy-chiffon-dress_1656413910885834.jpeg', 318),
(906, 'floral-print-dress_1656414078670394.jpeg', 319),
(907, 'floral-print-dress_1656414078635678.jpeg', 319),
(908, 'floral-print-dress_1656414078203512.jpeg', 319),
(909, 'floral-print-dress_1656414078579785.jpeg', 319),
(910, 'floral-print-dress_1656414078315136.jpeg', 319),
(911, 'floral-print-dress_1656414078395233.jpeg', 319),
(912, 'floral-print-dress_1656414078735599.jpeg', 319),
(913, 'floral-print-dress_1656414078161203.jpeg', 319),
(914, 'princess-fluffy-dress_165641943217722.jpeg', 320),
(915, 'princess-fluffy-dress_1656419432610055.jpeg', 320),
(916, 'princess-fluffy-dress_1656419432303058.jpeg', 320),
(917, 'princess-fluffy-dress_165641943233571.jpeg', 320),
(918, 'princess-fluffy-dress_1656419432876077.jpeg', 320),
(919, 'princess-fluffy-dress_1656419432701997.jpeg', 320),
(920, 'princess-fluffy-dress_1656419432659883.jpeg', 320),
(921, 'princess-fluffy-dress_1656419432212994.jpeg', 320),
(958, 'plants_1657027894539273.jpeg', 339),
(959, 'plants_1657027894856959.jpeg', 339),
(960, 'burkini-3-pieces_1657714471571211.jpeg', 340),
(961, 'burkini-3-pieces_1657714471647232.jpeg', 340),
(962, 'burkini-3-pieces_1657714471479883.jpeg', 340),
(963, 'burkini-3-pieces_1657714471890405.jpeg', 340),
(964, 'burkini-3-pieces_1657714471645334.jpeg', 340),
(965, 'burkini-3-pieces_1657714472673162.jpeg', 340),
(966, 'burkini-3-pieces_1657714472198454.jpeg', 340),
(967, 'burkini-3-pieces_1657714472615350.jpeg', 340),
(968, 'burkini-3-pieces_1657714472297381.jpeg', 340),
(969, 'burkini-3-pieces_1657714472757766.jpeg', 340),
(970, 'burkini-3-pieces_165771447277518.jpeg', 340);

-- --------------------------------------------------------

--
-- Table structure for table `infos`
--

CREATE TABLE `infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description_ar` text NOT NULL,
  `description_en` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `infos`
--

INSERT INTO `infos` (`id`, `name`, `description_ar`, `description_en`, `type`, `sort`, `created_at`, `updated_at`) VALUES
(2, 'سياسة التوصيل', 'سياسة التوصيل المعلومات التالية توضح التفاصيل الخاصة بتكاليف ومدة التوصيل: القيام بطلب: عند قيام العميل بتقديم طلب من خلال موقع تطبيق وموقع مالتي سيقوم باستقبال رسالة من فريقنا على بريده الالكتروني لتأكيد تفعيل الطلب. تحتوى هذه الرسالة على رقم الطلب بالإضافة إلى كافة التفاصيل الكاملة الخاصة به. فى حالة ضياع / عدم استكمال البيانات، سيقوم احد موظفي خدمة العملاء بالتواصل مع العميل لاستكمال البيانات والانتهاء من تنفيذ الطلب. التوصيل داخل دولة الكويت: تكلفة خدمة التوصيل: تحدد التكلفة علي حسب المنطقة يرجى التأكد من استكمال المعلومات الخاصة بالعنوان وإضافة رقم هاتف متاح أثناء الطلب لتجنب أي تأخير.', 'Delivery Policy The following information details the costs and duration of delivery: Make an order: When the customer submits an application through the application website and the Malty website, he will receive a message from our team on his e-mail to confirm the activation of the request. This letter contains the order number as well as all its complete details. In the event of loss/incompletion of the data, one of the customer service staff will contact the customer to complete the data and complete the implementation of the request. Delivery within the State of Kuwait: The cost of the delivery service: The cost is determined by the region Please make sure to complete the address information and add a phone number available during ordering to avoid any delays.', 'delivery', 1, '2021-11-03 04:39:58', '2022-04-15 09:12:46'),
(3, 'information', 'حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية. حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية. حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية. حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية. حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية. حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية. حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية. حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية. حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية. حول موقع التطبيق ، إنه تطبيق بسيط للغاية مع واجهة مستخدم ذكية للمسة الذكية.', 'about app website its a very simple app with smart ui for smart touch. about app website its a very simple app with smart ui for smart touch. about app website its a very simple app with smart ui for smart touch. about app website its a very simple app with smart ui for smart touch. about app website its a very simple app with smart ui for smart touch. about app website its a very simple app with smart ui for smart touch. about app website its a very simple app with smart ui for smart touch. about app website its a very simple app with smart ui for smart touch. about app website its a very simple app with smart ui for smart touch. about app website its a very simple app with smart ui for smart touch.', 'information', 1, '2021-11-03 04:40:17', '2021-12-26 03:29:50'),
(4, 'how to use', 'مالتي- مزيج من روح الشباب والمرح والأصالة، يأخذك إلى عالم تسوق إلكتروني فريد من نوعه في الشرق الأوسط. مالتي النافذة الأوسع التي يطل منها عشاق الموضة، وخاصة الشباب، على أحدث الإتجاهات وآخر الصرعات في عالم الأزياء لكل ما تقدمه لهم من تنوع هائل من المنتجات وأرقى الموديلات، ناهيك عن السهولة واليسر للحصول على كل ما يرغبون به. مالتي مصدر الإلهام والمرشد الأمثل لكل محبي عالم الأزياء وفنونه. إن التنوع الذي تمتاز به منتجات مالتي التي توفرها جعل منها الوجهة الأولى لمحبي الموضة ومتابعيها في كل مكان.', 'Multi- A mixture of youth, fun and originality, takes you to a unique online shopping world in the Middle East. Multi is the widest window from which fashion lovers, especially young people, overlook the latest trends and the latest trends in the world of fashion for all that it offers them of a huge variety of products and the finest models, not to mention the ease and ease of obtaining everything they desire. Multi is the perfect inspiration and guide for all lovers of the world of fashion and its arts. The diversity that characterizes the products of Multi that it provides has made it the first destination for fashion lovers and followers everywhere.', 'howToUse', 1, '2021-11-03 04:40:48', '2022-05-16 12:52:56'),
(5, 'الاسئلة الشائعة', 'ما الفرق بين إرجاع منتج إلينا وتبديله بمقاس آخر؟ الاستبدال: • عند إنشاء عملية الاستبدال، يمكنك تبديل أي منتج طلبته باختيار مقاس آخر من نفس المنتج (فيما عدا المنتجات التي تندرج تحت خصوصية الشركة بعدم الإرجاع)', 'What is the difference between returning a product to us and exchanging it for another size? substitution: • When creating the exchange process, you can exchange any product you ordered by choosing another size of the same product (except for products that fall under the company\'s privacy non-return)', 'question', 1, '2021-11-03 04:41:08', '2022-05-16 13:07:36');
INSERT INTO `infos` (`id`, `name`, `description_ar`, `description_en`, `type`, `sort`, `created_at`, `updated_at`) VALUES
(6, 'Terms and Conditions', '<p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 18.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">اتفاقية الاستخدام</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">مقدّمة اتفاقية الاستخدام:</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">منصة التجارة الإلكترونية ترحب بكم ، المسجلة قانونياً لدى مصلحة السجل التجاري تحت الرقم التسلسلي (500135214)، نود أن نبلغكم بأنكم سوف تجدون أدناه الشروط والأحكام المُنظّمة لاستخدامكم لهذه المنصة وكافة الآثار القانونية التي تنتج عن استخدامكم لخدماتها عبر الشبكة العنكبوتية ، حيث أن استخدام أي شخصٍ كان لمنصة ديبوسيدو سواءً كان مستهلكاً لخدمة أو لمنتج أو غير ذلك فإن هذا موافقة وقبول منه وهو بكامل أهليته المعتبرة شرعاً ونظاماً وقانوناً لكافة مواد وأحكام هذه الاتفاقية وهو تأكيد لالتزامكم بأنظمتها ولما ذُكر فيها، وتسري هذه الاتفاقية على جميع أنواع التعامل بين المستخدم وبين المنصة فيما عدا التعاملات المتعلّقة بالأحوال الشخصية والتعاملات الخاصة بإصدار الصكوك المتعلّقة بالتصرفات الواردة على العقار. وتعتبر هذه الاتفاقية سارية المفعول ونافذة بمجرد قيامكم بالموافقة عليها والبدء في التسجيل بالمنصة .</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">المقدّمة والتعريفات:</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يعتبر التمهيد أعلاه جزءاً لا يتجزأ من هذه الاتفاقية ، كما تجدون أدناه الدلالات والتعريفات للعبارات الرئيسية المستخدمة في هذه الاتفاقية :</span></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">( المنصة ) يقصَد بهذه العبارة منصة ديبوسيدو، ويشمل هذا التعريف كافة أشكال المنصة على الشبكة العنكبوتية، سواءً كانت تطبيق إلكتروني، أو موقع الكتروني على الشبكة العنكبوتية، أو محل تجاري أو إدارة .</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">( المستخدم ) يقصَد بهذه العبارة كل مستهلك يقوم بشراء المنتج أو الخدمة من المتجر عبر منصتنا الالكترونية.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">3.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">( المتاجر ) يقصَد بهذه العبارة التجار الذين يقومون بالبيع على المنصة عبر متاجرهم لدينا.</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">4.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">( الاتفاقية ) يقصَد بهذه العبارة شروط وأحكام هذه الاتفاقية، والتي تحكم وتنظّم العلاقة فيما بين أطراف هذه الاتفاقية.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">أهلية المستخدم القانونية:</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يقر المستخدم بأنه ذا أهلية قانونية معتبرة شرعاً ونظاماً للتعامل مع المتجر، أو أن عمره لا يقل عن ثمانية عشرة عاماً.</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يوافق المستخدم بأنه في حال مخالفته لأهلية المستخدم، فإنه يتحمّل تبعات هذه المخالفة أمام الغير.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span dir=\"LTR\" lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Arial; mso-bidi-language: AR-DZ;\">&nbsp;</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">طبيعة التزام المنصة:</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إن التزام المنصة تجاه المستهلكين أو المستخدمين و التجار هو توفير مساحة كاملة مجهزة من أجل ممارسة التجارة بالتجزئة لجميع أنواع المنتجات عبر الأنترنت مع تقديم خدمة التوصيل إلى غاية باب المنزل ( في إطار ما يسمح به القانون التجاري الجزائري ).</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">قد توفر المنصة خدمات أخرى كخدمات ما بعد البيع أو غيرها من الخدمات ذات العلاقة، وذلك يعود لطبيعة ونوع ( الخدمة أو المنتج ) المطلوبة من المستخدم.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">ضوابط استخدام المنصة :</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يلتزم المستخدم باستخدام المنصة الالكترونية الخاصة بديبوسيدو بما يتّفق مع الآداب العامة والأنظمة المعمول بها في الجزائر و الدين الإسلامي .</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يلتزم المستخدم عند شرائه لخدمة أو منتج من المنصة أن لا يستخدم هذه الخدمة أو المنتج بما يخالف الآداب العامة والأنظمة المعمول بها في الجزائر.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">الحسابات والتزامات التسجيل:</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">فور التقدم بطلب الانضمام إلى عضوية ديبوسيدو كمستخدم ( مستهلك ، تاجر ) تكون ملتزماً بالإفصاح عن معلومات محددة واختيار اسم مستخدم وكلمة مرور سرية لاستعمالهما عند الولوج لخدمات المنصة. وبذلك تكون قد وافقت على:</span></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">أن تكون مسؤولاً عن المحافظة على سرية معلومات حسابك وسرية كلمة المرور، وتكون بذلك موافقاً على إعلام المنصة &nbsp;حالاً بأي استخدام غير مفوض به لمعلومات حسابك لدى المنصة &nbsp;أو أي اختراق آخر لمعلوماتك السرية.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">لن تكون المنصة بأي حال من الأحوال مسؤولة عن أي خسارة قد تلحق بك بشكل مباشر أو غير مباشر معنويا أو ماديا نتيجة كشف معلومات اسم المستخدم أو كلمة المرور الخاصين بك.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">3.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">أنت تلتزم باستخدام حسابك أو عضويتك لدى المنصة بنفسك، حيث أنك مسؤولاً عنه مسؤولية كاملة، وفي حال استخدام غيرك له فهذه قرينة على أنك قد فوّضته باستخدام المتجر باسمك ولحسابك.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">4.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">أنت تلتزم عند استخدام المنصة أن تستخدمها بكل جدية ومصداقية.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">5.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">أنت تلتزم بالإفصاح عن معلومات حقيقية وصحيحة ومحدثة وكاملة وقانونية عن نفسك أو نشاطك التجاري حسبما هو مطلوب أثناء التسجيل لدى المنصة وتلتزم بتحديث بياناتك في تغييرها في الواقع أو في حال الحاجة إلى ذلك.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">6.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إن المنصة تلتزم بالتعامل مع معلوماتك الشخصية وعناوين الاتصال الخاصة بك بسريّة تامة.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">7.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إذا تبيّن للإدارة بأنك أفصحت عن معلومات غير حقيقية أو غير صحيحة أو غير راهنة أو غير كاملة أو غير قانونية او مخالفة لما جاء في اتفاقية الاستخدام، فإن المنصة تمتلك الحق في وقف أو تجميد أو إلغاء عضويتك وحسابك في المنصة، وذلك دون إلحاق الأضرار بحقوق المنصة الأخرى ووسائلها المشروعة في استرداد حقوقها وحماية باقي المستخدمين.</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">8.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">في حالة عدم الالتزام بأي مما ورد أعلاه فإن لإدارة المنصة الحق في إيقاف أو إلغاء عضويتك أو حجبك من الولوج لخدمات المنصة مرة أخرى.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">الاتصالات الإلكترونية ووسائل التواصل الرسمية:</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يوافق أطراف هذه الاتفاقية على أن التواصل يتم عبر البريد الإلكتروني أو رقم الجوال المسجّل في المنصّة.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يوافق المستخدم على أن جميع الاتفاقيات والإعلانات والبيانات والاتصالات الأخرى التي تزود بها الكترونياً تقوم مقام مثيلاتها المكتوبة ، وهي حجة قائمة بذاتها ، في تلبية الاحتياجات النظامية والشرعية.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يوافق المستخدم على إمكانية التواصل معه وتبليغه بأي أحكام تخص هذه الاتفاقية أو تخص التعامل معه من خلال قيام إدارة المنصة ببث رسائل عامة ترد إلى كافة المستخدمين أو إلى مستخدمين محددين للمنصة.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">الإدارة لا تضمن حقوق أي مستخدم يلجئ إلى التواصل و الاتصال عبر ما لم يتم ذكره أعلاه .</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إدارة المنصة لها الحق في استقبال الإبلاغات و النظر و تقديمها إلى الجهات المختصة .</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">التعديلات على إتفاقية الإستخدام والرسوم:</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إن المنصة قد تقوم بإعلامك عن أي تعديل على هذه الاتفاقية وفقاً لوسائل التواصل الرسمية بموجب هذه الاتفاقية، وبموجبه تتضاعف التزاماتك أو تتضاءل حقوقك وفقاً لأي تعديلات قد تجرى على هذه الاتفاقية.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">في حال الاعتراض على أي تعديل على اتفاقية الاستخدام تأمل منكم المنصة التوقف عن استخدام خدماتها، حيث أن مجرد ولوجكم إلى حسابكم في المنصة أو استخدامكم لها يُعد قبولًا منكم للتعديلات وموافقة كاملة تامة نافية للجهالة، وتقبل الإدارة المناقشة في أي اقتراح بشأن هذه الأحكام.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">( بالنسبة للمتاجر ) كافة الرسوم بالدينار الجزائري، وعلى التاجر دفع كافة الرسوم المستحقة بالمنصة مضافاً إليها أي نفقات أخرى تضيفها المنصة، على أن يتم السداد بواسطة الوسائل المعتمدة والمحددة والمتاحة عن طريق المنصة.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">قد تفرض المنصة رسومًا على بعض المستخدمين وذلك يعتمد على العروض أو المنتجات أو الخدمات التي يطلبونها أو ما تفرضه الدولة من رسوم أو ضرائب على طبيعة المنتج أو الخدمة.</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">تحتفظ المنصة بحقها في إضافة أو زيادة أو خفض أو خصم أي رسوم أو نفقات بموجب مواد وبنود وأحكام اتفاقية الاستخدام، على أي من المستخدمين أي كان سبب تسجيلهم.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">خدمات الدفع والسداد بالنسبة للمتاجر في المنصة :</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">توفر المنصة عبر شركائها نظام الدفع والسداد فيمكن أن يتم عبر الانترنت كليا من خلال خيارات الدفع المتوفرة على المنصة أو من خلال أي طريقة دفع توفرها المنصة من حين لآخر.</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">تلتزم المنصة بتحديد سعر الخدمة أو المنتج الذي تقوم بعرضه وفقاً للقيمة السوقية المتعارف عليها.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">الملكية الفكرية:</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إن حقوق الملكية الفكرية الخاصة بالمنصة هي حقوق مملوكة لديبوسيدو ملكية تامة، سواءً كانت مملوكة لهم قبل تأسيس هذه المنصة الالكترونية أم بعد تأسيسها.</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يحترم المستخدم أو المستهلك حقوق الملكية الفكرية الخاصة بنا ، والكلمات والشعارات والرموز الأخرى الخاصة بالمنصة أو المعروضة عليها، حيث أن المنصة، وكل حق يتبعها، هي حقوق مملوكة ملكية فكرية كاملة للمؤسسة.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">مسؤولية المنصة :</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">تلتزم المنصة بأن تمارس عملها التجاري عبر هذه المنصة الالكترونية بشكل نظامي ووفقاً للأنظمة المعمول بها في القانون الجزائري، ووفقاً لأحكام هذه الاتفاقية.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">المنصة لا تتحمل أي مطالبات تنشأ عن أخطاء أو إهمال ، سواء كانت ناتجة بشكل مباشر أو غير مباشر أو عرضي أو عن طريق المستخدم أو عن طريق طرف ثالث مثل شركات الشحن ، أو المتاجر .</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">تلتزم المنصة ومنسوبيها ومُلّاكها ومن يمثّلهما بأن يكون ( المنتج أو الخدمة ) سليمة و شرعية و مصرح به وفق قوانين وأنظمة القانون الجزائري ويتم استخدامه لأغراض شرعية.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">القانون أو النظام الواجب التطبيق:</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">اتفاقية الاستخدام هذه محكومة ومصاغة بحسب القوانين والأنظمة والتشريعات المعمول بها والسارية في القانون الجزائري، وهي خاضعة تمامًا وكليًا للأنظمة المعمول بها لدى السلطات في الجزائر.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">أحكام عامة:</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">في حال إلغاء أي مادة واردة أو بند ورد في اتفاقية الاستخدام هذه أو أن هناك أي مادة واردة أو أي بند وارد في اتفاقية الاستخدام لم يعد نافذًا، فإن مثل هذا الأمر لا يلغي صلاحية باقي المواد والبنود والأحكام الواردة في اتفاقية الاستخدام وتظل سارية حتى إشعار آخر من إدارة المنصة.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إتفاقية الإستخدام هذه - والتي قد تعدل بين حين وآخر بحسب مقتضى الحال - تُشكّل إتفاقية الإستخدام وآلية العمل والتفاهم والاتفاق والتعاقد بين المنصة وبين المستخدم، كما يوافق كلا أطراف هذه الاتفاقية على أن يوضع في عين الاعتبار ما يلي:</span></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إن اللغة العربية هي اللغة المعمول بها عند تفسير أحكام هذه الاتفاقية، أو عند ترجمتها إلى لغة أخرى.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إن جميع الأسعار المعروضة على خدمات أو منتجات المنصة قد تعدّل بين حينٍ وآخر دون سابق انذار وبالتالي فلن تكون الإدارة مسؤولة قانونياً اتجاه المستخدم او اي طرف ثالث عند اجراء اي تعديل، تغيير في السعر، ايقاف الخدمات مؤقتاً.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">3.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">إن العروض الترويجية أو التسويقية التي قد تضعها المنصة هي عروض مؤقتة، حيث أنه للإدارة الحق في تعديل هذه العروض الترويجية أو التسويقية في أي وقت أو إيقافها.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">4.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">يلتزم أطراف هذه الاتفاقية بالتعامل فيما بينهم بما لا يخالف القواعد الشرعية والأنظمة والقوانين المعمول بها ذات العلاقة بطبيعة التعامل بين المنصة و المتجر والمستخدم.</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">5.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">لا تُلغى اتفاقية الاستخدام هذه إلا بموجب قرار يصدر من إدارة المنصة.</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 15.0pt; line-height: 115%; mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">6.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">الضمان ضد اي عيب مصنعي يبقى بين المتجر و المستهلك ، ولا يشمل سوء استخدام المنتج من قبل المستهلك.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">سياسة الإستبدال والإسترجاع:</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-ascii-font-family: Calibri; mso-ascii-theme-font: minor-latin; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-language: AR-DZ;\">لكل متجر على المنصة سياسة الإستبدال و الإرجاع الخاصه به ،و بالتالي فإن كل شخص مسؤول عن معاملاته مع كل متجر ، و كذلك كل متجر ممتثل صاحبه أمام القانون .</span></p>', '<p class=\"MsoNormal\"><strong>Usage Agreement</strong></p> <p class=\"MsoNormal\"><strong>Introduction to the usage agreement:</strong></p> <p class=\"MsoNormal\"><strong>The e-commerce platform welcomes you, which is legally registered with the Commercial Registry Authority under the serial number (500135214), we would like to inform you that you will find below the terms and conditions governing your use of this platform and all the legal effects that result from your use of its services via the Internet, as the use of any person For the Deposido platform, whether it is a consumer of a service, a product, or otherwise, this is approval and acceptance by it, and it is in full capacity considered legally, system, and legal for all the articles and provisions of this agreement, and it is an affirmation of your commitment to its regulations and what is mentioned in it, and this agreement applies to all types of dealings between the user and the platform with the exception of transactions Related to personal status and transactions related to the issuance of deeds related to the dispositions of the real estate. This agreement is valid and enforceable as soon as you agree to it and start registering on the platform.</strong></p> <p class=\"MsoNormal\"><strong>Introduction and definitions:</strong></p> <p class=\"MsoNormal\"><strong>The preamble above is an integral part of this agreement. Below you will find the meanings and definitions of the main phrases used in this agreement:</strong></p> <p class=\"MsoNormal\"><strong>1. (Platform) This term means the Deposido platform, and this definition includes all forms of the platform on the Internet, whether it is an electronic application, a website on the Internet, a shop or an administration.</strong></p> <p class=\"MsoNormal\"><strong>2. (User) This term means every consumer who purchases a product or service from the store through our electronic platform.</strong></p> <p class=\"MsoNormal\"><strong>3. (Stores) This term means merchants who sell on the Platform through their stores with us.</strong></p> <p class=\"MsoNormal\"><strong>4. (Agreement) This term means the terms and conditions of this Agreement, which govern and regulate the relationship between the parties to this Agreement.</strong></p> <p class=\"MsoNormal\"><strong>User eligibility:</strong></p> <p class=\"MsoNormal\"><strong>&bull; The user acknowledges that he has legal capacity considered in Sharia and system to deal with the store, or that he is at least eighteen years old.</strong></p> <p class=\"MsoNormal\"><strong>&bull; The user agrees that if he violates the user\'s eligibility, he will bear the consequences of this violation in front of third parties.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>The nature of the platform&rsquo;s commitment:</strong></p> <p class=\"MsoNormal\"><strong>&bull; The commitment of the platform towards consumers or users and merchants is to provide a fully equipped space for the practice of retail trade of all types of products via the Internet with the provision of delivery service to the door of the house (within the framework of what is permitted by the Algerian commercial law).</strong></p> <p class=\"MsoNormal\"><strong>&bull; The platform may provide other services such as after-sales services or other related services, due to the nature and type of (service or product) required from the user.</strong></p> <p class=\"MsoNormal\"><strong>Terms of use of the platform:</strong></p> <p class=\"MsoNormal\"><strong>&bull; The user is committed to using the electronic platform of Deposido in accordance with public morals and regulations in force in Algeria and the Islamic religion.</strong></p> <p class=\"MsoNormal\"><strong>&bull; When purchasing a service or product from the platform, the user is obligated not to use this service or product in violation of public morals and the regulations in force in Algeria.</strong></p> <p class=\"MsoNormal\"><strong>Accounts and registration obligations:</strong></p> <p class=\"MsoNormal\"><strong>As soon as you apply to join Deposido membership as a user (consumer, trader), you are obligated to disclose specific information and choose a secret username and password to use when accessing the platform services. By doing so, you agree to:</strong></p> <p class=\"MsoNormal\"><strong>1. To be responsible for maintaining the confidentiality of your account information and the confidentiality of the password, and by that you agree to inform the platform immediately of any unauthorized use of your account information with the platform or any other breach of your confidential information.</strong></p> <p class=\"MsoNormal\"><strong>2. The platform will not, in any way, be responsible for any loss that may be caused to you, directly or indirectly, morally or financially, as a result of revealing your username or password information.</strong></p> <p class=\"MsoNormal\"><strong>3. You are obligated to use your account or membership on the platform yourself, as you are fully responsible for it, and if someone else uses it, this is an indication that you have authorized them to use the store in your name and for your account.</strong></p> <p class=\"MsoNormal\"><strong>4. You are committed when using the platform to use it with all seriousness and credibility.</strong></p> <p class=\"MsoNormal\"><strong>5. You are obligated to disclose true, correct, updated, complete and legal information about yourself or your business as required during registration with the platform and you are obligated to update your data in changing it in reality or in case of need.</strong></p> <p class=\"MsoNormal\"><strong>6. The platform is committed to dealing with your personal information and contact addresses in strict confidentiality.</strong></p> <p class=\"MsoNormal\"><strong>7. If it appears to the administration that you have disclosed information that is not true, incorrect, non-current, incomplete, illegal, or contrary to what was stated in the usage agreement, the platform has the right to suspend, freeze or cancel your membership and account on the platform, without causing damages. With the rights of the other platform and its legitimate means to recover its rights and protect the rest of the users.</strong></p> <p class=\"MsoNormal\"><strong>8. In the event that you do not comply with any of the above, the platform management has the right to suspend or cancel your membership or block you from accessing the platform services again.</strong></p> <p class=\"MsoNormal\"><strong>Electronic communications and official means of communication:</strong></p> <p class=\"MsoNormal\"><strong>&bull; The parties to this agreement agree that communication takes place via e-mail or the mobile number registered on the platform.</strong></p> <p class=\"MsoNormal\"><strong>&bull; The user agrees that all agreements, advertisements, data and other communications that are provided electronically take the place of their written counterparts, which is a stand-alone argument, in meeting the legal and legitimate needs.</strong></p> <p class=\"MsoNormal\"><strong>&bull; The user agrees to be able to communicate with him and inform him of any provisions related to this agreement or dealing with him through the platform management broadcasting general messages received to all users or to specific users of the platform.</strong></p> <p class=\"MsoNormal\"><strong>&bull; The administration does not guarantee the rights of any user who resorts to communication and communication via what is not mentioned above.</strong></p> <p class=\"MsoNormal\"><strong>&bull; The management of the platform has the right to receive reports, consider and submit them to the competent authorities.</strong></p> <p class=\"MsoNormal\"><strong>Amendments to the Terms of Use and Fees Agreement:</strong></p> <p class=\"MsoNormal\"><strong>&bull; The platform may notify you of any amendment to this agreement in accordance with the official means of communication under this agreement, according to which your obligations are doubled or your rights are diminished in accordance with any amendments that may be made to this agreement.</strong></p> <p class=\"MsoNormal\"><strong>In the event of objection to any amendment to the usage agreement, the platform hopes that you will stop using its services, as your mere access to your account on the platform or your use of it is considered your acceptance of the amendments and full and complete approval that excludes ignorance, and the administration accepts discussion in any proposal regarding these provisions.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>(For stores) All fees are in Algerian dinars, and the merchant must pay all fees due on the platform in addition to any other expenses added by the platform, provided that payment is made by the approved, specific means available through the platform.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>The platform may impose fees on some users, depending on the offers, products, or services they request, or what the state imposes in terms of fees or taxes on the nature of the product or service.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>The platform reserves the right to add, increase, decrease or deduct any fees or expenses under the articles, terms and conditions of the usage agreement, for any of the users, whatever the reason for their registration.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>Payment and payment services for stores on the platform:</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>1. The platform provides, through its partners, the payment system, and payment can be made entirely online through the payment options available on the platform or through any payment method provided by the platform from time to time.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>2. The platform shall determine the price of the service or product that it offers according to the recognized market value.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>Intellectual property:</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>The intellectual property rights of the platform are fully owned by Diposido, whether they were owned by them before or after the establishment of this electronic platform.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>The user or consumer respects our intellectual property rights, and the words, logos and other symbols of or displayed on the platform, as the platform, and every right that follows, are the entire intellectual property rights of the organization.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>Platform responsibility:</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>The platform is committed to conducting its business through this electronic platform in a regular manner and in accordance with the regulations in force in Algerian law, and in accordance with the provisions of this agreement.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>The platform does not bear any claims arising from errors or omissions, whether caused directly, indirectly, incidentally, or by the user or by a third party such as shipping companies or stores.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>The platform, its employees, owners, and their representatives are committed to ensuring that (the product or service) is sound, legitimate, and authorized in accordance with the laws and regulations of Algerian law, and that it is used for legitimate purposes.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>Applicable Law or Regulation:</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>This User Agreement is governed and drafted in accordance with the applicable laws, regulations and legislation in force in Algerian law, and is completely and completely subject to the regulations in force with the authorities in Algeria.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>General Provisions:</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>In the event that any incoming material or clause in this User Agreement is canceled or there is any incoming material or any clause in the Use Agreement that is no longer enforceable, such an order does not invalidate the validity of the rest of the articles, terms and provisions contained in the User Agreement and remains in effect until further notice platform management.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>This usage agreement - which may be amended from time to time as necessary - constitutes the usage agreement, work mechanism, understanding, agreement and contract between the platform and the user, and both parties to this agreement agree to take into account the following:</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>1. The Arabic language is the applicable language when interpreting the provisions of this Agreement, or when translating them into another language.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>2. All prices offered on the services or products of the platform may be modified from time to time without prior notice, and therefore the administration will not be legally responsible towards the user or any third party when any modification, change in price, or suspension of services is made temporarily.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>3. The promotional or marketing offers that the platform may place are temporary offers, as the administration has the right to modify or stop these promotional or marketing offers at any time.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>4. The parties to this agreement are obligated to deal with each other in a manner that does not violate the legal rules, regulations, and applicable laws related to the nature of the interaction between the platform, the store, and the user.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>5. This usage agreement is only canceled by a decision issued by the platform management.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>6. The warranty against any manufacturing defect remains between the store and the consumer, and does not include misuse of the product by the consumer.</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>Exchange and return policy:</strong></p> <p class=\"MsoNormal\"><strong>&nbsp;</strong></p> <p class=\"MsoNormal\"><strong>Each store on the platform has its own exchange and return policy, and therefore each person is responsible for his transactions with each store, as well as each store that complies with its owner before the law.</strong></p>', 'TermsAndConditions', 1, '2021-11-03 04:40:48', '2023-01-29 22:37:30');
INSERT INTO `infos` (`id`, `name`, `description_ar`, `description_en`, `type`, `sort`, `created_at`, `updated_at`) VALUES
(7, 'Privacy policy', '<div class=\"wpb_wrapper brdr-right\" style=\"text-align: right;\"> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 18.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">سياسة الخصوصية</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">سياسة الخصوصية وسرية المعلومات</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">يرحّب بكم فريق عمل ديبوسيدو ، ويتقدّم إليكم بالشكر على ثقتكم به، ويفيدكم بأنه حرصاً منه و لإدراكه التام بأن المستخدم له حقوق، فإنه يسعى للحفاظ على المعلومات الخاصة بالمستخدمين وفقاً لآلية سياسة الخصوصية وسرية المعلومات المعمول بها في المنصة . وعليه فإنه يوضّح لكم بأن سياسة الخصوصية وسرية المعلومات التي سيتم التعامل بها مع معلوماتكم الخاصة بكم بموجبها كما يلي :</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">أولاً: المعلومات التي تحصل عليها المنصة وتحتفظ بها في قواعد بياناتها</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">المعلومات الشخصية الخاصة بالمستخدم، كالإسم والعمر والبريد الالكتروني، ورقم الهاتف .</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">معلومات الدخول الشخصية الخاصة بالمستخدم، مثل اسم المستخدم وكلمة السر والبريد الالكتروني، والسؤال الخاص باسترجاع كلمة السر وإجابته.</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">قد تفرض طبيعة المنصة الالكترونية بعض المعلومات المتعلّقة بالكوكيز وذلك لأغراض الكترونية تسهّل التعامل بين المنصة والمستخدم.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">ثانياً: هل ديبوسيدو تشارك هذه المعلومات؟</span></strong></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">بطبيعة الحال فإننا نسعى بالاحتفاظ بهذه المعلومات بما يحفظ خصوصية المستخدم، و المنصة لا تحتفظ بهذه المعلومات إلا بهدف تحسين جودة المنصة الإلكترونية وتيسير التعامل فيما بين المتاجر والمستخدمين .</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">كقاعدة عامة فإن جميع هذه المعلومات لا تطلع عليها إلا الإدارة ، ولن تقوم ببثها للغير.</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">حيث أن منصتنا تسعى للحفاظ على سلامة المستخدمين، فإنه &ndash; في حالة ملاحظة الإدارة لأي نشاط غير نظامي أو غير شرعي يقوم به المستخدم &ndash; فإن الإدارة&nbsp; قد تقوم بإبلاغ الجهات المختصة بعد النظر في الأمر من الجانب القانوني و الذي ينص عليه الدستور الجزائري .</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">ثالثاً: ما هو مدى أمان سرية المعلومات الخاصة بالمنصة؟</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; تسعى منصتنا إلى سرية المعلومات وسياسة الخصوصية الخاصة بالمستخدمين و لن تخالف أحكام هذه القواعد والسياسة. ولكن نظراً لعدم إمكانية ضمان ذلك 100% عبر وسائل الإنترنت فإن فريق عمل الإدارة ينوّه بما يلي:</span></p> <p class=\"MsoListParagraphCxSpFirst\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">نسعى للحفاظ على جميع المعلومات الخاصة بالمستخدم وأن لا يطلع عليها أحد بما يخالف هذه السياسة المعمول بها في المنصة .</span></p> <p class=\"MsoListParagraphCxSpMiddle\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">نعمل على حماية هذه المعلومات عن طريق فريق مختص و أنظمة حماية معتمدة .</span></p> <p class=\"MsoListParagraphCxSpLast\" dir=\"RTL\" style=\"margin: 0in 0.5in 10pt 0in; text-indent: -0.25in; direction: rtl; unicode-bidi: embed;\"><!-- [if !supportLists]--><span lang=\"FR\" style=\"font-size: 12.0pt; line-height: 115%; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-DZ;\">&middot;<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">غير أنه نظراً لأن شبكة الانترنت لا يمكن ضمانها 100% لما قد يطرأ من اختراق أو فيروسات على أنظمة الحماية الالكترونية و على جدران الحماية المعمول بها في المنصة &nbsp;فإن الإدارة تنصح المستخدمين بالحفاظ على معلوماتهم بسرية تامة، وعدم إفشاء أي معلومات هامة لأشخاص آخرين ، وهذا حرصاً على المنصة &nbsp;في توجيه وإرشاد المستخدمين.</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">رابعاً: هل هناك طرف ثالث في العلاقة بين المنصة والمستخدم ؟</span></strong></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">\"تحدد هنا سياسة الخصوصية فيما يتعلّق بالحالات التي يكون هناك طرفاً ثالث كالتجار، المسوّقين، والتقنيين، والمستهلك، وأي شخص آخر مرتبط بالعلاقة\" و حتى جهة إتمام الدفع الإلكتروني عبر المنصة .</span></p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><strong><span lang=\"AR-DZ\" style=\"font-size: 15.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">خامساً: قواعد وأحكام استخدام المنصة</span></strong></p> <p style=\"direction: rtl;\">&nbsp;</p> <p class=\"MsoNormal\" dir=\"RTL\" style=\"direction: rtl; unicode-bidi: embed;\"><span lang=\"AR-DZ\" style=\"font-size: 12.0pt; line-height: 115%; font-family: \'Arial\',sans-serif; mso-bidi-language: AR-DZ;\">إن جميع التزامات ديبوسيدو ، وجميع التزامات المستخدمين، وجميع الحقوق الواردة في العلاقة بين المستخدم أو المستهلك و المتاجر و المنصة ، موجودة هنا \"<span style=\"color: #4bacc6; mso-themecolor: accent5;\">الشروط &nbsp;و الأحكام</span>\"، حيث أن هذه القواعد هي \"سياسة الخصوصية وسرية المعلومات\" والمنبثقة من الاتفاقية التي أبرمت بين المستخدم و المنصة بخصوص العلاقة النظامية والقانونية بينهما، وقد وضعت سياسة الخصوصية وسرية المعلومات لضمان المصداقية والثقة التي تحرص الإدارة على توفيرها للمستخدمين.</span></p> </div>', '<p><strong>privacy policy</strong></p> <p><strong>Privacy policy and confidentiality of information</strong></p> <p><strong>The Deposido team welcomes you, and extends its thanks to you for your trust in it, and informs you that, out of concern for it and its full awareness that the user has rights, it seeks to preserve the information of users in accordance with the mechanism of the privacy policy and confidentiality of information in force in the platform. Accordingly, it is clarified to you that the privacy policy and the confidentiality of information under which your information will be dealt with are as follows:</strong></p> <p><strong>First: The information that the platform obtains and keeps in its databases</strong></p> <p><strong>&bull; The user\'s personal information, such as name, age, e-mail, and phone number.</strong></p> <p><strong>&bull; The user\'s personal login information, such as the username, password, e-mail, and the password recovery question and answer.</strong></p> <p><strong>&bull; The nature of the electronic platform may impose some information related to cookies for electronic purposes that facilitate interaction between the platform and the user.</strong></p> <p><strong>Second: Does Deposido share this information?</strong></p> <p><strong>&bull; Of course, we seek to keep this information in a way that preserves the user\'s privacy, and the platform does not keep this information except with the aim of improving the quality of the electronic platform and facilitating dealings between stores and users.</strong></p> <p><strong>&bull; As a general rule, all this information is only seen by the administration, and it will not be transmitted to others.</strong></p> <p><strong>&bull; Since our platform seeks to maintain the safety of users, it is - in the event that the administration notices any irregular or illegal activity carried out by the user - the administration may inform the competent authorities after considering the matter from the legal side as stipulated in the Algerian constitution.</strong></p> <p><strong>Third: How secure is the confidentiality of the platform\'s information?</strong></p> <p><strong>&nbsp; &nbsp; &nbsp; &nbsp;Our platform seeks to confidentiality of information and privacy policy of users and will not violate the provisions of these rules and policy. However, since this cannot be guaranteed 100% via the Internet, the management team notes the following:</strong></p> <p><strong>&bull; We seek to preserve all user information and not to see it in violation of this policy in force on the platform.</strong></p> <p><strong>&bull; We are working to protect this information through a specialized team and approved protection systems.</strong></p> <p><strong>&bull; However, since the Internet cannot be 100% guaranteed because of the penetration or viruses that may occur on the electronic protection systems and on the firewalls in force on the platform, the administration advises users to keep their information strictly confidential, and not to disclose any important information to other people, and this In the interest of the platform in guiding and guiding users.</strong></p> <p><strong>Fourth: Is there a third party in the relationship between the platform and the user?</strong></p> <p><strong>&ldquo;The privacy policy is specified here with regard to cases in which there is a third party such as merchants, marketers, technicians, the consumer, and any other person related to the relationship&rdquo; and even the entity that completes the electronic payment through the platform.</strong></p> <p><strong>Fifth: The rules and provisions for using the platform</strong></p> <p><strong>All the obligations of Deposido, all the obligations of the users, and all the rights contained in the relationship between the user or the consumer and the stores and the platform, are found here in the &ldquo;Terms and Conditions&rdquo;, as these rules are the &ldquo;Privacy Policy and Confidentiality of Information&rdquo; emanating from the agreement concluded between the user and The platform regarding the legal and regulatory relationship between them, and has developed a privacy policy and confidentiality of information to ensure the credibility and trust that the administration is keen to provide to users.</strong></p>', 'privacyPolicy', 1, '2021-11-03 04:41:08', '2023-01-29 22:38:22'),
(8, 'about us', 'مالتي هو معرض افتراضي لأكبر تشكيلة من منتجات والأزياء والاكسسوارات والعناية بالجمال فهو الوجهة الأمثل لشراء الازياء العصرية ومغرمي المكياج الذين يبحثون عن الحل الأمثل بالمكياج والأزياء! انشئ مالتي ليس لتسويق منتجات مالتي وحسب بل لتسويق جميع منتجات المتاجر الاخري حيث يمكن لاي تاجر ان يقوم بعرض منتجاتة في القسم الخاص به داخل مالتي لتتميز عن باقي المتاجر الإلكترونية الأخرى يسمح للمتسوقين بالشراء مباشرة من متاجرهم الافتراضية داخل مالتي', 'about usMulti is a virtual exhibition of the largest selection of products, fashion, accessories and beauty care. It is the perfect destination for buying trendy fashion and make-up enthusiasts who are looking for the perfect solution in make-up and fashion! Create a multi, not only to market Multi products, but to market all the products of other stores, where any merchant can display his products in his own section within Multi To distinguish itself from other online stores, shoppers are allowed to purchase directly from their virtual stores within Malta Why are we so fond of Malti? The latest fashion and the ability to shop through many distinctive products and through your distinctive store inside Multi Daily alerts of special offers, new products and the latest trends in makeup, beauty and fashion. 100% Turkish products and a convenient 14-day exchange and return policy so that you do not have to worry and do not rush your decision, in addition to safe payment methods and the possibility of paying on delivery, as it will reach you in any of the Gulf Cooperation Countries (Kuwait - Qatar - Emirates - Saudi Arabia - Bahrain - Oman ). An active and passionate team that takes care of you, who understands well your passion for beauty and beauty, ensures your comfort and ensures that you always enjoy a charming and amazing view.', 'about', 1, '2021-12-26 04:17:15', '2022-04-15 09:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `kurlies`
--

CREATE TABLE `kurlies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `value_en` text DEFAULT NULL,
  `value_ar` text DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kurlies`
--

INSERT INTO `kurlies` (`id`, `name_ar`, `name_en`, `value_en`, `value_ar`, `product_id`, `created_at`, `updated_at`) VALUES
(154, 'خامات تركية ممتازة', 'Turkish materials', NULL, NULL, 222, NULL, NULL),
(155, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 222, NULL, NULL),
(209, 'خامات تركية ممتازة', 'Excellent Turkish materials', NULL, NULL, 211, NULL, NULL),
(210, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 211, NULL, NULL),
(217, 'خامات تركيه ممتازه', 'Turkish materials', NULL, NULL, 235, NULL, NULL),
(218, 'توصيل سريع في نفس اليوم', 'Same day delivery', NULL, NULL, 235, NULL, NULL),
(233, 'خامات تركية ممتازة', 'Turkish materials', NULL, NULL, 219, NULL, NULL),
(234, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 219, NULL, NULL),
(264, 'خامات تركية ممتازه', 'Turkish materials', NULL, NULL, 232, NULL, NULL),
(265, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 232, NULL, NULL),
(266, 'خامات تركيه ممتازه', 'Turkish materials', NULL, NULL, 231, NULL, NULL),
(267, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 231, NULL, NULL),
(270, 'خامات تركيه ممتازه', 'Turkish materials', NULL, NULL, 229, NULL, NULL),
(271, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 229, NULL, NULL),
(272, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 228, NULL, NULL),
(289, 'خامات تركيه ممتازه', 'Turkish materials', NULL, NULL, 225, NULL, NULL),
(290, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 225, NULL, NULL),
(309, 'خامات تركيه ممتازه', 'Turkish materials', NULL, NULL, 226, NULL, NULL),
(310, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 226, NULL, NULL),
(315, 'خامات تركية ممتازة', 'Turkish materials', NULL, NULL, 216, NULL, NULL),
(316, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 216, NULL, NULL),
(327, 'خامات تركيه ممتازه', 'Turkish materials', NULL, NULL, 230, NULL, NULL),
(328, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 230, NULL, NULL),
(329, 'خامات تركيه ممتازه', 'Turkish materials', NULL, NULL, 233, NULL, NULL),
(330, 'توصيل في نفس الطوم', 'Same day delivery', NULL, NULL, 233, NULL, NULL),
(333, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 266, NULL, NULL),
(334, 'التوصيل خلال من 15 الي 20 يوم', 'Delivery within 15 to 20 days', NULL, NULL, 266, NULL, NULL),
(335, 'الاستبدال مجاناً', 'Free exchange', NULL, NULL, 266, NULL, NULL),
(336, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 267, NULL, NULL),
(337, 'التسليم في غضون 15 إلى 20 يومًا', 'Delivery within 15 to 20 days', NULL, NULL, 267, NULL, NULL),
(338, 'الاستبدال مجانا', 'Free replacement', NULL, NULL, 267, NULL, NULL),
(339, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 268, NULL, NULL),
(340, 'التوصيل في خلال ١٥ الي ٢٠', 'Delivery within 15-20', NULL, NULL, 268, NULL, NULL),
(341, 'الاستبدال مجانا', 'Free replacement', NULL, NULL, 268, NULL, NULL),
(342, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 264, NULL, NULL),
(343, 'الاستبدال والاسترجاع خلال 14 يوم', 'Exchange and return within 14 days', NULL, NULL, 264, NULL, NULL),
(346, 'خامات تركيه ممتازه', 'Turkish materials', NULL, NULL, 234, NULL, NULL),
(347, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 234, NULL, NULL),
(348, 'خامات تركية ممتازة', 'Turkish materials', NULL, NULL, 212, NULL, NULL),
(349, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 212, NULL, NULL),
(361, 'خامات تركية ممتازة', 'Turkish materials', NULL, NULL, 221, NULL, NULL),
(362, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 221, NULL, NULL),
(370, 'منتجات عالية الجودة', 'high quality products  express del', NULL, NULL, 269, NULL, NULL),
(371, 'التوصيل من 14 الي 20 يوم', 'Delivery from 14 to 20 days', NULL, NULL, 269, NULL, NULL),
(375, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 287, NULL, NULL),
(376, 'توصيل سريع', 'Fast delivery', NULL, NULL, 287, NULL, NULL),
(381, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 288, NULL, NULL),
(382, 'توصيل سريع', 'Fast delivery', NULL, NULL, 288, NULL, NULL),
(387, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 289, NULL, NULL),
(388, 'توصيل سريع', 'FAST DELVERY', NULL, NULL, 289, NULL, NULL),
(389, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 290, NULL, NULL),
(390, 'توصيل سريع', 'fast delevry', NULL, NULL, 290, NULL, NULL),
(391, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 291, NULL, NULL),
(392, 'توصيل سريع', 'Fast Delevry', NULL, NULL, 291, NULL, NULL),
(395, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 227, NULL, NULL),
(396, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 227, NULL, NULL),
(399, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 292, NULL, NULL),
(400, 'توصيل سريع', 'Fast delivery', NULL, NULL, 292, NULL, NULL),
(401, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 293, NULL, NULL),
(402, 'توصيل سريع', 'fast delivery', NULL, NULL, 293, NULL, NULL),
(403, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 294, NULL, NULL),
(404, 'توصيل سريع', 'Fast delivery', NULL, NULL, 294, NULL, NULL),
(405, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 295, NULL, NULL),
(406, 'توصيل سريع', 'fast industry', NULL, NULL, 295, NULL, NULL),
(407, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 296, NULL, NULL),
(408, 'توصيل سريع', 'fast delivery', NULL, NULL, 296, NULL, NULL),
(409, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 297, NULL, NULL),
(410, 'توصيل سريع', 'fast delivery', NULL, NULL, 297, NULL, NULL),
(411, 'خامات تركية ممتازة', 'Turkish materials', NULL, NULL, 213, NULL, NULL),
(412, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 213, NULL, NULL),
(413, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 299, NULL, NULL),
(414, 'توصيل سريع', 'fast delivery', NULL, NULL, 299, NULL, NULL),
(415, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 300, NULL, NULL),
(416, 'توصيل سريع', 'fast  delivery', NULL, NULL, 300, NULL, NULL),
(419, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 302, NULL, NULL),
(420, 'توصل سريع', 'fast delivery', NULL, NULL, 302, NULL, NULL),
(424, 'تبديل مجاني', 'Free exchange', NULL, NULL, 240, NULL, NULL),
(425, 'التوصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 240, NULL, NULL),
(428, 'خامات تركية ممتازة', 'Turkish materials', NULL, NULL, 210, NULL, NULL),
(429, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 210, NULL, NULL),
(430, 'التوصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 244, NULL, NULL),
(431, 'خامات عالية الجودة', 'High quality materials', NULL, NULL, 244, NULL, NULL),
(436, 'تبديل مجاني', 'Free exchange', NULL, NULL, 241, NULL, NULL),
(437, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 241, NULL, NULL),
(446, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 251, NULL, NULL),
(447, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 251, NULL, NULL),
(448, 'خامات تركية ممتازة', 'Turkish materials', NULL, NULL, 224, NULL, NULL),
(449, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 224, NULL, NULL),
(450, 'جودة عالية', 'High quality products', NULL, NULL, 283, NULL, NULL),
(451, 'الاستبدال مجانا', 'Free exchange', NULL, NULL, 283, NULL, NULL),
(452, 'توصيل سريع', 'Fast delivery', NULL, NULL, 283, NULL, NULL),
(456, 'منتجات بجودة عالية', 'High quality products', NULL, NULL, 284, NULL, NULL),
(457, 'الاستبدال مجاناً', 'Free exchange', NULL, NULL, 284, NULL, NULL),
(458, 'توصيل سريع', 'Fast delivery', NULL, NULL, 284, NULL, NULL),
(459, 'منتجات عالية الجودة', 'high quality products', NULL, NULL, 270, NULL, NULL),
(460, 'استبدال مجانا', 'free replacement', NULL, NULL, 270, NULL, NULL),
(461, 'خامات تركية ممتازة', 'Turkish materials', NULL, NULL, 220, NULL, NULL),
(462, 'توصيل في نفس اليوم', 'Same day delivery', NULL, NULL, 220, NULL, NULL),
(464, 'خامات تركية ممتازة', 'Excellent Turkish materials', NULL, NULL, 207, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `created_at`, `updated_at`, `product_id`, `user_id`, `brand_id`) VALUES
(43, '2022-04-12 23:03:43', '2022-04-12 23:03:43', 207, 209, 0),
(45, '2022-04-20 10:47:01', '2022-04-20 10:47:01', 242, 207, 0),
(46, '2022-05-15 16:17:34', '2022-05-15 16:17:34', 261, 205, 0),
(49, '2022-06-29 22:46:55', '2022-06-29 22:46:55', 235, 259, 0),
(51, '2022-08-26 18:55:28', '2022-08-26 18:55:28', 237, 280, 0),
(52, '2022-12-07 15:52:26', '2022-12-07 15:52:26', 210, 282, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_05_130003_create_roles_table', 1),
(6, '2021_09_08_151918_create_permissions_table', 1),
(7, '2021_09_08_175220_create_role_permission_table', 1),
(8, '2021_09_19_110655_create_categories_table', 1),
(9, '2021_09_19_110655_create_images_table', 1),
(10, '2021_09_19_110655_create_products_table', 1),
(11, '2021_09_19_110655_create_statements_table', 1),
(12, '2021_09_19_165927_create_attributes_table', 1),
(13, '2021_09_19_165928_create_options_table', 1),
(14, '2021_09_19_165929_create_option_values_table', 1),
(15, '2021_09_19_214116_create_product_category_table', 1),
(16, '2021_09_29_151342_create_product_attribute_table', 1),
(17, '2021_10_02_151328_create_ratings_table', 1),
(18, '2021_10_02_233722_create_likes_table', 1),
(19, '2021_10_05_124052_create_shipping_addresses_table', 1),
(20, '2021_10_05_124053_create_orders_table', 1),
(21, '2021_10_05_164406_create_product_order_table', 1),
(22, '2021_10_06_032830_create_admin_password_resets_table', 1),
(23, '2021_10_06_032830_create_admins_table', 1),
(24, '2021_10_06_032929_create_student_password_resets_table', 1),
(25, '2021_10_06_032929_create_students_table', 1),
(26, '2021_10_10_022917_create_countries_table', 1),
(27, '2021_10_10_022933_create_areas_table', 1),
(28, '2021_10_13_140419_create_product_student_table', 1),
(29, '2021_10_15_180421_create_infos_table', 1),
(30, '2021_10_17_141006_create_settings_table', 1),
(31, '2021_10_17_213327_create_contacts_table', 1),
(32, '2022_11_19_110705_create_foreign_keys', 1),
(33, '2021_10_21_130026_create_icons_table', 2),
(37, '2021_10_21_144115_create_sliders_table', 3),
(38, '2021_10_21_184259_create_ads_table', 3),
(40, '2021_10_24_131651_create_coupons_table', 4),
(41, '2021_10_24_222623_create_kurlies_table', 5),
(42, '2021_10_27_022211_create_profiles_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `fcm_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `type` enum('Category','Brand','Product','Info','Order') NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `title_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `body_ar` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body_en` text DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `fcm_token`, `user_id`, `type`, `type_id`, `title_ar`, `title_en`, `body_ar`, `body_en`, `image`, `created_at`, `updated_at`) VALUES
(176, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 10:38:26', '2022-08-17 10:38:26'),
(177, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 10:40:10', '2022-08-17 10:40:10'),
(178, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 10:40:42', '2022-08-17 10:40:42'),
(179, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 10:41:07', '2022-08-17 10:41:07'),
(180, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 10:42:03', '2022-08-17 10:42:03'),
(181, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 10:47:42', '2022-08-17 10:47:42'),
(182, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 10:48:01', '2022-08-17 10:48:01'),
(183, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 11:19:14', '2022-08-17 11:19:14'),
(184, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 11:20:14', '2022-08-17 11:20:14'),
(185, '[\"d_IBA_5pTp-h2KqeUrNpMf:APA91bHDKzboIVnC1pNkHpXH44S3_1qvyZyyI7WRqr2yd0NAqXZzfmkdfxhsQJgd6rQXyNtHhJ8mt41fhfzoruUcRtjQ-_fw7XVSBP2Fl-s88yBQ9gIJr9ghAEHZV2L3BhknFeLGpUrL\"]', '[]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 11:31:09', '2022-08-17 11:31:09'),
(186, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 11:31:59', '2022-08-17 11:31:59'),
(187, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 11:40:14', '2022-08-17 11:40:14'),
(188, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 11:50:42', '2022-08-17 11:50:42'),
(189, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:04:42', '2022-08-17 12:04:42'),
(190, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:08:37', '2022-08-17 12:08:37'),
(191, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:08:46', '2022-08-17 12:08:46'),
(192, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:17:05', '2022-08-17 12:17:05'),
(193, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:17:35', '2022-08-17 12:17:35'),
(194, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:19:08', '2022-08-17 12:19:08'),
(195, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:20:31', '2022-08-17 12:20:31'),
(196, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:22:23', '2022-08-17 12:22:23'),
(197, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:25:26', '2022-08-17 12:25:26'),
(198, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:26:53', '2022-08-17 12:26:53'),
(199, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:35:37', '2022-08-17 12:35:37'),
(200, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:36:02', '2022-08-17 12:36:02'),
(201, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:38:55', '2022-08-17 12:38:55'),
(202, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:40:05', '2022-08-17 12:40:05'),
(203, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:48:42', '2022-08-17 12:48:42'),
(204, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:52:44', '2022-08-17 12:52:44'),
(205, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:55:17', '2022-08-17 12:55:17'),
(206, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 12:55:42', '2022-08-17 12:55:42'),
(207, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:01:16', '2022-08-17 13:01:16'),
(208, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:04:01', '2022-08-17 13:04:01'),
(209, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:05:09', '2022-08-17 13:05:09'),
(210, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:06:54', '2022-08-17 13:06:54'),
(211, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:10:49', '2022-08-17 13:10:49'),
(212, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:13:14', '2022-08-17 13:13:14'),
(213, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:14:29', '2022-08-17 13:14:29'),
(214, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:16:39', '2022-08-17 13:16:39'),
(215, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:19:07', '2022-08-17 13:19:07'),
(216, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:21:08', '2022-08-17 13:21:08'),
(217, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:38:21', '2022-08-17 13:38:21'),
(218, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:44:40', '2022-08-17 13:44:40'),
(219, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:45:24', '2022-08-17 13:45:24'),
(220, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 13:45:38', '2022-08-17 13:45:38'),
(221, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:07:28', '2022-08-17 14:07:28'),
(222, '[\"chA2s4r5R1uI6puwaPeTTM:APA91bFmHw2LAf6-7zG0gO8qkYalNjr2c1N-D57m2F3RM0QwzKRIHL_S2CVtXRGNyjPulKPpV_8NFqZ_a9DJzVGvflH4ejXVveeCRCP0CA612w_iU0OGwUPX-C-Xt7uK6TWO9ZoU9fN2\"]', '[]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:42:28', '2022-08-17 14:42:28'),
(223, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:43:10', '2022-08-17 14:43:10'),
(224, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:50:39', '2022-08-17 14:50:39'),
(225, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:53:30', '2022-08-17 14:53:30'),
(226, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:53:54', '2022-08-17 14:53:54'),
(227, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:57:04', '2022-08-17 14:57:04'),
(228, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:58:39', '2022-08-17 14:58:39'),
(229, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:58:56', '2022-08-17 14:58:56'),
(230, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 14:59:16', '2022-08-17 14:59:16'),
(231, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 15:01:09', '2022-08-17 15:01:09'),
(232, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 15:12:10', '2022-08-17 15:12:10'),
(233, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 15:21:14', '2022-08-17 15:21:14'),
(234, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 15:21:21', '2022-08-17 15:21:21'),
(235, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 15:32:47', '2022-08-17 15:32:47'),
(236, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 15:36:33', '2022-08-17 15:36:33'),
(237, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 15:36:56', '2022-08-17 15:36:56'),
(238, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 15:56:07', '2022-08-17 15:56:07'),
(239, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 15:56:31', '2022-08-17 15:56:31'),
(240, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 16:21:03', '2022-08-17 16:21:03'),
(241, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 16:22:21', '2022-08-17 16:22:21'),
(242, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 17:24:07', '2022-08-17 17:24:07'),
(243, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 17:24:55', '2022-08-17 17:24:55'),
(244, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 17:29:35', '2022-08-17 17:29:35'),
(245, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 17:38:03', '2022-08-17 17:38:03'),
(246, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 17:38:33', '2022-08-17 17:38:33'),
(247, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-17 17:38:42', '2022-08-17 17:38:42'),
(248, '[\"f25ex1CJR3Cz8rsHeDQwNk:APA91bHhU98b3oCrOqKC63dCIbSNppinp5w6UyiZ6RiHfw-tQgsVg3Ei_C3Mo-Raew8VLCGcHSjgMOfYKnRKVgKA6mjtA9nN6eCR8pRnuHphNGl-p75BaaEva-O98naLjDQdYH81q7Xv\",\"cZL91zq0Ssa3pXbHdYBd7n:APA91bF_hmfZezf5GleQCxzpx4mPzXmUR63WZjhdeTbECFPF4mQ4kUXsqD_1KJsUiCKQiD63zxiEzFlJWW7nXoU0KiOc05BZ8HUApI8GM20hf3W3NEUwH-qkl1XEp_8oinaekVkWdYhx\",\"cw-0Q2aATRq7wa8bTiY6Bi:APA91bFhyhMWgDuFASZHuO3RbFZYi77epubF5T-1WuyIW_zYttWaXrq00nbLbo-JWK7aUkMhX8rxpOvPvVi5fdF2WrMr4p5y2JkT1WghZkJ9CycFWyh9Fw0PJWbw2rqVYPPjCYx9L2co\",\"e3bvIeCFSI-EUDmaJG6cD_:APA91bHoRfdn_zg2jjcDQcMHVvDlhxmz5gydj5aI2PKrAgBcM4y0QcakgfhI0RnwN3CRGcjf1ex7vCcrvQS4Z2H6GBaF4K5SD1UzaCu0-TGahOkb6EuVUWsNItuDT-kgua6PupIkRDgl\",\"evJtUalbSWmVH9H17dlF-N:APA91bG1kBHUa-OM3SFNEtAmrFBFZpv_wPw_ZKiCZmGfpwHyqkaQioBaDTbdDdXKA_zUmniq7uvM1iZEFvtNPN7-aC5QVr3PoF2t1XEtDL9GC05aoTARPmIEfou7Nt9bIfIODlFt9Duk\",\"c-RAU7GGR1-d9oH7mH0ojp:APA91bGIOX2px5PazRtkORAg0m_WqhjTQqwiN3uEN3rRP0yFaiax3llCNPcqN6JGe9fxkKI88nqd4843v9BJejLMY_t5wTCSTMFmyZ8ZXu9n7m_fyYKXAuUCl6-7X1ooRIPfpqYnqPbX\",\"fVahKj_lT-2pSE8k2mYU6o:APA91bEZPQLDnzqTQdXvUBLOc127Z833YaYQL9ChCGMy6NRjke0CSzRlUMqGc-0iE39E3TIUXRncqtDC-BkPhuGg6pj66RHkMGNXkFZwyjQM9eXcP_a2a0lpJ5_-IY6QlCOw69zDFzPa\",\"c36EvEpcReivmfehSgJ2Ha:APA91bEH60zgcLFOHAN7mBBVi3Ib9W96LaWpzyCEEN5BNwY5y6aQ_kCpVoT2oj0d91Vfb5XYmhV3Xg6MmoeNlNbeE2nawPQ2KIbEqtW9ef_WDmpbW_kTGWv9eCA8dk7f_HfvTFeOUuTp\",\"cdM64QS1TV2rNnyZ-eBXLy:APA91bF3XixWopy9qPylPEcwXyICVphIY6KqQvPfNl6_2zin504-N7nov12056dXZsrW647KRlRBiMO21yv7no9scRLvgZP2SGG-Ef4k2ABWmZw2AgLWdsPAnufrPcwlXoJEbi8Itzkh\",\"dgtoqB48RdSy-CIL7TbBR2:APA91bFty3KGQw88j_3FkRM2oCFzat8LCGi2rfEYDT16hIJ9I5xv9pC1JcOPW1tPyQFn7YNnhLizWE0sTocsTvJIZqRc2rhgpibobSRSIUYcvrzSprXKB1tV0Y82lr8O7AoYjV8rNnbq\",\"dP_4H2PeQuOXN-nv7gSImp:APA91bGb0YGoUSZjjoTSrfDe-rwiQz_JRXzK44sjFvJMB--a3RVJLQol3w7K3L5qaOymn5hf49QFJEv1SO541TUXz-0g-nE0Epe7xPZeQA1rprJMkV4rOKVfDMda6NzeYtO8uHG2_buc\",\"d4GMxgcOS0CV4ltWeEYjGA:APA91bF7Z_DQijEGHRtvuoUojCS08w6iEOG5ySsZUZ-b6uUIG7oN_O30Qo8uPv1Ra7j10dhmyhCOgCtlAZHFatMxjAgilSx8jhA6N5k2RGWI3pv-VE5FbtjJElm-hgdi4oXPxvbDN5lt\",\"fjKJ3ccai0ZXqJc9xpckH_:APA91bGy2ZpNn6AVwQu0izOLg-zPiJx-lA-ytvSxJkjrbZ5SKwZztW2Ni_RnYgim7-WL0HiJH5Lw6sqLGlYGuRh1VFuLU81ZLh5oaI2r_qNquGoo8_NbMWz022QCNNVA_8gsGI3hS2f9\",\"e5AV0-9IRk2DS3YE9o1FOm:APA91bHGVI7dcifLevaShtRp_OsuCd6nltkyPzYpqXYtTjaqgcN6FyIZqD2iJlVYMQG4sJgEBkSAKgz_QRKeg0seAi3S95bMABJjAnbhdaExJFtrJjhD1M9R_vO3zIBbCSXqNW44RQfr\",\"dFd4OWvKQOqXcZy2Tpi5fZ:APA91bF8d3SSmF1cVUTUihOBOFC-c9UIFa2C-iHMUjuNF7IbXYK7GInbUmL8snDerpxplij3TPAnMMF7mroA-maGlmPYNfA95sAmLGfgvCjcMlNDrVF7s73phfD6rGsf1cXgQ1uPzCN4\",\"dygeWyMvTmKUUEU_k7cDMn:APA91bG_lulBS3j--qNokdj2FQH5YaKdrvwpwKWtouMkKc-J65X7XVkoSEddVzWl21-LTqr2XvAIjyha41alCAYe0Y2kWL0utlrDxTfz-p_HPwHcdrdinE6290Ebmq63HyJdUAgidYwW\",\"c_LFf6fz-kUEtKcGcqgFea:APA91bHZDFzgPDapk8ldjesvYCZ11Nl-wBMnM9OaQJ9hHtb2L-e6vLQnihC4KvaJcYbhS8TCUYgGXgGBsnJMAeTHzxmrUnawkd9PuJnwd13u6EmH_e6K0eeMp0tG5IfHWTlV4tz7JRIO\",\"dTe1fhmX90MSuTHSyjh-jZ:APA91bHjWbqbVjrwlGn6LvwiNPdxVyNnLEH3WxuSd_MMMPrCFvV0oYtSRNFxnwQGKXOIlJOT7dW7-a4Qw6Ju7nHM0Ru0JQPF0PUmSums0CaOlRxUHslWqJaOI6GjxzvHKfQU4R118E2T\",\"clo5rjTXkEc2gJD3wmYZPT:APA91bE5RUVqUwg5ReHNB6CmiDufzhNZPipp0oGsQ5leRkmaRirBblPm3HANRh4jjkaDvZO-ttgkDkrsfI1CNAPtfQ-SyoqxizC9aY2JMXB8RoZk2s_btwnvtLMOif_LxQ9P2XwXYLUC\",\"dmb7DiEQQLWP34m9fD5-Lj:APA91bGFlhIWTstITRO9ezBBWtMPnUBFsyQyg-fZG4CEhBrbbX44UChz56r16nSNqtoxwadbS5tSqEAy_1gqED97ee0hqogBPHgtYrOM8xmNfyKa-4pV6M7tyiHudVPz-g4IgoSqvT1c\",\"cc0qJOtsRxqSqjVJVDY8-I:APA91bE1EXAEWMZQMr1BN0Xd-1TF_dCYiS81E54HgUgHwd-Zv_ZQa39PV6rkqpDX8cBH2-G_TRu3NOM_WvPEJCqWw135xbM9bqh3KFBZJ0fEyU2EHS864xkpHlpul3_8UmXZ2C8Vjb0z\",\"f0QH0Lr2JUadreg09HR0Ij:APA91bHoxz54V461jHMnT06wQgXzOpI9atuIQcdUFXk0sGuMGB-P-vin5B-zcWZpRJDsPIx-JvjdjauP1L98jrv9DV4zFdIz3LCeWhGg4485Im_aOjpwbRH3xMlS_m4UJ24aK4rJ2Ks8\",\"c3qNNYsST9-agSeaodECws:APA91bGiWgUz5JOEDe2EswVHtRTCbrnttDKHiPq6Jmrt7p4_eJeZxtX8N8yLPRY4YxEJExYdaB0FgUl10Jftzu4p8NY_758LDAlZjiyITQ69rb1lmQvdz-Pzd8yXy9uMIhdznARHsHBd\",\"fsq4U6S9SQu7x4r862yPhG:APA91bFVQDFt_xOl0_GD-YO9gbFWB_WdEQXO-SLySDcj5Sz9Ub6Wdln8RzZs8lYmmR2HPyZ5RG_tBQc_d1ojK7MHAwGrEiYuzwcNTQhqjKx_EQTONEOf--uoq5Fodo9O_2si4ZKf5ddM\",\"caDzdspuikN9g3yug9-FdG:APA91bEnUZSl8U0Y8qQ49aIaZo0FXlRuvoL9Hd9ZVOzDbK3VwDM78_YOTU9eECv_an9GH8m2yeBcP82eLKxHmsTZfYW_xNAYpyjcA1SqHXhmt6bK-szruK2N6iuNKzjI3i7Cvnb5FhDL\",\"eiA9nG94AUCNgKy8S1Bwpw:APA91bEeAB74c96wN_7S7NGUm7B0E37xzaXYs796lGMcma5a8i1SasNHcUUitqNXKFce8_Nb7f5F4eHrqCi9j8UZuqtNAR1c1AIcK9SB_CxBySzqPF3C_qZcDZ8TGo9Oew9egmnTicTp\",\"fIBNkULXQWePv5LbhlUulf:APA91bEeaXbEsP2tAqvMh0IcD1dCUHgsWPAoNhkQJlEbUh11eXc5Dv2_ObQRDQiWyrfK7KZL3mYXI7QhIsDm3OryBjG_0a2NO7aGx-gZffWhGNHZozyZjFeWU4YzVS-scWuxAkrJvi-g\",\"dxySVyFCTgKuTj3uddwhrJ:APA91bHHXYYcqSoXXAfIw3SbDjo872n-WCwzaqyimD_G2Abgv6fQLeYLuQw_6FlB1MiTSOJZEtl2dglODLg9JKzgkHxLJvyx9rDD4hJwWWeo6XqdrwvXLx42JtieuIh_NF0fuP-sVHKs\",\"dII5pi9OQs2OGp-r3DRGJr:APA91bFvMFb067mSgjcRSUgxs7dVbvQu1g16WRXj8Icj6vsk20MD_JtC4Qm--l7OEjLPlOsQLRjActILtOpRNtuxM4jdiHqbDcmGmvKwWjeXhGGq8tB1tiC930X80Bc-6wXm7Vjenvow\",\"ff_DNO9LQSSBsFtOuncmm-:APA91bHmyALiZB1LYZNqOIOjrtu_-N6bRWLCIZbIUtsn2wRtfTGnqxEyu3ir00Qe2M8u0Ygh5Ww6miCVgQsXOQiUAqSK75QtsU1XBkgrkqQuvZaYuhdgVB19gbiuoCMxE4C--W1I8YuV\",\"fZUZPyaFOE7SltfV4RorPi:APA91bEI1AKXXl97gSKsWRUrQA_G2kK45PSbXf8lEcq5uqyDIWnPSZPsiD6gBMGADEZL41DZvBnFAypZbYXaU4OzeGc1KNie2U5a0C4c-xato_vubQ6SBTbm_-lHmNAYglXaprbLiai_\",\"f4-K5gtNSBaQRyaSJDBsyk:APA91bH4S7YwfPu19-ytwU2MHEIQ5Lp0Z7SNKSj76bK33fykpAQ202tr_HgQlUcnvQFsUf2ccMch5loZxPI0JSAOXleZrfuZeIsh5XfHv2W9eEdvtEvf1wJPtpaLljWeeXsqVPqmCfI-\",\"ci6AkX6LSYWvjncNqWhvaP:APA91bGmg2N3HM5c_C5TvNZn247BsHXXt73nNYwtxxmRcU5Nf67mEuEfPgjlAFBnX_mWKKua7flBL1qnpY_ZYuD-tCeg4gQOPhiwat_QJu1sBtAuFx_V4wp0Vm7m4b1HF9-pRKvzK5BG\",\"fsTzOM3aQa-P7mxNkP5N-C:APA91bFj7P6osalO-JQtf6jM8iudI03D59Pyzgw1FhTbmPRG4IoDyguxQotdeVsRC7s_bg44XjEJHl8YgXFXPRWbycYW-AkVr6yqTOmm9YxswhW1pFcE87lz3-eEa-nt8aVb34tAhcUv\",\"caoRKAkoRUPduHYHp-pwmC:APA91bHTjLLZwlzvkTBd7LR6d03CtiKuX7dTw_eP1DYcEjKyUa6F_2M4HmJRjnu4lG8ihNUj97O4nVy5YkAvinW7R4zHxDnrHSgZWixkwfK8xn93A_l3DHmGyIRFFdN-sV3xL7l-xVfc\",\"cJHTtE4VhUmjqDpYlaFW2v:APA91bHxsYXR57MwEWfuDGfSzqCVrk4KaoBRmU1nbytRqMqRMTUGy0HQ-xv_sPt7fdLvVc7YP5wgbDNe9WdsKqdIukalmua0lCbLVoDrNUp5bo7rk9sA43o2pNuKJb1gRHXPn5LFtc5r\",\"c9FHNN5rQlyaM07Didfkl_:APA91bH_OC2-rosOjc94CN2FpkvWuUO4hnPTV_gV2ARBBCMTSeulb70t9Q27iUIcQtMGMB0cEYFHg99Yh69YcYAxxGf4KQxBX3mVst-I3adSQGtzSw3E-M5Q_G7Wwfc-q47fQwY6FrLE\",\"cbg7NiMhRWG5mZf2SuIlju:APA91bGoWVm5uxuL0ltjMZLzMv3HIexQEsdTTtusiH-kFCCaAWRY4f2m4XCOBxG_duVrnyTnK6IYwhFalIChuNxok9kZPfImNDrlTFgmyK06nlwwYqeg-vSr-fEsVGw-P-dTIaO9csvT\",\"d06cxgB0TkJfswYdLVbmGJ:APA91bH7maLlJMOqt_A-8KjNE4KN2f9osvrbJhd7OEIIaar7e8Tkc_V9-FbZm9LKyYE7zWIF_8mr7R5ugmio4nninV6i-FXj-xRJxrNHVU-MI5BfaRfD5-5Ogy2XBFgjS31Dayz1yb5b\",\"cKW5gjpBLk1HkkaLcCIql5:APA91bE-Ms0uy62mmVeEjC8SbRoyaB45bBVb4YPOiqjY--NoD4ghLAB_1TvVMFJ1XNPxCvzGpJDtnMCfEJllVH8ADy_J8PD1tXWm-tnxkoOyIWNJHPXhChKR2bklcC9jNw8p4v7yWXWM\",\"dyDn7DwgwUpfkzTLwZkc5W:APA91bEOzPSt-m7nKe1z1-BaLYGLSi4Qyc6jiX3IuED_A_0e8lWEcM32-n30ehNLG6wFOCumGIzqC7r3VNXikxLLiQn0BRuo3A67ietoHLPngaNMvdUyNPVvt0uCDscrHov41DP2l44w\",\"d46r1QDJYE98tEO0Hk7gTq:APA91bG7FY5gyTS3iILRbSzJAydq8acEjfJNaVZfObMOSF-EtlEcWLprr1RjsUPHPclYNssQCTJt0hbbZMA_HjyMqeTdAagFvUiE-4LJ36HIXtHr7k8As4qeshUxHg0UP2c9bABi-GRc\",\"eIpNvesQcEAIhOan2QhYcI:APA91bH6TGfiHkVowzz84aNPO5s2NcdKOyzVkRkPbsyu1mR_r3abEgPiyY9SRByyoKwucgZE60RmfXj-izEfHFdXpOTXSxBD6KNVQCObSDKMxAwoc6BfKSHmNwFQ4gugBxyHlBdJI5oe\",\"eXYfjqLlpE1IrnxDW2LbsY:APA91bFVVMdrYTDst-5P4dj0jlOElRonTYi0tRPVPrFSjYG7IeCvSMNkKOgog1oTTa2hJb7n01wwp5RgGnFme-h6d3tqBIfT41jILDF85_mGnHkTlIWi-u1jfEgbadztyaAB7DjGT_2P\",\"cZmePl4VfUyrmsr_8ETlQi:APA91bFBQprPxM_FMpgY033z4j_CWrFPzrRACZgIwt0jHuuQYbGjaFPa_82cg3j8sqEH1I164go8lP58KAViohvsV_Z6SbmS7WxKcw6uwAqGiAS1ux4k4fqYjfV9DA3jVMyg98eBw-Ca\",\"dy3xLDseRbSr-BTyvgKo2a:APA91bG-IV1L4DvzA6hEi4LJLeVofy1mjsRvKbHHGWUHk50jp_FNwW8ea58FHYkavbOMehHlSCR4XAvMOeTrJgEIli9rc-MgYnlSM-nYRVmVd2a4BmyUJF8OtvkHo5JF1D5QG12vAMPG\",\"f7VTvC51wUj_vctz2TSwLn:APA91bF88Lti1FxExSfFX4fTGM5HicLOAS66EM163Uh-PggfHAUAynbzAkP7yKdRR-FELXFOpxctwV5MGJirFSBZZt2zSQsX4RIYKn7EnAqT_h7JzARZWnueGeSEcgYxtPGolY8j-V4i\",\"dFIKmB0S_kZun1erdDDUly:APA91bFbwQEStuHnEjTiudQPW4VFsMHc_MkeiMwmKPOdwSfglMGoAXNyeKVKY7NeAd06sMhM_gSeq4Au-dahVMgRli8GzVDcL306UTZeBdo07015O3oP1xJ5SmiVzR_rq72EBusS-VUJ\",\"dwema9hnDkXKmScxgkSVTL:APA91bGSSh0MmwQDBWSX_MNYvibVBSVvok5bQ-9eIEjd-H-GvRkXA_z9aazh5rHs049q5_6f_C1bMxA3UoXsA3R-Cwj0AvLc48ubf4Gp5LQrsmBPDm6hz_25DZthhJr2VXofO2OlPAem\",\"f4csJjLVQRWLYzr73TKJGV:APA91bEoSACHJyf-9WiGJqu0s3OytTPrGiy5uT7qAck-2ouXaxBREuZDlC4fCecdW9qJRMqowC-gVVedqUQkctO1i1sFFu0yJz8Qx_suBa_kBByeNqVoZmuM-wTqEhWxYJQrOv_8uY-o\",\"ca8RQRAwmUgUrAAFNQO4H5:APA91bENxoYYF4BzmKy2pVnkyN3Ug-vrSswroCB-cdgGk1Wd_jFygnUF7F0-YbskHIpBMJNkZ5dYwuJZ6Ot4Rtm2XyYwtR51UCs3VZfom5MzEMW2jREISGs9Ed27Tbq_TUqFENDwWG1G\",\"edXJHjumZEYpjwPg0NhfNg:APA91bHC7HjkOWkdzAjzv19Th6mlwrThAwkOwiGIod0J3uqdoj4kf6zNi8bVAu-m0XJVUeLginxiu0oXqC26IHDPWnzJL8xItz9Ku74s-YU8g7XOemiS83eOKN2GcZ7unHKLGuyTIL-1\",\"fd_MsJ0cGkjrhdqOapEacA:APA91bH9C_73vyKGHZwk1frfO1z2F1cxEPDJ-6-ERJM-BvU2FQixHe8FzM1mKbvlI-7aG_jGmQz5am9kvIMgJuIMqGWlfaQ13BSJ77eOUEEZFzzsXakQy-Aygi8FnWyZFLFfJdR4f8EN\",\"d5KsO9qnv0ZHg_NBdl_7Mk:APA91bEbxm69kSIbmumuIoScvXq6EF-QhWTUQlNla6hhcfnLDeDRKHDM-q0jqkI9XJ6AO-iENWAPR5E1n7yLI1htsJzCwGaYxlbaFK7A2W4k2C2uMbS6IvVWtffHVujMuoopaP7HTV--\",\"fHIqL3Siw0afq-jcgvc-2s:APA91bFYIkgFx2wBzki1DqrcY1B9N6jvziMess3SozGIc6fbzyXKJL6VKCyp9E3F7Q1h4jyvgTf6V_HddZBhzBourflBgjT35xed5toEz2RiwR_NItc3IKXa5-ZIRY3MKzXoPX8SzoRK\",\"d29ntNHA-km5kfrUgHDfqB:APA91bG1eJg6h4_04F8-hEJzX6ehhuTy_9rXoEsSWV4YTjZqsyxd2tLhqTHUJtimMXQfmLAPGF7xQkH4Jx_AFdjo7__ItF3YfbqquX5VX4Aml9xJuPycS7GFfhFUmq5oewXGxv0QNowK\",\"e71ljvE6KE78u06gdjjTo9:APA91bH8bMD4LAcf2GRr1oDMTXbJRgX22NAmWJgOn9LONLK7oCXm0vbjaMI4jQy4lq7YD1hzLhCxhJafZHG8PJ_jN2T3Fbj9V1dSSZJQuppFAxfBE39gPjOUY_-r4U6gp_HJOfU4Kly1\",\"fXTYebE-RZCpToNYxhUw9E:APA91bGRtxtLvQpgXB1k77dRdp-_S5yqmiujm5N3_XixQxxtlNy9SyvGl5ASZ1FVoUdc9R2WgEHnj8msW7lxM92dadzDLtVrHQDTiF5bwuMDjEGcYXpQdHyGq1TmWQOFBFseS6iIyf0G\",\"ewfeE0hpu00BmjnSo7EbEo:APA91bGQKKfuHMc565eWnzONri7a4AjDw1MJRtuYpsuTRk0sGJiPk29PjGpYwh4W1Fky9b_CCAFWTwccrtlsuQszHA2-ssuCrFFKo33wjeQMdjSIvVPmvyL9me7NSLL3v5jxlLppIwtF\",\"cNNLJ1psDUdDmHINPWTfyu:APA91bFyW2zWl3z5a4fiPPztvS94BkY3fdqO2_Tlpd63SmqvGMLfOZSCrSRb_BnC9OX8tIa7Gbr7B_I12c0MlDbQ_vw8tyQIPZXNoK5wP7DFh-h2pSxr4APvw2GfGQC9oRG-081-NQ-W\",\"dTyVINd6SKewAZ6A0APbME:APA91bFVhGM_N99RPnk5gtkfAmzLkp2Ei3BdMMG86ZE59hpdDwml4DHrX-vvLhRqSyRJ9YxizKDeK3pE20yDQq1bnHnlnTS00YCHV6u3SIx-QY4CK5x3cKjr8b6pFZ2e1POxDi0jaaX9\",\"ctFcun8wB0X6otuXg82H9y:APA91bG_M16qimwl9SFba7qL2pxH8MGdGOQkbBfRzcYoa4t741ueexd45VMOnW8CjPXWWKCZJgDbpJlDnEKSHk4iaeqIH7GbpGjDwp1a-BoTMVWtXnsbJh9Ory0R0JemG8hUZrgTxnLs\",\"dTQeWqGQJku4iy-2IK7TJh:APA91bGjMhcXzCD1Stkyh8WtHfZLjUrKXkeh19YgnFHR2CWVJQR-sQSzdVK75p-xNWz1eOHnS64qcd9iMdCLKP_LSsk6dtU0PGb4tVsz3C06Hh3isEjmAdBIZsRffVj-zlZFPmidmg_W\",\"fvWE72BYxEXqiKtaF0-ZBb:APA91bGXWfRnJyoFbvStbJq2n5J-1QaSPbyV2Z_hvjW5Rd87evuxGYHPmzC970YkFoZ8nOfenjNIEjyfU2xzXvTq7HfkMBKX9E_KpvKFgr-_DItphh2o02jSWz_QkMXoxLhvyhKN6hFY\",\"fOAHNwXhZ0QDjSEK6W69nr:APA91bHlxhWGzejtdZ9QNSYk5MfTb16gqDKaE67QhWLWgWlBKRIycNFx3gZgnc4TTno4Pvts4eu6M2OvPEvNYZFZxJaDIidpLeIdIElZ5G6m2-igCb2SczGO0uj43izG90vuYVNgyiic\",\"ftxpM-O9_UZpkEeMBG6jvM:APA91bHdQOnHBsVmokRczUwn0F7RF1ttwcIPg5wZoGac0x4cW44Dq_8LGaFcPZROXXQi_rGCn9TSuiccCleTGzf7EXw_40vQTO8yie9jn82Ke6cYH4MC-9tfmqx5fq-5mgccZNgYL6-Z\",\"dGmY5tZYSha1SfkOzLJm3_:APA91bERXqOZ-dn6bxZDNrLRtfuUK2IfFx_ACwke84T2jx5CbXQxqFfRe8BFNMiz06mG-v7E7SfZ4E1ekEdnHMC7M8MbAv0eTNOOgHVJcXNkZHaVrSBNuVFt8wP-Tj5fSYg7aE8m2Cev\",\"czOIdS9n5UPuo6UgU7fqAS:APA91bHQYJX8NzxgLBz8UvPyJj0818LiZIRl3BPSfdMh6LLB4AC6Rp2CvxQ_tvvEioDlzUZWlmJTF3W5nqHfIpr-h050-r4xfNq5cNsjV-j7f2pd_RJ4bDV022ZOqsRqRhoHEkYm3Yon\",\"doFjCORjQa-vFv9qCH0pE2:APA91bHgL0nLTWGdknyX3t7HfkSXnXcSxAUIxhERIwBiO3PK0ir_2I_myARkkx4XVoNsv-MU9XNJ-9s9Ch3u72vLMB39S8tRB8IMP5kT0ss1eqUYYf4_in4hJ_o99BWyPbRZP3KhrpZ7\",\"d_IBA_5pTp-h2KqeUrNpMf:APA91bHDKzboIVnC1pNkHpXH44S3_1qvyZyyI7WRqr2yd0NAqXZzfmkdfxhsQJgd6rQXyNtHhJ8mt41fhfzoruUcRtjQ-_fw7XVSBP2Fl-s88yBQ9gIJr9ghAEHZV2L3BhknFeLGpUrL\",\"chA2s4r5R1uI6puwaPeTTM:APA91bFmHw2LAf6-7zG0gO8qkYalNjr2c1N-D57m2F3RM0QwzKRIHL_S2CVtXRGNyjPulKPpV_8NFqZ_a9DJzVGvflH4ejXVveeCRCP0CA612w_iU0OGwUPX-C-Xt7uK6TWO9ZoU9fN2\",\"fxpdBhkvTfee3_EwMjm6CR:APA91bEpoUa3LM8eT55F-mJ1I-61YFIn9pZUX-JhmczCR6rFnA_VZ2Svf9kenQtWXExef0ZzMWCFovTTxJ5bXb9fYzYBfqpnbvjHbNXh0lswvjhRKp9NyYw4Go2A0cws-ojUuaTD3G5M\",\"d9Pncn5jSVmcwoXXrFzB1K:APA91bGvOBYidUG_XY7cVmcBDInftFSKkrK62V9jJc1YSwv5FduEOv3LcdEV8OiZQop4A9O9lpSRxQaoCKQFEgsCtn0PftmgFkSQfDsQL4BAtRDtOxlMWQH-M0mN2d9Z04t16hWvKmOm\",\"fmzg8210SfmcLvvPeypYTJ:APA91bE2bxne34ycemx8m7r7zbedxpi9CG50TSPRoPiNOp-sDduarfQs5oUygL6Yhq9sIbwIf_d9aUabvOnWH2t8CXD_jj2mEdn4oDkYDICONORVBHqy7SW6Pgkle7pvIRvv1yvHeASc\"]', '[194,203,207,270,205,274,277,278]', 'Info', NULL, 'تسوق من مالتي واحصل علي خصم 10%', 'Shop from Multi and get 10% off', 'علي جميع الموديلات', 'On all models', '1661001114jpg', '2022-08-20 16:11:54', '2022-08-20 16:11:54'),
(249, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 15:11:12', '2022-08-21 15:11:12'),
(250, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 15:13:51', '2022-08-21 15:13:51'),
(251, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 15:20:57', '2022-08-21 15:20:57'),
(252, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 15:21:10', '2022-08-21 15:21:10'),
(253, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 15:22:19', '2022-08-21 15:22:19'),
(254, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 15:24:09', '2022-08-21 15:24:09'),
(255, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 15:24:23', '2022-08-21 15:24:23'),
(256, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 15:25:24', '2022-08-21 15:25:24'),
(257, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 16:04:46', '2022-08-21 16:04:46'),
(258, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 16:06:28', '2022-08-21 16:06:28'),
(259, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 16:13:18', '2022-08-21 16:13:18'),
(260, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 16:49:37', '2022-08-21 16:49:37'),
(261, '[]', '[205]', 'Order', 117, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-21 16:52:33', '2022-08-21 16:52:33'),
(262, '[]', '[194]', 'Order', 31, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 11:27:11', '2022-08-22 11:27:11'),
(263, '[]', '[194]', 'Order', 31, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 11:27:52', '2022-08-22 11:27:52'),
(264, '[]', '[194]', 'Order', 31, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 11:42:08', '2022-08-22 11:42:08'),
(265, '[\"fUI6ECwARBqbXRQRz3mjtE:APA91bHSmhXVC7sWdj3sNAI8UdBO23c9FNQDoHJhzdxuTQBdpH8G9iV9wE92_dYxPX1X2D7K4Q_oyR7fj4GtRyHSnrCvMJPtmtvKZvhwdMenoxLTwgO5oHWt78Xhk2gHd3VdG_y5Y81x\"]', '[]', 'Order', 31, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 11:53:08', '2022-08-22 11:53:08'),
(266, '[\"fUI6ECwARBqbXRQRz3mjtE:APA91bHSmhXVC7sWdj3sNAI8UdBO23c9FNQDoHJhzdxuTQBdpH8G9iV9wE92_dYxPX1X2D7K4Q_oyR7fj4GtRyHSnrCvMJPtmtvKZvhwdMenoxLTwgO5oHWt78Xhk2gHd3VdG_y5Y81x\"]', '[]', 'Order', 31, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 11:53:17', '2022-08-22 11:53:17'),
(267, '[]', '[194]', 'Order', 31, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 11:53:36', '2022-08-22 11:53:36'),
(268, '[]', '[194]', 'Order', 31, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 11:56:22', '2022-08-22 11:56:22'),
(269, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 12:28:36', '2022-08-22 12:28:36'),
(270, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 12:31:41', '2022-08-22 12:31:41'),
(271, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 12:32:39', '2022-08-22 12:32:39'),
(272, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 12:33:33', '2022-08-22 12:33:33'),
(273, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 12:37:05', '2022-08-22 12:37:05'),
(274, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:04:14', '2022-08-22 13:04:14'),
(275, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:05:56', '2022-08-22 13:05:56'),
(276, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:09:05', '2022-08-22 13:09:05'),
(277, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:10:20', '2022-08-22 13:10:20'),
(278, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:29:55', '2022-08-22 13:29:55'),
(279, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:36:50', '2022-08-22 13:36:50'),
(280, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:38:05', '2022-08-22 13:38:05'),
(281, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:39:08', '2022-08-22 13:39:08'),
(282, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:43:44', '2022-08-22 13:43:44'),
(283, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:47:03', '2022-08-22 13:47:03'),
(284, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:52:17', '2022-08-22 13:52:17'),
(285, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 13:57:12', '2022-08-22 13:57:12'),
(286, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 14:02:27', '2022-08-22 14:02:27'),
(287, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-22 14:04:23', '2022-08-22 14:04:23'),
(288, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:19:14', '2022-08-23 14:19:14'),
(289, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:25:14', '2022-08-23 14:25:14'),
(290, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:26:32', '2022-08-23 14:26:32'),
(291, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:29:15', '2022-08-23 14:29:15'),
(292, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:47:47', '2022-08-23 14:47:47'),
(293, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:49:30', '2022-08-23 14:49:30'),
(294, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:55:39', '2022-08-23 14:55:39'),
(295, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:56:03', '2022-08-23 14:56:03'),
(296, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:57:11', '2022-08-23 14:57:11'),
(297, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 14:59:25', '2022-08-23 14:59:25'),
(298, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 15:03:42', '2022-08-23 15:03:42'),
(299, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 15:13:13', '2022-08-23 15:13:13'),
(300, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 15:24:41', '2022-08-23 15:24:41'),
(301, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 15:25:13', '2022-08-23 15:25:13'),
(302, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 15:36:51', '2022-08-23 15:36:51'),
(303, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 15:37:01', '2022-08-23 15:37:01'),
(304, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 15:37:18', '2022-08-23 15:37:18');
INSERT INTO `notifications` (`id`, `fcm_token`, `user_id`, `type`, `type_id`, `title_ar`, `title_en`, `body_ar`, `body_en`, `image`, `created_at`, `updated_at`) VALUES
(305, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 15:47:34', '2022-08-23 15:47:34'),
(306, '[]', '[205]', 'Order', 121, 'طلبك قيد التنفيذ', 'Your order is in progress', 'تم اتمام الطلب بنجاح وطلبك قيد المراجعة والتنفيذ', 'Your order has been successfully completed and your request is under review and implementation', NULL, '2022-08-23 15:54:40', '2022-08-23 15:54:40');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name_en`, `name_ar`, `created_at`, `updated_at`, `deleted_at`, `attribute_id`) VALUES
(1, 'S', 'S', '2021-10-18 11:30:38', '2022-04-06 08:03:56', NULL, 6),
(2, 'm', 'm', '2021-10-18 11:30:44', '2021-11-03 02:41:02', '2021-11-03 02:41:02', 6),
(3, 'M', 'M', '2021-10-18 11:30:45', '2022-04-06 08:04:24', NULL, 6),
(4, 'L', 'L', '2021-10-18 11:30:54', '2022-04-06 08:05:45', NULL, 6),
(5, 'white', 'ابيض', '2021-10-18 11:31:04', '2022-04-06 08:18:27', NULL, 7),
(6, 'black', 'اسود', '2021-10-18 11:31:09', '2022-04-06 08:18:39', NULL, 7),
(7, 'blue', 'ازرق', '2021-10-18 11:31:18', '2022-04-06 08:18:49', NULL, 7),
(8, 'test', 'test', '2021-10-31 07:20:47', '2022-04-17 09:22:59', '2022-04-17 09:22:59', 8),
(9, 'Caviar Hair Treatment', 'اوبن شوب', '2021-11-14 23:33:57', '2021-11-15 20:41:37', '2021-11-15 20:41:37', 6),
(10, 'Caviar Hair Treatment', 'اوبن شوب', '2021-11-14 23:34:42', '2021-11-15 20:41:33', '2021-11-15 20:41:33', 6),
(11, 'cotton', 'قطن', '2021-11-29 21:04:09', '2022-04-06 08:19:36', NULL, 11),
(12, 'XL', 'XL', '2021-12-06 02:18:45', '2022-04-06 08:06:02', NULL, 6),
(13, 'XXL', 'XXL', '2021-12-06 02:25:49', '2022-04-06 08:06:24', NULL, 6),
(14, 'Red', 'احمر', '2021-12-06 02:26:28', '2022-04-06 08:19:07', NULL, 7),
(15, 'A-line cam and hem pajama set', 'طقم بيجامة الكام والحافة اللوتسة بالخط', '2022-02-12 20:05:05', '2022-02-12 20:05:05', NULL, 11),
(16, 'free size', 'Free Size', '2022-03-07 18:12:26', '2022-04-06 08:06:47', NULL, 6),
(17, 'gray', 'رمادي', '2022-04-06 07:14:01', '2022-04-06 07:14:01', NULL, 7),
(18, 'Pink', 'وردي', '2022-04-12 09:09:24', '2022-04-12 09:09:24', NULL, 7),
(19, 'green', 'اخضر', '2022-04-12 09:09:58', '2022-04-12 09:09:58', NULL, 7),
(20, 'multi-colors', 'متعدد الالوان', '2022-04-12 09:11:44', '2022-04-12 09:11:44', NULL, 7),
(21, 'brouwn', 'بني', '2022-04-12 09:12:23', '2022-04-12 09:12:23', NULL, 7),
(22, 'italian', 'ايطالي', '2022-04-12 09:40:33', '2022-04-12 09:40:33', NULL, 13),
(23, '36', '36', '2022-04-17 05:27:39', '2022-05-15 12:14:22', NULL, 6),
(24, '38', '38', '2022-04-17 08:49:16', '2022-04-17 09:03:29', NULL, 6),
(25, '40', '40', '2022-04-17 08:49:26', '2022-04-17 09:03:38', NULL, 6),
(26, '42', '42', '2022-04-17 08:49:32', '2022-04-17 09:04:06', NULL, 6),
(27, '44', '44', '2022-04-17 08:49:52', '2022-04-17 09:04:17', NULL, 6),
(28, '46', '46', '2022-04-17 08:49:59', '2022-04-17 08:49:59', NULL, 6),
(29, '48', '48', '2022-04-17 08:50:05', '2022-04-17 08:50:05', NULL, 6),
(30, '50', '50', '2022-04-17 08:50:12', '2022-04-17 08:50:12', NULL, 6),
(31, '52', '52', '2022-04-17 08:50:19', '2022-04-17 08:50:19', NULL, 6),
(32, 'beige', 'بيج', '2022-04-17 08:51:47', '2022-04-17 08:51:47', NULL, 7),
(33, 'oily', 'زيتي', '2022-04-17 08:51:50', '2022-04-17 08:51:50', NULL, 7),
(34, 'oil', 'زيتي', '2022-04-17 08:52:03', '2022-04-17 08:53:50', '2022-04-17 08:53:50', 7),
(35, 'orange', 'برتقالي', '2022-04-17 08:52:05', '2022-04-17 08:52:05', NULL, 7),
(36, 'purple', 'بنفسجي', '2022-04-17 08:53:14', '2022-04-17 08:53:14', NULL, 7),
(37, 'yellow', 'أصفر', '2022-04-17 08:53:50', '2022-04-17 08:53:50', NULL, 7),
(38, 'beige', 'بيج', '2022-04-17 08:54:37', '2022-04-17 12:10:40', '2022-04-17 12:10:40', 7),
(39, 'lemon', 'ليموني', '2022-04-17 08:55:08', '2022-04-17 08:55:08', NULL, 7),
(40, '33', '33', '2022-04-17 18:51:10', '2022-05-15 12:14:07', '2022-05-15 12:14:07', 6),
(41, '36', '36', '2022-04-18 09:21:00', '2022-05-15 12:16:23', '2022-05-15 12:16:23', 6),
(42, '0-3M', '0-3M', '2022-04-20 04:11:27', '2022-06-25 13:39:23', NULL, 6),
(43, '3-6M', '3-6M', '2022-04-20 04:12:13', '2022-06-25 13:39:46', NULL, 6),
(44, '6-9M', '6-9M', '2022-04-20 04:12:33', '2022-06-25 13:40:08', NULL, 6),
(45, '9-12M', '9-12M', '2022-04-20 04:12:46', '2022-06-25 13:40:22', NULL, 6),
(46, '1-2Y', '1-2Y', '2022-04-20 04:13:35', '2022-06-25 13:41:02', NULL, 6),
(47, '3Y TO 6Y', '3Y TO 6Y', '2022-04-20 04:13:50', '2022-05-19 12:18:59', '2022-05-19 12:18:59', 6),
(48, '11Y TO 12Y', '11Y TO 12Y', '2022-04-20 04:15:03', '2022-04-22 08:35:37', '2022-04-22 08:35:37', 6),
(49, 'turmeric', 'كركمي', '2022-04-21 08:31:19', '2022-04-21 08:31:19', NULL, 7),
(50, '95% Polyester 5% Elastane', 'بوليستر', '2022-04-22 07:49:46', '2022-04-22 07:49:46', NULL, 12),
(51, '2-3Y', '2-3Y', '2022-04-22 08:23:09', '2022-05-19 12:19:47', NULL, 6),
(52, '3-4Y', '3-4Y', '2022-04-22 08:23:34', '2022-05-19 12:20:07', NULL, 6),
(53, '4-5Y', '4-5Y', '2022-04-22 08:23:52', '2022-05-19 12:20:28', NULL, 6),
(54, '5-6Y', '5-6Y', '2022-04-22 08:24:04', '2022-05-19 12:20:40', NULL, 6),
(55, '6-7Y', '6-7Y', '2022-04-22 08:24:15', '2022-05-19 12:20:56', NULL, 6),
(56, '7-8Y', '7-8Y', '2022-04-22 08:24:27', '2022-05-19 12:21:10', NULL, 6),
(57, '8-9Y', '8-9Y', '2022-04-22 08:24:48', '2022-05-19 12:21:22', NULL, 6),
(58, '9-10Y', '9-10Y', '2022-04-22 08:25:01', '2022-05-19 12:21:34', NULL, 6),
(59, '10-11Y', '10-11Y', '2022-04-22 08:25:14', '2022-05-19 12:21:46', NULL, 6),
(60, '11-12Y', '11-12Y', '2022-04-22 08:35:58', '2022-05-19 12:21:57', NULL, 6),
(61, 'Enabi', 'عنابي', '2022-04-22 09:12:02', '2022-04-22 09:12:02', NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `option_values`
--

CREATE TABLE `option_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `regular_price` decimal(8,2) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_values`
--

INSERT INTO `option_values` (`id`, `quantity`, `sale_price`, `regular_price`, `parent_id`, `created_at`, `updated_at`, `option_id`, `product_id`) VALUES
(227, 6, NULL, NULL, 0, '2022-04-22 07:53:26', '2022-04-22 07:53:26', 50, 251),
(229, 100, NULL, NULL, 0, '2022-05-13 00:54:19', '2022-05-13 00:54:19', 22, 237);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `products_count` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL DEFAULT 0,
  `order_price` double NOT NULL,
  `shipping_price` double NOT NULL DEFAULT 0,
  `total_price` double NOT NULL,
  `payment_method` enum('knet','cash') NOT NULL DEFAULT 'knet',
  `status` varchar(90) NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_address_id` bigint(20) UNSIGNED NOT NULL,
  `discount` double DEFAULT 0,
  `invoice_id` varchar(100) DEFAULT NULL,
  `invoice_link` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `image` varchar(150) NOT NULL,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `count_product` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name_ar`, `name_en`, `image`, `is_free`, `status`, `count_product`, `sort`, `created_at`, `updated_at`) VALUES
(2, 'فضي', 'DS - Starter', 'packages/1.png', 0, 1, 45, 1, '2022-12-15 12:53:00', '2022-12-15 12:53:00'),
(3, 'ذهبي', 'DS - Advanced', 'packages/2.png', 0, 2, 115, 2, '2022-12-15 12:53:01', '2022-12-15 12:53:01'),
(4, 'ماسي', 'Premium - DS', 'packages/3.png', 0, 3, 700, 3, '2022-12-15 12:53:02', '2022-12-15 12:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `package_periods`
--

CREATE TABLE `package_periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `period` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_periods`
--

INSERT INTO `package_periods` (`id`, `package_id`, `period`, `price`, `created_at`, `updated_at`) VALUES
(2, 2, '6', '2500.00', '2022-12-15 12:53:00', '2022-12-15 12:53:00'),
(3, 2, '12', '4850.00', '2022-12-15 12:53:00', '2022-12-15 12:53:00'),
(5, 3, '6', '4950.00', '2022-12-15 12:53:01', '2022-12-15 12:53:01'),
(6, 3, '12', '9700.00', '2022-12-15 12:53:02', '2022-12-15 12:53:02'),
(8, 4, '6', '17400.00', '2022-12-15 12:53:02', '2022-12-15 12:53:02'),
(9, 4, '12', '32300.00', '2022-12-15 12:53:02', '2022-12-15 12:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `package_students`
--

CREATE TABLE `package_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('bazar.alkuwait@gmail.com', '0598011e58d2d275cdeee502fbb25b8ffbce20e1', '2022-08-22 19:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(196, 'section.index'),
(197, 'section.create'),
(198, 'section.update'),
(199, 'section.destroy'),
(200, 'section.trash'),
(201, 'section.restore'),
(202, 'section.finalDelete'),
(203, 'category.index'),
(204, 'category.create'),
(205, 'category.update'),
(206, 'category.destroy'),
(207, 'category.trash'),
(208, 'category.restore'),
(209, 'category.finalDelete'),
(210, 'product.index'),
(211, 'product.create'),
(212, 'product.update'),
(213, 'product.destroy'),
(214, 'product.trash'),
(215, 'product.restore'),
(216, 'product.finalDelete'),
(217, 'attribute.index'),
(218, 'attribute.create'),
(219, 'attribute.update'),
(220, 'attribute.show'),
(221, 'attribute.destroy'),
(222, 'attribute.trash'),
(223, 'attribute.restore'),
(224, 'attribute.finalDelete'),
(225, 'option.index'),
(226, 'option.create'),
(227, 'option.update'),
(228, 'option.destroy'),
(229, 'option.trash'),
(230, 'option.restore'),
(231, 'option.finalDelete'),
(232, 'rating.index'),
(233, 'rating.active'),
(234, 'rating.pending'),
(235, 'rating.accept'),
(236, 'rating.reject'),
(237, 'admin.index'),
(238, 'admin.create'),
(239, 'admin.update'),
(240, 'admin.destroy'),
(241, 'admin.trash'),
(242, 'admin.restore'),
(243, 'admin.finalDelete'),
(244, 'role.index'),
(245, 'role.create'),
(246, 'role.update'),
(247, 'role.destroy'),
(248, 'role.trash'),
(249, 'role.restore'),
(250, 'role.finalDelete'),
(251, 'role.permission'),
(252, 'user.index'),
(253, 'user.create'),
(254, 'user.update'),
(255, 'user.destroy'),
(256, 'user.trash'),
(257, 'user.restore'),
(258, 'user.finalDelete'),
(259, 'student.index'),
(260, 'student.create'),
(261, 'student.update'),
(262, 'student.updatePoints'),
(263, 'student.destroy'),
(264, 'student.trash'),
(265, 'student.restore'),
(266, 'student.finalDelete'),
(267, 'country.index'),
(268, 'country.create'),
(269, 'country.update'),
(270, 'country.destroy'),
(271, 'country.trash'),
(272, 'country.restore'),
(273, 'country.finalDelete'),
(274, 'area.index'),
(275, 'area.create'),
(276, 'area.update'),
(277, 'area.destroy'),
(278, 'area.trash'),
(279, 'area.restore'),
(280, 'area.finalDelete'),
(281, 'order.index'),
(282, 'order.update'),
(283, 'order.show'),
(284, 'coupon.index'),
(285, 'coupon.update'),
(286, 'coupon.show'),
(287, 'contact.index'),
(288, 'contact.destroy'),
(289, 'slider.index'),
(290, 'slider.create'),
(291, 'slider.update'),
(292, 'slider.destroy'),
(293, 'ad.index'),
(294, 'ad.create'),
(295, 'ad.update'),
(296, 'ad.destroy'),
(297, 'icon.index'),
(298, 'icon.create'),
(299, 'icon.update'),
(300, 'icon.destroy'),
(301, 'info.index'),
(302, 'info.create'),
(303, 'info.update'),
(304, 'info.destroy'),
(305, 'info.index'),
(306, 'info.create'),
(307, 'info.update'),
(308, 'info.destroy'),
(309, 'setting.index'),
(310, 'setting.update'),
(311, 'currency.index'),
(312, 'currency.create'),
(313, 'currency.update'),
(314, 'currency.destroy'),
(315, 'currency.trash'),
(316, 'currency.restore'),
(317, 'currency.finalDelete'),
(328, 'notification.index'),
(329, 'notification.create'),
(330, 'notification.destroy'),
(331, 'package_periods.index'),
(332, 'package_periods.create'),
(333, 'package_periods.update'),
(334, 'package_periods.destroy'),
(335, 'package.index'),
(336, 'package.create'),
(337, 'package.update'),
(338, 'package.destroy');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description_ar` text NOT NULL,
  `description_en` text NOT NULL,
  `about_brand_ar` text DEFAULT NULL,
  `about_brand_en` text DEFAULT NULL,
  `brand_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `seller_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discount_percentage` decimal(8,2) DEFAULT NULL,
  `regular_price` double NOT NULL,
  `sale_price` double DEFAULT NULL,
  `end_price` decimal(5,2) DEFAULT NULL,
  `alt` varchar(100) DEFAULT NULL,
  `in_sale` tinyint(4) DEFAULT 0,
  `sort` int(11) DEFAULT 0,
  `is_recommended` tinyint(1) DEFAULT 0,
  `has_options` tinyint(1) DEFAULT 0,
  `serial_number` varchar(250) DEFAULT NULL,
  `is_best` tinyint(1) DEFAULT 0,
  `end_sale` date DEFAULT NULL,
  `start_sale` date DEFAULT NULL,
  `is_brand` tinyint(1) NOT NULL DEFAULT 1,
  `is_clothes` tinyint(1) NOT NULL DEFAULT 0,
  `is_order` tinyint(1) NOT NULL DEFAULT 0,
  `day_order` int(11) NOT NULL DEFAULT 3,
  `ratings` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `likes_count` int(11) NOT NULL DEFAULT 0,
  `img` varchar(100) NOT NULL,
  `video` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_ar`, `name_en`, `slug`, `description_ar`, `description_en`, `about_brand_ar`, `about_brand_en`, `brand_name`, `seller_name`, `discount_percentage`, `regular_price`, `sale_price`, `end_price`, `alt`, `in_sale`, `sort`, `is_recommended`, `has_options`, `serial_number`, `is_best`, `end_sale`, `start_sale`, `is_brand`, `is_clothes`, `is_order`, `day_order`, `ratings`, `quantity`, `created_at`, `updated_at`, `deleted_at`, `likes_count`, `img`, `video`) VALUES
(204, 'طقم رسمي', 'طقم رسمي', 'tkm-rsmy', 'منتجات عاليه الجوده', 'منتجات عاليه الجوده', '<p>مميز</p>', '<p>مميز</p>', 'Multi', 'Multi', '28.57', 35, 25, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-10', 0, 1, 0, 3, 0, 11, '2022-04-11 01:56:23', '2022-08-20 15:31:25', NULL, 0, 'tkm-rsmy.jpeg', NULL),
(207, 'فستان انيق', 'elegant dress', 'elegant-dress', 'احصلي علي هذا الفستان الرائع لتعززي اناقة صغيرتتك مصمم بطابع عصري راقي ومصنوع من خامات عالية الجودة', 'احصلي علي هذا الفستان الرائع لتعززي اناقة صغيرتتك مصمم بطابع عصري راقي ومصنوع من خامات عالية الجودة', NULL, NULL, 'MULTI', 'multi', '16.67', 30, 25, NULL, '', 1, 0, 1, 0, NULL, 1, '2022-12-30', '2022-08-27', 0, 1, 0, 3, 0, 10, '2022-04-12 08:59:22', '2022-08-27 19:11:56', NULL, 2, 'eid-dress.jpeg', NULL),
(210, 'نفنوف بأكمام شيفون راقي للعيد', 'Soft dream dress', 'soft-dream-dress', 'نفنوف بأكمام شيفون راقي للعيد ✨.المقاسات المتوفره ٣٨. ٤٠. ٤٢. ٤٤. ٤٦.السعر ٢٥ دينار 🇰🇼.', 'نفنوف بأكمام شيفون راقي للعيد ✨.المقاسات المتوفره ٣٨. ٤٠. ٤٢. ٤٤. ٤٦.السعر ٢٥ دينار 🇰🇼.', '<p style=\"direction: rtl;\">اجعلي المناسبات الخاصة أكثر سحراً مع هذا الفستان الأنيق.</p>\r\n<p style=\"direction: rtl;\">&nbsp;تصميم ماكسي بأطراف واسعة</p>\r\n<p style=\"direction: rtl;\">متوفر بالقياسات التالية&nbsp; 38,40,40,42,44,46</p>', '<p>Make special occasions more magical with this elegant dress.<br />Maxi design with wide hem<br />Available in the following sizes: 38,40,40,42,44,46</p>', 'MULTI', 'multi', '12.50', 40, 35, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-16', 0, 1, 0, 3, 0, 11, '2022-04-17 05:08:33', '2022-12-07 15:52:26', NULL, 1, 'soft-dream-dress.jpeg', NULL),
(211, 'بنطلون بساق واسع زرار وهمي خصر عالي', 'Fake button high waist wide leg pants', 'fake-button-high-waist-wide-leg-pants', 'نسيج بوليستر مسامي وناعم خصر مطاطي مع زرار وهمي', 'Soft and breathable polyester fabricElasticated waist with fake button', '<p style=\"direction: rtl;\">افضل المنتجات التركية&nbsp;</p>\r\n<p style=\"direction: rtl;\">توصيل سريع</p>\r\n<p style=\"direction: rtl;\">خامات ممتازة</p>', '<p>The best Turkish products<br />express delivery<br />Excellent materials</p>', 'MULTI', 'multi', '33.33', 15, 10, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-16', 0, 1, 0, 3, 0, 13, '2022-04-17 05:17:11', '2022-07-23 14:46:41', NULL, 0, 'fake-button-high-waist-wide-leg-pants.jpeg', NULL),
(212, 'فستان انيق فتحة للفخذ', 'Elegant thigh-slit dress', 'elegant-thigh-slit-dress', 'اجعلي المناسبات الخاصة أكثر سحراً مع هذا الفستان الأنيق.&nbsp;', 'Make special occasions more magical with this elegant dress. &nbsp;', '<p style=\"direction: rtl;\">صناعة تركية</p>\r\n<p style=\"direction: rtl;\">توصيل في نفس اليوم</p>\r\n<p style=\"direction: rtl;\">&nbsp;</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<p>Turkish industry<br />Same day delivery</p>\r\n</div>', 'MULTI', 'MULTI', '18.75', 24, 19.5, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 10, '2022-04-17 09:01:03', '2022-04-23 04:53:23', NULL, 0, 'arrogant.jpeg', NULL),
(213, 'فستان بطباعة أزهار', 'floral print dress', 'floral-print-dress', 'فستان اصفر قصير بنقوشات ورد زهري', 'Short yellow dress with floral patterns', '<p style=\"direction: rtl;\">صناعة تركية</p>\r\n<p style=\"direction: rtl;\">توصيل في نفس اليوم</p>\r\n<p style=\"direction: rtl;\">&nbsp;</p>', '<p>Turkish industry<br />Same day delivery</p>', 'MULTI', 'MULTI', '33.33', 30, 20, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 4, '2022-04-17 09:09:45', '2022-05-30 20:39:22', NULL, 0, 'spring.jpeg', NULL),
(216, 'natural', 'Natural', 'natural', 'طقم قطعتان طويل محجبات جوب وبليزر باكمام طويل انيق &nbsp; توصيل سريع خامات بجودة عالية احدث الموديلات', 'Long-sleeved, elegant two-piece suit and blazer set &nbsp; &nbsp; express delivery High quality materials latest models', '<p><br />صناعة تركية<br />توصيل في نفس اليوم</p>\r\n<p>&nbsp;</p>', '<p><br />Turkish industry<br />Same day delivery</p>', 'MULTI', 'MULTI', '20.00', 30, 24, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 6, '2022-04-17 11:16:40', '2022-08-23 15:53:55', NULL, 0, 'natural.jpeg', NULL),
(219, 'طقم نقوشات', 'carvings set', 'carvings-set', '&nbsp;طقم نقوشات قطعتين نصف اكمام مريح مع بنطال طويل\r\n&nbsp;\r\nتوصيل سريع\r\nخامات بجودة عالية\r\nاحدث الموديلات\r\n&nbsp;', 'Comfortable two-piece set with half sleeves\r\n&nbsp;\r\nexpress delivery\r\nHigh quality materials\r\nlatest models\r\n&nbsp;', '<p>&nbsp;</p>\r\n<p>صناعة تركية<br />توصيل في نفس اليوم</p>\r\n<p>&nbsp;</p>', '<p><br />Turkish industry<br />Same day delivery</p>\r\n<p>&nbsp;</p>', 'MULTI', 'MULTI', '25.00', 20, 15, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 6, '2022-04-17 11:24:08', '2022-04-21 21:14:15', NULL, 0, 'carvings-set.jpeg', NULL),
(220, 'فستان قصير', 'Midriff', 'midriff', 'فستان اطفالي قصير بكسرات قطعه واحده بأكمام حتى منتصف اليد&nbsp; &nbsp; &nbsp; توصيل سريع خامات بجودة عالية احدث الموديلات', 'Children\'s short dress with pleats, one piece, with sleeves up to the middle of the hand &nbsp; express delivery High quality materials latest models &nbsp;', '<p>صناعة تركية<br />توصيل في نفس اليوم</p>', '<p>Turkish industry<br />Same day delivery</p>', 'MULTI', 'MULTI', '0.00', 20, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 6, '2022-04-17 18:45:42', '2022-08-27 18:56:49', NULL, 0, 'midriff.jpeg', NULL),
(221, 'جمبسوت انيق', 'elegant jumpsuit', 'elegant-jumpsuit', 'جمبسوت قطعه واحده مع سحاب امامي بدون اكمام', 'One-piece jumpsuit with a front zip, without sleeves &nbsp;', '<p><br />صناعة تركية<br />توصيل في نفس اليوم</p>', '<p><br />Turkish industry<br />Same day delivery</p>', 'MULTI', 'MULTI', '16.67', 30, 25, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 12, '2022-04-17 18:48:39', '2022-05-19 12:33:44', NULL, 0, 'elegant-jumpsuit.jpeg', NULL),
(222, 'طقم متعدد الالوان', 'multicolored set', 'multicolored-set', 'طقم متعدد الالوان قطعتين بنصف اكمام', 'Multi-colored two-piece set with half sleeves', '<p>صناعة تركية<br />توصيل في نفس اليوم</p>', '<p><br />Turkish industry<br />Same day delivery</p>', 'MULTI', 'MULTI', '33.33', 15, 10, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 7, '2022-04-17 18:53:51', '2022-07-17 21:48:21', NULL, 0, 'multicolored-set.jpeg', NULL),
(223, 'فستان انيق باكمام', 'Elegant dress with sleeves', 'elegant-dress-with-sleeves', 'فستان قصير بأكمام طويلة قطعه ىواحده مع ازرار امامية&nbsp;', 'Short one-piece long-sleeved dress with front buttons &nbsp;', '<p><br />صناعة تركية<br />توصيل في نفس اليوم</p>', '<p>Turkish industry<br />Same day delivery</p>', 'MULTI', 'MULTI', '20.00', 25, 20, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 4, '2022-04-17 18:57:00', '2022-08-27 18:58:07', NULL, 0, 'elegant-dress-with-sleeves.jpeg', NULL),
(224, 'عبايه 3 قطع', 'exceptional', 'exceptional', 'قطم 3 قطع عبايه وقميص وبنطلون نفس اللون اكمام طويلة', '3-piece set of abaya, shirt and pants of the same color, long sleeves', '<p>صناعة تركية<br />توصيل في نفس اليوم</p>', '<p>Turkish industry<br />Same day delivery</p>', 'MULTI', 'MULTI', '15.56', 45, 38, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 4, '2022-04-17 19:05:15', '2022-06-27 16:22:39', NULL, 0, 'abaya-3-pieces.jpeg', NULL),
(225, 'فستان قصير ابيض واسود', 'Short black and white dress', 'short-black-and-white-dress', 'فستان قصير فوق الركبه ونصف اكمام ابيض واسود&nbsp;', 'Short dress above the knee and half sleeves black and white', '<p class=\"p1\"><span class=\"s1\">صناعة</span> <span class=\"s1\">تركية</span></p>\r\n<p class=\"p2\">&nbsp;</p>\r\n<p class=\"p1\"><span class=\"s1\">توصيل</span> <span class=\"s1\">في</span> <span class=\"s1\">نفس</span> <span class=\"s1\">اليوم</span></p>\r\n<p class=\"p2\">&nbsp;</p>', '<p class=\"p1\"><span class=\"s1\">Turkish industry</span></p>\r\n<p class=\"p1\"><span class=\"s1\">Same day delivery</span></p>', 'MULTI', 'MULTI', '25.00', 20, 15, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 4, '2022-04-17 19:24:20', '2022-08-17 10:35:22', NULL, 0, 'short-black-and-white-dress.jpeg', NULL),
(226, 'فستان قصير', 'Short dress', 'short-dress', 'فستان قصير مفتوح من الامان &nbsp;قطعه واحده', 'Short open dress from safety one piece', '<p class=\"p1\"><span class=\"s1\">صناعة</span> <span class=\"s1\">تركية</span></p>\r\n<p class=\"p2\">&nbsp;</p>\r\n<p class=\"p1\"><span class=\"s1\">توصيل</span> <span class=\"s1\">في</span> <span class=\"s1\">نفس</span> <span class=\"s1\">اليوم</span></p>', '<p class=\"p1\"><span class=\"s1\">Turkish industry</span></p>\r\n<p class=\"p1\"><span class=\"s1\">Same day delivery</span></p>', 'MULTI', 'Multi', '33.33', 15, 10, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 0, '2022-04-17 19:29:44', '2022-12-17 13:57:22', NULL, 0, 'short-dress.jpeg', NULL),
(227, 'بلوزه الوان الصيف', 'Summer color blouse', 'summer-color-blouse', 'بلوزه قصيره باكمام طويله مفتوحه من الامام متعدده الالوان', 'Short blouse with long sleeves, open front, multicolored', '<p class=\"p1\"><span class=\"s1\">صناعة</span> <span class=\"s1\">تركية</span></p>\r\n<p class=\"p2\">&nbsp;</p>\r\n<p class=\"p1\"><span class=\"s1\">توصيل</span> <span class=\"s1\">في</span> <span class=\"s1\">نفس</span> <span class=\"s1\">اليوم</span></p>', '<p class=\"p1\"><span class=\"s1\">Turkish industry</span></p>\r\n<p class=\"p1\"><span class=\"s1\">Same day delivery</span></p>', 'MULTI', 'Multi', '40.00', 20, 12, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 6, '2022-04-17 19:34:28', '2022-08-22 14:10:09', NULL, 0, 'summer-color-blouse.jpeg', NULL),
(228, 'بدله رسميه', 'Formal suit', 'formal-suit', 'بدله من قطعتين بأكمام طويله وبنطلون', 'Long-sleeved two-piece suit', '<p style=\"direction: rtl;\">يعد هذا المعطف الكلاسيكي قطعة أساسية لا غنى عنها في خزانتك</p>\r\n<p style=\"direction: rtl;\">كونه مناسب لأغلب فصول السنة ففي الخريف يمكن مثالي للحصول على قليل من الدفء</p>\r\n<p style=\"direction: rtl;\">وفي الشتاء يمكن أيضاً ارتدائه مع باقي الملابس.</p>\r\n<p style=\"direction: rtl;\">فهو يتناسب مع أغلب إطلالاتك الكاجوال لتضفي جاذبية وأناقة.</p>\r\n<p style=\"direction: rtl;\">&nbsp;</p>', '<p class=\"p1\">This classic coat is a must-have in your wardrobe<br />Being suitable for most seasons, in the fall it can be ideal to get a little warmth<br />In winter, it can also be worn with other clothes.<br />It goes with most of your casual looks to add charm and elegance.</p>', 'MULTI', 'Multi', '14.29', 35, 30, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 18, '2022-04-17 22:11:41', '2022-04-23 04:43:57', NULL, 0, 'formal-suit.jpeg', NULL),
(229, 'بلوزه بفتحات صدر', 'florid', 'florid', 'بلوزه صيفي باكمام طويله وفتحات صدر&nbsp;', 'Summer blouse with long sleeves and chest openings', '<p class=\"p1\" style=\"direction: rtl;\">تميزي بمظهر جذاب بين الجميع مع هذه البلوزة الأنيقة</p>\r\n<p class=\"p1\" style=\"direction: rtl;\">المصممة لتمنحك اطلالات متعددة&nbsp;</p>', '<p class=\"p1\">Stand out from the crowd with this elegant blouse<br />Designed to give you multiple looks</p>', 'MULTI', 'Multi', '33.33', 12, 8, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 11, '2022-04-17 22:18:26', '2022-06-02 01:04:13', NULL, 0, 'blouse-with-slits.jpeg', NULL),
(230, 'فستان قصير الوان', 'Maldives', 'maldives', 'فستان قصير فوق الركبه باكمام طويله وفتحه صدر', 'Short dress above the knee with long sleeves and an open chest', '<p style=\"direction: rtl;\">تميزي في مناسبتك القادمة مع فستان بخصر مفتوح بتصميم جريء&nbsp;</p>\r\n<p style=\"direction: rtl;\">نسيج بوليستر ناعم ومطاطي</p>\r\n<p style=\"direction: rtl;\">ياقة عميقة واكمام طويلة بنمط بالون باساور ضيقة</p>\r\n<p style=\"direction: rtl;\">خصر بنمط ملتوي</p>', '<p>Stand out at your next event with an open-waisted dress with a bold design</p>\r\n<p>Soft and stretchable polyester fabric<br />Deep neck and long sleeves with narrow cuffed balloon pattern<br />Twisted waist</p>', 'MULTI', 'Multi', '25.00', 20, 15, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 6, '2022-04-17 22:23:24', '2022-05-15 12:52:14', NULL, 0, 'short-color-dress.jpeg', NULL),
(231, 'بنطال واسع', 'fancy', 'fancy', 'بنطال واسع ناعم بازرار', 'Soft wide leg pants', '<p style=\"direction: rtl;\">نسيج صوف ناعم ومريح</p>\r\n<p style=\"direction: rtl;\">سحاب مخفي وزر علوي للاغلاق</p>', '<p>Soft and comfortable fleece fabric<br />Concealed zip and top button closure</p>', 'MULTI', 'Multi', '16.67', 18, 15, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-17', 0, 1, 0, 3, 0, 15, '2022-04-17 22:26:25', '2022-04-23 04:39:24', NULL, 0, 'wide-pants.jpeg', NULL),
(232, 'جمبسوت مناسبات', 'grabbing', 'grabbing', 'جمبسوت واسع طويل باكمام منفوشة وفتحه صدر&nbsp;', 'Long jumpsuit with open chest and sleeves', '<p style=\"direction: rtl;\"><strong>تتميز هذه القطعة الانتقالية بإطلالتها الجميلة ويمكن ارتداؤها في أي وقت </strong></p>\r\n<p style=\"direction: rtl;\"><strong>حيث انها تنتقل من موسم إلى اخر بسهولة تامة </strong></p>\r\n<p style=\"direction: rtl;\"><strong>وتأخذك من اجتماعات العمل إلى مواعيد التسكع المسائية.</strong></p>\r\n<p style=\"direction: rtl;\">نسيج بوليستر مطاطي مزين بكسرات</p>\r\n<p style=\"direction: rtl;\">اكمام منفوشة بأساور مطاطية</p>\r\n<p style=\"direction: rtl;\">سحاب خلفي مخفي</p>\r\n<p style=\"direction: rtl;\">تصميم بأطراف واسعة</p>', '<p><strong>This transitional piece has a beautiful look and can be worn at any time </strong></p>\r\n<p><strong>as it transitions from season to season with complete ease and takes you </strong></p>\r\n<p><strong>from business meetings to evening hangouts.</strong></p>\r\n<p>Pleated stretch polyester fabric<br />Puffed sleeves with elasticated cuffs<br />Concealed back zipper<br />Wide brim design</p>', 'MULTI', 'Multi', '14.29', 35, 30, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-18', 0, 1, 0, 3, 0, 12, '2022-04-18 09:04:48', '2022-04-23 04:37:57', NULL, 0, 'occasions-jumpsuit.jpeg', NULL),
(233, 'طقم ناعم 2 قطعة', 'nautical', 'nautical', 'طقم قطعتين نصف تكمام وبنطلون طويل ناعم&nbsp;', 'Two-piece set, half-sleeved and soft long pants &nbsp; &nbsp;', '<p class=\"p1\"><span class=\"s1\">صناعة</span> <span class=\"s1\">تركية</span></p>\r\n<p class=\"p1\"><span class=\"s1\">توصيل</span> <span class=\"s1\">في</span> <span class=\"s1\">نفس</span> <span class=\"s1\">اليوم</span></p>\r\n<p class=\"p3\">&nbsp;</p>', '<p class=\"p1\">&nbsp;</p>\r\n<p class=\"p3\"><span class=\"s2\">Turkish industry</span></p>\r\n<p class=\"p3\"><span class=\"s2\">Same day delivery</span></p>', 'MULTI', 'MULTI', '10.00', 20, 18, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-18', 0, 1, 0, 3, 0, 1, '2022-04-18 09:10:51', '2022-05-31 14:50:27', NULL, 0, 'nautical.jpeg', NULL),
(234, 'بليزر باكمام', 'glitter', 'glitter', 'بليزر طويل باكمام طويله بتطريز جانبي مع فتحه&nbsp;', 'Long-sleeved long-sleeved blazer with side embroidery', '<p style=\"direction: rtl;\"><strong>الكثير من التفاصيل الأنيقة في هذا الجاكت تجعله كل يوم.</strong></p>\r\n<p style=\"direction: rtl;\"><br />نسيج بولي قطن ناعم ومريح<br />اكمام طويلة وياقة<br />زر في الأمام للإغلاق<br />جيوب مزدوجة على كلا النوعين</p>', '<p class=\"p1\"><strong>Lots of chic details in this jacket make it every day.</strong><br />Soft and comfortable poly-cotton blend fabric<br />Long sleeves and collar<br />Button at the front for closure<br />Double pockets on both types<br />Elegant decoration on the shoulders</p>', 'Multi', 'Multi', '0.00', 23.5, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-04-18', 0, 1, 0, 3, 0, 4, '2022-04-18 11:30:00', '2022-06-04 22:41:51', NULL, 0, 'sleeveless-blazer.jpeg', NULL),
(235, 'بليزر كلاسيكي مطرز', 'brightness', 'brightness', 'بليزر طويل بتطريز ناعم باكمام طويله', 'Long-sleeved, soft-embroidered long-sleeved blazer', '<p><span style=\"font-size: medium;\">الكثير من التفاصيل الأنيقة في هذه السترة والتي تجعلها ضرورية كل يوم.</span></p>\r\n<ul>\r\n<li>نسيج قطن بولي ناعم ومريح</li>\r\n<li>ياقة وأكمام طويلة</li>\r\n<li>زر من الأمام للإغلاق</li>\r\n<li>جيوب مزدوجة على كلا الجانبين</li>\r\n<li>زخرفة انيقة علي الاكتاف</li>\r\n</ul>', '<p><strong>Lots of chic details in this jacket make it every day.</strong></p>\r\n<ul>\r\n<li>Soft and comfortable poly-cotton blend fabric</li>\r\n<li><br />Long sleeves and collar</li>\r\n<li><br />Button at the front for closure</li>\r\n<li><br />Double pockets on both types</li>\r\n<li><br />Elegant decoration on the shoulders</li>\r\n</ul>', 'MULTI', 'Multi', '20.00', 25, 20, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-18', 0, 1, 0, 3, 0, 4, '2022-04-18 11:34:35', '2022-06-29 22:46:55', NULL, 1, 'embroidered-blazer.jpeg', NULL),
(236, 'طقم قطعتين جايكت +بنطلون', 'stupendous', 'stupendous', 'طقم قطعتين لون &nbsp;واسع باكمام طويله&nbsp;', 'Long-sleeved, two-piece set', NULL, NULL, 'Multi', 'Multi', '28.57', 35, 25, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-18', 0, 1, 0, 3, 0, 6, '2022-04-18 11:48:35', '2022-06-03 19:38:59', NULL, 0, 'stupendous.jpeg', NULL),
(237, 'طقم ولادي ٣ قطع انيق', 'Stylish 3-piece set for boys', 'stylish-3-piece-set-for-boys', 'طقم صيفي أنيق مكون من 3 قطع للأولادطقم ملابس بأكمام قصيرة من قطعتينطباعة قطن داخلي في الهواء الطلق2-12 سنة', 'A stylish summer 3-piece set for boysShort Sleeve Two Pieces Clothing SetIndoor cotton print outdoors2-12 years old', NULL, NULL, 'Multi', 'Multi', '20.00', 25, 20, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-18', 0, 0, 0, 3, 0, 93, '2022-04-18 11:58:12', '2022-08-26 18:55:28', NULL, 1, 'outfit-3-pics-elegant.jpeg', NULL),
(240, 'عباية طويلة مطرزة', 'floried', 'floried', 'عباية طويلة مفتوحة من الامام مع بطانة&nbsp;', 'Long open front abaya with lining', '<p style=\"direction: rtl;\">عندما تستدعي المناسبة ملابس جذابة تجعلك تتميزي عن غيرك ،<br />اختاري هذه القطعة الأنيقة.<br />تصميم مفتوح من الأمام بأكمام طويلة</p>', '<p>When the occasion calls for attractive clothes</p>\r\n<p>that make you stand out from others,</p>\r\n<p><br />Choose this elegant piece.<br />Open front long sleeve design</p>', 'MULTI', 'multi', '24.00', 50, 38, NULL, '', 1, 0, 1, 0, NULL, 1, '2022-12-31', '2022-04-20', 0, 1, 0, 3, 0, 10, '2022-04-20 09:39:04', '2022-06-22 19:57:36', NULL, 0, 'floried.jpeg', NULL),
(241, 'wooden', 'wooden', 'wooden', 'عباية بتصميم انيق&nbsp;', 'Elegant design abaya', '<p style=\"direction: rtl;\">قصة كلاسيكية ترافقك من موسم لآخر، مصممة مع اهتمام لافت بالتفاصيل</p>', '<p>A classic cut that accompanies you from season to season, designed with remarkable attention to detail</p>', 'MULTI', 'multi', '28.57', 35, 25, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-20', 0, 1, 0, 3, 0, 2, '2022-04-20 09:50:20', '2022-07-24 01:56:41', NULL, 0, 'wooden.jpeg', NULL),
(242, 'بدلة من ٤ قطع', 'luxury', 'luxury', 'بدلة من ٤ قطع جاكيت وتنوره تور وحزام وسكارفمتوفر مقاس ٣٨. ٤٠. ٤٢. ٤٤. ٤٦. ٤٨', 'بدلة من ٤ قطع جاكيت وتنوره تور وحزام وسكارفمتوفر مقاس ٣٨. ٤٠. ٤٢. ٤٤. ٤٦. ٤٨', NULL, NULL, 'Multi', 'Multi', '22.22', 45, 35, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-20', 0, 1, 0, 3, 0, 11, '2022-04-20 10:40:39', '2022-04-29 01:38:25', NULL, 1, 'luxury.jpeg', NULL),
(243, 'جاكيت صيفي', 'Stylish summer jacket', 'stylish-summer-jacket', 'فستان بتصميم جديد موديلات 2022', 'فستان بتصميم جديد موديلات 2022', '<p>جاكيت صيفي راقي جداً&nbsp;<br />.<br />٤٠ دينار</p>', '<p>جاكيت صيفي راقي جداً&nbsp;<br />.<br /><br /></p>', 'Multi', 'Multi', '0.00', 40, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-04-20', 0, 1, 0, 3, 0, 6, '2022-04-20 10:47:17', '2022-05-15 12:51:44', NULL, 0, 'abnormal.jpeg', NULL),
(244, 'بدلة ثلاث قطع جاكيت وتنوره وحزام', 'Three-piece suit, jacket, skirt and belt', 'three-piece-suit-jacket-skirt-and-belt', 'تصميم انيق يناسب للعمل والمناسبات', 'Elegant design suitable for work and occasions', NULL, NULL, 'MULTI', 'multi', '0.00', 38, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-04-21', 0, 1, 0, 3, 0, 8, '2022-04-21 08:39:49', '2022-07-04 23:54:46', NULL, 0, 'three-piece-suit-jacket-skirt-and-belt.jpeg', NULL),
(245, 'فستان اصفر طباعة ازهار', 'Yellow floral print dress', 'yellow-floral-print-dress', 'نسيج ناعم ومريح طباعة رسوم متناقضة في كل مكان ياقة دائرية واكمام طويلة مزودة بزر إغلاق', 'Soft and comfortable fabricContrast graphic print all overRound neck and long sleevesProvided with button closure', NULL, NULL, 'MULTI', 'multi', '0.00', 15, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-04-21', 0, 1, 0, 3, 0, 5, '2022-04-21 08:46:08', '2022-05-22 23:37:25', NULL, 0, 'yellow-floral-print-dress.jpeg', NULL),
(251, 'طقم مكون من بلوزة وبنطال', 'comforts', 'comforts', 'طقم مكون من بلوزة وبطال&nbsp; نسيج بوليستر مريح وخفيف الوزنياقة مفتوحة باكمام طويلةحزام خصر قابل للتعديل&nbsp;', 'A set consisting of a blouse and trousersComfortable and lightweight polyester fabricOpen neck with long sleevesAdjustable waist belt', '<p style=\"direction: rtl;\">قصة مريحة تستحضر الأناقة المبهجة إلى عطلات نهاية الأسبوع والنزهات الصيفية المريحة.</p>', '<p>A relaxed cut brings cheerful elegance to relaxed weekend getaways and summer outings.</p>', 'MULTI', 'multi', '20.00', 25, 20, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-21', 0, 1, 0, 3, 0, 1, '2022-04-22 06:52:01', '2022-08-15 00:05:07', NULL, 0, 'comforts.jpeg', NULL),
(257, 'fancy', 'fancy', 'fancy', 'نسيج ناعم ومريح ياقة كلاسيكية واكمام قصيرة ازرار للاغلاق تباع كل قطعة على حدة', 'Soft and comfortable fabric, short click shirt with buttons closure each piece separately', '<p style=\"direction: rtl;\">نسيج ناعم ومريح</p>\r\n<p style=\"direction: rtl;\">ياقة كلاسيكية واكمام قصيرة</p>\r\n<p style=\"direction: rtl;\">أزرار للإغلاق</p>\r\n<p style=\"direction: rtl;\">تباع كل قطعة على حدة</p>', '<p>Soft and comfortable fabric<br />Classic collar and short sleeves<br />buttons to close<br />Each piece is sold separately</p>', 'MULTI', 'multi', '20.00', 25, 20, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-22', 0, 1, 0, 3, 0, 80, '2022-04-22 09:40:49', '2022-05-15 12:48:16', NULL, 0, 'fancy.jpeg', NULL),
(258, 'eyes', 'eyes', 'eyes', 'اضفي بلوزة هذه على مجموعة ملابس السباحة الخاصة بك. &nbsp; &nbsp; نسيج فيسكوز مريح وخفيف الوزن ياقة مفتوحة واكمام قصيرة رسم مميز علي الصدر متوفر بالالوان الابيض', 'Add this top to your swimwear collection. Comfortable and lightweight viscose fabricOpen neck and short sleevesDistinctive drawing on the chestAvailable in white', NULL, NULL, 'MULTI', 'multi', '20.00', 15, 12, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-04-22', 0, 1, 0, 3, 0, 5, '2022-04-22 09:49:56', '2022-05-22 23:30:52', NULL, 0, 'eyes.jpeg', NULL),
(260, 'Caraclan', 'Caraclan', 'caraclan', 'جمبسوت راقي متوفر باللون الأسود', 'جمبسوت راقي متوفر باللون الأسود', NULL, NULL, 'Multi', 'Multi', '0.00', 40, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-04-23', 0, 1, 0, 13, 0, 4, '2022-04-24 02:49:25', '2022-06-25 13:19:36', NULL, 0, 'caraclan.jpeg', NULL),
(261, 'بدلة قطعتين', 'بدلة قطعتين', 'bdl-ktaatyn', 'بدلة قعطتين من مالتي بأجود الخامات', 'بدلة قعطتين من مالتي بأجود الخامات', NULL, NULL, 'Multi', 'Multi', '0.00', 25, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-04-28', 0, 1, 0, 1, 0, 6, '2022-04-28 11:27:23', '2022-06-27 16:19:18', NULL, 1, 'bdl-ktaatyn.jpeg', NULL),
(264, 'طقم بلوزوه طويلة + بنطال', 'Long blouse + pants set', 'long-blouse-pants-set', 'نسيج قطن خفيف ومريح البلوزة: ياقة دائرية واكمام طويلة تصميم بحزام البنطال: خصر مطاطي لارتداء مريح', 'Light and comfortable cotton fabricBlouse: Round neck and long sleevesbelt designPants: Elasticated waist for a comfortable fit', '<div class=\"follow-brand__description\" style=\"direction: rtl;\">تابع هذه الماركة لتصلك أحدث إصداراتها وآخر مستجدات تشكيلتها الحالية وغيرها الكثير.</div>', '<p>Follow this brand to receive its latest releases, the latest developments in its current collection, and much more.</p>', 'MULTI', 'multi', '0.00', 17, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-15', 0, 1, 0, 15, 0, 125, '2022-05-15 12:11:41', '2022-06-19 14:43:13', NULL, 0, 'long-blouse-pants-set.jpeg', NULL),
(266, 'طقم قطعتين بحزام', '2 piece set + belt', '2-piece-set-belt', 'تتميز هذه القطعة الانتقالية بإطلالتها الفائقة ويمكن ارتداؤها من موسم الى اخر.\r\nنسيج قطن ومطرز مزين بفتحات\r\nياقة كلاسيكية&nbsp;\r\nبلوزة بأطراف غير متماثلة\r\nبنطال واسع بخصر مطاطي\r\nاطراف مزينة بفتحة', '', '<p>This transitional piece has a superior look and can be worn from season to season.</p>\r\n<p>Cotton fabric with embroidered holes<br />classic collar<br />asymmetric hem blouse<br />Wide leg pants with elasticated waist<br />Perforated edges</p>', NULL, 'MULTI', 'multi', '0.00', 45, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-16', 0, 1, 0, 15, 0, 148, '2022-05-16 12:21:55', '2022-08-22 12:27:25', NULL, 0, '2-piece-set-belt.jpeg', NULL),
(267, 'فستان شيفون مطرز عل الصدر', 'Chiffon dress embroidered on the chest', 'chiffon-dress-embroidered-on-the-chest', 'نسيج بوليستر شفاف وناعم مع بطانةاكمام طويلة مع تداخل كشكش واساور مطاطيةأربطة قابلة للتعديل علي الخصرفستان بطول ماكسي بحافة واسعة فلير', 'Sheer and soft polyester fabric with liningLong sleeves with ruffle inserts and elasticated cuffsAdjustable ties at the waistMaxi dress with flared hem', NULL, NULL, 'MULTI', 'multi', '0.00', 45, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-16', 0, 1, 0, 15, 0, 99, '2022-05-16 12:44:06', '2022-05-16 12:46:26', NULL, 0, 'chiffon-dress-embroidered-on-the-chest.jpeg', NULL),
(268, 'فستان طويل مخمل ناعم أكمام طويلة مفتوحة مزين', 'Sequined long open sleeves soft maxi dress', 'sequined-long-open-sleeves-soft-maxi-dress', 'فستان طويل ناعم أكمام طويلة مفتوحة مزين بترتر\r\n&nbsp;\r\n&nbsp;\r\n&nbsp;', 'Sequined long open sleeves soft maxi dress', '<p>Sequined long open sleeves soft maxi dress</p>', NULL, 'MULTI', 'multi', '0.00', 48, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-16', 0, 1, 0, 15, 0, 119, '2022-05-16 13:34:12', '2022-06-03 19:37:53', NULL, 0, 'sequined-long-open-sleeves-soft-maxi-dress.jpeg', NULL),
(269, 'طقم قطعتين ترتر علي الاكتاف والصدر', 'Two-piece set, sequins on the shoulders and the ch', 'two-piece-set-sequins-on-the-shoulders-and-the-ch', '', 'طقم قطعتين اكمام واسعة وترتر علي الاكتاف والصدر', '<p>Two-piece set with wide sleeves and sequins on the shoulders and the chest</p>', NULL, 'MULTI', 'multi', '0.00', 25, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-16', 0, 1, 0, 15, 0, 80, '2022-05-16 14:44:43', '2022-05-21 12:38:49', NULL, 0, 'two-piece-set-sequins-on-the-shoulders-and-the-ch.jpeg', NULL),
(270, 'فستان + جاكيت', 'Dress + jacket', 'dress-jacket', 'الفستان المثالي لابنتك الصغيرة في المناسبات الخاصة.', 'The perfect dress for your little girl on special occasions.', NULL, NULL, 'MULTI', 'multi', '0.00', 30, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-18', 0, 1, 0, 15, 0, 200, '2022-05-18 13:24:20', '2022-08-27 18:45:49', NULL, 0, 'dress-jacket.jpeg', NULL),
(271, 'فستان قصير سادة', 'Plain short dress', 'plain-short-dress', 'فستان قصير بدون اكمام قطعه واحدة', 'Short sleeveless one-piece dress', '<p>فستان قصير بدون اكمام قطعه واحدة</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Short sleeveless one-piece dress</span></pre>\r\n</div>\r\n<div id=\"tw-target-rmn-container\" class=\"tw-target-rmn tw-ta-container F0azHf tw-nfl\">\r\n<pre id=\"tw-target-rmn\" class=\"tw-data-placeholder tw-text-small tw-ta\" dir=\"ltr\" data-placeholder=\"\"></pre>\r\n</div>\r\n<div class=\"iYB33c\">\r\n<div class=\"dlJLJe\">\r\n<div data-cviv=\"false\" data-ved=\"2ahUKEwj8z9WJl-r3AhURg_0HHXu5CJUQz_AEegQIAhAP\">\r\n<div class=\"U9URNb\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', 'multi', 'multi', '40.00', 20, 12, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-05-19', 0, 1, 0, 15, 0, 7, '2022-05-19 02:31:25', '2022-08-27 18:44:13', NULL, 0, 'plain-short-dress.jpeg', NULL),
(272, 'فستان قصير منفوش بأكمام', 'Short sleeve puff sleeve dress', 'short-sleeve-puff-sleeve-dress', 'فستان قصير منفوش بأكمام', 'Short sleeve puff sleeve dress &nbsp;', '<p>فستان قصير منفوش بأكمام</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Short sleeve puff sleeve dress</span></pre>\r\n</div>\r\n<div id=\"tw-target-rmn-container\" class=\"tw-target-rmn tw-ta-container F0azHf tw-nfl\">\r\n<pre id=\"tw-target-rmn\" class=\"tw-data-placeholder tw-text-small tw-ta\" dir=\"ltr\" data-placeholder=\"\"></pre>\r\n</div>\r\n<div class=\"iYB33c\">\r\n<div class=\"dlJLJe\">\r\n<div data-cviv=\"false\" data-ved=\"2ahUKEwj8z9WJl-r3AhURg_0HHXu5CJUQz_AEegQIAhAP\">\r\n<div class=\"U9URNb\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', 'multi', 'multi', '25.00', 20, 15, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-05-19', 0, 1, 0, 15, 0, 10, '2022-05-19 02:35:34', '2022-08-27 18:45:15', NULL, 0, 'short-sleeve-puff-sleeve-dress.jpeg', NULL),
(276, 'فستا قصير بنقوشات', 'فستا قصير بنقوشات', 'fsta-ksyr-bnkoshat', 'فستان منفوش قصير فوت الركبه بنقوشات', 'A short sleeved ball gown dress with patterns &nbsp;', '<p>فستان منفوش قصير فوت الركبه بنقوشات</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">A short sleeved ball gown dress with patterns</span></pre>\r\n</div>', 'multi', 'multi', '31.58', 19, 13, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-05-19', 0, 1, 0, 15, 0, 10, '2022-05-19 02:54:50', '2022-08-27 18:39:00', NULL, 0, 'fsta-ksyr-bnkoshat.jpeg', NULL),
(277, 'فستان منفوش', 'fluffy dress', 'fluffy-dress', 'فستان منفوش تحت الركبة بدون اكمام', 'A sleeveless, below-the-knee ball gown dress', '<p>فستان منفوش تحت الركبة بدون اكمام</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">A sleeveless, below-the-knee ball gown dress</span></pre>\r\n</div>', 'multi', 'multi', '26.32', 19, 14, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-05-19', 0, 1, 0, 15, 0, 10, '2022-05-19 02:57:38', '2022-05-19 02:57:38', NULL, 0, 'fluffy-dress.jpeg', NULL),
(280, 'فستان قطعتين', 'two piece dress', 'two-piece-dress', 'طقم قطعتين فستان وجاكيت', 'Two-piece dress and jacket set', '<p>طقم قطعتين فستان وجاكيت</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Two-piece dress and jacket set</span></pre>\r\n</div>', 'multi', 'multi', '19.05', 21, 17, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-05-19', 0, 1, 0, 15, 0, 10, '2022-05-19 03:08:18', '2022-05-19 03:08:18', NULL, 0, 'two-piece-dress.jpeg', NULL),
(281, 'طقم قطعتين', 'طقم قطعتين', 'tkm-ktaatyn', 'طقم قطعتين بنطلون وبلوزه انيقه', 'Two-piece set of elegant pants and blouse &nbsp;', '<p>طقم قطعتين بنطلون وبلوزه انيقه</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Two-piece set of elegant pants and blouse</span></pre>\r\n</div>', 'multi', 'multi', '26.09', 23, 17, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-05-19', 0, 1, 0, 15, 0, 10, '2022-05-19 03:14:01', '2022-08-27 18:40:12', NULL, 0, 'tkm-ktaatyn.jpeg', NULL),
(282, 'طقم قطعتين', '2-piece set', '2-piece-set', 'فستان قطعتين فستان وجيب تركيب', 'Two-piece dress and pocket fitted dress &nbsp;', '<p>فستان قطعتين فستان وجيب تركيب</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Two-piece dress and pocket fitted dress</span></pre>\r\n</div>', 'multi', 'multi', '37.50', 24, 15, NULL, '', 1, 0, 1, 0, NULL, 1, NULL, '2022-05-19', 0, 1, 0, 15, 0, 9, '2022-05-19 03:19:36', '2022-08-27 18:41:20', NULL, 0, '2-piece-set.jpeg', NULL),
(283, 'فستان بناتي انيق', 'Stylish dress for girls', 'stylish-dress-for-girls', 'اطلالة مميزة ولافتة مع هذا الفستان بطبقات متعددة من مجموعة مالتي. نسيج مريح وخفيف الوزن طبقات جزئية كشكش علي كامل التصميم ياقة دائرية فتحة من الخلف مع زر علوي للاغلاق', 'A distinctive and striking look with this multi-layered dress from the Multi collection. Comfortable and lightweight fabricPartial layers of ruffles all over the designRound neckBack slit with top button closure', NULL, NULL, 'MULTI', 'multi', '0.00', 31, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-19', 0, 1, 0, 15, 0, 299, '2022-05-19 12:15:43', '2022-08-27 18:41:49', NULL, 0, 'stylish-dress-for-girls.jpeg', NULL),
(284, 'عباية استقبال بنات انيقة', 'Stylish girls abaya', 'stylish-girls-abaya', 'اطلالة مميزة ولافتة مع هذا عباية الاستقبال الأنيقة المميزة', 'A distinctive and striking look with this elegant and distinctive Istikbal Abaya', NULL, NULL, 'MULTI', 'multi', '0.00', 29, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-19', 0, 1, 0, 15, 0, 246, '2022-05-19 13:03:55', '2022-08-27 18:42:55', NULL, 0, 'stylish-girls-abaya.jpeg', NULL),
(286, 'بدلة 4 قطع', '4 piece suit', '4-piece-suit', 'جاكيت + بلوزة + بنطلون + كمر', 'Jacket + Blouse + Pants + Camisole', NULL, NULL, 'MULTI', 'multi', '0.00', 40, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-21', 0, 1, 0, 15, 0, 60, '2022-05-21 13:35:03', '2022-05-21 13:35:03', NULL, 0, '4-piece-suit.jpeg', NULL),
(287, 'دراعة 2022', 'Draa 2022', 'draa-2022', 'قصة كلاسيكية ترافقك من موسم لآخر، مصممة مع اهتمام لافت بالتفاصيل.\r\nنسيج قطن محبوك، خفيف الوزن وانسيابي\r\nتصميم مقفول في الامام واكمام طويلة', 'A classic cut that accompanies you from season to season, designed with remarkable attention to detail.\r\nKnitted cotton fabric, lightweight and streamlinedClosed front design, long sleeves', NULL, NULL, 'MULTI', 'multi', '0.00', 15, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-21', 0, 1, 0, 15, 0, 40, '2022-05-21 13:42:46', '2022-05-21 13:42:46', NULL, 0, 'draa-2022.jpeg', NULL),
(288, 'ترينج رياضي', 'tring athlete', 'tring-athlete', 'ترينق نسائي تصميم مودرن', 'Women\'s sling, modern design', NULL, NULL, 'MULTI', 'multi', '0.00', 21, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-21', 0, 1, 0, 15, 0, 60, '2022-05-21 13:55:11', '2022-05-21 16:29:28', NULL, 0, 'tring-athlete.jpeg', NULL),
(289, 'بلوزة بياقة عريضة', 'Blouse with a wide neck', 'blouse-with-a-wide-neck', 'نسيج قطن مريح وناعمزخرفة بلون مغاير علي كامل التصميمياقة مربعة واكمام طيلة&nbsp;خصر مريح لضبط المقاس', 'Comfortable and soft cotton fabricContrast color decoration all over the designSquare neck and long sleevesComfortable waist to adjust the size', NULL, NULL, 'MULTI', 'multi', '0.00', 12, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-22', 0, 1, 0, 15, 0, 60, '2022-05-22 12:32:22', '2022-05-22 12:33:51', NULL, 0, 'blouse-with-a-wide-neck-print.jpeg', NULL),
(290, 'دراعة مودرن', 'Modern Draa', 'modern-draa', 'تصميم مودرن مناسب لجميع المواسم ومصمم بطريقة استثنائية&nbsp;', 'Modern design suitable for all seasons and designed in an exceptional way', NULL, NULL, 'MULTI', 'multi', '0.00', 25, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-22', 0, 1, 0, 15, 0, 60, '2022-05-22 12:41:05', '2022-05-22 12:41:05', NULL, 0, 'modern-draa.jpeg', NULL),
(291, 'طقم قطعتين راقي جدا', 'Very elegant two piece set', 'very-elegant-two-piece-set', 'عندما تستدعي المناسبة ارتداء ملابس جذابة تجعلك تتميزين وسط الحشود،\r\nاختاري هذه القطعة الأنيقة.', 'When the occasion calls for an attractive outfit that will make you stand out from the crowd,\r\nopt for this elegant piece.', NULL, NULL, 'MULTI', 'multi', '0.00', 16, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-22', 0, 1, 0, 15, 0, 119, '2022-05-22 15:17:20', '2022-08-17 14:40:09', NULL, 0, 'very-elegant-two-piece-set.jpeg', NULL),
(292, 'فستان متعدد الالوان', 'multicolored dress', 'multicolored-dress', 'إطلالة مفعمة بالحيوية وطبعات الأزهار تضفي لمسة ملونة على أيام الصيف.', 'A lively look and floral prints add a pop of color to summer days.', NULL, NULL, 'MULTI', 'multi', '0.00', 15, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-23', 0, 1, 0, 15, 0, 6, '2022-05-23 11:55:47', '2022-05-23 11:56:23', NULL, 0, 'multicolored-dress.jpeg', NULL),
(293, 'طقم قطعتين كاجوال للنساء', 'Women\'s casual two-piece set', 'womens-casual-two-piece-set', 'تالقي بهذه القطعة المريحة من حيث الالوان والخامات الصيفية&nbsp;', '', '<p>This comfortable piece in terms of summer colors and materials</p>', NULL, 'MULTI', 'multi', '0.00', 18.5, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-23', 0, 1, 0, 15, 0, 60, '2022-05-23 12:22:56', '2022-05-23 12:22:56', NULL, 0, 'womens-casual-two-piece-set.jpeg', NULL),
(294, 'جمبسوت بساق ضيق مطوي امامي طبقات ومكشوف الاكتاف', 'Tight-leg jumpsuit with pleated front layers and o', 'tight-leg-jumpsuit-with-pleated-front-layers-and-o', 'هذه القطعة المليئة بالأنوثة المصممه بنظام الجمبسوت سيجعل منك ملفتة في اناقتك وانوثتك في أي مناسبة سترتديه فيها,', 'This piece full of femininity designed with a jumpsuit system will make you attractive in your elegance and femininity on any occasion you will wear it,', NULL, NULL, 'MULTI', 'multi', '0.00', 23.5, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-23', 0, 1, 0, 15, 0, 45, '2022-05-23 12:54:09', '2022-05-23 12:54:09', NULL, 0, 'tight-leg-jumpsuit-with-pleated-front-layers-and-o.jpeg', NULL),
(295, 'جمبسوت زارا', 'Zara jumpsuit', 'zara-jumpsuit', 'جمبسوت زارا اسود بأحدث موديلات 2022&nbsp;', 'Black Zara jumpsuit with the latest models 2022', NULL, NULL, 'MULTI', 'multi', '0.00', 15, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-23', 0, 1, 0, 15, 0, 45, '2022-05-23 13:58:02', '2022-05-23 13:58:02', NULL, 0, 'zara-jumpsuit.jpeg', NULL),
(296, 'فستان محجبات راقي', 'Elegant veiled dress', 'elegant-veiled-dress', 'فستان محجبات طويل وراقي فتحة صدر مقفولة + رسم علي الصدر', 'A long elegant veiled dress with a closed chest opening + drawing on the chest', NULL, NULL, 'MULTI', 'multi', '0.00', 32, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-24', 0, 1, 0, 15, 0, 180, '2022-05-24 14:07:05', '2022-05-24 14:07:05', NULL, 0, 'elegant-veiled-dress.jpeg', NULL),
(297, 'فستات سهرات', 'Evening dresses', 'evening-dresses', 'فساتين سهرة طويلة لإطلالة فخمة .قصة طويلة مفتوحة مع بنطلون مفتوح من الاسفل', 'Long evening dresses for a luxurious look.Long open style with open bottom pants', NULL, NULL, 'MULTI', 'multi', '0.00', 32, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-24', 0, 1, 0, 15, 0, 143, '2022-05-24 14:23:02', '2022-07-19 23:07:22', NULL, 0, 'evening-dresses.jpeg', NULL),
(299, 'فستان محبات قطعتين', 'Lovers two-piece dress', 'lovers-two-piece-dress', 'فستان محجبات قطعتين للمناسبات السعيدة\r\nكم منفوش ترتر علي الوسط قماش شيفون', 'Two-piece veiled dress for happy occasionsFluffy sleeve, sequins on the middle, chiffon fabric', NULL, NULL, 'MULTI', 'multi', '0.00', 25, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-28', 0, 1, 0, 15, 0, 60, '2022-05-28 12:26:15', '2022-05-28 12:26:15', NULL, 0, 'lovers-two-piece-dress.jpeg', NULL),
(300, 'طقم قطعتين بلوزة + بنطلون', 'Two-piece set blouse + pants', 'two-piece-set-blouse-pants', 'طقم قطعتين بلوزة + بنطلون مع رباط علي الوسط&nbsp;', 'Two-piece set, blouse + pants, with a tie on the middle', NULL, NULL, 'MULTI', 'multi', '0.00', 14, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-28', 0, 1, 0, 15, 0, 75, '2022-05-28 12:30:49', '2022-05-28 12:30:49', NULL, 0, 'two-piece-set-blouse-pants.jpeg', NULL),
(301, 'دراعة', 'Daraa', 'daraa', 'دراعة مع تطريز علي الصدر', 'Daraa with embroidery on the chest', NULL, NULL, 'MULTI', 'multi', '0.00', 23, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-28', 0, 1, 0, 15, 0, 80, '2022-05-28 12:45:50', '2022-05-28 21:14:40', NULL, 0, 'daraa.jpeg', NULL),
(302, 'طقم رياضي للزوجين', 'Couples gym outfit', 'couples-gym-outfit', 'طقم رياضي كابلز رجالي ونسائي', 'Couples gym outfit', NULL, NULL, 'MULTI', 'multi', '0.00', 24, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-28', 0, 1, 0, 15, 0, 144, '2022-05-28 12:58:04', '2022-12-16 19:42:00', NULL, 0, 'couples-gym-outfit.jpeg', NULL),
(303, 'فستان بطباعة ازهار', 'floral print dress', 'floral-print-dress', 'نسيج بوليستر مع حزام&nbsp;طباعة زهور بلون مغاير على التصميم&nbsp;تصميم مزموم من الاعلى &nbsp;ياقة مفتوحة واكمام قصيرةتصميم ميدي بحافة واسعة متباينة الطول', 'polyester fabric with beltContrast floral print on designPleated design at the top, open neck and short sleevesMidi design with wide hem', NULL, NULL, 'MULTI', 'multi', '0.00', 23, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-05-28', 0, 1, 0, 15, 0, 49, '2022-05-28 20:41:54', '2022-06-06 14:33:57', NULL, 0, 'floral-print-dress.jpeg', NULL),
(306, 'فستان قصير قطعتين', 'فستان قصير قطعتين', 'fstan-ksyr-ktaatyn', 'فستان قصير قطعتين', 'فستان قصير قطعتين', '<p>فستان قصير قطعتين</p>', '<p>فستان قصير قطعتين</p>', 'mymall', NULL, '0.00', 6, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-04', 1, 1, 0, 3, 0, 8, '2022-06-04 19:27:35', '2022-07-06 22:45:01', NULL, 0, 'fstan-ksyr-ktaatyn.jpeg', NULL),
(307, 'طقم قطعتين - بلوزة وبنطلون', 'Two-piece set - blouse and pants', 'two-piece-set-blouse-and-pants', 'مزين بتفاصيل فاخرة، يضفي هذا الطقم لمسة نهائية فاخرة على إطلالاتك .', 'Adorned with luxurious details, this set adds a luxurious finishing touch to your look.', NULL, NULL, 'MULTI', 'multi', '0.00', 13, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-13', 0, 1, 0, 15, 0, 100, '2022-06-13 19:29:23', '2022-06-13 19:29:23', NULL, 0, 'two-piece-set-blouse-and-pants.jpeg', NULL),
(308, 'فستان قصير بسحاب', 'Zippered short dress', 'zippered-short-dress', 'فستان منفوش بناتي قصير بدون اكمام&nbsp;', 'Short sleeveless dress for girls &nbsp;', '<p>فستان منفوش بناتي قصير بدون اكمام&nbsp;</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Short sleeveless dress for girls</span></pre>\r\n</div>\r\n<div id=\"tw-target-rmn-container\" class=\"tw-target-rmn tw-ta-container F0azHf tw-nfl\">\r\n<pre id=\"tw-target-rmn\" class=\"tw-data-placeholder tw-text-small tw-ta\" dir=\"ltr\" data-placeholder=\"\"></pre>\r\n</div>\r\n<div class=\"iYB33c\">\r\n<div class=\"dlJLJe\">\r\n<div data-cviv=\"false\" data-ved=\"2ahUKEwi8z4KbvMj4AhXBi_0HHXcpBY4Qz_AEegQIAhAP\">\r\n<div class=\"U9URNb\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', 'multi', 'multi', '0.00', 26, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-25', 0, 1, 0, 5, 0, 80, '2022-06-25 14:17:01', '2022-08-27 18:36:41', NULL, 0, 'zippered-short-dress.jpeg', NULL),
(309, 'فستان بتطريز ابيض', 'White embroidered dress', 'white-embroidered-dress', 'فستان بناتي منفوش بتطريز ابيض بارز بدون اكمام مع اكسسوار شعر', 'Girls\' fluffy dress with white embellishment, without sleeves, with hair accessories', '<p>فستان بناتي منفوش بتطريز ابيض بارز بدون اكمام مع اكسسوار شعر</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Girls\' fluffy dress with white embellishment, without sleeves, with hair accessories</span></pre>\r\n</div>', 'multi', 'multi', '0.00', 29, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-25', 0, 1, 0, 5, 0, 50, '2022-06-25 14:19:18', '2022-08-27 18:49:41', NULL, 0, 'white-embroidered-dress.jpeg', NULL),
(310, 'فستان بتطريز بارز', 'embroidered embroidered dress', 'embroidered-embroidered-dress', 'فستان قصير بناتي بتطريز ابيض بارز بدون اكمام مع ربطه شعر', 'Short dress for girls, with white embellishment, without sleeves, with a hair tie', '<p>فستان قصير بناتي بتطريز ابيض بارز بدون اكمام مع ربطه شعر</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Short dress for girls, with white embellishment, without sleeves, with a hair tie</span></pre>\r\n</div>', 'multi', 'multi', '0.00', 30, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-25', 0, 1, 0, 5, 0, 90, '2022-06-25 14:22:55', '2022-08-27 18:37:41', NULL, 0, 'embroidered-embroidered-dress.jpeg', NULL),
(311, 'فستان طويل منفوش', 'Long flowy dress', 'long-flowy-dress', 'فستان طويل بناتي جديد منفوش بدون اكمام مع اكسسوار شعر', 'New long sleeveless long dress for girls with hair accessories &nbsp;', '<p>فستان طويل بناتي جديد منفوش بدون اكمام مع اكسسوار شعر</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">New long sleeveless long dress for girls with hair accessories</span></pre>\r\n</div>\r\n<div id=\"tw-target-rmn-container\" class=\"tw-target-rmn tw-ta-container F0azHf tw-nfl\">\r\n<pre id=\"tw-target-rmn\" class=\"tw-data-placeholder tw-text-small tw-ta\" dir=\"ltr\" data-placeholder=\"\"></pre>\r\n</div>\r\n<div class=\"iYB33c\">\r\n<div class=\"dlJLJe\">\r\n<div data-cviv=\"false\" data-ved=\"2ahUKEwi8z4KbvMj4AhXBi_0HHXcpBY4Qz_AEegQIAhAP\">\r\n<div class=\"U9URNb\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', 'multi', 'multi', '0.00', 29, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-25', 0, 1, 0, 5, 0, 80, '2022-06-25 14:27:51', '2022-08-27 18:38:05', NULL, 0, 'long-flowy-dress.jpeg', NULL),
(312, 'فستان طويل', 'dress long', 'dress-long', 'فستان طويل بربطة صدر بدور اكمام', 'Long dress with bow and sleeves &nbsp;', '<p>فستان طويل بربطة صدر بدور اكمام</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Long dress with bow and sleeves</span></pre>\r\n</div>\r\n<div id=\"tw-target-rmn-container\" class=\"tw-target-rmn tw-ta-container F0azHf tw-nfl\">\r\n<pre id=\"tw-target-rmn\" class=\"tw-data-placeholder tw-text-small tw-ta\" dir=\"ltr\" data-placeholder=\"\"></pre>\r\n</div>\r\n<div class=\"iYB33c\">\r\n<div class=\"dlJLJe\">\r\n<div data-cviv=\"false\" data-ved=\"2ahUKEwi8z4KbvMj4AhXBi_0HHXcpBY4Qz_AEegQIAhAP\">\r\n<div class=\"U9URNb\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', 'multi', 'multi', '0.00', 24, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-25', 0, 1, 0, 5, 0, 120, '2022-06-25 14:30:49', '2022-08-27 18:35:50', NULL, 0, 'dress-long.jpeg', NULL),
(313, 'فستان طويل', 'long dress', 'long-dress', 'فستان طويل بربطه عنق بدون اكمام', 'Long sleeveless tie neck dress &nbsp;', '<p>فستان طويل بربطه عنق بدون اكمام</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Long sleeveless tie neck dress</span></pre>\r\n</div>\r\n<div id=\"tw-target-rmn-container\" class=\"tw-target-rmn tw-ta-container F0azHf tw-nfl\">\r\n<pre id=\"tw-target-rmn\" class=\"tw-data-placeholder tw-text-small tw-ta\" dir=\"ltr\" data-placeholder=\"\"></pre>\r\n</div>\r\n<div class=\"iYB33c\">\r\n<div class=\"dlJLJe\">\r\n<div data-cviv=\"false\" data-ved=\"2ahUKEwi8z4KbvMj4AhXBi_0HHXcpBY4Qz_AEegQIAhAP\">\r\n<div class=\"U9URNb\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', 'multi', 'multi', '0.00', 24, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-25', 0, 0, 0, 5, 0, 50, '2022-06-25 14:35:15', '2022-08-27 18:35:30', NULL, 0, 'long-dress.jpeg', NULL),
(314, 'فستان بأكمام', 'Sleeved Dress', 'sleeved-dress', 'فستان طويل بأكمام شفافه + حزام على الخصر', 'Long dress with transparent sleeves With belt at the waist', '<p>فستان طويل بأكمام شفافه<br />بحزام في الخصر</p>', '<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Long dress with transparent sleeves\r\nWith belt at the waist</span></pre>', 'multi', 'multi', '0.00', 27, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-25', 0, 1, 0, 5, 0, 120, '2022-06-25 14:37:37', '2022-08-27 18:34:59', NULL, 0, 'sleeved-dress.jpeg', NULL),
(316, 'Unique', 'Unique', 'unique', '&nbsp;جمبسوت واسع طويل بتظريز خطوط سوداء مناسب للطلعات توصيل سريع خامات بجودة عالية احدث الموديلات', 'Oversized jumpsuit with black stripes embroidered fit for outfits &nbsp; express delivery High quality materials latest models &nbsp;', NULL, NULL, 'MULTI', 'multi', '20.00', 25, 20, NULL, '', 1, 0, 1, 0, NULL, 1, '2022-12-31', '2022-06-27', 0, 1, 0, 15, 0, 6, '2022-06-27 13:38:48', '2022-06-27 13:38:48', NULL, 0, 'unique.jpeg', NULL);
INSERT INTO `products` (`id`, `name_ar`, `name_en`, `slug`, `description_ar`, `description_en`, `about_brand_ar`, `about_brand_en`, `brand_name`, `seller_name`, `discount_percentage`, `regular_price`, `sale_price`, `end_price`, `alt`, `in_sale`, `sort`, `is_recommended`, `has_options`, `serial_number`, `is_best`, `end_sale`, `start_sale`, `is_brand`, `is_clothes`, `is_order`, `day_order`, `ratings`, `quantity`, `created_at`, `updated_at`, `deleted_at`, `likes_count`, `img`, `video`) VALUES
(317, 'فستان اميرات', 'princess dress', 'princess-dress', 'فستان تطريز خفيف بدون اكمام طويل&nbsp;', 'Light Embroidery Long Sleeveless Dress &nbsp;', '<p>فستان تطريز خفيف بدون اكمام طويل&nbsp;</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Light Embroidery Long Sleeveless Dress</span></pre>\r\n</div>', 'multi', 'multi', '0.00', 25, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-28', 0, 1, 0, 15, 0, 2, '2022-06-28 13:55:36', '2022-07-05 14:09:38', NULL, 0, 'princess-dress.jpeg', NULL),
(318, 'فستان شيفون منفوش', 'fluffy chiffon dress', 'fluffy-chiffon-dress', 'فستان تطريز شيفون بدون اكمام طويل منفوش&nbsp;', 'Long sleeve chiffon embroidered fluffy dress &nbsp;', '<p>فستان تطريز شيفون بدون اكمام طويل منفوش&nbsp;</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Long sleeve chiffon embroidered fluffy dress</span></pre>\r\n</div>\r\n<div id=\"tw-target-rmn-container\" class=\"tw-target-rmn tw-ta-container F0azHf tw-nfl\">\r\n<pre id=\"tw-target-rmn\" class=\"tw-data-placeholder tw-text-small tw-ta\" dir=\"ltr\" data-placeholder=\"\"></pre>\r\n</div>\r\n<div class=\"iYB33c\">\r\n<div class=\"dlJLJe\">\r\n<div data-cviv=\"false\" data-ved=\"2ahUKEwia6_ml_c_4AhUyhf0HHajeDJ0Qz_AEegQIAhAP\">\r\n<div class=\"U9URNb\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', 'multi', 'multi', '0.00', 25, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-28', 0, 1, 0, 15, 0, 100, '2022-06-28 13:58:30', '2022-07-05 14:09:14', NULL, 0, 'fluffy-chiffon-dress.jpeg', NULL),
(319, 'فستان برسمات ورود', 'Floral print dress', 'floral-print-dress', '&nbsp;فستان برسمات ورود بدون اكمام طويل&nbsp; دانتيل على الصدر قطعة مميزة ومحدودة جدا', 'Long sleeve floral dress Lace on the chest a very special and limited piece', '<p>فستان برسمات ورود بدون اكمام طويل&nbsp;</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Long sleeve floral dress\r\n\r\nLace on the chest a very special and limited piece</span></pre>\r\n</div>\r\n<div id=\"tw-target-rmn-container\" class=\"tw-target-rmn tw-ta-container F0azHf tw-nfl\">\r\n<pre id=\"tw-target-rmn\" class=\"tw-data-placeholder tw-text-small tw-ta\" dir=\"ltr\" data-placeholder=\"\"></pre>\r\n</div>\r\n<div class=\"iYB33c\">\r\n<div class=\"dlJLJe\">\r\n<div data-cviv=\"false\" data-ved=\"2ahUKEwia6_ml_c_4AhUyhf0HHajeDJ0Qz_AEegQIAhAP\">\r\n<div class=\"U9URNb\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', 'multi', 'multi', '0.00', 25, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-28', 0, 1, 0, 15, 0, 1, '2022-06-28 14:01:18', '2022-07-05 14:08:50', NULL, 0, 'floral-print-dress.jpeg', NULL),
(320, 'فستان اميرات منفوش', 'Princess fluffy dress', 'princess-fluffy-dress', 'فستان اميرات منفوش طويل بدون اكمام', 'Long sleeve princess dress', '<p>فستان اميرات منفوش طويل بدون اكمام</p>', '<div id=\"tw-target-text-container\" class=\"tw-ta-container F0azHf tw-nfl\" tabindex=\"0\">\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">Long sleeve princess dress</span></pre>\r\n</div>', 'multi', 'multi', '0.00', 25, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-06-28', 0, 1, 0, 15, 0, 1, '2022-06-28 15:30:32', '2022-07-05 14:08:25', NULL, 0, 'princess-fluffy-dress.jpeg', NULL),
(339, 'الاسم بالعربى', 'plants', 'plants', 'sgdg', 'dfgdffg', '<p>sdfgdfg</p>', '<p>dgdfgfd</p>', 'zara', 'wdwddw', '0.00', 10, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-07-05', 0, 1, 0, 15, 0, 10, '2022-07-05 16:31:34', '2022-07-05 16:31:34', NULL, 0, 'plants.jpeg', NULL),
(340, 'بوركيني 3 قطع', 'Burkini 3 pieces', 'burkini-3-pieces', 'بوركيني 3 قطع يمكن لبسه بأكثر من طريقة&nbsp;\r\nخامه ممتازه تنشف بسهولة\r\nجميع المقاسات متاحه&nbsp;', '3-piece burkini that can be worn in more than one way\r\n\r\nExcellent material that dries easily\r\n\r\nAll sizes are available', '<p>بوركيني 3 قطع يمكن لبسه بأكثر من طريقة&nbsp;</p>\r\n<p>خامه ممتازه تنشف بسهولة</p>\r\n<p>جميع المقاسات متاحه&nbsp;</p>', '<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Translation\"><span class=\"Y2IQFc\" lang=\"en\">3-piece burkini that can be worn in more than one way\r\n\r\nExcellent material that dries easily\r\n\r\nAll sizes are available</span></pre>', 'multi', 'multi', '0.00', 30, 0, NULL, '', 0, 0, 1, 0, NULL, 1, NULL, '2022-07-13', 0, 0, 0, 15, 0, 10, '2022-07-13 15:14:31', '2022-07-13 15:14:31', NULL, 0, 'burkini-3-pieces.jpeg', NULL),
(364, 'Jescie Mckay', 'Jescie Mckay', 'jescie-mckay', '<p>sddsd</p>', '', NULL, '<p>sddsdsd</p>', NULL, NULL, '1.00', 100, 99, NULL, NULL, 0, 0, 1, 0, '4145', 1, NULL, '2023-02-07', 0, 0, 0, 15, 0, 3, '2023-02-06 22:25:14', '2023-02-07 19:43:06', NULL, 0, 'jescie-mckay.jpeg', 'Video_jescie-mckay1675784586.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE `product_attribute` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attribute`
--

INSERT INTO `product_attribute` (`id`, `product_id`, `attribute_id`, `created_at`, `updated_at`) VALUES
(272, 237, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(558, 204, 38, NULL, NULL),
(568, 207, 51, NULL, NULL),
(576, 210, 38, NULL, NULL),
(577, 210, 68, NULL, NULL),
(578, 211, 38, NULL, NULL),
(579, 211, 70, NULL, NULL),
(580, 212, 38, NULL, NULL),
(581, 212, 68, NULL, NULL),
(582, 213, 38, NULL, NULL),
(583, 213, 68, NULL, NULL),
(588, 216, 38, NULL, NULL),
(589, 216, 71, NULL, NULL),
(594, 219, 38, NULL, NULL),
(595, 219, 71, NULL, NULL),
(596, 220, 51, NULL, NULL),
(597, 221, 51, NULL, NULL),
(598, 222, 51, NULL, NULL),
(599, 223, 51, NULL, NULL),
(601, 225, 38, NULL, NULL),
(602, 225, 68, NULL, NULL),
(603, 226, 38, NULL, NULL),
(604, 226, 68, NULL, NULL),
(605, 227, 38, NULL, NULL),
(606, 227, 69, NULL, NULL),
(607, 228, 38, NULL, NULL),
(608, 228, 73, NULL, NULL),
(609, 229, 38, NULL, NULL),
(610, 229, 69, NULL, NULL),
(611, 230, 38, NULL, NULL),
(612, 230, 68, NULL, NULL),
(613, 231, 38, NULL, NULL),
(614, 231, 70, NULL, NULL),
(615, 232, 38, NULL, NULL),
(616, 232, 72, NULL, NULL),
(617, 233, 38, NULL, NULL),
(618, 233, 71, NULL, NULL),
(619, 234, 38, NULL, NULL),
(620, 234, 69, NULL, NULL),
(621, 235, 38, NULL, NULL),
(622, 235, 69, NULL, NULL),
(623, 236, 38, NULL, NULL),
(624, 236, 71, NULL, NULL),
(626, 237, 65, NULL, NULL),
(631, 240, 38, NULL, NULL),
(632, 240, 63, NULL, NULL),
(633, 241, 38, NULL, NULL),
(634, 241, 63, NULL, NULL),
(635, 242, 38, NULL, NULL),
(637, 243, 38, NULL, NULL),
(639, 243, 69, NULL, NULL),
(640, 242, 73, NULL, NULL),
(641, 243, 82, NULL, NULL),
(642, 244, 38, NULL, NULL),
(643, 244, 73, NULL, NULL),
(644, 245, 38, NULL, NULL),
(645, 245, 68, NULL, NULL),
(693, 251, 38, NULL, NULL),
(694, 251, 71, NULL, NULL),
(695, 251, 73, NULL, NULL),
(707, 224, 38, NULL, NULL),
(708, 224, 63, NULL, NULL),
(709, 257, 38, NULL, NULL),
(710, 257, 69, NULL, NULL),
(711, 258, 38, NULL, NULL),
(712, 258, 74, NULL, NULL),
(714, 260, 38, NULL, NULL),
(715, 260, 72, NULL, NULL),
(716, 207, 80, NULL, NULL),
(717, 241, 68, NULL, NULL),
(718, 261, 38, NULL, NULL),
(719, 261, 71, NULL, NULL),
(720, 261, 73, NULL, NULL),
(732, 264, 38, NULL, NULL),
(733, 264, 71, NULL, NULL),
(741, 264, 40, NULL, NULL),
(742, 260, 40, NULL, NULL),
(743, 257, 40, NULL, NULL),
(744, 251, 40, NULL, NULL),
(745, 245, 40, NULL, NULL),
(746, 243, 40, NULL, NULL),
(747, 230, 40, NULL, NULL),
(748, 233, 40, NULL, NULL),
(749, 210, 40, NULL, NULL),
(750, 266, 38, NULL, NULL),
(751, 266, 40, NULL, NULL),
(752, 266, 71, NULL, NULL),
(753, 266, 73, NULL, NULL),
(754, 267, 38, NULL, NULL),
(755, 267, 68, NULL, NULL),
(756, 268, 38, NULL, NULL),
(757, 268, 40, NULL, NULL),
(758, 268, 68, NULL, NULL),
(759, 269, 38, NULL, NULL),
(760, 269, 40, NULL, NULL),
(761, 269, 71, NULL, NULL),
(763, 234, 40, NULL, NULL),
(764, 212, 40, NULL, NULL),
(765, 213, 40, NULL, NULL),
(766, 258, 40, NULL, NULL),
(783, 227, 40, NULL, NULL),
(787, 286, 38, NULL, NULL),
(788, 286, 73, NULL, NULL),
(789, 287, 38, NULL, NULL),
(790, 287, 40, NULL, NULL),
(791, 287, 63, NULL, NULL),
(792, 288, 38, NULL, NULL),
(793, 288, 40, NULL, NULL),
(794, 288, 71, NULL, NULL),
(795, 288, 73, NULL, NULL),
(796, 289, 38, NULL, NULL),
(797, 289, 40, NULL, NULL),
(798, 289, 85, NULL, NULL),
(799, 290, 38, NULL, NULL),
(800, 290, 40, NULL, NULL),
(801, 290, 63, NULL, NULL),
(802, 291, 38, NULL, NULL),
(803, 291, 40, NULL, NULL),
(804, 291, 63, NULL, NULL),
(805, 291, 68, NULL, NULL),
(806, 204, 71, NULL, NULL),
(807, 245, 63, NULL, NULL),
(808, 292, 38, NULL, NULL),
(809, 292, 40, NULL, NULL),
(810, 292, 68, NULL, NULL),
(811, 293, 38, NULL, NULL),
(812, 293, 40, NULL, NULL),
(813, 293, 71, NULL, NULL),
(814, 294, 38, NULL, NULL),
(815, 294, 72, NULL, NULL),
(816, 295, 38, NULL, NULL),
(817, 295, 40, NULL, NULL),
(818, 295, 72, NULL, NULL),
(819, 296, 38, NULL, NULL),
(820, 296, 40, NULL, NULL),
(821, 296, 63, NULL, NULL),
(822, 296, 68, NULL, NULL),
(823, 297, 38, NULL, NULL),
(824, 297, 40, NULL, NULL),
(825, 297, 68, NULL, NULL),
(834, 299, 38, NULL, NULL),
(835, 299, 68, NULL, NULL),
(836, 300, 38, NULL, NULL),
(837, 300, 40, NULL, NULL),
(838, 300, 71, NULL, NULL),
(839, 301, 38, NULL, NULL),
(840, 301, 63, NULL, NULL),
(842, 302, 87, NULL, NULL),
(843, 302, 89, NULL, NULL),
(844, 303, 38, NULL, NULL),
(845, 303, 68, NULL, NULL),
(848, 307, 38, NULL, NULL),
(849, 307, 40, NULL, NULL),
(850, 307, 68, NULL, NULL),
(851, 307, 71, NULL, NULL),
(865, 316, 38, NULL, NULL),
(866, 316, 40, NULL, NULL),
(867, 316, 71, NULL, NULL),
(868, 316, 72, NULL, NULL),
(869, 317, 51, NULL, NULL),
(870, 318, 51, NULL, NULL),
(871, 319, 51, NULL, NULL),
(872, 320, 51, NULL, NULL),
(929, 339, 40, NULL, NULL),
(930, 340, 74, NULL, NULL),
(1167, 314, 92, NULL, NULL),
(1168, 313, 92, NULL, NULL),
(1169, 312, 92, NULL, NULL),
(1170, 308, 92, NULL, NULL),
(1171, 310, 92, NULL, NULL),
(1172, 311, 92, NULL, NULL),
(1173, 276, 92, NULL, NULL),
(1174, 277, 92, NULL, NULL),
(1175, 280, 92, NULL, NULL),
(1176, 281, 92, NULL, NULL),
(1177, 282, 92, NULL, NULL),
(1178, 283, 92, NULL, NULL),
(1179, 284, 92, NULL, NULL),
(1180, 284, 84, NULL, NULL),
(1181, 271, 92, NULL, NULL),
(1182, 272, 92, NULL, NULL),
(1183, 270, 92, NULL, NULL),
(1184, 309, 92, NULL, NULL),
(1185, 364, 40, NULL, NULL),
(1186, 364, 63, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(520) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_price` double NOT NULL,
  `regular_price` double NOT NULL,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attributes`)),
  `student_id` int(10) UNSIGNED DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `end_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_student`
--

CREATE TABLE `product_student` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_student`
--

INSERT INTO `product_student` (`id`, `product_id`, `student_id`, `created_at`, `updated_at`) VALUES
(203, 306, 43, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prod_colors`
--

CREATE TABLE `prod_colors` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `prod_colors`
--

INSERT INTO `prod_colors` (`id`, `product_id`, `size_id`, `color_id`, `quantity`, `created_at`, `updated_at`) VALUES
(318, 222, 1, 6, 7, '2022-07-17 18:48:21', '2022-07-17 21:48:21'),
(319, 237, 48, 33, 0, '2022-04-20 19:54:36', '2022-04-21 05:54:36'),
(624, 211, 24, 6, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(625, 211, 24, 33, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(626, 211, 24, 35, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(627, 211, 25, 6, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(628, 211, 25, 33, 0, '2022-05-30 18:04:32', '2022-05-30 21:04:32'),
(629, 211, 25, 35, 0, '2022-07-23 11:46:41', '2022-07-23 14:46:41'),
(630, 211, 26, 6, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(631, 211, 26, 33, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(632, 211, 26, 35, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(633, 211, 27, 6, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(634, 211, 27, 33, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(635, 211, 27, 35, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(636, 211, 28, 6, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(637, 211, 28, 33, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(638, 211, 28, 35, 1, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(642, 242, 24, 6, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(643, 242, 24, 7, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(644, 242, 25, 6, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(645, 242, 25, 7, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(646, 242, 26, 6, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(647, 242, 26, 7, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(648, 242, 27, 6, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(649, 242, 27, 7, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(650, 242, 28, 6, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(651, 242, 28, 7, 0, '2022-04-28 15:38:25', '2022-04-29 01:38:25'),
(652, 242, 29, 6, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(653, 242, 29, 7, 1, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(672, 235, 1, 6, 1, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(673, 235, 3, 6, 1, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(674, 235, 4, 6, 1, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(675, 235, 12, 6, 1, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(676, 235, 13, 6, 1, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(782, 219, 1, 20, 2, '2022-04-21 21:14:15', '2022-04-21 21:14:15'),
(783, 219, 3, 20, 2, '2022-04-21 21:14:15', '2022-04-21 21:14:15'),
(784, 219, 4, 20, 1, '2022-04-21 21:14:15', '2022-04-21 21:14:15'),
(785, 219, 12, 20, 1, '2022-04-21 21:14:15', '2022-04-21 21:14:15'),
(872, 232, 24, 5, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(873, 232, 24, 6, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(874, 232, 25, 5, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(875, 232, 25, 6, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(876, 232, 26, 5, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(877, 232, 26, 6, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(878, 232, 27, 5, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(879, 232, 27, 6, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(880, 232, 28, 5, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(881, 232, 28, 6, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(882, 232, 29, 5, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(883, 232, 29, 6, 1, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(884, 231, 24, 6, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(885, 231, 24, 33, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(886, 231, 24, 35, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(887, 231, 25, 6, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(888, 231, 25, 33, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(889, 231, 25, 35, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(890, 231, 26, 6, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(891, 231, 26, 33, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(892, 231, 26, 35, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(893, 231, 27, 6, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(894, 231, 27, 33, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(895, 231, 27, 35, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(896, 231, 28, 6, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(897, 231, 28, 33, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(898, 231, 28, 35, 1, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(900, 229, 1, 5, 2, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(901, 229, 1, 7, 2, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(902, 229, 3, 5, 2, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(903, 229, 3, 7, 1, '2022-06-01 22:04:13', '2022-06-02 01:04:13'),
(904, 229, 4, 5, 1, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(905, 229, 4, 7, 1, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(906, 229, 12, 5, 1, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(907, 229, 12, 7, 1, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(908, 228, 24, 7, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(909, 228, 24, 33, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(910, 228, 24, 36, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(911, 228, 25, 7, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(912, 228, 25, 33, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(913, 228, 25, 36, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(914, 228, 26, 7, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(915, 228, 26, 33, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(916, 228, 26, 36, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(917, 228, 27, 7, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(918, 228, 27, 33, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(919, 228, 27, 36, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(920, 228, 28, 7, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(921, 228, 28, 33, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(922, 228, 28, 36, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(923, 228, 41, 7, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(924, 228, 41, 33, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(925, 228, 41, 36, 1, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(981, 225, 1, 5, 2, '2022-04-23 04:57:23', '2022-04-23 04:57:23'),
(982, 225, 3, 5, 1, '2022-06-02 11:32:54', '2022-06-02 14:32:54'),
(983, 225, 4, 5, 1, '2022-08-17 07:35:22', '2022-08-17 10:35:22'),
(1103, 236, 24, 18, 0, '2022-06-03 16:38:59', '2022-06-03 19:38:59'),
(1104, 236, 24, 32, 1, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(1105, 236, 25, 18, 1, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(1106, 236, 26, 18, 1, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(1107, 236, 26, 32, 1, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(1108, 236, 41, 18, 1, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(1109, 236, 41, 32, 1, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(1110, 226, 1, 5, 0, '2022-04-27 19:13:00', '2022-04-28 05:13:00'),
(1111, 226, 3, 5, 0, '2022-04-27 19:35:05', '2022-04-28 05:35:05'),
(1112, 226, 4, 5, 2, '2022-04-28 05:08:58', '2022-04-28 05:08:58'),
(1149, 216, 1, 35, 2, '2022-05-04 13:39:22', '2022-05-04 13:39:22'),
(1150, 216, 3, 35, 2, '2022-05-04 13:39:22', '2022-05-04 13:39:22'),
(1151, 216, 4, 35, 2, '2022-05-04 13:39:22', '2022-05-04 13:39:22'),
(1236, 260, 1, 6, 1, '2022-06-25 10:19:36', '2022-06-25 13:19:36'),
(1237, 260, 3, 6, 1, '2022-06-02 12:26:53', '2022-06-02 15:26:53'),
(1238, 260, 4, 6, 2, '2022-05-15 12:46:03', '2022-05-15 12:46:03'),
(1239, 257, 1, 6, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1240, 257, 1, 32, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1241, 257, 1, 33, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1242, 257, 1, 37, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1243, 257, 3, 6, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1244, 257, 3, 32, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1245, 257, 3, 33, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1246, 257, 3, 37, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1247, 257, 4, 6, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1248, 257, 4, 32, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1249, 257, 4, 33, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1250, 257, 4, 37, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1251, 257, 12, 6, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1252, 257, 12, 32, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1253, 257, 12, 33, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1254, 257, 12, 37, 5, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(1261, 243, 16, 5, 3, '2022-05-15 12:51:44', '2022-05-15 12:51:44'),
(1262, 243, 16, 32, 3, '2022-05-15 12:51:44', '2022-05-15 12:51:44'),
(1263, 230, 16, 20, 6, '2022-05-15 12:52:14', '2022-05-15 12:52:14'),
(1264, 233, 1, 20, 0, '2022-05-30 15:56:33', '2022-05-30 18:56:33'),
(1265, 233, 3, 20, 0, '2022-05-15 12:52:48', '2022-05-15 12:52:48'),
(1266, 233, 4, 20, 2, '2022-05-15 12:52:48', '2022-05-15 12:52:48'),
(1277, 266, 24, 6, 4, '2022-06-03 16:43:09', '2022-06-03 19:43:09'),
(1278, 266, 24, 21, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1279, 266, 24, 33, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1280, 266, 24, 36, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1281, 266, 24, 61, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1282, 266, 25, 6, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1283, 266, 25, 21, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1284, 266, 25, 33, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1285, 266, 25, 36, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1286, 266, 25, 61, 4, '2022-08-22 09:27:25', '2022-08-22 12:27:25'),
(1287, 266, 26, 6, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1288, 266, 26, 21, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1289, 266, 26, 33, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1290, 266, 26, 36, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1291, 266, 26, 61, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1292, 266, 27, 6, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1293, 266, 27, 21, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1294, 266, 27, 33, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1295, 266, 27, 36, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1296, 266, 27, 61, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1297, 266, 28, 6, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1298, 266, 28, 21, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1299, 266, 28, 33, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1300, 266, 28, 36, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1301, 266, 28, 61, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1302, 266, 29, 6, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1303, 266, 29, 21, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1304, 266, 29, 33, 5, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(1305, 266, 29, 36, 5, '2022-05-16 12:21:56', '2022-05-16 12:21:56'),
(1306, 266, 29, 61, 5, '2022-05-16 12:21:56', '2022-05-16 12:21:56'),
(1307, 267, 24, 5, 9, '2022-05-16 09:46:26', '2022-05-16 12:46:26'),
(1308, 267, 24, 6, 10, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(1309, 267, 24, 14, 10, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(1310, 267, 24, 18, 10, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(1311, 267, 24, 32, 10, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(1312, 267, 28, 5, 10, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(1313, 267, 28, 6, 10, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(1314, 267, 28, 14, 10, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(1315, 267, 28, 18, 10, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(1316, 267, 28, 32, 10, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(1317, 268, 24, 5, 19, '2022-06-03 16:37:53', '2022-06-03 19:37:53'),
(1318, 268, 24, 6, 20, '2022-05-16 13:34:12', '2022-05-16 13:34:12'),
(1319, 268, 24, 36, 20, '2022-05-16 13:34:13', '2022-05-16 13:34:13'),
(1320, 268, 29, 5, 20, '2022-05-16 13:34:13', '2022-05-16 13:34:13'),
(1321, 268, 29, 6, 20, '2022-05-16 13:34:13', '2022-05-16 13:34:13'),
(1322, 268, 29, 36, 20, '2022-05-16 13:34:13', '2022-05-16 13:34:13'),
(1323, 264, 23, 5, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1324, 264, 23, 6, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1325, 264, 23, 18, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1326, 264, 23, 21, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1327, 264, 23, 36, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1328, 264, 24, 5, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1329, 264, 24, 6, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1330, 264, 24, 18, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1331, 264, 24, 21, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1332, 264, 24, 36, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1333, 264, 25, 5, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1334, 264, 25, 6, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1335, 264, 25, 18, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1336, 264, 25, 21, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1337, 264, 25, 36, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1338, 264, 26, 5, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1339, 264, 26, 6, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1340, 264, 26, 18, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1341, 264, 26, 21, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1342, 264, 26, 36, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1343, 264, 27, 5, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1344, 264, 27, 6, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1345, 264, 27, 18, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1346, 264, 27, 21, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1347, 264, 27, 36, 5, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(1364, 234, 1, 6, 1, '2022-05-16 14:46:00', '2022-05-16 14:46:00'),
(1365, 234, 3, 6, 0, '2022-06-04 19:41:51', '2022-06-04 22:41:51'),
(1366, 234, 4, 6, 1, '2022-05-16 14:46:00', '2022-05-16 14:46:00'),
(1367, 234, 12, 6, 1, '2022-05-16 14:46:00', '2022-05-16 14:46:00'),
(1368, 234, 13, 6, 1, '2022-05-16 14:46:00', '2022-05-16 14:46:00'),
(1369, 212, 1, 32, 1, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(1370, 212, 1, 33, 1, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(1371, 212, 3, 32, 2, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(1372, 212, 3, 33, 2, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(1373, 212, 4, 32, 1, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(1374, 212, 4, 33, 1, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(1375, 212, 12, 32, 1, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(1376, 212, 12, 33, 1, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(1463, 221, 51, 7, 2, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(1464, 221, 52, 7, 2, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(1465, 221, 53, 7, 2, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(1466, 221, 54, 7, 2, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(1467, 221, 55, 7, 2, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(1468, 221, 56, 7, 2, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(1513, 269, 1, 17, 5, '2022-05-21 12:38:49', '2022-05-21 12:38:49'),
(1514, 269, 1, 19, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1515, 269, 1, 32, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1516, 269, 1, 33, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1517, 269, 3, 17, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1518, 269, 3, 19, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1519, 269, 3, 32, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1520, 269, 3, 33, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1521, 269, 4, 17, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1522, 269, 4, 19, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1523, 269, 4, 32, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1524, 269, 4, 33, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1525, 269, 12, 17, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1526, 269, 12, 19, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1527, 269, 12, 32, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1528, 269, 12, 33, 5, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(1531, 286, 24, 6, 10, '2022-05-21 13:35:04', '2022-05-21 13:35:04'),
(1532, 286, 24, 21, 10, '2022-05-21 13:35:04', '2022-05-21 13:35:04'),
(1533, 286, 24, 32, 10, '2022-05-21 13:35:05', '2022-05-21 13:35:05'),
(1534, 286, 28, 6, 10, '2022-05-21 13:35:05', '2022-05-21 13:35:05'),
(1535, 286, 28, 21, 10, '2022-05-21 13:35:05', '2022-05-21 13:35:05'),
(1536, 286, 28, 32, 10, '2022-05-21 13:35:05', '2022-05-21 13:35:05'),
(1537, 287, 16, 6, 20, '2022-05-21 13:42:47', '2022-05-21 13:42:47'),
(1538, 287, 16, 32, 20, '2022-05-21 13:42:47', '2022-05-21 13:42:47'),
(1551, 288, 24, 7, 10, '2022-05-21 16:29:28', '2022-05-21 16:29:28'),
(1552, 288, 24, 17, 10, '2022-05-21 16:29:28', '2022-05-21 16:29:28'),
(1553, 288, 24, 61, 10, '2022-05-21 16:29:28', '2022-05-21 16:29:28'),
(1554, 288, 28, 7, 10, '2022-05-21 16:29:28', '2022-05-21 16:29:28'),
(1555, 288, 28, 17, 10, '2022-05-21 16:29:28', '2022-05-21 16:29:28'),
(1556, 288, 28, 61, 10, '2022-05-21 16:29:28', '2022-05-21 16:29:28'),
(1581, 289, 1, 5, 5, '2022-05-22 12:33:51', '2022-05-22 12:33:51'),
(1582, 289, 1, 6, 5, '2022-05-22 12:33:51', '2022-05-22 12:33:51'),
(1583, 289, 1, 19, 5, '2022-05-22 12:33:51', '2022-05-22 12:33:51'),
(1584, 289, 1, 35, 5, '2022-05-22 12:33:51', '2022-05-22 12:33:51'),
(1585, 289, 3, 5, 5, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(1586, 289, 3, 6, 5, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(1587, 289, 3, 19, 5, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(1588, 289, 3, 35, 5, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(1589, 289, 4, 5, 5, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(1590, 289, 4, 6, 5, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(1591, 289, 4, 19, 5, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(1592, 289, 4, 35, 5, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(1593, 290, 23, 5, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1594, 290, 23, 6, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1595, 290, 23, 7, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1596, 290, 23, 14, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1597, 290, 23, 21, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1598, 290, 23, 39, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1599, 290, 26, 5, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1600, 290, 26, 6, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1601, 290, 26, 7, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1602, 290, 26, 14, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1603, 290, 26, 21, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1604, 290, 26, 39, 5, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(1605, 291, 23, 5, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1606, 291, 23, 6, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1607, 291, 23, 32, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1608, 291, 24, 5, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1609, 291, 24, 6, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1610, 291, 24, 32, 9, '2022-08-17 11:40:09', '2022-08-17 14:40:09'),
(1611, 291, 25, 5, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1612, 291, 25, 6, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1613, 291, 25, 32, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1614, 291, 26, 5, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1615, 291, 26, 6, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1616, 291, 26, 32, 10, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(1644, 227, 1, 20, 2, '2022-05-22 23:27:58', '2022-05-22 23:27:58'),
(1645, 227, 3, 20, 2, '2022-05-22 23:27:58', '2022-05-22 23:27:58'),
(1646, 227, 4, 20, 2, '2022-05-22 23:27:58', '2022-05-22 23:27:58'),
(1647, 258, 16, 5, 5, '2022-05-22 23:30:52', '2022-05-22 23:30:52'),
(1651, 245, 1, 39, 1, '2022-05-22 23:37:25', '2022-05-22 23:37:25'),
(1652, 245, 3, 39, 2, '2022-05-22 23:37:25', '2022-05-22 23:37:25'),
(1653, 245, 4, 39, 2, '2022-05-22 23:37:25', '2022-05-22 23:37:25'),
(1657, 292, 1, 35, 2, '2022-05-23 11:56:23', '2022-05-23 11:56:23'),
(1658, 292, 3, 35, 2, '2022-05-23 11:56:23', '2022-05-23 11:56:23'),
(1659, 292, 4, 35, 2, '2022-05-23 11:56:23', '2022-05-23 11:56:23'),
(1660, 293, 1, 18, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1661, 293, 1, 36, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1662, 293, 1, 37, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1663, 293, 3, 18, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1664, 293, 3, 36, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1665, 293, 3, 37, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1666, 293, 4, 18, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1667, 293, 4, 36, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1668, 293, 4, 37, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1669, 293, 12, 18, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1670, 293, 12, 36, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1671, 293, 12, 37, 5, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(1672, 294, 1, 6, 5, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(1673, 294, 1, 19, 5, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(1674, 294, 1, 35, 5, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(1675, 294, 3, 5, 5, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(1676, 294, 3, 19, 5, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(1677, 294, 3, 35, 5, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(1678, 294, 4, 6, 5, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(1679, 294, 4, 19, 5, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(1680, 294, 4, 35, 5, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(1681, 295, 1, 6, 5, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(1682, 295, 1, 18, 5, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(1683, 295, 1, 32, 5, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(1684, 295, 3, 6, 5, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(1685, 295, 3, 18, 5, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(1686, 295, 3, 32, 5, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(1687, 295, 4, 6, 5, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(1688, 295, 4, 18, 5, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(1689, 295, 4, 32, 5, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(1690, 296, 24, 5, 5, '2022-05-24 14:07:06', '2022-05-24 14:07:06'),
(1691, 296, 24, 6, 5, '2022-05-24 14:07:06', '2022-05-24 14:07:06'),
(1692, 296, 24, 7, 5, '2022-05-24 14:07:06', '2022-05-24 14:07:06'),
(1693, 296, 24, 14, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1694, 296, 24, 19, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1695, 296, 24, 36, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1696, 296, 25, 5, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1697, 296, 25, 6, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1698, 296, 25, 7, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1699, 296, 25, 14, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1700, 296, 25, 19, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1701, 296, 25, 36, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1702, 296, 26, 5, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1703, 296, 26, 6, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1704, 296, 26, 7, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1705, 296, 26, 14, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1706, 296, 26, 19, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1707, 296, 26, 36, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1708, 296, 27, 5, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1709, 296, 27, 6, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1710, 296, 27, 7, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1711, 296, 27, 14, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1712, 296, 27, 19, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1713, 296, 27, 36, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1714, 296, 28, 5, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1715, 296, 28, 6, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1716, 296, 28, 7, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1717, 296, 28, 14, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1718, 296, 28, 19, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1719, 296, 28, 36, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1720, 296, 29, 5, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1721, 296, 29, 6, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1722, 296, 29, 7, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1723, 296, 29, 14, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1724, 296, 29, 19, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1725, 296, 29, 36, 5, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(1726, 297, 24, 6, 3, '2022-06-25 09:59:08', '2022-06-25 12:59:08'),
(1727, 297, 24, 14, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1728, 297, 24, 18, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1729, 297, 24, 19, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1730, 297, 24, 61, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1731, 297, 25, 6, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1732, 297, 25, 14, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1733, 297, 25, 18, 0, '2022-07-19 20:07:22', '2022-07-19 23:07:22'),
(1734, 297, 25, 19, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1735, 297, 25, 61, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1736, 297, 26, 6, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1737, 297, 26, 14, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1738, 297, 26, 18, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1739, 297, 26, 19, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1740, 297, 26, 61, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1741, 297, 27, 6, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1742, 297, 27, 14, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1743, 297, 27, 18, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1744, 297, 27, 19, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1745, 297, 27, 61, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1746, 297, 28, 6, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1747, 297, 28, 14, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1748, 297, 28, 18, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1749, 297, 28, 19, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1750, 297, 28, 61, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1751, 297, 29, 6, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1752, 297, 29, 14, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1753, 297, 29, 18, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1754, 297, 29, 19, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1755, 297, 29, 61, 5, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(1756, 213, 1, 37, 1, '2022-05-24 20:34:18', '2022-05-24 20:34:18'),
(1757, 213, 3, 37, 1, '2022-05-30 17:39:22', '2022-05-30 20:39:22'),
(1758, 213, 4, 37, 2, '2022-05-24 20:34:18', '2022-05-24 20:34:18'),
(1759, 299, 24, 6, 5, '2022-05-28 12:26:15', '2022-05-28 12:26:15'),
(1760, 299, 24, 7, 5, '2022-05-28 12:26:15', '2022-05-28 12:26:15'),
(1761, 299, 24, 14, 5, '2022-05-28 12:26:15', '2022-05-28 12:26:15'),
(1762, 299, 24, 18, 5, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(1763, 299, 24, 36, 5, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(1764, 299, 24, 49, 5, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(1765, 299, 29, 6, 5, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(1766, 299, 29, 7, 5, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(1767, 299, 29, 14, 5, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(1768, 299, 29, 18, 5, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(1769, 299, 29, 36, 5, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(1770, 299, 29, 49, 5, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(1771, 300, 1, 6, 5, '2022-05-28 12:30:49', '2022-05-28 12:30:49'),
(1772, 300, 1, 33, 5, '2022-05-28 12:30:49', '2022-05-28 12:30:49'),
(1773, 300, 1, 36, 5, '2022-05-28 12:30:49', '2022-05-28 12:30:49'),
(1774, 300, 3, 6, 5, '2022-05-28 12:30:49', '2022-05-28 12:30:49'),
(1775, 300, 3, 33, 5, '2022-05-28 12:30:49', '2022-05-28 12:30:49'),
(1776, 300, 3, 36, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1777, 300, 4, 6, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1778, 300, 4, 33, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1779, 300, 4, 36, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1780, 300, 12, 6, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1781, 300, 12, 33, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1782, 300, 12, 36, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1783, 300, 13, 6, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1784, 300, 13, 33, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1785, 300, 13, 36, 5, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(1833, 302, 1, 5, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1834, 302, 1, 7, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1835, 302, 1, 14, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1836, 302, 1, 35, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1837, 302, 1, 36, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1838, 302, 1, 37, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1839, 302, 3, 5, 4, '2022-12-16 16:42:00', '2022-12-16 19:42:00'),
(1840, 302, 3, 7, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1841, 302, 3, 14, 0, '2022-08-14 21:06:29', '2022-08-15 00:06:29'),
(1842, 302, 3, 35, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1843, 302, 3, 36, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1844, 302, 3, 37, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1845, 302, 4, 5, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1846, 302, 4, 7, 5, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(1847, 302, 4, 14, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1848, 302, 4, 35, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1849, 302, 4, 36, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1850, 302, 4, 37, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1851, 302, 12, 5, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1852, 302, 12, 7, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1853, 302, 12, 14, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1854, 302, 12, 35, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1855, 302, 12, 36, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1856, 302, 12, 37, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1857, 302, 13, 5, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1858, 302, 13, 7, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1859, 302, 13, 14, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1860, 302, 13, 35, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1861, 302, 13, 36, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1862, 302, 13, 37, 5, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(1863, 303, 1, 20, 9, '2022-06-06 11:33:57', '2022-06-06 14:33:57'),
(1864, 303, 3, 20, 10, '2022-05-28 20:41:54', '2022-05-28 20:41:54'),
(1865, 303, 4, 20, 10, '2022-05-28 20:41:54', '2022-05-28 20:41:54'),
(1866, 303, 12, 20, 10, '2022-05-28 20:41:54', '2022-05-28 20:41:54'),
(1867, 303, 13, 20, 10, '2022-05-28 20:41:54', '2022-05-28 20:41:54'),
(1885, 301, 1, 6, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1886, 301, 1, 21, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1887, 301, 1, 33, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1888, 301, 1, 39, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1889, 301, 3, 6, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1890, 301, 3, 32, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1891, 301, 3, 33, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1892, 301, 3, 39, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1893, 301, 3, 61, 0, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1894, 301, 4, 6, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1895, 301, 4, 32, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1896, 301, 4, 33, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1897, 301, 4, 39, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1898, 301, 12, 6, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1899, 301, 12, 32, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1900, 301, 12, 33, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1901, 301, 12, 39, 5, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(1917, 307, 24, 18, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1918, 307, 24, 19, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1919, 307, 24, 21, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1920, 307, 24, 32, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1921, 307, 25, 18, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1922, 307, 25, 19, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1923, 307, 25, 21, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1924, 307, 25, 32, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1925, 307, 26, 18, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1926, 307, 26, 19, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1927, 307, 26, 21, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1928, 307, 26, 32, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1929, 307, 27, 18, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1930, 307, 27, 19, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1931, 307, 27, 21, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1932, 307, 27, 32, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1933, 307, 28, 18, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1934, 307, 28, 19, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1935, 307, 28, 21, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1936, 307, 28, 32, 5, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(1949, 204, 24, 6, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1950, 204, 24, 37, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1951, 204, 25, 6, 0, '2022-08-20 12:31:25', '2022-08-20 15:31:25'),
(1952, 204, 25, 37, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1953, 204, 26, 6, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1954, 204, 26, 37, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1955, 204, 27, 6, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1956, 204, 27, 37, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1957, 204, 28, 6, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1958, 204, 28, 37, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1959, 204, 29, 6, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1960, 204, 29, 37, 1, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(1971, 240, 24, 49, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1972, 240, 25, 17, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1973, 240, 25, 49, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1974, 240, 26, 17, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1975, 240, 26, 49, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1976, 240, 27, 17, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1977, 240, 27, 49, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1978, 240, 28, 17, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1979, 240, 28, 49, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1980, 240, 29, 17, 1, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(1994, 210, 24, 5, 1, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(1995, 210, 24, 6, 1, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(1996, 210, 25, 5, 2, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(1997, 210, 25, 6, 1, '2022-07-20 08:01:45', '2022-07-20 11:01:45'),
(1998, 210, 26, 5, 1, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(1999, 210, 26, 6, 1, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(2000, 210, 27, 5, 1, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(2001, 210, 27, 6, 1, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(2002, 210, 28, 5, 1, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(2003, 210, 28, 6, 1, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(2065, 244, 24, 6, 1, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(2066, 244, 25, 6, 1, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(2067, 244, 25, 49, 0, '2022-07-04 20:54:46', '2022-07-04 23:54:46'),
(2068, 244, 26, 6, 1, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(2069, 244, 27, 6, 1, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(2070, 244, 27, 49, 1, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(2071, 244, 28, 6, 1, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(2072, 244, 28, 49, 1, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(2073, 244, 29, 49, 1, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(2092, 241, 3, 32, 1, '2022-06-27 13:06:04', '2022-06-27 13:06:04'),
(2093, 241, 4, 32, 0, '2022-07-23 22:56:41', '2022-07-24 01:56:41'),
(2094, 241, 12, 32, 1, '2022-06-27 13:06:04', '2022-06-27 13:06:04'),
(2107, 316, 1, 32, 2, '2022-06-27 13:38:48', '2022-06-27 13:38:48'),
(2108, 316, 3, 32, 2, '2022-06-27 13:38:48', '2022-06-27 13:38:48'),
(2109, 316, 4, 32, 2, '2022-06-27 13:38:48', '2022-06-27 13:38:48'),
(2110, 251, 3, 6, 0, '2022-06-27 16:18:24', '2022-06-27 16:18:24'),
(2111, 251, 4, 6, 0, '2022-06-27 16:18:24', '2022-06-27 16:18:24'),
(2112, 251, 12, 6, 1, '2022-08-14 21:05:07', '2022-08-15 00:05:07'),
(2113, 261, 1, 32, 1, '2022-06-27 16:19:18', '2022-06-27 16:19:18'),
(2114, 261, 3, 32, 1, '2022-06-27 16:19:18', '2022-06-27 16:19:18'),
(2115, 261, 4, 32, 2, '2022-06-27 16:19:18', '2022-06-27 16:19:18'),
(2116, 261, 12, 32, 2, '2022-06-27 16:19:18', '2022-06-27 16:19:18'),
(2117, 224, 25, 61, 1, '2022-06-27 16:22:39', '2022-06-27 16:22:39'),
(2118, 224, 26, 61, 1, '2022-06-27 16:22:39', '2022-06-27 16:22:39'),
(2119, 224, 27, 61, 1, '2022-06-27 16:22:39', '2022-06-27 16:22:39'),
(2120, 224, 28, 61, 1, '2022-06-27 16:22:39', '2022-06-27 16:22:39'),
(2164, 320, 46, 7, 1, '2022-07-05 14:08:26', '2022-07-05 14:08:26'),
(2165, 319, 51, 37, 1, '2022-07-05 14:08:50', '2022-07-05 14:08:50'),
(2166, 318, 1, 17, 100, '2022-07-05 14:09:14', '2022-07-05 14:09:14'),
(2167, 317, 46, 5, 1, '2022-07-05 14:09:39', '2022-07-05 14:09:39'),
(2168, 317, 59, 5, 1, '2022-07-05 14:09:39', '2022-07-05 14:09:39'),
(2169, 339, 1, 6, 5, '2022-07-05 16:31:34', '2022-07-05 16:31:34'),
(2170, 339, 3, 14, 5, '2022-07-05 16:31:34', '2022-07-05 16:31:34'),
(2171, 306, 1, 14, 8, '2022-07-06 19:45:01', '2022-07-06 22:45:01'),
(2221, 314, 42, 5, 10, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(2222, 314, 43, 5, 10, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(2223, 314, 44, 5, 10, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(2224, 314, 45, 5, 10, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(2225, 314, 46, 5, 10, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(2226, 314, 51, 5, 10, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(2227, 314, 52, 5, 10, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(2228, 314, 53, 5, 10, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(2229, 314, 54, 5, 10, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(2230, 314, 55, 5, 10, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(2231, 314, 56, 5, 10, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(2232, 314, 57, 5, 10, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(2233, 312, 42, 5, 10, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(2234, 312, 43, 5, 10, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(2235, 312, 44, 5, 10, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(2236, 312, 45, 5, 10, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(2237, 312, 46, 5, 10, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(2238, 312, 51, 5, 10, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(2239, 312, 52, 5, 10, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(2240, 312, 53, 5, 10, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(2241, 312, 54, 5, 10, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(2242, 312, 55, 5, 10, '2022-08-27 18:35:51', '2022-08-27 18:35:51'),
(2243, 312, 56, 5, 10, '2022-08-27 18:35:51', '2022-08-27 18:35:51'),
(2244, 312, 57, 5, 10, '2022-08-27 18:35:51', '2022-08-27 18:35:51'),
(2245, 308, 42, 32, 10, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(2246, 308, 43, 32, 10, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(2247, 308, 44, 32, 10, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(2248, 308, 45, 32, 10, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(2249, 308, 46, 32, 10, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(2250, 308, 51, 32, 10, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(2251, 308, 52, 32, 10, '2022-08-27 18:36:42', '2022-08-27 18:36:42'),
(2252, 308, 53, 32, 10, '2022-08-27 18:36:42', '2022-08-27 18:36:42'),
(2253, 310, 42, 7, 10, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(2254, 310, 43, 7, 10, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(2255, 310, 44, 7, 10, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(2256, 310, 45, 7, 10, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(2257, 310, 46, 7, 10, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(2258, 310, 51, 7, 10, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(2259, 310, 52, 7, 10, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(2260, 310, 53, 7, 10, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(2261, 310, 54, 7, 10, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(2262, 311, 53, 7, 10, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(2263, 311, 54, 7, 10, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(2264, 311, 55, 7, 10, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(2265, 311, 56, 7, 10, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(2266, 311, 57, 7, 10, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(2267, 311, 58, 7, 10, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(2268, 311, 59, 7, 10, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(2269, 311, 60, 7, 10, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(2270, 276, 51, 14, 10, '2022-08-27 18:39:00', '2022-08-27 18:39:00'),
(2271, 277, 51, 19, 10, '2022-08-27 18:39:26', '2022-08-27 18:39:26'),
(2272, 280, 53, 18, 10, '2022-08-27 18:39:48', '2022-08-27 18:39:48'),
(2273, 281, 53, 18, 10, '2022-08-27 18:40:12', '2022-08-27 18:40:12'),
(2274, 282, 55, 18, 9, '2022-08-27 18:41:20', '2022-08-27 18:41:20'),
(2275, 283, 51, 5, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2276, 283, 51, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2277, 283, 51, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2278, 283, 52, 5, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2279, 283, 52, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2280, 283, 52, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2281, 283, 53, 5, 9, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2282, 283, 53, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2283, 283, 53, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2284, 283, 54, 5, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2285, 283, 54, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2286, 283, 54, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2287, 283, 55, 5, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2288, 283, 55, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2289, 283, 55, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2290, 283, 56, 5, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2291, 283, 56, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2292, 283, 56, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2293, 283, 57, 5, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2294, 283, 57, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2295, 283, 57, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2296, 283, 58, 5, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2297, 283, 58, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2298, 283, 58, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2299, 283, 59, 5, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2300, 283, 59, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2301, 283, 59, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2302, 283, 60, 5, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2303, 283, 60, 18, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2304, 283, 60, 33, 10, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(2330, 284, 53, 5, 8, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2331, 284, 53, 6, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2332, 284, 53, 7, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2333, 284, 53, 14, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2334, 284, 53, 18, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2335, 284, 54, 5, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2336, 284, 54, 6, 9, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2337, 284, 54, 7, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2338, 284, 54, 14, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2339, 284, 54, 18, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2340, 284, 56, 5, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2341, 284, 56, 6, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2342, 284, 56, 7, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2343, 284, 56, 14, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2344, 284, 56, 18, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2345, 284, 58, 5, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2346, 284, 58, 6, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2347, 284, 58, 7, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2348, 284, 58, 14, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2349, 284, 58, 18, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2350, 284, 60, 5, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2351, 284, 60, 6, 9, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2352, 284, 60, 7, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2353, 284, 60, 14, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2354, 284, 60, 18, 10, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(2355, 271, 43, 17, 7, '2022-08-27 18:44:14', '2022-08-27 18:44:14'),
(2356, 272, 43, 14, 10, '2022-08-27 18:45:15', '2022-08-27 18:45:15'),
(2357, 270, 51, 5, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2358, 270, 51, 14, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2359, 270, 52, 5, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2360, 270, 52, 14, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2361, 270, 53, 5, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2362, 270, 53, 14, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2363, 270, 54, 5, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2364, 270, 54, 14, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2365, 270, 55, 5, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2366, 270, 55, 14, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2367, 270, 56, 5, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2368, 270, 56, 14, 10, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(2369, 270, 57, 5, 10, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(2370, 270, 57, 14, 10, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(2371, 270, 58, 5, 10, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(2372, 270, 58, 14, 10, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(2373, 270, 59, 5, 10, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(2374, 270, 59, 14, 10, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(2375, 270, 60, 5, 10, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(2376, 270, 60, 14, 10, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(2377, 309, 42, 18, 10, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(2378, 309, 43, 18, 10, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(2379, 309, 44, 18, 10, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(2380, 309, 45, 18, 10, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(2381, 309, 46, 18, 10, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(2390, 220, 51, 32, 1, '2022-08-27 18:56:49', '2022-08-27 18:56:49'),
(2391, 220, 52, 32, 1, '2022-08-27 18:56:49', '2022-08-27 18:56:49'),
(2392, 220, 53, 32, 1, '2022-08-27 18:56:49', '2022-08-27 18:56:49'),
(2393, 220, 54, 32, 1, '2022-08-27 18:56:49', '2022-08-27 18:56:49'),
(2394, 220, 55, 32, 1, '2022-08-27 18:56:50', '2022-08-27 18:56:50'),
(2395, 220, 60, 32, 1, '2022-08-27 18:56:50', '2022-08-27 18:56:50'),
(2396, 223, 51, 32, 0, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(2397, 223, 52, 32, 0, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(2398, 223, 53, 32, 0, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(2399, 223, 54, 32, 1, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(2400, 223, 55, 32, 1, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(2401, 223, 56, 32, 0, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(2402, 223, 58, 32, 1, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(2403, 223, 60, 32, 1, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(2414, 207, 42, 20, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(2415, 207, 42, 37, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(2416, 207, 43, 20, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(2417, 207, 43, 37, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(2418, 207, 44, 20, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(2419, 207, 44, 37, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(2420, 207, 45, 20, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(2421, 207, 45, 37, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(2422, 207, 46, 20, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(2423, 207, 46, 37, 1, '2022-08-27 19:11:56', '2022-08-27 19:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `prod_sizes`
--

CREATE TABLE `prod_sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `prod_sizes`
--

INSERT INTO `prod_sizes` (`id`, `product_id`, `size_id`, `created_at`, `updated_at`) VALUES
(180, 222, 1, '2022-04-18 11:52:26', '2022-04-18 11:52:26'),
(181, 237, 48, '2022-04-20 04:16:33', '2022-04-20 04:16:33'),
(343, 211, 24, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(344, 211, 25, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(345, 211, 26, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(346, 211, 27, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(347, 211, 28, '2022-04-21 09:28:56', '2022-04-21 09:28:56'),
(351, 242, 24, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(352, 242, 25, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(353, 242, 26, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(354, 242, 27, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(355, 242, 28, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(356, 242, 29, '2022-04-21 09:34:54', '2022-04-21 09:34:54'),
(365, 235, 1, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(366, 235, 3, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(367, 235, 4, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(368, 235, 12, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(369, 235, 13, '2022-04-21 09:41:27', '2022-04-21 09:41:27'),
(425, 219, 1, '2022-04-21 21:14:15', '2022-04-21 21:14:15'),
(426, 219, 3, '2022-04-21 21:14:15', '2022-04-21 21:14:15'),
(427, 219, 4, '2022-04-21 21:14:15', '2022-04-21 21:14:15'),
(428, 219, 12, '2022-04-21 21:14:15', '2022-04-21 21:14:15'),
(494, 232, 24, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(495, 232, 25, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(496, 232, 26, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(497, 232, 27, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(498, 232, 28, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(499, 232, 29, '2022-04-23 04:37:57', '2022-04-23 04:37:57'),
(500, 231, 24, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(501, 231, 25, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(502, 231, 26, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(503, 231, 27, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(504, 231, 28, '2022-04-23 04:39:24', '2022-04-23 04:39:24'),
(506, 229, 1, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(507, 229, 3, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(508, 229, 4, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(509, 229, 12, '2022-04-23 04:41:28', '2022-04-23 04:41:28'),
(510, 228, 24, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(511, 228, 25, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(512, 228, 26, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(513, 228, 27, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(514, 228, 28, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(515, 228, 41, '2022-04-23 04:43:58', '2022-04-23 04:43:58'),
(551, 225, 1, '2022-04-23 04:57:23', '2022-04-23 04:57:23'),
(552, 225, 3, '2022-04-23 04:57:23', '2022-04-23 04:57:23'),
(553, 225, 4, '2022-04-23 04:57:23', '2022-04-23 04:57:23'),
(622, 236, 24, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(623, 236, 25, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(624, 236, 26, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(625, 236, 41, '2022-04-27 07:05:23', '2022-04-27 07:05:23'),
(626, 226, 1, '2022-04-28 05:08:58', '2022-04-28 05:08:58'),
(627, 226, 3, '2022-04-28 05:08:58', '2022-04-28 05:08:58'),
(628, 226, 4, '2022-04-28 05:08:58', '2022-04-28 05:08:58'),
(653, 216, 1, '2022-05-04 13:39:22', '2022-05-04 13:39:22'),
(654, 216, 3, '2022-05-04 13:39:22', '2022-05-04 13:39:22'),
(655, 216, 4, '2022-05-04 13:39:22', '2022-05-04 13:39:22'),
(679, 260, 1, '2022-05-15 12:46:03', '2022-05-15 12:46:03'),
(680, 260, 3, '2022-05-15 12:46:03', '2022-05-15 12:46:03'),
(681, 260, 4, '2022-05-15 12:46:03', '2022-05-15 12:46:03'),
(682, 257, 1, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(683, 257, 3, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(684, 257, 4, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(685, 257, 12, '2022-05-15 12:48:16', '2022-05-15 12:48:16'),
(692, 243, 16, '2022-05-15 12:51:44', '2022-05-15 12:51:44'),
(693, 230, 16, '2022-05-15 12:52:14', '2022-05-15 12:52:14'),
(694, 233, 1, '2022-05-15 12:52:48', '2022-05-15 12:52:48'),
(695, 233, 3, '2022-05-15 12:52:48', '2022-05-15 12:52:48'),
(696, 233, 4, '2022-05-15 12:52:48', '2022-05-15 12:52:48'),
(702, 266, 24, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(703, 266, 25, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(704, 266, 26, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(705, 266, 27, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(706, 266, 28, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(707, 266, 29, '2022-05-16 12:21:55', '2022-05-16 12:21:55'),
(708, 267, 24, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(709, 267, 28, '2022-05-16 12:44:07', '2022-05-16 12:44:07'),
(710, 268, 24, '2022-05-16 13:34:12', '2022-05-16 13:34:12'),
(711, 268, 29, '2022-05-16 13:34:13', '2022-05-16 13:34:13'),
(712, 264, 23, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(713, 264, 24, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(714, 264, 25, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(715, 264, 26, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(716, 264, 27, '2022-05-16 13:35:23', '2022-05-16 13:35:23'),
(721, 234, 1, '2022-05-16 14:46:00', '2022-05-16 14:46:00'),
(722, 234, 3, '2022-05-16 14:46:00', '2022-05-16 14:46:00'),
(723, 234, 4, '2022-05-16 14:46:00', '2022-05-16 14:46:00'),
(724, 234, 12, '2022-05-16 14:46:00', '2022-05-16 14:46:00'),
(725, 234, 13, '2022-05-16 14:46:00', '2022-05-16 14:46:00'),
(726, 212, 1, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(727, 212, 3, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(728, 212, 4, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(729, 212, 12, '2022-05-16 14:46:51', '2022-05-16 14:46:51'),
(776, 221, 51, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(777, 221, 52, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(778, 221, 53, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(779, 221, 54, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(780, 221, 55, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(781, 221, 56, '2022-05-19 12:33:44', '2022-05-19 12:33:44'),
(794, 269, 1, '2022-05-21 12:38:49', '2022-05-21 12:38:49'),
(795, 269, 3, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(796, 269, 4, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(797, 269, 12, '2022-05-21 12:38:50', '2022-05-21 12:38:50'),
(800, 286, 24, '2022-05-21 13:35:04', '2022-05-21 13:35:04'),
(801, 286, 28, '2022-05-21 13:35:05', '2022-05-21 13:35:05'),
(802, 287, 16, '2022-05-21 13:42:47', '2022-05-21 13:42:47'),
(807, 288, 24, '2022-05-21 16:29:28', '2022-05-21 16:29:28'),
(808, 288, 28, '2022-05-21 16:29:28', '2022-05-21 16:29:28'),
(815, 289, 1, '2022-05-22 12:33:51', '2022-05-22 12:33:51'),
(816, 289, 3, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(817, 289, 4, '2022-05-22 12:33:52', '2022-05-22 12:33:52'),
(818, 290, 23, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(819, 290, 26, '2022-05-22 12:41:06', '2022-05-22 12:41:06'),
(820, 291, 23, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(821, 291, 24, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(822, 291, 25, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(823, 291, 26, '2022-05-22 15:17:21', '2022-05-22 15:17:21'),
(839, 227, 1, '2022-05-22 23:27:58', '2022-05-22 23:27:58'),
(840, 227, 3, '2022-05-22 23:27:58', '2022-05-22 23:27:58'),
(841, 227, 4, '2022-05-22 23:27:58', '2022-05-22 23:27:58'),
(842, 258, 16, '2022-05-22 23:30:52', '2022-05-22 23:30:52'),
(846, 245, 1, '2022-05-22 23:37:25', '2022-05-22 23:37:25'),
(847, 245, 3, '2022-05-22 23:37:25', '2022-05-22 23:37:25'),
(848, 245, 4, '2022-05-22 23:37:25', '2022-05-22 23:37:25'),
(852, 292, 1, '2022-05-23 11:56:23', '2022-05-23 11:56:23'),
(853, 292, 3, '2022-05-23 11:56:23', '2022-05-23 11:56:23'),
(854, 292, 4, '2022-05-23 11:56:23', '2022-05-23 11:56:23'),
(855, 293, 1, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(856, 293, 3, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(857, 293, 4, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(858, 293, 12, '2022-05-23 12:22:56', '2022-05-23 12:22:56'),
(859, 294, 1, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(860, 294, 3, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(861, 294, 4, '2022-05-23 12:54:09', '2022-05-23 12:54:09'),
(862, 295, 1, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(863, 295, 3, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(864, 295, 4, '2022-05-23 13:58:03', '2022-05-23 13:58:03'),
(865, 296, 24, '2022-05-24 14:07:06', '2022-05-24 14:07:06'),
(866, 296, 25, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(867, 296, 26, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(868, 296, 27, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(869, 296, 28, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(870, 296, 29, '2022-05-24 14:07:07', '2022-05-24 14:07:07'),
(871, 297, 24, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(872, 297, 25, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(873, 297, 26, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(874, 297, 27, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(875, 297, 28, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(876, 297, 29, '2022-05-24 14:23:03', '2022-05-24 14:23:03'),
(877, 213, 1, '2022-05-24 20:34:18', '2022-05-24 20:34:18'),
(878, 213, 3, '2022-05-24 20:34:18', '2022-05-24 20:34:18'),
(879, 213, 4, '2022-05-24 20:34:18', '2022-05-24 20:34:18'),
(880, 299, 24, '2022-05-28 12:26:15', '2022-05-28 12:26:15'),
(881, 299, 29, '2022-05-28 12:26:16', '2022-05-28 12:26:16'),
(882, 300, 1, '2022-05-28 12:30:49', '2022-05-28 12:30:49'),
(883, 300, 3, '2022-05-28 12:30:49', '2022-05-28 12:30:49'),
(884, 300, 4, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(885, 300, 12, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(886, 300, 13, '2022-05-28 12:30:50', '2022-05-28 12:30:50'),
(896, 302, 1, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(897, 302, 3, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(898, 302, 4, '2022-05-28 13:37:46', '2022-05-28 13:37:46'),
(899, 302, 12, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(900, 302, 13, '2022-05-28 13:37:47', '2022-05-28 13:37:47'),
(901, 303, 1, '2022-05-28 20:41:54', '2022-05-28 20:41:54'),
(902, 303, 3, '2022-05-28 20:41:54', '2022-05-28 20:41:54'),
(903, 303, 4, '2022-05-28 20:41:54', '2022-05-28 20:41:54'),
(904, 303, 12, '2022-05-28 20:41:54', '2022-05-28 20:41:54'),
(905, 303, 13, '2022-05-28 20:41:54', '2022-05-28 20:41:54'),
(910, 301, 1, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(911, 301, 3, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(912, 301, 4, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(913, 301, 12, '2022-05-28 21:14:40', '2022-05-28 21:14:40'),
(920, 307, 24, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(921, 307, 25, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(922, 307, 26, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(923, 307, 27, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(924, 307, 28, '2022-06-13 19:29:24', '2022-06-13 19:29:24'),
(931, 204, 24, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(932, 204, 25, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(933, 204, 26, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(934, 204, 27, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(935, 204, 28, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(936, 204, 29, '2022-06-18 15:25:51', '2022-06-18 15:25:51'),
(943, 240, 24, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(944, 240, 25, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(945, 240, 26, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(946, 240, 27, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(947, 240, 28, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(948, 240, 29, '2022-06-22 19:57:36', '2022-06-22 19:57:36'),
(959, 210, 24, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(960, 210, 25, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(961, 210, 26, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(962, 210, 27, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(963, 210, 28, '2022-06-25 13:58:58', '2022-06-25 13:58:58'),
(1025, 244, 24, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(1026, 244, 25, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(1027, 244, 26, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(1028, 244, 27, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(1029, 244, 28, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(1030, 244, 29, '2022-06-25 15:50:24', '2022-06-25 15:50:24'),
(1049, 241, 3, '2022-06-27 13:06:04', '2022-06-27 13:06:04'),
(1050, 241, 4, '2022-06-27 13:06:04', '2022-06-27 13:06:04'),
(1051, 241, 12, '2022-06-27 13:06:04', '2022-06-27 13:06:04'),
(1064, 316, 1, '2022-06-27 13:38:48', '2022-06-27 13:38:48'),
(1065, 316, 3, '2022-06-27 13:38:48', '2022-06-27 13:38:48'),
(1066, 316, 4, '2022-06-27 13:38:48', '2022-06-27 13:38:48'),
(1067, 251, 3, '2022-06-27 16:18:24', '2022-06-27 16:18:24'),
(1068, 251, 4, '2022-06-27 16:18:24', '2022-06-27 16:18:24'),
(1069, 251, 12, '2022-06-27 16:18:24', '2022-06-27 16:18:24'),
(1070, 261, 1, '2022-06-27 16:19:18', '2022-06-27 16:19:18'),
(1071, 261, 3, '2022-06-27 16:19:18', '2022-06-27 16:19:18'),
(1072, 261, 4, '2022-06-27 16:19:18', '2022-06-27 16:19:18'),
(1073, 261, 12, '2022-06-27 16:19:18', '2022-06-27 16:19:18'),
(1074, 224, 25, '2022-06-27 16:22:39', '2022-06-27 16:22:39'),
(1075, 224, 26, '2022-06-27 16:22:39', '2022-06-27 16:22:39'),
(1076, 224, 27, '2022-06-27 16:22:39', '2022-06-27 16:22:39'),
(1077, 224, 28, '2022-06-27 16:22:39', '2022-06-27 16:22:39'),
(1121, 320, 46, '2022-07-05 14:08:26', '2022-07-05 14:08:26'),
(1122, 319, 51, '2022-07-05 14:08:50', '2022-07-05 14:08:50'),
(1123, 318, 1, '2022-07-05 14:09:14', '2022-07-05 14:09:14'),
(1124, 317, 46, '2022-07-05 14:09:39', '2022-07-05 14:09:39'),
(1125, 317, 59, '2022-07-05 14:09:39', '2022-07-05 14:09:39'),
(1126, 339, 1, '2022-07-05 16:31:34', '2022-07-05 16:31:34'),
(1127, 339, 3, '2022-07-05 16:31:34', '2022-07-05 16:31:34'),
(1128, 306, 1, '2022-07-06 22:40:03', '2022-07-06 22:40:03'),
(1156, 314, 42, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(1157, 314, 43, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(1158, 314, 44, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(1159, 314, 45, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(1160, 314, 46, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(1161, 314, 51, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(1162, 314, 52, '2022-08-27 18:34:59', '2022-08-27 18:34:59'),
(1163, 314, 53, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(1164, 314, 54, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(1165, 314, 55, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(1166, 314, 56, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(1167, 314, 57, '2022-08-27 18:35:00', '2022-08-27 18:35:00'),
(1168, 312, 42, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(1169, 312, 43, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(1170, 312, 44, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(1171, 312, 45, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(1172, 312, 46, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(1173, 312, 51, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(1174, 312, 52, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(1175, 312, 53, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(1176, 312, 54, '2022-08-27 18:35:50', '2022-08-27 18:35:50'),
(1177, 312, 55, '2022-08-27 18:35:51', '2022-08-27 18:35:51'),
(1178, 312, 56, '2022-08-27 18:35:51', '2022-08-27 18:35:51'),
(1179, 312, 57, '2022-08-27 18:35:51', '2022-08-27 18:35:51'),
(1180, 308, 42, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(1181, 308, 43, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(1182, 308, 44, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(1183, 308, 45, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(1184, 308, 46, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(1185, 308, 51, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(1186, 308, 52, '2022-08-27 18:36:41', '2022-08-27 18:36:41'),
(1187, 308, 53, '2022-08-27 18:36:42', '2022-08-27 18:36:42'),
(1188, 310, 42, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(1189, 310, 43, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(1190, 310, 44, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(1191, 310, 45, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(1192, 310, 46, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(1193, 310, 51, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(1194, 310, 52, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(1195, 310, 53, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(1196, 310, 54, '2022-08-27 18:37:41', '2022-08-27 18:37:41'),
(1197, 311, 53, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(1198, 311, 54, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(1199, 311, 55, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(1200, 311, 56, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(1201, 311, 57, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(1202, 311, 58, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(1203, 311, 59, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(1204, 311, 60, '2022-08-27 18:38:05', '2022-08-27 18:38:05'),
(1205, 276, 51, '2022-08-27 18:39:00', '2022-08-27 18:39:00'),
(1206, 277, 51, '2022-08-27 18:39:26', '2022-08-27 18:39:26'),
(1207, 280, 53, '2022-08-27 18:39:48', '2022-08-27 18:39:48'),
(1208, 281, 53, '2022-08-27 18:40:12', '2022-08-27 18:40:12'),
(1209, 282, 55, '2022-08-27 18:41:20', '2022-08-27 18:41:20'),
(1210, 283, 51, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1211, 283, 52, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1212, 283, 53, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1213, 283, 54, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1214, 283, 55, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1215, 283, 56, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1216, 283, 57, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1217, 283, 58, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1218, 283, 59, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1219, 283, 60, '2022-08-27 18:41:49', '2022-08-27 18:41:49'),
(1225, 284, 53, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(1226, 284, 54, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(1227, 284, 56, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(1228, 284, 58, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(1229, 284, 60, '2022-08-27 18:42:55', '2022-08-27 18:42:55'),
(1230, 271, 43, '2022-08-27 18:44:13', '2022-08-27 18:44:13'),
(1231, 272, 43, '2022-08-27 18:45:15', '2022-08-27 18:45:15'),
(1232, 270, 51, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(1233, 270, 52, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(1234, 270, 53, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(1235, 270, 54, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(1236, 270, 55, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(1237, 270, 56, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(1238, 270, 57, '2022-08-27 18:45:49', '2022-08-27 18:45:49'),
(1239, 270, 58, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(1240, 270, 59, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(1241, 270, 60, '2022-08-27 18:45:50', '2022-08-27 18:45:50'),
(1242, 309, 42, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(1243, 309, 43, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(1244, 309, 44, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(1245, 309, 45, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(1246, 309, 46, '2022-08-27 18:49:42', '2022-08-27 18:49:42'),
(1255, 220, 51, '2022-08-27 18:56:49', '2022-08-27 18:56:49'),
(1256, 220, 52, '2022-08-27 18:56:49', '2022-08-27 18:56:49'),
(1257, 220, 53, '2022-08-27 18:56:49', '2022-08-27 18:56:49'),
(1258, 220, 54, '2022-08-27 18:56:49', '2022-08-27 18:56:49'),
(1259, 220, 55, '2022-08-27 18:56:50', '2022-08-27 18:56:50'),
(1260, 220, 60, '2022-08-27 18:56:50', '2022-08-27 18:56:50'),
(1261, 223, 51, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(1262, 223, 52, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(1263, 223, 53, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(1264, 223, 54, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(1265, 223, 55, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(1266, 223, 56, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(1267, 223, 58, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(1268, 223, 60, '2022-08-27 18:58:07', '2022-08-27 18:58:07'),
(1274, 207, 42, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(1275, 207, 43, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(1276, 207, 44, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(1277, 207, 45, '2022-08-27 19:11:56', '2022-08-27 19:11:56'),
(1278, 207, 46, '2022-08-27 19:11:56', '2022-08-27 19:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `rating`, `comment`, `status`, `created_at`, `updated_at`, `product_id`, `user_id`) VALUES
(166, 4, 'good', 1, '2022-04-17 09:38:42', '2022-04-17 12:15:20', 211, 203),
(167, 5, NULL, 0, '2022-06-14 13:01:16', '2022-06-14 13:01:16', 204, 203);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ادمن', 'التحكم في كل اجزاء الموقع', NULL, NULL, '2021-10-18 11:22:30'),
(2, 'منتجات', 'يتحكم في المنتجات', NULL, '2021-11-29 21:27:05', '2021-11-29 21:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(196, 1, 196, NULL, NULL),
(197, 1, 197, NULL, NULL),
(198, 1, 198, NULL, NULL),
(199, 1, 199, NULL, NULL),
(200, 1, 200, NULL, NULL),
(201, 1, 201, NULL, NULL),
(202, 1, 202, NULL, NULL),
(203, 1, 203, NULL, NULL),
(204, 1, 204, NULL, NULL),
(205, 1, 205, NULL, NULL),
(206, 1, 206, NULL, NULL),
(207, 1, 207, NULL, NULL),
(208, 1, 208, NULL, NULL),
(209, 1, 209, NULL, NULL),
(210, 1, 210, NULL, NULL),
(211, 1, 211, NULL, NULL),
(212, 1, 212, NULL, NULL),
(213, 1, 213, NULL, NULL),
(214, 1, 214, NULL, NULL),
(215, 1, 215, NULL, NULL),
(216, 1, 216, NULL, NULL),
(217, 1, 217, NULL, NULL),
(218, 1, 218, NULL, NULL),
(219, 1, 219, NULL, NULL),
(220, 1, 220, NULL, NULL),
(221, 1, 221, NULL, NULL),
(222, 1, 222, NULL, NULL),
(223, 1, 223, NULL, NULL),
(224, 1, 224, NULL, NULL),
(225, 1, 225, NULL, NULL),
(226, 1, 226, NULL, NULL),
(227, 1, 227, NULL, NULL),
(228, 1, 228, NULL, NULL),
(229, 1, 229, NULL, NULL),
(230, 1, 230, NULL, NULL),
(231, 1, 231, NULL, NULL),
(232, 1, 232, NULL, NULL),
(233, 1, 233, NULL, NULL),
(234, 1, 234, NULL, NULL),
(235, 1, 235, NULL, NULL),
(236, 1, 236, NULL, NULL),
(237, 1, 237, NULL, NULL),
(238, 1, 238, NULL, NULL),
(239, 1, 239, NULL, NULL),
(240, 1, 240, NULL, NULL),
(241, 1, 241, NULL, NULL),
(242, 1, 242, NULL, NULL),
(243, 1, 243, NULL, NULL),
(244, 1, 244, NULL, NULL),
(245, 1, 245, NULL, NULL),
(246, 1, 246, NULL, NULL),
(247, 1, 247, NULL, NULL),
(248, 1, 248, NULL, NULL),
(249, 1, 249, NULL, NULL),
(250, 1, 250, NULL, NULL),
(251, 1, 251, NULL, NULL),
(252, 1, 252, NULL, NULL),
(253, 1, 253, NULL, NULL),
(254, 1, 254, NULL, NULL),
(255, 1, 255, NULL, NULL),
(256, 1, 256, NULL, NULL),
(257, 1, 257, NULL, NULL),
(258, 1, 258, NULL, NULL),
(259, 1, 259, NULL, NULL),
(260, 1, 260, NULL, NULL),
(261, 1, 261, NULL, NULL),
(262, 1, 262, NULL, NULL),
(263, 1, 263, NULL, NULL),
(264, 1, 264, NULL, NULL),
(265, 1, 265, NULL, NULL),
(266, 1, 266, NULL, NULL),
(267, 1, 267, NULL, NULL),
(268, 1, 268, NULL, NULL),
(269, 1, 269, NULL, NULL),
(270, 1, 270, NULL, NULL),
(271, 1, 271, NULL, NULL),
(272, 1, 272, NULL, NULL),
(273, 1, 273, NULL, NULL),
(274, 1, 274, NULL, NULL),
(275, 1, 275, NULL, NULL),
(276, 1, 276, NULL, NULL),
(277, 1, 277, NULL, NULL),
(278, 1, 278, NULL, NULL),
(279, 1, 279, NULL, NULL),
(280, 1, 280, NULL, NULL),
(281, 1, 281, NULL, NULL),
(282, 1, 282, NULL, NULL),
(283, 1, 283, NULL, NULL),
(284, 1, 284, NULL, NULL),
(285, 1, 285, NULL, NULL),
(286, 1, 286, NULL, NULL),
(287, 1, 287, NULL, NULL),
(288, 1, 288, NULL, NULL),
(289, 1, 289, NULL, NULL),
(290, 1, 290, NULL, NULL),
(291, 1, 291, NULL, NULL),
(292, 1, 292, NULL, NULL),
(293, 1, 293, NULL, NULL),
(294, 1, 294, NULL, NULL),
(295, 1, 295, NULL, NULL),
(296, 1, 296, NULL, NULL),
(297, 1, 297, NULL, NULL),
(298, 1, 298, NULL, NULL),
(299, 1, 299, NULL, NULL),
(300, 1, 300, NULL, NULL),
(301, 1, 301, NULL, NULL),
(302, 1, 302, NULL, NULL),
(303, 1, 303, NULL, NULL),
(304, 1, 304, NULL, NULL),
(305, 1, 305, NULL, NULL),
(306, 1, 306, NULL, NULL),
(307, 1, 307, NULL, NULL),
(308, 1, 308, NULL, NULL),
(309, 1, 309, NULL, NULL),
(310, 1, 310, NULL, NULL),
(311, 2, 210, NULL, NULL),
(312, 2, 211, NULL, NULL),
(313, 2, 212, NULL, NULL),
(314, 2, 213, NULL, NULL),
(315, 2, 214, NULL, NULL),
(316, 2, 215, NULL, NULL),
(317, 2, 216, NULL, NULL),
(318, 1, 311, NULL, NULL),
(319, 1, 312, NULL, NULL),
(320, 1, 313, NULL, NULL),
(321, 1, 314, NULL, NULL),
(322, 1, 315, NULL, NULL),
(323, 1, 316, NULL, NULL),
(324, 1, 317, NULL, NULL),
(335, 1, 328, NULL, NULL),
(336, 1, 329, NULL, NULL),
(337, 1, 330, NULL, NULL),
(338, 1, 331, NULL, NULL),
(339, 1, 332, NULL, NULL),
(340, 1, 333, NULL, NULL),
(341, 1, 334, NULL, NULL),
(342, 1, 335, NULL, NULL),
(343, 1, 336, NULL, NULL),
(344, 1, 337, NULL, NULL),
(345, 1, 338, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `description`, `created_at`, `updated_at`) VALUES
(1, 'points_percentage', '15', 'Student balance percentage %', NULL, '2021-11-16 02:43:56'),
(2, 'points_end', '3', 'point value (IDR)', NULL, '2021-11-16 02:44:05'),
(3, 'return_policy_ar', 'return_policy_ar', 'return_policy_ar', NULL, NULL),
(4, 'return_policy_en', 'return_policy_en', 'return_policy_en', NULL, NULL),
(5, 'exchange_policy_ar', 'exchange_policy_ar', 'exchange_policy_ar', NULL, NULL),
(6, 'exchange_policy_en', 'exchange_policy_en', 'exchange_policy_en', NULL, NULL),
(7, 'shipping_policy_ar', 'shipping_policy_ar', 'shipping_policy_ar', NULL, NULL),
(8, 'shipping_policy_en', 'تحتلف مدة الشحن علي حسب المنقطة', 'shipping policy', NULL, '2022-05-16 12:50:11'),
(13, 'phone', 'phone', '97244282', NULL, '2022-05-16 12:48:36'),
(14, 'email', 'email', 'multikuw@gmail.com', NULL, '2022-05-16 12:48:26'),
(15, 'shipping_order_dev', '15', 'مدة الشحن لمنتجات الطلبات', NULL, '2022-06-25 15:16:35'),
(16, 'shipping_not_order', '3', 'مدة الشحن', NULL, '2022-05-15 16:12:56'),
(17, 'active_delete_acount', '0', 'تفعيل حذف الحساب', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `phone2` varchar(20) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address_d` varchar(250) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `lat_and_long` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `show_notifications`
--

CREATE TABLE `show_notifications` (
  `id` int(11) NOT NULL,
  `user_id` text NOT NULL,
  `notification_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `show_notifications`
--

INSERT INTO `show_notifications` (`id`, `user_id`, `notification_id`, `created_at`, `updated_at`) VALUES
(1, '194', 50, '2022-07-06 15:54:48', '2022-07-06 15:54:48'),
(2, '205', 53, '2022-07-06 16:37:25', '2022-07-06 16:37:25'),
(3, '205', 41, '2022-07-06 16:46:46', '2022-07-06 16:46:46'),
(4, '205', 45, '2022-07-06 16:46:52', '2022-07-06 16:46:52'),
(5, '205', 52, '2022-07-06 17:15:26', '2022-07-06 17:15:26'),
(6, '205', 29, '2022-07-06 17:20:30', '2022-07-06 17:20:30'),
(7, '205', 58, '2022-07-07 00:57:20', '2022-07-07 00:57:20'),
(8, '205', 59, '2022-07-07 01:11:02', '2022-07-07 01:11:02'),
(9, '194', 2, '2022-07-07 10:47:49', '2022-07-07 10:47:49'),
(10, '205', 57, '2022-07-07 10:51:22', '2022-07-07 10:51:22'),
(11, '205', 51, '2022-07-07 15:41:55', '2022-07-07 15:41:55'),
(12, '205', 50, '2022-07-07 15:41:57', '2022-07-07 15:41:57'),
(13, '205', 49, '2022-07-07 15:42:00', '2022-07-07 15:42:00'),
(14, '205', 46, '2022-07-07 15:42:05', '2022-07-07 15:42:05'),
(15, '205', 47, '2022-07-07 15:42:54', '2022-07-07 15:42:54'),
(16, '205', 48, '2022-07-07 15:42:54', '2022-07-07 15:42:54'),
(17, '205', 76, '2022-07-08 21:17:06', '2022-07-08 21:17:06'),
(18, '205', 75, '2022-07-08 21:17:16', '2022-07-08 21:17:16'),
(19, '205', 77, '2022-07-17 21:46:21', '2022-07-17 21:46:21'),
(20, '205', 60, '2022-07-17 21:46:38', '2022-07-17 21:46:38'),
(21, '205', 74, '2022-07-17 21:46:46', '2022-07-17 21:46:46'),
(22, '205', 71, '2022-07-17 21:46:53', '2022-07-17 21:46:53'),
(23, '205', 78, '2022-07-23 14:11:00', '2022-07-23 14:11:00'),
(24, '205', 87, '2022-07-24 10:45:44', '2022-07-24 10:45:44'),
(25, '205', 86, '2022-07-24 10:45:49', '2022-07-24 10:45:49'),
(26, '205', 85, '2022-07-24 10:45:54', '2022-07-24 10:45:54'),
(27, '205', 83, '2022-07-24 10:45:59', '2022-07-24 10:45:59'),
(28, '205', 82, '2022-07-24 10:46:02', '2022-07-24 10:46:02'),
(29, '205', 61, '2022-07-24 10:49:05', '2022-07-24 10:49:05'),
(30, '205', 62, '2022-07-24 10:49:05', '2022-07-24 10:49:05'),
(31, '205', 73, '2022-07-24 10:49:12', '2022-07-24 10:49:12'),
(32, '205', 72, '2022-07-24 10:49:19', '2022-07-24 10:49:19'),
(33, '205', 64, '2022-07-24 11:06:45', '2022-07-24 11:06:45'),
(34, '205', 70, '2022-07-24 11:06:53', '2022-07-24 11:06:53'),
(35, '205', 63, '2022-07-24 11:07:02', '2022-07-24 11:07:02'),
(36, '205', 67, '2022-07-24 11:07:09', '2022-07-24 11:07:09'),
(37, '205', 69, '2022-07-24 11:07:18', '2022-07-24 11:07:18'),
(38, '205', 68, '2022-07-24 11:07:26', '2022-07-24 11:07:26'),
(39, '205', 65, '2022-07-24 11:07:33', '2022-07-24 11:07:33'),
(40, '205', 66, '2022-07-24 11:07:39', '2022-07-24 11:07:39'),
(41, '207', 89, '2022-07-25 01:51:29', '2022-07-25 01:51:29'),
(42, '207', 88, '2022-07-25 01:51:31', '2022-07-25 01:51:31'),
(43, '207', 78, '2022-07-25 01:51:33', '2022-07-25 01:51:33'),
(44, '207', 92, '2022-07-25 01:57:02', '2022-07-25 01:57:02'),
(45, '207', 91, '2022-07-25 01:57:04', '2022-07-25 01:57:04'),
(46, '207', 90, '2022-07-25 01:57:06', '2022-07-25 01:57:06'),
(47, '205', 94, '2022-07-25 10:49:15', '2022-07-25 10:49:15'),
(48, '205', 93, '2022-07-25 10:49:20', '2022-07-25 10:49:20'),
(49, '205', 95, '2022-07-25 10:54:59', '2022-07-25 10:54:59'),
(50, '205', 96, '2022-07-25 11:01:33', '2022-07-25 11:01:33'),
(51, '205', 107, '2022-07-25 11:46:43', '2022-07-25 11:46:43'),
(52, '205', 97, '2022-07-25 11:47:53', '2022-07-25 11:47:53'),
(53, '205', 104, '2022-07-25 12:10:57', '2022-07-25 12:10:57'),
(54, '205', 106, '2022-07-25 12:16:02', '2022-07-25 12:16:02'),
(55, '205', 105, '2022-07-25 12:37:26', '2022-07-25 12:37:26'),
(56, '205', 146, '2022-07-25 15:20:26', '2022-07-25 15:20:26'),
(57, '205', 145, '2022-07-25 15:20:33', '2022-07-25 15:20:33'),
(58, '205', 149, '2022-07-25 15:31:55', '2022-07-25 15:31:55'),
(59, '205', 163, '2022-07-26 00:05:52', '2022-07-26 00:05:52'),
(60, '205', 174, '2022-07-26 00:50:17', '2022-07-26 00:50:17'),
(61, '205', 181, '2022-08-17 11:17:22', '2022-08-17 11:17:22'),
(62, '205', 213, '2022-08-17 13:14:43', '2022-08-17 13:14:43'),
(63, '205', 212, '2022-08-17 13:14:50', '2022-08-17 13:14:50'),
(64, '205', 207, '2022-08-17 13:15:16', '2022-08-17 13:15:16'),
(65, '205', 211, '2022-08-17 13:15:23', '2022-08-17 13:15:23'),
(66, '205', 210, '2022-08-17 13:15:29', '2022-08-17 13:15:29'),
(67, '205', 208, '2022-08-17 13:15:36', '2022-08-17 13:15:36'),
(68, '205', 234, '2022-08-17 15:24:51', '2022-08-17 15:24:51'),
(69, '205', 233, '2022-08-17 15:29:58', '2022-08-17 15:29:58'),
(70, '205', 231, '2022-08-17 15:30:11', '2022-08-17 15:30:11'),
(71, '205', 218, '2022-08-17 15:30:23', '2022-08-17 15:30:23'),
(72, '205', 235, '2022-08-17 15:33:37', '2022-08-17 15:33:37'),
(73, '205', 237, '2022-08-17 15:37:06', '2022-08-17 15:37:06'),
(74, '205', 236, '2022-08-17 15:37:14', '2022-08-17 15:37:14'),
(75, '205', 239, '2022-08-17 16:18:02', '2022-08-17 16:18:02'),
(76, '205', 238, '2022-08-17 16:18:10', '2022-08-17 16:18:10'),
(77, '205', 230, '2022-08-17 16:18:17', '2022-08-17 16:18:17'),
(78, '205', 232, '2022-08-17 16:18:24', '2022-08-17 16:18:24'),
(79, '205', 215, '2022-08-17 16:20:32', '2022-08-17 16:20:32'),
(80, '205', 214, '2022-08-17 16:20:50', '2022-08-17 16:20:50'),
(81, '205', 241, '2022-08-17 16:29:44', '2022-08-17 16:29:44'),
(82, '205', 240, '2022-08-17 16:29:52', '2022-08-17 16:29:52'),
(83, '205', 228, '2022-08-17 16:30:02', '2022-08-17 16:30:02'),
(84, '205', 229, '2022-08-17 16:30:10', '2022-08-17 16:30:10'),
(85, '205', 226, '2022-08-17 16:31:11', '2022-08-17 16:31:11'),
(86, '205', 216, '2022-08-17 16:31:25', '2022-08-17 16:31:25'),
(87, '205', 206, '2022-08-17 16:32:08', '2022-08-17 16:32:08'),
(88, '205', 209, '2022-08-17 16:52:12', '2022-08-17 16:52:12'),
(89, '205', 227, '2022-08-17 17:14:47', '2022-08-17 17:14:47'),
(90, '205', 242, '2022-08-17 17:24:35', '2022-08-17 17:24:35'),
(91, '205', 244, '2022-08-17 17:32:59', '2022-08-17 17:32:59'),
(92, '205', 243, '2022-08-17 17:33:07', '2022-08-17 17:33:07'),
(93, '205', 249, '2022-08-21 15:12:28', '2022-08-21 15:12:28'),
(94, '205', 248, '2022-08-21 15:12:34', '2022-08-21 15:12:34'),
(95, '205', 247, '2022-08-21 15:12:42', '2022-08-21 15:12:42'),
(96, '205', 245, '2022-08-21 15:12:50', '2022-08-21 15:12:50'),
(97, '205', 246, '2022-08-21 15:12:56', '2022-08-21 15:12:56'),
(98, '205', 250, '2022-08-21 15:16:32', '2022-08-21 15:16:32'),
(99, '205', 260, '2022-08-21 16:49:54', '2022-08-21 16:49:54'),
(100, '205', 261, '2022-08-22 11:25:21', '2022-08-22 11:25:21'),
(101, '205', 259, '2022-08-22 11:25:32', '2022-08-22 11:25:32'),
(102, '205', 287, '2022-08-22 14:06:19', '2022-08-22 14:06:19'),
(103, '205', 286, '2022-08-22 14:06:24', '2022-08-22 14:06:24'),
(104, '205', 285, '2022-08-22 14:06:30', '2022-08-22 14:06:30'),
(105, '205', 281, '2022-08-22 14:06:35', '2022-08-22 14:06:35'),
(106, '205', 279, '2022-08-22 14:06:40', '2022-08-22 14:06:40'),
(107, '205', 274, '2022-08-22 14:06:46', '2022-08-22 14:06:46'),
(108, '205', 291, '2022-08-23 14:33:25', '2022-08-23 14:33:25'),
(109, '205', 290, '2022-08-23 14:33:31', '2022-08-23 14:33:31'),
(110, '205', 288, '2022-08-23 14:34:35', '2022-08-23 14:34:35'),
(111, '205', 297, '2022-08-23 15:00:16', '2022-08-23 15:00:16'),
(112, '205', 296, '2022-08-23 15:00:23', '2022-08-23 15:00:23'),
(113, '205', 295, '2022-08-23 15:00:28', '2022-08-23 15:00:28'),
(114, '205', 293, '2022-08-23 15:00:34', '2022-08-23 15:00:34'),
(115, '205', 294, '2022-08-23 15:00:39', '2022-08-23 15:00:39'),
(116, '205', 292, '2022-08-23 15:00:44', '2022-08-23 15:00:44'),
(117, '205', 289, '2022-08-23 15:00:51', '2022-08-23 15:00:51'),
(118, '205', 284, '2022-08-23 15:00:59', '2022-08-23 15:00:59'),
(119, '205', 283, '2022-08-23 15:01:05', '2022-08-23 15:01:05'),
(120, '205', 275, '2022-08-23 15:01:11', '2022-08-23 15:01:11'),
(121, '205', 282, '2022-08-23 15:01:19', '2022-08-23 15:01:19'),
(122, '205', 280, '2022-08-23 15:01:25', '2022-08-23 15:01:25'),
(123, '205', 273, '2022-08-23 15:01:31', '2022-08-23 15:01:31'),
(124, '205', 276, '2022-08-23 15:01:37', '2022-08-23 15:01:37'),
(125, '205', 272, '2022-08-23 15:01:45', '2022-08-23 15:01:45'),
(126, '205', 278, '2022-08-23 15:01:53', '2022-08-23 15:01:53'),
(127, '205', 220, '2022-08-23 15:02:03', '2022-08-23 15:02:03'),
(128, '205', 277, '2022-08-23 15:02:12', '2022-08-23 15:02:12'),
(129, '205', 299, '2022-08-23 15:16:45', '2022-08-23 15:16:45'),
(130, '205', 298, '2022-08-23 15:16:55', '2022-08-23 15:16:55'),
(131, '205', 255, '2022-08-23 15:17:04', '2022-08-23 15:17:04'),
(132, '205', 303, '2022-08-23 15:48:17', '2022-08-23 15:48:17'),
(133, '205', 305, '2022-08-23 15:49:00', '2022-08-23 15:49:00'),
(134, '205', 300, '2022-08-23 15:49:07', '2022-08-23 15:49:07'),
(135, '205', 302, '2022-08-23 15:49:12', '2022-08-23 15:49:12'),
(136, '205', 304, '2022-08-23 15:52:23', '2022-08-23 15:52:23'),
(137, '205', 271, '2022-08-23 15:52:33', '2022-08-23 15:52:33'),
(138, '205', 306, '2022-08-23 15:54:54', '2022-08-23 15:54:54'),
(139, '203', 248, '2022-08-27 17:42:06', '2022-08-27 17:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `link` text NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'product',
  `in_app` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `img`, `description`, `link`, `type`, `in_app`, `created_at`, `updated_at`) VALUES
(11, '166161977789540.png', NULL, 'https://multi-kw.com/ar/vendor/51', 'product', 0, '2022-05-31 14:35:46', '2022-08-27 20:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `statements`
--

CREATE TABLE `statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `value_en` text DEFAULT NULL,
  `value_ar` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statements`
--

INSERT INTO `statements` (`id`, `name_ar`, `name_en`, `value_en`, `value_ar`, `created_at`, `updated_at`, `deleted_at`, `product_id`) VALUES
(472, 'خامات عالية الجودة', 'high quality materials', NULL, NULL, NULL, NULL, NULL, 228),
(487, 'خامات مميزة', 'Distinctive materials', NULL, NULL, NULL, NULL, NULL, 237),
(493, 'متوفر ب 5 الوان', 'Available in 5 colors', NULL, NULL, NULL, NULL, NULL, 267),
(494, 'ياقة مستديرة', 'round collar', NULL, NULL, NULL, NULL, NULL, 267),
(504, 'خامات عالية الجودة', 'high quality materials', NULL, NULL, NULL, NULL, NULL, 240),
(506, 'خامات عالية الجودة', 'high quality mater', NULL, NULL, NULL, NULL, NULL, 241),
(507, 'طقم مكون من بلوزة وبنطال', 'Set of Top and Pants', NULL, NULL, NULL, NULL, NULL, 251),
(508, 'نسيج بوليستر مريح وخفيف الوزن', 'Lightweight and comfortable polyester blend fabric', NULL, NULL, NULL, NULL, NULL, 251),
(509, 'ياقة مفتوحة مع اكمام طويلة', 'Open neck with long sleeves', NULL, NULL, NULL, NULL, NULL, 251),
(510, 'حزام خصر قابل للتعديل مع اربطة', 'Adjustable waistbelt with self-tie straps', NULL, NULL, NULL, NULL, NULL, 251),
(511, 'بنطال بخصر مطاطي لارتداء قابل للتعديل', 'Pants with elasticated waistband for adjustable fi', NULL, NULL, NULL, NULL, NULL, 251),
(512, 'اللون : متعدد', 'Color: multi', NULL, NULL, NULL, NULL, NULL, 270),
(513, 'الجنس : بنات', 'Gender: girls', NULL, NULL, NULL, NULL, NULL, 270),
(514, 'Cotton : الخامة', 'Cotton: Material', NULL, NULL, NULL, NULL, NULL, 270),
(516, 'متوفر باللونين الاصفر مع ابيض واوردي مع ازرق', 'Available in all colors', NULL, NULL, NULL, NULL, NULL, 207);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `university` varchar(100) DEFAULT NULL,
  `university_id` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `img` varchar(50) NOT NULL DEFAULT 'img_default.jpg',
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_payed` tinyint(1) NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 0,
  `cover` varchar(50) DEFAULT 'cover_default.jpg',
  `limit_products` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `phone`, `date`, `university`, `university_id`, `major`, `img`, `is_active`, `is_payed`, `points`, `cover`, `limit_products`, `email_verified_at`, `password`, `remember_token`, `updated_at`, `deleted_at`, `created_at`, `facebook`, `instagram`, `linkedin`, `twitter`) VALUES
(32, 'LACOSTE', 'LACOSTE@yahoo.com', '1011114448', NULL, NULL, NULL, NULL, '1649268456.png', 1, 0, 1624, 'cover_16376969203237762.jpeg', 50, NULL, '$2y$10$XU1kzxN7DkHDN3c9Nk.JZ.pJF8AV5dN2np8DkfT1H2rgNB97MXp.6', '', '2022-04-23 01:58:33', NULL, '2021-10-18 11:34:35', 'https://www.facebook.com/', 'https://www.instagram.com/', 'linkedin.com', 'twitter.com'),
(40, 'KONOZ', 'bluezone.adv@gmail.com', '99427261', NULL, NULL, NULL, NULL, '1649268620png', 1, 0, 300, 'cover_default.jpg', 50, NULL, '$2y$10$ZX36P0PRsNa4XoYS62kxmeb7.iLdGBh96SZrBfY.D.GPKyUbBym72', NULL, '2022-04-23 01:58:26', NULL, '2022-04-04 08:39:40', NULL, NULL, NULL, NULL),
(41, 'american', 'info@bluezonekw.com', '97244282', NULL, NULL, NULL, NULL, '1649268861png', 1, 0, 0, 'cover_default.jpg', 50, NULL, '$2y$10$xQeqF2vkaUv3nOpH4XuEau4X0lMmRQ5gwngU3VaPnfXybHcrQBp2.', NULL, '2022-05-25 17:58:11', NULL, '2022-04-07 04:14:21', NULL, NULL, NULL, NULL),
(43, 'mymall', 'mymall.kw22@gmail.com', '97753950', '1983-09-21', 'kuwait', 'kuwait', '1', '1653490906png', 1, 0, 30, 'cover_16534923701008139.jpeg', 50, NULL, '$2y$10$XU1kzxN7DkHDN3c9Nk.JZ.pJF8AV5dN2np8DkfT1H2rgNB97MXp.6', '', '2022-05-28 20:58:43', NULL, '2022-05-25 18:01:46', 'https://www.instagram.com/multi.kw/', 'https://www.instagram.com/multi.kw/', 'https://www.instagram.com/multi.kw/', 'https://www.instagram.com/multi.kw/');

-- --------------------------------------------------------

--
-- Table structure for table `student_password_resets`
--

CREATE TABLE `student_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_password_resets`
--

INSERT INTO `student_password_resets` (`email`, `token`, `created_at`) VALUES
('student23@yahoo.com', '$2y$10$cZoMo63BpiKTh3ZeqkKMP.WTjKRgIhzADZwWSO5u1mMEkzEIhN3RG', '2021-11-04 23:03:49'),
('LACOSTE@yahoo.com', '$2y$10$GnosAKZrkXl5LgOjYWTWK.6wcfh6BZEQ1ybXr2Tt96F6bMMmDjtCC', '2022-07-06 16:58:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `img` varchar(350) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT 1,
  `gender` tinyint(1) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `activation_code` varchar(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `img`, `country_id`, `gender`, `birth_day`, `is_admin`, `email_verified_at`, `device_token`, `remember_token`, `activation_code`, `deleted_at`, `created_at`, `updated_at`, `password`) VALUES
(1, 'Norma Lynch II', NULL, 'ebony74@example.com', '423-606-4001', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'GXeKUR5EIK', NULL, NULL, '2021-10-18 11:23:13', '2021-10-18 11:23:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(2, 'Lisa Gutkowski', NULL, 'randal.klein@example.net', '559-683-8294', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'OpAw56G5JC', NULL, NULL, '2021-10-18 11:23:14', '2021-10-18 11:23:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(3, 'Abdul Kerluke', NULL, 'kwaelchi@example.com', '+1-562-210-4154', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'FPHC2p9iSm', NULL, NULL, '2021-10-18 11:23:14', '2021-10-18 11:23:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(4, 'Araceli Bradtke', NULL, 'okon.jackie@example.net', '+13527907323', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'JlP5gwi3if', NULL, NULL, '2021-10-18 11:23:14', '2021-10-18 11:23:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(5, 'Prof. Athena Grimes Jr.', NULL, 'toby.vonrueden@example.org', '(747) 781-8921', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'KaISueStQn', NULL, NULL, '2021-10-18 11:23:14', '2021-10-18 11:23:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(6, 'Mr. Will Altenwerth', NULL, 'koepp.meagan@example.com', '+17278739731', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'iQ7dav2aZz', NULL, NULL, '2021-10-18 11:23:14', '2021-10-18 11:23:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(7, 'Asha Purdy', NULL, 'chanel90@example.org', '+14799396979', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'Hvs01lgOh9', NULL, NULL, '2021-10-18 11:23:14', '2021-10-18 11:23:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(8, 'Miss Alexandria Rowe', NULL, 'brenda75@example.net', '256-976-6126', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'QShFtn9fe5', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(9, 'Prof. Milford Daugherty I', NULL, 'iwilliamson@example.org', '(737) 512-6515', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, '0V55JPlbVq', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(10, 'Dr. Halie Mohr Sr.', NULL, 'ddibbert@example.net', '1-458-317-8927', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'BwtbZPwrQs', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(11, 'Rhoda Bauch Jr.', NULL, 'kade68@example.com', '+1-651-320-5089', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'bf4pf5B6ge', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(12, 'Olga Reilly', NULL, 'sibyl.hansen@example.com', '1-302-246-7913', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, '0GlKpXMzHd', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(13, 'Lexus Hayes', NULL, 'gonzalo22@example.org', '+19374146970', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'AJ0agudjGu', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(14, 'Brooklyn Roob', NULL, 'alejandra.hoppe@example.org', '+1 (231) 581-5304', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, '83Vycf2kUf', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(15, 'Romaine Rodriguez', NULL, 'lilian.swaniawski@example.com', '+12165680609', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'oJTpoNuA4h', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(16, 'Buck Wuckert V', NULL, 'cdavis@example.net', '+1.316.342.1298', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'BAXVkIfS6k', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(17, 'Maeve Cruickshank', NULL, 'pschinner@example.org', '+17166667337', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'WTyxuU9g0Q', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(18, 'Cora McGlynn', NULL, 'marc.cruickshank@example.net', '+1.240.422.7983', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, '3RbN8x5nGi', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(19, 'Destany Bailey Jr.', NULL, 'kutch.carlo@example.org', '321.472.4526', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'oYPDsChAmB', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(20, 'Blanche Kihn PhD', NULL, 'garret.vandervort@example.net', '(865) 428-1172', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, '9xVBEidq1q', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(21, 'Godfrey Runolfsson', NULL, 'dedric.okon@example.com', '1-984-439-0572', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'wJFghZF6Wr', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(22, 'Cristobal Kunze', NULL, 'reilly.gaetano@example.com', '+1-828-317-3380', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'H8g8qRkCcb', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(23, 'Yadira Schinner', NULL, 'oreilly.tressie@example.org', '781.252.9580', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'PFxt1Roec6', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(24, 'Marjory Bayer II', NULL, 'gmann@example.com', '+15075473840', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'FjcCxPaGwD', NULL, NULL, '2021-10-18 11:23:15', '2021-10-18 11:23:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(25, 'Emelie Pfannerstill', NULL, 'heller.christopher@example.com', '223-502-4256', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'etMLv9fb6D', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(26, 'Orion Becker', NULL, 'quinton46@example.net', '+1.914.347.4959', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'gfzbEl6Ejq', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(27, 'Ernest Schneider Jr.', NULL, 'dsipes@example.org', '(747) 341-8496', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, '0odLqjUHhL', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(28, 'Rocky Mills DVM', NULL, 'jstoltenberg@example.net', '240.655.2658', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'uy7EMbfJzn', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(29, 'Eli Hayes', NULL, 'dickens.aylin@example.com', '361.975.7501', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'b62L754sY3', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(30, 'Jedidiah Rowe', NULL, 'cormier.pablo@example.org', '1-773-908-1714', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, '9MDtEn3pMy', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(31, 'Chaim Feeney', NULL, 'carlotta97@example.net', '747.626.0920', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'tk0KxGMUul', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(32, 'Prof. Whitney Turner DVM', NULL, 'tjohns@example.net', '(804) 271-9891', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'j0Pc50BUHI', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(33, 'Burdette Padberg', NULL, 'drowe@example.com', '+1 (661) 530-7309', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'I9dfgSfMBy', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(34, 'Augustus Littel DVM', NULL, 'bkeebler@example.com', '1-726-897-4549', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'OucqNrj1jI', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(35, 'Art Ullrich', NULL, 'ktillman@example.org', '1-504-973-8536', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'FHVvSa8LCs', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(36, 'Juvenal Skiles DDS', NULL, 'brendon.spinka@example.net', '+1-830-989-7263', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, '9v2vRBnwIB', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(37, 'Dr. Jess Baumbach Sr.', NULL, 'bradley.parisian@example.net', '(832) 537-3147', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'UfIZvgp640', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(38, 'Dr. Cleveland Stokes', NULL, 'legros.verdie@example.com', '870.908.8350', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'nz6Ll94uZU', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(39, 'Colton Weber', NULL, 'kayley14@example.net', '+1 (458) 700-1805', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'ubIumxB0m3', NULL, NULL, '2021-10-18 11:23:16', '2021-10-18 11:23:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(40, 'Carmen Gusikowski', NULL, 'sammy54@example.org', '+15632002513', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'PiHB4l9v0G', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(41, 'Addison Bradtke', NULL, 'marcelino.roob@example.com', '+1-360-553-0957', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, '3ZGppBvQhg', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(42, 'Cloyd Monahan', NULL, 'fredy12@example.com', '1-601-646-0879', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'MSgPhNrDWK', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(43, 'Prof. Rodolfo Armstrong DVM', NULL, 'schultz.assunta@example.org', '628.756.2264', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'zzn6qhdvZD', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(44, 'Ibrahim Ferry', NULL, 'jlebsack@example.net', '+1-563-325-3366', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'B3vi7pORWx', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(45, 'Dr. Martin Grant', NULL, 'uortiz@example.com', '956.445.9111', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'IpF6MATFEt', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(46, 'Jackson Gislason', NULL, 'emile51@example.org', '+1-757-339-1019', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'R4r8Z6T6J9', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(47, 'Dane Rohan', NULL, 'preinger@example.org', '+1-689-772-6055', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'SRLDxHG93d', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(48, 'Karolann Bins', NULL, 'patience.roob@example.org', '1-346-342-3998', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'FRWaEAzLK3', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(49, 'Madyson Lindgren', NULL, 'nkihn@example.com', '781.909.5118', NULL, 4, NULL, NULL, 0, '2021-10-18 11:23:13', NULL, 'smbYc80vE5', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(50, 'Okey Rutherford', NULL, 'wwalter@example.org', '+1-832-300-2028', NULL, 4, NULL, NULL, 1, '2021-10-18 11:23:13', NULL, 'KrJtuHUOGS', NULL, NULL, '2021-10-18 11:23:17', '2021-10-18 11:23:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(51, 'api test', NULL, 'api31@test.com', '0111112132220', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-10-18 11:52:34', '2021-10-18 11:52:34', '$2y$10$vAdA2oMdXQlTUxLX.AP.6ewU5Un.HwOEfe6tPEezaCaTbDtixXg8a'),
(52, 'api test', NULL, 'api33@test.com', '0111112132222', NULL, 4, NULL, NULL, 0, NULL, '64884894894894984894984984', NULL, NULL, NULL, '2021-10-18 22:11:06', '2021-10-26 16:21:46', '$2y$10$bItjJMAa/fJR2BviVJyjXeunMl2ObhTK19Pt.47Mhx8nzJtcUl1ne'),
(53, 'nknknkn', NULL, 'mm@mm.com', '011111111', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-10-25 21:51:02', '2021-10-25 21:51:02', '$2y$10$.FbYBvyGFrvI6LgmcEiyseYLT.lfVGGW5zXufaY3VARDh7DQ8.qJu'),
(54, 'تلاتنلا', NULL, 'mm@mm.co', '01111111', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-10-25 21:59:06', '2021-10-25 21:59:06', '$2y$10$c7ICFr7Cq7SH410Z3h7fPOKD54x9oBUD0FtqWSNiZaLBdCbUkhwQG'),
(57, 'hamza', NULL, 'hamzasecoo@gmail.com', '01204561567', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-10-29 03:56:30', '2021-11-07 18:02:18', '$2y$10$Ty/Y5Ygkk7eVV7YMffJefOzPOX9y88Ta6rlFWeIZbToap28Rxw4LW'),
(58, 'hamza', NULL, 'hamzasecoo1@gmail.com', '01204561566', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-10-29 04:07:14', '2021-10-29 04:07:14', '$2y$10$HW/WK5zaCuMTNk00Yl0v..KQxRKxv.w8utklIN333vcE.37jpBqu2'),
(59, 'hamza', NULL, 'hamzasecoo@gmail', '012045615675', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-10-29 04:29:27', '2021-10-29 04:29:27', '$2y$10$aSX2EzD8V/D/WmeedBAM8ep4ig3Dz5jSfsmlBp9Nxhg8fhZD7SiVy'),
(60, 'hamza', NULL, 'hamzasecoo2@gmail.com', '0120456156755', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-10-29 04:30:31', '2021-12-21 01:53:12', '$2y$10$P80z/HlapPJq0cHEbhr6nOi1vQ/WvD9OWbHKXEoyfCFimEstN5lW2'),
(61, 'hamza', NULL, 'hamzasecoog2@gmail.com', '01204561567555', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-10-29 07:34:49', '2021-10-29 07:34:49', '$2y$10$AXFX0X5dybt9OkTvQZzop.FC9fnRVC9pQvZkCkkPK.NwPkN739cUm'),
(62, 'api test', NULL, 'api36@test.com', '0111112132226', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-10-29 08:08:05', '2021-10-29 08:08:05', '$2y$10$vG4fPsfpyZAvfSUxY0E8cuMHN9.Qy/Y7pIDyKKgEjQNgquOm8eUPC'),
(63, 'api test', NULL, 'api38@test.com', '01111121324', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-10-29 08:08:47', '2021-10-29 08:08:47', '$2y$10$Ku7KdDQuJkdpcSxU1MbbBeJVoJt0XaF9KvK/DINCSRaWNE9.tV9XW'),
(64, 'api test', NULL, 'api42@test.com', '0111112132452', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-10-31 08:06:01', '2021-12-28 19:28:06', '$2y$10$0laoiKUShhYcv2twNHuE5O2N4b2Zn.SPiela6H37gjhw8KcTlw7r6'),
(65, 'ahmed', NULL, 'ahmed@gmail.com', '0120456123', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-11-08 20:35:19', '2021-11-08 20:36:21', '$2y$10$GvEMWF9dV6GmfhuBiASPRuejnxoUqWut4h5QoxmjK/A9QIXKfZPKW'),
(66, 'ahmed', NULL, 'testbluezone@gmail.com', '0120451234', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-11-08 20:37:21', '2021-11-08 20:38:56', '$2y$10$ngl1qcNvZ9XzOMjgydcw4.tq.K2Jhr894OVuRz5ODqnD6zcYBv6Pi'),
(67, 'Mohamed', NULL, 'mo.esmael2019@gmail.com', '01146469865', NULL, 4, NULL, NULL, 0, NULL, '64884894894894984894984984', NULL, '8432', NULL, '2021-11-15 05:13:01', '2022-07-07 16:49:15', '$2y$10$XU1kzxN7DkHDN3c9Nk.JZ.pJF8AV5dN2np8DkfT1H2rgNB97MXp.6'),
(69, 'hossam', NULL, 'attiaelhager@gmail.com', '7554333', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-12-04 16:10:09', '2021-12-04 16:12:07', '$2y$10$fSm3YiTZ.dRUOfhkYVcbMOXWSgb.p0QjrJ3047pWFk4Epjmjz1a36'),
(70, 'hossa', NULL, 'hossamm@gmail.com', '45666', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-04 17:52:05', '2021-12-04 17:52:05', '$2y$10$vcPm5JoX7n65.rbD8SX69OXVx8/ViVknnAc//yC8hkYs2wmCl.x8G'),
(71, 'hossam', NULL, 'hosssamff@gmail.com', '775585874', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-04 18:09:56', '2021-12-04 18:09:56', '$2y$10$TYooRsoQMY8ZSO9oVqP4teO289wavYtqRwFg3wiB5tgjVZtWBxqea'),
(72, 'jgfjjf', NULL, 'hosssaggmff@gmail.com', '7585885', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-04 18:17:36', '2021-12-04 18:17:36', '$2y$10$NBWFXfmv82RHwmS34ULuXutDtypgJ89jZkn6nBgmWACNzF3lvYHhW'),
(73, 'user', NULL, 'userrrr@gmail.com', '4235788', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-04 18:20:05', '2021-12-04 18:20:05', '$2y$10$iOd5E1N802tIqHRoDrfPP.qtBqtI7Aruq4p/uXcT09i83i9iAaMC2'),
(74, 'guest', NULL, 'guesttt@gmail.com', '65346568', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-12-04 19:40:10', '2021-12-04 19:40:43', '$2y$10$ffng6KwmtrgPGdfmNHKN/.HwsNDWxIelf8lirMPFCBRnyXvLgsBRe'),
(75, 'user name', NULL, 'uuusername@gmail.com', '45267', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-12-04 19:42:13', '2021-12-04 19:42:42', '$2y$10$x6T01z/94bHo634fvWXRFeCIFVJCG2qBw4KRLmps6PoBe7LVcmfq2'),
(77, 'fkfjfjfj', NULL, 'jffjjcjjfjffj@gmail.com', '47475', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-04 20:13:41', '2021-12-04 20:13:41', '$2y$10$LA47omXuW6R6g6edgOLuWeNbNkbI4P.biLalaK9RFX67E7FY5/caK'),
(78, 'mmmm', NULL, 'mmmmm@gmail.com', '45787', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-05 17:36:02', '2021-12-05 17:36:02', '$2y$10$GEzvPzrfBsUImldO.ncueexIAPCYZInZt1WRndXagt.kEWDsKCY5i'),
(79, 'hosssh', NULL, 'hkfjfjckcjjfk@gmail.com', '58585858', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-12-06 03:52:29', '2021-12-06 03:53:05', '$2y$10$pUUqiq1mVaUUCtOIQnkjmuUuBtP2EBhxeTfYrehRk4tEYwqlLdHse'),
(80, 'gkgkgkkg', NULL, 'fjfjfkgkgk@gmail.com', '58588558', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-06 04:31:00', '2021-12-06 04:31:00', '$2y$10$ro9YzIM2AtBseOdUDGNyueRlnG6yb8.0IQ1Oq5H1Pyaah6AuA4Ib.'),
(81, 'ppppp', NULL, 'ppppppp@gmail.com', '475775', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-12-06 19:59:47', '2021-12-06 20:02:59', '$2y$10$C/EFrAfITE8IklQD6B6wfuqJM.CQxZ3v/D3SId6erLMZm6osUH9SC'),
(83, 'amal', NULL, 'a@a.aa', '555555555', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-12-17 20:36:17', '2021-12-17 20:36:52', '$2y$10$gc6KWxfSnJLu2YQZjzD9k.nr2u0jXzw5TnMqJ6e7ov5E5xtTuSYMC'),
(84, 'amal', NULL, 'v@v.vv', '55555554', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-18 05:05:27', '2021-12-18 05:05:27', '$2y$10$8IP2v1fnO0LpGE0nQ1fgied/WsyEkZeYRMFGR3o.flUAIlTmGh2v2'),
(85, 'amal', NULL, 's@s.ss', '55555551', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-18 05:06:23', '2021-12-18 05:06:23', '$2y$10$peiXRatmW3l.zMm19kzIzet.cPJ0XOdpMY.nVEiieAdMeq1/PgPEi'),
(86, 'mohammed', NULL, 'mama@gmail.com', '55555558', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-18 20:42:39', '2021-12-18 20:42:39', '$2y$10$t9q/aOcC62hCyG3zp7IZ3OPRJKBmBXOsALy7Q4F7LdcRS6yTp7E.q'),
(89, 'nermeen', NULL, 'nermeen@gmail.com', '99524562', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-21 18:17:49', '2021-12-21 18:17:49', '$2y$10$dikQ1fLirOyluWzj3XNnDevFlQoQqWr9lYJT6Lb3kNm8rccKGjUma'),
(90, 'nermeen', NULL, 'nn@gmail.com', '99427234', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-22 01:48:38', '2021-12-22 01:48:38', '$2y$10$3AM8gHqXM5pOg1lyiN.PHufnvn0/yUvIPMgxHmo2kBgQU/zve8X2K'),
(92, 'mohamed', NULL, 'm@gmail.com', '99451267', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-22 18:10:10', '2021-12-22 18:10:10', '$2y$10$KNHxbQ9HluA3Mpk9BLeXiungAvJ3dc/16vR26yCxLYXretdnto2nm'),
(93, 'mohamed', NULL, 'mm@gmail.com', '99456780', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-22 18:33:57', '2021-12-22 18:33:57', '$2y$10$pl2Ue.GUBzM5L.X5woYsJ.zd8JhjkCb/QbxUY6WbkoII4jpFjBjpW'),
(94, 'sahar', NULL, 's@gmail.com', '97867421', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-22 20:20:46', '2021-12-22 20:20:46', '$2y$10$Hvd7TV6Dqb00x.Hfr0/qS.Au5JI8T0G1YXoCIj0DScrah2zKyKn5m'),
(95, 'nermeen ramadan', NULL, 'c@gmail.com', '55678923', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-22 21:07:40', '2021-12-22 21:07:40', '$2y$10$8iITbpWpTxXU9w2rI7RrkuH5oI0xErK.X3oat5ZLcWo1ce/EN/vzm'),
(96, 'asmaa', NULL, 'z@gmail.com', '34567890', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-12-23 07:45:15', '2021-12-23 19:00:43', '$2y$10$.I4mzHdBlUwPfAD1N6grKO8SKLbT3Sl8P9rgBLRNpw08KY9Lg2q6q'),
(97, 'ahmed saleh', NULL, 'aa@gmail.com', '12345678', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-23 20:29:26', '2021-12-23 20:29:26', '$2y$10$hjDQChBRgDe/ljPaCM/7teJQ0ylqjDJvDkMsir0UX8GympYk/Jp36'),
(98, 'youssef', NULL, 'youssef@gmail.com', '02345678', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-23 22:20:43', '2021-12-23 22:20:43', '$2y$10$riwJX4OFM8bZHpTM/KCiC.cFjp8/qY3SdiHlyKNxXRLfVtw8xIomS'),
(99, 'yousef', NULL, 'y@gmail.com', '45678900', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-23 22:37:28', '2021-12-23 22:37:28', '$2y$10$1AJoUVB3ZYOhTQQ5C.VOG.ZhUhDG5P3mTI3sfi3MQxeTVXOFIo0Q6'),
(100, 'ramadan', NULL, 'ramadan@gmail.com', '45667788', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-23 22:52:36', '2021-12-23 22:52:36', '$2y$10$JglzFNmBII.rcELf9lLeveZYNblckmVHhLPgFBs86BHf6aRMD2ZaW'),
(101, 'ebraheem', NULL, 'e@gmail.com', '11223344', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-23 23:14:19', '2021-12-23 23:14:19', '$2y$10$3dGpjRW8DrpQyPSiwEMJ4ORqeepT9.sbrrb0htzvTFyBd.uxlWHbC'),
(102, 'amin', NULL, 'amin@gmail.com', '33445566', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-23 23:17:40', '2021-12-23 23:17:40', '$2y$10$wnB0xHOyASyDSK8FeW.sWOBw2yXeHdPqHBlkDHxRPArwqYdl2vw/.'),
(103, 'hassan', NULL, 'h@gmsil.com', '12345670', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-24 00:49:51', '2021-12-24 00:49:51', '$2y$10$I4VYgF9TaqOmgdlxr8ewSO6S5qJAYsMzuSmvlQuq8LUYVCyPSb8K6'),
(104, 'ibrahem', NULL, 'hema@gmail.com', '22113344', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-24 01:01:52', '2021-12-24 01:01:52', '$2y$10$iUkJyyi/sPW2u8kEijCJR.P4vmx48sbWKOeBYeP.NTid2vDl60Nfy'),
(106, 'نرمين', NULL, 'ss@gmail.com', '99427260', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-24 06:25:05', '2021-12-24 06:25:05', '$2y$10$qZFrnr81b.R0R/qngmfN9uvNBTChiiObscByKQWNXn5mxB7Zin.CK'),
(107, 'نرمين', NULL, 'ner@gmail.com', '99427262', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-24 06:37:27', '2021-12-24 06:37:27', '$2y$10$xEO.pP2cr06IudxC299l4uEcayMUp.Qx77De8LV2nRfhdfR0KQgwe'),
(108, 'mahmoed', NULL, 'mahmoed@gmail.com', '99427263', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-25 16:43:49', '2021-12-25 16:43:49', '$2y$10$uM4KQTys4bO6Tuz9o2KzaO6RTCIQBYrK1Dj1vtPMfmwtKnKed73HK'),
(109, 'nermeen ramadan', NULL, 'nn22@gmail.com', '99427265', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-12-25 16:55:29', '2021-12-25 21:09:39', '$2y$10$4q1SV2vKiOCNBFVZpzTQ5eBRvBarz7n8EP/YT7UCSTuqAaCvVEyhm'),
(110, 'ahmed', NULL, 'ahmed22@gmail.com', '99427269', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-25 19:45:57', '2021-12-25 19:45:57', '$2y$10$9kl6VHRkgM7BvkdT2JH6x.SqrSgDUL3nO1Eot6KYpouK34pNj4WAS'),
(111, 'yosef', NULL, 'yosef@gmail.com', '97244285', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-25 20:05:11', '2022-03-02 01:56:44', '$2y$10$P.g9T7xx//bQ71kkTRQ7ueCDtJT38Vsymw6Q4WTfGDpImdCGFS1He'),
(112, 'Ebraheem', NULL, 'hem@gmail.com', '97244283', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-25 20:55:30', '2021-12-25 20:55:30', '$2y$10$CNusHCKkbAruqjePqBRaYu9hpdP7nWT8gjXLYSKSiFkdolwQo2kF2'),
(113, 'api test', NULL, 'd@gmail.com', '0111112132454', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-25 21:50:40', '2021-12-25 21:50:40', '$2y$10$U2GoSCyiTrl.AR2TSrnwjOVqM05ror7zTw24SIRUdCSoU4D9BVjmq'),
(114, 'reham', NULL, 'reham@gmaip.com', '97244288', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-25 22:24:12', '2021-12-25 22:24:12', '$2y$10$3IJPHLu3xaoAV9vA3.D26.UMg9QP0Elw3TAoeTMOE3q/GOKjMO2YG'),
(115, 'aminn', NULL, 'aminn@gmail.com', '97244287', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-25 23:56:18', '2021-12-25 23:56:18', '$2y$10$6O0gp0DUMpXeMhbEw1jj8OCUOWIx6FBJTci8DlYmPxzgtqNzq3svy'),
(116, 'يوسف رمضان', NULL, 'gg@gmail.com', '97244289', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 00:11:34', '2021-12-26 00:11:34', '$2y$10$M5wx1zc/ZJpnv.0/92nFp.B9XWP/Inyvmtyxr4EO3tnbRbW7hNYM6'),
(117, 'يوسف رمضان', NULL, 'rm@gmail.com', '99456731', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 00:54:04', '2021-12-26 00:54:04', '$2y$10$fzkNirI91ulc6atIKVlwN.GvMRyrFmqJuoo5igik99.kCvr9n6Cci'),
(118, 'رمضان', NULL, 'ggh@gmail.com', '997244280', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 01:29:27', '2021-12-26 01:29:27', '$2y$10$LPw407Fs8PZvyzHvv6S5nuIPHyyAw5fhfQu9zwMDMtZ2hcQ/kDbY6'),
(119, 'رمضان', NULL, 'grh@gmail.com', '997244245', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 01:30:27', '2021-12-26 01:30:27', '$2y$10$hy4ZNQmpxvzz6JJEKS0sRuQLaEBEVzlFa68RWiaEWeeWa/NHM9pC2'),
(120, 'رمضان', NULL, 'grt@gmail.com', '997244267', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 01:32:37', '2021-12-26 01:32:37', '$2y$10$YmWbMPSHsqQSzsZ9xLhxM.536nSWPKeHNMu1V4uQW90vZnEH/KmcG'),
(121, 'youssef', NULL, 'wd@gmail.com', '99784560', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 01:39:38', '2021-12-26 01:39:38', '$2y$10$eAggvaxvLevWYmoxOKTWp.JQLR8.3g/rEljtfoxlX7WNPHhuNGT3.'),
(122, 'لاتتن', NULL, 'fgjkkkkk@gmail.com', '97246282', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 01:46:39', '2021-12-26 01:46:39', '$2y$10$N3plMTzaQbj6CTQ63N2s7OiH6QHUZ6r.ehMLtlddM2jCjZCu1Xr9u'),
(123, 'لاتتن', NULL, 'jjooogjkkkkk@gmail.com', '97506282', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 01:50:03', '2021-12-26 01:50:03', '$2y$10$mvLv8B7xf87DiRkFZAn/4e1iugv4lNn6y0SpL1s5f6tyWKQOBQiJS'),
(124, 'mm', NULL, 'dfg@gmail.com', '33442221', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 01:50:59', '2021-12-26 01:50:59', '$2y$10$Sd5/vnJcCrS5KX7w/nvueeFFI6V78If34j32SSuX7ExwnUMOngime'),
(125, 'hosam', NULL, 'hosam@gmail.com', '97244281', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 03:43:47', '2021-12-26 03:43:47', '$2y$10$pvEvz.RQfLsDwhTEM5HY6eHa.POqq4DY.P1rzl9dj4ReniSemEkZS'),
(126, 'nermeen ramadan', NULL, 'nermo@gmail.com', '97244290', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 18:32:03', '2021-12-26 18:32:03', '$2y$10$oE1G8/pJh2E.XKPUYJyOnOELa23IMMKsnEFmDaladQfRm/proPJim'),
(127, 'nermeen ramadan', NULL, 'nermo11@gmail.com', '97244292', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2021-12-26 18:42:47', '2021-12-26 18:43:32', '$2y$10$04dsqsQP6XUBPrllEGEEnu6swH5aUQunbA/gNpEhdnjvPidCudu6C'),
(128, 'maroon', NULL, 'maro@gmail.com', '90244292', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-26 23:27:26', '2021-12-26 23:27:26', '$2y$10$ukIqxiIhQHTnDtjicRqVJ.MXtdeB8jdFi6BgtNLk62AnfyRZ94Yjm'),
(129, 'api test', NULL, 'qw@gmil.com', '0111112132455', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 01:00:51', '2021-12-27 01:00:51', '$2y$10$OInWkiUJiW/gsaqVEc8jhe4l5xf0v4c9DORAiVlFjeIRJvgXmvcvW'),
(130, 'api test', NULL, 'qw1@gmil.com', '0111112132456', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 01:10:09', '2021-12-27 01:10:09', '$2y$10$XKUlfzoHwNmmC.mZtZfHOu1TUwpOYqSDwwCD896Gm6.WH3XH5WsI6'),
(131, 'merna', NULL, 'merna@gmail.com', '97244234', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 01:12:13', '2021-12-27 01:12:13', '$2y$10$P1lPRTAtFZ7R3C4406vFtucVLu20toW0SNf7JPVVTVtaZ8hFO4QDa'),
(132, 'maron', NULL, 'mmr@gmail.com', '97244267', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 01:20:18', '2021-12-27 01:20:18', '$2y$10$IKscjAvhXIM/W4IYhfV8Rue99FQP/paCeQ0pBIA3XrtfVX.Xn.e8q'),
(133, 'maron', NULL, 'mr@gmail.com', '97244245', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 01:21:02', '2022-03-02 01:57:23', '$2y$10$ApgdzxSu51/gMLhaWC2UnuepzImsFeMeThiiBFy8RYyf3trkooCZG'),
(134, 'api test', NULL, 'qw2@gmil.com', '0111102132456', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 01:29:19', '2021-12-27 01:29:19', '$2y$10$NYMOxnDdJ6el5AXslyY5EOkVbVPdh6FqX29iLuTIja7ISBzV7ZfE2'),
(135, 'api test', NULL, 'qw6@gmil.com', '0111102132487', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 01:29:57', '2021-12-27 01:29:57', '$2y$10$wXtudcj7AWIhJoVJmaQI5e5UjikutI4kumFikKTlPCR.18O514VP.'),
(138, 'eman', NULL, 'eman@gmail.com', '99456784', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 18:25:06', '2021-12-27 18:25:06', '$2y$10$0L/48.1CuhEwML5oFXN4GOSG8F7nA2ou0frw0SbdNugYbOpMutlrq'),
(139, 'eman', NULL, 'emy@gmail.com', '99884512', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 18:40:22', '2021-12-27 18:40:22', '$2y$10$gvzVy5u8gpQENCtCJL3qOOauMACaHaYSnuuQ3y5xiali3PKOUXwEi'),
(140, 'eman', NULL, 'emy12@gmail.com', '99884516', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 18:41:15', '2021-12-27 18:41:15', '$2y$10$zPszy32GFXwoZXvUOWWK9e3bNccwwVnvU4pryepUiDmdnuRxaCSFm'),
(141, 'hamza', NULL, 'hamza25@gmail.com', '99452365', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 18:47:22', '2021-12-27 18:47:22', '$2y$10$zY2Z3gE5EayuWkSjUXZ96.u8A4UaRGZ.9CrBde5b6dUWm7vxyc0mW'),
(143, 'api test', NULL, 'dfg12@gmail.com', '99564021', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-12-27 22:32:36', '2021-12-27 22:32:36', '$2y$10$M9byBvxTzPTfGBXA39/Dauvjqw7ryiIrTsjYbSwg8xcsBH4/s.DS6'),
(145, 'nermeen', NULL, 'n22@gmail.com', '99472635', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-23 02:36:16', '2022-01-23 02:36:16', '$2y$10$PeYsvVv2wlHm9JlGzgyDXeo0iwdUlO7ioXQhAnOTWSAPufht7QLHK'),
(148, 'ahmed', NULL, 'e.ah@gmail.com', '97244280', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-26 20:08:29', '2022-01-26 20:08:29', '$2y$10$g12xum71vyLTFY8tn8LGbevCCjN0cplhKkPhbv3EAyseSiWeCPVZm'),
(149, 'nermeen', NULL, 'nerm@gmail.com', '99472859', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-29 18:33:08', '2022-01-29 18:33:08', '$2y$10$1p2j4u57P95HRIw7fPEi../sft1U.OCa71CN2gu.NLMYipALfp/Di'),
(150, 'nermeen ramadan', NULL, 'nemo99@gmail.com', '99786284', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-29 19:05:14', '2022-01-29 19:05:14', '$2y$10$gYbHt1L8GXyKsEcbvbBV0ufc6uiqhr2ca3AxVYLQHTxcK/A2uMSNC'),
(151, 'nermeen', NULL, 'nn123@gmail.com', '99856580', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-29 19:11:38', '2022-01-29 19:11:38', '$2y$10$fX.iOmY1NYRpVzFvseBpu.0Au3q42AWCAo8roOq1ABSf9rwcLwKXy'),
(152, 'nermeen ramadan', NULL, 'nm567@gmail.com', '99806532', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-29 19:20:48', '2022-01-29 19:20:48', '$2y$10$gQVIiukmu/6SmJ7lXDInauDfg/3vSAJx9a6pMyVXVlyWlEgL/gk/i'),
(153, 'hassan', NULL, 'ghj234@gmail.com', '23456789', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-29 19:38:32', '2022-01-29 19:38:32', '$2y$10$HChrJMFalw6Gp3UaxyO30u5qieg5DTwR/Be5j5arUei8rag0Egrjm'),
(154, 'nermeen', NULL, 'mm234@gmail.com', '66998075', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-29 19:57:51', '2022-01-29 19:57:51', '$2y$10$.Y1evwx0H043smDeMhKvFeRsZ1QDkVStmYZoORrIsZxd/S5ZPj2aq'),
(155, 'nermeen', NULL, 'bb123@gmail.com', '99556680', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-01-30 19:05:16', '2022-01-30 19:06:31', '$2y$10$DLU1BMteQkZHwJs/u.O2PuSq73MuztBkNwiSynaJ5CpPzES7d72by'),
(156, 'youssef', NULL, 'yuo123@gmail.com', '99884423', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-30 19:23:13', '2022-01-30 19:23:13', '$2y$10$X28pYI2T5oSH7ySFyRMPhO7VhScX0cH6yxLR3rY7vB2FYb.x8GC52'),
(157, 'ramadan', NULL, 'ramadan12@gmail.com', '99782351', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-30 20:31:03', '2022-01-30 20:31:03', '$2y$10$uxTsfMcX1JEnQtLfxTZJ5O9eaDEg5rLTEEmdB7L9YfGxt6YjqHQnS'),
(158, 'hassan safa', NULL, 'hh567@gmail.com', '99882244', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-30 20:45:57', '2022-01-30 20:45:57', '$2y$10$6ohrWlYIOg7c.btOSgl1h.XebdPD6q86iyXnG1M7IIdP.G7xhfjVa'),
(159, 'محمد رمضان', NULL, 'mhk456@gmail.com', '99782321', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-30 21:14:18', '2022-03-02 00:43:33', '$2y$10$EfI.wCZMUa8xkojSN/D3ke6cdaVcdcmdRdUgu7m9k33hDuZ6YexGO'),
(160, 'nermeen ramadan', NULL, 'jkl789@gmail.com', '99805674', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-31 20:47:14', '2022-01-31 20:47:14', '$2y$10$w1XRKa7JzRhkmEFU3xlgUuDJbyWNWrVl3cs79jTv5/Rct4.Sq/0pS'),
(161, 'nermeen hassan', NULL, 'vbn123@gmail.com', '99554421', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-31 20:57:32', '2022-01-31 20:57:32', '$2y$10$KZzrNQx2k53YTxg9PKD12u9Gi9PwpkzwX4qqrAx7y3jR8t8sDzEtS'),
(162, 'nermeen ramadan', NULL, 'bnm123@gmail.com', '99775533', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-31 21:10:08', '2022-01-31 21:10:08', '$2y$10$f6oMd3d3.mt3/BP4YPb4muCxzQuGwGqCrOsfCXdMA8YmFsGV.DKq2'),
(163, 'ahmed hatem', NULL, 'ahmedh123@gmail.com', '99443311', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-31 21:19:41', '2022-01-31 21:19:41', '$2y$10$9VEzY1uvve2oPAdlJhuNpOgF0iyKfFGwglAIr3DL87uJWW0MlZnyy'),
(164, 'ahmed hatem', NULL, 'ahmed77@gmail.com', '99113322', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-31 21:21:45', '2022-01-31 21:21:45', '$2y$10$3x6/GBMZt5Bg4Ld54gDfw.j4tJUOMUfC5xug/rjIy6dtACR9TI6Ii'),
(165, 'ghjk', NULL, 'hlm123@gmail.com', '99443300', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-31 21:28:30', '2022-01-31 21:28:30', '$2y$10$6SlEG0AsUvoTKRMNSp7BE.bNtTe.1.fdTwXYCHi/Wapg0Yyr0MS46'),
(166, 'نرمين رمضان', NULL, 'bhj123@gmail.com', '99446622', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-31 23:17:35', '2022-01-31 23:17:35', '$2y$10$74CVukabZfpwNn4QQ31PN.4rET.nTZB3pksphtsy935X/J44R.NhO'),
(167, 'نرمين رمضان', NULL, 'pop@gmail.com', '99441122', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-01-31 23:59:24', '2022-01-31 23:59:24', '$2y$10$hr2ebXhd44JQwUGPDNGO4uN7G8b7VfBT7e/CEc7PaF/EDO.TZic2.'),
(168, 'nermeen', NULL, 'pop456@gmail.com', '99551100', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-01 01:03:34', '2022-02-01 01:03:34', '$2y$10$y7D9psdHGkLSXi28LXVfs./3bVeS7x4/WblqXhr3FsQpTEE5Rvc/.'),
(170, 'nermeen', NULL, NULL, '88779955', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, '2957', NULL, '2022-02-06 22:39:17', '2022-10-22 10:58:10', '$2y$10$UsN428Pk/nWFCcMkmaK3X.M7j6olx9p2GHdnbF2B1wkrfeJr4aQdW'),
(171, 'nermeen', NULL, NULL, '99112233', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 22:43:38', '2022-02-06 22:43:38', '$2y$10$QF2Y3P2yrQCLOb/PDgsdZeoQeOzHXUkE0S9ZUDatEx.TH5RzoqHl2'),
(172, 'api test', NULL, 'nm5687@gmail.com', '0111112132478', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 22:45:22', '2022-02-06 22:45:22', '$2y$10$KPfclt11du1kuAqV4tpQt.8/Hi0bb7N5pubLK2ar95Zaj7G08OzQu'),
(173, 'nermeen ramadan', NULL, NULL, '88552244', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 22:48:10', '2022-02-06 22:48:10', '$2y$10$SMKNxEKWxznqXrr7o8BwFOGONiU0OzezTPjt6ixkuUQwz/DhNCzJa'),
(174, 'nermeen ramadan', NULL, NULL, '88552240', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 22:50:28', '2022-02-06 22:50:28', '$2y$10$PZ09wgIYjxJULdpPi.9R5e6SXowHunXDpo.s3r48otXIEk8I2fsv.'),
(175, 'youssef', NULL, NULL, '88223311', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 22:55:44', '2022-02-06 22:55:44', '$2y$10$7NWJPOV5p.BCtQDktW7CkeP42Gv6DMN/1DSeU8ewkNrXoxYhk.o/G'),
(176, 'youssef', NULL, 'nm@gmail.com', '88223312', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 22:59:06', '2022-02-06 22:59:06', '$2y$10$ftjUH9WtmI5gV6elZLmOv.eKXL7pf0rChVV6rVKM.FRwGPUAeOZN2'),
(177, 'يوسف رمضان', NULL, NULL, '55112200', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 23:03:03', '2022-02-06 23:03:03', '$2y$10$Oc28B7xY3hh9KWzofI.sy.0t2wGFX4GkM.DgcLGvY7cOlJawkUoRW'),
(178, 'يوسف رمضان', NULL, 'g@gmail.com', '5511221', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 23:05:20', '2022-02-06 23:05:20', '$2y$10$wL98WQL.jTL10RqAWZOYkubJkK/rJGBH./DWsXMHhAiRcTbxqS8lK'),
(179, 'يوسف رمضان', NULL, NULL, '5511224', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 23:05:37', '2022-02-06 23:05:37', '$2y$10$ErZSjizB5z4d3Z.9oLjlWuRhu0RRihfhW2ATc1nsBpg1h99DpvXqa'),
(180, 'ramadan', NULL, NULL, '55776600', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 23:10:41', '2022-02-06 23:10:41', '$2y$10$aV6q1zJEN451OK4zd9CAG.Hqz6YCBhTXL9V85x7HKjSZWWbb8xNTG'),
(181, 'يوسف رمضان', NULL, NULL, '66447711', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-07 00:23:29', '2022-02-07 00:23:29', '$2y$10$WNWJIr/YXlpDVKfaWaHGf.8NYT9XVVSbMVxmIPsK3pluq9L6KnlMC'),
(182, 'يوسف رمضان', NULL, NULL, '66447710', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-07 00:24:45', '2022-02-07 00:24:45', '$2y$10$cZgIs2Lha5iENO/shOrQO.HvAk7.K3YZJW98IpqblXHNZ1sBthNca'),
(183, 'يوسف رمضان', NULL, NULL, '99224433', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-07 00:27:04', '2022-02-07 00:27:04', '$2y$10$6gb5eypSq3FOzbAeZvrtYuVjN5MPzlH5/StAG8hJwwj3a3EgDGrXi'),
(184, 'محمد', NULL, NULL, '88221177', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-07 00:32:43', '2022-02-07 00:32:43', '$2y$10$Lyr2VGhhPQJ5ygRMWA7hf.ebJ7Xy2bNoV5AGp4ujPHQ2xyEz.LJwq'),
(186, 'bluezone', 'web', 'mh.1984@hotmail.com', '56584493', 'public/assets/images/users/186_1649095937.jpg', 4, 1, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-02-24 21:11:35', '2022-04-05 04:12:17', '$2y$10$X3CAsF/ETbn9iGoBge8HVuWlbopYhfAhNSGDYOSbxR3ptigGNcemG'),
(187, 'ebraheem', NULL, NULL, '99554455', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-24 21:35:55', '2022-02-24 21:35:55', '$2y$10$YapP28psLuQd8H7n.7JJvuoaVdd26e9/zBt44ivmF9PBVCFyVoHqm'),
(188, 'asd', NULL, NULL, '99445522', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-24 21:41:25', '2022-02-24 21:41:25', '$2y$10$7v5yWUC/xDjrGbiLQdYD9e8T3/hCQ.zcIhVe9AY7EcdmT0jmAC4Ni'),
(189, 'asd', NULL, NULL, '99445532', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-24 21:42:10', '2022-02-24 21:42:10', '$2y$10$j3yeTgrRatrp1KJoPiMMfuGXblofL5mWw5BQgDVtrR/nY1W2k.4VO'),
(190, 'api test', NULL, NULL, '0111112132459', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-24 21:44:46', '2022-02-24 21:44:46', '$2y$10$q3dMYboPkX18EuhqeVJp1Of9UBys8W9461YARrjwa3.Ug9klz.A9O'),
(191, 'api test', NULL, NULL, '0111112132450', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-24 21:46:17', '2022-02-24 21:46:17', '$2y$10$spIBDQyZaRin97e6.HTsbupBUyKJJVMZnUIfr9TqwEJF/4fe210K6'),
(192, 'api test', NULL, NULL, '01111121324522', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-24 22:09:23', '2022-02-24 22:09:23', '$2y$10$u0KwMR7J720NrmoFlmvafuFFiAqrE7E33vvVCa/yeum9JqGR1wNFa'),
(193, 'fghh', NULL, NULL, '99557722', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-02-24 22:09:40', '2022-02-24 22:10:07', '$2y$10$m91B6Sz22KSvWoFqAp5QOum1pQUa6oDSwCZrVEC0J.geQPx2ukDeq'),
(194, 'api test', NULL, NULL, '0111112132401', NULL, 4, NULL, NULL, 0, NULL, '64884894894894984894984984', NULL, NULL, NULL, '2022-02-24 22:10:14', '2022-07-02 13:47:56', '$2y$10$VB/Gns.ya1cAS.xc5JLS6OuuKMqi/C/TnVjTLRHQTXeTs6elJzVue'),
(195, 'api test', NULL, NULL, '0111112132400', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-02-24 22:17:25', '2022-02-24 22:23:06', '$2y$10$dvV5Zl603WGnYBZfmKtDmOnYVLmODJcqiXWr6C51as/fkAsPEbYMK'),
(196, 'api test', NULL, NULL, '0111112132402', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-02-24 22:19:58', '2022-02-24 22:22:55', '$2y$10$XbKsM6mhRJkWD998Dekqae8Hnyf2oMcPqIEhgTe45dsZTLLmDUViO'),
(197, 'api test', NULL, NULL, '0111112132403', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-02-24 22:20:47', '2022-02-24 22:22:43', '$2y$10$WRuizZYuaJ8cyOM/0u/G3.ahjydbrsQ/NHn/P9XIP9snqMD/RcnOa'),
(198, 'نرمين', NULL, NULL, '99557720', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-02-25 23:25:28', '2022-02-25 23:26:01', '$2y$10$lGqxS9aydouRF9kHpe0xOe3UiCz3DbwlP8LdLzJt4SshWbnz9CoS.'),
(199, 'nermeen ramadan', NULL, NULL, '99442233', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-02-26 19:51:42', '2022-02-26 19:53:13', '$2y$10$JIYD9a4cIO9CYFHkaODf/O1XeFe0Nm2FOzg0WWzhNuQYzvRy47NFi'),
(200, 'bluezone', NULL, 'mh.1983@hotmail.com', '51070847', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-27 21:43:49', '2022-03-02 00:43:36', '$2y$10$.dyL5xW78LX/aYDZBzZb8u13O65jscG6kK/81f2gINRuCeW4rUdRC'),
(201, 'bazarkw', NULL, 'bazar.alkuwait@gmail.com', '56584496', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-28 21:14:00', '2022-02-28 21:14:00', '$2y$10$tXPvP1ySy1Q9ZkDLfM4qTeSuHOftwWk68VMJCh.BZpZjdxn.IsnNm'),
(202, 'mahmoud3m', 'edwde', 'mostafshata9@yahoo.com', '01111121324010', 'public/assets/images/users/202_1648415712.jpg', 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-03-01 17:11:21', '2022-04-04 08:48:47', '$2y$10$JydcDPzX9g6zEJ4P2TsbIOju.wf.z/PTza6ZDPgXwImqseI.lXI0O'),
(203, 'mohamed', 'elshafee', 'bluezon.adv@gmail.com', '97244282', 'public/assets/images/users/203_1650635500.jpg', 4, NULL, '1983-09-21', 0, NULL, '', NULL, NULL, NULL, '2022-03-02 02:20:30', '2022-08-28 16:23:24', '$2y$10$r4/HSbhs4lEDy9G6F0Z9YeB6IRZb9jTutw12vejAdfZ3xOPgtFxxa'),
(204, 'ebraheem', NULL, 'hema31@gmail.com', '22446622', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-03-13 18:41:00', '2022-03-13 18:41:21', '$2y$10$yeKY11pUNpDgHkMPIlIq..zjS6D72xsJTr5nI0/N4FFogXb.8jbLm'),
(205, 'ebraheem', 'ramadan', 'hema22@gmail.com', '99558860', 'public/assets/images/users/205_1648994015.jpg', 4, 1, '1992-10-12', 0, NULL, '', NULL, '5943', NULL, '2022-03-22 19:25:44', '2022-08-22 14:09:44', '$2y$10$dIZTLQzo/O3jez9rZRqnU.2FX1IHbe7LaoxbcaeopGwgVodzHAzcm'),
(206, 'amal', NULL, 'h@h.hh', '201220858451', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-03-28 08:24:40', '2022-03-28 08:25:42', '$2y$10$3Y3nxj2WO6odlnckuRZVtewyiGUPP91w0FhOMNPkYvo/n/72iZ6LC'),
(207, 'amal', 'elgalant', 'h@h.hhh', '55555555', NULL, 4, 1, '1988-03-06', 0, NULL, '', NULL, NULL, NULL, '2022-03-28 08:25:10', '2022-04-15 00:51:39', '$2y$10$js42kzHtlJRuhZZgtOOv3.sCAUM4IuLX5ODyoOgeZ1Gby35BsimC.'),
(208, 'bazar', NULL, 'kusaq8@gmil.com', '55082871', 'public/assets/images/users/208_1648753950.jpg', 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-01 04:52:47', '2022-04-01 05:12:30', '$2y$10$W87qIBSxEX6BPry4gpgwN.uYIMm2iGaLeZ1aE3zJuM1Fa39Yr6SF.'),
(209, 'ebraheem', NULL, NULL, '01062015106', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-04-01 07:09:50', '2022-04-12 07:57:30', '$2y$10$Yrj27BtAjxsl4tN7uyXPKumB0VoLTVaQK3kwTF1RnxCCZgQdMve9W'),
(210, 'ebraheem amin', NULL, NULL, '01028626575', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-01 07:20:46', '2022-04-01 07:20:46', '$2y$10$izUrjHV6YGuDnE5t6OdgC.J4VTIwDnPNA.ReJXxa69F5.5RvnCI8y'),
(212, 'ramadan', NULL, NULL, '99999999', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-04-17 06:48:05', '2022-04-17 06:48:29', '$2y$10$AkIZeqGQHLuiebPNwYA6COE4ImOa2Hu2fg2gyoQE5PUwOojsCtEQe'),
(213, 'زهراء', NULL, 'om-albanat86@hotmail.com', '99303856', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-04-17 10:35:06', '2022-04-17 10:37:32', '$2y$10$Ms3wqf.HT7W92o2JTJ8Q2O.F2rGSIE9PgmnnsdTg93tYvguhHjQJW'),
(214, 'Amani', NULL, 'amoonabyar@gmail.com', '94907778', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-18 03:26:42', '2022-04-18 03:26:42', '$2y$10$pmnW4eLrJKeM8.vO8lCgYeFw0wFKGGci86gDa/Gox0qFkWcGdqQy2'),
(215, 'sarahqahtani', NULL, 'sarahalqahtani15@yahoo.com', '97869944', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-18 09:20:25', '2022-04-18 09:20:25', '$2y$10$greTVPq4dwL3jkZmS4eSd.uPrETcME7Y4RjBTU4UrdcRBL779V5Eu'),
(216, 'youssef', NULL, 'you234@gmail.com', '88776622', NULL, 4, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-04-20 00:22:52', '2022-04-20 00:23:49', '$2y$10$JzDfOhwjYk7Q2kDHiuWfK.jmlicLLdcUl4dMDANNqxOfijBsfptA.'),
(217, 'firas abdel jaber', NULL, 'firasassaf3@yahoo.com', '0097433583471', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-25 02:31:06', '2022-04-25 02:31:06', '$2y$10$6yyacrdHv4U/yp/eiINkqOsFP4tMC1AbAeAbpibAYbT/fTXNQFVVa'),
(218, 'Naomi Holmes', NULL, 'dyxideqi@mailinator.com', '011146469865', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-26 04:34:27', '2022-04-26 04:37:24', '$2y$10$yfyBiD8mA9gcpQ3OlVVXEenJpypmJ4/ZCe8Pyr9dSkZn1BLCzJR6S'),
(219, 'Zachery Sloan', NULL, 'mepikeb@mailinator.com', '1525252205', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-26 04:38:33', '2022-04-26 04:38:33', '$2y$10$Fc3P2/27VJf3AEYLA0CpT.pYpCVz2bSN1TjWCjDvGYQeTbqvnUeIa'),
(220, 'Doris Padilla', NULL, 'suvuxegifo@mailinator.com', '748585785', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-26 04:43:08', '2022-04-26 05:10:43', '$2y$10$x.A6L8HI470qbZIu8NDaoeFbf1Hv6LSB8uHV8dxYadaFuAYE3vjo2'),
(221, 'hifaa', NULL, NULL, '99943286', NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-04-26 18:00:02', '2022-06-25 15:36:03', '$2y$10$nqJW4uwPQk0dd1/fn7I9.uNqwaBssFzR7.xATz8WPc8EXPHNMK/bO'),
(222, 'Ahm elss', NULL, 'e1@gmail.com', '50970584', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-05-12 14:18:57', '2022-05-12 14:18:57', '$2y$10$kn3T70C1V8XcOPcLF9NN.uDchsIDdTiFkNQ.Ghyp5jbEc/89eqNAe'),
(223, 'Ulric Solomon', NULL, 'rodo@mailinator.com', '201126405658', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-05-14 15:54:09', '2022-05-14 15:54:09', '$2y$10$7wPUTeVbXGAKHrtcMIAjO.NfFyQnqvKsa59pbslqb9yVHzAcz4.Dy'),
(224, 'Neve Pitts', NULL, 'coguviqa@mailinator.com', '0142525255', NULL, 7, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-05-15 11:30:04', '2022-05-15 11:30:04', '$2y$10$rVMQ61p.ud81gXEOmRdYqOu3qsfocTdeQyjlFglm1R1mZFnNJF3x.'),
(225, 'حمود', NULL, NULL, '12121212', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-05-16 01:29:33', '2022-05-16 01:29:33', '$2y$10$vfICi4rWh1GU7Ud7wJx8cOn.hYX14leOePL.cDf/1cs12uk7CVV7O'),
(226, 'علي', NULL, NULL, '55552528', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-05-16 01:33:24', '2022-05-16 01:33:24', '$2y$10$MGbM3rp1o3HouE1YxQnwSejJ1ujCS9T.hEiab2p/vZ47i9ShhPPA6'),
(227, 'ابو مجمد', NULL, NULL, '0096566336262', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-05-18 13:40:08', '2022-05-18 13:40:08', '$2y$10$DNORdfh5sy1IMepJjUyQ7OH0BykaVW37LUbA/gNZPpdz64QX3i7Sq'),
(228, 'أبو محمد', NULL, NULL, '66336262', NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-05-18 20:36:12', '2022-05-18 20:54:28', '$2y$10$f7LwbTjV7aH.jJObyiUP/u8CYS4tnj.UFtDLHTRpdpRDMKj8k4eh2'),
(229, 'Islam Ramadan', NULL, 'eslam.iniesta@gmail.com', '01100618113', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-05-23 18:43:37', '2022-06-07 12:38:31', '$2y$10$rQYQxuo10Dyiw4OVll6u.ebbMsVTKc0HwTNx8vc3pnpxvu6q1prt6'),
(230, 'Hayes Benjamin', NULL, 'i@gmail.com', '0325215412', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-05-28 17:11:31', '2022-05-28 17:11:31', '$2y$10$VVLTGSVxr8o8fnoJ2LbVdO.fxtJsymA0gJfxwsIRGJPJvz5vmaPy2'),
(231, 'صباح جابر', NULL, 'Ruby22hardy@gmail.com', '66604380', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-02 20:53:43', '2022-06-02 20:53:43', '$2y$10$p.Qe5oDgmptMNVR8ZwzxK.LqmjaD5e0qGVCaG/Ul0FFMoEIHDJuBy'),
(232, 'سعاد الرشيدي', NULL, NULL, '99189913', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-03 00:52:04', '2022-06-03 00:52:04', '$2y$10$3aKDwxjKM/busZRCrboDP.Ysv7rBESpRwui.jbu0moezcs.JJ87VO'),
(233, 'Laila', NULL, 'mm150m@hotmail.com', '66201381', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-03 02:22:01', '2022-06-03 02:22:01', '$2y$10$I91GZ2NNzYpxPig42.sRIeRyyp37SfTjUMMtcW.1ianDkR2JG7J2K'),
(234, 'صبيحه فاضل حسن', NULL, 'q8al7oor@gmail.com', '0096550445533', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-03 12:39:17', '2022-06-03 12:39:17', '$2y$10$gJhi67KzXb8m5LFgPe7IHOyF3ddquzNQsA7KaWf7BNuOc50zx3HAy'),
(235, 'منو العنزي', NULL, NULL, '55566229', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-04 02:13:32', '2022-06-04 02:13:32', '$2y$10$8nBWQYz6IzuizP55zv0oHOJ.PK05tie.IexLYhYKkVtdIXDlDYWi6'),
(236, 'eslam elaraby', NULL, 'anaelaraby8@gmail.com', '01110134775', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-06 03:26:53', '2022-06-06 03:26:53', '$2y$10$zPgtFvQajw6pxlwtk3/hq.5OkqFFMyTM.xIDHMzBAEkr/itWOp0m6');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `img`, `country_id`, `gender`, `birth_day`, `is_admin`, `email_verified_at`, `device_token`, `remember_token`, `activation_code`, `deleted_at`, `created_at`, `updated_at`, `password`) VALUES
(237, 'إيمان محمد سامي محمد حسونه', NULL, NULL, '99627040', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-07 12:31:44', '2022-06-07 12:31:44', '$2y$10$Bvgwopg6VSQ7SIDFaduZ5eiWdW1xgA1Woalw.a7G48GRzrfy.Hhve'),
(238, 'رولا', NULL, NULL, '65937015', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-08 15:46:59', '2022-06-08 15:46:59', '$2y$10$u4eW6tirHq33BEHMg6B3E.T0SHsZIS3dGJthcV1Y4cfuUGecO1HF6'),
(239, 'ناديه العجمي', NULL, 'fgrhhfj@dhjhxhj.com', '٥٠٧٠٥٢٠٢', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-09 00:57:30', '2022-06-09 00:57:30', '$2y$10$JaUU8SJDbOIO4Kn/9YoDt.pQMxCMsZDn78/vZT3WtD2kHf/xWqyke'),
(240, 'нинн', NULL, NULL, '+380684168953', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-09 07:15:16', '2022-06-09 07:15:16', '$2y$10$V5yZ4sowRhRoT4fylNoiDOeAEc3GB8QOdPIwPq6YF7G8ojhxsbv9y'),
(241, 'нинн', NULL, NULL, '+996707001486', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-09 07:15:38', '2022-06-09 07:15:38', '$2y$10$P7f1JEjm6VgDKXAbynRj/OIxdmUNtwYJYtbpMRx1z3oRH12F8BJYu'),
(242, 'Zenely', NULL, 'zenelydsouza@gmail.com', '90995788', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-09 13:05:41', '2022-06-09 13:05:41', '$2y$10$RoHo6oiFFpb6/9j.sBqNSepCUvhgkz/RIqjPndJ2nyc6ORG.kNLuG'),
(243, 'نها', NULL, NULL, '97725880', NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-06-10 02:24:44', '2022-06-10 02:26:05', '$2y$10$7nT.DcP57LulTXMP./67veLeohInqoTyXXLgZBk1lMhXkkwuf5W/6'),
(244, 'نها', NULL, NULL, '0096597725880', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-10 02:25:18', '2022-06-10 02:25:18', '$2y$10$ScgdYVz1Ceah3MrBlyg8/ObChjfzQlmZQvCo.WrmOF2muOmgzVwdW'),
(245, 'haidy', NULL, NULL, '94008816', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-10 19:48:29', '2022-06-10 19:48:29', '$2y$10$9ub7Pd.tiMoS2yV1c6.AN.DrkKbBqin2dl/E1De9btid7X3HKfCtO'),
(246, 'doodo elmasry', NULL, NULL, '‎+965 507 23014', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-10 19:55:20', '2022-06-10 19:55:20', '$2y$10$WAXv9eg1QFWNJ1R8ozPLwef79JA5oqaillQ4tl4NKRr8J9tmNyGtC'),
(247, 'batool', NULL, 'Tootaa-25@hotmail.com', '98774464', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-15 22:32:45', '2022-06-15 22:32:45', '$2y$10$.eAKIYhMsgEKfR2gsDaH5e7zW4Yhv8AFhYlB4cb0PAa8adWZD.Bke'),
(248, 'Hanadi Alshammari', NULL, NULL, '90010152', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-15 22:47:21', '2022-06-15 22:47:21', '$2y$10$6hqdE663tJDWVsxe0Dng7OPRglJFE.1OgLoPsxjFM9bwN4kpcx7pS'),
(249, 'Ghadeer Alenezi', NULL, 'R-A-M3@hotmail.com', '56614770', NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-06-15 23:20:37', '2022-06-15 23:47:38', '$2y$10$EXXOS1i99I87V9i.Ii1pOerNg15f2ShkjNe9VFUdukzOzKO05HTI2'),
(250, 'kga', NULL, NULL, '447537300300', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-19 06:00:55', '2022-06-19 06:00:55', '$2y$10$aDK2MdwxbMwEGE7QM6/b6e/b45G5MLS2oBIPddeXisQtFI/tm3gQu'),
(251, 'kga', NULL, NULL, '+447537300300', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-19 06:01:39', '2022-06-19 06:01:39', '$2y$10$U.2gi5VLIn3ZR6uu./CmvuX2vOqggTWPubDXEF5W5hhTP7zNaohUi'),
(252, 'kga', NULL, NULL, '447537300300+', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-19 06:02:07', '2022-06-19 06:02:07', '$2y$10$MpB46Zv.KARuYNJ4Cqw2Z.IWjNn18jKHT6lgXAYbO.z.3XiWVZbLi'),
(253, 'eman alnbhan', NULL, NULL, '55121552', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-25 03:10:22', '2022-06-25 03:10:22', '$2y$10$ddeSInaooWqVxfl.37HeuencKm73wKeAdv/u4bHlUN8wLppuvcjbK'),
(254, 'ahmed2', NULL, NULL, '99427261', NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-06-25 12:20:52', '2022-06-25 12:58:05', '$2y$10$m8mn9gQG/v9A/5wOHxFw1exJubCfS0pRzPiRCqBx.ceXDKZGCO4xC'),
(255, 'asmaa', NULL, 'nn45@gmail.com', '22778895', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-25 17:02:57', '2022-06-25 17:02:57', '$2y$10$4mHUKhrUikIxpYaaU95lpeUrpan0Mnq3xAqG7snsc.Pe8khnLFGEy'),
(256, 'fdfd', NULL, NULL, '88112277', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-25 20:19:40', '2022-06-25 20:19:40', '$2y$10$4q0l6tkd.n.bifxQzsN4UuVh7TN1QFd8kdbNHWNX7X.JEg3NMpC7y'),
(257, 'Fatoom', NULL, 'fatoom-otaibi@hotmail.com', '98999266', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-28 09:46:37', '2022-06-28 09:46:37', '$2y$10$5oxtQhhlza0a29Kxwt9jtO1Yf/W7kRpiiKim57tSn3nRO13L5PuJG'),
(258, 'فاطمة الشمري', NULL, 'Fatemahabd225@gmail.com', '65969970', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-28 18:59:41', '2022-06-28 18:59:41', '$2y$10$8QLt.bdpFMXVpgVeV198OeY4hocETSi0GP1stcqZaExMuEtSJ1ar6'),
(259, 'zahraa abdullah', NULL, 'zahraaaa20.48f@gmail.com', '94408611', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-28 21:10:23', '2022-06-28 21:10:23', '$2y$10$29mDrz4bATmFsTE0EmR5EuShVPLRnLYDeAuvnu2w/SmRKiOe8d8py'),
(260, 'Ali ashkanani', NULL, 'shawhar1999@gmail.com', '97677655', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-29 00:46:29', '2022-06-29 00:46:29', '$2y$10$c6Ek6w6w1C3kBDaE6LqqX.zVtrhZfmZ7OkkMqj2K7TXdzpuAsnzIm'),
(261, 'شوق أيمن أحمد معروف', NULL, 'shougaa97l@gmail.com', '63330701', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-29 01:39:24', '2022-06-29 01:39:24', '$2y$10$3ZqWleRPAv/qG7WTKpIHcOzO5bSNyE.71A6ebm5Tq/.1hlcdVuaGq'),
(262, 'fatma', NULL, NULL, '97393300', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-29 02:43:44', '2022-06-29 02:43:44', '$2y$10$wKSUaKLeHtTeP9Vbcw5CVuQj7SK9YT.N13uRuvfhT1Xpc/0EbuYAa'),
(263, 'mariam', NULL, NULL, '55827754', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-29 02:48:04', '2022-06-29 02:48:04', '$2y$10$/L0Xe6244UJ3FRNBu14rh.b6lYPyksun3jF2ZGGvlZRQMybyW1Xuq'),
(264, 'NADA', NULL, NULL, '66935278', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-29 02:50:59', '2022-06-29 02:50:59', '$2y$10$ysmc3pJoZBVvZgd8luGTY.ubXL2b8S0asLaCCJZCfOaXa//LW98sW'),
(265, 'دنيا عبد الرزاق', NULL, NULL, '98550520', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-29 09:48:56', '2022-06-29 09:48:56', '$2y$10$bsy5X.L8PoH.xhk76sRzyuA7GohexqHu0yn63OfEyftFexMvOTm/a'),
(266, 'فاطمة الحداد', NULL, NULL, '66422161', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-06-29 10:47:31', '2022-06-29 10:47:31', '$2y$10$smMlAkY0pgkGb4nwK6apbeaDDTFTKzFwh3vr3aJQsprR2fTGvoYP.'),
(267, 'api test', NULL, NULL, '011111213240007', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-07-01 02:25:33', '2022-07-01 02:25:33', '$2y$10$M/LDw4PQmVVxslYVYGGVaeE.t1EHKsyqZi3ehWEh.dsGs0j6XiPu2'),
(268, 'fflfl', NULL, 'ff@gmail.com', '22446688', 'public/assets/images/users/268_1656759071.png', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-07-02 13:42:33', '2022-07-02 13:51:11', '$2y$10$ZA7JbObepPEJSfFA6coNUOFA.k2rxfh0joI5zF6llN.oHGU.e.1IG'),
(269, 'Mohamed esmael', NULL, 'mo.esmael.2019@gmail.com', '011464698650', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-07-02 19:19:51', '2022-07-02 19:19:51', '$2y$10$JCHBqkmI7KgctQJu1i2qd.PS3HILLBeeEuTKll8z2/zmIaSF1I36S'),
(270, 'soad', NULL, 'soadtala7@gmail.com', '00966569663862', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-07-19 01:33:13', '2022-07-19 01:33:13', '$2y$10$etLes.N7OVRAJbFmLUsMeONkYkm3MB5TlKasXdasTiIMMiccurwG6'),
(271, 'Gihan', NULL, 'nice.girl2025@yahoo.com', '01205618083', NULL, 7, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-07-19 19:52:38', '2022-07-19 19:52:38', '$2y$10$2j1Q6DUHhOWYnse63SQ.kep2UtVC6RoggkCxB.JXyDi9A8Mu4tf..'),
(272, 'hhddh', NULL, NULL, '77884422', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-07-24 01:49:50', '2022-07-24 01:49:50', '$2y$10$A6MTh5fTkp66aKaDmktp/.odBEMYregKCYCNhycQMigTMEglDwCyW'),
(273, 'api test', NULL, 'api420@test.com', '011111213240000', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-07-26 16:09:27', '2022-07-26 16:10:29', '$2y$10$lXkQM2G2PUrAGe0ttMg1e.wRldbVEd8Vp6pbjdlxfipzBgBL9EEry'),
(276, 'api test', NULL, NULL, '011111213240001', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-07-30 18:15:37', '2022-07-30 18:15:37', '$2y$10$gJcA51OvhbsZr9XJakJ2.uOB.gnrQyB.AY0PsB2A3YMlkwuaEXVhi'),
(277, 'فلاح ضيدان شارع المطيري', NULL, 'mnots669@gmail.com', '66766802', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-07-31 01:21:26', '2022-07-31 01:21:26', '$2y$10$M/lPsUyYs1Icgcwjvx63/uPnw0LsvkA3XLtqmSXXPNXshepX9vSFO'),
(278, 'Mansour Alshammari', NULL, 'mn9or-1234@hotmail.com', '90004626', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-08-06 19:40:48', '2022-08-06 19:40:48', '$2y$10$PRMEJyNrpU.fKhg4dFy51.fVh7FA2QcCzQPs/QHj4qTmowRb1xE3e'),
(279, 'Rr', NULL, 'bsbssb@shshs.com', '23721982725', NULL, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-08-10 12:39:08', '2022-08-10 12:39:08', '$2y$10$f4WBJBCd3cSKrIOmigGbuODGH1nXrbFGpRABqZxd.5uA8AnMF0MEu'),
(280, 'android', NULL, 'm@mmm.com', '204060', 'public/assets/images/users/280_1661529271.jpg', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-08-26 18:53:59', '2022-08-26 18:54:31', '$2y$10$KBd2dRtPPArNLwPQ8sFWLuCcuilHAeNZTV6NUVXy6C9/r6fBqTsfe'),
(281, 'محمد', NULL, 'a@a.com', '50909048', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-11-25 10:47:02', '2022-11-25 10:47:02', '$2y$10$LcRnuBUk4ENyM26qZqMTmOxlnuvGUOFkQDW8rz7pwfV4pr/qS7a0W'),
(282, 'Ali Mahmood', NULL, 'alielfar91@gmail.com', '0505791356', NULL, 7, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-12-07 15:49:31', '2022-12-07 15:50:38', '$2y$10$0V3Hg3Lj42StFg563G3hw.whyxzbJ/xzWP/ekwEGJsUmyJZxF03/q'),
(283, 'حسين محسن', NULL, 'sjah@gmail.com', '771621601', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-12-08 22:54:11', '2022-12-08 22:54:11', '$2y$10$VYpaouWuCnQcZql8ibvYduis26NdRq8k/k6ZXa64FaLKBrfFtq/kC'),
(284, 'ابراهيم محمد حسين الجعوني', NULL, NULL, '777364441', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-12-09 10:48:28', '2022-12-09 10:48:28', '$2y$10$x57DKAMMvngTgrLc0wknZ.u.lUQAQJXZeTvP8kA83Z.6xmmQUxojG'),
(285, 'ttt', NULL, 'ttt@ttt.com', '0000000000', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-12-12 19:25:02', '2022-12-12 19:25:02', '$2y$10$Bn00ArtmdaEkxJFO7vZ9cOEabwAQPQ340PaVvWJzlZghQRQYp15X2'),
(286, 'zeyad', NULL, 'zok3000@gmail.com', '777084664', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-12-12 21:11:48', '2022-12-12 21:11:48', '$2y$10$lLxJ19ID69C0s2N.BOO4fOCZbRmGwA5HQR64jtjRgi7d1jz8S32N2'),
(287, 'hawraa Hamza', NULL, 'hha94_@hotmail.com', '97776608', NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-12-16 04:32:05', '2022-12-16 04:32:05', '$2y$10$YR6xGalicSrBy8V4DbsyPe.lQ/m4eLQrSeDpcpA9VU5oj/36CBez.'),
(288, 'حسين الرصاص', NULL, 'alrassas10@gmail.com', '735891116', NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, '2022-12-18 05:41:59', '2022-12-18 05:45:46', '$2y$10$4zZf0Pe2xkgyXzrz6Te4J.BDnxQEAms.D0bmX.4rZmNlcZ/rVh4ja');

-- --------------------------------------------------------

--
-- Table structure for table `user_search`
--

CREATE TABLE `user_search` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_search`
--

INSERT INTO `user_search` (`id`, `user_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 64, 'قميص', '2022-02-01 03:49:55', '2022-02-01 03:49:55'),
(2, 64, 'قميص 2', '2022-02-01 03:54:10', '2022-02-01 03:54:10'),
(3, 64, 'تيشرت', '2022-02-01 04:10:06', '2022-02-01 04:10:06'),
(4, 64, 'احذية', '2022-02-01 04:13:01', '2022-02-01 04:13:01'),
(5, 64, 'ZARA', '2022-02-01 04:14:26', '2022-02-01 04:14:26'),
(6, 155, 'dff', '2022-02-04 22:20:00', '2022-02-04 22:20:00'),
(7, 155, 'd', '2022-02-04 22:20:00', '2022-02-04 22:20:00'),
(8, 155, 'df', '2022-02-04 22:20:00', '2022-02-04 22:20:00'),
(9, 155, 'ا', '2022-02-04 22:22:34', '2022-02-04 22:22:34'),
(10, 155, 'اح', '2022-02-04 22:22:34', '2022-02-04 22:22:34'),
(11, 155, 'احذ', '2022-02-04 22:22:35', '2022-02-04 22:22:35'),
(12, 155, 'احذي', '2022-02-04 22:22:36', '2022-02-04 22:22:36'),
(13, 155, 'احذيه', '2022-02-04 22:22:37', '2022-02-04 22:22:37'),
(14, 155, 'a', '2022-02-04 22:22:50', '2022-02-04 22:22:50'),
(15, 155, 'as', '2022-02-04 22:22:50', '2022-02-04 22:22:50'),
(16, 155, 'ش', '2022-02-04 22:41:20', '2022-02-04 22:41:20'),
(17, 155, 'شن', '2022-02-04 22:41:20', '2022-02-04 22:41:20'),
(18, 155, 'شنط', '2022-02-04 22:41:21', '2022-02-04 22:41:21'),
(19, 155, 'اخ', '2022-02-04 22:55:06', '2022-02-04 22:55:06'),
(20, 155, 'م', '2022-02-04 23:03:43', '2022-02-04 23:03:43'),
(21, 155, 'مل', '2022-02-04 23:03:43', '2022-02-04 23:03:43'),
(22, 155, 'ملا', '2022-02-04 23:03:43', '2022-02-04 23:03:43'),
(23, 155, 'ملاب', '2022-02-04 23:03:44', '2022-02-04 23:03:44'),
(24, 155, 'ملابس', '2022-02-04 23:03:44', '2022-02-04 23:03:44'),
(25, 155, 'شو', '2022-02-04 23:19:07', '2022-02-04 23:19:07'),
(26, 155, 'شوز', '2022-02-04 23:19:07', '2022-02-04 23:19:07'),
(27, 155, 'مي', '2022-02-04 23:26:46', '2022-02-04 23:26:46'),
(28, 155, 'ميك', '2022-02-04 23:26:46', '2022-02-04 23:26:46'),
(29, 155, 'ميكي', '2022-02-04 23:26:47', '2022-02-04 23:26:47'),
(30, 155, 'ميكيا', '2022-02-04 23:26:48', '2022-02-04 23:26:48'),
(31, 155, 'ميكياج', '2022-02-04 23:26:48', '2022-02-04 23:26:48'),
(32, 155, 'مك', '2022-02-05 03:46:25', '2022-02-05 03:46:25'),
(33, 155, 'مكي', '2022-02-05 03:46:26', '2022-02-05 03:46:26'),
(34, 155, 'مكيا', '2022-02-05 03:46:27', '2022-02-05 03:46:27'),
(35, 155, 'مكياج', '2022-02-05 03:46:27', '2022-02-05 03:46:27'),
(36, 155, 'س', '2022-02-05 03:46:44', '2022-02-05 03:46:44'),
(37, 155, 'ع', '2022-02-05 03:46:52', '2022-02-05 03:46:52'),
(38, 155, 'عط', '2022-02-05 03:46:53', '2022-02-05 03:46:53'),
(39, 155, 'عطو', '2022-02-05 03:46:53', '2022-02-05 03:46:53'),
(40, 155, 'عطور', '2022-02-05 03:46:54', '2022-02-05 03:46:54'),
(41, 155, 'عطوى', '2022-02-05 03:47:09', '2022-02-05 03:47:09'),
(42, 155, 'n', '2022-02-05 03:57:44', '2022-02-05 03:57:44'),
(43, 155, 'na', '2022-02-05 03:57:44', '2022-02-05 03:57:44'),
(44, 155, 'nak', '2022-02-05 03:57:45', '2022-02-05 03:57:45'),
(45, 155, 'nake', '2022-02-05 03:57:46', '2022-02-05 03:57:46'),
(46, 155, 'nakeup', '2022-02-05 03:57:47', '2022-02-05 03:57:47'),
(47, 155, 'nakeu', '2022-02-05 03:57:47', '2022-02-05 03:57:47'),
(48, 155, 'm', '2022-02-05 03:58:05', '2022-02-05 03:58:05'),
(49, 155, 'ma', '2022-02-05 03:58:06', '2022-02-05 03:58:06'),
(50, 155, 'mak', '2022-02-05 03:58:06', '2022-02-05 03:58:06'),
(51, 155, 'make', '2022-02-05 03:58:07', '2022-02-05 03:58:07'),
(52, 155, 'makup', '2022-02-05 03:58:11', '2022-02-05 03:58:11'),
(53, 155, 'maku', '2022-02-05 03:58:11', '2022-02-05 03:58:11'),
(54, 155, 's', '2022-02-05 03:58:19', '2022-02-05 03:58:19'),
(55, 155, 'sh', '2022-02-05 03:58:20', '2022-02-05 03:58:20'),
(56, 155, 'sho', '2022-02-05 03:58:20', '2022-02-05 03:58:20'),
(57, 155, 'shoe', '2022-02-05 03:58:21', '2022-02-05 03:58:21'),
(58, 155, 'shoes', '2022-02-05 03:58:22', '2022-02-05 03:58:22'),
(59, 155, 'dr', '2022-02-05 03:58:47', '2022-02-05 03:58:47'),
(60, 155, 'dre', '2022-02-05 03:58:47', '2022-02-05 03:58:47'),
(61, 155, 'dres', '2022-02-05 03:58:48', '2022-02-05 03:58:48'),
(62, 155, 'dress', '2022-02-05 03:58:48', '2022-02-05 03:58:48'),
(63, 155, 'f', '2022-02-05 04:09:03', '2022-02-05 04:09:03'),
(64, 155, 'fg', '2022-02-05 04:09:03', '2022-02-05 04:09:03'),
(65, 155, 'c', '2022-02-05 04:11:40', '2022-02-05 04:11:40'),
(66, 155, 'cl', '2022-02-05 04:11:41', '2022-02-05 04:11:41'),
(67, 155, 'clo', '2022-02-05 04:11:41', '2022-02-05 04:11:41'),
(68, 155, 'clot', '2022-02-05 04:11:44', '2022-02-05 04:11:44'),
(69, 155, 'cloth', '2022-02-05 04:11:44', '2022-02-05 04:11:44'),
(70, 155, 'clothe', '2022-02-05 04:11:45', '2022-02-05 04:11:45'),
(71, 155, 'clothes', '2022-02-05 04:11:45', '2022-02-05 04:11:45'),
(72, 155, 'clothese', '2022-02-05 04:11:46', '2022-02-05 04:11:46'),
(73, 155, 'clotheses', '2022-02-05 04:11:46', '2022-02-05 04:11:46'),
(74, 155, 'makupp', '2022-02-05 04:11:56', '2022-02-05 04:11:56'),
(75, 155, 'ثلاث', '2022-02-05 04:13:57', '2022-02-05 04:13:57'),
(76, 155, 'ثل', '2022-02-05 04:13:57', '2022-02-05 04:13:57'),
(77, 155, 'ثلاثق', '2022-02-05 04:13:57', '2022-02-05 04:13:57'),
(78, 155, 'ثلا', '2022-02-05 04:13:59', '2022-02-05 04:13:59'),
(79, 155, 'ث', '2022-02-05 04:14:00', '2022-02-05 04:14:00'),
(80, 155, 'g', '2022-02-05 04:48:18', '2022-02-05 04:48:18'),
(81, 155, 'ل', '2022-02-05 05:43:57', '2022-02-05 05:43:57'),
(82, 155, 'ال', '2022-02-05 06:04:51', '2022-02-05 06:04:51'),
(83, 155, 'ك', '2022-02-05 06:06:40', '2022-02-05 06:06:40'),
(84, 64, 't', '2022-02-05 18:19:21', '2022-02-05 18:19:21'),
(85, 155, 'ط', '2022-02-05 21:02:49', '2022-02-05 21:02:49'),
(86, 155, 'z', '2022-02-05 21:03:32', '2022-02-05 21:03:32'),
(87, 155, 'تيش', '2022-02-05 21:08:38', '2022-02-05 21:08:38'),
(88, 155, 'ر', '2022-02-05 21:08:45', '2022-02-05 21:08:45'),
(89, 155, 'رجال', '2022-02-05 21:08:49', '2022-02-05 21:08:49'),
(90, 155, 'ت', '2022-02-06 20:33:19', '2022-02-06 20:33:19'),
(91, 155, 'ف', '2022-02-06 20:47:17', '2022-02-06 20:47:17'),
(92, 204, 'w', '2022-03-14 00:45:48', '2022-03-14 00:45:48'),
(93, 186, 'و', '2022-04-05 04:14:20', '2022-04-05 04:14:20'),
(94, 205, 'k', '2022-04-05 22:42:02', '2022-04-05 22:42:02'),
(95, 205, 'h', '2022-04-05 23:17:07', '2022-04-05 23:17:07'),
(96, 205, 'e', '2022-04-06 09:28:49', '2022-04-06 09:28:49'),
(97, 205, 'v', '2022-04-06 09:29:16', '2022-04-06 09:29:16'),
(98, 205, 'b', '2022-04-06 09:29:26', '2022-04-06 09:29:26'),
(99, 205, 'j', '2022-04-10 05:00:29', '2022-04-10 05:00:29'),
(100, 205, 'q', '2022-04-11 05:20:11', '2022-04-11 05:20:11'),
(101, 207, 'r', '2022-04-20 10:50:58', '2022-04-20 10:50:58'),
(102, 207, '=', '2022-04-20 10:51:01', '2022-04-20 10:51:01'),
(103, 207, 'p', '2022-04-20 10:51:06', '2022-04-20 10:51:06'),
(104, 207, 'l', '2022-04-20 10:51:11', '2022-04-20 10:51:11'),
(105, 203, 'stup', '2022-04-23 09:51:08', '2022-04-23 09:51:08'),
(106, 211, 'florid', '2022-04-27 06:10:12', '2022-04-27 06:10:12'),
(107, 203, 'ترتر', '2022-05-21 12:40:29', '2022-05-21 12:40:29'),
(108, 203, 'طقم قطعتين ترتر', '2022-05-21 12:40:49', '2022-05-21 12:40:49'),
(109, 205, 'فستان', '2022-05-29 00:17:36', '2022-05-29 00:17:36'),
(110, 205, 'فستان العيد', '2022-05-29 00:18:03', '2022-05-29 00:18:03'),
(111, 205, 'فس', '2022-05-29 13:41:25', '2022-05-29 13:41:25'),
(112, 205, 'فس تل', '2022-05-29 13:41:27', '2022-05-29 13:41:27'),
(113, 205, 'فس تعتبر ت', '2022-05-29 13:41:40', '2022-05-29 13:41:40'),
(114, 205, 'فس تعتبر تان', '2022-05-29 13:41:42', '2022-05-29 13:41:42'),
(115, 205, 'فس تعتبر تا', '2022-05-29 13:41:45', '2022-05-29 13:41:45'),
(116, 205, 'فس ت', '2022-05-29 13:41:47', '2022-05-29 13:41:47'),
(117, 205, 'فس تعت', '2022-05-29 13:41:48', '2022-05-29 13:41:48'),
(118, 205, 'فس تعتبر', '2022-05-29 13:41:50', '2022-05-29 13:41:50'),
(119, 205, 'فم', '2022-05-29 13:41:53', '2022-05-29 13:41:53'),
(120, 205, 'فس تع', '2022-05-29 13:41:56', '2022-05-29 13:41:56'),
(121, 205, 'فس تعتب', '2022-05-29 13:41:56', '2022-05-29 13:41:56'),
(122, 205, 'wood', '2022-05-29 13:41:58', '2022-05-29 13:41:58'),
(123, 205, 'wooden', '2022-05-29 13:41:58', '2022-05-29 13:41:58'),
(124, 205, 'wo', '2022-05-29 13:42:02', '2022-05-29 13:42:02'),
(125, 205, 'woode', '2022-05-29 13:42:02', '2022-05-29 13:42:02'),
(126, 205, 'woo', '2022-05-29 13:42:05', '2022-05-29 13:42:05'),
(127, 205, 'ey', '2022-05-29 13:48:09', '2022-05-29 13:48:09'),
(128, 205, 'eye', '2022-05-29 13:48:12', '2022-05-29 13:48:12'),
(129, 205, 'dresss', '2022-05-29 13:49:21', '2022-05-29 13:49:21'),
(130, 205, 'eys', '2022-05-29 13:49:36', '2022-05-29 13:49:36'),
(131, 205, 'eyes', '2022-05-29 13:49:43', '2022-05-29 13:49:43'),
(132, 205, 'u', '2022-05-29 14:28:14', '2022-05-29 14:28:14'),
(133, 205, 'un', '2022-05-29 14:28:24', '2022-05-29 14:28:24'),
(134, 205, 'uni', '2022-05-29 14:28:24', '2022-05-29 14:28:24'),
(135, 205, 'uniqu', '2022-05-29 14:28:29', '2022-05-29 14:28:29'),
(136, 205, 'unique', '2022-05-29 14:28:35', '2022-05-29 14:28:35'),
(137, 205, 'uniq', '2022-05-29 14:28:39', '2022-05-29 14:28:39'),
(138, 205, 'my', '2022-05-29 14:29:21', '2022-05-29 14:29:21'),
(139, 205, 'am', '2022-05-29 14:29:36', '2022-05-29 14:29:36'),
(140, 205, 'ameri', '2022-05-29 14:29:38', '2022-05-29 14:29:38'),
(141, 205, 'ameriv', '2022-05-29 14:29:39', '2022-05-29 14:29:39'),
(142, 205, 'ame', '2022-05-29 14:29:41', '2022-05-29 14:29:41'),
(143, 205, 'amer', '2022-05-29 14:29:41', '2022-05-29 14:29:41'),
(144, 205, 'american', '2022-05-29 14:29:45', '2022-05-29 14:29:45'),
(145, 205, 'america', '2022-05-29 14:29:45', '2022-05-29 14:29:45'),
(146, 205, 'americ', '2022-05-29 14:29:52', '2022-05-29 14:29:52'),
(147, 205, 'ameriv=', '2022-05-29 14:29:54', '2022-05-29 14:29:54'),
(148, 205, 'ameriv=c', '2022-05-29 14:30:02', '2022-05-29 14:30:02'),
(149, 205, 'ad', '2022-05-29 14:31:42', '2022-05-29 14:31:42'),
(150, 205, 'fluffy', '2022-05-29 14:35:39', '2022-05-29 14:35:39'),
(151, 205, 'fl', '2022-05-29 14:35:39', '2022-05-29 14:35:39'),
(152, 205, 'fluff', '2022-05-29 14:35:41', '2022-05-29 14:35:41'),
(153, 205, 'fluf', '2022-05-29 14:35:42', '2022-05-29 14:35:42'),
(154, 205, 'flu', '2022-05-29 14:35:44', '2022-05-29 14:35:44'),
(155, 205, 'fluffy d', '2022-05-29 14:35:55', '2022-05-29 14:35:55'),
(156, 205, 'fluffy dres', '2022-05-29 14:35:56', '2022-05-29 14:35:56'),
(157, 205, 'fluffy dress', '2022-05-29 14:35:56', '2022-05-29 14:35:56'),
(158, 205, 'fluffy dr', '2022-05-29 14:35:59', '2022-05-29 14:35:59'),
(159, 205, 'eid', '2022-05-29 14:36:05', '2022-05-29 14:36:05'),
(160, 205, 'eid dr', '2022-05-29 14:36:07', '2022-05-29 14:36:07'),
(161, 205, 'ei', '2022-05-29 14:36:09', '2022-05-29 14:36:09'),
(162, 205, 'eid dres', '2022-05-29 14:36:09', '2022-05-29 14:36:09'),
(163, 205, 'eid dre', '2022-05-29 14:36:10', '2022-05-29 14:36:10'),
(164, 205, 'eid dress', '2022-05-29 14:36:12', '2022-05-29 14:36:12'),
(165, 205, 'Eiddre', '2022-05-29 14:36:14', '2022-05-29 14:36:14'),
(166, 205, 'Eiddres', '2022-05-29 14:36:15', '2022-05-29 14:36:15'),
(167, 205, 'Eiddress', '2022-05-29 14:36:16', '2022-05-29 14:36:16'),
(168, 205, 'Eidd', '2022-05-29 14:36:20', '2022-05-29 14:36:20'),
(169, 205, 'Eiddr', '2022-05-29 14:36:21', '2022-05-29 14:36:21'),
(170, 205, 'fluffy dre', '2022-05-29 14:36:22', '2022-05-29 14:36:22'),
(171, 205, 'eid d', '2022-05-29 14:36:30', '2022-05-29 14:36:30'),
(172, 205, 'eid dresss', '2022-05-29 14:37:11', '2022-05-29 14:37:11'),
(173, 205, 'eid dree', '2022-05-29 14:37:20', '2022-05-29 14:37:20'),
(174, 205, 'flur', '2022-05-29 14:37:34', '2022-05-29 14:37:34'),
(175, 205, 'flurr', '2022-05-29 14:38:14', '2022-05-29 14:38:14'),
(176, 205, 'eo', '2022-05-29 14:39:15', '2022-05-29 14:39:15'),
(177, 205, 'uniqy', '2022-05-29 14:55:41', '2022-05-29 14:55:41'),
(178, 205, 'طق', '2022-07-20 11:06:31', '2022-07-20 11:06:31'),
(179, 205, 'طقم', '2022-07-20 11:06:31', '2022-07-20 11:06:31'),
(180, 205, 'طقم ا', '2022-07-20 11:06:33', '2022-07-20 11:06:33'),
(181, 205, 'طقم اط', '2022-07-20 11:06:33', '2022-07-20 11:06:33'),
(182, 205, 'طقم اطف', '2022-07-20 11:06:34', '2022-07-20 11:06:34'),
(183, 205, 'طقم اطفا', '2022-07-20 11:06:34', '2022-07-20 11:06:34'),
(184, 205, 'طقم اطفال', '2022-07-20 11:06:34', '2022-07-20 11:06:34'),
(185, 283, 'كا', '2022-12-08 22:58:01', '2022-12-08 22:58:01'),
(186, 283, 'كاج', '2022-12-08 22:58:01', '2022-12-08 22:58:01'),
(187, 283, 'كاجو', '2022-12-08 22:58:02', '2022-12-08 22:58:02'),
(188, 283, 'كاجوا', '2022-12-08 22:58:02', '2022-12-08 22:58:02'),
(189, 283, 'كاجوال', '2022-12-08 22:58:02', '2022-12-08 22:58:02'),
(190, 284, 'اث', '2022-12-13 11:40:11', '2022-12-13 11:40:11'),
(191, 284, 'اثا', '2022-12-13 11:40:12', '2022-12-13 11:40:12'),
(192, 284, 'اثاث', '2022-12-13 11:40:12', '2022-12-13 11:40:12'),
(193, 282, 'ما', '2022-12-16 19:40:41', '2022-12-16 19:40:41'),
(194, 282, 'مان', '2022-12-16 19:40:41', '2022-12-16 19:40:41');

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

CREATE TABLE `wish_list` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

--
-- Dumping data for table `wish_list`
--

INSERT INTO `wish_list` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 100, 156, '2021-09-05 23:45:34', '2021-09-05 23:45:34'),
(7, 154, 39, '2021-09-07 01:49:11', '2021-09-07 01:49:11'),
(10, 98, 157, '2022-04-03 01:42:04', '2022-04-03 01:42:04'),
(13, 102, 159, '2022-04-03 18:24:05', '2022-04-03 18:24:05'),
(14, 109, 151, '2022-04-13 05:44:39', '2022-04-13 05:44:39'),
(15, 110, 151, '2022-04-13 05:44:49', '2022-04-13 05:44:49'),
(16, 207, 220, '2022-04-26 04:52:21', '2022-04-26 04:52:21'),
(18, 220, 223, '2022-05-14 16:22:56', '2022-05-14 16:22:56'),
(20, 289, 229, '2022-05-23 18:45:15', '2022-05-23 18:45:15'),
(21, 227, 229, '2022-05-23 18:45:19', '2022-05-23 18:45:19'),
(22, 280, 229, '2022-05-23 18:45:25', '2022-05-23 18:45:25'),
(23, 293, 229, '2022-05-23 18:45:59', '2022-05-23 18:45:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_role_id_foreign` (`role_id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_country_id_foreign` (`country_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designs`
--
ALTER TABLE `designs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `design_images`
--
ALTER TABLE `design_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`design_id`);

--
-- Indexes for table `design_ratings`
--
ALTER TABLE `design_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_product_id_foreign` (`design_id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fcm_tokens`
--
ALTER TABLE `fcm_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`);

--
-- Indexes for table `infos`
--
ALTER TABLE `infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kurlies`
--
ALTER TABLE `kurlies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kurlies_product_id_foreign` (`product_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_product_id_foreign` (`product_id`),
  ADD KEY `likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `option_values`
--
ALTER TABLE `option_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_values_option_id_foreign` (`option_id`),
  ADD KEY `option_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_address_id_foreign` (`shipping_address_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_periods`
--
ALTER TABLE `package_periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_periods_package_id_foreign` (`package_id`);

--
-- Indexes for table `package_students`
--
ALTER TABLE `package_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_users_package_id_foreign` (`package_id`),
  ADD KEY `package_users_user_id_foreign` (`student_id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attribute_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_product_id_foreign` (`product_id`),
  ADD KEY `product_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_order_product_id_foreign` (`product_id`),
  ADD KEY `product_order_order_id_foreign` (`order_id`);

--
-- Indexes for table `product_student`
--
ALTER TABLE `product_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_student_product_id_foreign` (`product_id`),
  ADD KEY `product_student_student_id_foreign` (`student_id`);

--
-- Indexes for table `prod_colors`
--
ALTER TABLE `prod_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `size_id` (`size_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `prod_sizes`
--
ALTER TABLE `prod_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_product_id_foreign` (`product_id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_addresses_user_id_foreign` (`user_id`),
  ADD KEY `shipping_addresses_area_id_foreign` (`area_id`);

--
-- Indexes for table `show_notifications`
--
ALTER TABLE `show_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statements`
--
ALTER TABLE `statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `statements_product_id_foreign` (`product_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`);

--
-- Indexes for table `student_password_resets`
--
ALTER TABLE `student_password_resets`
  ADD KEY `student_password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_search`
--
ALTER TABLE `user_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `designs`
--
ALTER TABLE `designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `design_images`
--
ALTER TABLE `design_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=468;

--
-- AUTO_INCREMENT for table `design_ratings`
--
ALTER TABLE `design_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fcm_tokens`
--
ALTER TABLE `fcm_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=999;

--
-- AUTO_INCREMENT for table `infos`
--
ALTER TABLE `infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kurlies`
--
ALTER TABLE `kurlies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `option_values`
--
ALTER TABLE `option_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `package_periods`
--
ALTER TABLE `package_periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `package_students`
--
ALTER TABLE `package_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `product_attribute`
--
ALTER TABLE `product_attribute`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1187;

--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `product_student`
--
ALTER TABLE `product_student`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `prod_colors`
--
ALTER TABLE `prod_colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2424;

--
-- AUTO_INCREMENT for table `prod_sizes`
--
ALTER TABLE `prod_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1279;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `show_notifications`
--
ALTER TABLE `show_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `statements`
--
ALTER TABLE `statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `user_search`
--
ALTER TABLE `user_search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `wish_list`
--
ALTER TABLE `wish_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `design_ratings`
--
ALTER TABLE `design_ratings`
  ADD CONSTRAINT `design_ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kurlies`
--
ALTER TABLE `kurlies`
  ADD CONSTRAINT `kurlies_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `option_values`
--
ALTER TABLE `option_values`
  ADD CONSTRAINT `option_values_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `option_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_address_id_foreign` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_addresses` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `package_periods`
--
ALTER TABLE `package_periods`
  ADD CONSTRAINT `package_periods_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_students`
--
ALTER TABLE `package_students`
  ADD CONSTRAINT `package_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `package_users_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `product_attribute_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `product_attribute_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_category_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_student`
--
ALTER TABLE `product_student`
  ADD CONSTRAINT `product_student_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_student_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipping_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `statements`
--
ALTER TABLE `statements`
  ADD CONSTRAINT `statements_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
