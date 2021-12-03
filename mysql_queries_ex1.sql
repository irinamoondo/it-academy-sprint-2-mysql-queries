-- DB TIENDA
USE tienda;

-- Tienda, Query 1
SELECT nombre
FROM producto;

-- Tienda, Query 2
SELECT nombre, precio
FROM producto;

-- TIENDA, query 3
SELECT *
FROM producto;

-- Tienda, Query 4
SELECT
	nombre,
    precio AS price_euro,
    precio * 1.14 AS price_usd -- Cambio actual: 1 EURO = 1 USD
FROM producto;

-- Tienda, Query 5
SELECT
	nombre AS 'nombre de producto',
    precio AS 'euros',
    precio * 1.14 AS 'dòlars nord-americans' -- Cambio actual: 1 EURO = 1 USD
FROM producto;

-- Tienda, Query 6
SELECT
	UPPER (nombre),
    precio
FROM producto;

-- Tienda, Query 7
SELECT
	LOWER (nombre),
    precio
FROM producto;

-- Tienda, Query 8
SELECT
	nombre AS fabricante,
	LEFT(nombre, 2) AS 'iniciales fabricante'
FROM fabricante;

-- Tienda, Query 9
SELECT
	nombre,
    ROUND(precio) AS 'precio redondo'
FROM producto;

-- Tienda, Query 10
SELECT
	nombre,
    TRUNCATE (precio, 0) AS 'precio sin decimales'
FROM producto;

-- Tienda, Query 11
SELECT codigo_fabricante
FROM producto;

-- Tienda, Query 12
SELECT DISTINCT codigo_fabricante
FROM producto;

-- Tienda, Query 13
SELECT nombre
FROM fabricante
ORDER BY nombre ASC; -- By default

-- Tienda, Query 14
SELECT nombre
FROM fabricante
ORDER BY nombre DESC;

-- Tienda, Query 15
SELECT nombre
FROM producto
ORDER BY nombre AND precio DESC;

-- Tienda, Query 16
SELECT *
FROM fabricante
LIMIT 5;

-- Tienda, Query 17
SELECT *
FROM fabricante
LIMIT 2 OFFSET 4;

-- Tienda, Query 18
SELECT nombre, precio
FROM producto
ORDER BY precio
LIMIT 1;

-- Tienda, Query 19
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- Tienda, Query 20
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

-- Tienda, Query 21
SELECT
	p.nombre,
    p.precio,
    f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;

-- Tienda, Query 22    
SELECT
	p.nombre,
    p.precio,
    f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
ORDER BY nombre_fabricante;

-- Tienda, Query 23
SELECT
	p.codigo AS codigo_producto,
    p.nombre AS nombre_producto,
    f.codigo AS codigo_fabricante,
    f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;

-- Tienda, Query 24
SELECT
    p.nombre AS nombre_producto,
    p.precio,
    f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

-- Tienda, Query 25
SELECT
    p.nombre AS nombre_producto,
    p.precio,
    f.nombre
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- Tienda, Query 26
SELECT p.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

-- Tienda, Query 27
SELECT p.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.codigo = 6 AND p.precio > 200;

-- Tienda, Query 28
SELECT
	p.codigo,
	p.nombre,
    f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre = "Asus" OR f.nombre = "Hewlett-Packard" OR f.nombre = "Seagate";

-- Tienda, Query 29
SELECT
	p.codigo,
	p.nombre,
	f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ("Asus", "Hewlett-Packard", "Seagate");

-- Tienda, Query 30
SELECT
	p.nombre,
    p.precio
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre REGEXP 'e$';

-- Tienda, Query 31
SELECT
	p.nombre,
	p.precio
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';

-- Tienda, Query 32
SELECT
	p.nombre,
    p.precio,
    f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
WHERE precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- Tienda, Query 33
SELECT
	f.codigo,
	f.nombre
FROM fabricante f
JOIN producto p
	ON p.codigo_fabricante = f.codigo;

-- Tienda, Query 34
SELECT
	f.codigo,
    f.nombre AS nombre_fabricante,
    p.codigo AS codigo_producto,
    p.nombre
