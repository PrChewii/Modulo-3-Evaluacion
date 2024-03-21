CREATE SCHEMA `alkemy` ;

-- Creacion de tablas

CREATE TABLE `alkemy`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `balance` INT NULL,
  PRIMARY KEY (`idusuarios`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

CREATE TABLE `alkemy`.`monedas` (
  `idmonedas` INT NOT NULL AUTO_INCREMENT,
  `currency_name` VARCHAR(45) NOT NULL,
  `currency_symbol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmonedas`));

CREATE TABLE `alkemy`.`transaccion` (
  `idtransaccion` INT NOT NULL AUTO_INCREMENT,
  `sender_user_id` INT NULL,
  `receiver_user_id` INT NULL,
  `amount` INT NULL,
  `transaction_date` DATE NULL,
  `currency_id` INT NULL,
  PRIMARY KEY (`idtransaccion`));
  
-- Datos 

INSERT INTO `alkemy`.`usuarios` (`name`, `email`, `password`, `balance`) VALUES
('Juan Perez', 'juan@gmail.com', 'contraseña123', 1800),
('Ana Gomez', 'ana@gmail.com', 'contraseña456', 2500),
('Luis Morales', 'luis@gmail.com', 'contraseña789', 1500);

INSERT INTO `alkemy`.`monedas` (`currency_name`, `currency_symbol`) VALUES
('Dólar Estadounidense', 'USD'),
('Euro', 'EUR'),
('Bitcoin', 'BTC');

INSERT INTO `alkemy`.`transaccion` (`sender_user_id`, `receiver_user_id`, `amount`, `transaction_date`, `currency_id`) VALUES
(1, 2, 100, '2023-01-01', 1),
(2, 3, 200, '2023-01-02', 2),
(1, 3, 300, '2023-01-03', 3);
  
-- Consulta para obtener el nombre de la moneda por un usuario especifico (Reemplazar el ? con el idusuarios especifico)

SELECT DISTINCT m.currency_name
FROM alkemy.monedas m
JOIN transaccion t ON m.idmonedas = t.currency_id
WHERE t.sender_user_id = ? OR t.receiver_user_id = ?;

-- Consulta para obtener todas las transacciones registradas 

SELECT * FROM alkemy.transaccion;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico (Reemplazar el ? con el idusuarios especifico)

SELECT *
FROM alkemy.transaccion
WHERE sender_user_id = ? OR receiver_user_id = ?;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico (Reemplazar el 'nuevo_email@example.com' con el nuevo correo electrónico y ? con el idusuarios del usuario específico):

UPDATE alkemy.usuarios
SET email = 'nuevo_email@example.com'
WHERE idusuarios = ?;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa) (Reemplazar ? con el idtransaccion de la transacción específica que deseas eliminar):

DELETE FROM alkemy.transaccion
WHERE idtransaccion = ?;
