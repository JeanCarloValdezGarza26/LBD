CREATE DATABASE RestauranteLSTI8
USE RestauranteLSTI8

CREATE TABLE Restaurante
(Id_Restaurante CHAR(3) PRIMARY KEY NOT NULL,  
   Nom_Restaurante varchar(30) NOT NULL,  
   Telefono int NOT NULL,  
   Sucursal_Ubicacion varchar(30) NOT NULL,
	CHECK (Id_Restaurante LIKE 'R[0-9][0-9]'),
	CHECK (Telefono>0))

INSERT INTO Restaurante VALUES ('R01','Restaurante FCFM','81123456','Sucursal San Nicolas')
INSERT INTO Restaurante VALUES ('R02','Los Bisontes','81143256','Sucursal Apodaca')
INSERT INTO Restaurante VALUES ('R03','La gran FCFM','81186423','Sucursal Guadalupe')
INSERT INTO Restaurante VALUES ('R04','La integral','81184567','Sucursal Pueblo Nuevo')
INSERT INTO Restaurante VALUES ('R05','Bisontes Ganadores','8112345','Sucursal Santa Rosa')
INSERT INTO Restaurante VALUES ('R06','Las Fisicomidad','81145678','Sucursal Mezquital')
INSERT INTO Restaurante VALUES ('R07','PIcante','81108765','Sucursal Garcia')
INSERT INTO Restaurante VALUES ('R08','El Bisonte salvaje','81157634','Sucursal Guadalupe')
INSERT INTO Restaurante VALUES ('R09','La derivada','81105678','Sucursal Linares')
INSERT INTO Restaurante VALUES ('R10','Comedor FCFM','81115378','Sucursal Galeana')
SELECT * FROM Restaurante

SELECT Id_Restaurante, COUNT("Sucursal_Ubicacion")
FROM Restaurante
GROUP BY Id_Restaurante;


CREATE TABLE Mesa
(Id_Mesa CHAR(3) PRIMARY KEY NOT NULL,  
   Id_Restaurante CHAR(3) NOT NULL FOREIGN KEY (Id_Restaurante) REFERENCES Restaurante(Id_Restaurante), 
   CantMax_Comensal int NOT NULL,  
   Seccion_Restaurante varchar(15) NOT NULL,
	CHECK (Id_Mesa LIKE 'M[0-9][0-9]'))

	INSERT INTO Mesa VALUES ('M01','R01','5','Corredor')
	INSERT INTO Mesa VALUES ('M02','R02','6','Terraza')
	INSERT INTO Mesa VALUES ('M03','R03','10','Terraza')
	INSERT INTO Mesa VALUES ('M04','R04','2','Corredor')
	INSERT INTO Mesa VALUES ('M05','R05','4','Corredor')
	INSERT INTO Mesa VALUES ('M06','R06','5','Primer Piso')
	INSERT INTO Mesa VALUES ('M07','R07','6','Corredor')
	INSERT INTO Mesa VALUES ('M08','R08','5','Primer Piso')
	INSERT INTO Mesa VALUES ('M09','R09','5','Corredor')
	INSERT INTO Mesa VALUES ('M10','R10','10','Segundo Piso')
	INSERT INTO Mesa VALUES ('M11','R01','2','Segundo Piso')
	INSERT INTO Mesa VALUES ('M12','R02','4','Corredor')
	INSERT INTO Mesa VALUES ('M13','R03','7','Segundo Piso')
	INSERT INTO Mesa VALUES ('M14','R04','8','Segundo Piso')
	INSERT INTO Mesa VALUES ('M15','R05','10','Segundo Piso')
	INSERT INTO Mesa VALUES ('M16','R06','3','Corredor')
	INSERT INTO Mesa VALUES ('M17','R07','6','Segundo Piso')
	INSERT INTO Mesa VALUES ('M18','R08','6','Corredor')
	INSERT INTO Mesa VALUES ('M19','R09','10','Primer Piso')
	INSERT INTO Mesa VALUES ('M20','R10','10','Primer Piso')
	SELECT * FROM Mesa

	SELECT Id_Mesa, SUM("CantMax_Comensal")
	FROM Mesa
	GROUP BY Id_Mesa;

	SELECT A1.Id_Mesa,SUM(A1.CantMax_Comensal) "Columna conjunta"
	FROM Mesa A1
	GROUP BY A1.Id_Mesa;

	DROP TABLE Mesa

