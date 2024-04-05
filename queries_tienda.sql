SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.08 FROM producto;
SELECT nombre AS nombre_producto, precio AS euros, precio * 1.08 AS dólares FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre,1,2)) FROM fabricante;
SELECT nombre, ROUND(precio,0) FROM producto;
SELECT nombre, TRUNCATE(precio,0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre AS nombre_producto , precio , fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre AS nombre_producto , precio , fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 1;
SELECT producto.nombre, precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'lenovo';
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'crucial' AND producto.precio > 200;
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus','Hewlett-Packard', 'Seagate');
SELECT producto.nombre, precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre, precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre, precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE precio >= 180 ORDER BY precio DESC, producto.nombre ASC;
SELECT fabricante.codigo, fabricante.nombre FROM fabricante JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.nombre, producto.nombre AS nombre_prodcuto FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT * FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo IS NULL;
