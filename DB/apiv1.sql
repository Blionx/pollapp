-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2016 at 09:04 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apiv1`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `logo`, `email`, `created_at`, `updated_at`) VALUES
(10, 'DMC', 'company_img/19135-World of Warcraft Horde Logo.jpg', 'administracion@dmc.com', '2016-09-25 07:11:33', '2016-09-25 07:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `encuestas`
--

CREATE TABLE `encuestas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `encuestas`
--

INSERT INTO `encuestas` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dsa', '0', '2016-09-11 01:34:47', '2016-09-24 23:15:35'),
(2, 'new poll', '0', '2016-09-11 01:35:14', '2016-09-24 23:16:35'),
(3, 'information', '1', '2016-09-11 01:35:40', '2016-09-24 23:15:42'),
(4, 'Encuesta de prueba', '1', '2016-09-11 01:36:50', '2016-09-24 23:15:06'),
(5, 'testing', '1', '2016-09-11 01:44:41', '2016-09-11 01:55:20'),
(6, 'testing again', '1', '2016-09-11 01:59:34', '2016-09-11 01:59:49'),
(7, 'testing speed feel', '1', '2016-09-11 01:59:43', '2016-09-24 23:16:29'),
(8, 'Encuesta De satisfacción del Usuario', '1', '2016-09-11 22:49:01', '2016-09-24 23:14:07'),
(10, 'try tis', '1', '2016-09-24 23:29:21', '2016-09-24 23:29:21'),
(11, 'Encuesta creada desde angular js', '1', '2016-09-24 23:30:22', '2016-09-24 23:30:22'),
(12, 'lastone', '1', '2016-09-24 23:32:00', '2016-09-24 23:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `encuestas_company`
--

CREATE TABLE `encuestas_company` (
  `id` int(10) UNSIGNED NOT NULL,
  `encuestas_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `encuestedinfo`
--

CREATE TABLE `encuestedinfo` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `opciones`
--

CREATE TABLE `opciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `preguntas_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `encuestas_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `preguntas`
--

INSERT INTO `preguntas` (`id`, `name`, `status`, `type`, `encuestas_id`, `created_at`, `updated_at`) VALUES
(1, 'esta totalmente de acuerdo con hacer esta encuesta?', '1', '1', 8, '2016-09-11 23:28:00', '2016-09-24 22:28:19'),
(2, 'este es un test a ver si funciona', '1', '2', 8, '2016-09-11 23:30:27', '2016-09-11 23:30:27'),
(3, 'fff', '1', '1', 8, '2016-09-11 23:32:34', '2016-09-11 23:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `real_encuesta`
--

CREATE TABLE `real_encuesta` (
  `id` int(10) UNSIGNED NOT NULL,
  `encuestas_id` int(11) NOT NULL,
  `preguntas_id` int(11) NOT NULL,
  `opciones_id` int(11) NOT NULL,
  `encuestedinfo_id` int(11) NOT NULL,
  `coment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(2) NOT NULL,
  `status` int(2) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `type`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Luis Pens', 'pensluis@gmail.com', '$2y$10$5/n.WXwVMBNlY2pp7CH/2.b/eikKNh.jIeDGgHh6rN8RU9mYciMYa', 0, 1, NULL, NULL, NULL),
(2, 'Joselys Farias', 'joselysfariasm@gmail.com', '$2y$10$Fm9xXPhl/Tj/X24BB5WgdexxujQF.CBWbbdaj31otOzWm.BFH8uW.', 1, 1, NULL, '2016-09-25 02:43:04', '2016-09-25 02:43:04'),
(4, 'henry farias', 'elmarportado@gmail.com', '$2y$10$NizaoXav2t4UN7TgwkigGuDVwggozd77Bl4J2M8BsaIb.aQw9maYu', 1, 1, NULL, '2016-09-25 19:42:04', '2016-09-25 19:42:04');

-- --------------------------------------------------------

--
-- Table structure for table `users_company`
--

CREATE TABLE `users_company` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users_company`
--

INSERT INTO `users_company` (`id`, `users_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 4, 10, '2016-09-25 19:42:04', '2016-09-25 19:42:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_email_unique` (`email`);

--
-- Indexes for table `encuestas`
--
ALTER TABLE `encuestas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `encuestas_company`
--
ALTER TABLE `encuestas_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `encuestedinfo`
--
ALTER TABLE `encuestedinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `real_encuesta`
--
ALTER TABLE `real_encuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_company`
--
ALTER TABLE `users_company`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `encuestas`
--
ALTER TABLE `encuestas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `encuestas_company`
--
ALTER TABLE `encuestas_company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `encuestedinfo`
--
ALTER TABLE `encuestedinfo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `real_encuesta`
--
ALTER TABLE `real_encuesta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_company`
--
ALTER TABLE `users_company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
