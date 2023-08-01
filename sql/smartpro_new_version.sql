-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 01, 2023 at 08:59 PM
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
  `id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `gadgets` (`id`, `procId`, `gadgetType`, `gDavName`, `gCustomerName`, `lastValue`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 12345, 1, 'meysam', 'meysam_Gadget', 1, 'active', NULL, '2023-08-01 16:33:55', '2023-08-01 16:37:20');

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
(2, 1, '2', '2023-08-01 20:04:47', '2023-08-01 16:34:47', '2023-08-01 16:34:47');

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
(1, 'test', 'test', '2023-08-01 16:33:13', '2023-08-01 16:33:13');

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
(1, 'App\\Models\\User', 2, '09193804370', 'a06d3fa12955a00144eb5b8daf62facff56e45bbc7a9687767ae3d9be89d7ed6', '[\"*\"]', NULL, NULL, '2023-08-01 16:11:02', '2023-08-01 16:11:02'),
(2, 'App\\Models\\User', 3, '09193804370', 'f8c6f01082aa5071023515f62ca22a096891357b592af4c7d884d4b5e725e3a5', '[\"*\"]', NULL, NULL, '2023-08-01 16:15:59', '2023-08-01 16:15:59'),
(3, 'App\\Models\\User', 3, '09193804370', 'af78c8aaa5b0c90919b792de851c6b5af706e5e42498b2920f5cf2efc2ba2b0f', '[\"*\"]', '2023-08-01 17:29:05', NULL, '2023-08-01 16:20:05', '2023-08-01 17:29:05');

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
(12345, 1, '123456', 'test', 'meysam', '2023-08-01 19:13:13', NULL, '2023-08-01 15:43:13', '2023-08-01 15:49:16');

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
(1, 1, '1', 'http://localhost:8000/frimWares/images/1690920121-شب-قدر1-1-scaled.jpg', '2023-08-01 16:32:01', '2023-08-01 16:32:01'),
(2, 1, '2', 'http://localhost:8000/frimWares/images/1690921536-شب-قدر1-1-scaled.jpg', '2023-08-01 16:55:36', '2023-08-01 16:55:36');

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
(1, 'test', 'test', '2023-08-01 15:42:15', '2023-08-01 15:42:15');

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `family`, `mobile`, `otp`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, NULL, NULL, '09193804370', '12345', NULL, '2023-08-01 16:12:49', '2023-08-01 16:12:49');

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
(1, 3, 12345, '2023-08-01 16:21:47', '2023-08-01 16:21:47');

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
  ADD PRIMARY KEY (`id`),
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
-- AUTO_INCREMENT for table `gadgets`
--
ALTER TABLE `gadgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gadget_change_value_histories`
--
ALTER TABLE `gadget_change_value_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `proc_frim_wares`
--
ALTER TABLE `proc_frim_wares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `proc_types`
--
ALTER TABLE `proc_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `gadget_change_value_histories_gadget_id_foreign` FOREIGN KEY (`gadget_id`) REFERENCES `gadgets` (`id`);

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
