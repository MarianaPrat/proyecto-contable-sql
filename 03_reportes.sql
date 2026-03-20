-- Reporte 1: Saldos por cuenta (solo activos y pasivos)
-- Muestra el estado patrimonial con semáforo de alerta
WITH Totales AS (
    SELECT 
        c.nombre, 
        c.tipo,
        SUM(m.monto) AS saldo
    FROM Movimientos m
    JOIN Cuentas c ON m.codigo_cuenta = c.codigo
    WHERE c.tipo IN ('Activo', 'Pasivo')
    GROUP BY c.nombre, c.tipo
)
SELECT 
    nombre, 
    tipo,
    saldo,
    CASE 
        WHEN saldo < -20000 THEN 'Critico'
        WHEN saldo < 0      THEN 'Moderado'
        ELSE                     'Normal'
    END AS semaforo
FROM Totales
ORDER BY tipo, saldo;

-- Reporte 2: Balance de Sumas y Saldos
-- Muestra debe, haber y saldo neto por cuenta
SELECT
    c.codigo,
    c.nombre,
    c.tipo,
    SUM(CASE WHEN m.monto > 0 THEN m.monto ELSE 0 END)       AS total_debe,
    SUM(CASE WHEN m.monto < 0 THEN ABS(m.monto) ELSE 0 END)  AS total_haber,
    SUM(m.monto)                                               AS saldo_neto
FROM Cuentas c
LEFT JOIN Movimientos m ON c.codigo = m.codigo_cuenta
GROUP BY c.codigo, c.nombre, c.tipo
ORDER BY c.tipo, c.codigo;
