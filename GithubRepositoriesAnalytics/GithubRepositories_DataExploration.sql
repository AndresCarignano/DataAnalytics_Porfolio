
-- Source of database: https://www.kaggle.com/datasets/joonasyoon/github-topics
USE [Github_Topics_and_Repositories_2022]
GO




-- Number of repositories by owner and type of owner
SELECT owner, owner_type, COUNT(name) cantidad
  FROM [dbo].[repositories]
  GROUP BY [owner],owner_type
  order by owner_type, cantidad DESC;
  



-- Repositories by language
SELECT language, COUNT(name) cantidad
  FROM [dbo].[repositories]
  GROUP BY language
  order by cantidad DESC;




-- Number of repositories onwed by organizations
SELECT owner, COUNT(name) cantidad
  FROM dbo.repositories
  WHERE owner_type LIKE 'Organization'
  GROUP BY owner
  ORDER BY cantidad DESC;




-- Number of repositories onwed by users
SELECT owner, COUNT(name) cantidad
  FROM dbo.repositories
  WHERE owner_type LIKE 'User'
  GROUP BY owner
  ORDER BY cantidad DESC;




-- Repositories created by year for each programing language
SELECT language,COUNT(r.name) cantidad,YEAR(r.created_at) año
  FROM [dbo].[repositories] r
  GROUP BY language, YEAR(r.created_at)




-- Same as last one but using CTEs to create table
WITH Año2008 AS(
SELECT DISTINCT language,COUNT(language) '2008'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2008
  GROUP BY language),
  
  Año2009 as(
  SELECT DISTINCT language,COUNT(language) '2009'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2009
  GROUP BY language),

  Año2010 as(
  SELECT DISTINCT language,COUNT(language) '2010'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2010
  GROUP BY language),

  Año2011 as(
  SELECT DISTINCT language,COUNT(language) '2011'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2011
  GROUP BY language),

  Año2012 as(
  SELECT DISTINCT language,COUNT(language) '2012'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2012
  GROUP BY language),

  Año2013 as(
  SELECT DISTINCT language,COUNT(language) '2013'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2013
  GROUP BY language),

  Año2014 as(
  SELECT DISTINCT language,COUNT(language) '2014'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2014
  GROUP BY language),

  Año2015 as(
  SELECT DISTINCT language,COUNT(language) '2015'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2015
  GROUP BY language),

  Año2016 as(
  SELECT DISTINCT language,COUNT(language) '2016'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2016
  GROUP BY language),

  Año2017 as(
  SELECT DISTINCT language,COUNT(language) '2017'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2017
  GROUP BY language),

  Año2018 as(
  SELECT DISTINCT language,COUNT(language) '2018'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2018
  GROUP BY language),

  Año2019 as(
  SELECT DISTINCT language,COUNT(language) '2019'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2019
  GROUP BY language),

  Año2020 as(
  SELECT DISTINCT language,COUNT(language) '2020'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2020
  GROUP BY language),

  Año2021 as(
  SELECT DISTINCT language,COUNT(language) '2021'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2021
  GROUP BY language),

  Año2022 as(
  SELECT DISTINCT language,COUNT(language) '2022'
  FROM [dbo].[repositories]
  WHERE YEAR(created_at) = 2022
  GROUP BY language)

SELECT DISTINCT TOP(10)  r.language
	, Año2008.[2008]
	, Año2009.[2009]
	, Año2010.[2010]
	, Año2011.[2011]
	, Año2012.[2012]
	, Año2013.[2013]
	, Año2014.[2014]
	, Año2015.[2015]
	, Año2016.[2016]
	, Año2017.[2017]
	, Año2018.[2018]
	, Año2019.[2019]
	, Año2020.[2020]
	, Año2021.[2021]
	, Año2022.[2022]
	, count(r.name) Total

FROM  repositories r

FULL OUTER JOIN Año2008 on r.language = Año2008.language
FULL OUTER JOIN Año2009 on r.language = Año2009.language
FULL OUTER JOIN Año2010 on r.language = Año2010.language
FULL OUTER JOIN Año2011 on r.language = Año2011.language
FULL OUTER JOIN Año2012 on r.language = Año2012.language
FULL OUTER JOIN Año2013 on r.language = Año2013.language
FULL OUTER JOIN Año2014 on r.language = Año2014.language
FULL OUTER JOIN Año2015 on r.language = Año2015.language
FULL OUTER JOIN Año2016 on r.language = Año2016.language
FULL OUTER JOIN Año2017 on r.language = Año2017.language
FULL OUTER JOIN Año2018 on r.language = Año2018.language
FULL OUTER JOIN Año2019 on r.language = Año2019.language
FULL OUTER JOIN Año2020 on r.language = Año2020.language
FULL OUTER JOIN Año2021 on r.language = Año2021.language
FULL OUTER JOIN Año2022 on r.language = Año2022.language

WHERE  r.language IS NOT NULL

GROUP BY r.language
	, Año2008.[2008]
	, Año2009.[2009]
	, Año2010.[2010]
	, Año2011.[2011]
	, Año2012.[2012]
	, Año2013.[2013]
	, Año2014.[2014]
	, Año2015.[2015]
	, Año2016.[2016]
	, Año2017.[2017]
	, Año2018.[2018]
	, Año2019.[2019]
	, Año2020.[2020]
	, Año2021.[2021]
	, Año2022.[2022]


ORDER BY Total DESC