CREATE TABLE Cliente
(Usuario_Cliente varchar (30) PRIMARY KEY NOT NULL, 
   Id_Mesa CHAR(3) NOT NULL FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id_Mesa),  
   Direccion_Cliente varchar(30) NOT NULL,  
   Telefono_Cliente int NOT NULL,  
   Notas_Cliente varchar (30) NULL,
	CHECK (Telefono_Cliente>0))

	INSERT INTO Cliente VALUES ('Hernández Juan Carlos','M01','Santa Rosa 302','81123456','Sin notas adicionales')
	INSERT INTO Cliente VALUES ('García García María ','M02','Santa Rosa 302','81108976','Sin notas adicionales')
	INSERT INTO Cliente VALUES ('Martínez Miguel Ángel','M03','Santa Rosa 203','81176540','Sin notas adicionales')
	INSERT INTO Cliente VALUES ('Flores García Jesús ','M04','San Ignacion Loyola 101','81124567','Sin notas adicionales')
	INSERT INTO Cliente VALUES ('Sánchez Hernández Alejandro','M05','Mezquital 233','81134578','Sin notas adicionales')
	INSERT INTO Cliente VALUES ('Angel Andreu Serrano','M06','Santa Rosa 156','81109786','Sin notas adicionales')
	INSERT INTO Cliente VALUES ('Antonio Vidal Arevalo','M07','San Ignacion Loyola 234','81165487','Sin notas adicionales')
	INSERT INTO Cliente VALUES ('Cristina Martine Herrera','M08','Mezquital 245','81186788','Sin notas adicionales')
	INSERT INTO Cliente VALUES ('Esther Fernandez Mendez','M09','Santa Rosa 763','81108678','Sin notas adicionales')
	INSERT INTO Cliente VALUES ('Jaqueline Guillamo','M10','San Ignacion Loyola 123','81145667','Sin notas adicionales')
	SELECT * FROM Cliente

	SELECT Usuario_Cliente, COUNT("Telefono_Cliente")
	FROM Cliente
	GROUP BY Usuario_Cliente;

	SELECT A2.Usuario_Cliente,COUNT(A2.Telefono_Cliente) "Columna conjunta"
	FROM Cliente A2
	GROUP BY A2.Usuario_Cliente;

CREATE TABLE Tipo_Personal
(Tipo_P varchar (12) PRIMARY KEY NOT NULL,  
   Desc_Personal varchar(20) NOT NULL)
   
   INSERT INTO Tipo_Personal VALUES ('Primer Piso','Atiende mesa 1 y 5')
   INSERT INTO Tipo_Personal VALUES ('Segundo Piso','Atiende mesa 2 y 3')
   INSERT INTO Tipo_Personal VALUES ('Terraza','Atiende mesa 4 y 6')
   INSERT INTO Tipo_Personal VALUES ('Piso N° 1','Atiende mesa 7-9')
   INSERT INTO Tipo_Personal VALUES ('Tejado','Atiende mesa 10-14')
   INSERT INTO Tipo_Personal VALUES ('Corredor','Atiende mesa 16 y 17')
   SELECT * FROM Tipo_Personal

