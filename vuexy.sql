-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2023 a las 17:42:49
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vuexy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idrol` int(11) NOT NULL,
  `nombreRol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idrol`, `nombreRol`) VALUES
(1, 'Dispensador'),
(2, 'Seguridad'),
(3, 'Cajero'),
(4, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombre`, `email`, `password`, `cargo`, `estado`, `token`) VALUES
(1, 'Juan Gomez', 'juan@juan.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Seguridad', 1, NULL),
(3, 'Alfonsoooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Vendedor', 0, NULL),
(4, 'Alfonsooooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Vendedor', 0, NULL),
(5, 'Alfonsooooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Vendedor', 0, NULL),
(6, 'Alfonsooooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Seguridad', 0, NULL),
(7, 'Alfonsooooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Dispensador', 0, NULL),
(8, 'Alfonsooooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Cajero', 0, NULL),
(9, 'Alfonsooooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Cajero', 0, NULL),
(10, 'Alfonsooooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Dispensador', 0, NULL),
(11, 'Alfonsooooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Dispensador', 1, NULL),
(12, 'Alfonsooooo', 'pruebaphpcode@gmail.com', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Cajero', 1, NULL),
(13, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'c7e52d8590eaed2bc3558eacd21b5ed7d1ac0770507440f8bc2748308090bc77', 'Seguridad', 1, NULL),
(14, 'PAULINOO', '1923010051@untels.edu.pe', '07123e1f482356c415f684407a3b8723e10b2cbbc0b8fcd6282c49d37c9c1abc', 'Seguridad', 1, NULL),
(15, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'c7e52d8590eaed2bc3558eacd21b5ed7d1ac0770507440f8bc2748308090bc77', 'Cajero', 1, NULL),
(16, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'Dispensador', 1, NULL),
(17, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'Dispensador', 1, NULL),
(18, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Dispensador', 1, NULL),
(19, 'POLO JS', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 1, NULL),
(20, 'PAULI', '1923010051@untels.edu.pe', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'Dispensador', 1, NULL),
(21, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'Dispensador', 1, NULL),
(22, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'Dispensador', 1, NULL),
(23, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Dispensador', 1, NULL),
(24, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 1, NULL),
(25, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Seguridad', 1, NULL),
(26, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'Dispensador', 1, NULL),
(27, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 1, NULL),
(28, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '96e9203b18cd0f84ca9445588bec9838f20b6967072d43599a2cd21eb182b336', 'Vendedor', 1, NULL),
(29, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Seguridad', 0, NULL),
(30, 'PAULI', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Seguridad', 0, NULL),
(31, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Seguridad', 1, NULL),
(32, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '2aeb25716a0a859efb6c2607950ee8293e1c25a57259c46db9b60f30858a21fe', 'Dispensador', 1, NULL),
(33, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Seguridad', 1, NULL),
(34, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '8a86c4eecf12446ff273afc03e1b3a09a911d0b7981db1af58cb45c439161295', 'Dispensador', 1, NULL),
(35, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 1, NULL),
(36, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 1, NULL),
(37, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 1, NULL),
(38, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', 'f4bf9f7fcbedaba0392f108c59d8f4a38b3838efb64877380171b54475c2ade8', 'Seguridad', 1, NULL),
(39, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 1, NULL),
(40, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 1, NULL),
(41, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '2aeb25716a0a859efb6c2607950ee8293e1c25a57259c46db9b60f30858a21fe', 'Seguridad', 1, NULL),
(42, 'PAULI', '1923010051@untels.edu.pe', '75be28421e846fec54cea35951aadfb8c9617e0698481bfe5a5efe559f3a0497', 'Cajero', 1, NULL),
(43, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 0, NULL),
(44, 'asd', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Seguridad', 0, NULL),
(45, 'PAULINO ', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 0, NULL),
(46, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Seguridad', 0, NULL),
(47, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Cajero', 1, NULL),
(48, 'PAULINOHHHHHHHHHHHHHH', '1923010051@untels.edu.pe', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'Dispensador', 1, NULL),
(49, 'PAULINOOasad', '1923010051@untels.edu.pe', '2aeb25716a0a859efb6c2607950ee8293e1c25a57259c46db9b60f30858a21fe', 'Seguridad', 1, NULL),
(50, 'PAULINO ALFONSO', '1923010051@untels.edu.pe', '2aeb25716a0a859efb6c2607950ee8293e1c25a57259c46db9b60f30858a21fe', 'Dispensador', 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
