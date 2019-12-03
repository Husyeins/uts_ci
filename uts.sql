-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03 Des 2019 pada 06.36
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
(3, '161240000578', 'muhammad sadam husyein awami syahrul akbar', 'TIF', 'Laki-Laki', 'bangsri', '081244774500'),
(4, '161240000579', 'AFNAN ISTIKMAL', 'TEKNIK INFORMATIKA', 'Laki-Laki', 'BANGSRI RW.5 RT.1', '085225212213'),
(5, '161240000587', 'NUR AHMAD MUTANNASIK', 'TEKNIK INFORMATIKA', 'Laki-Laki', 'MAYONG RW.1 RT.11', '085740337342'),
(6, '161240000583', 'HENI MUNDJAYATI', 'TEKNIK INFORMATIKA', 'Laki-Laki', 'MURIA LOBO RT.2 RW.7 NALUMSARI', '082221509054'),
(7, '161240000490', 'RIZKY EFENDI', 'TEKNIK INFORMATIKA', 'Laki-Laki', 'NGELING RT.2 RW.3 PECANGAAN JEPARA', '085855332937'),
(8, '161240000495', 'MUHAMMAD ABDUL AZIZ', 'TEKNIK INFORMATIKA', 'Laki-Laki', 'SINANGGUL RT.6 RW.1', '08778006200'),
(9, '161240000910', 'DEWI AFIFAH', 'TEKNIK INFORMATIKA', 'Laki-Laki', 'SIGEBUK RT.12 RW.2', '089530444248'),
(10, '161240000541', 'IRVANDI MAULANA', 'TEKNIK INFORMATIKA', 'Laki-Laki', 'SEKURO RT.3 RW.7 KEC.MLONGGO', '081223444234'),
(11, '161240000491', 'INI SEBAGAI CONTOH', 'TEKNIK INFORMATIKA', 'Perempuan', 'Bangsri', '081215805333'),
(12, '161240000579', 'M SAKTI ABABIL', 'TEKNIK INFORMATIKA', 'Laki-Laki', 'BAPANGAN RT.2 RW.3', '081221345232'),
(13, '161240000584', 'AZAR SALIM', 'TEKNIK INFORMATIKA', 'Laki-Laki', 'PAMATAN', '08898861334');

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
(2, '161240000578', '089530444248', '081244774500', '2019-11-11 23:43:17'),
(3, '161240000579', '085225212212', '085225212213', '2019-12-03 12:20:26');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_ubah_hp`
--
ALTER TABLE `tbl_ubah_hp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
