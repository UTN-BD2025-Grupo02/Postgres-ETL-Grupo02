# **ETL para la carga de *`datasets`* de DENGUE en Argentina**

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Apache Superset](https://img.shields.io/badge/Apache_Superset-FF5733?style=for-the-badge&logo=apache-superset&logoColor=white)
![pgAdmin](https://img.shields.io/badge/pgAdmin-316192?style=for-the-badge&logo=postgresql&logoColor=white)

## **Descarga de Datasets**

Los datasets utilizados en este proyecto pueden descargarse desde el portal oficial de datos abiertos del gobierno de Argentina:  
[https://datos.gob.ar/dataset](https://datos.gob.ar/dataset)

Este portal proporciona información pública en formatos reutilizables, incluyendo datos relacionados con la Distribución geográfica de los establecimientos productivos en Argentina.

## **Resumen del Tutorial**

Este tutorial guía al usuario a través de los pasos necesarios para desplegar una infraestructura ETL utilizando Docker, PostgreSQL, Apache Superset y pgAdmin. Se incluyen instrucciones detalladas para:

1. Levantar los servicios con Docker.
2. Configurar la conexión a la base de datos en Apache Superset.
3. Ejecutar consultas SQL para analizar los datos de casos de dengue.
4. Crear gráficos y tableros interactivos para la visualización de datos.

## **Palabras Clave**

- Docker
- PostgreSQL
- Apache Superset
- pgAdmin
- ETL
- Visualización de Datos

## **Mantenido Por**

Grupo 02 - bases de Datos

## **Descargo de Responsabilidad**

El código proporcionado se ofrece "tal cual", sin garantía de ningún tipo, expresa o implícita. En ningún caso los autores o titulares de derechos de autor serán responsables de cualquier reclamo, daño u otra responsabilidad.

## **Descripción del Proyecto**

Este proyecto implementa un proceso ETL (Extract, Transform, Load) para la carga y análisis de datos relacionados con la Distribución geográfica de los establecimientos productivos en Argentina. Utiliza herramientas modernas como Docker, PostgreSQL, Apache Superset y pgAdmin para facilitar la gestión, análisis y visualización de datos.

El objetivo principal es proporcionar una solución escalable y reproducible para analizar datos de Distribución geográfica de los establecimientos productivos por grupo departamento, provincia y tipo de actividad, permitiendo la creación de tableros interactivos y gráficos personalizados.






















Este repositorio contiene los archivos para ejecutar un Repositorio docker con PostgreSQL, pgAdmin y Superset. El proyecto contiene datos de la Distribución geográfica de los establecimientos productivos. Esta información será cargada automaticamente a la base de datos durante su primera ejecución.
La infomracion fue obtenida de: [Datos Argentina](https://datos.gob.ar)
## Variables de entorno

Antes de la primer ejecucion, deberá crear un archivo .env en la carpeta raiz del proyecto con los siguientes datos:

### Variables de Postgres
`POSTGRES_USER`

`POSTGRES_PASSWORD`

### Variables de pgAdmin
`PGADMIN_EMAIL`

`PGADMIN_PASSWORD`

### Variables de Superset
`SUPERSET_SECRET_KEY`

## Primera Ejecución
Luego de configurar el archivo .env ejecute los siguientes comandos
```bash
  docker-compose up
  docker exec -it superset_etl bash -c "/script.sh"
```

