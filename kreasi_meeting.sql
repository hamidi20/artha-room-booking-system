-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2024 at 02:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kreasi_meeting`
--

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `id` int(4) NOT NULL,
  `jam` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id`, `jam`) VALUES
(1, '08:00'),
(2, '08:30'),
(3, '09:00'),
(4, '09:30'),
(5, '10:00'),
(6, '10:30'),
(7, '11:00'),
(8, '11:30'),
(9, '12:00'),
(10, '12.30'),
(11, '13:00'),
(12, '13:30'),
(13, '14:00'),
(14, '14:30'),
(15, '15:00'),
(16, '15:30'),
(17, '16:00'),
(18, '16:30'),
(19, '17:00');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id` int(11) NOT NULL,
  `nama_ruangan` varchar(30) NOT NULL,
  `kapasitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id`, `nama_ruangan`, `kapasitas`) VALUES
(10, 'People', 20),
(11, 'Process', 6),
(12, 'Technology', 6);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `nama` varchar(30) NOT NULL,
  `departemen` varchar(100) NOT NULL,
  `mulai` varchar(100) NOT NULL,
  `selesai` varchar(100) NOT NULL,
  `ruangan` int(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  `keterangan` varchar(200) NOT NULL,
  `iduser` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal`, `nama`, `departemen`, `mulai`, `selesai`, `ruangan`, `status`, `keterangan`, `iduser`) VALUES
