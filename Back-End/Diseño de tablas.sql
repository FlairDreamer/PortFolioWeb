-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`encabezado` (
  `id` TINYINT(1) NOT NULL,
  `url_foto_cartel` VARCHAR(200) NOT NULL,
  `url_foto_login` VARCHAR(200) NOT NULL,
  `url_ap_logo` VARCHAR(200) NOT NULL,
  `texto_yo_programo` CHAR(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`red_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`red_social` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `link` VARCHAR(200) NOT NULL,
  `encabezado_id` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`, `encabezado_id`),
  INDEX `fk_red_social_encabezado_idx` (`encabezado_id` ASC) VISIBLE,
  CONSTRAINT `fk_red_social_encabezado`
    FOREIGN KEY (`encabezado_id`)
    REFERENCES `portfolio`.`encabezado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`barra_navegacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`barra_navegacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `link` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `link_UNIQUE` (`link` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`acerca_de_mi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`acerca_de_mi` (
  `id` TINYINT(1) NOT NULL,
  `url_foto_de_perfil` VARCHAR(45) NOT NULL,
  `nombre_y_apellido` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `edad` INT(99) NOT NULL,
  `musica` VARCHAR(45) NOT NULL,
  `series_y_peliculas` VARCHAR(45) NOT NULL,
  `autor_mas_leido` VARCHAR(45) NOT NULL,
  `barra_navegacion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `barra_navegacion_id`),
  INDEX `fk_acerca_de_mi_barra_navegacion1_idx` (`barra_navegacion_id` ASC) VISIBLE,
  CONSTRAINT `fk_acerca_de_mi_barra_navegacion1`
    FOREIGN KEY (`barra_navegacion_id`)
    REFERENCES `portfolio`.`barra_navegacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`videojuegos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`videojuegos` (
  `id` INT NOT NULL,
  `juego` VARCHAR(45) NOT NULL,
  `acerca_de_mi_id` INT NOT NULL,
  `acerca_de_mi_barra_navegacion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `acerca_de_mi_id`, `acerca_de_mi_barra_navegacion_id`),
  UNIQUE INDEX `uno_UNIQUE` (`juego` ASC) VISIBLE,
  INDEX `fk_videojuegos_acerca_de_mi1_idx` (`acerca_de_mi_id` ASC, `acerca_de_mi_barra_navegacion_id` ASC) VISIBLE,
  CONSTRAINT `fk_videojuegos_acerca_de_mi1`
    FOREIGN KEY (`acerca_de_mi_id` , `acerca_de_mi_barra_navegacion_id`)
    REFERENCES `portfolio`.`acerca_de_mi` (`id` , `barra_navegacion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`experiencia` (
  `id` TINYINT(1) NOT NULL,
  `url_imagen` VARCHAR(45) NOT NULL,
  `texto` VARCHAR(45) NOT NULL,
  `barra_navegacion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `barra_navegacion_id`),
  INDEX `fk_experiencia_barra_navegacion1_idx` (`barra_navegacion_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_barra_navegacion1`
    FOREIGN KEY (`barra_navegacion_id`)
    REFERENCES `portfolio`.`barra_navegacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`entidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`entidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `parte_1` VARCHAR(45) NOT NULL,
  `parte_2` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `parte_1_UNIQUE` (`parte_1` ASC) VISIBLE,
  UNIQUE INDEX `parte_2_UNIQUE` (`parte_2` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`educacion` (
  `id` TINYINT(1) NOT NULL,
  `entidad_id` INT NOT NULL,
  `barra_navegacion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `entidad_id`, `barra_navegacion_id`),
  INDEX `fk_educacion_entidad1_idx` (`entidad_id` ASC) VISIBLE,
  INDEX `fk_educacion_barra_navegacion1_idx` (`barra_navegacion_id` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_entidad1`
    FOREIGN KEY (`entidad_id`)
    REFERENCES `portfolio`.`entidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_barra_navegacion1`
    FOREIGN KEY (`barra_navegacion_id`)
    REFERENCES `portfolio`.`barra_navegacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`titulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`titulo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `educacion_id` TINYINT(1) NOT NULL,
  `educacion_entidad_id` INT NOT NULL,
  PRIMARY KEY (`id`, `educacion_id`, `educacion_entidad_id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `fk_titulo_educacion1_idx` (`educacion_id` ASC, `educacion_entidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_titulo_educacion1`
    FOREIGN KEY (`educacion_id` , `educacion_entidad_id`)
    REFERENCES `portfolio`.`educacion` (`id` , `entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`periodo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inicio` DATE NOT NULL,
  `final` DATE NOT NULL,
  `educacion_id` TINYINT(1) NOT NULL,
  `educacion_entidad_id` INT NOT NULL,
  PRIMARY KEY (`id`, `educacion_id`, `educacion_entidad_id`),
  INDEX `fk_periodo_educacion1_idx` (`educacion_id` ASC, `educacion_entidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_periodo_educacion1`
    FOREIGN KEY (`educacion_id` , `educacion_entidad_id`)
    REFERENCES `portfolio`.`educacion` (`id` , `entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`educacion_img`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`educacion_img` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url_imagen` VARCHAR(200) NOT NULL,
  `educacion_id` TINYINT(1) NOT NULL,
  `educacion_entidad_id` INT NOT NULL,
  PRIMARY KEY (`id`, `educacion_id`, `educacion_entidad_id`),
  INDEX `fk_educacion_img_educacion1_idx` (`educacion_id` ASC, `educacion_entidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_img_educacion1`
    FOREIGN KEY (`educacion_id` , `educacion_entidad_id`)
    REFERENCES `portfolio`.`educacion` (`id` , `entidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`habilidades_blandas_y_duras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`habilidades_blandas_y_duras` (
  `id` TINYINT(1) NOT NULL,
  `barra_navegacion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `barra_navegacion_id`),
  INDEX `fk_habilidades_blandas_y_duras_barra_navegacion1_idx` (`barra_navegacion_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidades_blandas_y_duras_barra_navegacion1`
    FOREIGN KEY (`barra_navegacion_id`)
    REFERENCES `portfolio`.`barra_navegacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`habilidades_duras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`habilidades_duras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clase` VARCHAR(45) NOT NULL,
  `nivel` INT(100) NOT NULL,
  `habilidad` VARCHAR(45) NOT NULL,
  `habilidades_blandas_y_duras_id` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`, `habilidades_blandas_y_duras_id`),
  INDEX `fk_habilidades_duras_habilidades_blandas_y_duras1_idx` (`habilidades_blandas_y_duras_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidades_duras_habilidades_blandas_y_duras1`
    FOREIGN KEY (`habilidades_blandas_y_duras_id`)
    REFERENCES `portfolio`.`habilidades_blandas_y_duras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`habilidades_blandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`habilidades_blandas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clase` VARCHAR(45) NOT NULL,
  `nivel` INT(100) NOT NULL,
  `habilidad` VARCHAR(45) NOT NULL,
  `habilidades_blandas_y_duras_id` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`, `habilidades_blandas_y_duras_id`),
  INDEX `fk_habilidades_blandas_habilidades_blandas_y_duras1_idx` (`habilidades_blandas_y_duras_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidades_blandas_habilidades_blandas_y_duras1`
    FOREIGN KEY (`habilidades_blandas_y_duras_id`)
    REFERENCES `portfolio`.`habilidades_blandas_y_duras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`idiomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`idiomas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clase` VARCHAR(45) NOT NULL,
  `nivel` INT(100) NOT NULL,
  `habilidad` VARCHAR(45) NOT NULL,
  `habilidades_blandas_y_duras_id` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`, `habilidades_blandas_y_duras_id`),
  INDEX `fk_idiomas_habilidades_blandas_y_duras1_idx` (`habilidades_blandas_y_duras_id` ASC) VISIBLE,
  CONSTRAINT `fk_idiomas_habilidades_blandas_y_duras1`
    FOREIGN KEY (`habilidades_blandas_y_duras_id`)
    REFERENCES `portfolio`.`habilidades_blandas_y_duras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`proyectos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `url_imagen` VARCHAR(200) NOT NULL,
  `inicio` DATE NOT NULL,
  `final` DATE NOT NULL,
  `barra_navegacion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `barra_navegacion_id`),
  INDEX `fk_proyectos_barra_navegacion1_idx` (`barra_navegacion_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_barra_navegacion1`
    FOREIGN KEY (`barra_navegacion_id`)
    REFERENCES `portfolio`.`barra_navegacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`errores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`errores` (
  `id` INT NOT NULL,
  `url_imagen` VARCHAR(200) NOT NULL,
  `mensaje` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
