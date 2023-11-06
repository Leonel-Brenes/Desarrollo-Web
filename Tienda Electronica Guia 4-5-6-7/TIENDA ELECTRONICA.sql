-- EJECUTAR POR PASOS PRIMERO EL CREATE
create database TiendaElectronica;
-- EJECUTAR EL USE
use TiendaElectronica;
-- EJECUTAR SOLO LAS QUE CREAN LAS TABLAS
-- Tabla de Categorías
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY identity(1, 1),
    Nombres VARCHAR(50) NOT NULL,
    Descripcion varchar(100)
);

-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY identity(1, 1),
    Nombre VARCHAR(100) NOT NULL,
    Descripcion varchar(100),
    Precio DECIMAL(8, 2) NOT NULL,
    CategoriaID INT,
);

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY identity(1, 1),
    Nombres VARCHAR(50) NOT NULL,
	Apellidos varchar(50) NOT NULL,
    Email VARCHAR(255) NOT NULL,
	DUI varchar(10) not null,
    Telefono VARCHAR(12),
	FechaNac date not null,
    Direccion VARCHAR(100) NOT NULL
);

-- Tabla de Cargo
CREATE TABLE Cargo (
    CargoId INT PRIMARY KEY identity(1, 1),
    Cargo VARCHAR(50) NOT NULL,
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    EmpleadoId INT PRIMARY KEY identity(1, 1),
    Nombres VARCHAR(50) NOT NULL,
	Apellidos varchar(50) NOT NULL,
    Email VARCHAR(255) NOT NULL,
	DUI varchar(10) not null,
    Telefono VARCHAR(12),
	FechaNac date not null,
    Direccion VARCHAR(100) NOT NULL,
	CargoId int,
);

-- Tabla de Pedidos
CREATE TABLE Factura (
    FacturaId INT PRIMARY KEY identity(1, 1),
    ClienteID INT,
	EmpleadoId int,
    FechaFactura DATE NOT NULL,
);

-- Tabla de Detalles de Pedidos
CREATE TABLE DetallesFactura(
    DetalleID INT PRIMARY KEY identity(1, 1),
    FacturaId INT,
    ProductoID INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(8, 2) NOT NULL,
	Total decimal(8,2) not null
);

create table Usuario(
Id_usuario int primary key not null identity(1,1),
Id_empleado int not null,
Id_rol int not null,
Usuario varchar(50) not null,
Clave varchar(50) not null
)

create table Roles(
Id_Rol int not null primary key identity(1,1),
NombreRol varchar(50) not null
)

create table AsignacionRolesOpciones(
ID_AsignacionRol int not null primary key identity(1,1),
ID_Rol int not null,
ID_Opcion int not null
)

create table Opciones(
ID_Opcion int not null primary key identity(1,1),
NombreOpcion varchar(50)not null,
)

-- LUEGO DE EJECUTAR TABLAS EJECUTAR LOS ALTER Y ADD FOREIGN KEY
alter table Empleados add foreign key(CargoID) references Cargo(CargoID);
alter table Factura add foreign key(ClienteID) references Clientes(ClienteID);
alter table Factura add foreign key(EmpleadoId) references Empleados(EmpleadoId);
alter table DetallesFactura add foreign key(FacturaId) references Factura(FacturaId);
alter table DetallesFactura add foreign key(ProductoID) references Productos(ProductoID);
ALTER TABLE Usuario
ADD FOREIGN KEY(Id_empleado) REFERENCES Empleados(EmpleadoId)
ALTER TABLE Usuario
ADD FOREIGN KEY(Id_rol) REFERENCES Roles(Id_Rol)
ALTER TABLE AsignacionRolesOpciones
ADD FOREIGN KEY(Id_Rol) REFERENCES Roles(Id_Rol)
ALTER TABLE AsignacionRolesOpciones
ADD FOREIGN KEY(ID_Opcion) REFERENCES Opciones(ID_Opcion)
alter table Productos add foreign key(CategoriaID) references Categorias(CategoriaID);


-- EJECUTAR LUEGO ROLES (SOLO ROLES)
-- ROLES
go 
create role SysAdmin;
create role Vendedor;
create role RRHH;
create role Atencion_Al_Cliente;
create role Bodeguero;
create role Motorista;

--LUEGO EJECUTAR SOLO ADMINISTRADORES
--ADMINISTRADOR
go 
create login login_admin_SYSAdmin
with password = 'root';
--VENDEDOR
go
create login login_ventas
with password = 'ventas_01';
--RRHH
go 
create login login_RRHH
with password = 'rrhh_01';
--ATENCION AL CLIENTE
go 
create login At_Cliente
with password = 'ATT_Cliente';
--BODEGUERO
go 
create login Bodega_login
with password = 'Store_user';
--MOTORISTA
go 
create login Motorista_login
with password = '1234';


