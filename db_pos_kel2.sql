-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 13, 2021 at 07:39 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_kel2`
--

-- --------------------------------------------------------

--
-- Table structure for table `kassa`
--

CREATE TABLE `kassa` (
  `idkassa` int(11) NOT NULL,
  `userkassa` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `pwdkassa` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `jkkassa` enum('L','P') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'L',
  `statuskassa` enum('Y','N') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kassa`
--

INSERT INTO `kassa` (`idkassa`, `userkassa`, `pwdkassa`, `fullname`, `jkkassa`, `statuskassa`) VALUES
(1, 'rudi', 'koplak', 'Rudi Akbar Saragih', 'L', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(3) UNSIGNED ZEROFILL NOT NULL,
  `namakategori` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ketkategori` tinytext COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `ketkategori`) VALUES
(001, 'BAJU', 'Baju Anak'),
(002, 'CELANA', 'Kategori Celana Panjang');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `kodeproduk` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `kategori` int(3) UNSIGNED ZEROFILL NOT NULL,
  `namaproduk` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `hargadasar` double NOT NULL,
  `hargajual` double NOT NULL,
  `stok` int(11) UNSIGNED NOT NULL,
  `stokminimal` tinyint(4) UNSIGNED DEFAULT NULL,
  `noticeproduk` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `statusproduk` enum('Y','N') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `addedproduk` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `kodeproduk`, `kategori`, `namaproduk`, `hargadasar`, `hargajual`, `stok`, `stokminimal`, `noticeproduk`, `statusproduk`, `addedproduk`) VALUES
(1, 'BX001', 001, 'Kemeja Polos', 1000, 1500, 10, NULL, NULL, 'Y', '2021-07-13 16:33:40'),
(3, 'CX001', 002, 'Celana Jeans', 3000, 10000, 6, NULL, NULL, 'Y', '2021-07-13 17:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `idtr` int(11) NOT NULL,
  `faktur` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `produk` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'kodeproduk',
  `nama_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga` double UNSIGNED NOT NULL,
  `harga_dasar` double UNSIGNED NOT NULL COMMENT 'daritbproduk',
  `qty` int(10) UNSIGNED NOT NULL,
  `potongan` double NOT NULL,
  `kassa` int(11) NOT NULL,
  `nama_kassa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `periode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_temp`
--

CREATE TABLE `transaksi_temp` (
  `idtr` int(11) NOT NULL,
  `faktur` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `produk` varchar(10) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'kodeproduk',
  `nama_produk` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `harga` double UNSIGNED NOT NULL,
  `harga_dasar` double UNSIGNED NOT NULL COMMENT 'daritbproduk',
  `qty` int(10) UNSIGNED NOT NULL,
  `potongan` double NOT NULL,
  `kassa` int(11) NOT NULL,
  `nama_kassa` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `periode` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kassa`
--
ALTER TABLE `kassa`
  ADD PRIMARY KEY (`idkassa`),
  ADD UNIQUE KEY `userkassa` (`userkassa`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`),
  ADD UNIQUE KEY `namakategori` (`namakategori`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD UNIQUE KEY `kodeproduk` (`kodeproduk`),
  ADD KEY `kategori` (`kategori`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idtr`),
  ADD KEY `produk` (`produk`),
  ADD KEY `kassa` (`kassa`);

--
-- Indexes for table `transaksi_temp`
--
ALTER TABLE `transaksi_temp`
  ADD PRIMARY KEY (`idtr`),
  ADD KEY `produk` (`produk`),
  ADD KEY `kassa` (`kassa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kassa`
--
ALTER TABLE `kassa`
  MODIFY `idkassa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idtr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi_temp`
--
ALTER TABLE `transaksi_temp`
  MODIFY `idtr` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`idkategori`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`produk`) REFERENCES `produk` (`kodeproduk`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kassa`) REFERENCES `kassa` (`idkassa`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