CREATE TABLE Turno
(Id_Turno CHAR(3) PRIMARY KEY NOT NULL,  
   Desc_Turno varchar(30) NOT NULL,
	CHECK (Id_Turno LIKE 'T[0-9][0-9]'))

	INSERT INTO Turno VALUES ('T01','Matutino')
	INSERT INTO Turno VALUES ('T02','Matutino')
	INSERT INTO Turno VALUES ('T03','Matutino')
	INSERT INTO Turno VALUES ('T04','Matutino')
	INSERT INTO Turno VALUES ('T05','Matutino')
	INSERT INTO Turno VALUES ('T06','Matutino')
	INSERT INTO Turno VALUES ('T07','Vespertino')
	INSERT INTO Turno VALUES ('T08','Vespertino')
	INSERT INTO Turno VALUES ('T09','Vespertino')
	INSERT INTO Turno VALUES ('T10','Vespertino')
	INSERT INTO Turno VALUES ('T11','Vespertino')
	INSERT INTO Turno VALUES ('T12','Vespertino')

	UPDATE Turno SET Desc_Turno = 'Vespertino' WHERE Id_Turno='T01';
	UPDATE Turno SET Desc_Turno = 'Vespertino' WHERE Id_Turno='T03';
	UPDATE Turno SET Desc_Turno = 'Vespertino' WHERE Id_Turno='T05';
	UPDATE Turno SET Desc_Turno = 'Matutino' WHERE Id_Turno='T09';
	UPDATE Turno SET Desc_Turno = 'Matutino' WHERE Id_Turno='T11';

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

	INSERT INTO Personal VALUES ('P01','MARIA CARMEN','81234567','Apodaca','M01','Primer Piso','T01')
	INSERT INTO Personal VALUES ('P02','JEAN CARLO','81345678','Apodaca','M02','Segundo Piso','T02')
	INSERT INTO Personal VALUES ('P03','AMAT MENA','81456789','Apodaca','M03','Primer Piso','T03')
	INSERT INTO Personal VALUES ('P04','AMATE GARRIDO','81567891','Apodaca','M04','Segundo Piso','T04')
	INSERT INTO Personal VALUES ('P05','APARICIO GARCIA','81678901','Apodaca','M05','Segundo Piso','T05')
	INSERT INTO Personal VALUES ('P06','BENAYAS PEREZ ','81789012','Apodaca','M06','Corredor','T06')
	INSERT INTO Personal VALUES ('P07','BERNABE CASANOVA','81890123','Apodaca','M07','Segundo Piso','T07')
	INSERT INTO Personal VALUES ('P08','BERNAL RUIZ ','81901234','Apodaca','M08','Corredor','T08')
	INSERT INTO Personal VALUES ('P09','CACERES CONTRERAS','81398765','Apodaca','M09','Segundo Piso','T09')
	INSERT INTO Personal VALUES ('P10','CAMPOS VIQUE','81498765','Apodaca','M10','Segundo Piso','T10')
	INSERT INTO Personal VALUES ('P11','CARREÑO NAVARRO ','81598765','Apodaca','M11','Primer Piso','T11')
	INSERT INTO Personal VALUES ('P12','CARRERA BENITEZ ','81698765','Apodaca','M12','Segundo Piso','T12')
	INSERT INTO Personal VALUES ('P13','CASAS GARCIA','81798765','Apodaca','M13','Segundo Piso','T01')
	INSERT INTO Personal VALUES ('P14','CASTELLS GALLEGO ','81898765','Apodaca','M14','Corredor','T02')
	INSERT INTO Personal VALUES ('P15','CASTILLO ALARCON','81987654','Apodaca','M15','Terraza','T03')
	INSERT INTO Personal VALUES ('P16','CASTILLO GALDEANO ','81034567','Apodaca','M16','Primer Piso','T04')
	INSERT INTO Personal VALUES ('P17','ACIEN ZURUTA','81012345','Apodaca','M17','Terraza','T05')
	INSERT INTO Personal VALUES ('P18','SUSANA IRENE','81045677','Apodaca','M18','Primer Piso','T06')
	INSERT INTO Personal VALUES ('P19','EMILIO CAVAZOS','81064657','Apodaca','M19','Primer Piso','T07')
	INSERT INTO Personal VALUES ('P20','JOSE GUADALUPE','81086545','Apodaca','M20','Primer Piso','T08')

	DELETE FROM Personal WHERE Id_Personal='P15';
	DELETE FROM Personal WHERE Id_Personal='P16';
	DELETE FROM Personal WHERE Id_Personal='P17';
	DELETE FROM Personal WHERE Id_Personal='P18';
	DELETE FROM Personal WHERE Id_Personal='P19';

	SELECT * FROM Personal

	SELECT Id_Personal, MAX("Telefono_Personal")
	FROM Personal
	GROUP BY Id_Personal;

	SELECT A3.Id_Personal,MAX(A3.Telefono_Personal) "Columna conjunta"
	FROM Personal A3
	GROUP BY A3.Id_Personal;


