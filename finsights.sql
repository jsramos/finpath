-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Proveedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `RFC` VARCHAR(45) NULL,
  `razonSocial` VARCHAR(45) NULL,
  `calificacion` INT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Empresa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `idEmpresa` INT NOT NULL,
  `razonSocial` VARCHAR(45) NULL,
  `RFC` VARCHAR(45) NULL,
  `giro` VARCHAR(45) NULL,
  `fechaApertura` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `CP` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UnidadNegocio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UnidadNegocio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UnidadNegocio` (
  `idUnidadNegocio` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Empresa_idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idUnidadNegocio`, `Empresa_idEmpresa`),
  INDEX `fk_UnidadNegocio_Empresa1_idx` (`Empresa_idEmpresa` ASC),
  CONSTRAINT `fk_UnidadNegocio_Empresa1`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `mydb`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Compra` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `idCompra` INT NOT NULL,
  `fecha` DATETIME NULL,
  `cantidad` INT NULL,
  `descuento` DECIMAL(2,2) NULL,
  `importeNeto` DECIMAL(11,2) NULL,
  `liquidado` TINYINT(1) NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  `UnidadNegocio_idUnidadNegocio` INT NOT NULL,
  PRIMARY KEY (`idCompra`, `Proveedor_idProveedor`, `UnidadNegocio_idUnidadNegocio`),
  INDEX `fk_Compra_Proveedor1_idx` (`Proveedor_idProveedor` ASC),
  INDEX `fk_Compra_UnidadNegocio1_idx` (`UnidadNegocio_idUnidadNegocio` ASC),
  CONSTRAINT `fk_Compra_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `mydb`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_UnidadNegocio1`
    FOREIGN KEY (`UnidadNegocio_idUnidadNegocio`)
    REFERENCES `mydb`.`UnidadNegocio` (`idUnidadNegocio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MedioPago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MedioPago` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MedioPago` (
  `idMedioPago` INT NOT NULL,
  `nombreMedio` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedioPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PagoCompra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PagoCompra` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PagoCompra` (
  `idPagoCompra` INT NOT NULL,
  `fecha` DATETIME NULL,
  `importePago` DECIMAL(11,2) NULL,
  `MedioPago_idMedioPago` INT NOT NULL,
  `Compra_idCompra` INT NOT NULL,
  PRIMARY KEY (`idPagoCompra`, `MedioPago_idMedioPago`, `Compra_idCompra`),
  INDEX `fk_PagoCompra_MedioPago1_idx` (`MedioPago_idMedioPago` ASC),
  INDEX `fk_PagoCompra_Compra1_idx` (`Compra_idCompra` ASC),
  CONSTRAINT `fk_PagoCompra_MedioPago1`
    FOREIGN KEY (`MedioPago_idMedioPago`)
    REFERENCES `mydb`.`MedioPago` (`idMedioPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PagoCompra_Compra1`
    FOREIGN KEY (`Compra_idCompra`)
    REFERENCES `mydb`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Empleado` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  `RFC` VARCHAR(45) NULL,
  `CURP` VARCHAR(45) NULL,
  `CLABE` VARCHAR(45) NULL,
  `puesto` VARCHAR(45) NULL,
  `salario` DECIMAL(11,2) NULL,
  `fechaIngreso` DATETIME NULL,
  `tipoJornada` VARCHAR(45) NULL,
  `activo` TINYINT(1) NOT NULL,
  `comision` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Venta` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Venta` (
  `idVenta` INT NOT NULL,
  `fechaInicio` DATETIME NULL,
  `fechaFin` DATETIME NULL,
  `cantidad` INT NULL,
  `descuento` DECIMAL(2,2) NULL,
  `importeNeto` DECIMAL(11,2) NULL,
  `liquidado` TINYINT(1) NOT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  `UnidadNegocio_idUnidadNegocio` INT NOT NULL,
  PRIMARY KEY (`idVenta`, `Empleado_idEmpleado`, `UnidadNegocio_idUnidadNegocio`),
  INDEX `fk_Venta_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  INDEX `fk_Venta_UnidadNegocio1_idx` (`UnidadNegocio_idUnidadNegocio` ASC),
  CONSTRAINT `fk_Venta_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_UnidadNegocio1`
    FOREIGN KEY (`UnidadNegocio_idUnidadNegocio`)
    REFERENCES `mydb`.`UnidadNegocio` (`idUnidadNegocio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PagoVenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PagoVenta` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PagoVenta` (
  `idPagoVenta` INT NOT NULL,
  `fecha` DATETIME NULL,
  `importePago` DECIMAL(11,2) NULL,
  `Venta_idVenta` INT NOT NULL,
  PRIMARY KEY (`idPagoVenta`, `Venta_idVenta`),
  INDEX `fk_PagoVenta_Venta1_idx` (`Venta_idVenta` ASC),
  CONSTRAINT `fk_PagoVenta_Venta1`
    FOREIGN KEY (`Venta_idVenta`)
    REFERENCES `mydb`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Producto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `idProducto` INT NOT NULL,
  `SKU` VARCHAR(45) NULL,
  `nombreProducto` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `tags` VARCHAR(45) NULL,
  `costo` DECIMAL(11,2) NULL,
  `precio` DECIMAL(11,2) NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VentaProducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`VentaProducto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`VentaProducto` (
  `Producto_idProducto` INT NOT NULL,
  `Venta_idVenta` INT NOT NULL,
  PRIMARY KEY (`Producto_idProducto`, `Venta_idVenta`),
  INDEX `fk_VentaProducto_Venta1_idx` (`Venta_idVenta` ASC),
  CONSTRAINT `fk_VentaProducto_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VentaProducto_Venta1`
    FOREIGN KEY (`Venta_idVenta`)
    REFERENCES `mydb`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CompraProducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CompraProducto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CompraProducto` (
  `Producto_idProducto` INT NOT NULL,
  `Compra_idCompra` INT NOT NULL,
  PRIMARY KEY (`Producto_idProducto`, `Compra_idCompra`),
  INDEX `fk_CompraProducto_Compra1_idx` (`Compra_idCompra` ASC),
  CONSTRAINT `fk_CompraProducto_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CompraProducto_Compra1`
    FOREIGN KEY (`Compra_idCompra`)
    REFERENCES `mydb`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EvaluacionEmpleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EvaluacionEmpleado` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EvaluacionEmpleado` (
  `idEvaluacionEmpleado` INT NOT NULL,
  `fechaEvaluacion` DATETIME NULL,
  `calificacion` INT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idEvaluacionEmpleado`, `Empleado_idEmpleado`),
  INDEX `fk_EvaluacionEmpleado_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  CONSTRAINT `fk_EvaluacionEmpleado_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MovimientoInventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MovimientoInventario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MovimientoInventario` (
  `idMovimientoInventario` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `fecha` DATETIME NULL,
  `cantidad` INT NULL,
  `Producto_idProducto` INT NOT NULL,
  PRIMARY KEY (`idMovimientoInventario`, `Producto_idProducto`),
  INDEX `fk_MovimientoInventario_Producto1_idx` (`Producto_idProducto` ASC),
  CONSTRAINT `fk_MovimientoInventario_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `mydb`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PagoNomina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PagoNomina` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PagoNomina` (
  `idPagoNomina` INT NOT NULL,
  `fecha` VARCHAR(45) NULL,
  `monto` DECIMAL(11,2) NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idPagoNomina`, `Empleado_idEmpleado`),
  INDEX `fk_PagoNomina_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  CONSTRAINT `fk_PagoNomina_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `mydb`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cuenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cuenta` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cuenta` (
  `idCuenta` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `UnidadNegocio_idUnidadNegocio` INT NOT NULL,
  PRIMARY KEY (`idCuenta`, `UnidadNegocio_idUnidadNegocio`),
  INDEX `fk_Cuenta_UnidadNegocio1_idx` (`UnidadNegocio_idUnidadNegocio` ASC),
  CONSTRAINT `fk_Cuenta_UnidadNegocio1`
    FOREIGN KEY (`UnidadNegocio_idUnidadNegocio`)
    REFERENCES `mydb`.`UnidadNegocio` (`idUnidadNegocio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MovimientoCuenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MovimientoCuenta` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MovimientoCuenta` (
  `idMovimientoCuenta` INT NOT NULL,
  `monto` VARCHAR(45) NULL,
  `Cuenta_idCuenta` INT NOT NULL,
  `tipoMovimiento` VARCHAR(45) NULL,
  PRIMARY KEY (`idMovimientoCuenta`, `Cuenta_idCuenta`),
  INDEX `fk_MovimientoCuenta_Cuenta1_idx` (`Cuenta_idCuenta` ASC),
  CONSTRAINT `fk_MovimientoCuenta_Cuenta1`
    FOREIGN KEY (`Cuenta_idCuenta`)
    REFERENCES `mydb`.`Cuenta` (`idCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gasto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Gasto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Gasto` (
  `idGasto` INT NOT NULL,
  `concepto` VARCHAR(45) NULL,
  `fecha` DATETIME NULL,
  `monto` DECIMAL(11,2) NULL,
  `comprobante` VARCHAR(45) NULL,
  `UnidadNegocio_idUnidadNegocio` INT NOT NULL,
  PRIMARY KEY (`idGasto`, `UnidadNegocio_idUnidadNegocio`),
  INDEX `fk_Gasto_UnidadNegocio1_idx` (`UnidadNegocio_idUnidadNegocio` ASC),
  CONSTRAINT `fk_Gasto_UnidadNegocio1`
    FOREIGN KEY (`UnidadNegocio_idUnidadNegocio`)
    REFERENCES `mydb`.`UnidadNegocio` (`idUnidadNegocio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
