SELECT zona, COUNT(IF (vacuna_mayor_60 = 'S', 1, NULL)) AS vacuna_mayor_60,
COUNT(IF (vacuna_50_60 = 'S', 1, NULL)) AS vacuna_50_60
FROM encuesta
GROUP BY zona;

SELECT zona, COUNT(IF (vacuna_mayor_60 = 'N', 1, NULL)) AS vacuna_mayor_60,
COUNT(IF (vacuna_50_60 = 'N', 1, NULL)) AS vacuna_50_60
FROM encuesta
GROUP BY zona;

SELECT t2.nombre AS centro, COUNT(*) AS total
FROM encuesta t1
INNER JOIN centro_salud t2
ON t1.centro_salud = t2.id
GROUP BY centro
ORDER BY total DESC;

SELECT CONCAT(t2.nombre, ' ', t2.apellido) AS persona, COUNT(*) AS total
FROM encuesta t1
INNER JOIN usuario t2
ON t1.registrado_por = t2.id
GROUP BY persona
ORDER BY total DESC;