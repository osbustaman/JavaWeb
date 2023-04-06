-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2023 a las 03:01:48
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
-- Base de datos: `bd_gestion_personas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gp_colaborador`
--

CREATE TABLE `gp_colaborador` (
  `id` int(11) NOT NULL,
  `rut` varchar(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `comuna_id` int(11) DEFAULT NULL,
  `estado_civil` int(11) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `fecha_ingreso` varchar(20) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `token_sesion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gp_colaborador`
--

INSERT INTO `gp_colaborador` (`id`, `rut`, `nombres`, `apellidos`, `direccion`, `pais_id`, `region_id`, `comuna_id`, `estado_civil`, `sexo`, `empresa_id`, `cargo_id`, `fecha_ingreso`, `password`, `perfil_id`, `token_sesion`) VALUES
(2, '16090942-0', 'Homero', 'Simpsons', NULL, 1, 6, 99, NULL, NULL, 1, NULL, NULL, '57bb1d45f14f666634cdb5249c129be8', 1, '2dA0Z7JnK9WiFgX81eJeEYNoICaQrrz6mYrj14PYzIhcm9myaPaTIuYAzQQJEyuImcqtBCYKOUMKBQEzwPahPwyIH42bwb2TVy2O0qm1kCKyPUvdTOhjdhwxZgy0G2d5j7tK9fRDnDVYH8QAx46CHo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gp_colaborador`
--
ALTER TABLE `gp_colaborador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pais_colaborador` (`pais_id`),
  ADD KEY `fk_region_colaborador` (`region_id`),
  ADD KEY `fk_comuna_colaborador` (`comuna_id`),
  ADD KEY `fk_empresa_colaborador` (`empresa_id`),
  ADD KEY `fk_cargo_colaborador` (`cargo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `gp_colaborador`
--
ALTER TABLE `gp_colaborador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gp_colaborador`
--
ALTER TABLE `gp_colaborador`
  ADD CONSTRAINT `fk_cargo_colaborador` FOREIGN KEY (`cargo_id`) REFERENCES `gp_cargo` (`id`),
  ADD CONSTRAINT `fk_comuna_colaborador` FOREIGN KEY (`comuna_id`) REFERENCES `gp_comuna` (`id`),
  ADD CONSTRAINT `fk_empresa_colaborador` FOREIGN KEY (`empresa_id`) REFERENCES `gp_empresa` (`id`),
  ADD CONSTRAINT `fk_pais_colaborador` FOREIGN KEY (`pais_id`) REFERENCES `gp_pais` (`id`),
  ADD CONSTRAINT `fk_region_colaborador` FOREIGN KEY (`region_id`) REFERENCES `gp_region` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
