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

DROP TABLE IF EXISTS `mydb`.`Proveedor` ;

-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Empresa` ;

-- -----------------------------------------------------
-- Table `mydb`.`UnidadNegocio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UnidadNegocio` ;

-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Compra` ;

-- -----------------------------------------------------
-- Table `mydb`.`MedioPago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MedioPago` ;

-- -----------------------------------------------------
-- Table `mydb`.`PagoCompra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PagoCompra` ;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Empleado` ;



-- -----------------------------------------------------
-- Table `mydb`.`Venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Venta` ;



-- -----------------------------------------------------
-- Table `mydb`.`PagoVenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PagoVenta` ;

-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Producto` ;



-- -----------------------------------------------------
-- Table `mydb`.`VentaProducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`VentaProducto` ;



-- -----------------------------------------------------
-- Table `mydb`.`CompraProducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CompraProducto` ;



-- -----------------------------------------------------
-- Table `mydb`.`EvaluacionEmpleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EvaluacionEmpleado` ;



-- -----------------------------------------------------
-- Table `mydb`.`MovimientoInventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MovimientoInventario` ;



-- -----------------------------------------------------
-- Table `mydb`.`PagoNomina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PagoNomina` ;



-- -----------------------------------------------------
-- Table `mydb`.`Cuenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cuenta` ;



-- -----------------------------------------------------
-- Table `mydb`.`MovimientoCuenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MovimientoCuenta` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gasto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Gasto` ;

