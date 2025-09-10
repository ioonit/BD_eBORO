# Directorio de Script SQL
  Este directorio contiene los scripts SQL actualizados que se utilizan para la creación, 
  configuración y evolución de la base de datos del proyecto en el motor **PostgreSQL**.
  
# Finalidad

  El objetivo principal de este espacio es centralizar y versionar todos los scripts relacionados con:

# Finalidad

El objetivo principal de este espacio es centralizar y versionar todos los scripts relacionados con:

- La definición del esquema de base de datos (tablas, relaciones, claves primarias y foráneas).
- La creación de funciones, procedimientos almacenados y triggers.
- La inserción de datos iniciales necesarios para el funcionamiento del sistema.
- Las actualizaciones estructurales que se vayan aplicando durante el desarrollo.

## Organización

Cada script debe estar claramente nombrado y fechado, siguiendo una convención que facilite su identificación y trazabilidad. Ejemplo:

  * 10-09-2025_create_tables.sql
  * 12-09-2025_add_constraints.sql
  * 15-09-2025_create_index.sql

## Recomendaciones

- Validar cada script antes de subirlo, asegurando compatibilidad con PostgreSQL.
- Documentar brevemente al inicio de cada archivo qué cambios realiza.
- Evitar duplicidad de instrucciones y mantener consistencia en la nomenclatura.

---

Este directorio es importante para garantizar la integridad y evolución controlada de la base de datos. 
Cualquier modificación debe ser registrada y revisada con el responsable inmediato como parte del flujo de desarrollo.

