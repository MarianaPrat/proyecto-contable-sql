Sistema de base de datos para gestion contable y reportes

Descripción del proyecto
Este proyecto consiste en el diseño de una base de datos relacional orientada a la gestion de movimientos contables. El objetivo fue asegurar la integridad de los datos mediante el uso de transacciones y automatizar el registro de la partida doble para evitar errores manuales.

Herramientas utilizadas
Se utilizo MySQL para el motor de base de datos y SQL para el desarrollo de la estructura y la lógica. Se implementaron procedimientos almacenados, vistas, transacciones y expresiones de tabla comunes (CTEs).

Implementaciones técnicas

Estructura de datos
Se definieron las tablas de Cuentas y Movimientos vinculadas mediante claves foráneas. El diseño sigue principios de normalización para asegurar la consistencia de los datos y facilitar el mantenimiento del plan de cuentas.

Automatización y Transacciones
Se desarrollo el procedimiento sp_registrar_asiento que procesa el debe y el haber en una sola ejecución. El procedimiento incluye bloques de transacciones (START TRANSACTION y COMMIT) para garantizar la atomicidad; es decir, que los movimientos se registren en pareja o no se registren en caso de error, protegiendo la integridad del sistema.

Capa de consulta y abstracción
Se diseño la vista v_libro_diario que consolida la información de las tablas relacionadas. Esto permite realizar auditorias y consultas de movimientos de forma directa, ocultando la complejidad de los joins internos.

Logica de análisis
Se incluyo un reporte de gestion utilizando CTEs (WITH) y sentencias CASE para analizar el volumen de los movimientos. El script calcula promedios sobre valores absolutos para identificar desviaciones y categoriza las cuentas según su saldo, permitiendo identificar gastos críticos o niveles de superavit de forma automática.

Uso del repositorio
El script schema.sql contiene la creación de tablas, mientras que la lógica de operación se encuentra en los archivos de procedimientos y reportes. La carga de datos se realiza a traves del procedimiento almacenado para mantener los estándares de validación definidos.