('TR-00008', '2023-11-30', 'Hamidi', '', '15:00', '17:00', 10, 'Pending', 'Data Governance Meeting', 8),
('TR-00010', '2023-11-29', 'rahmana,dwi, dan ripal', '', '16:00', '17:00', 12, 'Pending', 'daily', 7),
('TR-00011', '2023-12-07', 'Rahmana', '', '13:00', '15:00', 10, 'Pending', 'Weekly Report', 7),
('TR-00012', '2023-12-07', 'Syaddad', '', '16:00', '16:30', 10, 'Pending', 'ckjasdhs', 7),
('TR-00013', '2023-12-06', 'tes', '', '10:30', '11:00', 10, 'Pending', 'cek', 7),
('TR-00014', '2023-12-08', 'aru', '', '12.30', '15:00', 10, 'Pending', 'tes', 10),
('TR-00016', '2023-12-15', 'tes', '', '15:00', '15:30', 10, 'Pending', 'tes', 7),
('TR-00017', '2023-12-31', 'hamidi', '', '15:00', '16:30', 11, 'Pending', 'tes', 2),
('TR-00018', '2023-12-12', 'Westly', '', '13:00', '17:00', 10, 'Pending', 'Day 1 - Sharing Knowledge TDC for PT Pegadaian', 7),
('TR-00019', '2023-12-13', 'Westly', '', '13:00', '17:00', 10, 'Pending', 'Day 2 - Sharing Knowledge TDC for PT Pegadaian', 7),
('TR-00020', '2023-12-18', 'Test', '', '11:00', '11:30', 10, 'Pending', 'Gabuts', 7),
('TR-00021', '2023-12-28', 'aruu', '', '11:00', '12.30', 10, 'Pending', 'tes', 10),
('TR-00022', '2024-01-18', 'Hamidi', '', '13:30', '14:30', 11, 'Pending', 'Data Preparation internal', 8),
('TR-00024', '2024-02-02', 'Solugenix Training', '', '09:00', '17:00', 12, 'Pending', 'Batch 5 Training', 40),
('TR-00025', '2024-02-05', 'TRAINING SGX', '', '09:00', '17:00', 10, 'Pending', 'For SGX Training', 43),
('TR-00026', '2024-02-05', 'Inggrit', '', '09:00', '10:00', 12, 'Pending', 'Sales & Marketing meeting', 27),
('TR-00027', '2024-02-05', 'Handra', '', '10:00', '17:00', 11, 'Pending', 'Belajar', 22);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `hak_akses` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_user`, `hak_akses`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'admin', 'admin'),
(2, 'user', '6ad14ba9986e3615423dfca256d04e3f', 'user', 'user'),
(8, 'hamidi', '7c6c2eff341044dde7b05ecc4b5f9bf4', 'Hamidi', 'user'),
(9, 'maura', '2b4a2a3f6de8966d4a7934ad9b109b58', 'Maura Cannisa', 'admin'),
(10, 'aru', 'e95f77c464f303a7a830b98c145a0711', 'Amroe Bagas Witjaksana', 'user'),
(11, 'bayu', '310a447f66406c046e6c9b54d31a9ab3', 'Sapta Bayu Segara', 'user'),
(12, 'fajar', '24bc50d85ad8fa9cda686145cf1f8aca', 'Fajar Abdillah', 'user'),
(13, 'geraard', '55eca5eda793b5035c69e0ea3bc9b593', 'Gerard Jonathan Raffles', 'user'),
(14, 'anton', '784742a66a3a0c271feced5b149ff8db', 'Anthonious Bramantyo Wicaksono', 'user'),
(15, 'syaddad', 'df117544dbfe7a799ec9b0a58cfa00db', 'Muhammad Sulthan Syaddad', 'user'),
(16, 'dwi', '7aa2602c588c05a93baf10128861aeb9', 'Dwi Setyo Adi Sutrisno', 'user'),
(17, 'arief', '0ff6c3ace16359e41e37d40b8301d67f', 'Fitrahadi Arief', 'user'),
(18, 'rahmana', 'a4ab95f259dd216ad941235aa3fe4d2c', 'Rahmana Dwi Shaputra', 'user'),
(19, 'ripal', '894ee31b2d3075aa85f346d5627e1382', 'Ripal', 'user'),
(20, 'ghani', '3802e72efd3f12809164e522b918b251', 'Ghani Hibatullah Santoso', 'user'),
(21, 'andi', 'ce0e5bf55e4f71749eade7a8b95c4e46', 'Noviandi', 'user'),
(22, 'handra', 'fefe09edfeaa7950aa975d82583f0ea0', 'Handra Hilman Yunus', 'user'),
(23, 'haikal', 'a847b53f9999fc735ca2b6f1419c93d0', 'Mohammad Haikal Ramadan', 'user'),
(24, 'fathimah', '10ae33e944db33033c683ac1077c3408', 'Fathimah Nur Azizah', 'user'),
(25, 'sherina', '686af532d0d64b93863aef4c9ae5660c', 'Farah Sherina Salma', 'user'),
(26, 'dimas', '7d49e40f4b3d8f68c19406a58303f826', 'Kristinus Dimas Arie Bowo', 'user'),
(27, 'inggrit', '2521ecec6f607d89e5da41a4ddd7c477', 'Inggrit Hutapea', 'user'),
(28, 'ida', '7f78f270e3e1129faf118ed92fdf54db', 'Ida Suryani', 'user'),
(29, 'toni', 'aefe34008e63f1eb205dc4c4b8322253', 'Toni Hutomo Putro', 'user'),
(30, 'toto', 'f71dbe52628a3f83a77ab494817525c6', 'Hartarto', 'user'),
(31, 'nikke', '32de6fe3da78b08604426718ee837ef3', 'Nikke Priscilla', 'user'),
(32, 'dony', '77ee6d05b23e742e2aca3fd602f4c599', 'Dony Prasetyo', 'user'),
(33, 'westly', 'd269229914e0fb0496228d7cbff898e1', 'Westly Tanbri', 'user'),
(34, 'ferry', '46171b077997b166bb30cf5494eff2f8', 'Ferry Renaldy Atmanagara', 'user'),
(35, 'daniel', 'aa47f8215c6f30a0dcdb2a36a9f4168e', 'Daniel Elison Daya', 'user'),
(36, 'dodi', 'dc82a0e0107a31ba5d137a47ab09a26b', 'Dodi Y. Soewandi', 'user'),
(37, 'kiki', '0d61130a6dd5eea85c2c5facfe1c15a7', 'Kiki Meila Sari', 'user'),
(38, 'patrick', '6c84cbd30cf9350a990bad2bcc1bec5f', 'Patrick Soe', 'user'),
(39, 'michael', '0acf4539a14b3aa27deeb4cbdf6e989f', 'Michael Leonardo Karl', 'user'),
(40, 'maurauser', 'b79fdab2bc29ea8b38cfb369d1145072', 'Maura Cannisa', 'user'),
(41, 'ramdani', 'd466b19c76d86965501e24954150759c', 'Muhammad Ramdani', 'user'),
(42, 'srikar', '99b564a0c06dc1aa1e2525a68259f003', 'Srikar Perala', 'user'),
(43, 'oki', 'e210b2d4726eb89e951f1952be84c02f', 'Oki Ady Atmaja', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
