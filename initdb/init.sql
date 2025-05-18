DROP TABLE IF EXISTS public.distribucion_elementos;

DROP TABLE IF EXISTS public.actividades_establecimientos;

DROP TABLE IF EXISTS public.departamento;

DROP TABLE IF EXISTS public.provincia;


CREATE TABLE public.provincia (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR,
    nombre_completo VARCHAR,
    centroide_lat DOUBLE PRECISION,
    centroide_lon DOUBLE PRECISION,
    fuente VARCHAR,
    iso_id VARCHAR,
    iso_nombre VARCHAR,
    categoria VARCHAR
);

CREATE TABLE public.departamento (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR,
    provincia_id INTEGER REFERENCES public.provincia(id)
);

CREATE TABLE public.actividades_establecimientos (
    clae6 INTEGER PRIMARY KEY,
    clae2 INTEGER,
    letra VARCHAR,
    clae6_desc VARCHAR,
    clae2_desc VARCHAR,
    letra_desc VARCHAR
);

CREATE TABLE public.distribucion_establecimientos(
    cuit VARCHAR,
    sucursal INTEGER,
    anio INTEGER,
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    clae6 INTEGER,
    in_departamentos INTEGER,
    provincia_id INTEGER,
    quintil INTEGER,
    empleo VARCHAR, 
    proporcion_mujeres DOUBLE PRECISION,

    PRIMARY KEY (cuit,sucursal,anio),
    FOREIGN KEY (clae6) REFERENCES public.actividades_establecimientos(clae6),
    FOREIGN KEY (in_departamentos) REFERENCES public.departamento(id),
    FOREIGN KEY (provincia_id) REFERENCES public.provincia(id)
);



CREATE TEMP TABLE temp_provincia(
    categoria VARCHAR,
    centroide_lat VARCHAR,
    centroide_lon VARCHAR,
    fuente VARCHAR,
    id VARCHAR,
    iso_id VARCHAR,
    iso_nombre VARCHAR,
    nombre VARCHAR,
    nombre_completo VARCHAR
);

CREATE TEMP TABLE temp_departamento(
    provincia_id VARCHAR,
    in_departamentos VARCHAR,
    departamento VARCHAR,
    provincia VARCHAR,
);

CREATE TEMP TABLE tmep_actividades_establecimientos(
    clae6 VARCHAR,
    clae2 VARCHAR,
    letra VARCHAR,
    clae6_desc VARCHAR,
    clae2_desc VARCHAR,
    letra_desc VARCHAR
);

CREATE TEMP TABLE temp_distribucion_establecimientos(
    cuit VARCHAR,
    sucursal VARCHAR,
    anio VARCHAR,
    lat VARCHAR,
    lon VARCHAR,
    clae6 VARCHAR,
    in_departamentos VARCHAR,
    provincia_id VARCHAR,
    quintil VARCHAR,
    empleo VARCHAR, 
    proporcion_mujeres VARCHAR
);

COPY temp_provincia
    FROM '/datos/provincias.csv' DELIMITER ',' CSV HEADER;

COPY temp_departamento
    FROM '/datos/departamentos.csv' DELIMITER ',' CSV HEADER;

COPY temp_actividades_establecimientos
    FROM '/datos/actividades_establecimientos.csv' DELIMITER ',' CSV HEADER;

COPY temp_distribucion_establecimientos
    FROM '/datos/distribucion_establecimientos.csv' DELIMITER ',' CSV HEADER;



INSERT INTO public.provincia(
   id, nombre, nombre_completo, centroid_lat, centroid_lon, fuente, iso_id, iso_nombre, categoria 
)
SELECT
id:: INTEGER,
nombre,
nombre_completo,
centroid_lat:: DOUBLE PRECISION,
centroid_lon:: DOUBLE PRECISION,
fuente,
iso_id,
iso_nombre,
categoria 
FROM temp_provincia;



INSERT INTO public.departamento(
    id, nombre, provincia_id 
)
SELECT
in_departamentos:: INTEGER,
departamento,
provincia_id:: INTEGER 
FROM temp_departamento;



INSERT INTO public.actividades_establecimientos(
    clae6, clae2, letra, clae6_desc, clae2_desc, letra_desc
)
SELECT
clae6:: INTEGER,
clae2:: INTEGER,
letra,
clae6_desc,
clae2_desc,
letra_desc
FROM temp_actividades_establecimientos;



INSERT INTO public.distribucion_establecimientos(
    cuit,sucursal,anio,lat,lon,clae6,in_departamentos,provincia_id,quintil,empleo,proporcion_mujeres
)
SELECT
cuit,
sucursal:: INTEGER,
anio:: INTEGER,
lat:: DOUBLE PRECISION,
lon:: DOUBLE PRECISION,
clae6:: INTEGER,
in_departamentos:: INTEGER,
provincia_id:: INTEGER,
quintil:: INTEGER,
empleo,
proporcion_mujeres:: DOUBLE PRECISION
FROM temp_distribucion_establecimientos;
