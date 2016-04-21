-- MySQL Script generated by MySQL Workbench
-- 04/20/16 18:50:51
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ajax
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ajax` ;

-- -----------------------------------------------------
-- Schema ajax
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ajax` DEFAULT CHARACTER SET latin1 ;
USE `ajax` ;

-- -----------------------------------------------------
-- Table `ajax`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ajax`.`user` ;

CREATE TABLE IF NOT EXISTS `ajax`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ajax`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ajax`.`student` ;

CREATE TABLE IF NOT EXISTS `ajax`.`student` (
  `id` INT(10) NOT NULL,
  `firstName` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `lastName` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `birthdate` DATE NOT NULL,
  `gender` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `career` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_student_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `ajax`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `ajax`.`tutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ajax`.`tutor` ;

CREATE TABLE IF NOT EXISTS `ajax`.`tutor` (
  `id` INT(10) NOT NULL,
  `firstName` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `lastName` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `gender` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `area` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_tutor_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `ajax`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `ajax`.`group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ajax`.`group` ;

CREATE TABLE IF NOT EXISTS `ajax`.`group` (
  `id` INT NOT NULL,
  `tutor_id` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `tutor_id_idx` (`tutor_id` ASC),
  CONSTRAINT `fk_tutor_id`
    FOREIGN KEY (`tutor_id`)
    REFERENCES `ajax`.`tutor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ajax`.`files`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ajax`.`files` ;

CREATE TABLE IF NOT EXISTS `ajax`.`files` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(400) NULL,
  `path` VARCHAR(200) NULL,
  `group_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `group_id_idx` (`group_id` ASC),
  CONSTRAINT `fk_files_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `ajax`.`group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ajax`.`assign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ajax`.`assign` ;

CREATE TABLE IF NOT EXISTS `ajax`.`assign` (
  `student_id` INT NULL,
  `group_id` INT NULL,
  INDEX `student_id_idx` (`student_id` ASC),
  INDEX `group_id_idx` (`group_id` ASC),
  CONSTRAINT `fk_student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `ajax`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assign_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `ajax`.`group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
