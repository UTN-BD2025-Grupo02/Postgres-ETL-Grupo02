SELECT 
  clae6_desc,
  'Mujeres' AS genero,
  ROUND(proporcion_mujeres * 100) AS porcentaje
FROM public.distribucion_establecimientos
INNER JOIN public.actividades_establecimientos
  ON actividades_establecimientos.clae6 = distribucion_establecimientos.clae6

UNION ALL

SELECT 
  clae6_desc,
  'Hombres' AS genero,
  ROUND((1 - proporcion_mujeres) * 100) AS porcentaje
FROM public.distribucion_establecimientos
INNER JOIN public.actividades_establecimientos
  ON actividades_establecimientos.clae6 = distribucion_establecimientos.clae6;
