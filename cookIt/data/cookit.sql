-- MySQL Script generated by MySQL Workbench
-- Tue Aug 25 21:14:41 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cookit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cookit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cookit` DEFAULT CHARACTER SET utf8 ;
USE `cookit` ;

-- -----------------------------------------------------
-- Table `cookit`.`wines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cookit`.`wines` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cookit`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cookit`.`categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `idWine` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idWine_idx` (`idWine` ASC),
  CONSTRAINT `idWine`
    FOREIGN KEY (`idWine`)
    REFERENCES `cookit`.`wines` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cookit`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cookit`.`products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `precio` SMALLINT(4) NOT NULL,
  `descuento` SMALLINT(2) NOT NULL,
  `descripcion` VARCHAR(512) NOT NULL,
  `tiempo` SMALLINT(3) NOT NULL,
  `apto` VARCHAR(100) NULL DEFAULT NULL,
  `porciones` SMALLINT(2) NOT NULL,
  `calorias` SMALLINT(4) NOT NULL,
  `imagenes` VARCHAR(255) NOT NULL,
  `receta` VARCHAR(45) NOT NULL,
  `idCategory` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idCategorie_idx` (`idCategory` ASC),
  CONSTRAINT `idCategorie`
    FOREIGN KEY (`idCategory`)
    REFERENCES `cookit`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cookit`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cookit`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(255) NOT NULL,
  `avatar` VARCHAR(45) NULL DEFAULT NULL,
  `rol` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(255) NULL DEFAULT NULL,
  `cp` SMALLINT(4) NULL DEFAULT NULL,
  `localidad` VARCHAR(45) NULL DEFAULT NULL,
  `provincia` VARCHAR(45) NULL DEFAULT NULL,
  `created_At` DATETIME NULL DEFAULT NULL,
  `updated_At` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cookit`.`carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cookit`.`carts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `idUser` INT(11) NULL DEFAULT NULL,
  `idProduct` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idProduct_idx` (`idProduct` ASC),
  INDEX `idUser_idx` (`idUser` ASC),
  CONSTRAINT `idProduct`
    FOREIGN KEY (`idProduct`)
    REFERENCES `cookit`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `cookit`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;