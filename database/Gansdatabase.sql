-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema citiesforgans
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema citiesforgans
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `citiesforgans` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `citiesforgans` ;

-- -----------------------------------------------------
-- Table `citiesforgans`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citiesforgans`.`city` (
  `Cityid` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Cityid`))
ENGINE = InnoDB
AUTO_INCREMENT = 156
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citiesforgans`.`airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citiesforgans`.`airport` (
  `Cityid` INT NULL DEFAULT NULL,
  `Airport` VARCHAR(127) NULL DEFAULT NULL,
  `ICAO` VARCHAR(243) NOT NULL,
  PRIMARY KEY (`ICAO`),
  INDEX `Cityid` (`Cityid` ASC) VISIBLE,
  CONSTRAINT `airport_ibfk_1`
    FOREIGN KEY (`Cityid`)
    REFERENCES `citiesforgans`.`city` (`Cityid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citiesforgans`.`citydetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citiesforgans`.`citydetails` (
  `Cityid` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(255) NULL DEFAULT NULL,
  `Longitude` VARCHAR(255) NULL DEFAULT NULL,
  `Country` VARCHAR(255) NULL DEFAULT NULL,
  `Population` INT NULL DEFAULT NULL,
  `Yearretrieved` INT NULL DEFAULT NULL,
  INDEX `Cityid` (`Cityid` ASC) VISIBLE,
  CONSTRAINT `citydetails_ibfk_1`
    FOREIGN KEY (`Cityid`)
    REFERENCES `citiesforgans`.`city` (`Cityid`))
ENGINE = InnoDB
AUTO_INCREMENT = 156
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citiesforgans`.`flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citiesforgans`.`flights` (
  `ICAO` VARCHAR(123) NULL DEFAULT NULL,
  `Origincity` VARCHAR(190) NULL DEFAULT NULL,
  `Airline` VARCHAR(145) NULL DEFAULT NULL,
  `Flightnumber` VARCHAR(84) NOT NULL,
  `Terminal` VARCHAR(67) NULL DEFAULT NULL,
  `Arrivaltime` DATETIME NOT NULL,
  `Timeretrieved` DATETIME NULL DEFAULT NULL,
  INDEX `ICAO` (`ICAO` ASC) VISIBLE,
  CONSTRAINT `flights_ibfk_1`
    FOREIGN KEY (`ICAO`)
    REFERENCES `citiesforgans`.`airport` (`ICAO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citiesforgans`.`weatherdescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citiesforgans`.`weatherdescription` (
  `Weatherid` INT NOT NULL,
  `Description_` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`Weatherid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `citiesforgans`.`weather`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `citiesforgans`.`weather` (
  `Cityid` INT NULL DEFAULT NULL,
  `Weatherid` INT NOT NULL,
  `Weather` VARCHAR(255) NOT NULL,
  `Temperature` FLOAT(10,2) NOT NULL,
  `Feelslike` FLOAT(10,2) NOT NULL,
  `Humidity` INT NULL DEFAULT NULL,
  `Wind` FLOAT(10,2) NULL DEFAULT NULL,
  `Dateandtime` DATETIME NULL DEFAULT NULL,
  `Dateretrieved` DATETIME NULL DEFAULT NULL,
  INDEX `Cityid` (`Cityid` ASC) VISIBLE,
  INDEX `Weatherid` (`Weatherid` ASC) VISIBLE,
  CONSTRAINT `weather_ibfk_1`
    FOREIGN KEY (`Cityid`)
    REFERENCES `citiesforgans`.`city` (`Cityid`),
  CONSTRAINT `weather_ibfk_2`
    FOREIGN KEY (`Weatherid`)
    REFERENCES `citiesforgans`.`weatherdescription` (`Weatherid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
