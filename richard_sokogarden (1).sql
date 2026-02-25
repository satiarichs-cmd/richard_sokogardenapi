-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 25, 2026 at 12:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `richard_sokogarden`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_description` text NOT NULL,
  `product_cost` int(50) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `product_description`, `product_cost`, `product_category`, `product_image`) VALUES
(1, 'oppo F11', '16gb ram 128gb storage black android 12', 20000, 'electronics', 'oppo f11.jpeg'),
(5, 'vivo y04', 'storage 128gb ram 4+4gb green', 15000, 'electronic', 'vivo.jpeg'),
(6, 'ps4', 'storage 528gb ram 4+4gb black', 250000, 'electronic', 'ps.avif'),
(7, 'oppo a3x', 'storage 128gb ram 4+4gb black', 20000, 'electronic', 'a3x.jpeg'),
(8, 'oppo reno 12 pro', 'storage 128gb ram 4+4gb black', 40000, 'electronic', 'reno12.jpeg'),
(9, 'opp0 a60 pro', 'storage 256gb ram 6+4gb black', 40000, 'electronic', 'opooa60.jpeg'),
(10, 'camon 40', 'storage 256gb ram 6gb black', 35000, 'electronic', 'camon.avif'),
(11, 'samsung a16', 'storage 256gb ram 6+4gb black', 15000, 'electronic', 'a16.avif'),
(12, 'samsung s25', 'storage 256gb ram 6gb black', 150000, 'electronic', 's25.avif'),
(13, 'vivo v40', 'storage 64gb ram 4gb black', 150000, 'electronic', 'vi 40.jpeg'),
(14, 'vivo v29', 'storage 128gb ram 6+4gb black', 15000, 'electronic', 'vivo v29.jpeg'),
(15, 'vivo v21', 'storage 128gb ram 6+4gb black', 15000, 'electronic', 'vivo y21.jpeg'),
(16, 'vivo v19', 'storage 128gb ram 6gb black', 15000, 'electronic', 'vivi v19.jpeg'),
(17, 'vivo v60', 'storage 256gb ram 6gb black', 25000, 'electronic', 'vv60.jpeg'),
(18, 'vivo v50 ', 'storage 256gb ram 6+4gb black', 20000, 'electronic', 'v50.jpeg'),
(19, 'vivo v50 lite', 'storage 256gb ram 6gb black', 22000, 'electronic', 'v50.jpeg'),
(20, 'oppo a3s', 'storage  64gb ram 4gb black', 22000, 'electronic', 'v50.jpeg'),
(21, 'oppo renno 8', 'storage  64gb ram 4gb black', 22000, 'electronic', 'renno 8.jpeg'),
(22, 'oppo renno 7', 'storage  64gb ram 4gb black', 22000, 'electronic', 'renno 7.jpeg'),
(23, 'oppo renno 12', 'storage  128gb ram 6+4gb black', 25000, 'electronic', 'reno12.jpeg'),
(24, 'oppo renno 11', 'storage  128gb ram 6+4gb black', 25000, 'electronic', 'renno 11.jpeg'),
(25, 'oppo renno 10', 'storage  128gb ram 6gb black', 24000, 'electronic', 'renno 11.jpeg'),
(26, 'oppo renno 9', 'storage  128gb ram 6gb black', 24000, 'electronic', 'renno 11.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `phone`, `password`) VALUES
(2, 'satia', 'satiarichs@gmail.com', '0116453445', 'esko'),
(7, 'bundi1', 'sasatiarichs@gmail.com', '0104401612', 'esko');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
