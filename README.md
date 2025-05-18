# Postgres-ETL
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
hola
