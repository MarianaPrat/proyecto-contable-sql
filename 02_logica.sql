-- Vista para visualizar el Libro Diario con nombres de cuentas
CREATE VIEW v_libro_diario AS
SELECT 
    m.fecha_movimiento, 
    c.nombre AS nombre_cuenta, 
    c.tipo,
    m.descripcion, 
    m.monto
FROM Movimientos m
JOIN Cuentas c ON m.codigo_cuenta = c.codigo;

-- Procedimiento para registrar asientos contables (partida doble)
-- Garantiza atomicidad: si falla cualquiera de los dos movimientos, no se registra ninguno
DELIMITER //
CREATE PROCEDURE sp_registrar_asiento (
    IN p_cuenta_debe  VARCHAR(30),
    IN p_cuenta_haber VARCHAR(30),
    IN p_monto        DECIMAL(10,2),
    IN p_descripcion  VARCHAR(255),
    IN p_fecha        DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
        INSERT INTO Movimientos (codigo_cuenta, monto, descripcion, fecha_movimiento)
        VALUES (p_cuenta_debe, p_monto, p_descripcion, p_fecha);

        INSERT INTO Movimientos (codigo_cuenta, monto, descripcion, fecha_movimiento)
        VALUES (p_cuenta_haber, p_monto * -1, p_descripcion, p_fecha);
    COMMIT;
END //
DELIMITER ;
