-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2021 at 12:31 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbparkir`
--

-- --------------------------------------------------------

--
-- Table structure for table `jeniskendaraan`
--

CREATE TABLE `jeniskendaraan` (
  `jenis_id` int(10) NOT NULL,
  `jeniskendaraan` varchar(150) NOT NULL,
  `status` enum('on','off') NOT NULL,
  `bayar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jeniskendaraan`
--

INSERT INTO `jeniskendaraan` (`jenis_id`, `jeniskendaraan`, `status`, `bayar`) VALUES
(1, 'Motor', 'on', 2000),
(2, 'Mobil', 'on', 4000);

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_parkir` int(10) NOT NULL,
  `jenis_id` int(10) NOT NULL,
  `nama_pelanggan` varchar(250) NOT NULL,
  `nomor_polisi` varchar(250) NOT NULL,
  `waktu_masuk` datetime NOT NULL,
  `waktu_keluar` datetime NOT NULL,
  `harga` int(10) NOT NULL,
  `keterangan` enum('Masuk','Keluar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id_parkir`, `jenis_id`, `nama_pelanggan`, `nomor_polisi`, `waktu_masuk`, `waktu_keluar`, `harga`, `keterangan`) VALUES
(92, 2, '', 'm 2929 y', '2021-11-02 11:18:28', '2021-11-02 11:50:10', 4000, 'Keluar'),
(93, 1, '', 'b 1717 g', '2021-11-02 11:18:50', '2021-11-02 11:19:00', 2000, 'Keluar'),
(94, 1, '', 'galih', '2021-11-02 11:54:48', '2021-11-15 10:28:58', 622000, 'Keluar'),
(95, 2, '', 'galih', '2021-11-04 11:23:14', '2021-11-16 11:49:22', 1156000, 'Keluar'),
(96, 2, '', 'sulis laily', '2021-11-04 11:23:27', '2021-11-04 11:23:40', 4000, 'Keluar'),
(97, 1, '', 'b 13', '2021-11-04 11:40:41', '2021-11-16 11:54:02', 578000, 'Keluar'),
(98, 2, 'galih restu baihaqi', 'm 1212 zt', '2021-11-16 11:47:26', '2021-11-16 11:54:38', 4000, 'Keluar'),
(99, 1, 'laily tri', 'm 6666 yt', '2021-11-16 11:48:39', '2021-11-16 22:17:07', 22000, 'Keluar'),
(100, 1, 'galih restu', 'm 2222 ty', '2021-11-16 21:12:54', '2021-11-17 16:39:12', 40000, 'Keluar'),
(101, 2, 'laily', 'm 2227 gt', '2021-11-16 22:21:48', '2021-11-17 16:38:57', 76000, 'Keluar'),
(102, 2, 'laily', 'g 6565 yt', '2021-11-17 14:30:38', '2021-11-30 06:27:10', 1216000, 'Keluar'),
(103, 2, 'galih restu baihaqiiiiii', 'm ytytytyt ', '2021-11-17 16:29:25', '2021-11-30 06:29:44', 1212000, 'Keluar'),
(104, 2, 'galih restu baihaqi', 'm 1212 yt', '2021-11-30 06:30:57', '0000-00-00 00:00:00', 0, 'Masuk');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `level` varchar(30) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `username` varchar(160) NOT NULL,
  `alamat` varchar(400) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(300) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `level`, `nama`, `username`, `alamat`, `phone`, `password`, `status`) VALUES
(10, 'Admin', 'Administrator', 'admin', 'NY', '089756', 'admin', 'on'),
(11, 'Admin', 'Galih Restu', 'admin', 'MDR', '081939301705', 'galih', 'off');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jeniskendaraan`
--
ALTER TABLE `jeniskendaraan`
  ADD PRIMARY KEY (`jenis_id`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_parkir`),
  ADD KEY `kategori_id` (`jenis_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jeniskendaraan`
--
ALTER TABLE `jeniskendaraan`
  MODIFY `jenis_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id_parkir` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`jenis_id`) REFERENCES `jeniskendaraan` (`jenis_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
