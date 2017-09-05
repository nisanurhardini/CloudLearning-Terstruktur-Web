SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`UserMhs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UserMhs` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`UserMhs` (
  `NIM` INT NOT NULL ,
  `Nama` VARCHAR(50) NOT NULL ,
  `tgl_lahir` DATE NOT NULL ,
  `gender` VARCHAR(1) NOT NULL ,
  `email` VARCHAR(50) NULL ,
  `kontak` VARCHAR(14) NULL ,
  PRIMARY KEY (`NIM`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `NIM_UNIQUE` ON `mydb`.`UserMhs` (`NIM` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`UserDsn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UserDsn` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`UserDsn` (
  `NIP` INT NOT NULL ,
  `Nama` VARCHAR(50) NOT NULL ,
  `Kode_dosen` VARCHAR(3) NOT NULL ,
  `tgl_lahir` DATE NOT NULL ,
  `kontak` VARCHAR(14) NOT NULL ,
  `email` VARCHAR(50) NOT NULL ,
  `gender` VARCHAR(1) NOT NULL ,
  PRIMARY KEY (`NIP`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `NIP_UNIQUE` ON `mydb`.`UserDsn` (`NIP` ASC) ;

CREATE UNIQUE INDEX `Kode_dosen_UNIQUE` ON `mydb`.`UserDsn` (`Kode_dosen` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Materi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Materi` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Materi` (
  `id` INT NOT NULL ,
  `kode_matkul` VARCHAR(5) NOT NULL ,
  `kode_dosen` VARCHAR(3) NOT NULL ,
  `nama_matkul` VARCHAR(50) NOT NULL ,
  `pathfile` TEXT NOT NULL ,
  `tgl_input` DATE NOT NULL ,
  `tgl_update` DATE NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `Kode_dosen`
    FOREIGN KEY (`kode_dosen` )
    REFERENCES `mydb`.`UserDsn` (`Kode_dosen` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `Kode_dosen_idx` ON `mydb`.`Materi` (`kode_dosen` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`BankSoal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BankSoal` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`BankSoal` (
  `kode_soal` INT NOT NULL ,
  `Kode_dosen` VARCHAR(3) NOT NULL ,
  `pathfile` TEXT NOT NULL ,
  `solusi` TEXT NULL ,
  `tgl_input` DATE NOT NULL ,
  `tgl_update` DATE NOT NULL ,
  PRIMARY KEY (`kode_soal`) ,
  CONSTRAINT `Kode_dosen`
    FOREIGN KEY (`Kode_dosen` )
    REFERENCES `mydb`.`UserDsn` (`Kode_dosen` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `kode_soal_UNIQUE` ON `mydb`.`BankSoal` (`kode_soal` ASC) ;

CREATE UNIQUE INDEX `Kode_dosen_UNIQUE` ON `mydb`.`BankSoal` (`Kode_dosen` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Jawaban`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Jawaban` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Jawaban` (
  `NIM` INT NOT NULL ,
  `Nama` VARCHAR(50) NOT NULL ,
  `Kelas` VARCHAR(8) NOT NULL ,
  `Kode_dosen` VARCHAR(3) NOT NULL ,
  `nama_matkul` VARCHAR(50) NOT NULL ,
  `pathfile` TEXT NOT NULL ,
  `tgl_masuk` DATE NOT NULL ,
  `tgl_update` DATE NOT NULL ,
  PRIMARY KEY (`NIM`) ,
  CONSTRAINT `NIM`
    FOREIGN KEY (`NIM` )
    REFERENCES `mydb`.`UserMhs` (`NIM` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Kode_dosen`
    FOREIGN KEY (`Kode_dosen` )
    REFERENCES `mydb`.`UserDsn` (`Kode_dosen` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `NIM_UNIQUE` ON `mydb`.`Jawaban` (`NIM` ASC) ;

CREATE UNIQUE INDEX `Kode_dosen_UNIQUE` ON `mydb`.`Jawaban` (`Kode_dosen` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Nilai`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Nilai` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Nilai` (
  `NIM` INT NOT NULL ,
  `Nama` VARCHAR(50) NOT NULL ,
  `kode_matkul` VARCHAR(5) NOT NULL ,
  `nama_matkul` VARCHAR(50) NOT NULL ,
  `nama_tugas` VARCHAR(50) NOT NULL ,
  `nilai` DOUBLE NOT NULL ,
  PRIMARY KEY (`NIM`) ,
  CONSTRAINT `NIM`
    FOREIGN KEY (`NIM` )
    REFERENCES `mydb`.`UserMhs` (`NIM` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Kode_matkul`
    FOREIGN KEY (`kode_matkul` )
    REFERENCES `mydb`.`Materi` (`kode_dosen` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `NIM_UNIQUE` ON `mydb`.`Nilai` (`NIM` ASC) ;

CREATE INDEX `Kode_matkul_idx` ON `mydb`.`Nilai` (`kode_matkul` ASC) ;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
