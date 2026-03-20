Desarrollé este proyecto para aplicar SQL en un contexto contable real, 
combinando mi formación en Contabilidad con lo que estoy aprendiendo en 
análisis de datos.

# Sistema de Gestión Contable en SQL

Base de datos relacional para el registro y análisis de movimientos contables,
implementando el principio de partida doble con garantías de integridad transaccional.

## Estructura del repositorio

| Archivo | Contenido |
|---|---|
| `01_tablas.sql` | Creación de tablas y constraints |
| `02_logica.sql` | Vista del Libro Diario y procedimiento de registro |
| `03_reportes.sql` | Balance de sumas y saldos + reporte con semáforo |
| `04_datos.sql` | Datos de ejemplo para pruebas |

## Modelo de datos

**Cuentas** — Plan de cuentas con validación de tipo (Activo, Pasivo, 
Patrimonio Neto, Ingreso, Egreso).  
**Movimientos** — Registros contables vinculados a cuentas mediante FK.

## Decisiones de diseño

**Partida doble garantizada por transacción:** el procedimiento 
`sp_registrar_asiento` registra el debe y el haber en una única transacción.
Si cualquiera de los dos INSERT falla, se ejecuta un ROLLBACK automático y 
ningún movimiento queda registrado. Esto hace imposible romper el equilibrio 
contable desde la capa de base de datos.

**Separación de reportes por naturaleza de cuenta:** los reportes filtran 
por tipo de cuenta para evitar comparar saldos de distinta naturaleza 
(patrimonial vs. resultados).

## Herramientas
MySQL · SQL · Stored Procedures · Views · CTEs · Transactions
