SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.08 FROM producto;
SELECT nombre AS nombre_producto, precio AS euros, precio * 1.08 AS dólares FROM producto;
SELECT upper(nombre), precio FROM producto;
SELECT lower(nombre), precio FROM producto;
