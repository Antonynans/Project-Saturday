-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ats_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ats_db` ;

-- -----------------------------------------------------
-- Schema ats_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ats_db` DEFAULT CHARACTER SET utf8 ;
USE `ats_db` ;

-- -----------------------------------------------------
-- Table `ats_db`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ats_db`.`user` ;

CREATE TABLE IF NOT EXISTS `ats_db`.`user` (
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `image` VARCHAR(100) NULL,
  `sign_up-date` DATETIME NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ats_db`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ats_db`.`organization` ;

CREATE TABLE IF NOT EXISTS `ats_db`.`organization` (
  `organization_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `logo` VARCHAR(100) NULL,
  `created_on` VARCHAR(45) NOT NULL,
  `created _by_user_id` INT NOT NULL,
  `created_user_id` INT NOT NULL,
  PRIMARY KEY (`organization_id`),
  INDEX `fk_organization_user1_idx` (`created_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_organization_user1`
    FOREIGN KEY (`created_user_id`)
    REFERENCES `ats_db`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ats_db`.`organization_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ats_db`.`organization_users` ;

CREATE TABLE IF NOT EXISTS `ats_db`.`organization_users` (
  `user_user_id` INT NOT NULL,
  `organization_organization_id` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`user_user_id`, `organization_organization_id`),
  INDEX `fk_User_has_Organization_Organization1_idx` (`organization_organization_id` ASC) VISIBLE,
  INDEX `fk_User_has_Organization_User_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Organization_User`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `ats_db`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Organization_Organization1`
    FOREIGN KEY (`organization_organization_id`)
    REFERENCES `ats_db`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ats_db`.`organization_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ats_db`.`organization_log` ;

CREATE TABLE IF NOT EXISTS `ats_db`.`organization_log` (
  `organization_log_id` INT NOT NULL,
  `timestamp` DATETIME NULL,
  `user_id` INT NOT NULL,
  `organization_id` INT NOT NULL,
  PRIMARY KEY (`organization_log_id`),
  INDEX `fk_organization_log_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_organization_log_organization1_idx` (`organization_id` ASC) VISIBLE,
  CONSTRAINT `fk_organization_log_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ats_db`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_log_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `ats_db`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
