-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2019 at 08:21 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universityapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `about`, `created_at`, `updated_at`) VALUES
(1, 'Riyazi fizika tənlikləri kafedrası', '\"Riyazi fizika tənlikləri\" kafedrası 1964-cü ildə akad.M.L.Rəsulovun rəhbərliyilə fəaliyyətə başlayıb. O, 1991-ci ilədək kafedraya rəhbərlik edib. 1991-1992-ci illərdə kafedra müdiri vəzifəsini prof. F. V. Hüseynov icra edib. 1993-cü ildən kafedraya akademik Y.Ə.Məmmədov rəhbərlik edir. Hal-hazırada kafedrada 1 professor, 6 dosent və 2 baş laborant çalışır.', '2019-12-30 04:27:13', '2019-12-30 04:27:13'),
(3, 'Riyazi kibernetika kafedrası', 'Riyazi kibernetika kafedrası Tətbiqi riyaziyyat kafedrasının bazası əsasında 1988-ci ilin aprel ayında yaradılmışdır. Kafedranın ilk müdiri texnika elmləri doktoru, professor Fərəcov Rzabala Hüseyn oğlu olmuşdur. R.H. Fərəcov 1973-cü ilə qədər AMEA-nın Kibernetika İnstitutunda işləmişdir. O, 1988-ci ildən 1997-ci ilə qədər kafedraya rəhbərlik etmişdir. R.H. Fərəcov  M.A. Krasnoselski və Y.Z. Tsıpkinin şagirdi olmuşdur. Onun xətti dinamik sistemlərdə Furye-Qalua çevrilmələrin əhəsr olunmuş işləri nəinki keçmiş SSSR məkanında, hətta dünyada ilk işlər idi. Bu işlər texniki kibernetikada yeni istiqamətlərdən diskret qurğulara aid məsələlərə spektral yanaşmanın əsasını qoymuşdur.Bu nəticələr sonralar ədədi siqnallar və sistemlərin işlənməsi üçün sürətli alqoritmlərin yaradılmasında mühüm rol oynamışdır. R.H.Fərəcovun xətti, qeyri-xətti və xanalı maşınlar nəzəriyyəsində aldığı nəticələr avtomatik idarəetmə, hesablama texnikası və diaqnostika sahəsində məsələlərin həllində mühüm rol oynamışdır. O 1997-ci ildə vəfat etmişdir. Kafedranın inkişafında prof. R.H.Fərəcov böyük rol oynamışdır. O nəzəri və tətbiqi kibernetika sahəsində 90-dan çox elmi məqalənin və 10 monoqrafiyanın müəllifidir. Xətti ardıcıllıq maşınları sahəsində yazılmış ilk elmi monoqrafiya ona məxsusdur. Prof. Fərəcov R.H. elmi-pedaqoji kadrların hazırlanmasında da böyük rol oynamışdır. Hazırda kafedrada işləyən müəllimlərin bir çoxu onun yetişdirmələridir.', '2019-12-30 04:29:32', '2019-12-30 04:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `dean_of` tinyint(1) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `patronymic`, `surname`, `email`, `phone`, `date_of_birth`, `dean_of`, `title`, `department_id`, `manager_id`, `created_at`, `updated_at`) VALUES
(1, 'Huseyn', 'Hilal', 'Kamilov', 'kamilov@gmail.com', '+994504565665', '1958-12-12', NULL, 'Rector', NULL, NULL, '2019-12-29 13:54:46', '2019-12-29 13:54:46'),
(2, 'Elmir', 'Mansur', 'Sadiqov', 'elmirsadiq@gmail.com', '+994508555225', '1957-12-12', 1, 'Professor, docent', 1, 1, '2019-12-29 13:58:57', '2019-12-29 13:58:57'),
(3, 'Haydar', 'Aqshin', 'Camalli;', 'haydar@gmail.com', '+994704122332', '1990-01-15', NULL, 'Docent', 1, 2, '2019-12-29 14:00:22', '2019-12-29 14:10:16'),
(5, 'Aytac', 'Sahib', 'Hasanova', 'aytachasan@gmail.com', '+994704122332', '1997-02-25', NULL, 'Docent', 1, 2, '2019-12-29 14:12:03', '2019-12-29 14:12:03'),
(6, 'Nigar', 'Fizuli', 'Kazimli', 'nigarkazim@gmail.com', '+994559655665', '1985-06-12', 3, 'Doscent', 3, 1, NULL, NULL),
(7, 'Ali', 'Kamal', 'Sunal', 'alisunal@gmail.com', '+994778788998', '1989-12-23', NULL, 'Professor', 3, 6, NULL, NULL);

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
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Eng-24', '2019-12-29 11:32:15', '2019-12-29 12:31:13'),
(3, 'TK-637', '2019-12-29 12:27:32', '2019-12-29 12:27:32');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_29_144947_create_group_table', 1),
(5, '2019_12_29_145311_create_students_table', 1),
(6, '2019_12_29_145910_create_departments_table', 1),
(7, '2019_12_29_150049_create_employees_table', 1),
(8, '2019_12_29_161240_change_student_id_in_groups_table', 2),
(9, '2019_12_29_162518_remove_student_id_from_groups_table', 3),
(10, '2019_12_29_174709_changing_to_nullable_in_employees_table', 4),
(11, '2016_06_01_000001_create_oauth_auth_codes_table', 5),
(12, '2016_06_01_000002_create_oauth_access_tokens_table', 5),
(13, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5),
(14, '2016_06_01_000004_create_oauth_clients_table', 5),
(15, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6dd02ca1c8e3cbaeb8c4a240ebb23a318f731481010740fb0cad02cc09b09f5387dd6b4b10b7477c', 1, 2, NULL, '[]', 0, '2019-12-30 13:36:32', '2019-12-30 13:36:32', '2020-12-30 17:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'NFEYPEMYerv08lBRcXFsl6MfYHOqYkYlehC8m2nQ', 'http://localhost', 1, 0, 0, '2019-12-30 12:51:35', '2019-12-30 12:51:35'),
(2, NULL, 'Laravel Password Grant Client', 'cQawdikVNAgBCuNf8gsIT0GnrwSQEOesR2RDl4o9', 'http://localhost', 0, 1, 0, '2019-12-30 12:51:35', '2019-12-30 12:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-12-30 12:51:35', '2019-12-30 12:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('678fa7b1ab7418ce334378b99d59de374a8a144f59f876ad8a37c230e803dc006c66fb17f71c04d3', '6dd02ca1c8e3cbaeb8c4a240ebb23a318f731481010740fb0cad02cc09b09f5387dd6b4b10b7477c', 0, '2020-12-30 17:36:32');

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
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `patronymic`, `surname`, `email`, `phone`, `date_of_birth`, `group_id`, `created_at`, `updated_at`) VALUES
(2, 'Aytaj', 'Sahib', 'Hasanova', 'aytac@gmail.com', '+994558889966', '1997-09-06', 1, '2019-12-29 13:26:19', '2019-12-29 13:26:19'),
(3, 'Aytan', 'Jamal', 'Kadirova', 'Aytan@gmail.com', '+994557411441', '1997-03-25', 1, '2019-12-29 13:30:12', '2019-12-30 05:31:22'),
(4, 'Nuriyya', 'Ilkin', 'Galandarova', 'nuriyya@gmail.com', '+994558566556', '1996-05-05', 3, '2019-12-30 05:54:24', '2019-12-30 08:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aytac', 'aytac@gmail.com', NULL, '$2y$10$6d8qedPrl2wgXU5CTZU/TexI0vWbFsGUUAcjjwCDijzsF9obg/joy', NULL, '2019-12-30 13:31:00', '2019-12-30 13:31:00'),
(2, 'Nicat', 'nicat@gmail.com', NULL, '$2y$10$tuV.HxrwjWMKCySNukbRzeE3PwjqMYYk/a2IH7l3uI2KqzBvWO9cO', NULL, '2019-12-30 13:49:06', '2019-12-30 13:49:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
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
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
