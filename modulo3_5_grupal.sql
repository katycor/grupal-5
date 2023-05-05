/* Parte 1: Crear entorno de trabajo
- Crear una base de datos
- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.*/
CREATE DATABASE modulo3_5_grupal;
USE modulo3_5_grupal;

/* Parte 2: Crear dos tablas.
- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido,
contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).*/
CREATE TABLE usuarios_app (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  contrasenia VARCHAR(255) NOT NULL,
  zona_horaria DATETIME DEFAULT (CURRENT_TIMESTAMP - INTERVAL -3 HOUR),
  genero VARCHAR(15) NOT NULL,
  telefono VARCHAR(45) NOT NULL
);

/*
- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los
usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la
fecha-hora actual)).*/
CREATE TABLE interaccion_usuarios (
  id_ingreso INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuarios_app(id_usuario)
);

/* Parte 3: Modificación de la tabla
- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.*/
ALTER TABLE usuarios_app
MODIFY zona_horaria DATETIME DEFAULT (CURRENT_TIMESTAMP - INTERVAL -2 HOUR);

/* Parte 4: Creación de registros.
- Para cada tabla crea 8 registros.*/
INSERT INTO usuarios_app (nombre, apellido, contrasenia, genero, telefono) VALUES 
('Juan', 'Perez', '123456', 'Masculino', '555-1234'),
('Maria', 'Garcia', 'qwerty', 'Femenino', '555-5678'),
('Pedro', 'Rodriguez', 'abcd123', 'Masculino', '555-4321'),
('Ana', 'Martinez', 'q1w2e3', 'Femenino', '555-8765'),
('Luis', 'Gonzalez', 'password', 'Masculino', '555-2345'),
('Laura', 'Sanchez', 'abc123', 'Femenino', '555-7890'),
('Carlos', 'Fernandez', 'qwerty123', 'Masculino', '555-3456'),
('Lucia', 'Torres', 'password123', 'Femenino', '555-9012');

INSERT INTO interaccion_usuarios (id_usuario) VALUES (1), (2), (3), (4), (5), (6), (7), (8);

/* Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso: SI!?

  1. INT PRIMARY KEY AUTO_INCREMENT = Utilizado para generar llave primeria auto-incrementable.
  2. VARCHAR(50) NOT NULL = Permite ingresar cadenas de texto, la anotacion NOT NULL no deja que el campo sea nulo o vacio.
  3. VARCHAR(50) DEFAULT (CURRENT_TIMESTAMP - INTERVAL -3 HOUR) = Permite ingresar cadenas de texto, UTC-3 ajusta la zona horaria a 3 horas antes del tiempo del meridiano.
  4. INT NOT NULL = Tipo de dato numerico , el cual no puede ser nulo ni estar vacio.
  5. DATETIME DEFAULT CURRENT_TIMESTAMP = Tipo de dato de formato fecha y hora, el cual por defecto tomara la hora actual al momento de ingresar un dato
  6. FOREIGN KEY = Llave referencial de una tabla que permite enlazar una entidad a este atributo.
  7. REFERENCES = Indica solamente a que tabla sera referenciada la FOREIGN KEY.
  8. INSERT INTO = Sentencia utilizada para añadir valores a una tabla, va acompañada de la sentencia VALUES.
  9. VALUES = Hace referencia a los valores que seran ingresados en la tabla.
*/

/* Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,
correo electronico).*/
CREATE TABLE contactos (
id_contacto INT PRIMARY KEY AUTO_INCREMENT, 
id_usuario INT NOT NULL, 
telefono VARCHAR(45), 
correo_electronico VARCHAR(50)
);

/* Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la
tabla Contactos.*/
SELECT * FROM modulo3_5_grupal.usuarios_app;
ALTER TABLE usuarios_app
ADD COLUMN id_contacto INT;

ALTER TABLE usuarios_app
ADD FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto);

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico)
VALUES
(1, '12345678', 'usuario1@ejemplo.com'),
(2, '87654321', 'usuario2@ejemplo.com'),
(3, '55555555', 'usuario3@ejemplo.com'),
(4, '99999999', 'usuario4@ejemplo.com'),
(5, '11111111', 'usuario5@ejemplo.com'),
(6, '22222222', 'usuario6@ejemplo.com'),
(7, '33333333', 'usuario7@ejemplo.com'),
(8, '44444444', 'usuario8@ejemplo.com');

UPDATE usuarios_app
SET id_contacto = 1
WHERE id_usuario = 1;


