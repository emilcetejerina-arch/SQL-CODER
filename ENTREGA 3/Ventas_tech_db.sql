/* 1 DROP TABLES*/

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

/* 2 CREATE TABLES*/
CREATE TABLE Categorias(
   ID_CATEGORIA INT PRIMARY KEY,
   NOMBRE_CATEGORIA VARCHAR(50) NOT NULL,
   DESCRIPCION VARCHAR(200)
   );

CREATE TABLE Clientes (
   ID_CLIENTE  INT PRIMARY KEY,
   NOMBRE VARCHAR(100) NOT NULL,
   EMAIL VARCHAR(100) UNIQUE,
   CIUDAD VARCHAR(50),
   FECHA_REGISTRO DATE NOT NULL,
   );

CREATE TABLE Productos(
   ID_PRODUCTO INT PRIMARY KEY,
   NOMBRE_PRODUCTO VARCHAR(100) NOT NULL,
   ID_CATEGORIA INT 
     FOREIGN KEY REFERENCES Categorias(ID_CATEGORIA),
   PRECIO DECIMAL(10,2) NOT NULL,
   STOCK INT DEFAULT 0,
   ACTIVO BIT DEFAULT 1
   );

CREATE TABLE Ventas(
   ID_VENTA INT PRIMARY KEY,
   ID_CLIENTE INT 
      FOREIGN KEY REFERENCES Clientes(ID_CLIENTE),
   ID_PRODUCTO INT
      FOREIGN KEY REFERENCES Productos(ID_PRODUCTO),
   CANTIDAD INT NOT NULL,
   PRECIO_UNITARIO DECIMAL(10,2) NOT NULL,
   FECHA_VENTA DATE NOT NULL
   );

   /* 3 INSERT DATA*/

 INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
  (1, 'Computación',    'Laptops, PCs y monitores'),
  (2, 'Accesorios',     'Periféricos y complementos'),
  (3, 'Audio',          'Auriculares y parlantes'),
  (4, 'Almacenamiento', 'Discos y memorias');


INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
  (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
  (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
  (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
  (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
  (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');


INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
  (1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
  (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
  (3, 'Monitor 4K 27',      1,  450.00, 12, 1),
  (4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
  (5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
  (6, 'Teclado Mecánico',   2,   95.00, 40, 1);


INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
  ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
  ( 2, 2, 2, 5,   28.00, '2024-03-06'),
  ( 3, 3, 3, 1,  450.00, '2024-03-07'),
  ( 4, 1, 4, 2,  120.00, '2024-03-08'),
  ( 5, 4, 5, 3,  130.00, '2024-03-10'),
  ( 6, 2, 6, 4,   95.00, '2024-03-11'),
  ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
  ( 8, 3, 2, 8,   28.00, '2024-03-13'),
  ( 9, 4, 4, 1,  120.00, '2024-03-14'),
  (10, 5, 3, 2,  450.00, '2024-03-15');

  /* 4 VALIDACION */

 SELECT * FROM categorias;
 SELECT * FROM clientes;
 SELECT * FROM productos;
 SELECT * FROM ventas;