---------------------------------------------------------------------------------------------------------
--EJECUTAR DESPUES SOLO USUARIOS

--ADMINISTRADOR
go
create user Administrator
for login login_admin_SYSAdmin;
--VENDEDOR
go
create user Ventas
for login login_ventas;
--RRHH
go 
create user user_RRHH
for login login_RRHH;
--ATENCION AL CLIENTE
go 
create user user_At_Cliente
for login At_Cliente;
--BODEGUERO
go 
create user user_Bodega
for login Bodega_login;
--MOTORISTA
go 
create user user_Motorista
for login Motorista_login;

-- DESPUES EJECUTAR SOLO PERMISOS DE ADMIN
go
-- Administrador
grant control on database::TiendaElectronica to Administrator;
--Vendedor
grant select, update on dbo.Productos to Vendedor;
--RRHH
grant select, select, update on dbo.Empleados to RRHH;
grant select, delete, update on dbo.Cargo to RRHH;
--Atencion al cliente
grant select on dbo.Productos to Atencion_al_cliente;
grant update on dbo.Clientes to Atencion_al_cliente;
--Bodeguero
grant select, insert, delete on dbo.Productos to Bodeguero;
--Motorista
grant select on dbo.Productos to Motorista;

-- ESTO SON LAS CONSULTAS EJECUTAR PARA CORROBORAR
go
-- Consulta para obtener una lista de logins en la instancia de SQL Server
select name from sys.server_principals where type_desc = 'SQL_LOGIN';
go
-- Consulta para obtener una lista de usuarios en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'SQL_USER';
go
-- Consulta para obtener una lista de roles en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'DATABASE_ROLE';



-- EJECUTAR LOS REGISTROS
use TiendaElectronica;

INSERT INTO Cargo (Cargo) VALUES
('Empleado'),
('Bodeguero'),
('Motorista'),
('Cajero'),
('Atencion al cliente')

select * from Cargo;

INSERT INTO Categorias (Nombres,Descripcion) VALUES 
('Audio', 'equipo de sonido'),
('Computacion','electronico'),
('Electronica' , 'piezas'),
('Instrumentos', 'todo tipo de instrumentos'),
('Repuesto','electrodomesticos');

INSERT INTO Clientes(Nombres, Apellidos,Email,DUI,Telefono,FechaNac,Direccion) VALUES
('Juan', 'Perez','juan@gmail.com','12345','12345','01-01-2000','sonsonate'),
('Gerson', 'Daniel','gerson@gmail.com', '12345','12435','01-01-2023','sonsonate'),
('Juana','Javier','juana@gmail.com','123455','65424','03-05-2002','sonsonate'),
('Ivan','Sanchez','ivan@gmail.com','821763','7623763','10-02-2001','sonsonate'),
('Tania','De avila','tania@gmail.com','38383','12376','10-02-2001','sonsonate');

INSERT INTO Empleados(Nombres, Apellidos,Email,DUI,Telefono,FechaNac,Direccion,CargoId) VALUES
('Luis', 'Perez','luis@gmail.com','12345','12345','01-01-2000','sonsonate',1),
('Maria', 'Daniel','maria@gmail.com', '12345','12435','01-01-2023','sonsonate',2),
('Josue','Javier','josue@gmail.com','123455','65424','03-05-2002','sonsonate',3),
('Melvin','Sanchez','melvin@gmail.com','821763','7623763','10-02-2001','sonsonate',4),
('Kevin','De avila','kevin@gmail.com','38383','12376','10-02-2001','sonsonate',5);

INSERT INTO Productos(Nombre, Descripcion,Precio,CategoriaID) VALUES
('Audifonos', 'Audio',5.00,1),
('Teclado', 'Electronico',8.50,2),
('Diodo','piezas',0.6,3),
('Trompeta','viento',75,4),
('Fuente de poder','licuadora',5.50,5);

INSERT INTO Factura(ClienteID, EmpleadoId,FechaFactura) VALUES
(1, 1,'10-02-2001'),
(1, 2,'10-02-2022'),
(1, 3,'10-02-2019'),
(1, 4,'10-02-2020');

select * from Factura;

INSERT INTO DetallesFactura(FacturaId, ProductoID,Cantidad,PrecioUnitario,Total) VALUES
(1,1,3,2.50,7.5),
(2,2,3,2.00,6.00),
(3,3,3,8.00,24.00),
(4,4,3,5.00,15.00)