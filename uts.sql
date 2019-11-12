-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 12 Nov 2019 pada 01.41
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_mhs`
--

CREATE TABLE `data_mhs` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama_mahasiswa` varchar(100) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_mhs`
--

INSERT INTO `data_mhs` (`id`, `nim`, `nama_mahasiswa`, `prodi`, `jk`, `alamat`, `hp`) VALUES
(3, '161240000578', 'muhammad sadam husyein awami syahrul akbar', 'TIF', 'Laki-Laki', 'bangsri', '081244774500');

--
-- Trigger `data_mhs`
--
DELIMITER $$
CREATE TRIGGER `ubah_hp` BEFORE UPDATE ON `data_mhs` FOR EACH ROW BEGIN INSERT INTO tbl_ubah_hp
SET nim = old.nim,
hp_baru = new.hp,
hp_lama = old.hp,
tgl_ubah = now();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `lihat_db`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `lihat_db` (
`id` int(11)
,`nim` varchar(20)
,`nama_mahasiswa` varchar(100)
,`prodi` varchar(50)
,`jk` varchar(10)
,`alamat` varchar(150)
,`hp` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_ubah_hp`
--

CREATE TABLE `tbl_ubah_hp` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `hp_lama` varchar(30) NOT NULL,
  `hp_baru` varchar(30) NOT NULL,
  `tgl_ubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_ubah_hp`
--

INSERT INTO `tbl_ubah_hp` (`id`, `nim`, `hp_lama`, `hp_baru`, `tgl_ubah`) VALUES
(2, '161240000578', '089530444248', '081244774500', '2019-11-11 23:43:17');

-- --------------------------------------------------------

--
-- Struktur untuk view `lihat_db`
--
DROP TABLE IF EXISTS `lihat_db`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lihat_db`  AS  (select `data_mhs`.`id` AS `id`,`data_mhs`.`nim` AS `nim`,`data_mhs`.`nama_mahasiswa` AS `nama_mahasiswa`,`data_mhs`.`prodi` AS `prodi`,`data_mhs`.`jk` AS `jk`,`data_mhs`.`alamat` AS `alamat`,`data_mhs`.`hp` AS `hp` from `data_mhs`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_mhs`
--
ALTER TABLE `data_mhs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ubah_hp`
--
ALTER TABLE `tbl_ubah_hp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_mhs`
--
ALTER TABLE `data_mhs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_ubah_hp`
--
ALTER TABLE `tbl_ubah_hp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
