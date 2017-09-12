SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `tubes_impal` ;
CREATE SCHEMA IF NOT EXISTS `tubes_impal` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `tubes_impal` ;

-- -----------------------------------------------------
-- Table `tubes_impal`.`fakultas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`fakultas` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`fakultas` (
  `id_fak` INT NOT NULL ,
  `kode_fakultas` VARCHAR(3) NOT NULL ,
  `nama_fakultas` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`id_fak`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tubes_impal`.`kelas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`kelas` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`kelas` (
  `kelas_id` INT NOT NULL AUTO_INCREMENT ,
  `nama_kelas` VARCHAR(10) NOT NULL ,
  `id_fak` INT NOT NULL ,
  PRIMARY KEY (`kelas_id`) ,
  CONSTRAINT `FK_kode_fakultas_kelas`
    FOREIGN KEY (`id_fak` )
    REFERENCES `tubes_impal`.`fakultas` (`id_fak` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `kode_fakultas_idx` ON `tubes_impal`.`kelas` (`id_fak` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`mahasiswa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`mahasiswa` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`mahasiswa` (
  `nim` INT NOT NULL ,
  `nama` VARCHAR(50) NOT NULL ,
  `tgl_lahir` DATE NOT NULL ,
  `alamat` VARCHAR(150) NOT NULL ,
  `password` VARCHAR(16) NOT NULL ,
  `kontak` VARCHAR(14) NOT NULL ,
  `email` VARCHAR(50) NOT NULL ,
  `fak_prodi` VARCHAR(32) NOT NULL ,
  `kelas` INT NOT NULL ,
  PRIMARY KEY (`nim`) ,
  CONSTRAINT `FK_kelas_mahasiswa`
    FOREIGN KEY (`kelas` )
    REFERENCES `tubes_impal`.`kelas` (`kelas_id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `nim_UNIQUE` ON `tubes_impal`.`mahasiswa` (`nim` ASC) ;

CREATE INDEX `FK_kelas_mahasiswa_idx` ON `tubes_impal`.`mahasiswa` (`kelas` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`dosen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`dosen` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`dosen` (
  `nid` INT NOT NULL ,
  `nama` VARCHAR(50) NOT NULL ,
  `tgl_lahir` DATE NOT NULL ,
  `alamat` VARCHAR(150) NOT NULL ,
  `password` VARCHAR(16) NOT NULL ,
  `kode_dosen` VARCHAR(3) NOT NULL ,
  `kontak` VARCHAR(14) NOT NULL ,
  `email` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`nid`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `NID_UNIQUE` ON `tubes_impal`.`dosen` (`nid` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`mata_kuliah`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`mata_kuliah` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`mata_kuliah` (
  `kode_matkul` VARCHAR(6) NOT NULL ,
  `nama_matkul` VARCHAR(50) NOT NULL ,
  `pathfile` VARCHAR(500) NULL ,
  PRIMARY KEY (`kode_matkul`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `kode_matkul_UNIQUE` ON `tubes_impal`.`mata_kuliah` (`kode_matkul` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`bank_soal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`bank_soal` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`bank_soal` (
  `id_soal` VARCHAR(11) NOT NULL ,
  `pathfile` VARCHAR(500) NULL ,
  `tgl_input` DATE NOT NULL ,
  `tgl_update` DATE NULL ,
  PRIMARY KEY (`id_soal`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_soal_UNIQUE` ON `tubes_impal`.`bank_soal` (`id_soal` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`jawaban`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`jawaban` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`jawaban` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `pathfile` VARCHAR(500) NULL ,
  `tgl_input` DATE NOT NULL ,
  `tgl_update` DATE NULL ,
  `nim` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `FK_nim_jawab`
    FOREIGN KEY (`nim` )
    REFERENCES `tubes_impal`.`mahasiswa` (`nim` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `nim_idx` ON `tubes_impal`.`jawaban` (`nim` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`rAmbil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`rAmbil` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`rAmbil` (
  `nim` INT NOT NULL ,
  `kode_matkul` VARCHAR(6) NOT NULL ,
  CONSTRAINT `FK_nim_ambil`
    FOREIGN KEY (`nim` )
    REFERENCES `tubes_impal`.`mahasiswa` (`nim` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_kode_matkul_ambil`
    FOREIGN KEY (`kode_matkul` )
    REFERENCES `tubes_impal`.`mata_kuliah` (`kode_matkul` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `nim_idx` ON `tubes_impal`.`rAmbil` (`nim` ASC) ;

CREATE INDEX `kode_matkul_idx` ON `tubes_impal`.`rAmbil` (`kode_matkul` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`rAjar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`rAjar` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`rAjar` (
  `nid` INT NOT NULL ,
  `kode_matkul` VARCHAR(6) NOT NULL ,
  CONSTRAINT `FK_nid_ajar`
    FOREIGN KEY (`nid` )
    REFERENCES `tubes_impal`.`dosen` (`nid` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_kode_matkul_ajar`
    FOREIGN KEY (`kode_matkul` )
    REFERENCES `tubes_impal`.`mata_kuliah` (`kode_matkul` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `nid_idx` ON `tubes_impal`.`rAjar` (`nid` ASC) ;

CREATE INDEX `kode_matkul_idx` ON `tubes_impal`.`rAjar` (`kode_matkul` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`rMembuat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`rMembuat` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`rMembuat` (
  `nid` INT NOT NULL ,
  `id_soal` VARCHAR(11) NOT NULL ,
  `nama_set` VARCHAR(50) NOT NULL ,
  CONSTRAINT `FK_nid_buat`
    FOREIGN KEY (`nid` )
    REFERENCES `tubes_impal`.`dosen` (`nid` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_soal_buat`
    FOREIGN KEY (`id_soal` )
    REFERENCES `tubes_impal`.`bank_soal` (`id_soal` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

CREATE INDEX `nid_idx` ON `tubes_impal`.`rMembuat` (`nid` ASC) ;

CREATE INDEX `id_soal_idx` ON `tubes_impal`.`rMembuat` (`id_soal` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`rCocok`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`rCocok` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`rCocok` (
  `id_soal` VARCHAR(11) NOT NULL ,
  `id` INT NOT NULL ,
  `nid` INT NOT NULL ,
  `kode_matkul` VARCHAR(6) NOT NULL ,
  PRIMARY KEY (`id_soal`) ,
  CONSTRAINT `FK_id_soal_cocok`
    FOREIGN KEY (`id_soal` )
    REFERENCES `tubes_impal`.`bank_soal` (`id_soal` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_cocok`
    FOREIGN KEY (`id` )
    REFERENCES `tubes_impal`.`jawaban` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_nid_cocok`
    FOREIGN KEY (`nid` )
    REFERENCES `tubes_impal`.`rAjar` (`nid` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_kode_matkul_cocok`
    FOREIGN KEY (`kode_matkul` )
    REFERENCES `tubes_impal`.`rAjar` (`kode_matkul` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `id_soal_idx` ON `tubes_impal`.`rCocok` (`id_soal` ASC) ;

CREATE INDEX `id_idx` ON `tubes_impal`.`rCocok` (`id` ASC) ;

CREATE INDEX `nid_idx` ON `tubes_impal`.`rCocok` (`nid` ASC) ;

CREATE INDEX `kode_matkul_idx` ON `tubes_impal`.`rCocok` (`kode_matkul` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`nilai`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`nilai` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`nilai` (
  `id_nilai` INT NOT NULL AUTO_INCREMENT ,
  `nilai` INT NOT NULL ,
  `tgl_input` DATE NOT NULL ,
  `tgl_update` DATE NULL ,
  PRIMARY KEY (`id_nilai`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tubes_impal`.`rMemberi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`rMemberi` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`rMemberi` (
  `nomor` INT NOT NULL AUTO_INCREMENT ,
  `nid` INT NOT NULL ,
  `kode_matkul` VARCHAR(6) NOT NULL ,
  `id_nilai` INT NOT NULL ,
  PRIMARY KEY (`nomor`) ,
  CONSTRAINT `FK_nid_beri`
    FOREIGN KEY (`nid` )
    REFERENCES `tubes_impal`.`rAjar` (`nid` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_kode_matkul_beri`
    FOREIGN KEY (`kode_matkul` )
    REFERENCES `tubes_impal`.`rAjar` (`kode_matkul` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_nilai_beri`
    FOREIGN KEY (`id_nilai` )
    REFERENCES `tubes_impal`.`nilai` (`id_nilai` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `nid_idx` ON `tubes_impal`.`rMemberi` (`nid` ASC) ;

CREATE INDEX `kode_matkul_idx` ON `tubes_impal`.`rMemberi` (`kode_matkul` ASC) ;

CREATE INDEX `id_nilai_idx` ON `tubes_impal`.`rMemberi` (`id_nilai` ASC) ;


-- -----------------------------------------------------
-- Table `tubes_impal`.`rMemiliki`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tubes_impal`.`rMemiliki` ;

CREATE  TABLE IF NOT EXISTS `tubes_impal`.`rMemiliki` (
  `id_set` INT NOT NULL AUTO_INCREMENT ,
  `id_nilai` INT NOT NULL ,
  `nim` INT NOT NULL ,
  PRIMARY KEY (`id_set`) ,
  CONSTRAINT `FK_id_nilai_milik`
    FOREIGN KEY (`id_nilai` )
    REFERENCES `tubes_impal`.`nilai` (`id_nilai` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_nim_milik`
    FOREIGN KEY (`nim` )
    REFERENCES `tubes_impal`.`mahasiswa` (`nim` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `id_nilai_idx` ON `tubes_impal`.`rMemiliki` (`id_nilai` ASC) ;

CREATE INDEX `nim_idx` ON `tubes_impal`.`rMemiliki` (`nim` ASC) ;

USE `tubes_impal` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
