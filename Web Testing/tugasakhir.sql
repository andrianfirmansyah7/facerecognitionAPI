-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2023 at 10:20 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasakhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('170833716db6');

-- --------------------------------------------------------

--
-- Table structure for table `pemilih`
--

CREATE TABLE `pemilih` (
  `id` bigint(20) NOT NULL,
  `tps` bigint(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `foto_ktp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemilih`
--

INSERT INTO `pemilih` (`id`, `tps`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `foto_ktp`) VALUES
(1, 1, 'Andrian Firmansyah', 'L', '2000-07-09', 'A1.jpg'),
(2, 1, 'Muhammad Ramadhan Kurniawan', 'L', '2001-02-01', 'B1.jpg'),
(3, 2, 'Hanif Muflihul Anwar', 'L', '2001-08-12', 'I1.jpg'),
(4, 2, 'Taufiq Maulana Firdaus', 'L', '2000-08-06', 'J1.jpg'),
(5, 1, 'Arif Raihan Alaudin', 'L', '2001-08-09', 'C1.jpg'),
(6, 2, 'Muhammad Fabio Virgiansyah', 'L', '2000-08-06', 'D1.jpg'),
(7, 1, 'Tengku Ferdiansyah Kurniawan', 'L', '2001-06-03', 'E1.jpg'),
(8, 2, 'Muhammad Hafizh', 'L', '2001-11-12', 'F1.jpg'),
(9, 1, 'Ilham Bagus Sugiarto', 'L', '2001-08-06', 'G1.jpg'),
(10, 1, 'Rd.Khalid Jati Junjunan Septian Budy Putra', 'L', '2001-12-09', 'H1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tps`
--

CREATE TABLE `tps` (
  `id` bigint(20) NOT NULL,
  `no_tps` varchar(5) NOT NULL,
  `alamat` varchar(230) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tps`
--

INSERT INTO `tps` (`id`, `no_tps`, `alamat`) VALUES
(1, '12', 'Jl. Kencana'),
(2, '11', 'Jl. Krakatau');

-- --------------------------------------------------------

--
-- Table structure for table `verifikasi`
--

CREATE TABLE `verifikasi` (
  `id_verifikasi` bigint(20) NOT NULL,
  `pemilih` int(11) NOT NULL,
  `waktu_verifikasi` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `evidence` varchar(100) NOT NULL,
  `tps` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verifikasi`
--

INSERT INTO `verifikasi` (`id_verifikasi`, `pemilih`, `waktu_verifikasi`, `status`, `evidence`, `tps`) VALUES
(3, 1, '2023-01-16 08:42:23', '1', 'A2.jpg', 1),
(4, 2, '2023-01-16 08:43:26', '1', 'B2.jpg', 1),
(5, 1, '2023-01-16 08:44:37', '1', 'A2.jpg', 1),
(6, 1, '2023-01-16 08:44:51', '1', 'A2.jpg', 1),
(7, 2, '2023-01-16 08:45:11', '1', 'B2.jpg', 1),
(8, 2, '2023-01-16 08:45:24', '1', 'B2.jpg', 1),
(9, 1, '2023-01-16 08:57:51', '1', 'A2.jpg', 1),
(10, 1, '2023-01-16 08:58:07', '1', 'A2.jpg', 1),
(11, 1, '2023-01-16 08:58:20', '1', 'A2.jpg', 1),
(12, 4, '2023-01-16 09:00:29', '1', 'J2.jpg', 2),
(13, 4, '2023-01-16 09:00:47', '1', 'J2.jpg', 2),
(14, 5, '2023-01-16 09:01:55', '1', 'C2.jpg', 1),
(15, 5, '2023-01-16 09:02:04', '1', 'C2.jpg', 1),
(16, 7, '2023-01-16 09:03:37', '1', 'E2.jpg', 1),
(17, 7, '2023-01-16 09:03:49', '1', 'E2.jpg', 1),
(18, 10, '2023-01-16 09:07:10', '1', 'H2.jpg', 1),
(19, 10, '2023-01-16 09:07:23', '1', 'H2.jpg', 1),
(20, 8, '2023-01-16 09:21:39', '1', 'F2.jpg', 2),
(21, 8, '2023-01-16 09:21:56', '1', 'F2.jpg', 2),
(22, 3, '2023-01-17 08:59:48', '1', '63c65ecd7fa39.jpg', 2),
(23, 3, '2023-01-17 09:01:44', '1', '63c65f36bdf0c.jpg', 2),
(24, 3, '2023-01-17 09:02:29', '1', '63c65f8927887.jpg', 2),
(25, 2, '2023-01-17 09:03:28', '1', '63c660b696d6a.jpg', 1),
(26, 2, '2023-01-17 09:03:51', '1', '63c660eee2cf8.jpg', 1),
(27, 2, '2023-01-17 09:04:15', '1', '63c66022a29f3.jpg', 1),
(28, 4, '2023-01-17 09:05:01', '1', '63c661ac6dbc7.jpg', 2),
(29, 4, '2023-01-17 09:05:59', '1', '63c661814ce45.jpg', 2),
(30, 4, '2023-01-17 09:06:46', '1', '63c6604b817a7.jpg', 2),
(31, 1, '2023-01-17 09:08:45', '1', '63c6610b0ebc6.jpg', 1),
(32, 1, '2023-01-17 09:09:34', '1', '63c6611d2b9dd.jpg', 1),
(33, 1, '2023-01-17 09:10:21', '1', '63c660825e52f.jpg', 1),
(34, 1, '2023-01-17 09:11:04', '1', '63c6611d2b9dd.jpg', 1),
(35, 1, '2023-01-17 09:12:08', '1', '63c6611d2b9dd.jpg', 1),
(36, 1, '2023-01-17 09:12:26', '1', '63c6611d2b9dd.jpg', 1),
(37, 1, '2023-01-17 09:12:58', '1', '63c6611d2b9dd.jpg', 1),
(38, 1, '2023-01-17 09:14:21', '1', '63c6610b0ebc6.jpg', 1),
(39, 1, '2023-01-17 09:15:19', '1', '63c660825e52f.jpg', 1),
(40, 4, '2023-01-17 09:16:12', '1', '63c661814ce45.jpg', 2),
(41, 4, '2023-01-17 09:16:36', '1', '63c661ac6dbc7.jpg', 2),
(42, 4, '2023-01-17 09:17:07', '1', '63c6604b817a7.jpg', 2),
(43, 2, '2023-01-17 09:17:36', '1', '63c660eee2cf8.jpg', 1),
(44, 2, '2023-01-17 09:17:56', '1', '63c660b696d6a.jpg', 1),
(45, 2, '2023-01-17 09:18:32', '1', '63c66022a29f3.jpg', 1),
(46, 3, '2023-01-17 09:18:56', '1', '63c65ecd7fa39.jpg', 2),
(47, 3, '2023-01-17 09:19:19', '1', '63c65f36bdf0c.jpg', 2),
(48, 3, '2023-01-17 09:19:53', '1', '63c65f8927887.jpg', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `pemilih`
--
ALTER TABLE `pemilih`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tps` (`tps`);

--
-- Indexes for table `tps`
--
ALTER TABLE `tps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifikasi`
--
ALTER TABLE `verifikasi`
  ADD PRIMARY KEY (`id_verifikasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemilih`
--
ALTER TABLE `pemilih`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tps`
--
ALTER TABLE `tps`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `verifikasi`
--
ALTER TABLE `verifikasi`
  MODIFY `id_verifikasi` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemilih`
--
ALTER TABLE `pemilih`
  ADD CONSTRAINT `pemilih_ibfk_1` FOREIGN KEY (`tps`) REFERENCES `tps` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
