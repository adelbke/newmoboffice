-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 29, 2020 at 03:41 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newmoboffice`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('SuperAdmin','Admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 2, 'SuperAdmin', '2019-09-29 17:44:52', '2019-09-29 17:44:52'),
(2, 1, 'SuperAdmin', '2019-09-29 17:45:31', '2019-09-29 17:45:31'),
(3, 3, 'SuperAdmin', '2019-10-09 16:22:08', '2019-10-09 16:22:08');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `user_id`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 3, '09 blida', '0542130436', '2019-10-09 16:18:42', '2019-10-09 16:18:42'),
(2, 4, 'blida', '0557698139', '2019-10-11 04:28:19', '2019-10-11 04:28:19'),
(3, 5, 'Bourkika', '0780341417', '2020-02-11 17:49:56', '2020-02-11 17:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `client_pros`
--

CREATE TABLE `client_pros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `registreCommerce` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection_product`
--

CREATE TABLE `collection_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `collection_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `reference`, `name`, `image_id`, `created_at`, `updated_at`) VALUES
(1, '01', 'Beech Kristall', 1, '2019-09-30 13:47:38', '2019-10-01 08:42:26'),
(2, '02', 'Creme Uni', 2, '2019-10-01 06:12:56', '2019-10-01 08:42:26'),
(3, '03', 'Blanc Neige', 3, '2019-10-01 06:22:31', '2019-10-01 08:42:26'),
(7, '07', 'Chene Fonce', 7, '2019-10-01 06:48:55', '2019-10-01 08:42:26'),
(8, '05', 'Moka', 8, '2019-10-01 06:56:26', '2019-10-01 08:42:26'),
(9, '06', 'Vertical Marron', 9, '2019-10-01 08:02:58', '2019-10-01 08:42:26'),
(10, '08', 'Teak Blanc', 10, '2019-10-01 08:08:52', '2019-10-01 08:42:26'),
(11, '09', 'Cappuccino Claire', 11, '2019-10-01 08:18:49', '2019-10-01 08:42:26'),
(12, '010', 'Teck Fance', 12, '2019-10-01 08:24:22', '2019-10-01 08:42:26'),
(13, '011', 'Panama Marron Gloss', 13, '2019-10-01 08:27:34', '2019-10-01 08:42:26'),
(15, '04', 'acajou', 20, '2019-10-01 11:13:39', '2019-10-01 11:13:39'),
(16, '12', 'Noir', 173, '2019-10-06 11:46:39', '2019-10-06 11:46:39'),
(17, '13', 'Rouge', 174, '2019-10-06 11:47:33', '2019-10-06 11:47:33'),
(19, '15', 'Argent', 176, '2019-10-06 11:56:38', '2019-10-06 11:56:38'),
(20, '16', 'bleu', 211, '2019-10-07 05:47:21', '2019-10-07 05:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `color_image`
--

CREATE TABLE `color_image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `color_product`
--

