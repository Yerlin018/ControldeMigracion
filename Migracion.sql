
CREATE DATABASE Migracion;

CREATE TABLE USUARIOS
(
Idusuario int primary key identity(1,1),
Nombre VARCHAR(50) NOT NULL,
Contrasena VARCHAR(50) NOT NULL UNIQUE, 
Email VARCHAR(50) NOT NULL,
CONSTRAINT chk_email_dominio CHECK (Email LIKE '%@gmail.com')
)
CREATE TABLE PASAJEROS
(
IdPasajero int primary key identity(1,1),
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL, 
NumPasaporte INT NOT NULL UNIQUE,
Nacionalidad VARCHAR(50) Not NULL
)
INSERT INTO PASAJEROS(Nombre, Apellido,NumPasaporte, Nacionalidad) VALUES ('DARCY', 'QUESADA', '234345','Costarricense')
INSERT INTO PASAJEROS(Nombre, Apellido,NumPasaporte, Nacionalidad) VALUES ('WILL', 'VARGAS', '1233456','Costarricense')
INSERT INTO PASAJEROS(Nombre, Apellido,NumPasaporte, Nacionalidad) VALUES ('ANDREW', 'BOCKER', '92032','Costarricense')
INSERT INTO PASAJEROS(Nombre, Apellido,NumPasaporte, Nacionalidad) VALUES ('YERLIN', 'CHACON', '8932','Costarricense')

SET DATEFORMAT ymd;

CREATE TABLE ENTRADA_SALIDA
(
IdRegistro int primary key identity(1,1),
IdPasajero int NOT NULL UNIQUE,
FechaEntrada DATE, 
FechaSalida DATE,
LugarEntrada VARCHAR(50) NOT NULL,
LugarSalida VARCHAR(50) NOT NULL,
CONSTRAINT fk_pasajero FOREIGN KEY (IdPasajero) REFERENCES pasajeros(IdPasajero)
);

INSERT INTO ENTRADA_SALIDA(IdPasajero, FechaEntrada,FechaSalida,LugarEntrada, LugarSalida) VALUES ('1', '2022-10-19', '2022-10-9','JUAN SANTA MARIA','AE Internacional MIAMI' )
INSERT INTO ENTRADA_SALIDA(IdPasajero, FechaEntrada,FechaSalida,LugarEntrada, LugarSalida) VALUES ('2', '2023-11-9', '2023-11-1','JUAN SANTA MARIA','AEI AUCKLAND' )
INSERT INTO ENTRADA_SALIDA(IdPasajero, FechaEntrada,FechaSalida,LugarEntrada, LugarSalida) VALUES ('3', '2024-12-12', '2024-12-1','JUAN SANTA MARIA','Charles de Gaulle' )
INSERT INTO ENTRADA_SALIDA (IdPasajero, FechaEntrada, FechaSalida, LugarEntrada, LugarSalida) 
VALUES (4, '2022-10-19', '2022-10-09', 'JUAN SANTA MARIA', 'AE Internacional MIAMI');

CREATE TABLE VUELOS
(
  IdVuelo int primary key identity(1021,1),
  CodigoVuelo VARCHAR(50) NOT NULL,
  Aerolinea VARCHAR(100) NOT NULL,
  Origen VARCHAR(100) NOT NULL,
  Destino VARCHAR(100) NOT NULL,
  FechaVuelo DATE ,
  HoraVuelo TIME 
);
INSERT INTO VUELOS(CodigoVuelo, Aerolinea, Origen, Destino, FechaVuelo, HoraVuelo) VALUES ('MIA-001', 'Volaris', 'Costa Rica','Miami','2022-10-9','10:00')
INSERT INTO VUELOS(CodigoVuelo, Aerolinea, Origen, Destino, FechaVuelo, HoraVuelo) VALUES ('NZ-002', 'Volaris', 'Costa Rica','Nueva Zelanda','2023-11-1','10:00')
INSERT INTO VUELOS(CodigoVuelo, Aerolinea, Origen, Destino, FechaVuelo, HoraVuelo) VALUES ('PA-111', 'Volaris', 'Costa Rica','Paris','2024-12-1','10:00')
INSERT INTO VUELOS(CodigoVuelo, Aerolinea, Origen, Destino, FechaVuelo, HoraVuelo) VALUES ('BO-123', 'CopaAirlines', 'Costa Rica','Bogotá','2024-10-10','9:30')
INSERT INTO VUELOS(CodigoVuelo, Aerolinea, Origen, Destino, FechaVuelo, HoraVuelo) VALUES ('GU-143', 'CopaAirlines', 'Costa Rica','Guatemala','2022-10-9','10:00')


INSERT INTO USUARIOS(Nombre, Contrasena, Email ) VALUES ('Yerlin', 'Ema', 'yerlincc018@gmail.com')
INSERT INTO USUARIOS(Nombre, Contrasena, Email ) VALUES ('Alezander', 'Paz', 'alexander.cur@gmail.com')

SELECT*FROM USUARIOS
SELECT*FROM PASAJEROS
SELECT*FROM ENTRADA_SALIDA
SELECT*FROM VUELOS
DROP TABLE pasajeros
DROP TABLE ENTRADA_SALIDA
DROP TABLE Vuelos

SELECT IdRegistro, IdPasajero, FechaEntrada, FechaSalida, LugarEntrada, LugarSalida 
FROM ENTRADA_SALIDA;

UPDATE PASAJEROS SET Nombre = 'Juan', Apellido = 'Pérez' WHERE IdPasajero = 1;