CREATE TABLE Platillos
(Id_Platillo CHAR(4) PRIMARY KEY NOT NULL,  
   Nom_Platillo varchar(20) NOT NULL,  
   Des_Platillo varchar(30) NOT NULL,  
   Porcion_Platillo int NOT NULL,
   Precio_Platillo money NOT NULL,
   Id_Personal CHAR(3) NOT NULL FOREIGN KEY (Id_Personal) REFERENCES Personal(Id_Personal),
	CHECK (Id_Platillo LIKE 'PL[0-9][0-9]'))
	
	INSERT INTO Platillos VALUES ('PL01','Pescado','Empanizado','6','90','P01')
	INSERT INTO Platillos VALUES ('PL02','Camarones','Picante','6','90','P02')
	INSERT INTO Platillos VALUES ('PL03','Coctel','Picante','6','90','P03')
	INSERT INTO Platillos VALUES ('PL04','Alitas','Picante','6','90','P04')
	INSERT INTO Platillos VALUES ('PL05','Pastel','Picante','1','90','P05')
	INSERT INTO Platillos VALUES ('PL06','Hamburguesa','Picante','6','90','P06')
	INSERT INTO Platillos VALUES ('PL07','Pollo','Picante','6','90','P07')
	INSERT INTO Platillos VALUES ('PL08','Caldo camaron','Picante','6','90','P08')
	INSERT INTO Platillos VALUES ('PL09','Caldo Pescado','Picante','4','90','P09')
	INSERT INTO Platillos VALUES ('PL10','Caldo Res','Picante','3','90','P10')
	INSERT INTO Platillos VALUES ('PL11','Empanadas','Picante','6','90','P11')
	INSERT INTO Platillos VALUES ('PL12','Gomitas','Picante','8','90','P12')
	INSERT INTO Platillos VALUES ('PL13','Nieve','Picante','6','90','P13')
	INSERT INTO Platillos VALUES ('PL14','Torta','Picante','6','90','P14')
	INSERT INTO Platillos VALUES ('PL15','Medallones','Picante','6','90','P15')
	INSERT INTO Platillos VALUES ('PL16','Sopa','Picante','6','90','P16')
	INSERT INTO Platillos VALUES ('PL17','Papas fritas','Picante','6','90','P17')
	INSERT INTO Platillos VALUES ('PL18','Tacos','Picante','6','90','P18')
	INSERT INTO Platillos VALUES ('PL19','Tacos Mixta','Picante','6','90','P19')
	INSERT INTO Platillos VALUES ('PL20','Salsa Extra','Picante','6','90','P20')
	
	DELETE FROM Platillos WHERE Id_Platillo='PL15';
	DELETE FROM Platillos WHERE Id_Platillo='PL16';
	DELETE FROM Platillos WHERE Id_Platillo='PL17';
	DELETE FROM Platillos WHERE Id_Platillo='PL18';
	DELETE FROM Platillos WHERE Id_Platillo='PL19';

	UPDATE Platillos SET Nom_Platillo = 'Queso' WHERE Id_Platillo='PL05';
	UPDATE Platillos SET Nom_Platillo = 'Tomate' WHERE Id_Platillo='PL13';
	UPDATE Platillos SET Nom_Platillo = 'Jamon' WHERE Id_Platillo='PL17';
	UPDATE Platillos SET Nom_Platillo = 'Pizza' WHERE Id_Platillo='PL12';
	UPDATE Platillos SET Nom_Platillo = 'Huevo' WHERE Id_Platillo='PL20';

	SELECT * FROM Platillos

	SELECT Id_Platillo, AVG("Precio_Platillo")
	FROM Platillos
	GROUP BY Id_Platillo;

	SELECT A4.Id_Platillo,AVG(A4.Precio_Platillo) "Columna conjunta"
	FROM Platillos A4
	GROUP BY A4.Id_Platillo;

