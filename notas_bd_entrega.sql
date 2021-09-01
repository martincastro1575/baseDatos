-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-09-2021 a las 07:27:29
-- Versión del servidor: 8.0.26-0ubuntu0.20.04.2
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notas_bd`
--
CREATE DATABASE IF NOT EXISTS `notas_bd` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `notas_bd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `categorias`:
--

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Categoria 1'),
(2, 'Categoria 2'),
(3, 'Categoria 3'),
(4, 'Categoria 4'),
(5, 'Categoria 5'),
(6, 'Categoria 6'),
(7, 'Categoria 7'),
(8, 'Categoria 8'),
(9, 'Categoria 9'),
(10, 'Categoria 10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestiones`
--

DROP TABLE IF EXISTS `gestiones`;
CREATE TABLE IF NOT EXISTS `gestiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `gestiones`:
--

--
-- Volcado de datos para la tabla `gestiones`
--

INSERT INTO `gestiones` (`id`, `nombre`) VALUES
(1, 'Creacion'),
(2, 'Modificacion'),
(3, 'Bloquear'),
(4, 'Eliminar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` text COLLATE utf8_unicode_ci,
  `bloqueada` tinyint NOT NULL DEFAULT '0',
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuario_id` (`usuario_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `notas`:
--   `usuario_id`
--       `usuarios` -> `id`
--

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `titulo`, `fecha_creacion`, `descripcion`, `bloqueada`, `usuario_id`) VALUES
(1, 'Nota1', '2021-09-01 09:40:37', 'Esta es la nota1', 0, 1),
(2, 'nota 2', '2021-09-01 09:40:37', 'Esta es la Nota 2', 0, 5),
(3, 'Nota 3', '2021-09-01 09:48:31', 'Esta es la nota 3', 0, 8),
(4, 'Nota 4', '2021-09-01 09:48:31', 'Esta es la nota 4', 0, 1),
(5, 'Nota 5', '2021-09-01 09:48:31', 'Esta es la nota 5', 1, 6),
(6, 'Nota 6', '2021-09-01 09:48:31', 'Esta es la nota 6', 0, 6),
(7, 'Nota 7', '2021-09-01 09:48:31', 'Esta es la nota 7', 0, 5),
(8, 'Nota 8', '2021-09-01 09:48:31', 'Esta es la Nota 8', 0, 8),
(9, 'Nota 9', '2021-09-01 09:48:31', 'Esta es la nota 9', 0, 7),
(10, 'Nota 10', '2021-09-01 09:48:31', 'Esta es la nota 10', 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_categorias`
--

DROP TABLE IF EXISTS `notas_categorias`;
CREATE TABLE IF NOT EXISTS `notas_categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria_id` int NOT NULL,
  `nota_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_categoria_id` (`categoria_id`) USING BTREE,
  KEY `FK_nota_id` (`nota_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `notas_categorias`:
--   `nota_id`
--       `notas` -> `id`
--   `categoria_id`
--       `categorias` -> `id`
--

--
-- Volcado de datos para la tabla `notas_categorias`
--

INSERT INTO `notas_categorias` (`id`, `categoria_id`, `nota_id`) VALUES
(1, 2, 3),
(2, 4, 3),
(3, 1, 10),
(4, 6, 10),
(5, 9, 6),
(6, 8, 6),
(7, 4, 7),
(8, 1, 2),
(9, 2, 3),
(10, 4, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_gestiones_usuarios`
--

DROP TABLE IF EXISTS `notas_gestiones_usuarios`;
CREATE TABLE IF NOT EXISTS `notas_gestiones_usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `nota_id` int NOT NULL,
  `gestion_id` int NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_usuario_id` (`usuario_id`) USING BTREE,
  KEY `FK_gestion_id` (`gestion_id`) USING BTREE,
  KEY `FK_nota_id` (`nota_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `notas_gestiones_usuarios`:
--   `usuario_id`
--       `usuarios` -> `id`
--   `gestion_id`
--       `gestiones` -> `id`
--   `nota_id`
--       `notas` -> `id`
--

--
-- Volcado de datos para la tabla `notas_gestiones_usuarios`
--

INSERT INTO `notas_gestiones_usuarios` (`id`, `usuario_id`, `nota_id`, `gestion_id`, `fecha_modificacion`) VALUES
(1, 1, 1, 1, '2021-09-01 10:05:42'),
(2, 8, 3, 1, '2021-09-01 10:05:42'),
(3, 8, 8, 1, '2021-09-01 10:08:04'),
(4, 8, 10, 1, '2021-09-01 10:08:04'),
(5, 8, 10, 3, '2021-09-01 10:08:31'),
(6, 5, 2, 1, '2021-09-01 10:10:26'),
(7, 5, 7, 1, '2021-09-01 10:10:26'),
(8, 1, 4, 1, '2021-09-01 10:11:42'),
(9, 1, 4, 2, '2021-09-01 10:12:00'),
(10, 6, 5, 1, '2021-09-01 10:12:37'),
(11, 6, 5, 4, '2021-09-01 10:13:08'),
(12, 6, 6, 1, '2021-09-01 10:13:31'),
(13, 7, 9, 1, '2021-09-01 10:14:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `usuarios`:
--

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`) VALUES
(1, 'Martin Castro', 'martin.castro@gmail.com'),
(2, 'Maria Perez', 'mperez@gmail.com'),
(3, 'Pedro Jimenez', 'pjimenez@gmail.com'),
(4, 'Esther Curz', 'ecruz@gmail.com'),
(5, 'Juan Blanco', 'jblanco@gmail.com'),
(6, 'Carolina Herrera', 'cherrera@gmail.com'),
(7, 'Catherine Fullop', 'cfullop@gmail.com'),
(8, 'Carl Louis', 'clouis@gmail.com'),
(9, 'Martin Castro', 'martin.castro@gmail.com'),
(10, 'Maria Perez', 'mperez@gmail.com');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `notas_categorias`
--
ALTER TABLE `notas_categorias`
  ADD CONSTRAINT `notas_categorias_ibfk_1` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`),
  ADD CONSTRAINT `notas_categorias_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `notas_gestiones_usuarios`
--
ALTER TABLE `notas_gestiones_usuarios`
  ADD CONSTRAINT `notas_gestiones_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `notas_gestiones_usuarios_ibfk_2` FOREIGN KEY (`gestion_id`) REFERENCES `gestiones` (`id`),
  ADD CONSTRAINT `notas_gestiones_usuarios_ibfk_3` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
