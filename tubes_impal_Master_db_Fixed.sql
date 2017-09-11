-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2017 at 06:51 AM
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
  `id_soal` varchar(11) NOT NULL,
  `pathfile` varchar(500) DEFAULT NULL,
  `tgl_input` date NOT NULL,
  `tgl_update` date DEFAULT NULL
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
  `fak_prod` varchar(32) NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `tgl_lahir`, `alamat`, `password`, `kontak`, `email`, `fak_prod`, `kelas`) VALUES
(1601144783, 'Cintya Dwi Hastuti', '1996-09-12', 'Jl. Riau', '123', '+6282240865421', 'email@email.com', 'FIK/S1 Desain Komunikasi Visua', 'MM-38-F');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_matkul` varchar(6) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `pathfile` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
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
  `id_soal` varchar(11) NOT NULL,
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
  `id_soal` varchar(11) NOT NULL,
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
  ADD PRIMARY KEY (`id_soal`),
  ADD UNIQUE KEY `id_soal_UNIQUE` (`id_soal`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nid`),
  ADD UNIQUE KEY `NID_UNIQUE` (`nid`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim_idx` (`nim`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD UNIQUE KEY `nim_UNIQUE` (`nim`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_matkul`),
  ADD UNIQUE KEY `kode_matkul_UNIQUE` (`kode_matkul`);

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
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
