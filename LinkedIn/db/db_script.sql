-- MySQL Script generated by MySQL Workbench
-- Παρ 27 Απρ 2018 01:35:30 πμ EEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema linkedin_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema linkedin_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `linkedin_db` DEFAULT CHARACTER SET utf8 ;
USE `linkedin_db` ;

-- -----------------------------------------------------
-- Table `linkedin_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`user` (
  `userID` BIGINT NOT NULL AUTO_INCREMENT,
  `password_hashed` VARCHAR(128) NOT NULL,
  `first_name` VARCHAR(128) NOT NULL,
  `last_name` VARCHAR(128) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `phone_number` VARCHAR(128) NOT NULL,
  `photo_path` VARCHAR(1024) NOT NULL,
  `cv_path` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`education` (
  `userID` BIGINT NOT NULL,
  `education_description` VARCHAR(1024) NOT NULL,
  `education_title` VARCHAR(128) NOT NULL,
  `education_from` DATE NOT NULL,
  `education_to` DATE NOT NULL,
  `private` BOOLEAN NOT NULL,
  `educationID` BIGINT NOT NULL AUTO_INCREMENT,
  INDEX `fk_education_1_idx` (`userID` ASC),
  PRIMARY KEY (`educationID`),
  CONSTRAINT `fk_education_1`
    FOREIGN KEY (`userID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`job` (
  `userID` BIGINT NOT NULL,
  `job_description` VARCHAR(1024) NOT NULL,
  `job_title` VARCHAR(128) NOT NULL,
  `job_from` DATE NOT NULL,
  `job_to` DATE NOT NULL,
  `private` BOOLEAN NOT NULL,
  `jobID` BIGINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`jobID`),
  CONSTRAINT `fk_job_1`
    FOREIGN KEY (`userID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`skill` (
  `userID` BIGINT NOT NULL,
  `skill` VARCHAR(128) NOT NULL,
  `private` BOOLEAN NOT NULL,
  `skillID` BIGINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`skillID`),
  CONSTRAINT `fk_skill_1`
    FOREIGN KEY (`userID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`article` (
  `articleID` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(256) NOT NULL,
  `text` VARCHAR(4096) NOT NULL,
  `authorID` BIGINT NOT NULL,
  `pub_date` DATE NOT NULL,
  `picture_path` VARCHAR(1024) NOT NULL,
  `video_path` VARCHAR(1024) NOT NULL,
  `audio_path` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`articleID`),
  INDEX `fk_article_1_idx` (`authorID` ASC),
  CONSTRAINT `fk_article_1`
    FOREIGN KEY (`authorID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`comment` (
  `articleID` BIGINT NOT NULL,
  `userID` BIGINT NOT NULL,
  `pub_date` DATE NOT NULL,
  `text` VARCHAR(1024) NOT NULL,
  `commentID` BIGINT NOT NULL AUTO_INCREMENT,
  INDEX `fk_comment_2_idx` (`userID` ASC),
  PRIMARY KEY (`commentID`),
  CONSTRAINT `fk_comment_1`
    FOREIGN KEY (`articleID`)
    REFERENCES `linkedin_db`.`article` (`articleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_2`
    FOREIGN KEY (`userID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`connection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`connection` (
  `userID_1` BIGINT NOT NULL,
  `userID_2` BIGINT NOT NULL,
  `accepted` BOOLEAN NOT NULL,
  `rejected` BOOLEAN NOT NULL,
  `connectionID` BIGINT NOT NULL AUTO_INCREMENT,
  INDEX `fk_connection_2_idx` (`userID_2` ASC),
  PRIMARY KEY (`connectionID`),
  CONSTRAINT `fk_connection_1`
    FOREIGN KEY (`userID_1`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_connection_2`
    FOREIGN KEY (`userID_2`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `linkedin_db`.`application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`application` (
  `listingID` BIGINT NOT NULL,
  `applicantID` BIGINT NOT NULL,
  `accepted` BOOLEAN NOT NULL,
  `rejected` BOOLEAN NOT NULL,
  `applicationID` BIGINT NOT NULL AUTO_INCREMENT,
  INDEX `fk_application_2_idx` (`applicantID` ASC),
  PRIMARY KEY (`applicationID`),
  CONSTRAINT `fk_application_1`
    FOREIGN KEY (`listingID`)
    REFERENCES `linkedin_db`.`listing` (`listingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_2`
    FOREIGN KEY (`applicantID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`like_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`like_article` (
  `articleID` BIGINT NOT NULL,
  `userID` BIGINT NOT NULL,
  `like_articleID` BIGINT NOT NULL AUTO_INCREMENT,
  INDEX `fk_like_article_2_idx` (`userID` ASC),
  PRIMARY KEY (`like_articleID`),
  CONSTRAINT `fk_like_article_1`
    FOREIGN KEY (`articleID`)
    REFERENCES `linkedin_db`.`article` (`articleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_article_2`
    FOREIGN KEY (`userID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`listing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`listing` (
  `listingID` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(128) NOT NULL,
  `userID` BIGINT NOT NULL,
  `pub_date` DATE NOT NULL,
  `description` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`listingID`),
  INDEX `fk_listing_1_idx` (`userID` ASC),
  CONSTRAINT `fk_listing_1`
    FOREIGN KEY (`userID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`like_listing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`like_listing` (
  `listingID` BIGINT NOT NULL,
  `userID` BIGINT NOT NULL,
  `like_listingID` BIGINT NOT NULL AUTO_INCREMENT,
  INDEX `fk_like_listing_1_idx` (`listingID` ASC),
  INDEX `fk_like_listing_2_idx` (`userID` ASC),
  PRIMARY KEY (`like_listingID`),
  CONSTRAINT `fk_like_listing_1`
    FOREIGN KEY (`listingID`)
    REFERENCES `linkedin_db`.`listing` (`listingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_listing_2`
    FOREIGN KEY (`userID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `linkedin_db`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `linkedin_db`.`message` (
  `messageID` BIGINT NOT NULL AUTO_INCREMENT,
  `senderID` BIGINT NOT NULL,
  `receiverID` BIGINT NOT NULL,
  `text` VARCHAR(1024) NOT NULL,
  `pub_date` DATE NOT NULL,
  PRIMARY KEY (`messageID`),
  INDEX `fk_message_1_idx` (`senderID` ASC),
  INDEX `fk_message_2_idx` (`receiverID` ASC),
  CONSTRAINT `fk_message_1`
    FOREIGN KEY (`senderID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_2`
    FOREIGN KEY (`receiverID`)
    REFERENCES `linkedin_db`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Add Admin -- username : admin , password : admin
-- -----------------------------------------------------
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'$31$16$EUfdXHWUrhIrFqjJIfQsHjKTgHfi9CCokX4DyyAlk7E','Admin','Admin','admin@linkedin.com','6900000000','','');
UNLOCK TABLES;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
