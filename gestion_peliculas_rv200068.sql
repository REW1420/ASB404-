-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 04-03-2025 a las 21:31:38
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
-- Base de datos: `gestion_peliculas_rv200068`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

CREATE TABLE `actor` (
  `codigo_actor` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int(8) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actor`
--

INSERT INTO `actor` (`codigo_actor`, `email`, `telefono`, `fecha_nacimiento`, `nombre`, `apellido`) VALUES
(1, 'nose1@mail.com', 12345678, '1990-01-01', 'Denzel', 'Washigton'),
(2, 'nose2@mail.com', 12345678, '1990-01-01', 'Joaquin', 'Phoneix'),
(3, 'nose3@mail.com', 12345678, '1990-01-01', 'Christian', 'Bale');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actua`
--

CREATE TABLE `actua` (
  `codigo_actor` int(11) NOT NULL,
  `codigo_pelicula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actua`
--

INSERT INTO `actua` (`codigo_actor`, `codigo_pelicula`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudio`
--

CREATE TABLE `estudio` (
  `codigo_estudio` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudio`
--

INSERT INTO `estudio` (`codigo_estudio`, `nombre`, `direccion`, `ciudad`, `pais`) VALUES
(1, 'Los ocho majors de la Época Dorada', 'nose', 'nose', 'nose'),
(2, 'Columbia Pictures', 'nose', 'nose', 'nose'),
(3, '20th Century-Fox', 'nose', 'nose', 'nose');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `codigo_pelicula` int(11) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `codigo_estudio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`codigo_pelicula`, `direccion`, `titulo`, `codigo_estudio`) VALUES
(1, 'no se', 'Amélie', 1),
(2, 'no se', 'Vértico', 2),
(3, 'no se', 'Cafarnaúm', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`codigo_actor`);

--
-- Indices de la tabla `actua`
--
ALTER TABLE `actua`
  ADD PRIMARY KEY (`codigo_actor`,`codigo_pelicula`),
  ADD KEY `codigo_pelicula` (`codigo_pelicula`);

--
-- Indices de la tabla `estudio`
--
ALTER TABLE `estudio`
  ADD PRIMARY KEY (`codigo_estudio`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`codigo_pelicula`),
  ADD KEY `codigo_estudio` (`codigo_estudio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actor`
--
ALTER TABLE `actor`
  MODIFY `codigo_actor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estudio`
--
ALTER TABLE `estudio`
  MODIFY `codigo_estudio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `codigo_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actua`
--
ALTER TABLE `actua`
  ADD CONSTRAINT `actua_ibfk_1` FOREIGN KEY (`codigo_actor`) REFERENCES `actor` (`codigo_actor`),
  ADD CONSTRAINT `actua_ibfk_2` FOREIGN KEY (`codigo_pelicula`) REFERENCES `pelicula` (`codigo_pelicula`);

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`codigo_estudio`) REFERENCES `estudio` (`codigo_estudio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
