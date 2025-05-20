SELECT provincia.nombre AS nombre_provincia, departamento.nombre AS nombre_departamento , lon , lat, clae6_desc
FROM public.distribucion_establecimientos
INNER JOIN public.provincia
ON distribucion_establecimientos.provincia_id = provincia.id

INNER JOIN public.actividades_establecimientos
ON distribucion_establecimientos.clae6 = actividades_establecimientos.clae6

INNER JOIN public.departamento 
ON distribucion_establecimientos.in_departamentos = departamento.id; 
