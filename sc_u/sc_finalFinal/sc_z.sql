-- MySQL Script generated by MySQL Workbench
-- Mon Aug 16 01:36:15 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sc_u
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sc_u` ;

-- -----------------------------------------------------
-- Schema sc_u
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sc_u` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema sc_u
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sc_u` ;

-- -----------------------------------------------------
-- Schema sc_u
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sc_u` DEFAULT CHARACTER SET utf8 ;
USE `sc_u` ;

-- -----------------------------------------------------
-- Table `sc_u`.`tbl_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_usuario` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `primero_nombre` VARCHAR(45) NULL,
  `segundo_nombre` VARCHAR(45) NULL,
  `primero_apellido` VARCHAR(45) NULL,
  `segundo_apellido` VARCHAR(45) NULL,
  `email` VARCHAR(255) NOT NULL,
  `pass` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_Identificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_Identificacion` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_Identificacion` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tbl_usuario_id` INT(11) NULL,
  `tipo_documento` VARCHAR(45) NULL,
  `num_identidad` VARCHAR(45) NULL,
  `edad` INT(3) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario` (`tbl_usuario_id` ASC) ,
  CONSTRAINT `fk_tbl_Identificacion_tbl_usuario1`
    FOREIGN KEY (`tbl_usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_rol_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_rol_usuario` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_rol_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_usuario` INT(1) NOT NULL DEFAULT 4,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_calendario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_calendario` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_calendario` (
  `numero_calendario` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion_evento` VARCHAR(255) NULL,
  `fecha` DATE NULL,
  `hora` TIME NULL,
  PRIMARY KEY (`numero_calendario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_rutinas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_rutinas` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_rutinas` (
  `pk_numero` INT(11) NOT NULL AUTO_INCREMENT,
  `velocidad` VARCHAR(45) NULL DEFAULT NULL,
  `resistencia` VARCHAR(45) NULL DEFAULT NULL,
  `fuerza` VARCHAR(45) NULL DEFAULT NULL,
  `coordinacion` VARCHAR(45) NULL DEFAULT NULL,
  `fk_usuario_id` INT(11) NULL,
  `fk_calendario_numero` INT(11) NULL,
  PRIMARY KEY (`pk_numero`),
  INDEX `fk_rutinas_usuario1_idx` (`fk_usuario_id` ASC) ,
  INDEX `fk_rutinas_calendario1_idx` (`fk_calendario_numero` ASC) ,
  CONSTRAINT `fk_rutinas_usuario1`
    FOREIGN KEY (`fk_usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rutinas_calendario1`
    FOREIGN KEY (`fk_calendario_numero`)
    REFERENCES `sc_u`.`tbl_calendario` (`numero_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_jugador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_jugador` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_jugador` (
  `pk_id` INT(11) NOT NULL,
  `jgd_tipo_jugador` VARCHAR(45) NULL,
  `jgd_posicion_campo` VARCHAR(45) NULL,
  `jgd_num_jugdr_campo` INT(2) NULL,
  `jgd_categoria` VARCHAR(45) NULL,
  `fk_rutinas_numero` INT(11) NULL,
  INDEX `fk_jugador_rutinas1_idx` (`fk_rutinas_numero` ASC) ,
  PRIMARY KEY (`pk_id`),
  CONSTRAINT `fk_jugador_rutinas1`
    FOREIGN KEY (`fk_rutinas_numero`)
    REFERENCES `sc_u`.`tbl_rutinas` (`pk_numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_revision_mental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_revision_mental` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_revision_mental` (
  `pk_id` INT(11) NOT NULL AUTO_INCREMENT,
  `rm_cualidades` VARCHAR(45) NULL,
  `rm_habilidad_psiquicas` VARCHAR(45) NULL,
  `rm_debilidades_psiquicas` VARCHAR(45) NULL,
  `rm_habilidad_psicomotriz` VARCHAR(45) NULL,
  `fk_jugador_usuario_id` INT(11) NULL,
  INDEX `fk_tbl_revision_mental_tbl_jugador1_idx` (`fk_jugador_usuario_id` ASC) ,
  PRIMARY KEY (`pk_id`),
  CONSTRAINT `fk_trevision_mental`
    FOREIGN KEY (`fk_jugador_usuario_id`)
    REFERENCES `sc_u`.`tbl_jugador` (`pk_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_inventario` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_inventario` (
  `oc_id` INT(11) NOT NULL AUTO_INCREMENT,
  `inventario` VARCHAR(45) NULL,
  `lugar_estant` VARCHAR(255) NULL,
  `telefono` INT(11) NULL,
  PRIMARY KEY (`oc_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_factura` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_factura` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fk_acudiente` INT(11) NULL,
  `fk_admin` INT(11) NULL,
  `fecha` DATE NULL,
  `total_productos` INT(11) NULL,
  `valor_total` DOUBLE NULL,
  `impuestos` DOUBLE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_factura_usuario1_idx` (`fk_acudiente` ASC) ,
  INDEX `fk_factura_usuario2_idx` (`fk_admin` ASC) ,
  CONSTRAINT `fk_factura_usuario1`
    FOREIGN KEY (`fk_acudiente`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_usuario2`
    FOREIGN KEY (`fk_admin`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_categoria_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_categoria_producto` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_categoria_producto` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_producto` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_producto` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `valor_venta` VARCHAR(45) NULL,
  `pto_total` VARCHAR(45) NULL,
  `categoria_producto_id` INT(11) NULL,
  INDEX `fk_producto_categoria_producto1_idx` (`categoria_producto_id` ASC) ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_producto_categoria_producto1`
    FOREIGN KEY (`categoria_producto_id`)
    REFERENCES `sc_u`.`tbl_categoria_producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_factura_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_factura_producto` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_factura_producto` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `factura_id` INT NULL,
  `producto_id` INT(11) NULL,
  `valor_unidad` DOUBLE NULL,
  `cantidad` INT(11) NULL,
  INDEX `fk_factura_producto_factura1_idx` (`factura_id` ASC) ,
  INDEX `fk_factura_producto_producto1_idx` (`producto_id` ASC) ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_factura_producto_factura1`
    FOREIGN KEY (`factura_id`)
    REFERENCES `sc_u`.`tbl_factura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_producto_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `sc_u`.`tbl_producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `sc_u`.`tbl_comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_comentarios` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_comentarios` (
  `cmnt_id` INT(11) NOT NULL AUTO_INCREMENT,
  `cmnt_texto` VARCHAR(245) NULL,
  `cmnt_fecha` DATE NULL,
  PRIMARY KEY (`cmnt_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_orden_compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_orden_compra` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_orden_compra` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `num_venta` VARCHAR(45) NULL,
  `cantidad` INT(11) NULL,
  `valor` DOUBLE NULL,
  `novedad` VARCHAR(255) NULL,
  `calendario_numero` INT(11) NULL,
  `usuario_id` INT(11) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cotizacion_calendario1_idx` (`calendario_numero` ASC) ,
  INDEX `fk_orden_compra_usuario1_idx` (`usuario_id` ASC) ,
  CONSTRAINT `fk_cotizacion_calendario1`
    FOREIGN KEY (`calendario_numero`)
    REFERENCES `sc_u`.`tbl_calendario` (`numero_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_compra_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_enferm_medicas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_enferm_medicas` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_enferm_medicas` (
  `pk_id` INT(11) NOT NULL AUTO_INCREMENT,
  `em_nombre` VARCHAR(45) NULL,
  `em_causas` VARCHAR(245) NULL,
  `em_tratamiento` VARCHAR(245) NULL,
  `em_tipo_de_sangre` VARCHAR(45) NULL,
  `em_historial_clinico` VARCHAR(45) NULL,
  `fk_jugador` INT(11) NULL,
  PRIMARY KEY (`pk_id`),
  INDEX `fk_tbl_enferm_medicas_tbl_jugador1_idx` (`fk_jugador` ASC) ,
  CONSTRAINT `fk_tbl_enferm_medicas_tbl_jugador1`
    FOREIGN KEY (`fk_jugador`)
    REFERENCES `sc_u`.`tbl_jugador` (`pk_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_medidas_jugador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_medidas_jugador` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_medidas_jugador` (
  `pk_id` INT(11) NOT NULL AUTO_INCREMENT,
  `medida_pantaloneta` VARCHAR(2) NULL,
  `medida_camiseta` VARCHAR(45) NULL,
  `medida_zapatillas` VARCHAR(45) NULL,
  `fk_jugador_id` INT(11) NULL,
  PRIMARY KEY (`pk_id`),
  INDEX `fk_tbl_medidas_jugador_tbl_jugador1_idx` (`fk_jugador_id` ASC) ,
  CONSTRAINT `fk_tbl_medidas_jugador_tbl_jugador1`
    FOREIGN KEY (`fk_jugador_id`)
    REFERENCES `sc_u`.`tbl_jugador` (`pk_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `sc_u`.`tbl_torneo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_torneo` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_torneo` (
  `pk_numero` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_torneo` VARCHAR(45) NULL,
  `nombre_cancha` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  PRIMARY KEY (`pk_numero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`resultados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`resultados` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`resultados` (
  `pk_id` INT(11) NOT NULL AUTO_INCREMENT,
  `PJ` INT(4) NULL,
  `G` INT(4) NULL,
  `E` INT(4) NULL,
  `P` INT(4) NULL,
  `CF` INT(4) NULL,
  `GC` INT(4) NULL,
  `DG` INT(4) NULL,
  `Pts` INT(11) NULL,
  `fk_torneos_numero` INT(11) NULL,
  INDEX `fk_resultados_Torneos1_idx` (`fk_torneos_numero` ASC) ,
  PRIMARY KEY (`pk_id`),
  CONSTRAINT `fk_resultados_Torneos1`
    FOREIGN KEY (`fk_torneos_numero`)
    REFERENCES `sc_u`.`tbl_torneo` (`pk_numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_revision_fisica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_revision_fisica` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_revision_fisica` (
  `pk_id` INT(11) NOT NULL AUTO_INCREMENT,
  `rf_estatura` INT NULL,
  `rf_peso` INT NULL,
  `rf_genero` VARCHAR(45) NULL,
  `fk_jugador_usuario_id` INT(11) NULL,
  INDEX `fk_revision_medica_jugador1_idx` (`fk_jugador_usuario_id` ASC) ,
  PRIMARY KEY (`pk_id`),
  CONSTRAINT `fk_revision_medica`
    FOREIGN KEY (`fk_jugador_usuario_id`)
    REFERENCES `sc_u`.`tbl_jugador` (`pk_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table ``sc_u``.`tbl_telefono_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_telefono_usuario` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_telefono_usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Usuario_id` INT(11) NULL,
  `numero_telefono` INT(11) NULL,
  INDEX `fk_telefono_Usuario1_idx` (`Usuario_id` ASC) ,
  UNIQUE INDEX `numero_telefono_UNIQUE` (`numero_telefono` ASC) ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_telefono_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_tiene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_tiene` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_tiene` (
  `usuario_id` INT(11) NULL,
  `rol_usuario_id` INT NULL,
  INDEX `fk_usuario_has_rol_usuario_rol_usuario1_idx` (`rol_usuario_id` ASC) ,
  INDEX `fk_usuario_has_rol_usuario_usuario1_idx` (`usuario_id` ASC) ,
  CONSTRAINT `fk_usuario_has_rol_usuario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_rol_usuario_rol_usuario1`
    FOREIGN KEY (`rol_usuario_id`)
    REFERENCES `sc_u`.`tbl_rol_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_gestionar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_gestionar` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_gestionar` (
  `torneo_numero` INT(11) NULL,
  `usuario_id` INT(11) NULL,
  INDEX `fk_torneo_has_usuario_usuario1_idx` (`usuario_id` ASC) ,
  INDEX `fk_torneo_has_usuario_torneo1_idx` (`torneo_numero` ASC) ,
  CONSTRAINT `fk_torneo_has_usuario_torneo1`
    FOREIGN KEY (`torneo_numero`)
    REFERENCES `sc_u`.`tbl_torneo` (`pk_numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_torneo_has_usuario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_generar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_generar` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_generar` (
  `calendario_numero` INT(11) NULL,
  `usuario_id` INT(11) NULL,
  INDEX `fk_calendario_has_usuario_usuario1_idx` (`usuario_id` ASC) ,
  INDEX `fk_calendario_has_usuario_calendario1_idx` (`calendario_numero` ASC) ,
  CONSTRAINT `fk_calendario_has_usuario_calendario1`
    FOREIGN KEY (`calendario_numero`)
    REFERENCES `sc_u`.`tbl_calendario` (`numero_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_calendario_has_usuario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_adquirir`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_adquirir` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_adquirir` (
  `torneo_numero` INT(11) NULL,
  `calendario_numero` INT(11) NULL,
  INDEX `fk_torneo_has_calendario_calendario1_idx` (`calendario_numero` ASC) ,
  INDEX `fk_torneo_has_calendario_torneo1_idx` (`torneo_numero` ASC) ,
  CONSTRAINT `fk_torneo_has_calendario_torneo1`
    FOREIGN KEY (`torneo_numero`)
    REFERENCES `sc_u`.`tbl_torneo` (`pk_numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_torneo_has_calendario_calendario1`
    FOREIGN KEY (`calendario_numero`)
    REFERENCES `sc_u`.`tbl_calendario` (`numero_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`tbl_hacer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_hacer` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_hacer` (
  `usuario_id` INT(11) NULL,
  `cmnt_id` INT NULL,
  INDEX `fk_usuario_has_comentarios_comentarios1_idx` (`cmnt_id` ASC) ,
  INDEX `fk_usuario_has_comentarios_usuario1_idx` (`usuario_id` ASC) ,
  CONSTRAINT `fk_usuario_has_comentarios_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_comentarios_comentarios1`
    FOREIGN KEY (`cmnt_id`)
    REFERENCES `sc_u`.`tbl_comentarios` (`cmnt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`consultar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`consultar` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`consultar` (
  `resultados_pk_id` INT(11) NULL,
  `tbl_usuario_id` INT(11) NULL,
  INDEX `fk_resultados_has_tbl_usuario_tbl_usuario1_idx` (`tbl_usuario_id` ASC) ,
  INDEX `fk_resultados_has_tbl_usuario_resultados1_idx` (`resultados_pk_id` ASC) ,
  CONSTRAINT `fk_resultados_has_tbl_usuario_resultados1`
    FOREIGN KEY (`resultados_pk_id`)
    REFERENCES `sc_u`.`resultados` (`pk_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultados_has_tbl_usuario_tbl_usuario1`
    FOREIGN KEY (`tbl_usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sc_u`.`regular`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`regular` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`regular` (
  `tbl_usuario_id` INT(11) NULL,
  `tbl_jugador_pk_id` INT(11) NULL,
  INDEX `fk_tbl_usuario_has_tbl_jugador_tbl_jugador1_idx` (`tbl_jugador_pk_id` ASC) ,
  INDEX `fk_tbl_usuario_has_tbl_jugador_tbl_usuario1_idx` (`tbl_usuario_id` ASC) ,
  CONSTRAINT `fk_tbl_usuario_has_tbl_jugador_tbl_usuario1`
    FOREIGN KEY (`tbl_usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_usuario_has_tbl_jugador_tbl_jugador1`
    FOREIGN KEY (`tbl_jugador_pk_id`)
    REFERENCES `sc_u`.`tbl_jugador` (`pk_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `sc_u`.`tbl_oc_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sc_u`.`tbl_oc_producto` ;

CREATE TABLE IF NOT EXISTS `sc_u`.`tbl_oc_producto` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cantidad` INT(11) NULL,
  `valor_venta` DOUBLE NULL,
  `usuario_id` INT(11) NULL,
  `orden_compra_id` INT(11) NULL,
  `orden_compra_id1` INT(11) NULL,
  `producto_id` INT(11) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_oc_producto_usuario1_idx` (`usuario_id` ASC) ,
  INDEX `fk_oc_producto_orden_compra1_idx` (`orden_compra_id1` ASC) ,
  INDEX `fk_oc_producto_producto1_idx` (`producto_id` ASC) ,
  CONSTRAINT `fk_oc_producto_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sc_u`.`tbl_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oc_producto_inventario1`
    FOREIGN KEY (`orden_compra_id`)
    REFERENCES `sc_u`.`tbl_inventario` (`oc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oc_producto_orden_compra1`
    FOREIGN KEY (`orden_compra_id1`)
    REFERENCES `sc_u`.`tbl_orden_compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oc_producto_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `sc_u`.`tbl_producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Insert dates table usuario
-- -----------------------------------------------------
INSERT INTO `sc_u`.`tbl_usuario` (`id`, `primero_nombre`, `segundo_nombre`, `primero_apellido`, `segundo_apellido`, `email`, `pass`) VALUES ('1', 'Carlos', 'Francisco', 'Velasquez', 'Fuentes', 'carlosf@gmail.com', 'carlosf');
INSERT INTO `sc_u`.`tbl_usuario` (`id`, `primero_nombre`, `segundo_nombre`, `primero_apellido`, `segundo_apellido`, `email`, `pass`) VALUES ('2', 'Julian', 'Andrés ', 'Ortíz', 'Gil', 'jhulians@gmail.com', 'jhulians');
INSERT INTO `sc_u`.`tbl_usuario` (`id`, `primero_nombre`, `segundo_nombre`, `primero_apellido`, `segundo_apellido`, `email`, `pass`) VALUES ('3', 'Deisy', 'Jhurany', 'Gutierrez', 'Torres', 'deisy123@gmail.com', 'deisy123');
INSERT INTO `sc_u`.`tbl_usuario` (`id`, `primero_nombre`, `primero_apellido`, `segundo_apellido`, `email`, `pass`) VALUES ('4', 'Daniela', 'Cruz', 'Jiménez', 'danik@gmail.com', 'danik');
INSERT INTO `sc_u`.`tbl_usuario` (`id`, `primero_nombre`, `segundo_nombre`, `primero_apellido`, `segundo_apellido`, `email`, `pass`) VALUES ('5', 'Dayanna', 'Kimily', 'Leal', 'Rodriguez', 'dayanna@gmail.com', 'daykim');

-- -----------------------------------------------------
-- Insert dates table rol_usuario
-- -----------------------------------------------------
-- 1= administrador 2-entrenador 3=acudiente pro 4=acudiente lite 5=jugador
INSERT INTO `sc_u`.`tbl_rol_usuario` (`id`, `tipo_usuario`, `descripcion`) VALUES ('1', '1', 'administrador');
INSERT INTO `sc_u`.`tbl_rol_usuario` (`id`, `tipo_usuario`, `descripcion`) VALUES ('2', '2', 'entrenador');
INSERT INTO `sc_u`.`tbl_rol_usuario` (`id`, `tipo_usuario`, `descripcion`) VALUES ('3', '2', 'entrenador');
INSERT INTO `sc_u`.`tbl_rol_usuario` (`id`, `tipo_usuario`, `descripcion`) VALUES ('4', '3', 'acudiente pro');
INSERT INTO `sc_u`.`tbl_rol_usuario` (`id`, `tipo_usuario`, `descripcion`) VALUES ('5', '4', 'acudiente lite');

-- -----------------------------------------------------
-- Insert dates table télefono usuario
-- -----------------------------------------------------
INSERT INTO `sc_u`.`tbl_telefono_usuario` (`id`, `Usuario_id`, `numero_telefono`) VALUES ('1', '1', '3785079');
INSERT INTO `sc_u`.`tbl_telefono_usuario` (`id`, `Usuario_id`, `numero_telefono`) VALUES ('2', '2', '5365157');
INSERT INTO `sc_u`.`tbl_telefono_usuario` (`id`, `Usuario_id`, `numero_telefono`) VALUES ('3', '3', '4836520');
INSERT INTO `sc_u`.`tbl_telefono_usuario` (`id`, `Usuario_id`, `numero_telefono`) VALUES ('4', '4', '5376354');
INSERT INTO `sc_u`.`tbl_telefono_usuario` (`id`, `Usuario_id`, `numero_telefono`) VALUES ('5', '5', '7799997');

-- -----------------------------------------------------
-- Insert dates table identificación usuario
-- -----------------------------------------------------
INSERT INTO `sc_u`.`tbl_identificacion` (`id`, `tbl_usuario_id`, `tipo_documento`, `num_identidad`, `edad`) VALUES ('1', '1', 'Cédula de ciudadania', '19419412', '47');
INSERT INTO `sc_u`.`tbl_identificacion` (`id`, `tbl_usuario_id`, `tipo_documento`, `num_identidad`, `edad`) VALUES ('2', '2', 'Cédula extrangera', 'V- 1010433441', '36');
INSERT INTO `sc_u`.`tbl_identificacion` (`id`, `tbl_usuario_id`, `tipo_documento`, `num_identidad`, `edad`) VALUES ('3', '3', 'Pasaporte', '23582537', '38');
INSERT INTO `sc_u`.`tbl_identificacion` (`id`, `tbl_usuario_id`, `tipo_documento`, `num_identidad`, `edad`) VALUES ('4', '4', 'Cédula de ciudadania', '1000464415', '20');
INSERT INTO `sc_u`.`tbl_identificacion` (`id`, `tbl_usuario_id`, `tipo_documento`, `num_identidad`, `edad`) VALUES ('5', '5', 'Cédula de ciudadania', '1000472512', '19');
