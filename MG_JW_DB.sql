-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mg_jw_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mg_jw_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mg_jw_db` DEFAULT CHARACTER SET utf8mb3 ;
USE `mg_jw_db` ;

-- -----------------------------------------------------
-- Table `mg_jw_db`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg_jw_db`.`Address` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `Street` VARCHAR(255) NOT NULL,
  `ZipCode` VARCHAR(255) NULL,
  `State` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mg_jw_db`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg_jw_db`.`Clients` (
  `ClientID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ClientID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mg_jw_db`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg_jw_db`.`Products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(255) NOT NULL,
  `BuyPrice` DECIMAL(10,2) NOT NULL,
  `SellPrice` DECIMAL(10,2) NOT NULL,
  `AmountInStock` INT NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mg_jw_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg_jw_db`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `ClientID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `client_id_fk_idx` (`ClientID` ASC) VISIBLE,
  INDEX `product_id_fk_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `client_id_fk`
    FOREIGN KEY (`ClientID`)
    REFERENCES `mg_jw_db`.`Clients` (`ClientID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_id_fk`
    FOREIGN KEY (`ProductID`)
    REFERENCES `mg_jw_db`.`Products` (`ProductID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mg_jw_db`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg_jw_db`.`Delivery` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(255) NOT NULL,
  `AddressID` INT NOT NULL,
  `Comment` VARCHAR(255) NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `address_id_fk_idx` (`AddressID` ASC) VISIBLE,
  INDEX `order_id_fk_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `address_id_fk`
    FOREIGN KEY (`AddressID`)
    REFERENCES `mg_jw_db`.`Address` (`AddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mg_jw_db`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