CREATE TABLE Venta (id INT AUTO_INCREMENT NOT NULL, empleado_id INT DEFAULT NULL, unidadnegocio_id INT DEFAULT NULL, fechaInicio DATETIME DEFAULT NULL, fechaFin DATETIME DEFAULT NULL, cantidad INT DEFAULT NULL, descuento NUMERIC(2, 2) DEFAULT NULL, importeNeto NUMERIC(11, 2) DEFAULT NULL, liquidado TINYINT(1) NOT NULL, INDEX IDX_4E26C151952BE730 (empleado_id), INDEX IDX_4E26C151C7FF8B89 (unidadnegocio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE MovimientoInventario (id INT AUTO_INCREMENT NOT NULL, producto_id INT DEFAULT NULL, tipo VARCHAR(45) DEFAULT NULL, fecha DATETIME DEFAULT NULL, cantidad INT DEFAULT NULL, INDEX IDX_ABAA9D047645698E (producto_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE MedioPago (id INT AUTO_INCREMENT NOT NULL, nombreMedio VARCHAR(45) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE Compra (id INT AUTO_INCREMENT NOT NULL, proveedor_id INT DEFAULT NULL, unidadnegocio_id INT DEFAULT NULL, fecha DATETIME DEFAULT NULL, cantidad INT DEFAULT NULL, descuento NUMERIC(2, 2) DEFAULT NULL, importeNeto NUMERIC(11, 2) DEFAULT NULL, liquidado TINYINT(1) NOT NULL, INDEX IDX_996D34C9CB305D73 (proveedor_id), INDEX IDX_996D34C9C7FF8B89 (unidadnegocio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE Producto (id INT AUTO_INCREMENT NOT NULL, SKU VARCHAR(45) DEFAULT NULL, nombreProducto VARCHAR(45) DEFAULT NULL, descripcion VARCHAR(45) DEFAULT NULL, tags VARCHAR(45) DEFAULT NULL, costo NUMERIC(11, 2) DEFAULT NULL, precio NUMERIC(11, 2) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE producto_venta (producto_id INT NOT NULL, venta_id INT NOT NULL, INDEX IDX_CFC0E63F7645698E (producto_id), INDEX IDX_CFC0E63FF2A5805D (venta_id), PRIMARY KEY(producto_id, venta_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE producto_compra (producto_id INT NOT NULL, compra_id INT NOT NULL, INDEX IDX_33E69EB17645698E (producto_id), INDEX IDX_33E69EB1F2E704D7 (compra_id), PRIMARY KEY(producto_id, compra_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE UnidadNegocio (id INT AUTO_INCREMENT NOT NULL, empresa_id INT DEFAULT NULL, nombre VARCHAR(45) DEFAULT NULL, INDEX IDX_11674F7C521E1991 (empresa_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE Empleado (id INT AUTO_INCREMENT NOT NULL, RFC VARCHAR(45) DEFAULT NULL, CURP VARCHAR(45) DEFAULT NULL, CLABE VARCHAR(45) DEFAULT NULL, puesto VARCHAR(45) DEFAULT NULL, salario NUMERIC(11, 2) DEFAULT NULL, fechaIngreso DATETIME DEFAULT NULL, tipoJornada VARCHAR(45) DEFAULT NULL, activo TINYINT(1) NOT NULL, comision VARCHAR(45) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE MovimientoCuenta (id INT AUTO_INCREMENT NOT NULL, cuenta_id INT DEFAULT NULL, monto VARCHAR(45) DEFAULT NULL, tipoMovimiento VARCHAR(45) DEFAULT NULL, INDEX IDX_AAB4B9A89AEFF118 (cuenta_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE EvaluacionEmpleado (id INT AUTO_INCREMENT NOT NULL, empleado_id INT DEFAULT NULL, fechaEvaluacion DATETIME DEFAULT NULL, calificacion INT DEFAULT NULL, INDEX IDX_523298B0952BE730 (empleado_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE PagoNomina (id INT AUTO_INCREMENT NOT NULL, empleado_id INT DEFAULT NULL, fecha VARCHAR(45) DEFAULT NULL, monto NUMERIC(11, 2) DEFAULT NULL, INDEX IDX_D7E7AD61952BE730 (empleado_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE Cuenta (id INT AUTO_INCREMENT NOT NULL, unidadnegocio_id INT DEFAULT NULL, nombre VARCHAR(45) DEFAULT NULL, INDEX IDX_366BBAF9C7FF8B89 (unidadnegocio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE Proveedor (id INT AUTO_INCREMENT NOT NULL, RFC VARCHAR(45) DEFAULT NULL, razonSocial VARCHAR(45) DEFAULT NULL, calificacion INT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE PagoCompra (id INT AUTO_INCREMENT NOT NULL, mediopago_id INT DEFAULT NULL, compra_id INT DEFAULT NULL, fecha DATETIME DEFAULT NULL, importePago NUMERIC(11, 2) DEFAULT NULL, INDEX IDX_9EF97B1D333BECEF (mediopago_id), INDEX IDX_9EF97B1DF2E704D7 (compra_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE PagoVenta (id INT AUTO_INCREMENT NOT NULL, venta_id INT DEFAULT NULL, fecha DATETIME DEFAULT NULL, importePago NUMERIC(11, 2) DEFAULT NULL, INDEX IDX_B7AD0C55F2A5805D (venta_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE Empresa (id INT AUTO_INCREMENT NOT NULL, razonSocial VARCHAR(45) DEFAULT NULL, RFC VARCHAR(45) DEFAULT NULL, giro VARCHAR(45) DEFAULT NULL, fechaApertura VARCHAR(45) DEFAULT NULL, direccion VARCHAR(45) DEFAULT NULL, CP VARCHAR(45) DEFAULT NULL, email VARCHAR(45) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE Gasto (id INT AUTO_INCREMENT NOT NULL, unidadnegocio_id INT DEFAULT NULL, concepto VARCHAR(45) DEFAULT NULL, fecha DATETIME DEFAULT NULL, monto NUMERIC(11, 2) DEFAULT NULL, comprobante VARCHAR(45) DEFAULT NULL, INDEX IDX_6F82F510C7FF8B89 (unidadnegocio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
ALTER TABLE Venta ADD CONSTRAINT FK_4E26C151952BE730 FOREIGN KEY (empleado_id) REFERENCES Empleado (id);
ALTER TABLE Venta ADD CONSTRAINT FK_4E26C151C7FF8B89 FOREIGN KEY (unidadnegocio_id) REFERENCES UnidadNegocio (id);
ALTER TABLE MovimientoInventario ADD CONSTRAINT FK_ABAA9D047645698E FOREIGN KEY (producto_id) REFERENCES Producto (id);
ALTER TABLE Compra ADD CONSTRAINT FK_996D34C9CB305D73 FOREIGN KEY (proveedor_id) REFERENCES Proveedor (id);
ALTER TABLE Compra ADD CONSTRAINT FK_996D34C9C7FF8B89 FOREIGN KEY (unidadnegocio_id) REFERENCES UnidadNegocio (id);
ALTER TABLE producto_venta ADD CONSTRAINT FK_CFC0E63F7645698E FOREIGN KEY (producto_id) REFERENCES Producto (id) ON DELETE CASCADE;
ALTER TABLE producto_venta ADD CONSTRAINT FK_CFC0E63FF2A5805D FOREIGN KEY (venta_id) REFERENCES Venta (id) ON DELETE CASCADE;
ALTER TABLE producto_compra ADD CONSTRAINT FK_33E69EB17645698E FOREIGN KEY (producto_id) REFERENCES Producto (id) ON DELETE CASCADE;
ALTER TABLE producto_compra ADD CONSTRAINT FK_33E69EB1F2E704D7 FOREIGN KEY (compra_id) REFERENCES Compra (id) ON DELETE CASCADE;
ALTER TABLE UnidadNegocio ADD CONSTRAINT FK_11674F7C521E1991 FOREIGN KEY (empresa_id) REFERENCES Empresa (id);
ALTER TABLE MovimientoCuenta ADD CONSTRAINT FK_AAB4B9A89AEFF118 FOREIGN KEY (cuenta_id) REFERENCES Cuenta (id);
ALTER TABLE EvaluacionEmpleado ADD CONSTRAINT FK_523298B0952BE730 FOREIGN KEY (empleado_id) REFERENCES Empleado (id);
ALTER TABLE PagoNomina ADD CONSTRAINT FK_D7E7AD61952BE730 FOREIGN KEY (empleado_id) REFERENCES Empleado (id);
ALTER TABLE Cuenta ADD CONSTRAINT FK_366BBAF9C7FF8B89 FOREIGN KEY (unidadnegocio_id) REFERENCES UnidadNegocio (id);
ALTER TABLE PagoCompra ADD CONSTRAINT FK_9EF97B1D333BECEF FOREIGN KEY (mediopago_id) REFERENCES MedioPago (id);
ALTER TABLE PagoCompra ADD CONSTRAINT FK_9EF97B1DF2E704D7 FOREIGN KEY (compra_id) REFERENCES Compra (id);
ALTER TABLE PagoVenta ADD CONSTRAINT FK_B7AD0C55F2A5805D FOREIGN KEY (venta_id) REFERENCES Venta (id);
ALTER TABLE Gasto ADD CONSTRAINT FK_6F82F510C7FF8B89 FOREIGN KEY (unidadnegocio_id) REFERENCES UnidadNegocio (id);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
