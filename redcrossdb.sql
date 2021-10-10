-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2021 at 11:09 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redcrossdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `address`) VALUES
(1, 'Sasanka Vitharana', 'sasa@gmail.com', 'balangoda'),
(2, 'Sachini Ishara', 'sachi@gmail.com', 'rathnapura'),
(3, 'Kamal Kavishka', 'kamal@gmail.com', 'kandy'),
(4, 'Samitha Michel', 'samitha@gmail.com', 'madampe');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_all`
--

CREATE TABLE `inventory_all` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `shop` varchar(30) NOT NULL,
  `date` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_all`
--

INSERT INTO `inventory_all` (`id`, `name`, `shop`, `date`, `quantity`, `user`, `total`) VALUES
(4, 'ppekit', 'Cayoka', '2021-10-01', 10, 'sasanka', 8500),
(5, 'mask', 'Saman stores', '2021-07-15', 1000, 'kamal', 8000),
(6, 'gloves', 'MediCare Pharmacy', '2021-09-17', 150, 'sachini', 7500),
(7, 'sanitizer', 'Nawaloka', '2021-08-27', 50, 'kamal', 12500),
(8, 'jackets', 'Nawaloka', '2021-08-24', 50, 'sasanka', 125000),
(9, 'caps', 'Saman stores', '2021-07-08', 25, 'kamal', 6250),
(13, 'dress', 'Thilakawardhana', '2021-10-20', 10, 'kamal', 12500),
(14, 'dress', 'Thilakawardhana', '2021-10-26', 10, 'sasanka', 12500),
(15, 'soap', 'saman stores', '2021-10-01', 50, 'sachini', 2500),
(16, 'ppekit', 'Nawaloka', '2021-08-18', 150, 'Sasanka Vitharana', 127500),
(21, 'gloves', 'Ceyoka', '2021-09-16', 10, 'Sasanka Vitharana', 500);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_item`
--

CREATE TABLE `inventory_item` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_item`
--

INSERT INTO `inventory_item` (`id`, `name`, `quantity`, `unit`, `total`) VALUES
(1, 'mask', 400, 8, 3200),
(2, 'gloves', 160, 50, 8000),
(3, 'sanitizer', 60, 250, 15000),
(4, 'ppekit', 110, 850, 93500),
(5, 'jackets', 50, 2500, 125000),
(6, 'caps', 25, 250, 6250),
(7, 'soap', 50, 50, 2500),
(8, 'dress', 20, 1250, 25000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_all`
--
ALTER TABLE `inventory_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_item`
--
ALTER TABLE `inventory_item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory_all`
--
ALTER TABLE `inventory_all`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `inventory_item`
--
ALTER TABLE `inventory_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
