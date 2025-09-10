# BD_eBORO
# B'ORO - Diseño y Modelado de Base de Datos
  Este repositorio contiene el diseño y modelado de la base de datos del sistema B'ORO, utilizada como backend de soporte para las aplicaciones Móvil y Web de la microfinanciera.
  La base de datos está orientada al procesamiento, gestión y control de la información relacionada con:
    * Prospecciones de clientes.
    * Gestión de cobranzas y visitas.
    * Georreferenciación de clientes y rutas de seguimiento.
    * Control de accesos y auditoría de transacciones.
    * El diseño fue realizado con la herramienta ER-Studio 19.1 y está implementado en PostgreSQL v16.8.
# Contenido del repositorio

  * /model/ → Archivo fuente del modelo en formato ER-Studio (.dm1).
  * /scripts/ → Script SQL generado por ingeniería inversa desde ER-Studio.
  * /docs/ → Documentación adicional del diseño y manuales de uso.

# Estructura de Tablas
  La base de datos se compone de las siguientes entidades principales:
  
  1. prospects → Información de prospectos en evaluación.
  2. customers → Registros de clientes capturados por promotores u oficiales de crédito.
  3. customers_file → Archivos asociados a la fase de prospección (PDFs, fotos, verificaciones).
  4. employee → Información de los empleados del sistema B'ORO.
  5. users → Usuarios del sistema, vinculados a empleados, para autenticación.
  6. roles → Roles de acceso dentro del sistema.
  7. permissions → Lista de permisos disponibles.
  8. user_roles → Relación entre usuarios y roles asignados.
  9. role_permissions → Relación entre roles y permisos asignados.
  10. customer_route_point → Waypoints de rutas asignadas a empleados.
  11. customer_visit_history → Historial de visitas realizadas a clientes.
  12. route_assignment → Asignación de rutas a empleados.
  13. user_devices → Información de dispositivos y tokens de acceso.
  14. audit_logs → Registro de auditoría de acciones del sistema.

# Requisitos
  
  * Herramienta de modelado: ER-Studio v19.1
  * Motor de base de datos: PostgreSQL v16.8
  * Sistema operativo recomendado: Windows 10/11 o Linux (para despliegue de PostgreSQL)

# Convenciones de Diseño

  * Nombres de tablas en minúsculas y plural (ej. customers).
  * Llaves primarias con convención id o <tabla>_id.
  * Llaves foráneas bajo el estándar: fk_<tabla_origen>_<tabla_referencia>.
  * Índices nombrados como: idx_<tabla>_<columna>.
  * Tablas intermedias con nombres compuestos por las tablas relacionadas (ej. user_roles).
  * Auditoría centralizada en la tabla audit_logs.

# Uso del repositorio
  1. Clonar el repositorio
    git clone https://github.com/<organizacion>/<repositorio>.git
  2. Abrir el archivo .dm1 en ER-STUDIO para modificar el diseño.
  3.aplicar o generar cambios en la base de datos utilizando el script SQL generado /script/

# Contribución
  Si desea proponer mejoras o realizar cambios significativos en el diseño de la base de datos:
  
  1. Crea una rama con el cambio.
  2. Aplica la modificación en ER-Studio y genera nuevamente el modelo físico de la base de datos para PostgreSQL.
  3. Exporta el modelo físico a un Script SQL
  4. Realiza un pull request, justificando el cambio.

# Licencia

  Este proyecto es propiedad de B'ORO Microfinanciera.
  El uso, reproducción o distribución de este diseño está restringido y requiere autorización previa.
