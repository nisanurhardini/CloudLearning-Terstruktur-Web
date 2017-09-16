-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2017 at 01:38 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes_impal`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_soal`
--

CREATE TABLE `bank_soal` (
  `id_soal` int(11) NOT NULL,
  `soal_quiz` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nid` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `password` varchar(16) NOT NULL,
  `kode_dosen` varchar(3) NOT NULL,
  `kontak` varchar(14) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nid`, `nama`, `tgl_lahir`, `alamat`, `password`, `kode_dosen`, `kontak`, `email`) VALUES
(12345, '1234', '2017-09-16', '1234', '123', 'asd', '9768263', 'test@test.com'),
(99812732, 'HRD', '2017-09-12', 'Jln. Kaki', '123', 'HRD', '628732194832', 'Dosen@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fak` int(11) NOT NULL,
  `kode_fakultas` varchar(3) NOT NULL,
  `nama_fakultas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id_fak`, `kode_fakultas`, `nama_fakultas`) VALUES
(1, 'FIF', 'S1 Teknik Informatika'),
(2, 'FIF', 'S1 Ilmu Komputasi'),
(3, 'FIK', 'S1 Desain Komunikasi Visual');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `id` int(11) NOT NULL,
  `pathfile` varchar(500) DEFAULT NULL,
  `tgl_input` date NOT NULL,
  `tgl_update` date DEFAULT NULL,
  `nim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jwb_quiz`
--

