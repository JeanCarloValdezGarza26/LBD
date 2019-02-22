create database Restaurante;
create table Platillos(
platillo_id int not null,
nombre_platillo varchar(50),
costo_platillo int, 
)
INSERT INTO Platillos VALUES ( 1, 'Ensalada', 120 );
INSERT INTO Platillos VALUES ( 2, 'Pollo asado', 145 );
INSERT INTO Platillos VALUES ( 3, 'Sopa', 85 );

select*from Platillos