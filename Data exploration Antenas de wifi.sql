
//Analisis del listado de puntos de acceso a internet de la Red WiFi de 'País Digital' 
//que brinda acceso gratuito a internet en espacios y dependencias públicas en Argentina
//Fuente de descarga del dataset: https://www.datos.gob.ar/dataset/jgm-puntos-wifi-pais-digital

USE [PuntosWifi]
GO



-- Cantidad de antenas y cantidad de municipios cubiertos por provincia

SELECT  provincia
	,COUNT(id) cant_antenas
	,COUNT (DISTINCT municipio) 'municipios cubiertos'
  FROM [conectiwidad-wifi]
  GROUP BY provincia
  ORDER BY cant_antenas DESC
  
  
  

-- Listado de Provincia, Municipio, ubicacion e identificidador de antena

SELECT  provincia
	,municipio
	,ubicacion
	,identificador
FROM [conectiwidad-wifi]
ORDER BY provincia





-- Antenas en plazas y parques

SELECT  provincia
	,municipio
	,ubicacion plazas_parques
	,identificador
FROM [conectiwidad-wifi]
WHERE ubicacion LIKE '%plaza%' 
OR ubicacion LIKE '%pza%' 
OR ubicacion LIKE '%parque%'
ORDER BY provincia





-- Antenas en Puntos digitales
SELECT  provincia
	,municipio
	,ubicacion puntos_digitales
	,identificador
FROM [conectiwidad-wifi]
WHERE ubicacion LIKE '%PD%'
OR ubicacion LIKE '%punto%'
ORDER BY provincia





-- Cantidad de antenas por municipio y porcentaje del total provincial
SELECT  provincia
	,municipio
	,COUNT(id) antenas_por_municipio
	,CONVERT(decimal(5,2),COUNT(id)) * 100 / CONVERT(decimal(5,2),SUM(COUNT(id))
		OVER (Partition by provincia)) 'Porcentaje de la provincia'

  FROM [dbo].[conectiwidad-wifi]
  GROUP BY provincia,municipio
  ORDER BY provincia, antenas_por_municipio DESC






-- Latitud y longitud de cada antena

SELECT  identificador
	,latitud
	,longitud
FROM [conectiwidad-wifi]
WHERE latitud != 0
AND longitud != 0
ORDER BY identificador





-- Listado de antenas con latitud y longitud indefinida

SELECT  identificador
	,latitud,longitud
FROM [conectiwidad-wifi]
WHERE latitud = 0
AND longitud = 0
ORDER BY identificador

-- Cuenta de antenas por provincia
SELECT  provincia
	,municipio
	,SUM(COUNT(DISTINCT identificador)) 
		OVER (Partition by provincia order by municipio) 'suma_cant_antenas'

  FROM [dbo].[conectiwidad-wifi]
  GROUP BY provincia,municipio
  ORDER BY provincia,suma_cant_antenas


--SELECT * FROM [conectiwidad-wifi] order by id
