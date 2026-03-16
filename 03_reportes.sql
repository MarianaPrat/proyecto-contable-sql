WITH Totales AS (
    SELECT c.nombre, SUM(m.monto) as saldo
    FROM Movimientos m
    JOIN Cuentas c ON m.codigo_cuenta = c.codigo
    GROUP BY c.nombre
)
SELECT nombre, saldo,
       CASE 
            WHEN saldo < -20000 THEN 'Gasto Critico'
            WHEN saldo < 0 THEN 'Gasto Moderado'
            ELSE 'Ingreso/Fondo'
       END AS semaforo
FROM Totales;