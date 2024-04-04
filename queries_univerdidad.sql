SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre ASC;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo = 'alumno' AND telefono  IS NULL;
SELECT * FROM universidad.persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '%1999%';
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo = 'profesor' AND telefono  IS NULL AND nif LIKE '%k';
SELECT * FROM universidad.asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre ASC;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = '26902806M';
SELECT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT * FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019 AND persona.tipo = 'alumno';
SELECT COUNT(persona.id) from persona where tipo = 'alumno';
SELECT COUNT(persona.id) from persona where tipo = 'alumno' and fecha_nacimiento like '%1999%';
/* Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament 
i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat 
només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.*/
SELECT departamento.nombre, count()