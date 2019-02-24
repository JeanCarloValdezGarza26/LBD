create database PracticaDOS;
USE PracticaDOS
go
create table Alumnos(
Id uniqueidentifier not null, 
Nombre varchar (30) not null,
Matricula int PRIMARY KEY not null,
Facultad varchar (15) not null,
Materia varchar (10) not null, 
)

CREATE INDEX IDX_MATRICULA_FAC
ON Alumnos (Matricula, Facultad);


create table DatosAlumno(
Id uniqueidentifier not null, 
Nombre varchar (30) not null,
FechaDeNacimiento Date not null,
Domicilio varchar (30) PRIMARY KEY not null,
Casado bit not null,
)

CREATE INDEX IDX_NOM_FEC
ON DatosAlumno (Nombre, FechaDeNacimiento);

create table Empleado(
Id uniqueidentifier not null, 
Nombre varchar (30) PRIMARY KEY not null,
FechaDeAtendido Datetime not null,
AlumnoAtentido varchar (30) not null,
Trabajo bit not null,
)

CREATE INDEX IDX_NOM_ALU
ON Empleado (Nombre, AlumnoAtentido);

create table Producto(
Id uniqueidentifier not null, 
Nombre varchar (30) not null,
Cantidad int not null,
Costo money PRIMARY KEY not null,
Promocion bit not null,
)

CREATE INDEX IDX_CAN_COS
ON Producto (Cantidad, Costo);

create table Promocion(
Id uniqueidentifier not null, 
Nombre varchar (30) not null,
PromocionDesc varchar(20) PRIMARY KEY not null,
Costoreducido money not null,
PromocionValida as (Nombre + ' ' + PromocionDesc) 
)

CREATE INDEX IDX_NOM_COSTO
ON Promocion (Nombre, Costoreducido);

create table Rifa(
Id uniqueidentifier not null, 
Evento varchar (30) not null,
DiaDeInicio datetime PRIMARY KEY not null,
RifaDesc as (Evento + ' ' + DiaDeInicio) 
)

CREATE INDEX IDX_EVENT_DIAINI
ON Rifa (Evento, DiaDeInicio);

create table MateriasDeBaja(
Id uniqueidentifier not null, 
NombreMateria varchar (30) PRIMARY KEY not null,
Costo money not null,
ComposicionMateria as (NombreMateria + ' ' + Costo) 
)

CREATE INDEX IDX_NOM_COS
ON MateriasDeBaja (NombreMateria, Costo);

create table MateriasDeSegundas(
Id uniqueidentifier not null, 
Nombre varchar (30) not null,
Materiadesc varchar(20) not null,
Cantidad int  PRIMARY KEY not null,
costoMateria money not null, 
MateriaAplicada as (Nombre + ' ' + Cantidad) 
)

CREATE INDEX IDX_NOM_MATER
ON MateriasDeSegundas (Nombre, Materiadesc);

create table Reingreso(
Id uniqueidentifier not null, 
Nombre varchar (30) not null,
Materia varchar(20) not null,
CostoTotal money PRIMARY KEY not null,
AlumnoReingreso as (Nombre + ' ' + Materia + ' ' + CostoTotal) 
)

CREATE INDEX IDX_NOM_MAT
ON Reingreso (Nombre, Materia);

create table HorasPermitidas(
Id uniqueidentifier not null, 
Tiempo time(7) PRIMARY KEY not null, 
)

CREATE INDEX IDX_TIEMPO
ON HorasPermitidas (Id, Tiempo);

SELECT * FROM Alumnos
SELECT * FROM DatosAlumno
SELECT * FROM Empleado
SELECT * FROM HorasPermitidas
SELECT * FROM MateriasDeBaja
SELECT * FROM MateriasDeSegundas
SELECT * FROM Producto
SELECT * FROM Promocion
SELECT * FROM Reingreso
SELECT * FROM Rifa