CREATE TABLE `jwb_quiz` (
  `id_jwb` int(11) NOT NULL,
  `jawaban` varchar(45) NOT NULL,
  `id_soal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kelas_id` int(11) NOT NULL,
  `nama_kelas` varchar(10) NOT NULL,
  `id_fak` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kelas_id`, `nama_kelas`, `id_fak`) VALUES
(1, 'IF-39-12', 1),
(2, 'IK-39-12', 2),
(3, 'MM-38-F', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `password` varchar(16) NOT NULL,
  `kontak` varchar(14) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fak_prodi` varchar(32) NOT NULL,
  `kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `tgl_lahir`, `alamat`, `password`, `kontak`, `email`, `fak_prodi`, `kelas`) VALUES
(1301154138, 'Harude', '1995-12-17', 'Bandung', '123', '6282240865443', 'Harude@HRD.com', 'FIF/S1 Teknik Informatika', 1),
(1601144783, 'Cintya', '2017-09-12', 'Jl. Bebas', '123', '6282240865400', 'hardiyan.gunawan@gmail.com', 'FIK/S1 Desain Komunikasi Visual', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id_matkul` int(11) NOT NULL,
  `kode_matkul` varchar(6) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `nama_materi` varchar(50) NOT NULL,
  `pathfile` varchar(500) DEFAULT NULL,
  `tgl_input` date NOT NULL,
  `tgl_update` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id_matkul`, `kode_matkul`, `nama_matkul`, `nama_materi`, `pathfile`, `tgl_input`, `tgl_update`) VALUES
(8, 'CH52S1', 'Struktur Data', 'Single Linked List', 'dbfile/Tubes Impal.mwb.bak', '2017-09-16', NULL),
(9, 'CH32I2', 'Probabilitas Statistika', 'Probabilitas', 'dbfile/Tubes_impal_Master_db_Fixed_V2.4.sql', '2017-09-16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `nilai` double NOT NULL,
  `tgl_input` date NOT NULL,
  `tgl_update` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rajar`
--

CREATE TABLE `rajar` (
  `nid` int(11) NOT NULL,
  `kode_matkul` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rambil`
--

CREATE TABLE `rambil` (
  `nim` int(11) NOT NULL,
  `kode_matkul` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rcocok`
--

CREATE TABLE `rcocok` (
  `id_soal` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `nid` int(11) NOT NULL,
  `kode_matkul` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rmemberi`
--

CREATE TABLE `rmemberi` (
  `nomor` int(11) NOT NULL,
  `nid` int(11) NOT NULL,
  `kode_matkul` varchar(6) NOT NULL,
  `id_nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rmembuat`
--

CREATE TABLE `rmembuat` (
  `nid` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `nama_set` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rmemiliki`
--

CREATE TABLE `rmemiliki` (
  `id_set` int(11) NOT NULL,
  `id_nilai` int(11) NOT NULL,
  `nim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_soal`
--
ALTER TABLE `bank_soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nid`),
  ADD UNIQUE KEY `NID_UNIQUE` (`nid`),
  ADD UNIQUE KEY `kode_dosen` (`kode_dosen`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fak`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim_idx` (`nim`);

--
-- Indexes for table `jwb_quiz`
--
ALTER TABLE `jwb_quiz`
  ADD PRIMARY KEY (`id_jwb`),
  ADD KEY `FK_id_soal_jwb_quiz_idx` (`id_soal`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kelas_id`),
  ADD KEY `kode_fakultas_idx` (`id_fak`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD UNIQUE KEY `nim_UNIQUE` (`nim`),
  ADD KEY `FK_kelas_mahasiswa_idx` (`kelas`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id_matkul`),
  ADD KEY `kode_matkul` (`kode_matkul`) USING BTREE;

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `rajar`
--
ALTER TABLE `rajar`
  ADD KEY `nid_idx` (`nid`),
  ADD KEY `kode_matkul_idx` (`kode_matkul`);

--
-- Indexes for table `rambil`
--
ALTER TABLE `rambil`
  ADD KEY `nim_idx` (`nim`),
  ADD KEY `kode_matkul_idx` (`kode_matkul`);

--
-- Indexes for table `rcocok`
--
ALTER TABLE `rcocok`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `id_soal_idx` (`id_soal`),
  ADD KEY `id_idx` (`id`),
  ADD KEY `nid_idx` (`nid`),
  ADD KEY `kode_matkul_idx` (`kode_matkul`);

--
-- Indexes for table `rmemberi`
--
ALTER TABLE `rmemberi`
  ADD PRIMARY KEY (`nomor`),
  ADD KEY `nid_idx` (`nid`),
  ADD KEY `kode_matkul_idx` (`kode_matkul`),
  ADD KEY `id_nilai_idx` (`id_nilai`);

--
-- Indexes for table `rmembuat`
--
ALTER TABLE `rmembuat`
  ADD KEY `nid_idx` (`nid`),
  ADD KEY `id_soal_idx` (`id_soal`);

--
-- Indexes for table `rmemiliki`
--
ALTER TABLE `rmemiliki`
  ADD PRIMARY KEY (`id_set`),
  ADD KEY `id_nilai_idx` (`id_nilai`),
  ADD KEY `nim_idx` (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_soal`
--
ALTER TABLE `bank_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jwb_quiz`
--
ALTER TABLE `jwb_quiz`
  MODIFY `id_jwb` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `kelas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rmemberi`
--
ALTER TABLE `rmemberi`
  MODIFY `nomor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rmemiliki`
--
ALTER TABLE `rmemiliki`
  MODIFY `id_set` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD CONSTRAINT `FK_nim_jawab` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON UPDATE CASCADE;

--
-- Constraints for table `jwb_quiz`
--
ALTER TABLE `jwb_quiz`
  ADD CONSTRAINT `FK_id_soal_jwb_quiz` FOREIGN KEY (`id_soal`) REFERENCES `bank_soal` (`id_soal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `FK_id_fak_kelas` FOREIGN KEY (`id_fak`) REFERENCES `fakultas` (`id_fak`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `FK_kelas_mahasiswa` FOREIGN KEY (`kelas`) REFERENCES `kelas` (`kelas_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rajar`
--
ALTER TABLE `rajar`
  ADD CONSTRAINT `FK_kode_matkul_ajar` FOREIGN KEY (`kode_matkul`) REFERENCES `mata_kuliah` (`kode_matkul`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_nid_ajar` FOREIGN KEY (`nid`) REFERENCES `dosen` (`nid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rambil`
--
ALTER TABLE `rambil`
  ADD CONSTRAINT `FK_kode_matkul_ambil` FOREIGN KEY (`kode_matkul`) REFERENCES `mata_kuliah` (`kode_matkul`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_nim_ambil` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rcocok`
--
ALTER TABLE `rcocok`
  ADD CONSTRAINT `FK_id_cocok` FOREIGN KEY (`id`) REFERENCES `jawaban` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_id_soal_cocok` FOREIGN KEY (`id_soal`) REFERENCES `bank_soal` (`id_soal`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_kode_matkul_cocok` FOREIGN KEY (`kode_matkul`) REFERENCES `rajar` (`kode_matkul`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_nid_cocok` FOREIGN KEY (`nid`) REFERENCES `rajar` (`nid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rmemberi`
--
ALTER TABLE `rmemberi`
  ADD CONSTRAINT `FK_id_nilai_beri` FOREIGN KEY (`id_nilai`) REFERENCES `nilai` (`id_nilai`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_kode_matkul_beri` FOREIGN KEY (`kode_matkul`) REFERENCES `rajar` (`kode_matkul`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_nid_beri` FOREIGN KEY (`nid`) REFERENCES `rajar` (`nid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rmembuat`
--
ALTER TABLE `rmembuat`
  ADD CONSTRAINT `FK_id_soal_buat` FOREIGN KEY (`id_soal`) REFERENCES `bank_soal` (`id_soal`),
  ADD CONSTRAINT `FK_nid_buat` FOREIGN KEY (`nid`) REFERENCES `dosen` (`nid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rmemiliki`
--
ALTER TABLE `rmemiliki`
  ADD CONSTRAINT `FK_id_nilai_milik` FOREIGN KEY (`id_nilai`) REFERENCES `nilai` (`id_nilai`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_nim_milik` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
