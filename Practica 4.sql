CREATE DATABASE RestauranteLSTI6
USE RestauranteLSTI6

CREATE TABLE Restaurante
(Id_Restaurante CHAR(3) PRIMARY KEY NOT NULL,  
   Nom_Restaurante varchar(30) NOT NULL,  
   Telefono int NOT NULL,  
   Sucursal_Ubicacion varchar(30) NOT NULL,
	CHECK (Id_Restaurante LIKE 'R[0-9][0-9]'),
	CHECK (Telefono>0))

INSERT INTO Restaurante VALUES ('R02','RestauranteEjemplo','89828232','Direccion')
SELECT * FROM Restaurante


CREATE TABLE Mesa
(Id_Mesa CHAR(3) PRIMARY KEY NOT NULL,  
   Id_Restaurante CHAR(3) NOT NULL FOREIGN KEY (Id_Restaurante) REFERENCES Restaurante(Id_Restaurante), 
   CantMax_Comensal int NOT NULL,  
   Seccion_Restaurante varchar(15) NOT NULL,
	CHECK (Id_Mesa LIKE 'M[0-9][0-9]'))

	INSERT INTO Mesa VALUES ('M02','R01','89','Seccion')
	SELECT * FROM Mesa

CREATE TABLE Cliente
(Usuario_Cliente varchar (30) PRIMARY KEY NOT NULL, 
   Id_Mesa CHAR(3) NOT NULL FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id_Mesa),  
   Direccion_Cliente varchar(30) NOT NULL,  
   Telefono_Cliente int NOT NULL,  
   Notas_Cliente varchar (30) NULL,
	CHECK (Telefono_Cliente>0))

	INSERT INTO Cliente VALUES ('Señor','M02','Direcciones','839434','Ningu')
	SELECT * FROM Cliente

CREATE TABLE Tipo_Personal
(Tipo_P varchar (12) PRIMARY KEY NOT NULL,  
   Desc_Personal varchar(20) NOT NULL)
   
   INSERT INTO Tipo_Personal VALUES ('NOP','SDSDSFSFSF')
   SELECT * FROM Tipo_Personal

CREATE TABLE Turno
(Id_Turno CHAR(3) PRIMARY KEY NOT NULL,  
   Desc_Turno varchar(30) NOT NULL,
	CHECK (Id_Turno LIKE 'T[0][0-9]'))

	INSERT INTO Turno VALUES ('T02','Ninguna')
	SELECT * FROM Turno

CREATE TABLE Personal
(Id_Personal CHAR(3) PRIMARY KEY NOT NULL,  
   Nom_Personal varchar(30) NOT NULL,  
   Telefono_Personal int NOT NULL,  
   Direccion_Personal varchar (30) NOT NULL,
   Id_Mesa CHAR(3) NOT NULL FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id_Mesa),
   Tipo_Personal varchar (12) NOT NULL FOREIGN KEY (Tipo_Personal) REFERENCES Tipo_Personal(Tipo_P),  
   Id_Turno CHAR(3) NOT NULL FOREIGN KEY (Id_Turno) REFERENCES Turno(Id_Turno),
	CHECK (Id_Personal LIKE 'P[0-9][0-9]'),
	CHECK (Telefono_Personal>0))

	INSERT INTO Personal VALUES ('P03','Ninguna','9686868','SDDSDSDS','M01','NOP','T01')
	SELECT * FROM Personal

CREATE TABLE Platillos
(Id_Platillo CHAR(4) PRIMARY KEY NOT NULL,  
   Nom_Platillo varchar(20) NOT NULL,  
   Des_Platillo varchar(30) NOT NULL,  
   Porcion_Platillo int NOT NULL,
   Precio_Platillo money NOT NULL,
   Id_Personal CHAR(3) NOT NULL FOREIGN KEY (Id_Personal) REFERENCES Personal(Id_Personal),
	CHECK (Id_Platillo LIKE 'PL[0-9][0-9]'))
	
	INSERT INTO Platillos VALUES ('PL04','Ninguna','Ninguna','12','890','P02')
	SELECT * FROM Platillos

CREATE TABLE Bebidas
(Id_Bebida CHAR(3) PRIMARY KEY NOT NULL,  
   Nom_Bebida varchar(20) NOT NULL,  
   Des_Bebida varchar(30) NOT NULL,  
   Precio_Bebida money NOT NULL,
   Id_Personal CHAR(3) NOT NULL FOREIGN KEY (Id_Personal) REFERENCES Personal(Id_Personal),
	CHECK (Id_Bebida LIKE 'B[0-9][0-9]')) 

	INSERT INTO Bebidas VALUES ('B01','Ninguna','Ninguna','22','P02')
	SELECT * FROM Bebidas

CREATE TABLE Factura
(N_Factura int PRIMARY KEY NOT NULL,  
	Id_Restaurante CHAR(3) NOT NULL FOREIGN KEY (Id_Restaurante) REFERENCES Restaurante(Id_Restaurante),   
	Id_Mesa CHAR(3) NOT NULL FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id_Mesa),  
	Id_Platillo CHAR(4) NOT NULL FOREIGN KEY (Id_Platillo) REFERENCES Platillos(Id_Platillo), 
	Id_Bebida CHAR(3) NOT NULL FOREIGN KEY (Id_Bebida) REFERENCES Bebidas(Id_Bebida),
	Fecha datetime)

	SELECT * FROM Factura

CREATE TABLE Comanda
(Id_Pedido int PRIMARY KEY NOT NULL,  
   ClienteP varchar (30) NOT NULL FOREIGN KEY (ClienteP) REFERENCES Cliente(Usuario_Cliente),
   PlatilloP CHAR(4) NOT NULL FOREIGN KEY (PlatilloP) REFERENCES Platillos(Id_Platillo),
   BebidaP CHAR(3) NOT NULL FOREIGN KEY (BebidaP) REFERENCES Bebidas(Id_Bebida),
   Ruta_Pedido varchar (30) NOT NULL,
   Fecha_Pedido datetime NOT NULL)

   SELECT * FROM Comanda