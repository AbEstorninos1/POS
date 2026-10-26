-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2026 at 08:28 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 8.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `POS`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(4, 'Electrical'),
(5, 'Fasteners'),
(1, 'Hand Tools'),
(2, 'Paint & Supplies'),
(3, 'Plumbing'),
(7, 'Power Tools'),
(8, 'PPE'),
(6, 'Woodworking');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `stock`, `barcode`, `image`, `created_at`) VALUES
(13, 5, 'Common Nails 2\" (per kg)', 95.00, 68713, '4800010000134', 'assets/images/products/475e293267678503.png', '2026-10-22 13:23:43'),
(17, 1, 'Screw Driver', 0.00, 0, NULL, 'assets/images/products/229973e10b29f73d.jpg', '2026-10-22 13:44:35'),
(18, 3, 'Steel Pipe 3\' (per pc)', 690.00, 62, '2990683972948', 'assets/images/products/901f3aae069743bb.jpg', '2026-10-24 05:39:00'),
(19, 6, 'Circular Saw Blade', 2500.00, 80, '2990625180646', 'assets/images/products/79b117b77a3d0cd6.jpg', '2026-10-24 05:51:20'),
(20, 7, 'Angle Grinder', 4990.00, 25, '2772836152809', 'assets/images/products/93b0d89a190968d8.jpg', '2026-10-24 05:54:32'),
(21, 7, 'Power Drill', 1490.00, 68, '2992802537908', 'assets/images/products/1f3e85fd5fe16a39.jpg', '2026-10-24 05:56:23'),
(22, 2, 'Paint (1 Pint)', 0.00, 0, NULL, 'assets/images/products/e3b4500aebee5b5f.jpg', '2026-10-24 05:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `name`, `price`, `stock`, `barcode`, `image`) VALUES
(11, 17, 'Flat head', 98.00, 19900, '2281099838912', 'assets/images/products/f11db9bc6a5b1e30.jpg'),
(13, 22, 'Blue Paint', 2490.00, 5, '2442005978454', 'assets/images/products/ff16b6c08de3c0b9.jpg'),
(14, 22, 'Pink Paint', 2390.00, 6, '2211945775641', 'assets/images/products/75ae415befa3ee40.jpg'),
(15, 22, 'Paint Thinner', 579.00, 10, '1926389117377', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `receipt_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `change_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `status` enum('Completed','Voided') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Completed',
  `refunded_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `receipt_no`, `user_id`, `total`, `paid`, `change_amount`, `payment_method`, `status`, `refunded_amount`, `created_at`) VALUES
(1, 'OR-00001', NULL, 1775.00, 1900.00, 125.00, 'Cash', 'Completed', 0.00, '2026-10-14 03:27:43'),
(2, 'OR-00002', NULL, 300.00, 300.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-14 11:55:43'),
(3, 'OR-00003', NULL, 2140.00, 2200.00, 60.00, 'Cash', 'Completed', 0.00, '2026-10-14 03:27:43'),
(4, 'OR-00004', NULL, 105.00, 105.00, 0.00, 'GCash', 'Completed', 0.00, '2026-10-15 12:33:43'),
(5, 'OR-00005', NULL, 910.00, 910.00, 0.00, 'GCash', 'Completed', 0.00, '2026-10-15 10:56:43'),
(6, 'OR-00006', NULL, 70.00, 100.00, 30.00, 'Cash', 'Voided', 0.00, '2026-10-15 03:28:43'),
(7, 'OR-00007', NULL, 410.00, 500.00, 90.00, 'Cash', 'Completed', 0.00, '2026-10-16 04:55:43'),
(8, 'OR-00008', NULL, 535.00, 600.00, 65.00, 'Cash', 'Completed', 0.00, '2026-10-16 12:00:43'),
(9, 'OR-00009', NULL, 1650.00, 1700.00, 50.00, 'Cash', 'Completed', 0.00, '2026-10-16 11:23:43'),
(10, 'OR-00010', NULL, 1485.00, 1600.00, 115.00, 'Cash', 'Completed', 0.00, '2026-10-17 07:25:43'),
(11, 'OR-00011', NULL, 2120.00, 2400.00, 280.00, 'Cash', 'Completed', 0.00, '2026-10-17 08:32:43'),
(12, 'OR-00012', NULL, 1425.00, 1500.00, 75.00, 'Cash', 'Completed', 0.00, '2026-10-17 08:29:43'),
(13, 'OR-00013', NULL, 515.00, 515.00, 0.00, 'GCash', 'Completed', 275.00, '2026-10-18 12:01:43'),
(14, 'OR-00014', NULL, 950.00, 1200.00, 250.00, 'Cash', 'Completed', 0.00, '2026-10-18 04:00:43'),
(15, 'OR-00015', NULL, 1005.00, 1100.00, 95.00, 'Cash', 'Completed', 0.00, '2026-10-18 10:49:43'),
(16, 'OR-00016', NULL, 655.00, 800.00, 145.00, 'Cash', 'Completed', 0.00, '2026-10-19 08:35:43'),
(17, 'OR-00017', NULL, 640.00, 800.00, 160.00, 'Cash', 'Completed', 0.00, '2026-10-19 11:15:43'),
(18, 'OR-00018', NULL, 125.00, 125.00, 0.00, 'GCash', 'Completed', 0.00, '2026-10-19 06:36:43'),
(19, 'OR-00019', NULL, 630.00, 900.00, 270.00, 'Cash', 'Completed', 630.00, '2026-10-20 10:37:43'),
(20, 'OR-00020', NULL, 95.00, 100.00, 5.00, 'Cash', 'Completed', 0.00, '2026-10-20 03:43:43'),
(21, 'OR-00021', NULL, 545.00, 600.00, 55.00, 'Cash', 'Completed', 0.00, '2026-10-20 06:58:43'),
(22, 'OR-00022', NULL, 265.00, 265.00, 0.00, 'GCash', 'Completed', 265.00, '2026-10-21 11:18:43'),
(23, 'OR-00023', NULL, 130.00, 130.00, 0.00, 'GCash', 'Completed', 0.00, '2026-10-21 05:08:43'),
(24, 'OR-00024', NULL, 2195.00, 2195.00, 0.00, 'GCash', 'Completed', 2195.00, '2026-10-21 10:38:43'),
(25, 'OR-00025', NULL, 795.00, 800.00, 5.00, 'Cash', 'Completed', 795.00, '2026-10-22 10:22:43'),
(26, 'OR-00026', NULL, 285.00, 300.00, 15.00, 'Cash', 'Completed', 285.00, '2026-10-22 10:20:43'),
(27, 'OR-00027', NULL, 1135.00, 1200.00, 65.00, 'Cash', 'Completed', 1135.00, '2026-10-22 10:42:43'),
(28, 'OR-00028', NULL, 160.00, 400.00, 240.00, 'Cash', 'Completed', 160.00, '2026-10-22 11:47:43'),
(29, '20261022-8540', NULL, 6400.00, 6400.00, 0.00, 'Cash', 'Completed', 6400.00, '2026-10-22 14:11:42'),
(30, '20261022-9020', NULL, 4750.00, 4750.00, 0.00, 'Cash', 'Completed', 4750.00, '2026-10-22 14:23:29'),
(31, '20261022-0709', NULL, 4900.00, 4900.00, 0.00, 'Cash', 'Completed', 4900.00, '2026-10-22 14:23:40'),
(32, '20261022-9496', NULL, 7200.00, 7200.00, 0.00, 'Cash', 'Completed', 7200.00, '2026-10-22 14:32:27'),
(33, '20261022-9295', NULL, 16800.00, 16800.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-22 14:47:52'),
(34, '20261022-6535', NULL, 14630.00, 14630.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-22 14:47:59'),
(35, '20261022-8052', NULL, 95000.00, 95000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-22 16:35:05'),
(36, '20261022-0317', NULL, 72000.00, 72000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-22 16:35:13'),
(37, '20261022-4250', NULL, 16000.00, 16000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-22 18:05:48'),
(38, '20261023-4658', NULL, 80000.00, 80000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 01:34:44'),
(39, '20261023-3443', NULL, 4750000.00, 4750000.00, 0.00, 'Cash', 'Completed', 4750000.00, '2026-10-23 01:36:21'),
(40, '20261023-3370', NULL, 80000.00, 80000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 01:37:07'),
(41, '20261023-6229', NULL, 4750000.00, 4750000.00, 0.00, 'Cash', 'Completed', 4750000.00, '2026-10-23 01:38:25'),
(42, '20261023-0113', NULL, 525000.00, 525000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 01:44:36'),
(43, '20261023-3635', NULL, 720000.00, 720000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 03:13:54'),
(44, '20261023-2868', NULL, 85500.00, 85500.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 03:34:33'),
(45, '20261023-6804', NULL, 8000.00, 8000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 03:37:35'),
(46, '20261023-1154', NULL, 8000.00, 8000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 03:39:27'),
(47, '20261023-3719', NULL, 8000.00, 8000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 04:57:43'),
(48, '20261023-2170', NULL, 24000.00, 24000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 05:10:47'),
(49, '20261023-4538', 8, 80000.00, 80000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 10:46:26'),
(50, '20261023-7435', 8, 95000.00, 95000.00, 0.00, 'Cash', 'Completed', 95000.00, '2026-10-23 10:47:51'),
(51, '20261023-3577', NULL, 4080.00, 5000.00, 920.00, 'Cash', 'Completed', 0.00, '2026-10-23 13:46:52'),
(52, '20261023-1206', NULL, 4000.00, 5000.00, 1000.00, 'Cash', 'Completed', 0.00, '2026-10-23 14:05:32'),
(53, '20261023-8739', 12, 80.00, 80.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 21:43:13'),
(54, '20261023-8441', 12, 240.00, 240.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 21:43:44'),
(55, '20261023-9920', 12, 95000.00, 95000.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 21:46:25'),
(56, '20261023-0736', 12, 17500.00, 17500.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 21:46:39'),
(57, '20261023-8888', 12, 940500.00, 940500.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 21:58:33'),
(58, '20261023-9551', 12, 150400.00, 150400.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 21:59:28'),
(59, '20261023-8147', 12, 800.00, 800.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-23 21:59:53'),
(60, '20261024-2453', 12, 29513.00, 29513.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-24 01:02:04'),
(61, '20261024-8750', 12, 93868.00, 93868.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-24 02:02:21'),
(62, '20261024-3183', 12, 836000.00, 836000.00, 0.00, 'Cash', 'Completed', 836000.00, '2026-10-24 02:06:20'),
(63, '20261024-5457', 12, 784.00, 784.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-24 03:03:49'),
(64, '20261024-4764', 12, 95.00, 1000.00, 905.00, 'Cash', 'Completed', 0.00, '2026-10-24 04:29:20'),
(65, '20261024-1224', 12, 9800.00, 9800.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-24 04:39:34'),
(66, '20261024-1903', 12, 9500.00, 9500.00, 0.00, 'Cash', 'Completed', 0.00, '2026-10-24 04:39:42'),
(67, '20261024-8931', 16, 7488.00, 7500.00, 12.00, 'Cash', 'Voided', 0.00, '2026-10-24 05:46:42'),
(68, '20261024-9664', 16, 20355.00, 23355.00, 3000.00, 'Cash', 'Completed', 20355.00, '2026-10-24 07:21:27');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `variant_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `variant_id`, `name`, `variant`, `quantity`, `price`) VALUES
(1, 1, NULL, NULL, 'Adjustable Wrench 10\"', NULL, 2, 320.00),
(2, 1, NULL, NULL, 'LED Bulb 9W', NULL, 1, 85.00),
(3, 1, NULL, NULL, 'Screwdriver Set 6pc', NULL, 3, 350.00),
(4, 2, NULL, NULL, 'Concrete Nails (per kg)', NULL, 3, 100.00),
(5, 3, NULL, NULL, 'PVC Pipe 1/2\" x 3m', NULL, 1, 120.00),
(6, 3, NULL, NULL, 'Hand Saw 20\"', NULL, 1, 265.00),
(7, 3, NULL, NULL, 'Kitchen Faucet', NULL, 2, 450.00),
(8, 3, NULL, NULL, 'Claw Hammer 16oz', NULL, 3, 285.00),
(9, 4, NULL, NULL, 'Electrical Wire #14 (per meter)', NULL, 3, 35.00),
(10, 5, NULL, NULL, 'Claw Hammer 16oz', NULL, 3, 285.00),
(11, 5, NULL, NULL, 'Wood Screws (box)', '1 inch', 1, 55.00),
(12, 6, NULL, NULL, 'Electrical Wire #14 (per meter)', NULL, 2, 35.00),
(13, 7, NULL, NULL, 'Paint Brush', '1 inch', 3, 45.00),
(14, 7, NULL, NULL, 'Extension Cord 3m', NULL, 1, 275.00),
(15, 8, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 2, 95.00),
(16, 8, NULL, NULL, 'Teflon Tape', NULL, 3, 25.00),
(17, 8, NULL, NULL, 'Concrete Nails (per kg)', NULL, 2, 100.00),
(18, 8, NULL, NULL, 'Paint Brush', '2 inch', 1, 70.00),
(19, 9, NULL, NULL, 'Kitchen Faucet', NULL, 2, 450.00),
(20, 9, NULL, NULL, 'Concrete Nails (per kg)', NULL, 2, 100.00),
(21, 9, NULL, NULL, 'Extension Cord 3m', NULL, 2, 275.00),
(22, 10, NULL, NULL, 'Adjustable Wrench 10\"', NULL, 4, 320.00),
(23, 10, NULL, NULL, 'PVC Pipe 1/2\" x 3m', NULL, 1, 120.00),
(24, 10, NULL, NULL, 'LED Bulb 9W', NULL, 1, 85.00),
(25, 11, NULL, NULL, 'Electrical Wire #14 (per meter)', NULL, 2, 35.00),
(26, 11, NULL, NULL, 'Screwdriver Set 6pc', NULL, 1, 350.00),
(27, 11, NULL, NULL, 'Latex Paint 1L', 'Blue', 1, 275.00),
(28, 11, NULL, NULL, 'Claw Hammer 16oz', NULL, 5, 285.00),
(29, 12, NULL, NULL, 'Concrete Nails (per kg)', NULL, 5, 100.00),
(30, 12, NULL, NULL, 'Paint Brush', '1 inch', 5, 45.00),
(31, 12, NULL, NULL, 'Screwdriver Set 6pc', NULL, 2, 350.00),
(32, 13, NULL, NULL, 'Extension Cord 3m', NULL, 1, 275.00),
(33, 13, NULL, NULL, 'PVC Pipe 1/2\" x 3m', NULL, 2, 120.00),
(34, 14, NULL, NULL, 'Teflon Tape', NULL, 2, 25.00),
(35, 14, NULL, NULL, 'Kitchen Faucet', NULL, 2, 450.00),
(36, 15, NULL, NULL, 'Extension Cord 3m', NULL, 2, 275.00),
(37, 15, NULL, NULL, 'Paint Brush', '3 inch', 2, 95.00),
(38, 15, NULL, NULL, 'Hand Saw 20\"', NULL, 1, 265.00),
(39, 16, NULL, NULL, 'LED Bulb 9W', NULL, 1, 85.00),
(40, 16, NULL, NULL, 'Claw Hammer 16oz', NULL, 2, 285.00),
(41, 17, NULL, NULL, 'Adjustable Wrench 10\"', NULL, 2, 320.00),
(42, 18, NULL, NULL, 'Teflon Tape', NULL, 5, 25.00),
(43, 19, NULL, NULL, 'PVC Pipe 1/2\" x 3m', NULL, 2, 120.00),
(44, 19, NULL, NULL, 'Teflon Tape', NULL, 5, 25.00),
(45, 19, NULL, NULL, 'Hand Saw 20\"', NULL, 1, 265.00),
(46, 20, NULL, NULL, 'Paint Brush', '3 inch', 1, 95.00),
(47, 21, NULL, NULL, 'Kitchen Faucet', NULL, 1, 450.00),
(48, 21, NULL, NULL, 'Paint Brush', '3 inch', 1, 95.00),
(49, 22, NULL, NULL, 'LED Bulb 9W', NULL, 2, 85.00),
(50, 22, NULL, NULL, 'Paint Brush', '3 inch', 1, 95.00),
(51, 23, NULL, NULL, 'Wood Screws (box)', '1.5 inch', 2, 65.00),
(52, 24, NULL, NULL, 'Screwdriver Set 6pc', NULL, 6, 350.00),
(53, 24, NULL, NULL, 'Paint Brush', '3 inch', 1, 95.00),
(54, 25, NULL, NULL, 'Hand Saw 20\"', NULL, 3, 265.00),
(55, 26, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 3, 95.00),
(56, 27, NULL, NULL, 'Kitchen Faucet', NULL, 2, 450.00),
(57, 27, NULL, NULL, 'Concrete Nails (per kg)', NULL, 1, 100.00),
(58, 27, NULL, NULL, 'Paint Brush', '1 inch', 3, 45.00),
(59, 28, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 1, 95.00),
(60, 28, NULL, NULL, 'Wood Screws (box)', '1.5 inch', 1, 65.00),
(61, 29, 17, NULL, 'Screw Driver', NULL, 80, 80.00),
(62, 30, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 50, 95.00),
(63, 31, NULL, NULL, 'Latex Paint 1L', 'White', 20, 245.00),
(64, 32, 17, NULL, 'Screw Driver', NULL, 90, 80.00),
(65, 33, 17, NULL, 'Screw Driver', NULL, 210, 80.00),
(66, 34, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 154, 95.00),
(67, 35, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 1000, 95.00),
(68, 36, 17, NULL, 'Screw Driver', NULL, 900, 80.00),
(69, 37, 17, NULL, 'Screw Driver', NULL, 200, 80.00),
(70, 38, 17, NULL, 'Screw Driver', NULL, 1000, 80.00),
(71, 39, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 50000, 95.00),
(72, 40, 17, NULL, 'Screw Driver', NULL, 1000, 80.00),
(73, 41, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 50000, 95.00),
(74, 42, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 3000, 95.00),
(75, 42, 17, NULL, 'Screw Driver', NULL, 3000, 80.00),
(76, 43, 17, NULL, 'Screw Driver', NULL, 9000, 80.00),
(77, 44, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 900, 95.00),
(78, 45, 17, NULL, 'Screw Driver', NULL, 100, 80.00),
(79, 46, 17, NULL, 'Screw Driver', NULL, 100, 80.00),
(80, 47, 17, NULL, 'Screw Driver', NULL, 100, 80.00),
(81, 48, 17, NULL, 'Screw Driver', NULL, 300, 80.00),
(82, 49, 17, NULL, 'Screw Driver', NULL, 1000, 80.00),
(83, 50, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 1000, 95.00),
(84, 51, 17, NULL, 'Screw Driver', NULL, 51, 80.00),
(85, 52, 17, NULL, 'Screw Driver', NULL, 50, 80.00),
(86, 53, 17, NULL, 'Screw Driver', NULL, 1, 80.00),
(87, 54, 17, NULL, 'Screw Driver', NULL, 3, 80.00),
(88, 55, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 1000, 95.00),
(89, 56, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 100, 95.00),
(90, 56, 17, NULL, 'Screw Driver', NULL, 100, 80.00),
(91, 57, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 9900, 95.00),
(92, 58, 17, NULL, 'Screw Driver', NULL, 1880, 80.00),
(93, 59, 17, NULL, 'Screw Driver', NULL, 10, 80.00),
(94, 60, 17, 11, 'Screw Driver', 'Philip', 1, 98.00),
(95, 60, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 285, 95.00),
(96, 60, 17, NULL, 'Screw Driver', 'Long nose', 26, 90.00),
(97, 61, 17, NULL, 'Screw Driver', 'Long nose', 81, 90.00),
(98, 61, 17, 11, 'Screw Driver', 'Philip', 11, 98.00),
(99, 61, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 900, 95.00),
(100, 62, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 8800, 95.00),
(101, 63, 17, 11, 'Screw Driver', 'Flat head', 8, 98.00),
(102, 64, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 1, 95.00),
(103, 65, 17, 11, 'Screw Driver', 'Flat head', 100, 98.00),
(104, 66, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 100, 95.00),
(105, 67, 18, NULL, 'Steel Pipe 3\' (per pc)', NULL, 10, 690.00),
(106, 67, 17, 11, 'Screw Driver', 'Flat head', 6, 98.00),
(107, 68, 13, NULL, 'Common Nails 2\" (per kg)', NULL, 67, 95.00),
(108, 68, 21, NULL, 'Power Drill', NULL, 1, 1490.00),
(109, 68, 19, NULL, 'Circular Saw Blade', NULL, 5, 2500.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Admin','Cashier') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cashier',
  `status` enum('Pending','Active','Inactive','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `role`, `status`, `created_at`) VALUES
(8, 'admin', '$2y$12$qJjCn8flfVIj73nJ2KNOFulkZuwxPtewQMqv7WOTvxf8bXcR7xy9G', 'Admin', 'Active', '2026-10-23 03:37:10'),
(12, 'abraham', '$2y$12$hVF6b9Yv.e9kuJyfOpRSheTswZE/sTO.KxiWD5GZerUzREGMRDDv.', 'Cashier', 'Inactive', '2026-10-23 21:30:15'),
(13, 'ebrahgen', '$2y$12$9FcliaqeR6H7lHvDc7MWLOhG.7dPPu.Yyrk5fILRyxt5d8zDNqc0O', 'Admin', 'Active', '2026-10-23 21:32:59'),
(14, 'sean', '$2y$12$G/nt3BOU9TzKOBJPbhPYM.KddAU1b8wHja58HRTjbo26QV3xBmLl.', 'Cashier', 'Active', '2026-10-24 03:19:00'),
(16, 'Lass Moe', '$2y$12$vs5xyB0iaCt3os3vJvQQo.R1RVL/QutpbVHVd7O/QVur9NSJU3Js.', 'Cashier', 'Active', '2026-10-24 05:44:00'),
(17, 'LmaoNoob', '$2y$12$pr7lQaCBI7rrwBf4/7QcYOaiNsTAsIJpfzgICxGU7XnBjbGuCUinW', 'Cashier', 'Active', '2026-10-24 07:11:33'),
(18, 'Third III', '$2y$12$Tlr3Qmf8U0wkpEZSGKJMUusTIl2zH246F7kPzwxdiMbu9bJSpvGFK', 'Cashier', 'Active', '2026-10-24 07:35:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receipt_no` (`receipt_no`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sale_items_ibfk_3` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
