# 🌌 Universe Database

Script SQL de la base de datos "Universe" del proyecto **Build a Celestial Bodies Database** del currículo [Relational Database de freeCodeCamp](https://www.freecodecamp.org/).

## Esquema

Cinco tablas de cuerpos celestes relacionadas:

| Tabla | Descripción |
|---|---|
| `galaxy` | Galaxias con número de brazos/cúmulo, edad |
| `star` | Estrellas, referencian a su galaxia (`galaxy_id`) |
| `planet` | Planetas, referencian a su estrella (`star_id`), tipos, lunas |
| `moon` | Lunas, referencian a su planeta (`planet_id`) |
| `star_types` / tipos | Categorización de cuerpos |

Cada tabla incluye `PRIMARY KEY`, claves foráneas y columnas con datos numéricos/booleanos/texto.

## Conceptos practicados

- Diseño de esquema con relaciones 1:N en cadena (galaxy → star → planet → moon)
- `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `SERIAL`
- Tipos de datos PostgreSQL (`NUMERIC`, `BOOLEAN`, `TEXT`, `INT`)

## Restaurar

```bash
psql -U postgres < universe.sql
```
