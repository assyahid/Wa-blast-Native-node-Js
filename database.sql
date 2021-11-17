-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2021 at 01:31 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wav4`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `api_key` varchar(100) NOT NULL,
  `level` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 = ADMIN\r\n2 = CS',
  `chunk` int(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `api_key`, `level`, `chunk`) VALUES
(7, 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '68172c4edaca837ea3c2ff948a57ccc28c9db3a8', '1', 67),
(94, 'dsd', '9a6747fc6259aa374ab4e1bb03074b6ec672cf99', '3aa23f9a7e12b709668509a0fdcfaee4c37db97b', '1', 60);

-- --------------------------------------------------------

--
-- Table structure for table `all_contacts`
--

CREATE TABLE `all_contacts` (
  `id` int(11) NOT NULL,
  `sender` varchar(111) NOT NULL,
  `number` varchar(111) NOT NULL,
  `name` varchar(111) NOT NULL,
  `type` enum('Personal','Group') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `autoreply`
--

CREATE TABLE `autoreply` (
  `id` int(11) NOT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 NOT NULL,
  `response` varchar(255) CHARACTER SET utf8 NOT NULL,
  `media` text DEFAULT NULL,
  `nomor` varchar(15) NOT NULL DEFAULT '0',
  `make_by` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `sender` varchar(111) NOT NULL,
  `number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Personal','Group','','') NOT NULL,
  `make_by` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `pemilik` varchar(111) NOT NULL,
  `nomor` varchar(14) NOT NULL,
  `link_webhook` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nomor`
--

CREATE TABLE `nomor` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nomor` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `make_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `nomor` varchar(255) NOT NULL,
  `pesan` text CHARACTER SET utf8 NOT NULL,
  `media` varchar(255) DEFAULT NULL,
  `status` enum('MENUNGGU JADWAL','GAGAL','TERKIRIM') NOT NULL DEFAULT 'MENUNGGU JADWAL',
  `jadwal` datetime NOT NULL,
  `make_by` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receive_chat`
--

CREATE TABLE `receive_chat` (
  `id` int(11) NOT NULL,
  `id_pesan` varchar(200) NOT NULL,
  `nomor` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `from_me` enum('0','1') NOT NULL DEFAULT '0',
  `nomor_saya` varchar(255) DEFAULT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_contacts`
--
ALTER TABLE `all_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `autoreply`
--
ALTER TABLE `autoreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nomor`
--
ALTER TABLE `nomor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receive_chat`
--
ALTER TABLE `receive_chat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `all_contacts`
--
ALTER TABLE `all_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `autoreply`
--
ALTER TABLE `autoreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1733;

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `nomor`
--
ALTER TABLE `nomor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `receive_chat`
--
ALTER TABLE `receive_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
