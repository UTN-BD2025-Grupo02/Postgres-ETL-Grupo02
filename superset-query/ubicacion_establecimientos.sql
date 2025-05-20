SELECT nombre, lon , lat
FROM public.distribucion_establecimientos
INNER JOIN public.provincia
ON distribucion_establecimientos.provincia_id = provincia.id;  
