-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 06, 2023 at 07:51 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartpro`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gadgets`
--

CREATE TABLE `gadgets` (
  `gadgetId` bigint(20) UNSIGNED NOT NULL,
  `procId` bigint(20) UNSIGNED NOT NULL,
  `gadgetType` bigint(20) UNSIGNED NOT NULL,
  `gDavName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gCustomerName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastValue` int(11) DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gadgets`
--

INSERT INTO `gadgets` (`gadgetId`, `procId`, `gadgetType`, `gDavName`, `gCustomerName`, `lastValue`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(123, 12345, 1, 'meysam', 'meysam_Gadget', 1, 'active', NULL, '2023-08-05 15:40:45', '2023-08-05 16:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `gadget_change_value_histories`
--

CREATE TABLE `gadget_change_value_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gadget_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeOfChange` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gadget_change_value_histories`
--

INSERT INTO `gadget_change_value_histories` (`id`, `gadget_id`, `value`, `timeOfChange`, `created_at`, `updated_at`) VALUES
(3, 123, '2', '2023-08-05 19:13:53', '2023-08-05 15:43:53', '2023-08-05 15:43:53'),
(4, 123, '2', '2023-08-05 19:14:55', '2023-08-05 15:44:55', '2023-08-05 15:44:55'),
(5, 123, '2', '2023-08-05 19:16:34', '2023-08-05 15:46:34', '2023-08-05 15:46:34'),
(6, 123, '2', '2023-08-05 19:16:36', '2023-08-05 15:46:36', '2023-08-05 15:46:36'),
(7, 123, '2', '2023-08-05 19:21:53', '2023-08-05 15:51:53', '2023-08-05 15:51:53'),
(8, 123, '2', '2023-08-05 19:21:56', '2023-08-05 15:51:56', '2023-08-05 15:51:56'),
(9, 123, '2', '2023-08-05 19:22:25', '2023-08-05 15:52:25', '2023-08-05 15:52:25'),
(10, 123, '2', '2023-08-05 19:22:37', '2023-08-05 15:52:37', '2023-08-05 15:52:37'),
(11, 123, '2', '2023-08-05 19:24:05', '2023-08-05 15:54:05', '2023-08-05 15:54:05'),
(12, 123, '2', '2023-08-05 19:24:11', '2023-08-05 15:54:11', '2023-08-05 15:54:11'),
(13, 123, '2', '2023-08-05 19:24:16', '2023-08-05 15:54:16', '2023-08-05 15:54:16'),
(14, 123, '2', '2023-08-05 19:25:54', '2023-08-05 15:55:54', '2023-08-05 15:55:54'),
(15, 123, '2', '2023-08-05 19:27:55', '2023-08-05 15:57:55', '2023-08-05 15:57:55'),
(16, 123, '1', '2023-08-05 19:28:02', '2023-08-05 15:58:02', '2023-08-05 15:58:02'),
(17, 123, '1', '2023-08-05 19:28:41', '2023-08-05 15:58:41', '2023-08-05 15:58:41');

-- --------------------------------------------------------

--
-- Table structure for table `gadget_types`
--

CREATE TABLE `gadget_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gTypeName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gadget_types`
--

INSERT INTO `gadget_types` (`id`, `gTypeName`, `tag`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', '2023-08-05 15:37:56', '2023-08-05 15:37:56');

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
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_04_13_133911_create_proc_types_table', 1),
(5, '2023_04_14_040948_create_processors_table', 1),
(6, '2023_04_28_134312_create_gadget_types_table', 1),
(7, '2023_04_29_070541_create_gadgets_table', 1),
(8, '2023_05_21_113256_create_version', 1),
(9, '2023_05_21_122621_add_interface_file_to_versions_table', 1),
(10, '2023_07_30_134059_create_gadget_change_value_histories_table', 1),
(11, '2023_07_30_134414_create_proc_frim_wares_table', 1),
(12, '2023_08_01_153149_create_user_processors_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, '09193804370', '291dfae10188c81d78d7bac1f900c037fd93d2377aac4da25c5dda9070f1b554', '[\"*\"]', NULL, NULL, '2023-08-05 12:03:48', '2023-08-05 12:03:48'),
(2, 'App\\Models\\User', 1, '09193804370', 'e7391958a5edef1e2d9c0a68e7ccf05d20114c8692be7207d9362ae743522829', '[\"*\"]', '2023-08-05 15:37:56', NULL, '2023-08-05 15:35:01', '2023-08-05 15:37:56'),
(3, 'App\\Models\\User', 1, '09193804370', '19e24369e81940279dd7a78ccf64f2b38a36c99bc4e2e4cefd924d50d5480618', '[\"*\"]', '2023-08-05 15:58:41', NULL, '2023-08-05 15:39:51', '2023-08-05 15:58:41'),
(4, 'App\\Models\\User', 1, '09193804370', '4eb2017ca07881f955cb59609f3892456a54d82a9e2b73113f0251047b55159d', '[\"*\"]', '2023-08-05 16:02:44', NULL, '2023-08-05 15:59:56', '2023-08-05 16:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `processors`
--

CREATE TABLE `processors` (
  `procId` bigint(20) UNSIGNED NOT NULL,
  `procType` bigint(20) UNSIGNED NOT NULL,
  `procPassword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pDavName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pCustomerName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstWorkDate` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `processors`
--

INSERT INTO `processors` (`procId`, `procType`, `procPassword`, `pDavName`, `pCustomerName`, `firstWorkDate`, `deleted_at`, `created_at`, `updated_at`) VALUES
(12345, 1, '123456', 'test', 'meysam', '2023-08-05 19:04:35', NULL, '2023-08-05 15:34:35', '2023-08-05 15:36:23');

-- --------------------------------------------------------

--
-- Table structure for table `proc_frim_wares`
--

CREATE TABLE `proc_frim_wares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pType` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filePath` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `proc_frim_wares`
--

INSERT INTO `proc_frim_wares` (`id`, `pType`, `version`, `filePath`, `created_at`, `updated_at`) VALUES
(1, 1, '2', 'http://localhost:8000/storage/frimWares/images/1691351449-henri-l-CHt4BMi0-Is-unsplash.jpg', '2023-08-06 16:08:00', '2023-08-06 16:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `proc_types`
--

CREATE TABLE `proc_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pTypeName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `proc_types`
--

INSERT INTO `proc_types` (`id`, `pTypeName`, `tag`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', '2023-08-05 15:34:13', '2023-08-05 15:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `family`, `mobile`, `otp`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '09193804370', '12345', 'user', NULL, '2023-08-05 12:03:37', '2023-08-05 12:03:37');

-- --------------------------------------------------------

--
-- Table structure for table `users_processors`
--

CREATE TABLE `users_processors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `procId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_processors`
--

INSERT INTO `users_processors` (`id`, `user_id`, `procId`, `created_at`, `updated_at`) VALUES
(1, 1, 12345, '2023-08-05 16:02:07', '2023-08-05 16:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interface_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interface_file` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gadgets`
--
ALTER TABLE `gadgets`
  ADD PRIMARY KEY (`gadgetId`),
  ADD KEY `gadgets_procid_foreign` (`procId`),
  ADD KEY `gadgets_gadgettype_foreign` (`gadgetType`);

--
-- Indexes for table `gadget_change_value_histories`
--
ALTER TABLE `gadget_change_value_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gadget_change_value_histories_gadget_id_foreign` (`gadget_id`);

--
-- Indexes for table `gadget_types`
--
ALTER TABLE `gadget_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `processors`
--
ALTER TABLE `processors`
  ADD PRIMARY KEY (`procId`),
  ADD KEY `processors_proctype_foreign` (`procType`);

--
-- Indexes for table `proc_frim_wares`
--
ALTER TABLE `proc_frim_wares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proc_frim_wares_ptype_foreign` (`pType`);

--
-- Indexes for table `proc_types`
--
ALTER TABLE `proc_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- Indexes for table `users_processors`
--
ALTER TABLE `users_processors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_processors_user_id_foreign` (`user_id`),
  ADD KEY `users_processors_procid_foreign` (`procId`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `versions_version_title_unique` (`version_title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gadget_change_value_histories`
--
ALTER TABLE `gadget_change_value_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `gadget_types`
--
ALTER TABLE `gadget_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `proc_frim_wares`
--
ALTER TABLE `proc_frim_wares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proc_types`
--
ALTER TABLE `proc_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_processors`
--
ALTER TABLE `users_processors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `versions`
--
ALTER TABLE `versions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gadgets`
--
ALTER TABLE `gadgets`
  ADD CONSTRAINT `gadgets_gadgettype_foreign` FOREIGN KEY (`gadgetType`) REFERENCES `gadget_types` (`id`),
  ADD CONSTRAINT `gadgets_procid_foreign` FOREIGN KEY (`procId`) REFERENCES `processors` (`procId`);

--
-- Constraints for table `gadget_change_value_histories`
--
ALTER TABLE `gadget_change_value_histories`
  ADD CONSTRAINT `gadget_change_value_histories_gadget_id_foreign` FOREIGN KEY (`gadget_id`) REFERENCES `gadgets` (`gadgetId`);

--
-- Constraints for table `processors`
--
ALTER TABLE `processors`
  ADD CONSTRAINT `processors_proctype_foreign` FOREIGN KEY (`procType`) REFERENCES `proc_types` (`id`);

--
-- Constraints for table `proc_frim_wares`
--
ALTER TABLE `proc_frim_wares`
  ADD CONSTRAINT `proc_frim_wares_ptype_foreign` FOREIGN KEY (`pType`) REFERENCES `proc_types` (`id`);

--
-- Constraints for table `users_processors`
--
ALTER TABLE `users_processors`
  ADD CONSTRAINT `users_processors_procid_foreign` FOREIGN KEY (`procId`) REFERENCES `processors` (`procId`),
  ADD CONSTRAINT `users_processors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
