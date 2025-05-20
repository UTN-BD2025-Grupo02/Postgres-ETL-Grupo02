SELECT clae6_desc, 
ROUND(proporcion_mujeres*100) AS proporcion_mujeres
FROM public.distribucion_establecimientos
INNER JOIN public.actividades_establecimientos
ON actividades_establecimientos.clae6 = distribucion_establecimientos.clae6;