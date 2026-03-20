-- Datos de ejemplo: Plan de cuentas básico
INSERT INTO Cuentas (codigo, nombre, tipo) VALUES
('1.1.01', 'Caja',                    'Activo'),
('1.1.02', 'Banco Cuenta Corriente',  'Activo'),
('1.1.03', 'Clientes',                'Activo'),
('2.1.01', 'Proveedores',             'Pasivo'),
('2.1.02', 'Sueldos a Pagar',         'Pasivo'),
('3.1.01', 'Capital Social',          'Patrimonio Neto'),
('4.1.01', 'Ventas',                  'Ingreso'),
('5.1.01', 'Costo de Mercadería',     'Egreso'),
('5.1.02', 'Sueldos',                 'Egreso'),
('5.1.03', 'Alquiler',                'Egreso');

-- Asientos de ejemplo usando el procedimiento sp_registrar_asiento
-- Aporte inicial de capital
CALL sp_registrar_asiento('1.1.02', '3.1.01', 100000.00, 'Aporte inicial de capital', '2024-01-01');

-- Cobro a cliente
CALL sp_registrar_asiento('1.1.02', '1.1.03',  45000.00, 'Cobro factura cliente 001',  '2024-01-10');

-- Venta al contado
CALL sp_registrar_asiento('1.1.01', '4.1.01',  30000.00, 'Venta al contado',           '2024-01-15');

-- Pago de alquiler
CALL sp_registrar_asiento('5.1.03', '1.1.02',  18000.00, 'Pago alquiler enero',        '2024-01-20');

-- Pago de sueldos
CALL sp_registrar_asiento('5.1.02', '1.1.02',  55000.00, 'Pago sueldos enero',         '2024-01-31');

-- Compra a proveedor
CALL sp_registrar_asiento('5.1.01', '2.1.01',  22000.00, 'Compra mercadería fact 089', '2024-02-05');

-- Pago a proveedor
CALL sp_registrar_asiento('2.1.01', '1.1.02',  22000.00, 'Pago fact 089 proveedor',    '2024-02-10');
