/*Primer bloque de queries*/
/*1*/SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre ASC;
/*2*/SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo = 'alumno' AND telefono  IS NULL;
/*3*/SELECT * FROM universidad.persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '%1999%';
/*4*/SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo = 'profesor' AND telefono  IS NULL AND nif LIKE '%k';
/*5*/SELECT * FROM universidad.asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
/*6*/SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre ASC;
/*7*/SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = '26902806M';
/*8*/SELECT departamento.nombre, asignatura.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
/*9*/SELECT DISTINCT nombre, apellido1, apellido2 FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019 AND persona.tipo = 'alumno';

/*Segundo bloque de queries (LEFT/RIGHT JOIN)*/
/*1*/SELECT departamento.nombre AS nombre_departamento, persona.nombre, persona.apellido1, persona.apellido2 FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento JOIN persona ON profesor.id_profesor = persona.id ORDER BY departamento.nombre ASC, persona.nombre ASC, apellido1 ASC, apellido2 ASC;
/*2*/SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento JOIN persona ON  profesor.id_profesor = persona.id WHERE profesor.id_departamento IS NULL;
/*3*/SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
/*4*/SELECT persona.nombre, apellido1, apellido2 FROM persona JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
/*5*/SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor WHERE profesor.id_profesor IS NULL; 
/*6*/SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id IS NULL;

/*Tercer bloque de queries (resumen)*/
/*1*/SELECT COUNT(persona.id) from persona where tipo = 'alumno';
/*2*/SELECT COUNT(persona.id) from persona where tipo = 'alumno' and fecha_nacimiento like '%1999%';
/*3*/SELECT departamento.nombre, count(profesor.id_profesor) AS num_profesores FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY num_profesores DESC;
/*4*/SELECT departamento.nombre, COUNT(profesor.id_profesor) AS num_profes FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN persona  ON profesor.id_profesor = persona.id GROUP BY departamento.nombre;
/*5*/SELECT grado.nombre, COUNT(asignatura.id) AS num_asignaturas FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY num_asignaturas DESC;
/*6*/SELECT grado.nombre, COUNT(asignatura.id) AS num_asignaturas FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING num_asignaturas > 40 ORDER BY num_asignaturas DESC;
/*7*/SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) AS total_creditos FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre, asignatura.tipo;
/*8*/SELECT curso_escolar.anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_alumno) AS num_alumnos FROM curso_escolar LEFT JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
/*9*/SELECT profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id) AS asignaturas_impartidas FROM profesor JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor GROUP BY profesor.id_profesor ORDER BY asignaturas_impartidas DESC;
/*10*/SELECT * FROM persona WHERE persona.tipo = "alumno" ORDER BY persona.fecha_nacimiento DESC LIMIT 1;
/*11*/SELECT persona.nombre, persona.apellido1, persona.apellido2, profesor.id_departamento, asignatura.id AS asignatura FROM persona JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL AND profesor.id_departamento IS NOT NULL;