CREATE TABLE `color_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `color_product`
--

INSERT INTO `color_product` (`id`, `product_id`, `color_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, NULL, NULL),
(2, 1, 7, NULL, NULL),
(3, 1, 8, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 2, 3, NULL, NULL),
(6, 2, 7, NULL, NULL),
(7, 3, 1, NULL, NULL),
(8, 4, 1, NULL, NULL),
(9, 6, 9, NULL, NULL),
(10, 6, 10, NULL, NULL),
(11, 6, 11, NULL, NULL),
(12, 7, 1, NULL, NULL),
(13, 8, 1, NULL, NULL),
(14, 9, 1, NULL, NULL),
(15, 10, 12, NULL, NULL),
(16, 10, 15, NULL, NULL),
(17, 11, 7, NULL, NULL),
(18, 11, 15, NULL, NULL),
(19, 12, 12, NULL, NULL),
(20, 12, 15, NULL, NULL),
(21, 13, 10, NULL, NULL),
(22, 13, 13, NULL, NULL),
(23, 14, 10, NULL, NULL),
(24, 14, 13, NULL, NULL),
(25, 15, 12, NULL, NULL),
(26, 16, 12, NULL, NULL),
(27, 17, 12, NULL, NULL),
(28, 18, 3, NULL, NULL),
(29, 18, 7, NULL, NULL),
(30, 18, 8, NULL, NULL),
(31, 18, 11, NULL, NULL),
(32, 19, 3, NULL, NULL),
(33, 19, 7, NULL, NULL),
(34, 19, 8, NULL, NULL),
(35, 19, 11, NULL, NULL),
(36, 20, 3, NULL, NULL),
(37, 20, 7, NULL, NULL),
(38, 20, 8, NULL, NULL),
(39, 20, 11, NULL, NULL),
(40, 21, 1, NULL, NULL),
(41, 22, 1, NULL, NULL),
(42, 23, 1, NULL, NULL),
(43, 24, 15, NULL, NULL),
(44, 25, 10, NULL, NULL),
(45, 26, 1, NULL, NULL),
(46, 27, 3, NULL, NULL),
(47, 27, 7, NULL, NULL),
(48, 27, 8, NULL, NULL),
(49, 27, 11, NULL, NULL),
(50, 28, 3, NULL, NULL),
(51, 28, 7, NULL, NULL),
(52, 28, 8, NULL, NULL),
(53, 28, 11, NULL, NULL),
(58, 31, 3, NULL, NULL),
(59, 31, 7, NULL, NULL),
(60, 31, 8, NULL, NULL),
(61, 31, 11, NULL, NULL),
(62, 32, 1, NULL, NULL),
(63, 33, 15, NULL, NULL),
(64, 34, 15, NULL, NULL),
(65, 29, 12, NULL, NULL),
(66, 29, 15, NULL, NULL),
(67, 35, 12, NULL, NULL),
(68, 35, 15, NULL, NULL),
(69, 36, 10, NULL, NULL),
(70, 37, 10, NULL, NULL),
(71, 38, 10, NULL, NULL),
(72, 39, 10, NULL, NULL),
(73, 40, 2, NULL, NULL),
(74, 40, 9, NULL, NULL),
(75, 41, 10, NULL, NULL),
(76, 42, 10, NULL, NULL),
(77, 43, 10, NULL, NULL),
(78, 44, 7, NULL, NULL),
(79, 45, 10, NULL, NULL),
(80, 46, 1, NULL, NULL),
(81, 47, 1, NULL, NULL),
(82, 48, 12, NULL, NULL),
(83, 49, 1, NULL, NULL),
(84, 50, 1, NULL, NULL),
(85, 51, 12, NULL, NULL),
(86, 52, 12, NULL, NULL),
(87, 53, 12, NULL, NULL),
(88, 53, 15, NULL, NULL),
(89, 54, 12, NULL, NULL),
(90, 54, 15, NULL, NULL),
(91, 55, 1, NULL, NULL),
(92, 56, 19, NULL, NULL),
(93, 57, 16, NULL, NULL),
(94, 58, 16, NULL, NULL),
(95, 59, 16, NULL, NULL),
(96, 60, 16, NULL, NULL),
(98, 62, 18, NULL, NULL),
(99, 63, 16, NULL, NULL),
(100, 64, 16, NULL, NULL),
(101, 65, 16, NULL, NULL),
(102, 66, 16, NULL, NULL),
(103, 67, 16, NULL, NULL),
(104, 68, 16, NULL, NULL),
(105, 69, 16, NULL, NULL),
(106, 70, 16, NULL, NULL),
(107, 71, 16, NULL, NULL),
(108, 72, 16, NULL, NULL),
(109, 73, 16, NULL, NULL),
(110, 74, 16, NULL, NULL),
(111, 75, 16, NULL, NULL),
(112, 76, 17, NULL, NULL),
(113, 77, 16, NULL, NULL),
(114, 78, 20, NULL, NULL),
(115, 79, 1, NULL, NULL),
(116, 79, 2, NULL, NULL),
(117, 80, 10, NULL, NULL),
(118, 81, 12, NULL, NULL),
(119, 81, 15, NULL, NULL),
(120, 82, 10, NULL, NULL),
(121, 82, 13, NULL, NULL),
(122, 61, 16, NULL, NULL),
(123, 61, 20, NULL, NULL),
(124, 61, 17, NULL, NULL),
(128, 83, 7, NULL, NULL),
(129, 84, 7, NULL, NULL),
(130, 85, 16, NULL, NULL),
(131, 90, 16, NULL, NULL),
(132, 56, 20, NULL, NULL),
(133, 91, 16, NULL, NULL),
(134, 64, 11, NULL, NULL),
(135, 92, 16, NULL, NULL),
(136, 93, 16, NULL, NULL),
(137, 94, 16, NULL, NULL),
(138, 95, 16, NULL, NULL),
(139, 96, 16, NULL, NULL),
(140, 97, 16, NULL, NULL),
(141, 98, 16, NULL, NULL),
(142, 99, 16, NULL, NULL),
(143, 100, 16, NULL, NULL),
(144, 101, 16, NULL, NULL),
(145, 102, 16, NULL, NULL),
(146, 103, 16, NULL, NULL),
(147, 104, 16, NULL, NULL),
(148, 105, 15, NULL, NULL),
(149, 106, 16, NULL, NULL),
(150, 107, 16, NULL, NULL),
(151, 108, 16, NULL, NULL),
(152, 109, 16, NULL, NULL),
(153, 110, 16, NULL, NULL),
(154, 110, 17, NULL, NULL),
(155, 111, 11, NULL, NULL),
(156, 112, 16, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `path`, `created_at`, `updated_at`) VALUES
(1, '/storage/colorImages/j38zxyxziV9XsZ0ic790AivcrObm6rgfHquj2GUx.png', '2019-09-30 13:47:38', '2019-09-30 13:47:38'),
(2, '/storage/colorImages/zjHpgrmcQp6EXn04o0Ffa4bs2b1qBNOo24OPXp09.png', '2019-10-01 06:12:56', '2019-10-01 06:12:56'),
(3, '/storage/colorImages/6SPgaAtIRM8GFXRyhHF79o9vV59Tay7pLB2BPFl3.png', '2019-10-01 06:22:31', '2019-10-01 06:22:31'),
(4, '/storage/colorImages/u2D9vfp1IXjLyX4diAqw7oY8dc3oz9SUnbRSPmbC.png', '2019-10-01 06:30:56', '2019-10-01 06:30:56'),
(5, '/storage/colorImages/pZ5Lx5BIkiK2qX80ysSv0Rtv065ol1KhmZwG5Iof.png', '2019-10-01 06:35:08', '2019-10-01 06:35:08'),
(6, '/storage/colorImages/DpVjDNGcjA2cyF7ogp64K43u9xBnhXhuRPSKFJA7.png', '2019-10-01 06:44:01', '2019-10-01 06:44:01'),
(7, '/storage/colorImages/tsiEcOX5Q7k4yO5fq27pOY292pLAwvjTWkQZZumR.png', '2019-10-01 06:48:55', '2019-10-01 06:48:55'),
(8, '/storage/colorImages/Yi4y5l73HghhUxdbptEcxvhPwv4R2RJALjemZkCu.png', '2019-10-01 06:56:26', '2019-10-01 06:56:26'),
(9, '/storage/colorImages/5Vey5VEmMFISzcKaGDcVF8JWBOoBsfm5wTwQTjCr.png', '2019-10-01 08:02:58', '2019-10-01 08:02:58'),
(10, '/storage/colorImages/SqtlXt8pBUQMUQhwuUYqjElTRhYoNPJ451qbiaKC.png', '2019-10-01 08:08:52', '2019-10-01 08:08:52'),
(11, '/storage/colorImages/ELaFwyXZms50kO8ku3I3WASy72dOuQLHGghj1x8F.png', '2019-10-01 08:18:49', '2019-10-01 08:18:49'),
(12, '/storage/colorImages/tSC245k3WpMOFytf1FnDeKmoBoeVB9lwK8VjQ1HC.png', '2019-10-01 08:24:22', '2019-10-01 08:24:22'),
(13, '/storage/colorImages/59r3wWoLBBtnLsSh8ES33z5arpnbvwFOtlaKDRZy.png', '2019-10-01 08:27:34', '2019-10-01 08:27:34'),
(19, '/storage/colorImages/d09aPa5vLuOKcfQLcL3aoChH2H6SNppcENNmpJSD.png', '2019-10-01 10:18:06', '2019-10-01 10:18:06'),
(20, '/storage/colorImages/r3wJMnQ6G7TENbbZpYyd3k2VCXwDqrNsCLwlZGM6.png', '2019-10-01 11:13:39', '2019-10-01 11:13:39'),
(38, '/storage/productImages/iXOGj4IGgmQTPO4ZbxOR25hiAkdsBrGth26XJIiY.png', '2019-10-02 12:45:55', '2019-10-02 12:45:55'),
(39, '/storage/productImages/VGpH3UXkWRuLCjLUqwcAKx8IuuaG2iQI7MYwNHfd.png', '2019-10-02 12:45:55', '2019-10-02 12:45:55'),
(40, '/storage/productCardImages/6hwe0l7LOvnHVZv7QZqFe81sem8x0rAofNJW6Ofo.png', '2019-10-02 12:45:55', '2019-10-02 12:45:55'),
(53, '/storage/productImages/vXYJKeKaLi7z1Tv9vlQ4R7Nlo9gUFmwU6oVTK0Wa.png', '2019-10-03 06:09:58', '2019-10-03 06:09:58'),
(54, '/storage/productImages/uIGD7TYKosXov2itmU9aHixWP1lBBToleXVzDe4W.png', '2019-10-03 06:09:58', '2019-10-03 06:09:58'),
(55, '/storage/productCardImages/a10ZCuNdq9xkWvnb3TsuERVAGeVKfm0VJaIa6OAM.png', '2019-10-03 06:09:58', '2019-10-03 06:09:58'),
(56, '/storage/productImages/Nl3pUuzZUWkTZEShG0yyyumM1QMC7TeTVop1Og2k.png', '2019-10-03 06:13:15', '2019-10-03 06:13:15'),
(57, '/storage/productImages/dbJgO3NCxdPFran1zTFK5T45t0M8tyIf7y9O8Q5Y.png', '2019-10-03 06:13:15', '2019-10-03 06:13:15'),
(58, '/storage/productCardImages/aDkwhPzPY6rlPFfkQY4EOcQwirrlmYHxSD4MBi4g.png', '2019-10-03 06:13:15', '2019-10-03 06:13:15'),
(60, '/storage/productCardImages/I6tUpmXbpqwdoW4igySTUTMKdilNrYYWpTtllTx6.png', '2019-10-03 06:35:17', '2019-10-03 06:35:17'),
(74, '/storage/productImages/i4VDSpZqvTlO8wEs8j05P0ClIDFF44GZ5itb4dZI.png', '2019-10-03 07:22:15', '2019-10-03 07:22:15'),
(75, '/storage/productImages/r4znxzfvNv3iSmJt9gQLl6KNFaZBmwqQNL8AOJyk.png', '2019-10-03 07:22:15', '2019-10-03 07:22:15'),
(76, '/storage/productCardImages/OpJXd7qZW03WBGpbQ15yJexe4gUaLWXIJTqYuhmV.png', '2019-10-03 07:22:15', '2019-10-03 07:22:15'),
(77, '/storage/productImages/RKZNHBRVkM7pg6Jl8IKqb4SIX5Rd6ZArAR1pvert.png', '2019-10-03 07:26:52', '2019-10-03 07:26:52'),
(78, '/storage/productImages/PtL1uXvby93qcVPHC0A8SBecENRzUwyW0ZtpfqSN.png', '2019-10-03 07:26:52', '2019-10-03 07:26:52'),
(79, '/storage/productCardImages/mVKSUc8eDe3ocdKY7ktPx1wrr6x686XQpsBTd3cz.png', '2019-10-03 07:26:52', '2019-10-03 07:26:52'),
(83, '/storage/productImages/GqyAHNVzp8xlVX5w5UXH2yNQmec3iUuLXHhh53Z8.png', '2019-10-03 07:42:41', '2019-10-03 07:42:41'),
(84, '/storage/productImages/lzhjJapieOuB7J3hHCMH6yQ2zcreqJ7qwmXVUnba.png', '2019-10-03 07:42:41', '2019-10-03 07:42:41'),
(85, '/storage/productCardImages/nSyFAReYQlF23xAUZV9hx3mAjhvV00nmos3jtbqZ.png', '2019-10-03 07:42:41', '2019-10-03 07:42:41'),
(86, '/storage/productImages/zQdfchB5GvO2s16hLU7VP65rPRuoIsx0ina4mX8w.png', '2019-10-03 08:03:24', '2019-10-03 08:03:24'),
(87, '/storage/productCardImages/7rYbNSTPoOQhfc8NaT7S3yHwBvphEuUT4uLKtvmf.png', '2019-10-03 08:03:24', '2019-10-03 08:03:24'),
(88, '/storage/productImages/fxNTCLxzUiqEZIo21CvPuX6vCg5BzsJMPF7nzUpf.png', '2019-10-03 08:15:51', '2019-10-03 08:15:51'),
(89, '/storage/productImages/6JGI5dPTlToX915GJvDQv6jindw3MBJi5jc9ZwEz.png', '2019-10-03 08:15:51', '2019-10-03 08:15:51'),
(90, '/storage/productCardImages/dKcuKTrw08ddC697a75Hhzct8U1TIK4odlkhFQSJ.png', '2019-10-03 08:15:51', '2019-10-03 08:15:51'),
(91, '/storage/productImages/J5m5geiuBZ5D6qcgPk6bie177LWzLDqtctHjVHGY.png', '2019-10-03 08:30:32', '2019-10-03 08:30:32'),
(92, '/storage/productImages/CkNaL728jA4dJ8h0gN9Atv0O3ukjUJqIn40OFpd3.png', '2019-10-03 08:30:32', '2019-10-03 08:30:32'),
(93, '/storage/productCardImages/h959QBLODgoXO0iEXGl4rmIPUo7EywrQxgv1Jnxg.png', '2019-10-03 08:30:32', '2019-10-03 08:30:32'),
(94, '/storage/productImages/Vx3DoqtBMRp8YE9bK2cuOU87RcjzPS2VLSNioZY7.png', '2019-10-03 08:42:26', '2019-10-03 08:42:26'),
(95, '/storage/productImages/Iyxn5OBu1cRVkkE07mk6aIajIwr9FhzyjEp3Ykvx.png', '2019-10-03 08:42:26', '2019-10-03 08:42:26'),
(96, '/storage/productCardImages/ZnbHk4KqW7Rj2yWW6htppVSkXPQqLIIfkCnkkR34.png', '2019-10-03 08:42:26', '2019-10-03 08:42:26'),
(100, '/storage/productImages/S0iWWsCO3FzmF1VhUBBoqQKtyc2zEgbcDO4aYqev.png', '2019-10-03 12:30:22', '2019-10-03 12:30:22'),
(101, '/storage/productImages/JlNFgxfwpiO2HvRG2M87TvYCVD3H3us9hdd9UlSB.png', '2019-10-03 12:30:22', '2019-10-03 12:30:22'),
(102, '/storage/productCardImages/LLAIQ0mEfvhAm18BSPPhbp7JwdxbveHXVoWKhYAP.png', '2019-10-03 12:30:22', '2019-10-03 12:30:22'),
(103, '/storage/productImages/n09BSr2U3w784TxmtqeShotmUBJu02sKO5aVQRPr.png', '2019-10-03 12:35:43', '2019-10-03 12:35:43'),
(104, '/storage/productImages/8qH0YwfZ0AKyBmDWBTUUzFhEbiC4Ity0BPyRIzy9.png', '2019-10-03 12:35:43', '2019-10-03 12:35:43'),
(105, '/storage/productCardImages/Y9kaogXZsc09DjbWa9PwTmpsX6Osr2uQQUgWvTm0.png', '2019-10-03 12:35:43', '2019-10-03 12:35:43'),
(106, '/storage/productImages/EbFf6EuOFsT4gS6DssfEcvgw7cadYi8x420x1qdx.png', '2019-10-03 12:40:41', '2019-10-03 12:40:41'),
(107, '/storage/productImages/wWqsk5br3ywsyilRuA0P9i4mBXt9aXgpjlkyz0sU.png', '2019-10-03 12:40:41', '2019-10-03 12:40:41'),
(108, '/storage/productCardImages/qDQL6jh3N8rpWcLWX9Juor6feXWlNXsZSFLnw695.png', '2019-10-03 12:40:41', '2019-10-03 12:40:41'),
(109, '/storage/productImages/aNTHR4e4TK1sphGoowQFA6zrEvpfT2ooeOo3uTqs.png', '2019-10-03 12:44:48', '2019-10-03 12:44:48'),
(110, '/storage/productImages/VvJXKvikA9s8Mw01pkp4JGfsfnCsnAcYLYPjmJKW.png', '2019-10-03 12:44:48', '2019-10-03 12:44:48'),
(111, '/storage/productCardImages/pYXAMgnHQjdtpTbdqVvaeBFMhq6EfjvcA9J13zNV.png', '2019-10-03 12:44:48', '2019-10-03 12:44:48'),
(115, '/storage/productImages/RBW816wK6UaESR5md3HIgH2KcBSnkjSaPCKNFNWr.png', '2019-10-04 10:49:00', '2019-10-04 10:49:00'),
(116, '/storage/productImages/oMudSaSMUBOMiNSX4xeCjmjdOxoIwZUY95b8GknN.png', '2019-10-04 10:49:00', '2019-10-04 10:49:00'),
(117, '/storage/productCardImages/5YJEXLOlGE4clvLttLPiNdvXnHxx3BuLAm3CKcI0.png', '2019-10-04 10:49:00', '2019-10-04 10:49:00'),
(130, '/storage/productImages/3qMhO8xW0fF6On8pQlDP6bx4LMVrYcrcs0WZAJvK.png', '2019-10-04 11:23:09', '2019-10-04 11:23:09'),
(131, '/storage/productCardImages/7papQqf5xXGFKgc0LIoQULiR8HClgyqmYrQX6u6J.png', '2019-10-04 11:23:09', '2019-10-04 11:23:09'),
(138, '/storage/productImages/GT9O7lo4mkc4ILoWJCqC2Xr4ICXHK40buG43VVzl.png', '2019-10-04 11:44:00', '2019-10-04 11:44:00'),
(139, '/storage/productCardImages/Io0T0jSiJOfuFKDvjMILkq9Az05YvitaMlXkEbUE.png', '2019-10-04 11:44:00', '2019-10-04 11:44:00'),
(140, '/storage/productImages/Tp5nJ0hh6jOo1akcLtG5goKuFJKGRqYphycDTkUP.png', '2019-10-04 11:46:50', '2019-10-04 11:46:50'),
(141, '/storage/productCardImages/tJ3Kez2hXxd3AesAezMLZQ7HnjJDhS6JNRBkOm18.png', '2019-10-04 11:46:50', '2019-10-04 11:46:50'),
(142, '/storage/productImages/ukCGyVMhBJDdW93WxEGZkZdg4d0F6re3sjZ9w5cq.png', '2019-10-04 11:53:35', '2019-10-04 11:53:35'),
(143, '/storage/productCardImages/hPi6Q95zzi0vd2YnLYmhny1fW180KtzlA3ww8bVa.png', '2019-10-04 11:53:35', '2019-10-04 11:53:35'),
(144, '/storage/productImages/dxnLRVfnQzSG422LECaHIUn1W40msAdht0G51PL4.png', '2019-10-04 11:58:33', '2019-10-04 11:58:33'),
(145, '/storage/productImages/2PEaO0dv6vWpMfpBj5IWU1i1O7omcQHOt4i5oNL9.png', '2019-10-04 11:58:33', '2019-10-04 11:58:33'),
(146, '/storage/productCardImages/47fR7zDJR8FFM3Xzf5AU4BVX6VJfwrnFPKoY879P.png', '2019-10-04 11:58:33', '2019-10-04 11:58:33'),
(167, '/storage/productImages/n0nDy56UZtrphFWtocSuGg6Mwd18P2442Donf1dY.png', '2019-10-05 08:46:15', '2019-10-05 08:46:15'),
(168, '/storage/productCardImages/ShaU9sjONYufghFmEKu01NZ4PVdQSCwZXOAY0E5T.png', '2019-10-05 08:46:15', '2019-10-05 08:46:15'),
(171, '/storage/productImages/nmdftI5C2ejCqMPKpxZCMohhIoShxE1zEWebmr1c.png', '2019-10-05 12:53:48', '2019-10-05 12:53:48'),
(172, '/storage/productCardImages/Ygbaoz6Ydv3BUO9fCWJ7Ug4BAeuCjVXDmINxWkQ2.png', '2019-10-05 12:53:48', '2019-10-05 12:53:48'),
(173, '/storage/colorImages/RIDQ1jwohHa5D47kgisihZAb6OrZ4u2IH1WZE9xW.jpeg', '2019-10-06 11:46:39', '2019-10-06 11:46:39'),
(174, '/storage/colorImages/sjVE33dNFEoME5I1F4tD8iDY5hOvMomZ4AhvGko5.jpeg', '2019-10-06 11:47:33', '2019-10-06 11:47:33'),
(175, '/storage/colorImages/CAHlmzhoOOs29iXAQ2DGROprsdgCYVJAwupyFNmK.png', '2019-10-06 11:55:56', '2019-10-06 11:55:56'),
(176, '/storage/colorImages/eGHHGqqg4G56VTvHjwgu9DTNIBRiRnZEVHql0OQa.png', '2019-10-06 11:56:38', '2019-10-06 11:56:38'),
(199, '/storage/productImages/kjMS7y4WMXISVq3VJnqVOLRnAdewvRJb6KwwQoBd.png', '2019-10-06 19:28:33', '2019-10-06 19:28:33'),
(200, '/storage/productCardImages/nWTwjRBwNOYbBtJzn0hEtNFed5VvPrI3o5rvrbNs.png', '2019-10-06 19:28:33', '2019-10-06 19:28:33'),
(203, '/storage/productImages/JPCheeZkgcQVW05jvX7uDJfSmgvgzHDrzS47KsTb.png', '2019-10-06 19:38:11', '2019-10-06 19:38:11'),
(204, '/storage/productCardImages/c8uBp8FYKcGN48xC9tGFUDSEMi6eoYkMENI8DikY.png', '2019-10-06 19:38:11', '2019-10-06 19:38:11'),
(205, '/storage/productImages/4qsPK6y66iYLXfW1Il6YYxBXZdR1QG14TGfy9tC8.png', '2019-10-06 19:46:35', '2019-10-06 19:46:35'),
(206, '/storage/productCardImages/k0AGrsFUePgRYu7RwcBz7rN1XIg9jxceucrDZwH7.png', '2019-10-06 19:46:35', '2019-10-06 19:46:35'),
(211, '/storage/colorImages/3mHAREUyfEDIEVANspMCJf0BLvojXxhIHiXkHofC.png', '2019-10-07 05:47:21', '2019-10-07 05:47:21'),
(212, '/storage/productImages/ik3ctPywejX70RLvbLk963VYhM397eZ17yUseiyr.png', '2019-10-07 05:51:40', '2019-10-07 05:51:40'),
(213, '/storage/productCardImages/pk3LAeZ5HnbtFoeXwsf9Gmi94eXTmBtqiOoPxgzm.png', '2019-10-07 05:51:40', '2019-10-07 05:51:40'),
(222, '/storage/productImages/ICRECMJOYmMoz3fTaHHMD7sEibOrTaMqbLgCT2ju.png', '2019-10-07 06:14:59', '2019-10-07 06:14:59'),
(223, '/storage/productCardImages/Y0jTp9E5DJhcltzLkQkl8ILX6zPsugYP2yeJRL8A.png', '2019-10-07 06:14:59', '2019-10-07 06:14:59'),
(227, '/storage/productImages/FPGWlGHaEONhjvwpWnibJdLhx1paaIfmGoWHLkxC.png', '2019-10-07 12:28:19', '2019-10-07 12:28:19'),
(228, '/storage/productCardImages/G1VZu47FekYdvn2Fif6qrhvm4muuv2PnOfbKDupa.png', '2019-10-07 12:28:19', '2019-10-07 12:28:19'),
(229, '/storage/productImages/L1g6RBqqUPzdhGTrASbY33H5cmHY3EPV3wTak4Yv.png', '2019-10-07 12:53:14', '2019-10-07 12:53:14'),
(230, '/storage/productCardImages/5lv56BNbB7pZD5ZFpbI5SU3Rtcc0HgP6UsT3s5ih.png', '2019-10-07 12:53:14', '2019-10-07 12:53:14'),
(231, '/storage/productImages/yPFbYemU7MCJfgfdUCsmdkzFP2gV6P8lhhELFVvt.png', '2019-10-07 13:04:49', '2019-10-07 13:04:49'),
(232, '/storage/productCardImages/ajT6FUpkZ28xarzsU9uT6sxNc6bxUSj1QGWOo2Ya.png', '2019-10-07 13:04:49', '2019-10-07 13:04:49'),
(238, '/storage/productCardImages/bF0KBKgQwfOFtUXcvQ3IoagQefQC0rwrLr6WkQNA.png', '2019-10-07 13:14:50', '2019-10-07 13:14:50'),
(248, '/storage/productImages/pLZ7g6s4hoADT9sAgAGbCOXlU0aZpdY0h57qC2LV.png', '2019-10-09 07:20:04', '2019-10-09 07:20:04'),
(249, '/storage/productCardImages/7QiGk0XzuaHhUTYzNkc24H9zO1azohjk9U2rXMRi.png', '2019-10-09 07:20:04', '2019-10-09 07:20:04'),
(254, '/storage/productImages/dqACHJLqif3pvMWeDFQMqbThvYdiMmYD6YSv8BY6.png', '2019-10-09 07:35:58', '2019-10-09 07:35:58'),
(255, '/storage/productCardImages/5MtELAbAYwhiTAA4wn76exRXnIZULju2pVt0V1UF.png', '2019-10-09 07:35:58', '2019-10-09 07:35:58'),
(258, '/storage/productImages/mH58XSOD7uRTFyV91o1sjwZrSq0HyCsd7RF2FP0i.png', '2019-10-09 08:31:01', '2019-10-09 08:31:01'),
(259, '/storage/productCardImages/YFxHQoE0JnL9xfUYMB20L8br4fwLzDSS2OTSWnGi.png', '2019-10-09 08:31:01', '2019-10-09 08:31:01'),
(267, '/storage/productSliderImages/K1j1927zcAFWCycKzuawVBmFCcgj9rqBG6MHzcvG.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(268, '/storage/productSliderImages/d14RvnhS3JmVybhcLeqXpqqIHsP3BS0WbOmOCM47.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(269, '/storage/productSliderImages/MownHJm73yyOEYV0JPz2cteQX9XwS1qSK0ZPi90e.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(270, '/storage/productSliderImages/2mQiZnB6OpQqdWfCyvHZhGVjc9cXUrjGWN7CLuq3.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(271, '/storage/productSliderImages/lXsMQKFyPxPZqn0lutUN7H3AoibZQFq0OmPR4Ix4.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(272, '/storage/productSliderImages/tEHeoA0fMhUlgmSZvIWtwSiA0Wl25acYuPFNZwaL.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(273, '/storage/productSliderImages/yjvpygEdTb8HXDc8r8DZrelJumTAZPwg85qDebu5.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(274, '/storage/productSliderImages/Xzw9BQzNKMEER5Qy6o201ZyVCHGwsBT9TtGgvEdp.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(276, '/storage/productSliderImages/tuufCfzhmOeRiklf6W3qevxH3mVFnG8AJFFxoZiM.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(278, '/storage/productSliderImages/hxBZI8yAgegzpJZ51GjCmGa5TKPEo2TX9LkikcR8.png', '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(279, '/storage/productImages/wye0KvKDx9K3Xw78b3xUqMg2DkE3Qtm4VPQLKCIW.png', '2019-10-09 18:04:49', '2019-10-09 18:04:49'),
(280, '/storage/productImages/kF8ay4mAftdF1GQdhNwuLirwgQJCW3vkGKtxHsss.png', '2019-10-09 18:04:49', '2019-10-09 18:04:49'),
(281, '/storage/productCardImages/080bx7TAT7gr10iZyDrjx0zMJb6T20oXl30cdOsO.png', '2019-10-09 18:04:49', '2019-10-09 18:04:49'),
(384, '/storage/productImages/siuljNwRhW8lWwia13gL88rC9F3k1dwQQs4Clewq.png', '2019-10-13 07:07:11', '2019-10-13 07:07:11'),
(385, '/storage/productImages/vJrTIL2Gv0u2umpwS2msWwECO9PX1LHSodQhJn5n.png', '2019-10-13 07:07:11', '2019-10-13 07:07:11'),
(386, '/storage/productImages/K1TTKW1rNeivESWF7Lo7JH0xKnbCzettQtS2eyFn.png', '2019-10-13 07:14:12', '2019-10-13 07:14:12'),
(387, '/storage/productImages/gmP93jiASHZZAigmvj9V6uT9Gnd7nqD2c6f9anFM.png', '2019-10-13 07:14:12', '2019-10-13 07:14:12'),
(416, '/storage/productCardImages/kBvZ4uPr5QHpeTRiIIcaAT5FEm3rHsfql92g04Xb.png', '2019-10-21 06:13:09', '2019-10-21 06:13:09'),
(417, '/storage/productImages/SQF7bDnlfrZ3QsqPzkSuXKugt39O6HG6ADd6UlFz.png', '2019-10-21 06:13:09', '2019-10-21 06:13:09'),
(418, '/storage/productImages/x3j04OnDzhDJ7QDmGi4cBZivKdIS22WUWYCvhF7j.png', '2019-10-21 06:13:09', '2019-10-21 06:13:09'),
(419, '/storage/productCardImages/KpB7XdLNGJnCxpaOdKZbXTj9VfhKpbiTGzcJyRVk.png', '2019-10-21 06:21:02', '2019-10-21 06:21:02'),
(420, '/storage/productImages/24cytv5MXQlJog50Whln5RCPbfsCtyAlPbxSzTJv.png', '2019-10-21 06:21:02', '2019-10-21 06:21:02'),
(421, '/storage/productImages/Itlact7CPYetiCLOLYUgsuVuIJUoQFCY5lPqYOov.png', '2019-10-21 06:21:02', '2019-10-21 06:21:02'),
(422, '/storage/productCardImages/3jZZ3dGZgeh2V29zdMkUsx05Tp4iIS7sGLdzmkZr.png', '2019-10-21 06:23:58', '2019-10-21 06:23:58'),
(423, '/storage/productImages/KnJ3vn16oem1VSgRRcT4d06Fas2aOQSc7WSTFxNE.png', '2019-10-21 06:23:58', '2019-10-21 06:23:58'),
(424, '/storage/productImages/UAvt2ozQHDQD05nPPsKtUtL94arl6IfiZ0ih6Y0J.png', '2019-10-21 06:23:58', '2019-10-21 06:23:58'),
(425, '/storage/productImages/5lr1QevI2H8oZYMCRkrU9Gf1UMmOgJP6SmKPoMUe.png', '2019-10-21 06:31:19', '2019-10-21 06:31:19'),
(426, '/storage/productImages/lbnuUjAflnQqEl3H4ZTUYHzBVd6Kzl4YdUQQ9pbX.png', '2019-10-21 06:31:19', '2019-10-21 06:31:19'),
(428, '/storage/productCardImages/9qM9p7XtGNeUdRJFmMfA3mbmQOgQaQQlFFBU138u.png', '2019-10-21 07:07:58', '2019-10-21 07:07:58'),
(431, '/storage/productCardImages/CX3JC9ODxb8YHXHyCtrDsK9weLZlVp9SXnD7hCdp.png', '2019-10-22 06:14:55', '2019-10-22 06:14:55'),
(432, '/storage/productImages/4dtVYO3L3drptVjUknVz3KppurylhWxAfvo7Z8Mi.png', '2019-10-22 06:14:55', '2019-10-22 06:14:55'),
(433, '/storage/productCardImages/4j6hn80cYrfjBtFTScMo5iA9WVW7khCqFortRzrM.png', '2019-10-22 06:17:48', '2019-10-22 06:17:48'),
(437, '/storage/productCardImages/HqoAciryEtcKYM87cjkPS4gzRbkB2JTir9MatnDZ.png', '2019-10-22 06:44:27', '2019-10-22 06:44:27'),
(438, '/storage/productImages/ZrpMb6I0JCdpKUXqIGnQNSfp2i3ORG1zD9nbRiRk.png', '2019-10-22 06:44:27', '2019-10-22 06:44:27'),
(439, '/storage/productCardImages/T9KYGyF91nLZYBZDqlgsu658Zxq1kYd2rxdgFT3C.png', '2019-10-22 06:49:26', '2019-10-22 06:49:26'),
(440, '/storage/productImages/cIp8H2NMHEgmO5rx4Vl8dgDEWXSZZl8XPwwyIpdM.png', '2019-10-22 06:49:26', '2019-10-22 06:49:26'),
(441, '/storage/productCardImages/j7yd4vpkpvVYjlOgHLcJakV7Hk3ZjTr8Medm5H4A.png', '2019-10-22 06:51:18', '2019-10-22 06:51:18'),
(442, '/storage/productImages/OqdFBoixL4xypcUwogLLqPK58SHpyLAkzvlq0kXZ.png', '2019-10-22 06:51:18', '2019-10-22 06:51:18'),
(443, '/storage/productCardImages/Ln8EE7QXrLWR3l767IRIoYb6QLrqPS9aRnyHERSn.png', '2019-10-22 06:56:31', '2019-10-22 06:56:31'),
(444, '/storage/productImages/WVgLtrRzDOzcJUkW3rjGQFQPxilSqjcfZF42MyHc.png', '2019-10-22 06:56:31', '2019-10-22 06:56:31'),
(445, '/storage/productCardImages/GrL1bx5EamkSZZHUaPycTD8kOpdAFwGRtqiKsu77.png', '2019-10-22 07:32:10', '2019-10-22 07:32:10'),
(446, '/storage/productImages/Mop7eMm5BNyeKNYrMD2fk4n9ghUf31Ir7TMIkgT1.png', '2019-10-22 07:32:10', '2019-10-22 07:32:10'),
(447, '/storage/productCardImages/s9x7Pzv5QK1MpyahOr4DNsh3oO4IaEtaFrg2hBgU.png', '2019-10-22 07:34:05', '2019-10-22 07:34:05'),
(448, '/storage/productImages/WtPtMpgnV1VUK0GeMcLrAnugFeXlq2v1aA6uh6Hx.png', '2019-10-22 07:34:05', '2019-10-22 07:34:05'),
(449, '/storage/productCardImages/uOZHKiqi4i07UAYlAW516g0w0hsv8Xw64wAy0Bal.png', '2019-10-22 07:35:25', '2019-10-22 07:35:25'),
(450, '/storage/productImages/KVIJosP6caevUyWgQcZ9GHpbZ0eRFLjWuJEtrTOQ.png', '2019-10-22 07:35:25', '2019-10-22 07:35:25'),
(451, '/storage/productCardImages/V8n1N9eukynWE2f74HzlkjhY1Br91SAH4mNEFW8c.png', '2019-10-22 07:39:01', '2019-10-22 07:39:01'),
(452, '/storage/productImages/TpGoMjnV9OA3UbgvdNjvabRIy1EoNvVHR4Nv09jn.png', '2019-10-22 07:39:01', '2019-10-22 07:39:01'),
(453, '/storage/productCardImages/sF1zf9nz5lBK2faED12PowCSym5zjoZJNmoItlxg.png', '2019-10-22 07:40:06', '2019-10-22 07:40:06'),
(454, '/storage/productImages/2Jja2sIdrevdVLVW2j1z1Hh9LbakYVicm7XdQooI.png', '2019-10-22 07:40:06', '2019-10-22 07:40:06'),
(455, '/storage/productCardImages/9yfwBKuQIJucQkHsfSlh1K9lLb6EtZP5xnHYl8vJ.png', '2019-10-22 07:41:34', '2019-10-22 07:41:34'),
(456, '/storage/productImages/5PGIEciSRqqjYdUnKR5MUTc1mU1JNeud1i80NulP.png', '2019-10-22 07:41:34', '2019-10-22 07:41:34'),
(457, '/storage/productCardImages/fHsoADhVhipTZ9v9lqFxHPyg33SulfYvXNRXrmie.png', '2019-10-22 07:43:03', '2019-10-22 07:43:03'),
(458, '/storage/productImages/uiSxveaD2f2vw3gdEVS9fTSh3SohQ8bGaMOto55y.png', '2019-10-22 07:43:03', '2019-10-22 07:43:03'),
(459, '/storage/productCardImages/ZoAM6E74qst2AthNN0aADb6wKgHvoT841QekcOIM.png', '2019-10-22 07:44:58', '2019-10-22 07:44:58'),
(460, '/storage/productImages/jHtdLRKc72ClSjrWRC74b2G2KliwlNQuLyRho5ZK.png', '2019-10-22 07:44:58', '2019-10-22 07:44:58'),
(461, '/storage/productCardImages/BmGOamJ79ll1Y5QWjPLflBaXVos1ifGnb0k3FSu2.png', '2019-10-22 07:46:48', '2019-10-22 07:46:48'),
(462, '/storage/productImages/5opQVLPqTCwrZjWnmJEw30tiAeSx2yhzcgldIi80.png', '2019-10-22 07:46:48', '2019-10-22 07:46:48'),
(463, '/storage/productCardImages/Szt99TizQDKaOsPFx7839s6QcJe4OnsnHcXZPLl2.png', '2019-10-22 07:47:59', '2019-10-22 07:47:59'),
(464, '/storage/productImages/KbkJCBthgkwYFbk1SiEUGuTxELUL9ZiawS3lgK3F.png', '2019-10-22 07:47:59', '2019-10-22 07:47:59'),
(465, '/storage/productCardImages/bE8RAKzALj6MsGQtlplD4ZcWqEAvBdZR6fP3tQ2b.png', '2019-10-22 07:52:37', '2019-10-22 07:52:37'),
(466, '/storage/productImages/8sQPK2OY7tOdUTHH2MvyiHxdrpqRhTEsQzgOsz20.png', '2019-10-22 07:52:37', '2019-10-22 07:52:37'),
(468, '/storage/productCardImages/dYoCx1sH9kyGPgQYb45zjli4pPTRz4M3AQ9lD6d5.png', '2019-10-22 07:55:22', '2019-10-22 07:55:22'),
(469, '/storage/productImages/pqhKeY0bHX32P7JkSuzpQkNcsoyUFdEeLhm9n5Uq.png', '2019-10-22 07:55:22', '2019-10-22 07:55:22'),
(471, '/storage/productImages/0tRdZGv6IcPPUDZEfuh1y54qDW1R48LLbPszGslg.png', '2019-10-22 07:59:10', '2019-10-22 07:59:10'),
(474, '/storage/productImages/KrVz1laE4UB3px0ekCBVEpv3qiw9ZqoOPQd65c5F.png', '2019-10-22 08:07:27', '2019-10-22 08:07:27'),
(475, '/storage/productCardImages/BHYB9uffRlnTvlQQQSBRJ0bluVVUXc1ROwFay4cd.png', '2019-10-22 08:10:32', '2019-10-22 08:10:32'),
(476, '/storage/productImages/sA7SYeHeBN2piznwSP7MeVDaqCsBn99X5xErmzVT.png', '2019-10-22 08:10:32', '2019-10-22 08:10:32'),
(477, '/storage/productCardImages/W2s6Ip01BPx6YDQB8ggiR71ACrL6OnpNkV7h4KrI.png', '2019-10-22 08:14:43', '2019-10-22 08:14:43'),
(478, '/storage/productImages/eKAPuMZCEwWqA8WnZbnQztDDkUYRhlTe0DFsrM64.png', '2019-10-22 08:14:43', '2019-10-22 08:14:43'),
(480, '/storage/productImages/r1OBkH5UAxI0aJaBErFa3BO8aWSB5Z1YTVZuOe12.png', '2019-10-22 08:16:38', '2019-10-22 08:16:38'),
(481, '/storage/productCardImages/wfzIYk6MXZJnbQa21uPHYJD1HafAeWe52KC9152p.png', '2019-10-22 08:18:34', '2019-10-22 08:18:34'),
(482, '/storage/productCardImages/SqamzgVseUOSzgVMMrUaeNFlv1KcFl6DkC6GGZIJ.png', '2019-10-22 08:21:19', '2019-10-22 08:21:19'),
(483, '/storage/productCardImages/Cm9AlTI6mRCelDz0PAUEBc7BXuPmjYedQ2xzwZmL.png', '2019-10-22 08:26:03', '2019-10-22 08:26:03'),
(484, '/storage/productImages/ns68jCvo3QqCC94uA9bWyYpBRfQUaGggnmqpGbzG.png', '2019-10-22 08:26:03', '2019-10-22 08:26:03'),
(486, '/storage/productCardImages/AFwPq6kGTpvWntq4Gud5l707mXnetYlkaUG39Ky5.png', '2019-10-22 08:28:30', '2019-10-22 08:28:30'),
(487, '/storage/productCardImages/3vTmNZRTVC9jxflyOAkfspuvcxZVrZ2WPjgEHcm6.png', '2019-10-22 08:30:32', '2019-10-22 08:30:32'),
(488, '/storage/productImages/La50B7S2l2n3o2pIUf3OzF2Vh04yur16DZnJXgBA.png', '2019-10-22 08:30:32', '2019-10-22 08:30:32'),
(489, '/storage/productImages/uYITJI3vaaf98NArxLlh5zwLEqfmV94vQZVuxON0.png', '2019-10-22 08:30:32', '2019-10-22 08:30:32'),
(490, '/storage/productImages/2w9syRyTPFN5mOGKjxEKP2vh3fDo47CXvTyJQqJb.png', '2019-10-22 08:36:27', '2019-10-22 08:36:27'),
(491, '/storage/productCardImages/OnVteq8KIKwSk0j5L42b7AgIFYMruPVfceDNwToQ.png', '2019-10-22 08:36:27', '2019-10-22 08:36:27'),
(492, '/storage/productImages/yObazI8cSaKhpfCkwevL11qGPSZFZf3pjIn9REmw.png', '2019-10-22 08:41:05', '2019-10-22 08:41:05'),
(493, '/storage/productImages/2mDUVcsbQLj0Ka0Ey8gMqPMEM9qDihJL40zC1DoW.png', '2019-10-22 08:43:31', '2019-10-22 08:43:31'),
(494, '/storage/productImages/CFrVV1Tmw8hANzJTg9yOP3ozAU6tBlA0Jikg5VQV.png', '2019-10-22 08:43:31', '2019-10-22 08:43:31'),
(495, '/storage/productCardImages/YYy1Cc2IrccaIHGtRrQdYVcaY8ef0LawVUXhFBTM.png', '2019-10-22 08:43:31', '2019-10-22 08:43:31'),
(496, '/storage/productImages/7j2xOqONYSb6gogF8nnnVeRp7lQd3k6f4XWrF6du.png', '2019-10-22 08:45:36', '2019-10-22 08:45:36'),
(497, '/storage/productCardImages/WEYhZsSlR1AznA43JC2FkO1UcxlT4s8oHlco2ETW.png', '2019-10-22 08:45:36', '2019-10-22 08:45:36'),
(498, '/storage/productImages/PFK5g9eFisZoYYulqGqaw0pW0uQbMAtzV1JwL6l2.png', '2019-10-22 08:47:38', '2019-10-22 08:47:38'),
(499, '/storage/productCardImages/VHMucOkLLkrGVldZOCSYcXOe7WwYn5amD2AwtKx7.png', '2019-10-22 08:47:38', '2019-10-22 08:47:38'),
(500, '/storage/productImages/YFhbMJvgc3J2MTa6Fn1YhemE02nhvAIGR3fvJUAo.png', '2019-10-22 08:50:12', '2019-10-22 08:50:12'),
(501, '/storage/productImages/RrQxAnbmTsJc6Z1up3Xs7PPcXohfUXKdDSrUF2Nv.png', '2019-10-22 08:50:12', '2019-10-22 08:50:12'),
(502, '/storage/productCardImages/X65RlZFRb9vy5x4Uk9tSDV11kTbfAn2z76m0r12v.png', '2019-10-22 08:50:12', '2019-10-22 08:50:12'),
(503, '/storage/productImages/jH7pI1m4daJbBBv02tEEvZ6DQzMgmkBRDhBL6mls.png', '2019-10-22 08:52:48', '2019-10-22 08:52:48'),
(504, '/storage/productImages/dz7AtcKYF0hQTJbXk8SAHl4lrq4qbvrBiFmyC64h.png', '2019-10-22 08:52:48', '2019-10-22 08:52:48'),
(505, '/storage/productCardImages/9YdbY8ub8SQdZT7uKYRjZrMjJKfhmAuhQyYgevjp.png', '2019-10-22 08:52:48', '2019-10-22 08:52:48'),
(506, '/storage/productImages/1fi2MZg9zeemr36bAnzTUO8PsavYIWti3715syrO.png', '2019-10-22 08:55:14', '2019-10-22 08:55:14'),
(507, '/storage/productImages/0N3ELcZzHZPZfRygDI9ea7L3obaPOwjnGYP9WfMv.png', '2019-10-22 08:55:14', '2019-10-22 08:55:14'),
(508, '/storage/productCardImages/d54IYU97bQjOQDylNMwpsfMoVf7kIbFZZmoZZ9vZ.png', '2019-10-22 08:55:14', '2019-10-22 08:55:14'),
(509, '/storage/productImages/1rVY8oLBih7nGXlQFzIEqDWmKzwuVx5FyCOSFYVZ.png', '2019-10-22 08:58:16', '2019-10-22 08:58:16'),
(510, '/storage/productImages/3XwiodrjnVrgleYOQYXq3XkAUUuObkm7gbC0KHBm.png', '2019-10-22 08:58:16', '2019-10-22 08:58:16'),
(511, '/storage/productCardImages/WuWwGELt21kEzUTeO70xzdmMms44IA2yA1y9XO3Y.png', '2019-10-22 08:58:16', '2019-10-22 08:58:16'),
(512, '/storage/productCardImages/Wn95xBqPBeNawSfolzSOHyzfq3UFYOvlcZRVzUCR.png', '2019-10-27 13:53:22', '2019-10-27 13:53:22'),
(513, '/storage/productImages/Va8SArAXybrjDlnTEVpHDi3wZA2qaceqk2EU0TQj.png', '2019-10-27 13:53:22', '2019-10-27 13:53:22'),
(516, '/storage/productCardImages/CE3qytxSXxK8f8hjuB0gVHxJXSdbMagTZKj2BImb.jpeg', '2019-12-15 12:45:38', '2019-12-15 12:45:38'),
(519, '/storage/productCardImages/bdYAn226SeYhqZ3TWhXApoEP8W3ACpSJ9i3V3o9o.jpeg', '2019-12-15 12:49:13', '2019-12-15 12:49:13'),
(520, '/storage/productImages/hraBZwcnFZwFn1ZVquk70kN1gLuqB3gW8l1CkUUb.jpeg', '2019-12-15 13:03:28', '2019-12-15 13:03:28'),
(521, '/storage/productCardImages/fMNdaO3pNZS21KFxP6DoA1edFQvWZuWZu49qEY0W.jpeg', '2019-12-15 13:03:28', '2019-12-15 13:03:28'),
(523, '/storage/productImages/WDWElGXy8e6ffFt4u6mBNe8nNRlNi6gvrVVWbqOa.jpeg', '2019-12-15 13:12:48', '2019-12-15 13:12:48'),
(524, '/storage/productImages/rJqi5OKzTz6q16Jwzbd3XgbhGLxEip3FdX1I0lfU.jpeg', '2019-12-15 13:14:53', '2019-12-15 13:14:53'),
(525, '/storage/productImages/RO0gRcqLGPTcUCM3obW0Zg0Zp3Vh7yCZ1nIdLlDw.jpeg', '2019-12-15 13:19:42', '2019-12-15 13:19:42'),
(526, '/storage/productCardImages/YGMH1HApZnolQsIcZcbtaeb8AOodec9ah38Klar9.jpeg', '2019-12-15 13:19:42', '2019-12-15 13:19:42'),
(527, '/storage/productImages/QLBPLDDKYqmixFqySqYi45GLXFSJMzaFMWbK1b4W.png', '2019-12-16 08:01:23', '2019-12-16 08:01:23'),
(528, '/storage/productCardImages/1zjgTFZtci0neXplg5fOBXJF7l6xzNhAwhnPgsY5.png', '2019-12-16 08:01:23', '2019-12-16 08:01:23'),
(529, '/storage/productImages/dWQuzhOY1tGbA1uOZE5Ryz6p3GdBjW6VyKlXv1iL.png', '2019-12-16 08:08:36', '2019-12-16 08:08:36'),
(530, '/storage/productCardImages/zVmcYhEYkV7ApBXL0KCwXVhZec9Da59rXrk7FRsI.png', '2019-12-16 08:08:36', '2019-12-16 08:08:36'),
(531, '/storage/productImages/NxEMCSGl1xFLPY1KCEmzUTeWeYQWkI4NmjuepdoR.jpeg', '2019-12-18 11:48:11', '2019-12-18 11:48:11'),
(532, '/storage/productCardImages/P3NFqEu3q95tuz02GlZJuoPW0Ejc8yMrJKnDdZqw.jpeg', '2019-12-18 11:48:11', '2019-12-18 11:48:11'),
(533, '/storage/productImages/UXoD1vF7dv67OgKX2LAtBBw7B7ONMxwrRuZ48m8E.png', '2020-02-04 08:30:29', '2020-02-04 08:30:29'),
(534, '/storage/productImages/d8oirvqITZOeoci58bABKZHJs3s8EbZqd7AOzY5E.png', '2020-02-04 08:30:29', '2020-02-04 08:30:29'),
(535, '/storage/productCardImages/vSjrb4WLYEtAl7YTYIGgfkHwIOOoe9ODLnmY9RNT.png', '2020-02-04 08:30:29', '2020-02-04 08:30:29'),
(536, '/storage/productImages/S6saoffD2ggoXquJN0O4seGjMlXoEacEkmATStmV.png', '2020-02-04 08:34:20', '2020-02-04 08:34:20'),
(537, '/storage/productCardImages/nptDO8ZzBtQhUa9x3D5xs4FrBlsBuOhOxpMnB8IC.png', '2020-02-04 08:34:20', '2020-02-04 08:34:20'),
(538, '/storage/productImages/sk0l3A2ut8RuwhcfC2Lxlqv8Zgm0939qdmPJKmy1.png', '2020-02-04 08:42:25', '2020-02-04 08:42:25'),
(539, '/storage/productCardImages/GaTOs7Z2rD6hW17x2trc1tI3Enz8MKJPTACSavDX.png', '2020-02-04 08:42:25', '2020-02-04 08:42:25'),
(540, '/storage/productImages/NX8lSbcLoHVUNtXLeSeiFUI3UsfXo6lEcYxcRtSI.png', '2020-02-04 08:47:06', '2020-02-04 08:47:06'),
(541, '/storage/productCardImages/YE1nW6ZrSvn6Fqog3k90rwfExtnRLPmWGsLvLrYS.png', '2020-02-04 08:47:06', '2020-02-04 08:47:06'),
(542, '/storage/productImages/moNWYLdHWoWNZjzrIOsDUns3kyZm4hCfQaWRKqtI.png', '2020-02-04 09:19:24', '2020-02-04 09:19:24'),
(543, '/storage/productCardImages/lJdFZDKpL7n5i1hg5hp3e7He22b7321t0hcgBAKl.png', '2020-02-04 09:19:24', '2020-02-04 09:19:24'),
(544, '/storage/productImages/EbuliiZKMkEfHfHh5gfvhSHNdv2hq1bsJhMFQKJt.png', '2020-02-04 09:21:37', '2020-02-04 09:21:37'),
(545, '/storage/productCardImages/UWy41Up1ADHA0ESADNIoYrC1fFbxHgX6oo9PTh1D.png', '2020-02-04 09:21:37', '2020-02-04 09:21:37'),
(546, '/storage/productImages/nym8nl2sXprUWCAGsrcXGYuS6yXAxm1HDAXKWMaV.png', '2020-02-04 09:38:13', '2020-02-04 09:38:13'),
(547, '/storage/productCardImages/twrg7jaHLu8y8lUZM3BqfvuP1d3wTIFjKgCCGQ8q.png', '2020-02-04 09:38:13', '2020-02-04 09:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `image_product`
--

CREATE TABLE `image_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `image_type` enum('card','slider','collection_card','product_image') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_product`
--

INSERT INTO `image_product` (`id`, `product_id`, `image_id`, `image_type`, `created_at`, `updated_at`) VALUES
(1, 1, 14, 'product_image', NULL, NULL),
(2, 1, 15, 'product_image', NULL, NULL),
(3, 1, 16, 'product_image', NULL, NULL),
(4, 1, 17, 'card', NULL, NULL),
(5, 1, 18, 'slider', NULL, NULL),
(6, 2, 21, 'product_image', NULL, NULL),
(7, 2, 22, 'product_image', NULL, NULL),
(8, 2, 23, 'card', NULL, NULL),
(9, 2, 24, 'slider', NULL, NULL),
(10, 3, 25, 'product_image', NULL, NULL),
(11, 3, 26, 'card', NULL, NULL),
(12, 4, 27, 'product_image', NULL, NULL),
(13, 4, 28, 'product_image', NULL, NULL),
(14, 4, 29, 'card', NULL, NULL),
(15, 6, 30, 'product_image', NULL, NULL),
(16, 6, 31, 'card', NULL, NULL),
(17, 7, 32, 'product_image', NULL, NULL),
(18, 7, 33, 'product_image', NULL, NULL),
(19, 7, 34, 'card', NULL, NULL),
(20, 8, 35, 'product_image', NULL, NULL),
(21, 8, 36, 'product_image', NULL, NULL),
(22, 8, 37, 'card', NULL, NULL),
(23, 9, 38, 'product_image', NULL, NULL),
(24, 9, 39, 'product_image', NULL, NULL),
(25, 9, 40, 'card', NULL, NULL),
(30, 11, 45, 'product_image', NULL, NULL),
(31, 11, 46, 'product_image', NULL, NULL),
(32, 11, 47, 'product_image', NULL, NULL),
(33, 11, 48, 'card', NULL, NULL),
(34, 12, 49, 'product_image', NULL, NULL),
(35, 12, 50, 'product_image', NULL, NULL),
(36, 12, 51, 'product_image', NULL, NULL),
(37, 12, 52, 'card', NULL, NULL),
(38, 13, 53, 'product_image', NULL, NULL),
(39, 13, 54, 'product_image', NULL, NULL),
(40, 13, 55, 'card', NULL, NULL),
(41, 14, 56, 'product_image', NULL, NULL),
(42, 14, 57, 'product_image', NULL, NULL),
(43, 14, 58, 'card', NULL, NULL),
(45, 15, 60, 'card', NULL, NULL),
(50, 18, 65, 'product_image', NULL, NULL),
(51, 18, 66, 'product_image', NULL, NULL),
(52, 18, 67, 'card', NULL, NULL),
(53, 19, 68, 'product_image', NULL, NULL),
(54, 19, 69, 'product_image', NULL, NULL),
(55, 19, 70, 'card', NULL, NULL),
(56, 20, 71, 'product_image', NULL, NULL),
(57, 20, 72, 'product_image', NULL, NULL),
(58, 20, 73, 'card', NULL, NULL),
(59, 21, 74, 'product_image', NULL, NULL),
(60, 21, 75, 'product_image', NULL, NULL),
(61, 21, 76, 'card', NULL, NULL),
(62, 22, 77, 'product_image', NULL, NULL),
(63, 22, 78, 'product_image', NULL, NULL),
(64, 22, 79, 'card', NULL, NULL),
(65, 23, 80, 'product_image', NULL, NULL),
(66, 23, 81, 'product_image', NULL, NULL),
(67, 23, 82, 'card', NULL, NULL),
(68, 24, 83, 'product_image', NULL, NULL),
(69, 24, 84, 'product_image', NULL, NULL),
(70, 24, 85, 'card', NULL, NULL),
(71, 25, 86, 'product_image', NULL, NULL),
(72, 25, 87, 'card', NULL, NULL),
(73, 26, 88, 'product_image', NULL, NULL),
(74, 26, 89, 'product_image', NULL, NULL),
(75, 26, 90, 'card', NULL, NULL),
(76, 27, 91, 'product_image', NULL, NULL),
(77, 27, 92, 'product_image', NULL, NULL),
(78, 27, 93, 'card', NULL, NULL),
(79, 28, 94, 'product_image', NULL, NULL),
(80, 28, 95, 'product_image', NULL, NULL),
(81, 28, 96, 'card', NULL, NULL),
(85, 31, 100, 'product_image', NULL, NULL),
(86, 31, 101, 'product_image', NULL, NULL),
(87, 31, 102, 'card', NULL, NULL),
(88, 32, 103, 'product_image', NULL, NULL),
(89, 32, 104, 'product_image', NULL, NULL),
(90, 32, 105, 'card', NULL, NULL),
(91, 33, 106, 'product_image', NULL, NULL),
(92, 33, 107, 'product_image', NULL, NULL),
(93, 33, 108, 'card', NULL, NULL),
(94, 34, 109, 'product_image', NULL, NULL),
(95, 34, 110, 'product_image', NULL, NULL),
(96, 34, 111, 'card', NULL, NULL),
(100, 35, 115, 'product_image', NULL, NULL),
(101, 35, 116, 'product_image', NULL, NULL),
(102, 35, 117, 'card', NULL, NULL),
(103, 36, 118, 'product_image', NULL, NULL),
(104, 36, 119, 'card', NULL, NULL),
(105, 37, 120, 'product_image', NULL, NULL),
(106, 37, 121, 'card', NULL, NULL),
(107, 38, 122, 'product_image', NULL, NULL),
(108, 38, 123, 'card', NULL, NULL),
(109, 36, 124, 'product_image', NULL, NULL),
(110, 36, 125, 'card', NULL, NULL),
(111, 37, 126, 'product_image', NULL, NULL),
(112, 37, 127, 'card', NULL, NULL),
(113, 38, 128, 'product_image', NULL, NULL),
(114, 38, 129, 'card', NULL, NULL),
(115, 39, 130, 'product_image', NULL, NULL),
(116, 39, 131, 'card', NULL, NULL),
(121, 37, 136, 'product_image', NULL, NULL),
(122, 37, 137, 'card', NULL, NULL),
(123, 41, 138, 'product_image', NULL, NULL),
(124, 41, 139, 'card', NULL, NULL),
(125, 42, 140, 'product_image', NULL, NULL),
(126, 42, 141, 'card', NULL, NULL),
(127, 43, 142, 'product_image', NULL, NULL),
(128, 43, 143, 'card', NULL, NULL),
(129, 44, 144, 'product_image', NULL, NULL),
(130, 44, 145, 'product_image', NULL, NULL),
(131, 44, 146, 'card', NULL, NULL),
(142, 50, 157, 'product_image', NULL, NULL),
(143, 50, 158, 'card', NULL, NULL),
(152, 55, 167, 'product_image', NULL, NULL),
(153, 55, 168, 'card', NULL, NULL),
(156, 21, 171, 'product_image', NULL, NULL),
(157, 21, 172, 'card', NULL, NULL),
(162, 58, 181, 'product_image', NULL, NULL),
(163, 58, 182, 'card', NULL, NULL),
(180, 67, 199, 'product_image', NULL, NULL),
(181, 67, 200, 'card', NULL, NULL),
(184, 69, 203, 'product_image', NULL, NULL),
(185, 69, 204, 'card', NULL, NULL),
(186, 70, 205, 'product_image', NULL, NULL),
(187, 70, 206, 'card', NULL, NULL),
(192, 73, 212, 'product_image', NULL, NULL),
(193, 73, 213, 'card', NULL, NULL),
(202, 78, 222, 'product_image', NULL, NULL),
(203, 78, 223, 'card', NULL, NULL),
(207, 80, 227, 'product_image', NULL, NULL),
(208, 80, 228, 'card', NULL, NULL),
(209, 81, 229, 'product_image', NULL, NULL),
(210, 81, 230, 'card', NULL, NULL),
(211, 82, 231, 'product_image', NULL, NULL),
(212, 82, 232, 'card', NULL, NULL),
(218, 29, 238, 'card', NULL, NULL),
(228, 71, 248, 'product_image', NULL, NULL),
(229, 71, 249, 'card', NULL, NULL),
(234, 72, 254, 'product_image', NULL, NULL),
(235, 72, 255, 'card', NULL, NULL),
(238, 79, 258, 'product_image', NULL, NULL),
(239, 79, 259, 'card', NULL, NULL),
(246, 62, 279, 'product_image', NULL, NULL),
(247, 62, 280, 'product_image', NULL, NULL),
(248, 62, 281, 'card', NULL, NULL),
(351, 29, 384, 'product_image', NULL, NULL),
(352, 29, 385, 'product_image', NULL, NULL),
(353, 15, 386, 'product_image', NULL, NULL),
(354, 15, 387, 'product_image', NULL, NULL),
(383, 10, 416, 'card', NULL, NULL),
(384, 10, 417, 'product_image', NULL, NULL),
(385, 10, 418, 'product_image', NULL, NULL),
(386, 17, 419, 'card', NULL, NULL),
(387, 17, 420, 'product_image', NULL, NULL),
(388, 17, 421, 'product_image', NULL, NULL),
(389, 83, 422, 'card', NULL, NULL),
(390, 83, 423, 'product_image', NULL, NULL),
(391, 83, 424, 'product_image', NULL, NULL),
(392, 90, 425, 'product_image', NULL, NULL),
(393, 90, 426, 'product_image', NULL, NULL),
(395, 90, 428, 'card', NULL, NULL),
(398, 60, 431, 'card', NULL, NULL),
(399, 60, 432, 'product_image', NULL, NULL),
(400, 64, 433, 'card', NULL, NULL),
(404, 40, 437, 'card', NULL, NULL),
(405, 40, 438, 'product_image', NULL, NULL),
(406, 45, 439, 'card', NULL, NULL),
(407, 45, 440, 'product_image', NULL, NULL),
(408, 46, 441, 'card', NULL, NULL),
(409, 46, 442, 'product_image', NULL, NULL),
(410, 47, 443, 'card', NULL, NULL),
(411, 47, 444, 'product_image', NULL, NULL),
(412, 48, 445, 'card', NULL, NULL),
(413, 48, 446, 'product_image', NULL, NULL),
(414, 49, 447, 'card', NULL, NULL),
(415, 49, 448, 'product_image', NULL, NULL),
(416, 51, 449, 'card', NULL, NULL),
(417, 51, 450, 'product_image', NULL, NULL),
(418, 52, 451, 'card', NULL, NULL),
(419, 52, 452, 'product_image', NULL, NULL),
(420, 53, 453, 'card', NULL, NULL),
(421, 53, 454, 'product_image', NULL, NULL),
(422, 54, 455, 'card', NULL, NULL),
(423, 54, 456, 'product_image', NULL, NULL),
(424, 56, 457, 'card', NULL, NULL),
(425, 56, 458, 'product_image', NULL, NULL),
(426, 57, 459, 'card', NULL, NULL),
(427, 57, 460, 'product_image', NULL, NULL),
(428, 59, 461, 'card', NULL, NULL),
(429, 59, 462, 'product_image', NULL, NULL),
(430, 61, 463, 'card', NULL, NULL),
(431, 61, 464, 'product_image', NULL, NULL),
(432, 65, 465, 'card', NULL, NULL),
(433, 65, 466, 'product_image', NULL, NULL),
(435, 66, 468, 'card', NULL, NULL),
(436, 66, 469, 'product_image', NULL, NULL),
(438, 74, 471, 'product_image', NULL, NULL),
(441, 76, 474, 'product_image', NULL, NULL),
(442, 63, 475, 'card', NULL, NULL),
(443, 63, 476, 'product_image', NULL, NULL),
(444, 68, 477, 'card', NULL, NULL),
(445, 68, 478, 'product_image', NULL, NULL),
(447, 77, 480, 'product_image', NULL, NULL),
(448, 76, 481, 'card', NULL, NULL),
(449, 74, 482, 'card', NULL, NULL),
(450, 75, 483, 'card', NULL, NULL),
(451, 75, 484, 'product_image', NULL, NULL),
(453, 77, 486, 'card', NULL, NULL),
(454, 84, 487, 'card', NULL, NULL),
(455, 84, 488, 'product_image', NULL, NULL),
(456, 84, 489, 'product_image', NULL, NULL),
(457, 91, 490, 'product_image', NULL, NULL),
(458, 91, 491, 'card', NULL, NULL),
(459, 64, 492, 'product_image', NULL, NULL),
(460, 92, 493, 'product_image', NULL, NULL),
(461, 92, 494, 'product_image', NULL, NULL),
(462, 92, 495, 'card', NULL, NULL),
(463, 93, 496, 'product_image', NULL, NULL),
(464, 93, 497, 'card', NULL, NULL),
(465, 94, 498, 'product_image', NULL, NULL),
(466, 94, 499, 'card', NULL, NULL),
(467, 95, 500, 'product_image', NULL, NULL),
(468, 95, 501, 'product_image', NULL, NULL),
(469, 95, 502, 'card', NULL, NULL),
(470, 96, 503, 'product_image', NULL, NULL),
(471, 96, 504, 'product_image', NULL, NULL),
(472, 96, 505, 'card', NULL, NULL),
(473, 97, 506, 'product_image', NULL, NULL),
(474, 97, 507, 'product_image', NULL, NULL),
(475, 97, 508, 'card', NULL, NULL),
(476, 98, 509, 'product_image', NULL, NULL),
(477, 98, 510, 'product_image', NULL, NULL),
(478, 98, 511, 'card', NULL, NULL),
(479, 16, 512, 'card', NULL, NULL),
(480, 16, 513, 'product_image', NULL, NULL),
(483, 99, 516, 'card', NULL, NULL),
(486, 100, 519, 'card', NULL, NULL),
(487, 101, 520, 'product_image', NULL, NULL),
(488, 101, 521, 'card', NULL, NULL),
(490, 100, 523, 'product_image', NULL, NULL),
(491, 99, 524, 'product_image', NULL, NULL),
(492, 102, 525, 'product_image', NULL, NULL),
(493, 102, 526, 'card', NULL, NULL),
(494, 103, 527, 'product_image', NULL, NULL),
(495, 103, 528, 'card', NULL, NULL),
(496, 104, 529, 'product_image', NULL, NULL),
(497, 104, 530, 'card', NULL, NULL),
(498, 105, 531, 'product_image', NULL, NULL),
(499, 105, 532, 'card', NULL, NULL),
(500, 106, 533, 'product_image', NULL, NULL),
(501, 106, 534, 'product_image', NULL, NULL),
(502, 106, 535, 'card', NULL, NULL),
(503, 107, 536, 'product_image', NULL, NULL),
(504, 107, 537, 'card', NULL, NULL),
(505, 108, 538, 'product_image', NULL, NULL),
(506, 108, 539, 'card', NULL, NULL),
(507, 109, 540, 'product_image', NULL, NULL),
(508, 109, 541, 'card', NULL, NULL),
(509, 110, 542, 'product_image', NULL, NULL),
(510, 110, 543, 'card', NULL, NULL),
(511, 111, 544, 'product_image', NULL, NULL),
(512, 111, 545, 'card', NULL, NULL),
(513, 112, 546, 'product_image', NULL, NULL),
(514, 112, 547, 'card', NULL, NULL);

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
(3, '2019_05_27_121110_create_admins_table', 1),
(4, '2019_05_27_160627_create_images_table', 1),
(5, '2019_05_27_160723_create_products_table', 1),
(6, '2019_07_23_070757_create_types_table', 1),
(7, '2019_07_23_072559_create_image_product_pivot_table', 1),
(8, '2019_07_23_083039_creates_collection_product_table', 1),
(9, '2019_07_30_185116_create_clients_table', 1),
(10, '2019_07_30_210830_create_retailers_table', 1),
(11, '2019_08_13_010832_create_client_pros_table', 1),
(12, '2019_08_13_171657_create_orders_table', 1),
(13, '2019_09_03_181312_create_colors_table', 1),
(14, '2019_09_03_194135_creates_color_image_pivot_table', 1),
(15, '2019_09_04_110308_creates_color_product_pivot_table', 1),
(16, '2019_09_14_230037_creates_order_product_pivot_table', 1),
(17, '2019_10_07_155022_create_sliders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `state` enum('requested','waiting','Ready','Sold') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `visitors` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `clientPrice` double NOT NULL,
  `retailerPrice` double NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `reference`, `type_id`, `visitors`, `clientPrice`, `retailerPrice`, `name`, `new`, `note`, `description`, `created_at`, `updated_at`) VALUES
(9, 'NM030100', 3, 274, 36800, 5, 'Bureau beech large', NULL, '1.80m / 0.70m', '- Bureau de direction beech\n- Avec retour\n- 50% MDF  couleur beech + mélaminé blanc + pieds métalliques blancs \n- 50% MDF  couleur beech + mélaminé noir + pieds métalliques noirs', '2019-10-02 12:45:55', '2020-07-27 09:07:24'),
(10, 'NM030101', 3, 178, 47500, 5, 'Bureau SHY petit model', NULL, '1.40M / 0.70m', '-Bureau de direction SHY\n-avec caisson et retour mobile\n-100% MDF', '2019-10-02 13:14:44', '2020-07-27 10:07:39'),
(13, 'NM030104', 3, 526, 34500, 5, 'Bureau sam moyen model', NULL, '1.60m / 0.70m', '- Bureau de direction SAM\n- Avec caisson et retour fixe\n- 50% MDF Couleur teak blanc + mélaminé gris\n- 50% MDF Couleur panama marron gloss + mélaminé gris', '2019-10-03 06:09:58', '2020-07-27 09:07:24'),
(14, 'NM030105', 3, 114, 38800, 5, 'Bureau sam large model', NULL, '1.80m / 0.70m', '- Bureau de direction SAM\n- Avec caisson et retour fixe\n- 50% MDF Couleur teak blanc + mélaminé gris\n- 50% MDF Couleur panama marron gloss + mélaminé gris', '2019-10-03 06:13:15', '2020-07-27 09:07:24'),
(15, 'NM030106', 3, 53, 36800, 5, 'Bureau ADIS petit model', NULL, '1.40m / 0.70m', '- Bureau de direction ADIDAS\n- Avec caisson\n- 60% MDF Couleur teck foncé + mélaminé gris', '2019-10-03 06:35:17', '2020-07-27 09:07:24'),
(16, 'NM030107', 3, 158, 45000, 4, 'Bureau ADIS moyen model', NULL, '1.60m / 0.80m', '- Bureau de direction adidas\n- avec caisson & retour \n- 60% MDF Couleur teck foncé  + mélaminé gris', '2019-10-03 06:52:29', '2020-07-27 09:07:24'),
(17, 'NM030108', 3, 285, 59976, 5, 'Bureau ADIS large model', NULL, '1.80m / 0.80m', '- Bureau de direction adidas\n- Avec caisson & retour\n- 60% MDF Couleur teck foncé  + mélaminé', '2019-10-03 06:55:28', '2020-07-27 09:07:24'),
(21, 'NM0501', 3, 44, 38000, 5, 'Bureau Y', NULL, '1.40m / 0.75 m', '- Bureau operateur Y\n- Avec caisson\n- 60% MDF Couleur beech + mélaminé gris', '2019-10-03 07:22:15', '2020-07-27 09:07:24'),
(22, 'NM030112', 3, 33, 48300, 5, 'Bureau Y moyen model', NULL, '1.60m / 0.75m', '- Bureau de direction Y\n- Avec caisson & retour\n- 60% MDF Couleur beech + mélaminé gris', '2019-10-03 07:26:52', '2020-07-27 09:07:24'),
(24, 'NM030114', 3, 70, 79000, 5, 'Bureau ROMA large model', NULL, '2.20m/ 0.95m', '- Bureau ROMA \n- Avec caisson & retour\n- 90% MDF Couleur acajou + mélaminé gris', '2019-10-03 07:42:41', '2020-07-27 09:07:24'),
(25, 'NM050100', 5, 42, 9900, 5, 'Bureau ERABLE 1 mètre', NULL, '1m / 0,5m', '-Bureau opérateur ERABLE 1m\n-1 tiroir\n-Caisson fixe\n-Couleur mélaminé pyjama +mélaminé (gris)ou (noir)', '2019-10-03 08:03:24', '2020-07-27 09:07:24'),
(26, 'NM0301', 3, 146, 39500, 5, 'Bureau beech', NULL, '1.60m / 0.70m', '- Bureau de direction beech\n- Avec retour\n- 50% MDF Couleur beech +mélaminé blanc + pieds blancs\n- 50% MDF Couleur beech +mélaminé noir + pieds noirs', '2019-10-03 08:15:51', '2020-07-27 09:07:24'),
(27, 'NM030109', 2, 17, 39500, 5, 'Bureau ARC petit model', NULL, '1.40m / 0,75m', '- Bureau de direction ARC\n- Avec caisson\n- 50% MDF Couleur (blanc neige+chene fance)ou(moka+cappuccino)', '2019-10-03 08:30:32', '2020-07-27 09:07:24'),
(28, 'NM030110', 3, 151, 49300, 4, 'Bureau ARC moyen model', NULL, '1.60M / 75cm', '- Bureau de direction ARC\n- Couleur(blanc neige+chene fance)ou(moka+cappuccino claire)\n- 50% MDF avec caisson & retour mélaminé blanc', '2019-10-03 08:42:26', '2020-07-27 09:07:24'),
(29, 'NM030111', 3, 38, 63500, 5, 'Bureau SHY large model.', NULL, '1.80m / 0.80m', '-Bureau de direction SHY\n-Avec caisson& retour\n-Couleur (teck fance-acajou)', '2019-10-03 08:51:48', '2020-07-27 09:07:24'),
(31, 'NM030102', 3, 38, 55800, 4, 'Bureau ARC large model', NULL, '1.80m / 0.75m', '-Bureau de direction ARC\n-Avec caisson & retour (mélaminé blanc)\n-Couleur (blanc neige + chene fance) ou (moka + cappuccino)', '2019-10-03 12:30:22', '2020-07-27 09:07:24'),
(32, 'NM030103', 3, 22, 38000, 5, 'Bureau Y petit model', NULL, '1,40m/ 0.75m', '- Bureau de direction Y\n- 60% MDF Couleur beech + mélaminé gris\n- Avec caisson', '2019-10-03 12:35:43', '2020-07-27 09:07:24'),
(33, 'NM030115', 3, 71, 73000, 5, 'Bureau ROMA petit model', NULL, '1.80m / 0.80m', '- Bureau de direction ROMA\n- Avec caisson & retour\n- 90% MDF Couleur acajou + mélaminé gris', '2019-10-03 12:40:41', '2020-07-27 09:07:24'),
(34, 'NM030116', 3, 21, 76000, 5, 'Bureau ROMA moyen model', NULL, '2m /0.80m', '- Bureau de direction ROMA\n- Avec caisson & retour\n- 90% MDF Couleur acajou + mélaminé gris', '2019-10-03 12:44:48', '2020-07-27 09:07:24'),
(35, 'NM030117', 3, 165, 59500, 5, 'Bureau SHY moyen model', NULL, '1.60m / 0.80m', '- Bureau de direction SHY\n- Avec caisson & retour\n- 100% MDF Couleur (teck fance - acajou)', '2019-10-04 10:49:00', '2020-07-27 09:07:25'),
(39, 'NM050104', 5, 430, 29200, 5, 'Bureau ERABLE 1.60 mètre mobile', NULL, '1.60m / 0.70m', '-Bureau opérateur ERABLE 1.60m mobile\n-Avec caisson & retour mobile\n-Couleur; mélaminé pyjama + mélaminé gris(noir)', '2019-10-04 11:23:09', '2020-07-27 18:38:20'),
(40, 'NM050105', 5, 149, 9800, 4, 'Bureau STD', NULL, '1 place', '-Bureau opérateur STD\n-Couleur ; vertical marron + mélaminé (noir) ou (gris)\n-Couleur ; crème uni + mélaminé (noir)ou (gris)', '2019-10-04 11:31:35', '2020-07-27 09:07:25'),
(41, 'NM050101', 5, 27, 8800, 5, 'Bureau ERABLE 1.20 metre', NULL, '1.20m/0.60m', '-Bureau opérateur ERABLE 1.20m\n-Avec caisson fixe\n-Couleur mélaminé pyjama + mélaminé (gris)ou(noir)', '2019-10-04 11:44:00', '2020-07-27 09:07:25'),
(42, 'NM050102', 5, 29, 11800, 5, 'Bureau ERABLE 1.40 mètre', NULL, '1.40M / 0.70m', '-Bureau opérateur ERABLE 1.40\n-Avec caisson fixe\n-Couleur ; melamine pyjama + melamine (gris) ou (noir)', '2019-10-04 11:46:50', '2020-07-27 09:07:25'),
(43, 'NM050103', 5, 28, 12200, 5, 'Bureau ERABLE 1.60 metre', NULL, '1.60m / 0.70m', '-Bureau opérateur ERABLE 1.60m\n-Avec caisson fixe\n-Couleur ; mélaminé pyjama + mélaminé (gris) ou (noir)', '2019-10-04 11:53:34', '2020-07-27 09:07:25'),
(44, 'NM030118', 3, 175, 26800, 5, 'Bureau Malizya', NULL, '1.40M / 0.70m', '- Bureau de direction MALIZYA\n- Avec caisson & retour fixe\n- 50% MDF Couleur ; chene fance + mélaminé gris', '2019-10-04 11:58:33', '2020-07-27 09:07:25'),
(45, 'NM0201', 2, 29, 15800, 4, 'Armoire ERABLE pleine', NULL, 'h 1.80m / L 0.80m / prof 0.40m', '-Armoire ERABLE pleine\n-Carcasse mélaminé gris / noir\n-Porte mélaminé erable', '2019-10-05 06:00:07', '2020-07-27 09:07:25'),
(46, 'NM020100', 2, 18, 28600, 5, 'Armoire beech pleine G.M', NULL, 'h 1.80m / L 0.80m / prof 0.40m', '-Armoire beech pleine G.M\n-Carcasse mélaminé gris \n- Porte MDF couleur beech kristall', '2019-10-05 06:12:33', '2020-07-27 09:07:25'),
(47, 'NM020101', 2, 20, 26800, 5, 'Armoire beech vitres', NULL, 'h 1.80m / L 0.80m / prof 0.40m', '-Armoire beech vitres\n-2 portes vitres/ 2 porte MDF (couleur beech)\n-Carcasse mélaminé gris', '2019-10-05 06:34:03', '2020-07-27 09:07:25'),
(48, 'NM020102', 3, 21, 28600, 5, 'Armoire ADIS 3 porte', NULL, 'h 1.80m / L 0.135m / prof 0.40m', '-Armoire Adidas 3 Portes\n-Couleur porte MDF teck fance \n-Carcasse mélaminé gris', '2019-10-05 06:42:24', '2020-07-27 09:07:25'),
(49, 'NM020103', 2, 147, 26800, 5, 'Armoire bahut beech +VITRE', NULL, 'h 0.90m /L 0.80m / prof 0.40m BAHUT /h 0.90m /L 0.80m / prof 0.40m VITRE', '-Armoire bahut beech\n-Couleur beech\n-Portes MDF \n-Carcasse melamine gris/ blanc\n-2 Portes  bahut vitres', '2019-10-05 06:57:02', '2020-07-27 09:07:25'),
(51, 'NM020105', 3, 8, 32000, 5, 'Armoire ADIS 2 portes pleine', NULL, 'h 1.80m / L 0.135m / prof 0.40m', '-Armoire  Adidas 2 portes\n-Couleur MDF  teck fance\n-Carcasse mélaminé gris', '2019-10-05 07:16:42', '2020-07-27 09:07:25'),
(52, 'NM020106', 3, 123, 28600, 5, 'Armoire ADIS 2 portes vitres', NULL, 'h 1.80m / L 0.80m / prof 0.40m', '-Armoire Adidas vitres \n-2 portes\n-Couleur teck fance + mélaminé gris', '2019-10-05 07:27:05', '2020-07-27 09:07:25'),
(53, 'NM020107', 2, 188, 37000, 5, 'Armoire SHY pleine', NULL, 'h2m / L0.90m / prof 0.40m', '-Armoire SHY pleine\n-100% MDF \n-Couleurs: acajou / teck fance', '2019-10-05 07:33:23', '2020-07-27 09:07:25'),
(54, 'NM020108', 2, 16, 35500, 5, 'Armoire shy vitres', NULL, 'h2m / L0.90m / prof 0.40m', '-Armoire SHY vitres\n-couleurs ; acajou / teck fance', '2019-10-05 07:37:54', '2020-07-27 09:07:25'),
(55, 'NM030113', 3, 189, 53000, 5, 'Bureau Y large model', NULL, '1.80m / 0.75m', '-Bureau de direction Y\n-Avec caisson & retour\n-Couleur beech + mélaminé gris', '2019-10-05 08:46:15', '2020-07-27 09:07:25'),
(56, 'NM1001', 10, 22, 12800, 5, 'Chaise triplette', NULL, '3 places', '-Banquette de réception\n-3 places\n-Couleur argent', '2019-10-06 12:00:21', '2020-07-27 09:07:25'),
(57, 'NM2501', 26, 15, 3200, 4, 'Chaise lux  plastique G081', NULL, '1 place', '-Chaise lux G081\n-plastique\n-couleur; noir&jaune', '2019-10-06 12:04:42', '2020-07-27 09:07:25'),
(59, 'NM100100', 10, 153, 14800, 5, 'Chaise 3 Places 2202', NULL, '3 places', '-Chaise accoudoir 2202\n-3 Places\n-couleur noir', '2019-10-06 12:23:27', '2020-07-27 09:07:25'),
(60, 'NM240100', 24, 179, 12400, 5, 'Chaise Star 2616 C', NULL, '1 place', '-Chaise Star 2616 C \n-Accoudoir\n-Couleur noir\n-Fixe', '2019-10-06 12:39:56', '2020-07-27 09:07:25'),
(61, 'NM250100', 25, 17, 2750, 5, 'Chaise Dania luge', NULL, '1 place', '-Chaise visiteur Dania luge\n-Couleur bleu', '2019-10-06 12:43:00', '2020-07-27 09:07:25'),
(63, 'NM250102', 25, 13, 12400, 4, 'Chaise Luxe Visiteur J036', NULL, '1 place', '-Chaise Visiteur luxe j036\n-Couleur ; bleu &noir\n-Accoudoir', '2019-10-06 12:52:58', '2020-07-27 09:07:25'),
(64, 'NM240101', 24, 98, 3950, 5, 'Chaise Star 02', NULL, '1 place', '-Chaise star k02\n-Couleur noir/cappuccino\n- Avec accoudoir', '2019-10-06 19:19:07', '2020-07-27 09:07:25'),
(65, 'NM250103', 24, 19, 3200, 5, 'Chaise Pliante KPS 1311', NULL, '1 place', '-Chaise pliante KPC 1311\n-Couleur noir\n-Chaise visiteur', '2019-10-06 19:22:51', '2020-07-27 09:07:25'),
(66, 'NM2601', 26, 35, 10700, 5, 'Chaise opérateur 613 B', NULL, '1 PLACE', '-Chaise opérateur 613B\n-Avec accoudoir \n-Couleur noir', '2019-10-06 19:26:03', '2020-07-27 09:07:25'),
(67, 'NM240102', 24, 30, 10700, 5, 'Chaise Star 2042', NULL, '1 Place', '-Chaise Star 2042 S\n-Mobile\n-Couleur noir\n-Avec accoudoir', '2019-10-06 19:28:33', '2020-07-27 09:07:25'),
(68, 'NM240103', 24, 212, 15600, 4, 'Chaise ZH 2090 Star', NULL, '1 place', '-Chaise Star 2090 \n-Avec accoudoir\n-Mobile\n-Couleur noir', '2019-10-06 19:32:45', '2020-07-27 09:07:25'),
(69, 'NM240104', 24, 26, 5600, 5, 'Chaise Star ZH 2406', NULL, '1 Place', '-Chaise Star 2406\n-Avec accoudoir\n-Couleur noir\n-Mobile', '2019-10-06 19:38:11', '2020-07-27 09:07:25'),
(70, 'NM240105', 24, 10, 15800, 5, 'Chaise Star 2616', NULL, '1 Place', '-Chaise Star 2616\n-Avec accoudoir\n-Mobile\n-Couleur noir', '2019-10-06 19:46:35', '2020-07-27 09:07:25'),
(71, 'NM240106', 24, 36, 12900, 5, 'Chaise Star 2618', NULL, '1 place', '-Chaise Star 2618<br />\n-Couleur noir<br />\n-Avec accoudoir<br />\n-Mobile', '2019-10-06 19:53:36', '2020-07-27 09:07:25'),
(72, 'NM240107', 24, 19, 8000, 5, 'Chaise StarZH  5010', NULL, '1 place', '-Chaise Star 5010\n-Mobile\n-Avec accoudoir\n-Couleur noir', '2019-10-06 19:56:24', '2020-07-27 09:07:26'),
(73, 'NM240108', 24, 4, 11800, 5, 'Chaise Star opérateur AK111', NULL, '1 Place', '-Chaise Star opérateur AK111\n-Avec accoudoir\n-Couleur noir\n-Mobile', '2019-10-07 05:51:40', '2020-07-27 09:07:26'),
(74, 'NM260100', 26, 25, 7900, 5, 'Chaise Opérateur GTB 8365', NULL, '1 place', '-Chaise opérateur GTB 8365\n-Avec accoudoir\n-Mobile\n-Couleur noir', '2019-10-07 05:56:07', '2020-07-27 09:07:26'),
(75, 'NM260101', 26, 366, 85000, 5, 'Chaise Opérateur F60S', NULL, '1 place', '-Chaise opérateur f60s\n-Mobile\n-Avec accoudoir\n-Couleur noir\n-Complet Cuire', '2019-10-07 06:00:55', '2020-07-27 09:07:26'),
(76, 'NM2701', 27, 14, 15800, 5, 'Chaise coiffeuse EX 919', NULL, '1 place', '-Chaise coiffeuse EX919\n-Couleur rouge\n-Confortable', '2019-10-07 06:04:34', '2020-07-27 09:07:26'),
(77, 'NM240109', 24, 11, 10700, 5, 'Chaise Star 2044', NULL, '1 place', '-Chaise Star 2044\n-Avec accoudoir\n-Mobile \n-Couleur noir', '2019-10-07 06:11:53', '2020-07-27 09:07:26'),
(78, 'NM2801', 28, 406, 6700, 5, 'Fauteuil chauffeuse mono place', NULL, '1 Place', '-fauteuil mono place\n-Confortable\n-Couleur bleu', '2019-10-07 06:14:59', '2020-07-27 09:07:26'),
(79, 'NM1201', 12, 128, 27000, 5, 'Comptoir SALAM MDF', NULL, 'L 1.22 m/ h 1.06 m', '-Comptoir de réception\n-Touts les couleurs sont disponibles\n-mix MDF & mélaminé', '2019-10-07 11:45:45', '2020-07-27 09:07:26'),
(80, 'NM2901', 29, 105, 18000, 5, 'Table WORK', NULL, '1.14m / 0.75', '-Table ronde\n-Couleur teck blanc + mélaminé gris', '2019-10-07 12:28:19', '2020-07-27 09:07:26'),
(81, 'NM1301', 13, 15, 11200, 5, 'Table basse SHY', NULL, '0.60m / 0.60 m', '-Table basse SHY\n-Couleur (teck fance-acajou)', '2019-10-07 12:53:14', '2020-07-27 09:07:26'),
(82, 'NM130100', 13, 342, 8500, 5, 'Table basse SAM', NULL, '0.60m / 0.60 m', '-Table basse SAM\n-Couleur teak blanc + mélaminé gris\n-Couleur panama marron gloss + mélaminé gris', '2019-10-07 13:04:49', '2020-07-27 09:07:26'),
(83, 'NM030119', 5, 533, 29500, 4, 'Bureau Futura 1.40', 0, '1.40m / 0.70m', '- Bureau futura 1.40m\r\n- Avec caisson (mélaminé+MDF)\r\n- Bureau MDF + Metalique\r\n - 50% MDF Couleur creme uni', '2019-10-09 21:48:40', '2020-07-27 20:12:48'),
(84, 'NM050106', 5, 215, 43000, 5, 'Bureau futura 1.60 m', NULL, '1.60m / 0.70', '- Bureau futura 1.60m\n- Avec caisson & Retour (mélaminé+MDF)\n- Bureau MDF + Metalique\n- 50% MDF Couleur creme uni', '2019-10-12 15:11:10', '2020-07-27 09:07:26'),
(90, 'NM250101', 25, 14, 6800, 5, 'Chaise visiteur 2408', NULL, '1 place', '-Chaise visiteur 2408\n-Mobile\n-Avec accoudoir en bois\n-Couleur noir', '2019-10-21 06:31:19', '2020-07-27 09:07:26'),
(91, 'NM260102', 26, 25, 10900, 5, 'Chaise luge 079 C', NULL, '1 Place', '-Chaise operateur 079\n-Fixe\n-Avec accoudoir\n-Couleur noir', '2019-10-22 08:36:27', '2020-07-27 09:07:26'),
(92, 'NM3001', 30, 108, 7500, 5, 'Chaise a BAR KH016', NULL, '1 Place', '-Chaise a BAR KH 016\n-Fixe\n-Pivotent', '2019-10-22 08:43:30', '2020-07-27 09:07:26'),
(93, 'NM300100', 30, 7, 8500, 5, 'Chaise a BAR KH 1013', NULL, '1 Place', '-Chaise a BAR KH 1013\n-Fixe\n-Pivotent\n-Réglable en hauteur', '2019-10-22 08:45:36', '2020-07-27 09:07:26'),
(94, 'NM300101', 30, 10, 8200, 5, 'Chaise a BAR KH 1032', NULL, '1 Place', 'Chaise a BAR KH1032\n-Fixe\n-Pivotent\n-Couleur noir\n-Réglable en hauteur', '2019-10-22 08:47:38', '2020-07-27 09:07:26'),
(95, 'NM260103', 26, 89, 14200, 5, 'Chaise opérateurs b616', NULL, '1 place', '-Chaise operateur B616\n-Mobile\n-Avec accoudoir\n-Couleur noir', '2019-10-22 08:50:12', '2020-07-27 09:07:26'),
(96, 'NM260104', 24, 100, 12200, 5, 'Chaise opérateur b811', NULL, '1 place', '-Chaise operateur b 811\n-Mobile\n-Avec accoudoir\n-Couleur noir', '2019-10-22 08:52:48', '2020-07-27 09:07:26'),
(97, 'NM260105', 26, 109, 12500, 5, 'Chaise operateur 079', NULL, '1 place', '-Chaise operateur 079\n-mobile\n-Avec accoudoir\n-Couleur noir', '2019-10-22 08:55:13', '2020-07-27 09:07:26'),
(98, 'NM1101', 11, 145, 49500, 5, 'Salon s015', NULL, '1 Place / 3 place', '-Salon s015\n-fauteuil 3 places + 1 place\n-Couleur noir', '2019-10-22 08:58:16', '2020-07-27 09:07:26'),
(99, 'NM250104', 25, 259, 14300, 5, 'CHAISE 022A', NULL, '1 PLACE', '-Chaise 022 A\n-1 Place\n-Noir\n-Mobile\n-pieds chromée', '2019-12-15 12:45:38', '2020-07-27 09:07:26'),
(100, 'NM250105', 24, 340, 12200, 5, 'CHAISE 022C', NULL, '1 place', '-Chaise 022c\n-Fixe\n-Pieds chromée', '2019-12-15 12:49:13', '2020-07-27 09:07:26'),
(101, 'NM250106', 24, 169, 14200, 5, 'CHAISE 087A', NULL, '1 place', '-Chaise 087A\n- 1 Place\n-Mobile\n-Noir avec pieds chromée', '2019-12-15 13:03:28', '2020-07-27 09:07:26'),
(102, 'NM250107', 25, 331, 10900, 5, 'CHAISE 087C', NULL, '1 Place', '-Chaise 087C\n-Fixe\n-Noir avec pied chromée', '2019-12-15 13:19:42', '2020-07-27 09:07:26'),
(103, 'NM300102', 30, 212, 8500, 5, 'CHAISE KH1030', NULL, '1 Place', '-Chaise a bar kh1030\n-Pivotent\n-Noir avec pied chromée', '2019-12-16 08:01:23', '2020-07-27 09:07:26'),
(104, 'NM300103', 30, 138, 7400, 5, 'CHAISE KH073', NULL, '1 Place', '-Chaise kh073\n-pivotent\n-Noir avec pied chromée\n-fixe', '2019-12-16 08:08:35', '2020-07-27 09:07:26'),
(105, 'NM130101', 13, 178, 13200, 5, 'TABLE BASSE ROMA', NULL, '120x60', '-TABLE BASSE ROMA\n-100% MDF\n-COULEUR ACAJOU', '2019-12-18 11:48:11', '2020-07-27 09:07:27'),
(106, 'NM2401', 24, 73, 38800, 4, 'CHAISE PDG HZ 8029', NULL, '1 Place', '- CHAISE POUR PDG\n- TRÈS BONNE QUALITÉ\n- PIVOTENT\n- MOBILE', '2020-02-04 08:30:29', '2020-07-27 09:07:27'),
(107, 'NM240110', 24, 108, 30800, 4, 'CHAISE PDG 8007', NULL, '1 Place', '- CHAISE POUR PDG\n- TRÈS BONNE QUALITÉ\n- MOBILE\n- PIVOTENT', '2020-02-04 08:34:20', '2020-07-27 09:07:27'),
(108, 'NM240111', 24, 4, 15800, 4, 'CHAISE STAR HZ 2616', NULL, '1 Place', '- CHAISE POUR PDG\n- TRÈS BONNE QUALITÉ\n- MOBILE\n- PIVOTENT', '2020-02-04 08:42:25', '2020-07-27 09:07:27'),
(109, 'NM260106', 26, 150, 7900, 4, 'CHAISE OPERATEUR 1204', NULL, '1 Place', '- CHAISE OPÉRATEUR\n- MOBILE\n- PIVOTENT', '2020-02-04 08:47:06', '2020-07-27 09:07:27'),
(110, 'NM260107', 26, 176, 26800, 4, 'CHAISE OPÉRATEUR ST 2617', NULL, '1 Place', '- CHAISE OPÉRATEUR\n- MOBILE\n- PIVOTENT\n- POUR GAMERS', '2020-02-04 09:19:24', '2020-07-27 09:07:27'),
(111, 'NM240112', 24, 162, 13500, 5, 'CHAISE STAR HZ 2043', NULL, '1 place', '- CHAISE STAR\n- TRÈS BONNE QUALITÉ\n- MOBILE\n- PIVOTENT', '2020-02-04 09:21:37', '2020-07-27 09:07:27'),
(112, 'NM250108', 25, 167, 11200, 5, 'CHAISE VISITEUR C811', NULL, '1 place', '-  CHAISE VISITEUR\n-  CONFORTABLE\n-  FIXE', '2020-02-04 09:38:13', '2020-07-27 09:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `retailers`
--

CREATE TABLE `retailers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `registreCommerce` int(11) NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image_id`, `created_at`, `updated_at`) VALUES
(2, 267, '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(3, 268, '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(4, 269, '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(5, 270, '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(6, 271, '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(7, 272, '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(8, 273, '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(9, 274, '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(11, 276, '2019-10-09 13:37:01', '2019-10-09 13:37:01'),
(13, 278, '2019-10-09 13:37:01', '2019-10-09 13:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Category` enum('Meuble de Bureau','Mobilier de Réunion','Mobilier Accueil','Mobilier de Conférence','Bibliotheque Mobilier ecoles creches','Environnement & Accéssoires','Chaises') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `Name`, `Category`, `created_at`, `updated_at`) VALUES
(1, 'Armoire & Rangement Métallique', 'Bibliotheque Mobilier ecoles creches', '2019-09-30 04:43:19', '2019-09-30 04:43:19'),
(2, 'Armoires', 'Meuble de Bureau', '2019-09-30 10:30:22', '2019-09-30 10:30:22'),
(3, 'Bureaux de directions', 'Meuble de Bureau', '2019-09-30 10:36:44', '2019-09-30 10:36:44'),
(4, 'Siège de Réunion', 'Mobilier de Réunion', '2019-09-30 10:37:08', '2019-09-30 10:37:08'),
(5, 'Bureaux de  Opérateurs', 'Meuble de Bureau', '2019-09-30 10:37:49', '2019-09-30 10:37:49'),
(6, 'Workstation', 'Meuble de Bureau', '2019-09-30 10:38:32', '2019-09-30 10:38:32'),
(7, 'Tables de Conférences et Réunions', 'Mobilier de Réunion', '2019-09-30 10:40:11', '2019-09-30 10:40:11'),
(8, 'Tables de Réunions modulaires', 'Mobilier de Réunion', '2019-09-30 10:41:12', '2019-09-30 10:45:47'),
(9, 'Tables de Réunions et Travail', 'Mobilier de Réunion', '2019-09-30 10:41:49', '2019-09-30 10:46:06'),
(10, 'Banquettes de Réception', 'Mobilier Accueil', '2019-09-30 10:43:02', '2019-09-30 10:43:02'),
(11, 'Canapés et Fauteuils', 'Mobilier Accueil', '2019-09-30 10:43:52', '2019-09-30 10:43:52'),
(12, 'Comptoirs de Réception', 'Mobilier Accueil', '2019-09-30 10:47:52', '2019-09-30 10:47:52'),
(13, 'Tables basses', 'Mobilier Accueil', '2019-09-30 10:49:10', '2019-09-30 10:49:10'),
(14, 'Chaises Amphithéâtre', 'Meuble de Bureau', '2019-09-30 10:50:21', '2019-09-30 10:51:36'),
(15, 'Fauteuils Auditorium', 'Mobilier de Conférence', '2019-09-30 10:52:51', '2019-09-30 10:52:51'),
(16, 'Pupitres Orateurs', 'Mobilier de Conférence', '2019-09-30 10:53:43', '2019-09-30 10:53:43'),
(18, 'Mobiliers pour crèches', 'Bibliotheque Mobilier ecoles creches', '2019-09-30 10:55:51', '2019-09-30 10:55:51'),
(19, 'Rayonnages Mobiles', 'Bibliotheque Mobilier ecoles creches', '2019-09-30 11:06:28', '2019-09-30 11:06:28'),
(20, 'Rayonnages Métallique', 'Bibliotheque Mobilier ecoles creches', '2019-09-30 11:07:34', '2019-09-30 11:07:34'),
(24, 'Chaises Star', 'Chaises', '2019-10-06 11:35:43', '2019-10-06 11:35:43'),
(25, 'Chaises visiteurs', 'Chaises', '2019-10-06 11:36:52', '2019-10-06 11:36:52'),
(26, 'Chaises operateurs', 'Chaises', '2019-10-06 11:37:20', '2019-10-06 11:37:20'),
(27, 'Chaises coiffeuse', 'Chaises', '2019-10-06 11:38:03', '2019-10-06 11:38:03'),
(28, 'Chaises chaufeuse', 'Chaises', '2019-10-06 11:38:39', '2019-10-06 11:38:39'),
(29, 'Tables', 'Meuble de Bureau', '2019-10-07 12:20:47', '2019-10-07 12:20:47'),
(30, 'Chaise BAR', 'Chaises', '2019-10-17 10:03:13', '2019-10-17 10:03:13');

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
(1, 'Adel', 'adelbouhraoua23@gmail.com', NULL, '$2y$10$2iZOkpfD1CtKlzn3kwiLe.VTo/KdQ7dGzQGytTOXj0kyjkwZd/MkO', '6ZQhBXVNo5LDYCN8vNITV6slfcpWTYFk9l8LFHKZqPvjGWaFnlzozLdH78Vc', '2019-09-29 17:41:48', '2019-09-29 17:41:48'),
(2, 'Rafik', 'rafik@newmoboffice.com', NULL, '$2y$10$t3GLnhXMConPZ7GnV3D9juskqScbb4MNgPrl75w0HkTkpYR15ZIy.', 'cZCinY3oFTqNBzgWB2bADEjrAsXC1V3qYNE89fi9tAZl1A7DGGWe06J2u6rn', '2019-09-29 17:44:04', '2019-10-24 07:09:48'),
(3, 'bouzouidja', 'mehdibouzouidja@gmail.com', NULL, '$2y$10$vEMLC50tbngXDGTXxNedYenmXq7HVelFWRRc3neKWtUCe/rRMgrlG', NULL, '2019-10-09 16:18:42', '2019-10-09 16:18:42'),
(4, 'yakoub', 'yakoub.benmeradi@gmail.com', NULL, '$2y$10$yoMRl/5OXj6YrNojP9RziOWf.8E/VpziAhne8pIybqInT7Q7xwaNC', NULL, '2019-10-11 04:28:19', '2019-10-11 04:28:19'),
(5, 'Sadouki', 'sadoukiibrahim4200@gmail.com', NULL, '$2y$10$xM5kDwrv6rTk/1zxvL7CBO8yxnrPLexJPlGb6LZLFbEibqaN.Xy1e', NULL, '2020-02-11 17:49:56', '2020-02-11 17:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `ynkjxrau_newmoboffice`
--

CREATE TABLE `ynkjxrau_newmoboffice` (
  `COL 1` int(3) DEFAULT NULL,
  `COL 2` varchar(73) DEFAULT NULL,
  `COL 3` varchar(36) DEFAULT NULL,
  `COL 4` varchar(19) DEFAULT NULL,
  `COL 5` varchar(60) DEFAULT NULL,
  `COL 6` varchar(60) DEFAULT NULL,
  `COL 7` varchar(31) DEFAULT NULL,
  `COL 8` varchar(19) DEFAULT NULL,
  `COL 9` varchar(72) DEFAULT NULL,
  `COL 10` varchar(199) DEFAULT NULL,
  `COL 11` varchar(19) DEFAULT NULL,
  `COL 12` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ynkjxrau_newmoboffice`
--

INSERT INTO `ynkjxrau_newmoboffice` (`COL 1`, `COL 2`, `COL 3`, `COL 4`, `COL 5`, `COL 6`, `COL 7`, `COL 8`, `COL 9`, `COL 10`, `COL 11`, `COL 12`) VALUES
(1, '2', 'SuperAdmin', '2019-09-29 19:44:52', '2019-09-29 19:44:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '1', 'SuperAdmin', '2019-09-29 19:45:31', '2019-09-29 19:45:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '3', 'SuperAdmin', '2019-10-09 18:22:08', '2019-10-09 18:22:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, '3', '09 blida', '0542130436', '2019-10-09 18:18:42', '2019-10-09 18:18:42', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '4', 'blida', '0557698139', '2019-10-11 06:28:19', '2019-10-11 06:28:19', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '5', 'Bourkika', '0780341417', '2020-02-11 18:49:56', '2020-02-11 18:49:56', NULL, NULL, NULL, NULL, NULL, NULL),
(1, '01', 'Beech Kristall', '1', '2019-09-30 15:47:38', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '02', 'Creme Uni', '2', '2019-10-01 08:12:56', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '03', 'Blanc Neige', '3', '2019-10-01 08:22:31', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '07', 'Chene Fonce', '7', '2019-10-01 08:48:55', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '05', 'Moka', '8', '2019-10-01 08:56:26', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(9, '06', 'Vertical Marron', '9', '2019-10-01 10:02:58', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(10, '08', 'Teak Blanc', '10', '2019-10-01 10:08:52', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(11, '09', 'Cappuccino Claire', '11', '2019-10-01 10:18:49', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(12, '010', 'Teck Fance', '12', '2019-10-01 10:24:22', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(13, '011', 'Panama Marron Gloss', '13', '2019-10-01 10:27:34', '2019-10-01 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL),
(15, '04', 'acajou', '20', '2019-10-01 13:13:39', '2019-10-01 13:13:39', NULL, NULL, NULL, NULL, NULL, NULL),
(16, '12', 'Noir', '173', '2019-10-06 13:46:39', '2019-10-06 13:46:39', NULL, NULL, NULL, NULL, NULL, NULL),
(17, '13', 'Rouge', '174', '2019-10-06 13:47:33', '2019-10-06 13:47:33', NULL, NULL, NULL, NULL, NULL, NULL),
(19, '15', 'Argent', '176', '2019-10-06 13:56:38', '2019-10-06 13:56:38', NULL, NULL, NULL, NULL, NULL, NULL),
(20, '16', 'bleu', '211', '2019-10-07 07:47:21', '2019-10-07 07:47:21', NULL, NULL, NULL, NULL, NULL, NULL),
(1, '1', '4', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '1', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '1', '8', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2', '2', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2', '3', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '3', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '4', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '6', '9', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '6', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '6', '11', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '7', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '8', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '9', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '10', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '10', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '11', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '11', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '12', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '12', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '13', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '13', '13', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '14', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '14', '13', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '15', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '16', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '17', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '18', '3', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '18', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '18', '8', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '18', '11', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '19', '3', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '19', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '19', '8', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, '19', '11', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '20', '3', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '20', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '20', '8', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '20', '11', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '21', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '22', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, '23', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '24', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '25', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, '26', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, '27', '3', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '27', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '27', '8', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, '27', '11', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, '28', '3', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, '28', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, '28', '8', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, '28', '11', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, '31', '3', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, '31', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, '31', '8', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, '31', '11', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, '32', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, '33', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, '34', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, '29', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, '29', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, '35', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, '35', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, '36', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, '37', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '38', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, '39', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, '40', '2', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '40', '9', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '41', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, '42', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, '43', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '44', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, '45', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, '46', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, '47', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, '48', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, '49', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, '50', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, '51', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, '52', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '53', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, '53', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, '54', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, '54', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, '55', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, '56', '19', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, '57', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, '58', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, '59', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, '60', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, '62', '18', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, '63', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, '64', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, '65', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, '66', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, '67', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, '68', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, '69', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, '70', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, '71', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, '72', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, '73', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, '74', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, '75', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, '76', '17', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, '77', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, '78', '20', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, '79', '1', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, '79', '2', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, '80', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, '81', '12', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, '81', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, '82', '10', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, '82', '13', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, '61', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, '61', '20', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, '61', '17', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, '83', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, '84', '7', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, '85', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, '90', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, '56', '20', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, '91', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, '64', '11', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, '92', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, '93', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, '94', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, '95', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, '96', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, '97', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, '98', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, '99', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, '100', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, '101', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, '102', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, '103', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, '104', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, '105', '15', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, '106', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, '107', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, '108', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, '109', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, '110', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, '110', '17', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, '111', '11', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, '112', '16', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, '/storage/colorImages/j38zxyxziV9XsZ0ic790AivcrObm6rgfHquj2GUx.png', '2019-09-30 15:47:38', '2019-09-30 15:47:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '/storage/colorImages/zjHpgrmcQp6EXn04o0Ffa4bs2b1qBNOo24OPXp09.png', '2019-10-01 08:12:56', '2019-10-01 08:12:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '/storage/colorImages/6SPgaAtIRM8GFXRyhHF79o9vV59Tay7pLB2BPFl3.png', '2019-10-01 08:22:31', '2019-10-01 08:22:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '/storage/colorImages/u2D9vfp1IXjLyX4diAqw7oY8dc3oz9SUnbRSPmbC.png', '2019-10-01 08:30:56', '2019-10-01 08:30:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '/storage/colorImages/pZ5Lx5BIkiK2qX80ysSv0Rtv065ol1KhmZwG5Iof.png', '2019-10-01 08:35:08', '2019-10-01 08:35:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '/storage/colorImages/DpVjDNGcjA2cyF7ogp64K43u9xBnhXhuRPSKFJA7.png', '2019-10-01 08:44:01', '2019-10-01 08:44:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '/storage/colorImages/tsiEcOX5Q7k4yO5fq27pOY292pLAwvjTWkQZZumR.png', '2019-10-01 08:48:55', '2019-10-01 08:48:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '/storage/colorImages/Yi4y5l73HghhUxdbptEcxvhPwv4R2RJALjemZkCu.png', '2019-10-01 08:56:26', '2019-10-01 08:56:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '/storage/colorImages/5Vey5VEmMFISzcKaGDcVF8JWBOoBsfm5wTwQTjCr.png', '2019-10-01 10:02:58', '2019-10-01 10:02:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '/storage/colorImages/SqtlXt8pBUQMUQhwuUYqjElTRhYoNPJ451qbiaKC.png', '2019-10-01 10:08:52', '2019-10-01 10:08:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '/storage/colorImages/ELaFwyXZms50kO8ku3I3WASy72dOuQLHGghj1x8F.png', '2019-10-01 10:18:49', '2019-10-01 10:18:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '/storage/colorImages/tSC245k3WpMOFytf1FnDeKmoBoeVB9lwK8VjQ1HC.png', '2019-10-01 10:24:22', '2019-10-01 10:24:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '/storage/colorImages/59r3wWoLBBtnLsSh8ES33z5arpnbvwFOtlaKDRZy.png', '2019-10-01 10:27:34', '2019-10-01 10:27:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '/storage/colorImages/d09aPa5vLuOKcfQLcL3aoChH2H6SNppcENNmpJSD.png', '2019-10-01 12:18:06', '2019-10-01 12:18:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '/storage/colorImages/r3wJMnQ6G7TENbbZpYyd3k2VCXwDqrNsCLwlZGM6.png', '2019-10-01 13:13:39', '2019-10-01 13:13:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '/storage/productImages/iXOGj4IGgmQTPO4ZbxOR25hiAkdsBrGth26XJIiY.png', '2019-10-02 14:45:55', '2019-10-02 14:45:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '/storage/productImages/VGpH3UXkWRuLCjLUqwcAKx8IuuaG2iQI7MYwNHfd.png', '2019-10-02 14:45:55', '2019-10-02 14:45:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '/storage/productCardImages/6hwe0l7LOvnHVZv7QZqFe81sem8x0rAofNJW6Ofo.png', '2019-10-02 14:45:55', '2019-10-02 14:45:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, '/storage/productImages/vXYJKeKaLi7z1Tv9vlQ4R7Nlo9gUFmwU6oVTK0Wa.png', '2019-10-03 08:09:58', '2019-10-03 08:09:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, '/storage/productImages/uIGD7TYKosXov2itmU9aHixWP1lBBToleXVzDe4W.png', '2019-10-03 08:09:58', '2019-10-03 08:09:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, '/storage/productCardImages/a10ZCuNdq9xkWvnb3TsuERVAGeVKfm0VJaIa6OAM.png', '2019-10-03 08:09:58', '2019-10-03 08:09:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, '/storage/productImages/Nl3pUuzZUWkTZEShG0yyyumM1QMC7TeTVop1Og2k.png', '2019-10-03 08:13:15', '2019-10-03 08:13:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, '/storage/productImages/dbJgO3NCxdPFran1zTFK5T45t0M8tyIf7y9O8Q5Y.png', '2019-10-03 08:13:15', '2019-10-03 08:13:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, '/storage/productCardImages/aDkwhPzPY6rlPFfkQY4EOcQwirrlmYHxSD4MBi4g.png', '2019-10-03 08:13:15', '2019-10-03 08:13:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, '/storage/productCardImages/I6tUpmXbpqwdoW4igySTUTMKdilNrYYWpTtllTx6.png', '2019-10-03 08:35:17', '2019-10-03 08:35:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '/storage/productImages/i4VDSpZqvTlO8wEs8j05P0ClIDFF44GZ5itb4dZI.png', '2019-10-03 09:22:15', '2019-10-03 09:22:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '/storage/productImages/r4znxzfvNv3iSmJt9gQLl6KNFaZBmwqQNL8AOJyk.png', '2019-10-03 09:22:15', '2019-10-03 09:22:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, '/storage/productCardImages/OpJXd7qZW03WBGpbQ15yJexe4gUaLWXIJTqYuhmV.png', '2019-10-03 09:22:15', '2019-10-03 09:22:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, '/storage/productImages/RKZNHBRVkM7pg6Jl8IKqb4SIX5Rd6ZArAR1pvert.png', '2019-10-03 09:26:52', '2019-10-03 09:26:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '/storage/productImages/PtL1uXvby93qcVPHC0A8SBecENRzUwyW0ZtpfqSN.png', '2019-10-03 09:26:52', '2019-10-03 09:26:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, '/storage/productCardImages/mVKSUc8eDe3ocdKY7ktPx1wrr6x686XQpsBTd3cz.png', '2019-10-03 09:26:52', '2019-10-03 09:26:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, '/storage/productImages/GqyAHNVzp8xlVX5w5UXH2yNQmec3iUuLXHhh53Z8.png', '2019-10-03 09:42:41', '2019-10-03 09:42:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, '/storage/productImages/lzhjJapieOuB7J3hHCMH6yQ2zcreqJ7qwmXVUnba.png', '2019-10-03 09:42:41', '2019-10-03 09:42:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, '/storage/productCardImages/nSyFAReYQlF23xAUZV9hx3mAjhvV00nmos3jtbqZ.png', '2019-10-03 09:42:41', '2019-10-03 09:42:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, '/storage/productImages/zQdfchB5GvO2s16hLU7VP65rPRuoIsx0ina4mX8w.png', '2019-10-03 10:03:24', '2019-10-03 10:03:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '/storage/productCardImages/7rYbNSTPoOQhfc8NaT7S3yHwBvphEuUT4uLKtvmf.png', '2019-10-03 10:03:24', '2019-10-03 10:03:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, '/storage/productImages/fxNTCLxzUiqEZIo21CvPuX6vCg5BzsJMPF7nzUpf.png', '2019-10-03 10:15:51', '2019-10-03 10:15:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, '/storage/productImages/6JGI5dPTlToX915GJvDQv6jindw3MBJi5jc9ZwEz.png', '2019-10-03 10:15:51', '2019-10-03 10:15:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, '/storage/productCardImages/dKcuKTrw08ddC697a75Hhzct8U1TIK4odlkhFQSJ.png', '2019-10-03 10:15:51', '2019-10-03 10:15:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, '/storage/productImages/J5m5geiuBZ5D6qcgPk6bie177LWzLDqtctHjVHGY.png', '2019-10-03 10:30:32', '2019-10-03 10:30:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, '/storage/productImages/CkNaL728jA4dJ8h0gN9Atv0O3ukjUJqIn40OFpd3.png', '2019-10-03 10:30:32', '2019-10-03 10:30:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, '/storage/productCardImages/h959QBLODgoXO0iEXGl4rmIPUo7EywrQxgv1Jnxg.png', '2019-10-03 10:30:32', '2019-10-03 10:30:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, '/storage/productImages/Vx3DoqtBMRp8YE9bK2cuOU87RcjzPS2VLSNioZY7.png', '2019-10-03 10:42:26', '2019-10-03 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, '/storage/productImages/Iyxn5OBu1cRVkkE07mk6aIajIwr9FhzyjEp3Ykvx.png', '2019-10-03 10:42:26', '2019-10-03 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, '/storage/productCardImages/ZnbHk4KqW7Rj2yWW6htppVSkXPQqLIIfkCnkkR34.png', '2019-10-03 10:42:26', '2019-10-03 10:42:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, '/storage/productImages/S0iWWsCO3FzmF1VhUBBoqQKtyc2zEgbcDO4aYqev.png', '2019-10-03 14:30:22', '2019-10-03 14:30:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, '/storage/productImages/JlNFgxfwpiO2HvRG2M87TvYCVD3H3us9hdd9UlSB.png', '2019-10-03 14:30:22', '2019-10-03 14:30:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, '/storage/productCardImages/LLAIQ0mEfvhAm18BSPPhbp7JwdxbveHXVoWKhYAP.png', '2019-10-03 14:30:22', '2019-10-03 14:30:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, '/storage/productImages/n09BSr2U3w784TxmtqeShotmUBJu02sKO5aVQRPr.png', '2019-10-03 14:35:43', '2019-10-03 14:35:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, '/storage/productImages/8qH0YwfZ0AKyBmDWBTUUzFhEbiC4Ity0BPyRIzy9.png', '2019-10-03 14:35:43', '2019-10-03 14:35:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, '/storage/productCardImages/Y9kaogXZsc09DjbWa9PwTmpsX6Osr2uQQUgWvTm0.png', '2019-10-03 14:35:43', '2019-10-03 14:35:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, '/storage/productImages/EbFf6EuOFsT4gS6DssfEcvgw7cadYi8x420x1qdx.png', '2019-10-03 14:40:41', '2019-10-03 14:40:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, '/storage/productImages/wWqsk5br3ywsyilRuA0P9i4mBXt9aXgpjlkyz0sU.png', '2019-10-03 14:40:41', '2019-10-03 14:40:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, '/storage/productCardImages/qDQL6jh3N8rpWcLWX9Juor6feXWlNXsZSFLnw695.png', '2019-10-03 14:40:41', '2019-10-03 14:40:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, '/storage/productImages/aNTHR4e4TK1sphGoowQFA6zrEvpfT2ooeOo3uTqs.png', '2019-10-03 14:44:48', '2019-10-03 14:44:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, '/storage/productImages/VvJXKvikA9s8Mw01pkp4JGfsfnCsnAcYLYPjmJKW.png', '2019-10-03 14:44:48', '2019-10-03 14:44:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, '/storage/productCardImages/pYXAMgnHQjdtpTbdqVvaeBFMhq6EfjvcA9J13zNV.png', '2019-10-03 14:44:48', '2019-10-03 14:44:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, '/storage/productImages/RBW816wK6UaESR5md3HIgH2KcBSnkjSaPCKNFNWr.png', '2019-10-04 12:49:00', '2019-10-04 12:49:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, '/storage/productImages/oMudSaSMUBOMiNSX4xeCjmjdOxoIwZUY95b8GknN.png', '2019-10-04 12:49:00', '2019-10-04 12:49:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, '/storage/productCardImages/5YJEXLOlGE4clvLttLPiNdvXnHxx3BuLAm3CKcI0.png', '2019-10-04 12:49:00', '2019-10-04 12:49:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, '/storage/productImages/3qMhO8xW0fF6On8pQlDP6bx4LMVrYcrcs0WZAJvK.png', '2019-10-04 13:23:09', '2019-10-04 13:23:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, '/storage/productCardImages/7papQqf5xXGFKgc0LIoQULiR8HClgyqmYrQX6u6J.png', '2019-10-04 13:23:09', '2019-10-04 13:23:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, '/storage/productImages/GT9O7lo4mkc4ILoWJCqC2Xr4ICXHK40buG43VVzl.png', '2019-10-04 13:44:00', '2019-10-04 13:44:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, '/storage/productCardImages/Io0T0jSiJOfuFKDvjMILkq9Az05YvitaMlXkEbUE.png', '2019-10-04 13:44:00', '2019-10-04 13:44:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, '/storage/productImages/Tp5nJ0hh6jOo1akcLtG5goKuFJKGRqYphycDTkUP.png', '2019-10-04 13:46:50', '2019-10-04 13:46:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, '/storage/productCardImages/tJ3Kez2hXxd3AesAezMLZQ7HnjJDhS6JNRBkOm18.png', '2019-10-04 13:46:50', '2019-10-04 13:46:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, '/storage/productImages/ukCGyVMhBJDdW93WxEGZkZdg4d0F6re3sjZ9w5cq.png', '2019-10-04 13:53:35', '2019-10-04 13:53:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, '/storage/productCardImages/hPi6Q95zzi0vd2YnLYmhny1fW180KtzlA3ww8bVa.png', '2019-10-04 13:53:35', '2019-10-04 13:53:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, '/storage/productImages/dxnLRVfnQzSG422LECaHIUn1W40msAdht0G51PL4.png', '2019-10-04 13:58:33', '2019-10-04 13:58:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, '/storage/productImages/2PEaO0dv6vWpMfpBj5IWU1i1O7omcQHOt4i5oNL9.png', '2019-10-04 13:58:33', '2019-10-04 13:58:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, '/storage/productCardImages/47fR7zDJR8FFM3Xzf5AU4BVX6VJfwrnFPKoY879P.png', '2019-10-04 13:58:33', '2019-10-04 13:58:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, '/storage/productImages/n0nDy56UZtrphFWtocSuGg6Mwd18P2442Donf1dY.png', '2019-10-05 10:46:15', '2019-10-05 10:46:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, '/storage/productCardImages/ShaU9sjONYufghFmEKu01NZ4PVdQSCwZXOAY0E5T.png', '2019-10-05 10:46:15', '2019-10-05 10:46:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, '/storage/productImages/nmdftI5C2ejCqMPKpxZCMohhIoShxE1zEWebmr1c.png', '2019-10-05 14:53:48', '2019-10-05 14:53:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, '/storage/productCardImages/Ygbaoz6Ydv3BUO9fCWJ7Ug4BAeuCjVXDmINxWkQ2.png', '2019-10-05 14:53:48', '2019-10-05 14:53:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, '/storage/colorImages/RIDQ1jwohHa5D47kgisihZAb6OrZ4u2IH1WZE9xW.jpeg', '2019-10-06 13:46:39', '2019-10-06 13:46:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, '/storage/colorImages/sjVE33dNFEoME5I1F4tD8iDY5hOvMomZ4AhvGko5.jpeg', '2019-10-06 13:47:33', '2019-10-06 13:47:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, '/storage/colorImages/CAHlmzhoOOs29iXAQ2DGROprsdgCYVJAwupyFNmK.png', '2019-10-06 13:55:56', '2019-10-06 13:55:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, '/storage/colorImages/eGHHGqqg4G56VTvHjwgu9DTNIBRiRnZEVHql0OQa.png', '2019-10-06 13:56:38', '2019-10-06 13:56:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, '/storage/productImages/kjMS7y4WMXISVq3VJnqVOLRnAdewvRJb6KwwQoBd.png', '2019-10-06 21:28:33', '2019-10-06 21:28:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, '/storage/productCardImages/nWTwjRBwNOYbBtJzn0hEtNFed5VvPrI3o5rvrbNs.png', '2019-10-06 21:28:33', '2019-10-06 21:28:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, '/storage/productImages/JPCheeZkgcQVW05jvX7uDJfSmgvgzHDrzS47KsTb.png', '2019-10-06 21:38:11', '2019-10-06 21:38:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, '/storage/productCardImages/c8uBp8FYKcGN48xC9tGFUDSEMi6eoYkMENI8DikY.png', '2019-10-06 21:38:11', '2019-10-06 21:38:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, '/storage/productImages/4qsPK6y66iYLXfW1Il6YYxBXZdR1QG14TGfy9tC8.png', '2019-10-06 21:46:35', '2019-10-06 21:46:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, '/storage/productCardImages/k0AGrsFUePgRYu7RwcBz7rN1XIg9jxceucrDZwH7.png', '2019-10-06 21:46:35', '2019-10-06 21:46:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, '/storage/colorImages/3mHAREUyfEDIEVANspMCJf0BLvojXxhIHiXkHofC.png', '2019-10-07 07:47:21', '2019-10-07 07:47:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, '/storage/productImages/ik3ctPywejX70RLvbLk963VYhM397eZ17yUseiyr.png', '2019-10-07 07:51:40', '2019-10-07 07:51:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, '/storage/productCardImages/pk3LAeZ5HnbtFoeXwsf9Gmi94eXTmBtqiOoPxgzm.png', '2019-10-07 07:51:40', '2019-10-07 07:51:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, '/storage/productImages/ICRECMJOYmMoz3fTaHHMD7sEibOrTaMqbLgCT2ju.png', '2019-10-07 08:14:59', '2019-10-07 08:14:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, '/storage/productCardImages/Y0jTp9E5DJhcltzLkQkl8ILX6zPsugYP2yeJRL8A.png', '2019-10-07 08:14:59', '2019-10-07 08:14:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, '/storage/productImages/FPGWlGHaEONhjvwpWnibJdLhx1paaIfmGoWHLkxC.png', '2019-10-07 14:28:19', '2019-10-07 14:28:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, '/storage/productCardImages/G1VZu47FekYdvn2Fif6qrhvm4muuv2PnOfbKDupa.png', '2019-10-07 14:28:19', '2019-10-07 14:28:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, '/storage/productImages/L1g6RBqqUPzdhGTrASbY33H5cmHY3EPV3wTak4Yv.png', '2019-10-07 14:53:14', '2019-10-07 14:53:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, '/storage/productCardImages/5lv56BNbB7pZD5ZFpbI5SU3Rtcc0HgP6UsT3s5ih.png', '2019-10-07 14:53:14', '2019-10-07 14:53:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, '/storage/productImages/yPFbYemU7MCJfgfdUCsmdkzFP2gV6P8lhhELFVvt.png', '2019-10-07 15:04:49', '2019-10-07 15:04:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, '/storage/productCardImages/ajT6FUpkZ28xarzsU9uT6sxNc6bxUSj1QGWOo2Ya.png', '2019-10-07 15:04:49', '2019-10-07 15:04:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, '/storage/productCardImages/bF0KBKgQwfOFtUXcvQ3IoagQefQC0rwrLr6WkQNA.png', '2019-10-07 15:14:50', '2019-10-07 15:14:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, '/storage/productImages/pLZ7g6s4hoADT9sAgAGbCOXlU0aZpdY0h57qC2LV.png', '2019-10-09 09:20:04', '2019-10-09 09:20:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, '/storage/productCardImages/7QiGk0XzuaHhUTYzNkc24H9zO1azohjk9U2rXMRi.png', '2019-10-09 09:20:04', '2019-10-09 09:20:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, '/storage/productImages/dqACHJLqif3pvMWeDFQMqbThvYdiMmYD6YSv8BY6.png', '2019-10-09 09:35:58', '2019-10-09 09:35:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, '/storage/productCardImages/5MtELAbAYwhiTAA4wn76exRXnIZULju2pVt0V1UF.png', '2019-10-09 09:35:58', '2019-10-09 09:35:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, '/storage/productImages/mH58XSOD7uRTFyV91o1sjwZrSq0HyCsd7RF2FP0i.png', '2019-10-09 10:31:01', '2019-10-09 10:31:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, '/storage/productCardImages/YFxHQoE0JnL9xfUYMB20L8br4fwLzDSS2OTSWnGi.png', '2019-10-09 10:31:01', '2019-10-09 10:31:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, '/storage/productSliderImages/K1j1927zcAFWCycKzuawVBmFCcgj9rqBG6MHzcvG.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(268, '/storage/productSliderImages/d14RvnhS3JmVybhcLeqXpqqIHsP3BS0WbOmOCM47.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(269, '/storage/productSliderImages/MownHJm73yyOEYV0JPz2cteQX9XwS1qSK0ZPi90e.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, '/storage/productSliderImages/2mQiZnB6OpQqdWfCyvHZhGVjc9cXUrjGWN7CLuq3.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, '/storage/productSliderImages/lXsMQKFyPxPZqn0lutUN7H3AoibZQFq0OmPR4Ix4.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(272, '/storage/productSliderImages/tEHeoA0fMhUlgmSZvIWtwSiA0Wl25acYuPFNZwaL.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(273, '/storage/productSliderImages/yjvpygEdTb8HXDc8r8DZrelJumTAZPwg85qDebu5.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(274, '/storage/productSliderImages/Xzw9BQzNKMEER5Qy6o201ZyVCHGwsBT9TtGgvEdp.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, '/storage/productSliderImages/tuufCfzhmOeRiklf6W3qevxH3mVFnG8AJFFxoZiM.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(278, '/storage/productSliderImages/hxBZI8yAgegzpJZ51GjCmGa5TKPEo2TX9LkikcR8.png', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(279, '/storage/productImages/wye0KvKDx9K3Xw78b3xUqMg2DkE3Qtm4VPQLKCIW.png', '2019-10-09 20:04:49', '2019-10-09 20:04:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(280, '/storage/productImages/kF8ay4mAftdF1GQdhNwuLirwgQJCW3vkGKtxHsss.png', '2019-10-09 20:04:49', '2019-10-09 20:04:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(281, '/storage/productCardImages/080bx7TAT7gr10iZyDrjx0zMJb6T20oXl30cdOsO.png', '2019-10-09 20:04:49', '2019-10-09 20:04:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(384, '/storage/productImages/siuljNwRhW8lWwia13gL88rC9F3k1dwQQs4Clewq.png', '2019-10-13 09:07:11', '2019-10-13 09:07:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(385, '/storage/productImages/vJrTIL2Gv0u2umpwS2msWwECO9PX1LHSodQhJn5n.png', '2019-10-13 09:07:11', '2019-10-13 09:07:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(386, '/storage/productImages/K1TTKW1rNeivESWF7Lo7JH0xKnbCzettQtS2eyFn.png', '2019-10-13 09:14:12', '2019-10-13 09:14:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(387, '/storage/productImages/gmP93jiASHZZAigmvj9V6uT9Gnd7nqD2c6f9anFM.png', '2019-10-13 09:14:12', '2019-10-13 09:14:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(416, '/storage/productCardImages/kBvZ4uPr5QHpeTRiIIcaAT5FEm3rHsfql92g04Xb.png', '2019-10-21 08:13:09', '2019-10-21 08:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(417, '/storage/productImages/SQF7bDnlfrZ3QsqPzkSuXKugt39O6HG6ADd6UlFz.png', '2019-10-21 08:13:09', '2019-10-21 08:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(418, '/storage/productImages/x3j04OnDzhDJ7QDmGi4cBZivKdIS22WUWYCvhF7j.png', '2019-10-21 08:13:09', '2019-10-21 08:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(419, '/storage/productCardImages/KpB7XdLNGJnCxpaOdKZbXTj9VfhKpbiTGzcJyRVk.png', '2019-10-21 08:21:02', '2019-10-21 08:21:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(420, '/storage/productImages/24cytv5MXQlJog50Whln5RCPbfsCtyAlPbxSzTJv.png', '2019-10-21 08:21:02', '2019-10-21 08:21:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(421, '/storage/productImages/Itlact7CPYetiCLOLYUgsuVuIJUoQFCY5lPqYOov.png', '2019-10-21 08:21:02', '2019-10-21 08:21:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(422, '/storage/productCardImages/3jZZ3dGZgeh2V29zdMkUsx05Tp4iIS7sGLdzmkZr.png', '2019-10-21 08:23:58', '2019-10-21 08:23:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(423, '/storage/productImages/KnJ3vn16oem1VSgRRcT4d06Fas2aOQSc7WSTFxNE.png', '2019-10-21 08:23:58', '2019-10-21 08:23:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(424, '/storage/productImages/UAvt2ozQHDQD05nPPsKtUtL94arl6IfiZ0ih6Y0J.png', '2019-10-21 08:23:58', '2019-10-21 08:23:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(425, '/storage/productImages/5lr1QevI2H8oZYMCRkrU9Gf1UMmOgJP6SmKPoMUe.png', '2019-10-21 08:31:19', '2019-10-21 08:31:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(426, '/storage/productImages/lbnuUjAflnQqEl3H4ZTUYHzBVd6Kzl4YdUQQ9pbX.png', '2019-10-21 08:31:19', '2019-10-21 08:31:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(428, '/storage/productCardImages/9qM9p7XtGNeUdRJFmMfA3mbmQOgQaQQlFFBU138u.png', '2019-10-21 09:07:58', '2019-10-21 09:07:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(431, '/storage/productCardImages/CX3JC9ODxb8YHXHyCtrDsK9weLZlVp9SXnD7hCdp.png', '2019-10-22 08:14:55', '2019-10-22 08:14:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(432, '/storage/productImages/4dtVYO3L3drptVjUknVz3KppurylhWxAfvo7Z8Mi.png', '2019-10-22 08:14:55', '2019-10-22 08:14:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(433, '/storage/productCardImages/4j6hn80cYrfjBtFTScMo5iA9WVW7khCqFortRzrM.png', '2019-10-22 08:17:48', '2019-10-22 08:17:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(437, '/storage/productCardImages/HqoAciryEtcKYM87cjkPS4gzRbkB2JTir9MatnDZ.png', '2019-10-22 08:44:27', '2019-10-22 08:44:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(438, '/storage/productImages/ZrpMb6I0JCdpKUXqIGnQNSfp2i3ORG1zD9nbRiRk.png', '2019-10-22 08:44:27', '2019-10-22 08:44:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(439, '/storage/productCardImages/T9KYGyF91nLZYBZDqlgsu658Zxq1kYd2rxdgFT3C.png', '2019-10-22 08:49:26', '2019-10-22 08:49:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(440, '/storage/productImages/cIp8H2NMHEgmO5rx4Vl8dgDEWXSZZl8XPwwyIpdM.png', '2019-10-22 08:49:26', '2019-10-22 08:49:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(441, '/storage/productCardImages/j7yd4vpkpvVYjlOgHLcJakV7Hk3ZjTr8Medm5H4A.png', '2019-10-22 08:51:18', '2019-10-22 08:51:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(442, '/storage/productImages/OqdFBoixL4xypcUwogLLqPK58SHpyLAkzvlq0kXZ.png', '2019-10-22 08:51:18', '2019-10-22 08:51:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(443, '/storage/productCardImages/Ln8EE7QXrLWR3l767IRIoYb6QLrqPS9aRnyHERSn.png', '2019-10-22 08:56:31', '2019-10-22 08:56:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(444, '/storage/productImages/WVgLtrRzDOzcJUkW3rjGQFQPxilSqjcfZF42MyHc.png', '2019-10-22 08:56:31', '2019-10-22 08:56:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(445, '/storage/productCardImages/GrL1bx5EamkSZZHUaPycTD8kOpdAFwGRtqiKsu77.png', '2019-10-22 09:32:10', '2019-10-22 09:32:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(446, '/storage/productImages/Mop7eMm5BNyeKNYrMD2fk4n9ghUf31Ir7TMIkgT1.png', '2019-10-22 09:32:10', '2019-10-22 09:32:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(447, '/storage/productCardImages/s9x7Pzv5QK1MpyahOr4DNsh3oO4IaEtaFrg2hBgU.png', '2019-10-22 09:34:05', '2019-10-22 09:34:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(448, '/storage/productImages/WtPtMpgnV1VUK0GeMcLrAnugFeXlq2v1aA6uh6Hx.png', '2019-10-22 09:34:05', '2019-10-22 09:34:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(449, '/storage/productCardImages/uOZHKiqi4i07UAYlAW516g0w0hsv8Xw64wAy0Bal.png', '2019-10-22 09:35:25', '2019-10-22 09:35:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(450, '/storage/productImages/KVIJosP6caevUyWgQcZ9GHpbZ0eRFLjWuJEtrTOQ.png', '2019-10-22 09:35:25', '2019-10-22 09:35:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(451, '/storage/productCardImages/V8n1N9eukynWE2f74HzlkjhY1Br91SAH4mNEFW8c.png', '2019-10-22 09:39:01', '2019-10-22 09:39:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(452, '/storage/productImages/TpGoMjnV9OA3UbgvdNjvabRIy1EoNvVHR4Nv09jn.png', '2019-10-22 09:39:01', '2019-10-22 09:39:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(453, '/storage/productCardImages/sF1zf9nz5lBK2faED12PowCSym5zjoZJNmoItlxg.png', '2019-10-22 09:40:06', '2019-10-22 09:40:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(454, '/storage/productImages/2Jja2sIdrevdVLVW2j1z1Hh9LbakYVicm7XdQooI.png', '2019-10-22 09:40:06', '2019-10-22 09:40:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(455, '/storage/productCardImages/9yfwBKuQIJucQkHsfSlh1K9lLb6EtZP5xnHYl8vJ.png', '2019-10-22 09:41:34', '2019-10-22 09:41:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(456, '/storage/productImages/5PGIEciSRqqjYdUnKR5MUTc1mU1JNeud1i80NulP.png', '2019-10-22 09:41:34', '2019-10-22 09:41:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(457, '/storage/productCardImages/fHsoADhVhipTZ9v9lqFxHPyg33SulfYvXNRXrmie.png', '2019-10-22 09:43:03', '2019-10-22 09:43:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(458, '/storage/productImages/uiSxveaD2f2vw3gdEVS9fTSh3SohQ8bGaMOto55y.png', '2019-10-22 09:43:03', '2019-10-22 09:43:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(459, '/storage/productCardImages/ZoAM6E74qst2AthNN0aADb6wKgHvoT841QekcOIM.png', '2019-10-22 09:44:58', '2019-10-22 09:44:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(460, '/storage/productImages/jHtdLRKc72ClSjrWRC74b2G2KliwlNQuLyRho5ZK.png', '2019-10-22 09:44:58', '2019-10-22 09:44:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(461, '/storage/productCardImages/BmGOamJ79ll1Y5QWjPLflBaXVos1ifGnb0k3FSu2.png', '2019-10-22 09:46:48', '2019-10-22 09:46:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(462, '/storage/productImages/5opQVLPqTCwrZjWnmJEw30tiAeSx2yhzcgldIi80.png', '2019-10-22 09:46:48', '2019-10-22 09:46:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(463, '/storage/productCardImages/Szt99TizQDKaOsPFx7839s6QcJe4OnsnHcXZPLl2.png', '2019-10-22 09:47:59', '2019-10-22 09:47:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(464, '/storage/productImages/KbkJCBthgkwYFbk1SiEUGuTxELUL9ZiawS3lgK3F.png', '2019-10-22 09:47:59', '2019-10-22 09:47:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(465, '/storage/productCardImages/bE8RAKzALj6MsGQtlplD4ZcWqEAvBdZR6fP3tQ2b.png', '2019-10-22 09:52:37', '2019-10-22 09:52:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(466, '/storage/productImages/8sQPK2OY7tOdUTHH2MvyiHxdrpqRhTEsQzgOsz20.png', '2019-10-22 09:52:37', '2019-10-22 09:52:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(468, '/storage/productCardImages/dYoCx1sH9kyGPgQYb45zjli4pPTRz4M3AQ9lD6d5.png', '2019-10-22 09:55:22', '2019-10-22 09:55:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(469, '/storage/productImages/pqhKeY0bHX32P7JkSuzpQkNcsoyUFdEeLhm9n5Uq.png', '2019-10-22 09:55:22', '2019-10-22 09:55:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(471, '/storage/productImages/0tRdZGv6IcPPUDZEfuh1y54qDW1R48LLbPszGslg.png', '2019-10-22 09:59:10', '2019-10-22 09:59:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(474, '/storage/productImages/KrVz1laE4UB3px0ekCBVEpv3qiw9ZqoOPQd65c5F.png', '2019-10-22 10:07:27', '2019-10-22 10:07:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(475, '/storage/productCardImages/BHYB9uffRlnTvlQQQSBRJ0bluVVUXc1ROwFay4cd.png', '2019-10-22 10:10:32', '2019-10-22 10:10:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(476, '/storage/productImages/sA7SYeHeBN2piznwSP7MeVDaqCsBn99X5xErmzVT.png', '2019-10-22 10:10:32', '2019-10-22 10:10:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(477, '/storage/productCardImages/W2s6Ip01BPx6YDQB8ggiR71ACrL6OnpNkV7h4KrI.png', '2019-10-22 10:14:43', '2019-10-22 10:14:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(478, '/storage/productImages/eKAPuMZCEwWqA8WnZbnQztDDkUYRhlTe0DFsrM64.png', '2019-10-22 10:14:43', '2019-10-22 10:14:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(480, '/storage/productImages/r1OBkH5UAxI0aJaBErFa3BO8aWSB5Z1YTVZuOe12.png', '2019-10-22 10:16:38', '2019-10-22 10:16:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(481, '/storage/productCardImages/wfzIYk6MXZJnbQa21uPHYJD1HafAeWe52KC9152p.png', '2019-10-22 10:18:34', '2019-10-22 10:18:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(482, '/storage/productCardImages/SqamzgVseUOSzgVMMrUaeNFlv1KcFl6DkC6GGZIJ.png', '2019-10-22 10:21:19', '2019-10-22 10:21:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(483, '/storage/productCardImages/Cm9AlTI6mRCelDz0PAUEBc7BXuPmjYedQ2xzwZmL.png', '2019-10-22 10:26:03', '2019-10-22 10:26:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(484, '/storage/productImages/ns68jCvo3QqCC94uA9bWyYpBRfQUaGggnmqpGbzG.png', '2019-10-22 10:26:03', '2019-10-22 10:26:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(486, '/storage/productCardImages/AFwPq6kGTpvWntq4Gud5l707mXnetYlkaUG39Ky5.png', '2019-10-22 10:28:30', '2019-10-22 10:28:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(487, '/storage/productCardImages/3vTmNZRTVC9jxflyOAkfspuvcxZVrZ2WPjgEHcm6.png', '2019-10-22 10:30:32', '2019-10-22 10:30:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(488, '/storage/productImages/La50B7S2l2n3o2pIUf3OzF2Vh04yur16DZnJXgBA.png', '2019-10-22 10:30:32', '2019-10-22 10:30:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(489, '/storage/productImages/uYITJI3vaaf98NArxLlh5zwLEqfmV94vQZVuxON0.png', '2019-10-22 10:30:32', '2019-10-22 10:30:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(490, '/storage/productImages/2w9syRyTPFN5mOGKjxEKP2vh3fDo47CXvTyJQqJb.png', '2019-10-22 10:36:27', '2019-10-22 10:36:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(491, '/storage/productCardImages/OnVteq8KIKwSk0j5L42b7AgIFYMruPVfceDNwToQ.png', '2019-10-22 10:36:27', '2019-10-22 10:36:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(492, '/storage/productImages/yObazI8cSaKhpfCkwevL11qGPSZFZf3pjIn9REmw.png', '2019-10-22 10:41:05', '2019-10-22 10:41:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(493, '/storage/productImages/2mDUVcsbQLj0Ka0Ey8gMqPMEM9qDihJL40zC1DoW.png', '2019-10-22 10:43:31', '2019-10-22 10:43:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(494, '/storage/productImages/CFrVV1Tmw8hANzJTg9yOP3ozAU6tBlA0Jikg5VQV.png', '2019-10-22 10:43:31', '2019-10-22 10:43:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(495, '/storage/productCardImages/YYy1Cc2IrccaIHGtRrQdYVcaY8ef0LawVUXhFBTM.png', '2019-10-22 10:43:31', '2019-10-22 10:43:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(496, '/storage/productImages/7j2xOqONYSb6gogF8nnnVeRp7lQd3k6f4XWrF6du.png', '2019-10-22 10:45:36', '2019-10-22 10:45:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(497, '/storage/productCardImages/WEYhZsSlR1AznA43JC2FkO1UcxlT4s8oHlco2ETW.png', '2019-10-22 10:45:36', '2019-10-22 10:45:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(498, '/storage/productImages/PFK5g9eFisZoYYulqGqaw0pW0uQbMAtzV1JwL6l2.png', '2019-10-22 10:47:38', '2019-10-22 10:47:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(499, '/storage/productCardImages/VHMucOkLLkrGVldZOCSYcXOe7WwYn5amD2AwtKx7.png', '2019-10-22 10:47:38', '2019-10-22 10:47:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(500, '/storage/productImages/YFhbMJvgc3J2MTa6Fn1YhemE02nhvAIGR3fvJUAo.png', '2019-10-22 10:50:12', '2019-10-22 10:50:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(501, '/storage/productImages/RrQxAnbmTsJc6Z1up3Xs7PPcXohfUXKdDSrUF2Nv.png', '2019-10-22 10:50:12', '2019-10-22 10:50:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(502, '/storage/productCardImages/X65RlZFRb9vy5x4Uk9tSDV11kTbfAn2z76m0r12v.png', '2019-10-22 10:50:12', '2019-10-22 10:50:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(503, '/storage/productImages/jH7pI1m4daJbBBv02tEEvZ6DQzMgmkBRDhBL6mls.png', '2019-10-22 10:52:48', '2019-10-22 10:52:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(504, '/storage/productImages/dz7AtcKYF0hQTJbXk8SAHl4lrq4qbvrBiFmyC64h.png', '2019-10-22 10:52:48', '2019-10-22 10:52:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(505, '/storage/productCardImages/9YdbY8ub8SQdZT7uKYRjZrMjJKfhmAuhQyYgevjp.png', '2019-10-22 10:52:48', '2019-10-22 10:52:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(506, '/storage/productImages/1fi2MZg9zeemr36bAnzTUO8PsavYIWti3715syrO.png', '2019-10-22 10:55:14', '2019-10-22 10:55:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(507, '/storage/productImages/0N3ELcZzHZPZfRygDI9ea7L3obaPOwjnGYP9WfMv.png', '2019-10-22 10:55:14', '2019-10-22 10:55:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(508, '/storage/productCardImages/d54IYU97bQjOQDylNMwpsfMoVf7kIbFZZmoZZ9vZ.png', '2019-10-22 10:55:14', '2019-10-22 10:55:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(509, '/storage/productImages/1rVY8oLBih7nGXlQFzIEqDWmKzwuVx5FyCOSFYVZ.png', '2019-10-22 10:58:16', '2019-10-22 10:58:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(510, '/storage/productImages/3XwiodrjnVrgleYOQYXq3XkAUUuObkm7gbC0KHBm.png', '2019-10-22 10:58:16', '2019-10-22 10:58:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(511, '/storage/productCardImages/WuWwGELt21kEzUTeO70xzdmMms44IA2yA1y9XO3Y.png', '2019-10-22 10:58:16', '2019-10-22 10:58:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(512, '/storage/productCardImages/Wn95xBqPBeNawSfolzSOHyzfq3UFYOvlcZRVzUCR.png', '2019-10-27 14:53:22', '2019-10-27 14:53:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(513, '/storage/productImages/Va8SArAXybrjDlnTEVpHDi3wZA2qaceqk2EU0TQj.png', '2019-10-27 14:53:22', '2019-10-27 14:53:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(516, '/storage/productCardImages/CE3qytxSXxK8f8hjuB0gVHxJXSdbMagTZKj2BImb.jpeg', '2019-12-15 13:45:38', '2019-12-15 13:45:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(519, '/storage/productCardImages/bdYAn226SeYhqZ3TWhXApoEP8W3ACpSJ9i3V3o9o.jpeg', '2019-12-15 13:49:13', '2019-12-15 13:49:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(520, '/storage/productImages/hraBZwcnFZwFn1ZVquk70kN1gLuqB3gW8l1CkUUb.jpeg', '2019-12-15 14:03:28', '2019-12-15 14:03:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(521, '/storage/productCardImages/fMNdaO3pNZS21KFxP6DoA1edFQvWZuWZu49qEY0W.jpeg', '2019-12-15 14:03:28', '2019-12-15 14:03:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(523, '/storage/productImages/WDWElGXy8e6ffFt4u6mBNe8nNRlNi6gvrVVWbqOa.jpeg', '2019-12-15 14:12:48', '2019-12-15 14:12:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(524, '/storage/productImages/rJqi5OKzTz6q16Jwzbd3XgbhGLxEip3FdX1I0lfU.jpeg', '2019-12-15 14:14:53', '2019-12-15 14:14:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(525, '/storage/productImages/RO0gRcqLGPTcUCM3obW0Zg0Zp3Vh7yCZ1nIdLlDw.jpeg', '2019-12-15 14:19:42', '2019-12-15 14:19:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(526, '/storage/productCardImages/YGMH1HApZnolQsIcZcbtaeb8AOodec9ah38Klar9.jpeg', '2019-12-15 14:19:42', '2019-12-15 14:19:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(527, '/storage/productImages/QLBPLDDKYqmixFqySqYi45GLXFSJMzaFMWbK1b4W.png', '2019-12-16 09:01:23', '2019-12-16 09:01:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(528, '/storage/productCardImages/1zjgTFZtci0neXplg5fOBXJF7l6xzNhAwhnPgsY5.png', '2019-12-16 09:01:23', '2019-12-16 09:01:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(529, '/storage/productImages/dWQuzhOY1tGbA1uOZE5Ryz6p3GdBjW6VyKlXv1iL.png', '2019-12-16 09:08:36', '2019-12-16 09:08:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(530, '/storage/productCardImages/zVmcYhEYkV7ApBXL0KCwXVhZec9Da59rXrk7FRsI.png', '2019-12-16 09:08:36', '2019-12-16 09:08:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(531, '/storage/productImages/NxEMCSGl1xFLPY1KCEmzUTeWeYQWkI4NmjuepdoR.jpeg', '2019-12-18 12:48:11', '2019-12-18 12:48:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(532, '/storage/productCardImages/P3NFqEu3q95tuz02GlZJuoPW0Ejc8yMrJKnDdZqw.jpeg', '2019-12-18 12:48:11', '2019-12-18 12:48:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ynkjxrau_newmoboffice` (`COL 1`, `COL 2`, `COL 3`, `COL 4`, `COL 5`, `COL 6`, `COL 7`, `COL 8`, `COL 9`, `COL 10`, `COL 11`, `COL 12`) VALUES
(533, '/storage/productImages/UXoD1vF7dv67OgKX2LAtBBw7B7ONMxwrRuZ48m8E.png', '2020-02-04 09:30:29', '2020-02-04 09:30:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(534, '/storage/productImages/d8oirvqITZOeoci58bABKZHJs3s8EbZqd7AOzY5E.png', '2020-02-04 09:30:29', '2020-02-04 09:30:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(535, '/storage/productCardImages/vSjrb4WLYEtAl7YTYIGgfkHwIOOoe9ODLnmY9RNT.png', '2020-02-04 09:30:29', '2020-02-04 09:30:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(536, '/storage/productImages/S6saoffD2ggoXquJN0O4seGjMlXoEacEkmATStmV.png', '2020-02-04 09:34:20', '2020-02-04 09:34:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(537, '/storage/productCardImages/nptDO8ZzBtQhUa9x3D5xs4FrBlsBuOhOxpMnB8IC.png', '2020-02-04 09:34:20', '2020-02-04 09:34:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(538, '/storage/productImages/sk0l3A2ut8RuwhcfC2Lxlqv8Zgm0939qdmPJKmy1.png', '2020-02-04 09:42:25', '2020-02-04 09:42:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(539, '/storage/productCardImages/GaTOs7Z2rD6hW17x2trc1tI3Enz8MKJPTACSavDX.png', '2020-02-04 09:42:25', '2020-02-04 09:42:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(540, '/storage/productImages/NX8lSbcLoHVUNtXLeSeiFUI3UsfXo6lEcYxcRtSI.png', '2020-02-04 09:47:06', '2020-02-04 09:47:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(541, '/storage/productCardImages/YE1nW6ZrSvn6Fqog3k90rwfExtnRLPmWGsLvLrYS.png', '2020-02-04 09:47:06', '2020-02-04 09:47:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(542, '/storage/productImages/moNWYLdHWoWNZjzrIOsDUns3kyZm4hCfQaWRKqtI.png', '2020-02-04 10:19:24', '2020-02-04 10:19:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(543, '/storage/productCardImages/lJdFZDKpL7n5i1hg5hp3e7He22b7321t0hcgBAKl.png', '2020-02-04 10:19:24', '2020-02-04 10:19:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(544, '/storage/productImages/EbuliiZKMkEfHfHh5gfvhSHNdv2hq1bsJhMFQKJt.png', '2020-02-04 10:21:37', '2020-02-04 10:21:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(545, '/storage/productCardImages/UWy41Up1ADHA0ESADNIoYrC1fFbxHgX6oo9PTh1D.png', '2020-02-04 10:21:37', '2020-02-04 10:21:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(546, '/storage/productImages/nym8nl2sXprUWCAGsrcXGYuS6yXAxm1HDAXKWMaV.png', '2020-02-04 10:38:13', '2020-02-04 10:38:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(547, '/storage/productCardImages/twrg7jaHLu8y8lUZM3BqfvuP1d3wTIFjKgCCGQ8q.png', '2020-02-04 10:38:13', '2020-02-04 10:38:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, '1', '14', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '1', '15', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '1', '16', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(4, '1', '17', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(5, '1', '18', 'slider', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2', '21', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2', '22', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2', '23', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2', '24', 'slider', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(10, '3', '25', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(11, '3', '26', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(12, '4', '27', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(13, '4', '28', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(14, '4', '29', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(15, '6', '30', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(16, '6', '31', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(17, '7', '32', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(18, '7', '33', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(19, '7', '34', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(20, '8', '35', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(21, '8', '36', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(22, '8', '37', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(23, '9', '38', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(24, '9', '39', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(25, '9', '40', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(30, '11', '45', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(31, '11', '46', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(32, '11', '47', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(33, '11', '48', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(34, '12', '49', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(35, '12', '50', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(36, '12', '51', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(37, '12', '52', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(38, '13', '53', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(39, '13', '54', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(40, '13', '55', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(41, '14', '56', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(42, '14', '57', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(43, '14', '58', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(45, '15', '60', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(50, '18', '65', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(51, '18', '66', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(52, '18', '67', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(53, '19', '68', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(54, '19', '69', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(55, '19', '70', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(56, '20', '71', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(57, '20', '72', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(58, '20', '73', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(59, '21', '74', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(60, '21', '75', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(61, '21', '76', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(62, '22', '77', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(63, '22', '78', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(64, '22', '79', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(65, '23', '80', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(66, '23', '81', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(67, '23', '82', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(68, '24', '83', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(69, '24', '84', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(70, '24', '85', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(71, '25', '86', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(72, '25', '87', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(73, '26', '88', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(74, '26', '89', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(75, '26', '90', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(76, '27', '91', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(77, '27', '92', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(78, '27', '93', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(79, '28', '94', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(80, '28', '95', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(81, '28', '96', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(85, '31', '100', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(86, '31', '101', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(87, '31', '102', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(88, '32', '103', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(89, '32', '104', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(90, '32', '105', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(91, '33', '106', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(92, '33', '107', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(93, '33', '108', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(94, '34', '109', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(95, '34', '110', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(96, '34', '111', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(100, '35', '115', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(101, '35', '116', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(102, '35', '117', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(103, '36', '118', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(104, '36', '119', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(105, '37', '120', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(106, '37', '121', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(107, '38', '122', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(108, '38', '123', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(109, '36', '124', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(110, '36', '125', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(111, '37', '126', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(112, '37', '127', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(113, '38', '128', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(114, '38', '129', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(115, '39', '130', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(116, '39', '131', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(121, '37', '136', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(122, '37', '137', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(123, '41', '138', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(124, '41', '139', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(125, '42', '140', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(126, '42', '141', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(127, '43', '142', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(128, '43', '143', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(129, '44', '144', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(130, '44', '145', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(131, '44', '146', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(142, '50', '157', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(143, '50', '158', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(152, '55', '167', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(153, '55', '168', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(156, '21', '171', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(157, '21', '172', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(162, '58', '181', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(163, '58', '182', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(180, '67', '199', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(181, '67', '200', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(184, '69', '203', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(185, '69', '204', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(186, '70', '205', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(187, '70', '206', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(192, '73', '212', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(193, '73', '213', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(202, '78', '222', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(203, '78', '223', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(207, '80', '227', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(208, '80', '228', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(209, '81', '229', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(210, '81', '230', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(211, '82', '231', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(212, '82', '232', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(218, '29', '238', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(228, '71', '248', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(229, '71', '249', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(234, '72', '254', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(235, '72', '255', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(238, '79', '258', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(239, '79', '259', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(246, '62', '279', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(247, '62', '280', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(248, '62', '281', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(351, '29', '384', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(352, '29', '385', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(353, '15', '386', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(354, '15', '387', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(383, '10', '416', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(384, '10', '417', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(385, '10', '418', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(386, '17', '419', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(387, '17', '420', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(388, '17', '421', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(389, '83', '422', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(390, '83', '423', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(391, '83', '424', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(392, '90', '425', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(393, '90', '426', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(395, '90', '428', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(398, '60', '431', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(399, '60', '432', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(400, '64', '433', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(404, '40', '437', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(405, '40', '438', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(406, '45', '439', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(407, '45', '440', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(408, '46', '441', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(409, '46', '442', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(410, '47', '443', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(411, '47', '444', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(412, '48', '445', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(413, '48', '446', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(414, '49', '447', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(415, '49', '448', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(416, '51', '449', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(417, '51', '450', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(418, '52', '451', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(419, '52', '452', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(420, '53', '453', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(421, '53', '454', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(422, '54', '455', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(423, '54', '456', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(424, '56', '457', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(425, '56', '458', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(426, '57', '459', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(427, '57', '460', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(428, '59', '461', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(429, '59', '462', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(430, '61', '463', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(431, '61', '464', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(432, '65', '465', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(433, '65', '466', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(435, '66', '468', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(436, '66', '469', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(438, '74', '471', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(441, '76', '474', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(442, '63', '475', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(443, '63', '476', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(444, '68', '477', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(445, '68', '478', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(447, '77', '480', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(448, '76', '481', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(449, '74', '482', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(450, '75', '483', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(451, '75', '484', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(453, '77', '486', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(454, '84', '487', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(455, '84', '488', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(456, '84', '489', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(457, '91', '490', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(458, '91', '491', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(459, '64', '492', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(460, '92', '493', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(461, '92', '494', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(462, '92', '495', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(463, '93', '496', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(464, '93', '497', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(465, '94', '498', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(466, '94', '499', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(467, '95', '500', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(468, '95', '501', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(469, '95', '502', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(470, '96', '503', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(471, '96', '504', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(472, '96', '505', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(473, '97', '506', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(474, '97', '507', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(475, '97', '508', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(476, '98', '509', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(477, '98', '510', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(478, '98', '511', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(479, '16', '512', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(480, '16', '513', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(483, '99', '516', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(486, '100', '519', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(487, '101', '520', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(488, '101', '521', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(490, '100', '523', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(491, '99', '524', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(492, '102', '525', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(493, '102', '526', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(494, '103', '527', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(495, '103', '528', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(496, '104', '529', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(497, '104', '530', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(498, '105', '531', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(499, '105', '532', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(500, '106', '533', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(501, '106', '534', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(502, '106', '535', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(503, '107', '536', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(504, '107', '537', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(505, '108', '538', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(506, '108', '539', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(507, '109', '540', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(508, '109', '541', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(509, '110', '542', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(510, '110', '543', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(511, '111', '544', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(512, '111', '545', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(513, '112', '546', 'product_image', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(514, '112', '547', 'card', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(1, '2014_10_12_000000_create_users_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2014_10_12_100000_create_password_resets_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2019_05_27_121110_create_admins_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2019_05_27_160627_create_images_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2019_05_27_160723_create_products_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2019_07_23_070757_create_types_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2019_07_23_072559_create_image_product_pivot_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2019_07_23_083039_creates_collection_product_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2019_07_30_185116_create_clients_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2019_07_30_210830_create_retailers_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2019_08_13_010832_create_client_pros_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2019_08_13_171657_create_orders_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2019_09_03_181312_create_colors_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2019_09_03_194135_creates_color_image_pivot_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2019_09_04_110308_creates_color_product_pivot_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2019_09_14_230037_creates_order_product_pivot_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2019_10_07_155022_create_sliders_table', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'NM030100', '3', '274', '36800', '5', 'Bureau beech large', '', '1.80m / 0.70m', '- Bureau de direction beech<br />\r\n- Avec retour<br />\r\n- 50% MDF  couleur beech + mélaminé blanc + pieds métalliques blancs <br />\r\n- 50% MDF  couleur beech + mélaminé noir + pieds métalliques noirs', '2019-10-02 14:45:55', '2020-07-09 11:45:44'),
(10, 'NM030101', '3', '177', '47500', '5', 'Bureau SHY petit model', '', '1.40M / 0.70m', '-Bureau de direction SHY<br />\r\n-avec caisson et retour mobile<br />\r\n-100% MDF', '2019-10-02 15:14:44', '2020-07-09 01:39:28'),
(13, 'NM030104', '3', '526', '34500', '5', 'Bureau sam moyen model', '', '1.60m / 0.70m', '- Bureau de direction SAM<br />\r\n- Avec caisson et retour fixe<br />\r\n- 50% MDF Couleur teak blanc + mélaminé gris<br />\r\n- 50% MDF Couleur panama marron gloss + mélaminé gris', '2019-10-03 08:09:58', '2020-07-10 15:35:34'),
(14, 'NM030105', '3', '114', '38800', '5', 'Bureau sam large model', '', '1.80m / 0.70m', '- Bureau de direction SAM<br />\r\n- Avec caisson et retour fixe<br />\r\n- 50% MDF Couleur teak blanc + mélaminé gris<br />\r\n- 50% MDF Couleur panama marron gloss + mélaminé gris', '2019-10-03 08:13:15', '2020-07-09 03:53:16'),
(15, 'NM030106', '3', '53', '36800', '5', 'Bureau ADIS petit model', '', '1.40m / 0.70m', '- Bureau de direction ADIDAS<br />\r\n- Avec caisson<br />\r\n- 60% MDF Couleur teck foncé + mélaminé gris', '2019-10-03 08:35:17', '2020-06-29 12:14:24'),
(16, 'NM030107', '3', '158', '45000', '4', 'Bureau ADIS moyen model', '', '1.60m / 0.80m', '- Bureau de direction adidas<br />\r\n- avec caisson & retour <br />\r\n- 60% MDF Couleur teck foncé  + mélaminé gris', '2019-10-03 08:52:29', '2020-07-07 14:48:51'),
(17, 'NM030108', '3', '285', '59976', '5', 'Bureau ADIS large model', '', '1.80m / 0.80m', '- Bureau de direction adidas<br />\r\n- Avec caisson & retour<br />\r\n- 60% MDF Couleur teck foncé  + mélaminé', '2019-10-03 08:55:28', '2020-07-08 17:10:17'),
(21, 'NM0501', '3', '44', '38000', '5', 'Bureau Y', '', '1.40m / 0.75 m', '- Bureau operateur Y<br />\r\n- Avec caisson<br />\r\n- 60% MDF Couleur beech + mélaminé gris', '2019-10-03 09:22:15', '2020-06-18 19:35:09'),
(22, 'NM030112', '3', '33', '48300', '5', 'Bureau Y moyen model', '', '1.60m / 0.75m', '- Bureau de direction Y<br />\r\n- Avec caisson & retour<br />\r\n- 60% MDF Couleur beech + mélaminé gris', '2019-10-03 09:26:52', '2020-05-02 22:27:04'),
(24, 'NM030114', '3', '70', '79000', '5', 'Bureau ROMA large model', '', '2.20m/ 0.95m', '- Bureau ROMA <br />\r\n- Avec caisson & retour<br />\r\n- 90% MDF Couleur acajou + mélaminé gris', '2019-10-03 09:42:41', '2020-07-02 16:22:39'),
(25, 'NM050100', '5', '42', '9900', '5', 'Bureau ERABLE 1 mètre', '', '1m / 0,5m', '-Bureau opérateur ERABLE 1m<br />\r\n-1 tiroir<br />\r\n-Caisson fixe<br />\r\n-Couleur mélaminé pyjama +mélaminé (gris)ou (noir)', '2019-10-03 10:03:24', '2020-07-10 02:00:34'),
(26, 'NM0301', '3', '146', '39500', '5', 'Bureau beech', '', '1.60m / 0.70m', '- Bureau de direction beech<br />\r\n- Avec retour<br />\r\n- 50% MDF Couleur beech +mélaminé blanc + pieds blancs<br />\r\n- 50% MDF Couleur beech +mélaminé noir + pieds noirs', '2019-10-03 10:15:51', '2020-07-07 14:48:51'),
(27, 'NM030109', '2', '17', '39500', '5', 'Bureau ARC petit model', '', '1.40m / 0,75m', '- Bureau de direction ARC<br />\r\n- Avec caisson<br />\r\n- 50% MDF Couleur (blanc neige+chene fance)ou(moka+cappuccino)', '2019-10-03 10:30:32', '2020-06-14 11:47:01'),
(28, 'NM030110', '3', '151', '49300', '4', 'Bureau ARC moyen model', '', '1.60M / 75cm', '- Bureau de direction ARC<br />\r\n- Couleur(blanc neige+chene fance)ou(moka+cappuccino claire)<br />\r\n- 50% MDF avec caisson & retour mélaminé blanc', '2019-10-03 10:42:26', '2020-07-08 21:37:16'),
(29, 'NM030111', '3', '38', '63500', '5', 'Bureau SHY large model.', '', '1.80m / 0.80m', '-Bureau de direction SHY<br />\r\n-Avec caisson& retour<br />\r\n-Couleur (teck fance-acajou)', '2019-10-03 10:51:48', '2020-05-05 02:42:09'),
(31, 'NM030102', '3', '38', '55800', '4', 'Bureau ARC large model', '', '1.80m / 0.75m', '-Bureau de direction ARC<br />\r\n-Avec caisson & retour (mélaminé blanc)<br />\r\n-Couleur (blanc neige + chene fance) ou (moka + cappuccino)', '2019-10-03 14:30:22', '2020-07-09 09:50:33'),
(32, 'NM030103', '3', '22', '38000', '5', 'Bureau Y petit model', '', '1,40m/ 0.75m', '- Bureau de direction Y<br />\r\n- 60% MDF Couleur beech + mélaminé gris<br />\r\n- Avec caisson', '2019-10-03 14:35:43', '2020-06-14 10:23:30'),
(33, 'NM030115', '3', '71', '73000', '5', 'Bureau ROMA petit model', '', '1.80m / 0.80m', '- Bureau de direction ROMA<br />\r\n- Avec caisson & retour<br />\r\n- 90% MDF Couleur acajou + mélaminé gris', '2019-10-03 14:40:41', '2020-07-10 20:24:35'),
(34, 'NM030116', '3', '21', '76000', '5', 'Bureau ROMA moyen model', '', '2m /0.80m', '- Bureau de direction ROMA<br />\r\n- Avec caisson & retour<br />\r\n- 90% MDF Couleur acajou + mélaminé gris', '2019-10-03 14:44:48', '2020-06-15 05:06:27'),
(35, 'NM030117', '3', '165', '59500', '5', 'Bureau SHY moyen model', '', '1.60m / 0.80m', '- Bureau de direction SHY<br />\r\n- Avec caisson & retour<br />\r\n- 100% MDF Couleur (teck fance - acajou)', '2019-10-04 12:49:00', '2020-07-07 14:48:50'),
(39, 'NM050104', '5', '410', '29200', '5', 'Bureau ERABLE 1.60 mètre mobile', '', '1.60m / 0.70m', '-Bureau opérateur ERABLE 1.60m mobile<br />\r\n-Avec caisson & retour mobile<br />\r\n-Couleur; mélaminé pyjama + mélaminé gris(noir)', '2019-10-04 13:23:09', '2020-07-07 22:46:19'),
(40, 'NM050105', '5', '148', '9800', '4', 'Bureau STD', '', '1 place', '-Bureau opérateur STD<br />\r\n-Couleur ; vertical marron + mélaminé (noir) ou (gris)<br />\r\n-Couleur ; crème uni + mélaminé (noir)ou (gris)', '2019-10-04 13:31:35', '2020-07-07 14:49:55'),
(41, 'NM050101', '5', '27', '8800', '5', 'Bureau ERABLE 1.20 metre', '', '1.20m/0.60m', '-Bureau opérateur ERABLE 1.20m<br />\r\n-Avec caisson fixe<br />\r\n-Couleur mélaminé pyjama + mélaminé (gris)ou(noir)', '2019-10-04 13:44:00', '2020-06-18 08:08:15'),
(42, 'NM050102', '5', '29', '11800', '5', 'Bureau ERABLE 1.40 mètre', '', '1.40M / 0.70m', '-Bureau opérateur ERABLE 1.40<br />\r\n-Avec caisson fixe<br />\r\n-Couleur ; melamine pyjama + melamine (gris) ou (noir)', '2019-10-04 13:46:50', '2020-07-07 00:49:41'),
(43, 'NM050103', '5', '28', '12200', '5', 'Bureau ERABLE 1.60 metre', '', '1.60m / 0.70m', '-Bureau opérateur ERABLE 1.60m<br />\r\n-Avec caisson fixe<br />\r\n-Couleur ; mélaminé pyjama + mélaminé (gris) ou (noir)', '2019-10-04 13:53:34', '2020-03-15 12:10:40'),
(44, 'NM030118', '3', '175', '26800', '5', 'Bureau Malizya', '', '1.40M / 0.70m', '- Bureau de direction MALIZYA<br />\r\n- Avec caisson & retour fixe<br />\r\n- 50% MDF Couleur ; chene fance + mélaminé gris', '2019-10-04 13:58:33', '2020-07-10 15:13:23'),
(45, 'NM0201', '2', '29', '15800', '4', 'Armoire ERABLE pleine', '', 'h 1.80m / L 0.80m / prof 0.40m', '-Armoire ERABLE pleine<br />\r\n-Carcasse mélaminé gris / noir<br />\r\n-Porte mélaminé erable', '2019-10-05 08:00:07', '2020-06-15 04:09:45'),
(46, 'NM020100', '2', '18', '28600', '5', 'Armoire beech pleine G.M', '', 'h 1.80m / L 0.80m / prof 0.40m', '-Armoire beech pleine G.M<br />\r\n-Carcasse mélaminé gris <br />\r\n- Porte MDF couleur beech kristall', '2019-10-05 08:12:33', '2020-06-14 22:01:41'),
(47, 'NM020101', '2', '20', '26800', '5', 'Armoire beech vitres', '', 'h 1.80m / L 0.80m / prof 0.40m', '-Armoire beech vitres<br />\r\n-2 portes vitres/ 2 porte MDF (couleur beech)<br />\r\n-Carcasse mélaminé gris', '2019-10-05 08:34:03', '2020-06-28 15:33:16'),
(48, 'NM020102', '3', '21', '28600', '5', 'Armoire ADIS 3 porte', '', 'h 1.80m / L 0.135m / prof 0.40m', '-Armoire Adidas 3 Portes<br />\r\n-Couleur porte MDF teck fance <br />\r\n-Carcasse mélaminé gris', '2019-10-05 08:42:24', '2020-06-12 23:02:19'),
(49, 'NM020103', '2', '147', '26800', '5', 'Armoire bahut beech +VITRE', '', 'h 0.90m /L 0.80m / prof 0.40m BAHUT /h 0.90m /L 0.80m / prof 0.40m VITRE', '-Armoire bahut beech<br />\r\n-Couleur beech<br />\r\n-Portes MDF <br />\r\n-Carcasse melamine gris/ blanc<br />\r\n-2 Portes  bahut vitres', '2019-10-05 08:57:02', '2020-07-07 11:45:36'),
(51, 'NM020105', '3', '8', '32000', '5', 'Armoire ADIS 2 portes pleine', '', 'h 1.80m / L 0.135m / prof 0.40m', '-Armoire  Adidas 2 portes<br />\r\n-Couleur MDF  teck fance<br />\r\n-Carcasse mélaminé gris', '2019-10-05 09:16:42', '2020-01-29 09:33:28'),
(52, 'NM020106', '3', '123', '28600', '5', 'Armoire ADIS 2 portes vitres', '', 'h 1.80m / L 0.80m / prof 0.40m', '-Armoire Adidas vitres <br />\r\n-2 portes<br />\r\n-Couleur teck fance + mélaminé gris', '2019-10-05 09:27:05', '2020-07-07 14:48:51'),
(53, 'NM020107', '2', '188', '37000', '5', 'Armoire SHY pleine', '', 'h2m / L0.90m / prof 0.40m', '-Armoire SHY pleine<br />\r\n-100% MDF <br />\r\n-Couleurs: acajou / teck fance', '2019-10-05 09:33:23', '2020-07-07 11:45:36'),
(54, 'NM020108', '2', '16', '35500', '5', 'Armoire shy vitres', '', 'h2m / L0.90m / prof 0.40m', '-Armoire SHY vitres<br />\r\n-couleurs ; acajou / teck fance', '2019-10-05 09:37:54', '2020-06-27 10:05:46'),
(55, 'NM030113', '3', '189', '53000', '5', 'Bureau Y large model', '', '1.80m / 0.75m', '-Bureau de direction Y<br />\r\n-Avec caisson & retour<br />\r\n-Couleur beech + mélaminé gris', '2019-10-05 10:46:15', '2020-07-07 14:43:04'),
(56, 'NM1001', '10', '22', '12800', '5', 'Chaise triplette', '', '3 places', '-Banquette de réception<br />\r\n-3 places<br />\r\n-Couleur argent', '2019-10-06 14:00:21', '2020-07-09 06:05:29'),
(57, 'NM2501', '26', '15', '3200', '4', 'Chaise lux  plastique G081', '', '1 place', '-Chaise lux G081<br />\r\n-plastique<br />\r\n-couleur; noir&jaune', '2019-10-06 14:04:42', '2020-06-07 10:40:54'),
(59, 'NM100100', '10', '153', '14800', '5', 'Chaise 3 Places 2202', '', '3 places', '-Chaise accoudoir 2202<br />\r\n-3 Places<br />\r\n-couleur noir', '2019-10-06 14:23:27', '2020-07-07 14:45:58'),
(60, 'NM240100', '24', '179', '12400', '5', 'Chaise Star 2616 C', '', '1 place', '-Chaise Star 2616 C <br />\r\n-Accoudoir<br />\r\n-Couleur noir<br />\r\n-Fixe', '2019-10-06 14:39:56', '2020-07-07 03:01:21'),
(61, 'NM250100', '25', '17', '2750', '5', 'Chaise Dania luge', '', '1 place', '-Chaise visiteur Dania luge<br />\r\n-Couleur bleu', '2019-10-06 14:43:00', '2020-05-01 21:11:17'),
(63, 'NM250102', '25', '13', '12400', '4', 'Chaise Luxe Visiteur J036', '', '1 place', '-Chaise Visiteur luxe j036<br />\r\n-Couleur ; bleu &noir<br />\r\n-Accoudoir', '2019-10-06 14:52:58', '2020-02-16 03:12:50'),
(64, 'NM240101', '24', '98', '3950', '5', 'Chaise Star 02', '', '1 place', '-Chaise star k02<br />\r\n-Couleur noir/cappuccino<br />\r\n- Avec accoudoir', '2019-10-06 21:19:07', '2020-06-21 07:59:34'),
(65, 'NM250103', '24', '19', '3200', '5', 'Chaise Pliante KPS 1311', '', '1 place', '-Chaise pliante KPC 1311<br />\r\n-Couleur noir<br />\r\n-Chaise visiteur', '2019-10-06 21:22:51', '2020-07-06 16:57:36'),
(66, 'NM2601', '26', '35', '10700', '5', 'Chaise opérateur 613 B', '', '1 PLACE', '-Chaise opérateur 613B<br />\r\n-Avec accoudoir <br />\r\n-Couleur noir', '2019-10-06 21:26:03', '2020-06-27 14:03:36'),
(67, 'NM240102', '24', '30', '10700', '5', 'Chaise Star 2042', '', '1 Place', '-Chaise Star 2042 S<br />\r\n-Mobile<br />\r\n-Couleur noir<br />\r\n-Avec accoudoir', '2019-10-06 21:28:33', '2020-06-15 06:21:57'),
(68, 'NM240103', '24', '212', '15600', '4', 'Chaise ZH 2090 Star', '', '1 place', '-Chaise Star 2090 <br />\r\n-Avec accoudoir<br />\r\n-Mobile<br />\r\n-Couleur noir', '2019-10-06 21:32:45', '2020-06-21 21:00:24'),
(69, 'NM240104', '24', '26', '5600', '5', 'Chaise Star ZH 2406', '', '1 Place', '-Chaise Star 2406<br />\r\n-Avec accoudoir<br />\r\n-Couleur noir<br />\r\n-Mobile', '2019-10-06 21:38:11', '2020-07-08 22:18:41'),
(70, 'NM240105', '24', '10', '15800', '5', 'Chaise Star 2616', '', '1 Place', '-Chaise Star 2616<br />\r\n-Avec accoudoir<br />\r\n-Mobile<br />\r\n-Couleur noir', '2019-10-06 21:46:35', '2020-06-15 04:11:22'),
(71, 'NM240106', '24', '36', '12900', '5', 'Chaise Star 2618', '', '1 place', '-Chaise Star 2618<br /><br />\r\n-Couleur noir<br /><br />\r\n-Avec accoudoir<br /><br />\r\n-Mobile', '2019-10-06 21:53:36', '2020-07-04 07:19:06'),
(72, 'NM240107', '24', '19', '8000', '5', 'Chaise StarZH  5010', '', '1 place', '-Chaise Star 5010<br />\r\n-Mobile<br />\r\n-Avec accoudoir<br />\r\n-Couleur noir', '2019-10-06 21:56:24', '2020-07-04 13:20:54'),
(73, 'NM240108', '24', '4', '11800', '5', 'Chaise Star opérateur AK111', '', '1 Place', '-Chaise Star opérateur AK111<br />\r\n-Avec accoudoir<br />\r\n-Couleur noir<br />\r\n-Mobile', '2019-10-07 07:51:40', '2019-10-13 04:00:04'),
(74, 'NM260100', '26', '25', '7900', '5', 'Chaise Opérateur GTB 8365', '', '1 place', '-Chaise opérateur GTB 8365<br />\r\n-Avec accoudoir<br />\r\n-Mobile<br />\r\n-Couleur noir', '2019-10-07 07:56:07', '2020-06-04 13:19:02'),
(75, 'NM260101', '26', '366', '85000', '5', 'Chaise Opérateur F60S', '', '1 place', '-Chaise opérateur f60s<br />\r\n-Mobile<br />\r\n-Avec accoudoir<br />\r\n-Couleur noir<br />\r\n-Complet Cuire', '2019-10-07 08:00:55', '2020-07-06 16:31:15'),
(76, 'NM2701', '27', '14', '15800', '5', 'Chaise coiffeuse EX 919', '', '1 place', '-Chaise coiffeuse EX919<br />\r\n-Couleur rouge<br />\r\n-Confortable', '2019-10-07 08:04:34', '2020-07-10 21:39:30'),
(77, 'NM240109', '24', '11', '10700', '5', 'Chaise Star 2044', '', '1 place', '-Chaise Star 2044<br />\r\n-Avec accoudoir<br />\r\n-Mobile <br />\r\n-Couleur noir', '2019-10-07 08:11:53', '2020-06-09 10:45:09'),
(78, 'NM2801', '28', '406', '6700', '5', 'Fauteuil chauffeuse mono place', '', '1 Place', '-fauteuil mono place<br />\r\n-Confortable<br />\r\n-Couleur bleu', '2019-10-07 08:14:59', '2020-07-10 14:12:09'),
(79, 'NM1201', '12', '128', '27000', '5', 'Comptoir SALAM MDF', '', 'L 1.22 m/ h 1.06 m', '-Comptoir de réception<br />\r\n-Touts les couleurs sont disponibles<br />\r\n-mix MDF & mélaminé', '2019-10-07 13:45:45', '2020-07-07 14:45:59'),
(80, 'NM2901', '29', '105', '18000', '5', 'Table WORK', '', '1.14m / 0.75', '-Table ronde<br />\r\n-Couleur teck blanc + mélaminé gris', '2019-10-07 14:28:19', '2020-07-07 14:46:00'),
(81, 'NM1301', '13', '15', '11200', '5', 'Table basse SHY', '', '0.60m / 0.60 m', '-Table basse SHY<br />\r\n-Couleur (teck fance-acajou)', '2019-10-07 14:53:14', '2020-07-09 00:39:00'),
(82, 'NM130100', '13', '342', '8500', '5', 'Table basse SAM', '', '0.60m / 0.60 m', '-Table basse SAM<br />\r\n-Couleur teak blanc + mélaminé gris<br />\r\n-Couleur panama marron gloss + mélaminé gris', '2019-10-07 15:04:49', '2020-07-07 22:37:32'),
(83, 'NM030119', '5', '519', '29500', '4', 'Bureau Futura 1.40', '', '1.40m / 0.70m', '- Bureau futura 1.40m<br />\r\n- Avec caisson (mélaminé+MDF)<br />\r\n- Bureau MDF + Metalique<br />\r\n - 50% MDF Couleur creme uni', '2019-10-09 23:48:40', '2020-07-08 14:46:50'),
(84, 'NM050106', '5', '215', '43000', '5', 'Bureau futura 1.60 m', '', '1.60m / 0.70', '- Bureau futura 1.60m<br />\r\n- Avec caisson & Retour (mélaminé+MDF)<br />\r\n- Bureau MDF + Metalique<br />\r\n- 50% MDF Couleur creme uni', '2019-10-12 17:11:10', '2020-07-09 03:53:01'),
(90, 'NM250101', '25', '14', '6800', '5', 'Chaise visiteur 2408', '', '1 place', '-Chaise visiteur 2408<br />\r\n-Mobile<br />\r\n-Avec accoudoir en bois<br />\r\n-Couleur noir', '2019-10-21 08:31:19', '2020-07-02 15:08:17'),
(91, 'NM260102', '26', '25', '10900', '5', 'Chaise luge 079 C', '', '1 Place', '-Chaise operateur 079<br />\r\n-Fixe<br />\r\n-Avec accoudoir<br />\r\n-Couleur noir', '2019-10-22 10:36:27', '2020-07-02 15:09:56'),
(92, 'NM3001', '30', '108', '7500', '5', 'Chaise a BAR KH016', '', '1 Place', '-Chaise a BAR KH 016<br />\r\n-Fixe<br />\r\n-Pivotent', '2019-10-22 10:43:30', '2020-07-07 14:43:01'),
(93, 'NM300100', '30', '7', '8500', '5', 'Chaise a BAR KH 1013', '', '1 Place', '-Chaise a BAR KH 1013<br />\r\n-Fixe<br />\r\n-Pivotent<br />\r\n-Réglable en hauteur', '2019-10-22 10:45:36', '2020-04-03 13:29:01'),
(94, 'NM300101', '30', '10', '8200', '5', 'Chaise a BAR KH 1032', '', '1 Place', 'Chaise a BAR KH1032<br />\r\n-Fixe<br />\r\n-Pivotent<br />\r\n-Couleur noir<br />\r\n-Réglable en hauteur', '2019-10-22 10:47:38', '2020-07-10 11:45:52'),
(95, 'NM260103', '26', '89', '14200', '5', 'Chaise opérateurs b616', '', '1 place', '-Chaise operateur B616<br />\r\n-Mobile<br />\r\n-Avec accoudoir<br />\r\n-Couleur noir', '2019-10-22 10:50:12', '2020-07-07 14:48:50'),
(96, 'NM260104', '24', '100', '12200', '5', 'Chaise opérateur b811', '', '1 place', '-Chaise operateur b 811<br />\r\n-Mobile<br />\r\n-Avec accoudoir<br />\r\n-Couleur noir', '2019-10-22 10:52:48', '2020-07-07 14:46:00'),
(97, 'NM260105', '26', '109', '12500', '5', 'Chaise operateur 079', '', '1 place', '-Chaise operateur 079<br />\r\n-mobile<br />\r\n-Avec accoudoir<br />\r\n-Couleur noir', '2019-10-22 10:55:13', '2020-07-07 14:45:58'),
(98, 'NM1101', '11', '145', '49500', '5', 'Salon s015', '', '1 Place / 3 place', '-Salon s015<br />\r\n-fauteuil 3 places + 1 place<br />\r\n-Couleur noir', '2019-10-22 10:58:16', '2020-07-07 14:45:59'),
(99, 'NM250104', '25', '259', '14300', '5', 'CHAISE 022A', '', '1 PLACE', '-Chaise 022 A<br />\r\n-1 Place<br />\r\n-Noir<br />\r\n-Mobile<br />\r\n-pieds chromée', '2019-12-15 13:45:38', '2020-07-09 21:04:48'),
(100, 'NM250105', '24', '340', '12200', '5', 'CHAISE 022C', '', '1 place', '-Chaise 022c<br />\r\n-Fixe<br />\r\n-Pieds chromée', '2019-12-15 13:49:13', '2020-07-09 21:05:38'),
(101, 'NM250106', '24', '169', '14200', '5', 'CHAISE 087A', '', '1 place', '-Chaise 087A<br />\r\n- 1 Place<br />\r\n-Mobile<br />\r\n-Noir avec pieds chromée', '2019-12-15 14:03:28', '2020-07-09 21:05:41'),
(102, 'NM250107', '25', '331', '10900', '5', 'CHAISE 087C', '', '1 Place', '-Chaise 087C<br />\r\n-Fixe<br />\r\n-Noir avec pied chromée', '2019-12-15 14:19:42', '2020-07-09 21:04:23'),
(103, 'NM300102', '30', '212', '8500', '5', 'CHAISE KH1030', '', '1 Place', '-Chaise a bar kh1030<br />\r\n-Pivotent<br />\r\n-Noir avec pied chromée', '2019-12-16 09:01:23', '2020-07-08 17:46:04'),
(104, 'NM300103', '30', '138', '7400', '5', 'CHAISE KH073', '', '1 Place', '-Chaise kh073<br />\r\n-pivotent<br />\r\n-Noir avec pied chromée<br />\r\n-fixe', '2019-12-16 09:08:35', '2020-07-07 11:45:36'),
(105, 'NM130101', '13', '178', '13200', '5', 'TABLE BASSE ROMA', '', '120x60', '-TABLE BASSE ROMA<br />\r\n-100% MDF<br />\r\n-COULEUR ACAJOU', '2019-12-18 12:48:11', '2020-07-07 22:37:06'),
(106, 'NM2401', '24', '73', '38800', '4', 'CHAISE PDG HZ 8029', '', '1 Place', '- CHAISE POUR PDG<br />\r\n- TRÈS BONNE QUALITÉ<br />\r\n- PIVOTENT<br />\r\n- MOBILE', '2020-02-04 09:30:29', '2020-07-07 22:39:19'),
(107, 'NM240110', '24', '108', '30800', '4', 'CHAISE PDG 8007', '', '1 Place', '- CHAISE POUR PDG<br />\r\n- TRÈS BONNE QUALITÉ<br />\r\n- MOBILE<br />\r\n- PIVOTENT', '2020-02-04 09:34:20', '2020-07-07 14:43:03'),
(108, 'NM240111', '24', '4', '15800', '4', 'CHAISE STAR HZ 2616', '', '1 Place', '- CHAISE POUR PDG<br />\r\n- TRÈS BONNE QUALITÉ<br />\r\n- MOBILE<br />\r\n- PIVOTENT', '2020-02-04 09:42:25', '2020-06-12 22:53:26'),
(109, 'NM260106', '26', '150', '7900', '4', 'CHAISE OPERATEUR 1204', '', '1 Place', '- CHAISE OPÉRATEUR<br />\r\n- MOBILE<br />\r\n- PIVOTENT', '2020-02-04 09:47:06', '2020-07-07 14:43:03'),
(110, 'NM260107', '26', '176', '26800', '4', 'CHAISE OPÉRATEUR ST 2617', '', '1 Place', '- CHAISE OPÉRATEUR<br />\r\n- MOBILE<br />\r\n- PIVOTENT<br />\r\n- POUR GAMERS', '2020-02-04 10:19:24', '2020-07-09 21:06:39'),
(111, 'NM240112', '24', '162', '13500', '5', 'CHAISE STAR HZ 2043', '', '1 place', '- CHAISE STAR<br />\r\n- TRÈS BONNE QUALITÉ<br />\r\n- MOBILE<br />\r\n- PIVOTENT', '2020-02-04 10:21:37', '2020-07-07 14:43:03'),
(112, 'NM250108', '25', '167', '11200', '5', 'CHAISE VISITEUR C811', '', '1 place', '-  CHAISE VISITEUR<br />\r\n-  CONFORTABLE<br />\r\n-  FIXE', '2020-02-04 10:38:13', '2020-07-07 14:43:02'),
(2, '267', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '268', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '269', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '270', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '271', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '272', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '273', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '274', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '276', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '278', '2019-10-09 15:37:01', '2019-10-09 15:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 'Armoire & Rangement Métallique', 'Bibliotheque Mobilier ecoles creches', '2019-09-30 06:43:19', '2019-09-30 06:43:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Armoires', 'Meuble de Bureau', '2019-09-30 12:30:22', '2019-09-30 12:30:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Bureaux de directions', 'Meuble de Bureau', '2019-09-30 12:36:44', '2019-09-30 12:36:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Siège de Réunion', 'Mobilier de Réunion', '2019-09-30 12:37:08', '2019-09-30 12:37:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Bureaux de  Opérateurs', 'Meuble de Bureau', '2019-09-30 12:37:49', '2019-09-30 12:37:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Workstation', 'Meuble de Bureau', '2019-09-30 12:38:32', '2019-09-30 12:38:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Tables de Conférences et Réunions', 'Mobilier de Réunion', '2019-09-30 12:40:11', '2019-09-30 12:40:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Tables de Réunions modulaires', 'Mobilier de Réunion', '2019-09-30 12:41:12', '2019-09-30 12:45:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Tables de Réunions et Travail', 'Mobilier de Réunion', '2019-09-30 12:41:49', '2019-09-30 12:46:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Banquettes de Réception', 'Mobilier Accueil', '2019-09-30 12:43:02', '2019-09-30 12:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Canapés et Fauteuils', 'Mobilier Accueil', '2019-09-30 12:43:52', '2019-09-30 12:43:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Comptoirs de Réception', 'Mobilier Accueil', '2019-09-30 12:47:52', '2019-09-30 12:47:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Tables basses', 'Mobilier Accueil', '2019-09-30 12:49:10', '2019-09-30 12:49:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Chaises Amphithéâtre', 'Meuble de Bureau', '2019-09-30 12:50:21', '2019-09-30 12:51:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Fauteuils Auditorium', 'Mobilier de Conférence', '2019-09-30 12:52:51', '2019-09-30 12:52:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Pupitres Orateurs', 'Mobilier de Conférence', '2019-09-30 12:53:43', '2019-09-30 12:53:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Mobiliers pour crèches', 'Bibliotheque Mobilier ecoles creches', '2019-09-30 12:55:51', '2019-09-30 12:55:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Rayonnages Mobiles', 'Bibliotheque Mobilier ecoles creches', '2019-09-30 13:06:28', '2019-09-30 13:06:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Rayonnages Métallique', 'Bibliotheque Mobilier ecoles creches', '2019-09-30 13:07:34', '2019-09-30 13:07:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Chaises Star', 'Chaises', '2019-10-06 13:35:43', '2019-10-06 13:35:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Chaises visiteurs', 'Chaises', '2019-10-06 13:36:52', '2019-10-06 13:36:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Chaises operateurs', 'Chaises', '2019-10-06 13:37:20', '2019-10-06 13:37:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Chaises coiffeuse', 'Chaises', '2019-10-06 13:38:03', '2019-10-06 13:38:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Chaises chaufeuse', 'Chaises', '2019-10-06 13:38:39', '2019-10-06 13:38:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Tables', 'Meuble de Bureau', '2019-10-07 14:20:47', '2019-10-07 14:20:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Chaise BAR', 'Chaises', '2019-10-17 12:03:13', '2019-10-17 12:03:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 'Adel', 'adelbouhraoua23@gmail.com', '', '$2y$10$2iZOkpfD1CtKlzn3kwiLe.VTo/KdQ7dGzQGytTOXj0kyjkwZd/MkO', '', '2019-09-29 19:41:48', '2019-09-29 19:41:48', NULL, NULL, NULL, NULL),
(2, 'Rafik', 'rafik@newmoboffice.com', '', '$2y$10$t3GLnhXMConPZ7GnV3D9juskqScbb4MNgPrl75w0HkTkpYR15ZIy.', 'cZCinY3oFTqNBzgWB2bADEjrAsXC1V3qYNE89fi9tAZl1A7DGGWe06J2u6rn', '2019-09-29 19:44:04', '2019-10-24 09:09:48', NULL, NULL, NULL, NULL),
(3, 'bouzouidja', 'mehdibouzouidja@gmail.com', '', '$2y$10$vEMLC50tbngXDGTXxNedYenmXq7HVelFWRRc3neKWtUCe/rRMgrlG', '', '2019-10-09 18:18:42', '2019-10-09 18:18:42', NULL, NULL, NULL, NULL),
(4, 'yakoub', 'yakoub.benmeradi@gmail.com', '', '$2y$10$yoMRl/5OXj6YrNojP9RziOWf.8E/VpziAhne8pIybqInT7Q7xwaNC', '', '2019-10-11 06:28:19', '2019-10-11 06:28:19', NULL, NULL, NULL, NULL),
(5, 'Sadouki', 'sadoukiibrahim4200@gmail.com', '', '$2y$10$xM5kDwrv6rTk/1zxvL7CBO8yxnrPLexJPlGb6LZLFbEibqaN.Xy1e', '', '2020-02-11 18:49:56', '2020-02-11 18:49:56', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_user_id_unique` (`user_id`),
  ADD KEY `admins_user_id_index` (`user_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_user_id_index` (`user_id`);

--
-- Indexes for table `client_pros`
--
ALTER TABLE `client_pros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_pros_registrecommerce_unique` (`registreCommerce`);

--
-- Indexes for table `collection_product`
--
ALTER TABLE `collection_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colors_reference_unique` (`reference`),
  ADD UNIQUE KEY `colors_name_unique` (`name`),
  ADD UNIQUE KEY `colors_image_id_unique` (`image_id`);

--
-- Indexes for table `color_image`
--
ALTER TABLE `color_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_product`
--
ALTER TABLE `color_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_product`
--
ALTER TABLE `image_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_reference_unique` (`reference`),
  ADD UNIQUE KEY `products_name_unique` (`name`);

--
-- Indexes for table `retailers`
--
ALTER TABLE `retailers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `retailers_client_id_unique` (`client_id`),
  ADD UNIQUE KEY `retailers_registrecommerce_unique` (`registreCommerce`),
  ADD KEY `retailers_client_id_index` (`client_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `types_name_unique` (`Name`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client_pros`
--
ALTER TABLE `client_pros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collection_product`
--
ALTER TABLE `collection_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `color_image`
--
ALTER TABLE `color_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `color_product`
--
ALTER TABLE `color_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=548;

--
-- AUTO_INCREMENT for table `image_product`
--
ALTER TABLE `image_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=515;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `retailers`
--
ALTER TABLE `retailers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