FROM fabricante f
LEFT JOIN producto p
	ON p.codigo_fabricante = f.codigo;

-- Tienda, Query 35
SELECT
	f.codigo,
    f.nombre AS nombre_fabricante,
    p.codigo AS codigo_producto,
    p.nombre
FROM fabricante f
LEFT JOIN producto p
	ON p.codigo_fabricante = f.codigo
WHERE p.codigo IS NULL;

-- Tienda, Query 36
SELECT
	p.codigo,
    p.nombre,
    p.precio,
    p.codigo_fabricante
FROM producto p
LEFT JOIN fabricante f
ON f.codigo = p.codigo_fabricante
	WHERE f.nombre = 'Lenovo';

-- Tienda, Query 37
SELECT *
FROM producto p
JOIN fabricante f
	ON f.codigo = p.codigo_fabricante
WHERE p.precio = (
SELECT p.precio
FROM producto p
LEFT JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Lenovo'
ORDER BY p.precio DESC
LIMIT 1);

-- Tienda, Query 38
SELECT
	p.nombre,
    p.precio
FROM producto p
LEFT JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Lenovo'
ORDER BY p.precio DESC
LIMIT 1;

-- Tienda, Query 39
SELECT
	p.nombre,
    p.precio
FROM producto p
LEFT JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Hewlett-Packard'
ORDER BY p.precio ASC
LIMIT 1;

-- Tienda, Query 40
SELECT *
FROM producto p
JOIN fabricante f
	ON f.codigo = p.codigo_fabricante
WHERE p.precio >= (
SELECT p.precio
FROM producto p
LEFT JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Lenovo'
ORDER BY p.precio DESC
LIMIT 1);

-- Tienda, Query 41
SELECT *
FROM producto p
JOIN fabricante f
	ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Asus' AND p.precio > (
SELECT AVG(p.precio)
FROM producto p
JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Asus');


-- DB UNIVERSIDAD
USE universidad;

-- Universidad, Query 1
SELECT
	apellido1,
	apellido2,
    nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY
	apellido1,
    apellido2,
    nombre;

-- Universidad, Query 2
SELECT
	nombre,
    apellido1,
    apellido2
FROM persona
WHERE telefono IS NULL;

-- Universidad, Query 3
SELECT *
FROM persona
WHERE fecha_nacimiento
	BETWEEN '1999-01-01' AND '1999-12-31';

-- Universidad, Query 4
SELECT *
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL AND nif REGEXP 'k$';

-- Universidad, Query 5
SELECT *
FROM asignatura
WHERE id_grado = '7' AND curso = '3' AND cuatrimestre = '1';

-- Universidad, Query 6
SELECT
	p.apellido1,
    p.apellido2,
    p.nombre,
    d.nombre AS nombre_departamento
FROM persona p
JOIN profesor pf
ON p.id = pf.id_profesor
JOIN departamento d
ON pf.id_departamento = d.id
ORDER BY
	p.apellido1,
    p.apellido2,
    p.nombre;

-- Universidad, Query 7
SELECT
	a.nombre,
    a.curso,
	a.cuatrimestre
FROM asignatura a
JOIN alumno_se_matricula_asignatura aa
	ON a.id = aa.id_asignatura
JOIN persona p
	ON aa.id_alumno = p.id
WHERE p.nif = '26902806M';

-- Universidad, Query 8
SELECT dp.nombre
FROM departamento dp
JOIN profesor p
ON dp.id = p.id_departamento
JOIN asignatura aa
	ON aa.id_profesor = p.id_profesor
JOIN grado g
	ON g.id = aa.id_grado
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- Universidad, Query 9
SELECT
	DISTINCT p.id,
    p.nif,
    p.nombre,
    p.apellido1,
    p.apellido2
FROM persona p 
JOIN alumno_se_matricula_asignatura am
	ON p.id = am.id_alumno
JOIN curso_escolar ce
	ON am.id_curso_escolar = ce.id
WHERE anyo_inicio = '2018';

