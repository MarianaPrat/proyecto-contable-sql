DROP TABLE IF EXISTS Movimientos;
DROP TABLE IF EXISTS Cuentas;

CREATE TABLE Cuentas(
codigo VARCHAR(30) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
tipo VARCHAR(30) NOT NULL,
CONSTRAINT chk_tipo CHECK (tipo IN ('Activo', 'Pasivo', 'Patrimonio Neto', 'Ingreso', 'Egreso')),
fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Movimientos(
id INT AUTO_INCREMENT PRIMARY KEY,
codigo_cuenta VARCHAR (30) NOT NULL,
monto DECIMAL(10,2) NOT NULL,
descripcion VARCHAR(255),
fecha_movimiento DATE NOT NULL,
FOREIGN KEY (codigo_cuenta) REFERENCES Cuentas(codigo)
);