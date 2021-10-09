-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 09, 2021 at 10:04 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`id`, `name`, `email`, `mobile_number`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Buyer', 'buyer@buyer.com', '01912969336', '$2y$10$.Fzxpl72MnannDum.RjqDOpUTH7BETPjkZK33u9h7Maf9pFWglb2.', '2021-10-01 08:02:38', '2021-10-01 08:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `order_number`, `buyer_id`, `status`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '381002', 1, 'Delivered', '---', NULL, NULL, '2021-10-05 12:12:42', '2021-10-05 12:12:42'),
(2, '381002', 1, 'Delivered', '---', NULL, NULL, '2021-10-05 12:14:26', '2021-10-05 12:14:26'),
(3, '677802', 1, 'Delivered', '---', NULL, NULL, '2021-10-05 12:20:00', '2021-10-05 12:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"68966bdf-e2aa-4e39-af38-bd1bfd04795f\",\"displayName\":\"App\\\\Notifications\\\\OrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\OrderNotification\\\":12:{s:44:\\\"\\u0000App\\\\Notifications\\\\OrderNotification\\u0000orderId\\\";i:1;s:2:\\\"id\\\";s:36:\\\"58c5e84b-7563-473e-ab2c-b27f573c7205\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1633679709, 1633679709),
(2, 'default', '{\"uuid\":\"dbc74cfc-d7b4-4c68-81b8-b1674e171dee\",\"displayName\":\"App\\\\Notifications\\\\OrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\OrderNotification\\\":12:{s:44:\\\"\\u0000App\\\\Notifications\\\\OrderNotification\\u0000orderId\\\";i:1;s:2:\\\"id\\\";s:36:\\\"58c5e84b-7563-473e-ab2c-b27f573c7205\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1633679709, 1633679709),
(3, 'default', '{\"uuid\":\"07d9dece-b064-4856-9714-fcd930fc5511\",\"displayName\":\"App\\\\Notifications\\\\OrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\OrderNotification\\\":12:{s:44:\\\"\\u0000App\\\\Notifications\\\\OrderNotification\\u0000orderId\\\";i:2;s:2:\\\"id\\\";s:36:\\\"c09a2751-a322-4e78-902c-f6bea3adcc6f\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1633679714, 1633679714),
(4, 'default', '{\"uuid\":\"dad0b549-aaa9-4be6-8cc0-a7357d0865d8\",\"displayName\":\"App\\\\Notifications\\\\OrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\OrderNotification\\\":12:{s:44:\\\"\\u0000App\\\\Notifications\\\\OrderNotification\\u0000orderId\\\";i:2;s:2:\\\"id\\\";s:36:\\\"c09a2751-a322-4e78-902c-f6bea3adcc6f\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1633679714, 1633679714);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, '2021_09_30_100454_create_products_table', 2),
(9, '2021_10_01_054929_create_buyers_table', 4),
(14, '2021_10_01_063537_create_order_details_table', 7),
(15, '2021_09_30_100521_create_orders_table', 8),
(16, '2021_10_04_191416_create_notifications_table', 9),
(17, '2021_10_05_055613_create_jobs_table', 10),
(18, '2021_10_05_172415_create_deliveries_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `buyer_id`, `status`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '789091', 1, 'Delivered', '---', NULL, NULL, '2021-10-08 01:55:07', '2021-10-08 07:00:27'),
(2, '624947', 1, 'Delivered', '---', NULL, NULL, '2021-10-08 01:55:13', '2021-10-08 09:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 5, 16000, 'Active', NULL, NULL, '2021-10-08 01:55:07', '2021-10-08 01:55:07'),
(2, 2, 8, 6, 14000, 'Active', NULL, NULL, '2021-10-08 01:55:14', '2021-10-08 01:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'mr_token', '6440c9d6bbe9c86e61c4da2ef776b3c3ca4a53b01cd9bc74444cee119ecb0b0f', '[\"*\"]', NULL, '2021-09-30 02:58:41', '2021-09-30 02:58:41'),
(2, 'App\\Models\\User', 1, 'mr_token', 'ea208666b0076fd8ea7ebd52cb9670f11062ac58e345c4643d47b1c9a61cc6fc', '[\"*\"]', NULL, '2021-09-30 02:58:47', '2021-09-30 02:58:47'),
(3, 'App\\Models\\User', 1, 'access_token', '307b9a53e0c1d8746fe1c650bdcba92b496e38d4da80503360ef9f521cc7913e', '[\"*\"]', '2021-09-30 03:04:59', '2021-09-30 02:59:41', '2021-09-30 03:04:59'),
(4, 'App\\Models\\User', 1, 'access_token', '4e334ea8fb1ba9e456e9eadbd3edcfb77f7205b51a3dae50d117deff3dab7388', '[\"*\"]', '2021-10-01 02:06:07', '2021-09-30 03:04:53', '2021-10-01 02:06:07'),
(5, 'App\\Models\\User', 1, 'access_token', '00814a556ef0c606d5c7dbd2302d7e944e2edf9226c48a12d98f4881ce6fe564', '[\"*\"]', NULL, '2021-09-30 03:35:33', '2021-09-30 03:35:33'),
(6, 'App\\Models\\User', 1, 'access_token', '84a1ea5986e932d1d06285a3da9c47fcdf4c3b11ad3c89e54d6033203aae4347', '[\"*\"]', '2021-09-30 15:26:01', '2021-09-30 05:01:41', '2021-09-30 15:26:01'),
(7, 'App\\Models\\Buyer', 1, 'buyer_access_token', '0950dc91f0165bdf541dc64995c4536cc09d76a69e0b4910f275a47c2f69e53b', '[\"*\"]', '2021-10-01 02:06:19', '2021-10-01 02:05:12', '2021-10-01 02:06:19'),
(8, 'App\\Models\\User', 1, 'access_token', '7df4dfc0c0e23430ff897b98c61c77674c654a627a8031fb16326cb25102c73b', '[\"*\"]', NULL, '2021-10-01 05:46:33', '2021-10-01 05:46:33'),
(9, 'App\\Models\\User', 1, 'access_token', '9a44d4f30508be8fd85369aeba7e9183c187e6d8c9e27a411bb87efdd567bf3e', '[\"*\"]', NULL, '2021-10-01 05:53:32', '2021-10-01 05:53:32'),
(10, 'App\\Models\\User', 1, 'access_token', '88cee459e84f2d361ccb7791643ee45a9394b696a8468c385f6589b64c40d321', '[\"*\"]', NULL, '2021-10-01 06:26:48', '2021-10-01 06:26:48'),
(11, 'App\\Models\\User', 1, 'access_token', '432c3247474a9831f912a0a244e2b9c676e3e46a5cfd624a90f128a14809f275', '[\"*\"]', NULL, '2021-10-01 06:27:10', '2021-10-01 06:27:10'),
(12, 'App\\Models\\User', 1, 'access_token', '2ec0f424b2c8f3d5e9eb2b1a7384849bb6b592173f1659359ed1ee56d72d01b7', '[\"*\"]', NULL, '2021-10-01 06:29:39', '2021-10-01 06:29:39'),
(13, 'App\\Models\\User', 1, 'access_token', '0357ad0f3079fda230a57fabcfae8edb6d3ea77f67bd42a9efbd1f30f9f9436c', '[\"*\"]', NULL, '2021-10-01 10:58:54', '2021-10-01 10:58:54'),
(14, 'App\\Models\\User', 1, 'access_token', '6fff08ea42ccab5d3ef5e0b38848c7fa34c6e9a5010a16b1bbc848f519325a6b', '[\"*\"]', NULL, '2021-10-01 10:59:24', '2021-10-01 10:59:24'),
(15, 'App\\Models\\User', 1, 'access_token', '6caf40c24314728b9df9c67a3eca427a96e4d2a217291073d9951d0525c83631', '[\"*\"]', NULL, '2021-10-01 11:00:05', '2021-10-01 11:00:05'),
(16, 'App\\Models\\User', 1, 'access_token', 'f8bbf5b0a414781391e54eeb7fa414536f1c6fd6c8985e05462aa5a2cf84a99b', '[\"*\"]', NULL, '2021-10-01 11:40:36', '2021-10-01 11:40:36'),
(17, 'App\\Models\\User', 1, 'access_token', 'd6b03b7fea9650a2cc740934895fb0be1009ce97679c871e8842c2784dd6887f', '[\"*\"]', NULL, '2021-10-01 11:53:18', '2021-10-01 11:53:18'),
(18, 'App\\Models\\User', 1, 'access_token', 'e6da8aaa7fb123082ca71d1a5a2d5bea96377c725013052058e344351d4b1bfd', '[\"*\"]', NULL, '2021-10-01 13:07:16', '2021-10-01 13:07:16'),
(19, 'App\\Models\\User', 1, 'access_token', '6ba042b442d2be82d53809e8af250934de66812ec41abf6fe65912869e50ef68', '[\"*\"]', NULL, '2021-10-02 06:35:57', '2021-10-02 06:35:57'),
(20, 'App\\Models\\User', 1, 'access_token', 'b6e83cec88dadb23ea9a6de39e08a7cea57aa9b27d56f02152da8519688b79f1', '[\"*\"]', NULL, '2021-10-02 10:48:07', '2021-10-02 10:48:07'),
(21, 'App\\Models\\User', 1, 'access_token', 'c816520975453ca466fea99174cfcdbf73c5efead7b4971f769244765b34158a', '[\"*\"]', NULL, '2021-10-02 11:00:46', '2021-10-02 11:00:46'),
(22, 'App\\Models\\User', 1, 'access_token', '5927b0b90a25b9857e6298df9817947bb602b942349b0044e007976917dee30a', '[\"*\"]', NULL, '2021-10-02 21:40:59', '2021-10-02 21:40:59'),
(23, 'App\\Models\\User', 1, 'access_token', '33a675c3ffde3622955918e5265ec505aafc9e77db1b823decdec16ab90831a6', '[\"*\"]', NULL, '2021-10-02 23:32:55', '2021-10-02 23:32:55'),
(24, 'App\\Models\\User', 1, 'access_token', '97286b9940e29b555d9affc022d70fb4ff7ae2c07cb0fcf07f59e5a423fba844', '[\"*\"]', NULL, '2021-10-02 23:55:05', '2021-10-02 23:55:05'),
(25, 'App\\Models\\User', 1, 'access_token', 'af0f95fbf4ab7dbbc238fc393badb756b46fb6e2400ca4c6e0d0a16d25bb0d0f', '[\"*\"]', NULL, '2021-10-04 08:10:07', '2021-10-04 08:10:07'),
(26, 'App\\Models\\User', 1, 'access_token', 'c68984c9faeb73895ea80e36d2d832fe20d25160086b63eb8f1c92d1c247501d', '[\"*\"]', NULL, '2021-10-04 08:10:07', '2021-10-04 08:10:07'),
(27, 'App\\Models\\User', 1, 'access_token', '79d53303e0926e838fb22269447b2037ee775f9156031e45e5bfaa2ac5a61f8a', '[\"*\"]', '2021-10-06 00:08:12', '2021-10-05 23:13:31', '2021-10-06 00:08:12'),
(28, 'App\\Models\\Buyer', 1, 'access_token', 'a2ec7243670fb6d955375576f4428cb229d7d1f6a093aaf7b47163f5b08fb249', '[\"*\"]', '2021-10-06 00:09:03', '2021-10-06 00:08:53', '2021-10-06 00:09:03'),
(29, 'App\\Models\\User', 1, 'access_token', 'fd66a17430843eec65551aaa53b8d5c1acb668dddee01b9dc1293d46058b5730', '[\"*\"]', NULL, '2021-10-06 00:13:35', '2021-10-06 00:13:35'),
(30, 'App\\Models\\User', 1, 'access_token', '0d08a536ae2369c41f31322b6e63870a109fce0aa3e8bcc538abb7b9e7c39f79', '[\"*\"]', NULL, '2021-10-06 00:32:57', '2021-10-06 00:32:57'),
(31, 'App\\Models\\User', 1, 'access_token', 'afc8bf5fc2655654063b1bf865c8cd92a80b85cadc7ca57df9895b02a12261b6', '[\"*\"]', '2021-10-06 07:41:27', '2021-10-06 01:00:51', '2021-10-06 07:41:27'),
(32, 'App\\Models\\User', 1, 'access_token', '4f49447310b3e56eae7c234715c8cb8a33f99854bce5543ac586a779a644caf9', '[\"*\"]', NULL, '2021-10-06 07:41:26', '2021-10-06 07:41:26'),
(33, 'App\\Models\\User', 1, 'access_token', '623d5b9799e4f493a73eea24f09a48ba5196b21d4572ecec9bea4d8643b99562', '[\"*\"]', NULL, '2021-10-06 07:42:53', '2021-10-06 07:42:53'),
(34, 'App\\Models\\User', 1, 'access_token', '31cb3020b93e00101213fd00e7920e5bfe382019471ad7a326eb28d333e8bb82', '[\"*\"]', NULL, '2021-10-06 13:22:35', '2021-10-06 13:22:35'),
(35, 'App\\Models\\User', 1, 'access_token', '33755367f7be31d4b0d060abe4092d007bd5045f8e92724fdb345693af66d857', '[\"*\"]', NULL, '2021-10-06 13:52:45', '2021-10-06 13:52:45'),
(36, 'App\\Models\\User', 1, 'access_token', '7ecf07bc5feea56d244ab86e86c32906bd5388120767be4f5e56430de8b72a61', '[\"*\"]', NULL, '2021-10-06 15:13:39', '2021-10-06 15:13:39'),
(37, 'App\\Models\\User', 1, 'access_token', '18a205f0eb55b42789a132cc6bf2b2c28fcfdd374d868788efebadd918c94be4', '[\"*\"]', NULL, '2021-10-06 15:18:17', '2021-10-06 15:18:17'),
(38, 'App\\Models\\User', 1, 'access_token', '8da481b70eac1a2abc8fdc71b2c62510b04923e9b04947f094c476fabb8b516d', '[\"*\"]', NULL, '2021-10-06 15:18:44', '2021-10-06 15:18:44'),
(39, 'App\\Models\\User', 1, 'access_token', '57370198227b3a25a062cfb9352b3bcb562cfd97950a1336a78021d17261cab3', '[\"*\"]', NULL, '2021-10-06 23:47:29', '2021-10-06 23:47:29'),
(40, 'App\\Models\\User', 1, 'access_token', 'd7104a87cfcafba4ce1026dc15021f7291e2640f40ca91db5428fa2de2d57a23', '[\"*\"]', NULL, '2021-10-06 23:48:57', '2021-10-06 23:48:57'),
(41, 'App\\Models\\User', 1, 'access_token', '2f06abbe0330521544c21d919fc4402bfde7e5e7db8bf27376d46bc1e8953981', '[\"*\"]', NULL, '2021-10-06 23:50:32', '2021-10-06 23:50:32'),
(42, 'App\\Models\\User', 1, 'access_token', '6b6511e51126c8e907d45f1e09bc4969ce3feaf13ed9316159ac447318247282', '[\"*\"]', NULL, '2021-10-06 23:51:22', '2021-10-06 23:51:22'),
(43, 'App\\Models\\User', 1, 'access_token', '3da75e9c4d46c2d6572bf7714cf4bbb6ec27d377ebe29832961ce0e22784afab', '[\"*\"]', NULL, '2021-10-06 23:51:33', '2021-10-06 23:51:33'),
(44, 'App\\Models\\User', 1, 'access_token', 'b1eda233b449784a84dd585c4db07ee34a43c4fbdc995326428d6aade7b30635', '[\"*\"]', NULL, '2021-10-06 23:51:54', '2021-10-06 23:51:54'),
(45, 'App\\Models\\User', 1, 'access_token', '80ef82af546fe74d21c4cfa97151badfcdf8022902df590112ac518c8d6729ee', '[\"*\"]', NULL, '2021-10-06 23:54:17', '2021-10-06 23:54:17'),
(46, 'App\\Models\\User', 1, 'access_token', 'ba7129aed0631f3852cd1938ea3e9c847851cab560aa69bb55345f23fa4eab21', '[\"*\"]', NULL, '2021-10-06 23:55:22', '2021-10-06 23:55:22'),
(47, 'App\\Models\\User', 1, 'access_token', '7811f26e8a79e46fcd190d17903a831aa175d2247347f1d19de8b817cb549301', '[\"*\"]', NULL, '2021-10-06 23:56:12', '2021-10-06 23:56:12'),
(48, 'App\\Models\\User', 1, 'access_token', '136cbf992113d62838c1bcf3aceb78b2222cc5dba2ff2adbc6b2c0f51e6cf120', '[\"*\"]', NULL, '2021-10-06 23:56:42', '2021-10-06 23:56:42'),
(49, 'App\\Models\\User', 1, 'access_token', '425462816e6e4613dffbad9e819e97b5ffb86885df49de65b25eaea3b8aa0139', '[\"*\"]', NULL, '2021-10-07 00:00:26', '2021-10-07 00:00:26'),
(50, 'App\\Models\\User', 1, 'access_token', '4af7304076f6ebe41c78aebce3218498a4531445f8f744617eb23fc204f43129', '[\"*\"]', NULL, '2021-10-07 00:08:25', '2021-10-07 00:08:25'),
(51, 'App\\Models\\User', 1, 'access_token', 'd472a2a343105bfbd27ca21d2a63389c313a483685122ce8d9687af34b254286', '[\"*\"]', NULL, '2021-10-07 00:09:35', '2021-10-07 00:09:35'),
(52, 'App\\Models\\User', 1, 'access_token', 'cfe05671152ba75b8b991433d4348f8427bb69843f60d573ff1c272d9fbcffe0', '[\"*\"]', NULL, '2021-10-07 00:11:16', '2021-10-07 00:11:16'),
(53, 'App\\Models\\User', 1, 'access_token', 'bf96644257d5e7f5d27a3b9d794de34757249ad13edc483d4914491411990ced', '[\"*\"]', '2021-10-07 00:19:21', '2021-10-07 00:14:10', '2021-10-07 00:19:21'),
(54, 'App\\Models\\User', 1, 'access_token', '6c4f5d4bb374ad0d04665cf9f859af6e640b142bc3d7a84186f8e303ca7b1ee4', '[\"*\"]', NULL, '2021-10-07 00:18:51', '2021-10-07 00:18:51'),
(55, 'App\\Models\\User', 1, 'access_token', '2e5fd497dfc8d95bece775bd6013f41568e392341bcda502f3131d1e3b34da3e', '[\"*\"]', NULL, '2021-10-07 00:19:21', '2021-10-07 00:19:21'),
(56, 'App\\Models\\User', 1, 'access_token', 'dead681fea025dc1b0704fc3af23a8a0b0351dbd327f371b4d431562b5e8659b', '[\"*\"]', '2021-10-07 00:29:06', '2021-10-07 00:20:30', '2021-10-07 00:29:06'),
(57, 'App\\Models\\User', 1, 'access_token', 'c83e0c09ae765c645aa347928971b3cbe8b56b803441e29c35c0f0f5765a0682', '[\"*\"]', '2021-10-07 02:48:09', '2021-10-07 00:29:35', '2021-10-07 02:48:09'),
(58, 'App\\Models\\User', 1, 'access_token', '006d953ed65e7d1f1344b84ff84ddf098ee16a83d824dba8a3915c4036125c41', '[\"*\"]', NULL, '2021-10-07 00:36:29', '2021-10-07 00:36:29'),
(59, 'App\\Models\\User', 1, 'access_token', '60a5e1b61a11174587cc3278a6dca02ba0783b1a26a3f486ab5ffa30a29eabc5', '[\"*\"]', NULL, '2021-10-08 00:46:33', '2021-10-08 00:46:33'),
(60, 'App\\Models\\User', 1, 'access_token', 'c9c87b1d12077b4aa5a9a7ce36e2332b8b9f89b103d33a570eb8603f68b88610', '[\"*\"]', '2021-10-08 01:04:03', '2021-10-08 00:46:34', '2021-10-08 01:04:03'),
(61, 'App\\Models\\User', 1, 'access_token', '4561583051925728a607ed1bd48e34e0052a72c86867f6d2f764d1b0a18d3919', '[\"*\"]', '2021-10-08 01:04:29', '2021-10-08 01:04:24', '2021-10-08 01:04:29'),
(62, 'App\\Models\\User', 1, 'access_token', '202294599ed21bfcfe01d39b25da9fb02ddc93f76e089932329fb06b603ddfa4', '[\"*\"]', '2021-10-08 05:21:37', '2021-10-08 01:12:34', '2021-10-08 05:21:37'),
(63, 'App\\Models\\User', 1, 'access_token', 'be70903b12151430b7a85900b4ae30ec3c0ec3b0efae345346f18d61deab6365', '[\"*\"]', NULL, '2021-10-08 05:21:50', '2021-10-08 05:21:50'),
(64, 'App\\Models\\User', 1, 'access_token', 'eb45d94305c4eb4a5139489b43079da19f8f2effee5450ec725b13d36e436e34', '[\"*\"]', NULL, '2021-10-08 05:26:46', '2021-10-08 05:26:46'),
(65, 'App\\Models\\User', 1, 'access_token', '913161794f6a9cb7d64ec77e92a4f74c3f0c973654d593dea8cb09bae05920cd', '[\"*\"]', NULL, '2021-10-08 09:46:53', '2021-10-08 09:46:53'),
(66, 'App\\Models\\User', 1, 'access_token', 'd7dd2af4656d4c305b47d933725e8822475a258a0cadd833380539ad537b53ee', '[\"*\"]', NULL, '2021-10-08 09:49:51', '2021-10-08 09:49:51'),
(67, 'App\\Models\\User', 1, 'access_token', '4abe0f4c89a7ce3b29c50f07b80fc4b54b752febef4652bda10994988e39d26d', '[\"*\"]', NULL, '2021-10-09 02:21:14', '2021-10-09 02:21:14'),
(68, 'App\\Models\\User', 1, 'access_token', 'df9bc9a44962bb4ad5ac73fb37adb7cc4211bff37d96a8a10b84a96721ae64ce', '[\"*\"]', NULL, '2021-10-09 02:27:10', '2021-10-09 02:27:10'),
(69, 'App\\Models\\User', 1, 'access_token', '2339e72becda800fa57d8bcb423f4c2c86b2d1b7ec57bf1c633eac01c7bce83d', '[\"*\"]', NULL, '2021-10-09 02:27:36', '2021-10-09 02:27:36'),
(70, 'App\\Models\\User', 1, 'access_token', '6ff02141aac2c9c1c97e653f37f8bc9923a1d71af02f6445073fecce865c9b18', '[\"*\"]', NULL, '2021-10-09 02:28:08', '2021-10-09 02:28:08'),
(71, 'App\\Models\\User', 1, 'access_token', '9c0e15c53664f1bbe9c3968f8c9e4a2cda46a7b8977ae981d61caee010a6f4e2', '[\"*\"]', NULL, '2021-10-09 02:37:55', '2021-10-09 02:37:55'),
(72, 'App\\Models\\User', 1, 'access_token', 'c5b96e96d43e45bc84a0495ef9fb9e84ebf608e4d5c2d8ba96a8e6f14aa2d4e5', '[\"*\"]', '2021-10-09 02:41:49', '2021-10-09 02:39:39', '2021-10-09 02:41:49'),
(73, 'App\\Models\\User', 1, 'access_token', '87885e590142e81561f3223947bda8b1b7035ca4252e409d36cef00567188f31', '[\"*\"]', NULL, '2021-10-09 02:44:12', '2021-10-09 02:44:12'),
(74, 'App\\Models\\User', 1, 'access_token', 'a98ea1d5eb656cb3b233e0b63797fbb32f366e05cd665551a61ab2545b2a36fb', '[\"*\"]', '2021-10-09 02:50:08', '2021-10-09 02:45:59', '2021-10-09 02:50:08'),
(75, 'App\\Models\\User', 1, 'access_token', 'd8eb56bafecb5b1bd3100649bee58d26933d77b069cfa292a55060c0f601319d', '[\"*\"]', '2021-10-09 12:06:03', '2021-10-09 03:11:17', '2021-10-09 12:06:03'),
(76, 'App\\Models\\User', 1, 'access_token', '9f2c8d59bd0b49852d1a28aaac4dad1d0f0c31bc3595ab304bbedc84adc3f83b', '[\"*\"]', NULL, '2021-10-09 12:05:25', '2021-10-09 12:05:25'),
(77, 'App\\Models\\User', 1, 'access_token', 'd4965a00770dcd5dff8901a33bcd96ab8a71e26562bdcd94706da6e2173aecb9', '[\"*\"]', NULL, '2021-10-09 12:06:32', '2021-10-09 12:06:32'),
(78, 'App\\Models\\User', 1, 'access_token', '467a918d662d8b141e2fd1b79e65740abb54efdfde26372e3937930f6cf4bca6', '[\"*\"]', NULL, '2021-10-09 12:48:44', '2021-10-09 12:48:44'),
(79, 'App\\Models\\User', 1, 'access_token', 'ca9e8d79e9dbeec6d7339698047737aae5bee7de73a1a941c58ddfc6fb042e2a', '[\"*\"]', NULL, '2021-10-09 12:55:25', '2021-10-09 12:55:25'),
(80, 'App\\Models\\User', 1, 'access_token', 'ad5f07a6ab4971370e95f7fd6825a1e90829119084674e532729817cb662fbf1', '[\"*\"]', NULL, '2021-10-09 13:15:14', '2021-10-09 13:15:14'),
(81, 'App\\Models\\User', 1, 'access_token', '95c6dc9e19e2a730d796b8e5523846c8dc18b2c3925baa1d7763ad320c70c1b0', '[\"*\"]', '2021-10-09 13:32:46', '2021-10-09 13:25:31', '2021-10-09 13:32:46'),
(82, 'App\\Models\\User', 1, 'access_token', '69d82cfa25806ab1a519302c0b5d42a34b3c998e0ff760de56aeb3c8c69ed7c7', '[\"*\"]', '2021-10-09 13:40:19', '2021-10-09 13:36:56', '2021-10-09 13:40:19'),
(83, 'App\\Models\\User', 1, 'access_token', 'c124b9887c0693dbe0ff27c4b7253690a855e4dc1c3c55257bcc849396771953', '[\"*\"]', NULL, '2021-10-09 13:45:46', '2021-10-09 13:45:46'),
(84, 'App\\Models\\User', 1, 'access_token', '1c9ff1ec0f9ce58b9da77d9de1b04b14a469bfde8dbcdfa769fd31a572da8046', '[\"*\"]', NULL, '2021-10-09 13:55:20', '2021-10-09 13:55:20'),
(85, 'App\\Models\\User', 1, 'access_token', '521a60edeabb3afdc576472ee631052148350e3ad415d4c1cc97869674c8893b', '[\"*\"]', NULL, '2021-10-09 14:01:03', '2021-10-09 14:01:03'),
(86, 'App\\Models\\Buyer', 1, 'buyer_access_token', '73711b34df80bd6be6e179e597c6cda64d7e811c0becfd49ad4a22a4e9825647', '[\"*\"]', '2021-10-09 14:03:49', '2021-10-09 14:03:36', '2021-10-09 14:03:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity`, `image`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(7, 'Infinix Note 10', 'Mobiles', 16000, 10, 'image/product/infinix-note-10-1633250969.jpg', 'Active', NULL, NULL, '2021-10-03 02:49:29', '2021-10-09 03:13:07'),
(8, 'Redmi Note 10', 'Mobile', 14000, 10, 'image/product/redmi-note-10-1633259458.png', 'Active', NULL, NULL, '2021-10-03 05:10:58', '2021-10-08 09:05:35'),
(9, 'Redmi 4X', 'Mobile', 12000, 13, 'image/product/redmi-4x-1633259514.png', 'Active', NULL, NULL, '2021-10-03 05:11:54', '2021-10-03 05:11:54'),
(10, 'Samsung A50', 'Smart Phone', 16000, 8, 'image/product/samsung-a50-1633259555.png', 'Active', NULL, NULL, '2021-10-03 05:12:35', '2021-10-03 05:12:35'),
(11, 'HP Probook 450', 'Laptop', 52000, 5, 'image/product/hp-probook-450-1633259622.jpg', 'Active', NULL, NULL, '2021-10-03 05:13:42', '2021-10-03 05:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'protik.hore@gmail.com', NULL, '$2y$10$.Fzxpl72MnannDum.RjqDOpUTH7BETPjkZK33u9h7Maf9pFWglb2.', NULL, '2021-09-30 08:45:08', '2021-09-30 08:45:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyers`
--
ALTER TABLE `buyers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