-- Universidad, clàusules JOIN, Query 1
SELECT
	dp.nombre AS nombre_departamento,
    p.apellido1,
    p.apellido2,
    p.nombre
FROM persona p
JOIN profesor pr
	ON p.id = pr.id_profesor
LEFT JOIN departamento dp
	ON pr.id_departamento = dp.id
ORDER BY nombre_departamento, p.apellido1, p.apellido2, p.nombre;

-- Universidad, clàusules JOIN, Query 2
SELECT *
FROM persona p
JOIN profesor pr
	ON p.id = pr.id_profesor
LEFT JOIN departamento dp
	ON pr.id_departamento = dp.id
WHERE id_departamento IS NULL;

-- Universidad, clàusules JOIN, Query 3
SELECT *
FROM departamento dp
LEFT JOIN profesor pr
	ON dp.id = pr.id_profesor
WHERE id_profesor IS NULL;

-- Universidad, clàusules JOIN, Query 4
SELECT *
FROM persona pr
LEFT JOIN asignatura aa
	ON pr.id = aa.id_profesor
WHERE pr.tipo = 'profesor' AND aa.id IS NULL;

-- Universidad, clàusules JOIN, Query 5

-- Universidad, clàusules JOIN, Query 6

-- Universidad, Consultes Resum, Query 1
SELECT COUNT(id)
FROM persona
WHERE tipo = 'alumno';

-- Universidad, Consultes Resum, Query 2
SELECT COUNT(id)
FROM persona
WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- Universidad, Consultes Resum, Query 3
SELECT de.nombre, COUNT(*) AS numero_profesores
FROM departamento de
JOIN profesor pr
	ON de.id = pr.id_departamento
JOIN persona pe
	ON pr.id_profesor = pe.id
GROUP BY de.nombre;

-- Universidad, Consultes Resum, Query 4
SELECT de.nombre, COUNT(*) AS numero_profesores
FROM departamento de
LEFT JOIN profesor pr
	ON de.id = pr.id_departamento
JOIN persona pe
	ON pr.id_profesor = pe.id
GROUP BY de.nombre;

-- Universidad, Consultes Resum, Query 5
SELECT gr.nombre, COUNT(*) AS numero_asignaturas
FROM grado gr
LEFT JOIN asignatura aa
	ON gr.id = aa.id_grado
GROUP BY gr.nombre
ORDER BY gr.nombre;

-- Universidad, Consultes Resum, Query 6

-- Universidad, Consultes Resum, Query 7
SELECT gr.nombre AS nombre_grado, aa.tipo, SUM(aa.creditos) AS total_creditos
FROM grado gr
JOIN asignatura aa
	ON gr.id = aa.id_grado
GROUP BY gr.nombre, aa.tipo
ORDER BY gr.nombre;

-- Universidad, Consultes Resum, Query 8
SELECT ce.anyo_inicio, COUNT(am.id_alumno) AS numero_alumnos
FROM persona pe
JOIN alumno_se_matricula_asignatura am
	ON pe.id = am.id_alumno
JOIN curso_escolar ce
	ON am.id_curso_escolar = ce.id
GROUP BY ce.anyo_inicio;

-- Universidad, Consultes Resum, Query 9
SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2, COUNT(aa.nombre) AS numero_asignaturas
FROM persona pe
LEFT JOIN asignatura aa
	ON pe.id = aa.id_profesor
GROUP BY pe.id, pe.nombre;

-- Universidad, Consultes Resum, Query 10 (realizado de dos formas diferentes)
SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

SELECT *
FROM persona
WHERE fecha_nacimiento = (
	SELECT MAX(fecha_nacimiento)
	FROM persona);

-- Universidad, Consultes Resum, Query 11
SELECT
	pe.id,
    pe.nif,
    pe.nombre,
    pe.apellido1,
    pe.apellido2
FROM persona pe
JOIN profesor pr
	ON pe.id = pr.id_profesor
LEFT JOIN departamento de
	ON pr.id_departamento = de.nombre
LEFT JOIN asignatura aa
	ON aa.id_profesor = pe.id
WHERE aa.id_profesor IS NULL;