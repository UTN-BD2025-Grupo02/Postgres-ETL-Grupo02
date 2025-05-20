SELECT provincia.nombre AS nombre_provincia, departamento.nombre AS nombre_departamento, clae6_desc
FROM public.distribucion_establecimientos

INNER JOIN public.departamento
ON departamento.id = distribucion_establecimientos.in_departamentos

INNER JOIN public.provincia 
ON provincia.id = distribucion_establecimientos.provincia_id

INNER JOIN public.actividades_establecimientos
ON distribucion_establecimientos.clae6 = actividades_establecimientos.clae6;