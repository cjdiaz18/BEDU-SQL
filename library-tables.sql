-- Creando una tabla de datos con cierto formato
CREATE TABLE books (
  bookid INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(250) NOT NULL,
  author VARCHAR(250) NOT NULL,
  published DATE NOT NULL,
  stock INT NOT NULL,
  PRIMARY KEY (bookid)
);

-- Insertando datos en una tabla
INSERT INTO books (title, author, published, stock)
VALUES ('Don Quijote de la Mancha', 'Miguel de Cervantes', '2012-03-27',5),
       ('Historia de dos ciudades', 'Charles Dickens', '',120),
       ('El Señor de los Anillos', 'J. R. R. Tolkien', '',189),
       ('El principito', 'Antoine de Saint-Exupéry', '',245),
       ('El Hobbit', 'J. R. R. Tolkien', '',1),
       ('Sueño en el pabellón rojo', 'Cao Xueqin', '',283),
       ('Las aventuras de Alicia en el país de las maravillas', 'Lewis Carroll', '',130),
       ('Triple representatividad', 'Jiang Zemin', '',12),
       ('Y no quedó ninguno (Diez negritos)', 'Agatha Christie', '',0),
       ('El león, la bruja y el armario', 'C. S. Lewis', '',0),
       ('Ella', 'Henry Rider Haggard', '',0),
       ('El código Da Vinci', 'Dan Brown', '',0),
       ('El guardián entre el centeno', 'J. D. Salinger', '',0),
       ('El alquimista', 'Paulo Coelho', '',0),
       ('El camino a Cristo', 'Ellen G. White', '',0),
       ('Heidi', 'Johanna Spyri', '',0),
       ('El libro del sentido del común del cuidado de bebés y niños (Tu hijo)', 'Dr. Benjamin Spock', '',0),
       ('Ana de las Tejas Verdes', 'Lucy Maud Montgomery', '',0),
       ('Azabache (Bella Negra)', 'Anna Sewell', '',0),
       ('El nombre de la rosa', 'Umberto Eco', '',0);


-- Creando tabla de usuarios
CREATE TABLE members (
  memberid INT NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(250) NOT NULL,
  lastname VARCHAR(250) NOT NULL,
  PRIMARY KEY (memberid)
);

-- Insertando datos en una tabla
INSERT INTO members (firstname, lastname)
VALUES ('Carlos', 'Diaz'),
       ('Sofia', 'Vergara'),
       ('Julio', 'Guevara'),
       ('Arlet', 'Rodriguez'),
       ('Roberto', 'Bolaños');

-- Insertando una nueva columna
ALTER TABLE members
ADD cellphone VARCHAR(10);

-- Update de varios campos
UPDATE members
SET cellphone = '3334053998'
WHERE memberid = 1

-- Insertando miembro nuevo ya con el campo de cellphone
INSERT INTO members (firstname, lastname, cellphone)
VALUES ('Alfredo', 'Cardenas', '8789476509');

-- Borrar una fila
DELETE FROM members WHERE memberid = 6;

-- Insertando una nueva columna en members country
ALTER TABLE members
ADD country VARCHAR(50) NOT NULL;

-- Agregando Default en campo de country como Mexico
ALTER TABLE members ALTER country SET DEFAULT 'Mexico'

-- Creando nueva tabla de libros prestados
CREATE TABLE borrowings (
  borrowingid INT NOT NULL AUTO_INCREMENT,
  bookid INT NOT NULL,
  memberid INT NOT NULL,
  borrowdate DATE NOT NULL,
  returndate DATE NOT NULL,
  PRIMARY KEY (borrowingid),
  FOREIGN KEY (bookid) REFERENCES books(bookid),
  FOREIGN KEY (memberid) REFERENCES members(memberid)
);

--
INSERT INTO borrowings (bookid, memberid, borrowdate, returndate)
VALUES (3, 2, '2019-09-23' '2019-10-04'),
       (2, 1, '2019-04-16' '2019-08-01'),
       (1, 3, '2019-05-23' '2019-06-23')