CREATE TABLE Bebidas
(Id_Bebida CHAR(3) PRIMARY KEY NOT NULL,  
   Nom_Bebida varchar(20) NOT NULL,  
   Des_Bebida varchar(30) NOT NULL,  
   Precio_Bebida money NOT NULL,
   Id_Personal CHAR(3) NOT NULL FOREIGN KEY (Id_Personal) REFERENCES Personal(Id_Personal),
	CHECK (Id_Bebida LIKE 'B[0-9][0-9]')) 

	INSERT INTO Bebidas VALUES ('B01','Coca Cola','Ninguna','22','P01')
	INSERT INTO Bebidas VALUES ('B02','Limonada','Ninguna','22','P02')
	INSERT INTO Bebidas VALUES ('B03','Naranjada','Ninguna','22','P03')
	INSERT INTO Bebidas VALUES ('B04','Jugo','Ninguna','22','P04')
	INSERT INTO Bebidas VALUES ('B05','Agua Natural','Ninguna','22','P05')
	INSERT INTO Bebidas VALUES ('B06','Agua Mineral','Ninguna','22','P06')
	INSERT INTO Bebidas VALUES ('B07','Agua de sabor','Ninguna','22','P07')
	INSERT INTO Bebidas VALUES ('B08','Cerveza','Ninguna','22','P08')
	INSERT INTO Bebidas VALUES ('B09','Cerveza Light','Ninguna','22','P09')
	INSERT INTO Bebidas VALUES ('B10','Coca Zero','Ninguna','22','P10')
	SELECT * FROM Bebidas

	SELECT Id_Bebida, AVG("Precio_Bebida")
	FROM Bebidas
	GROUP BY Id_Bebida;

	SELECT A5.Id_Bebida,AVG(A5.Precio_Bebida) "Columna conjunta"
	FROM Bebidas A5
	GROUP BY A5.Id_Bebida;

CREATE TABLE Factura
(N_Factura int PRIMARY KEY NOT NULL,  
	Id_Restaurante CHAR(3) NOT NULL FOREIGN KEY (Id_Restaurante) REFERENCES Restaurante(Id_Restaurante),   
	Id_Mesa CHAR(3) NOT NULL FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id_Mesa),  
	Id_Platillo CHAR(4) NOT NULL FOREIGN KEY (Id_Platillo) REFERENCES Platillos(Id_Platillo), 
	Id_Bebida CHAR(3) NOT NULL FOREIGN KEY (Id_Bebida) REFERENCES Bebidas(Id_Bebida),
	Fecha varchar(30) NOT NULL)

	INSERT INTO Factura VALUES ('01','R01','M01','PL01','B01','2019-04-23')
	INSERT INTO Factura VALUES ('02','R01','M02','PL02','B02','2019-05-29')

	SELECT * FROM Factura

	SELECT N_Factura, MIN("Id_Mesa")
	FROM Factura
	GROUP BY N_Factura;

CREATE TABLE Comanda
(Id_Pedido int PRIMARY KEY NOT NULL,  
   ClienteP varchar (30) NOT NULL FOREIGN KEY (ClienteP) REFERENCES Cliente(Usuario_Cliente),
   PlatilloP CHAR(4) NOT NULL FOREIGN KEY (PlatilloP) REFERENCES Platillos(Id_Platillo),
   BebidaP CHAR(3) NOT NULL FOREIGN KEY (BebidaP) REFERENCES Bebidas(Id_Bebida),
   Ruta_Pedido varchar (30) NOT NULL,
   Fecha_Pedido datetime NOT NULL)

   SELECT * FROM Comanda