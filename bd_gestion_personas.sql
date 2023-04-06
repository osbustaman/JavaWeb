-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2023 a las 03:54:24
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
-- Estructura de tabla para la tabla `gp_cargo`
--

CREATE TABLE `gp_cargo` (
  `id` int(11) NOT NULL,
  `nombre_cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(2, '16090942-0', 'Homero', 'Simpsons', NULL, 1, 6, 99, NULL, NULL, 1, NULL, NULL, '57bb1d45f14f666634cdb5249c129be8', 1, 'EiQSHCoTRqZsNWnHZmWNnvgAFdj4sXbDbUKjnPnzPwB1JtNkOZSMkGqhYk5hwizqD1ndt9Yg6lhIXN1k8r6rquSwD2NKacpoydHHoiT1g52zIrMIALgwO4xkouSWvawNNvTwOsn6oGovNPg9eb5RCT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gp_comuna`
--

CREATE TABLE `gp_comuna` (
  `id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `nombre_comuna` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gp_comuna`
--

INSERT INTO `gp_comuna` (`id`, `region_id`, `nombre_comuna`) VALUES
(1, 1, 'Iquique'),
(2, 1, 'Alto Hospicio'),
(3, 1, 'Pozo Almonte'),
(4, 1, 'Camiña'),
(5, 1, 'Colchane'),
(6, 1, 'Huara'),
(7, 1, 'Pica'),
(8, 2, 'Antofagasta'),
(9, 2, 'Mejillones'),
(10, 2, 'Sierra Gorda'),
(11, 2, 'Taltal'),
(12, 2, 'Calama'),
(13, 2, 'Ollagüe'),
(14, 2, 'San Pedro de Atacama'),
(15, 2, 'Tocopilla'),
(16, 2, 'María Elena'),
(17, 3, 'Copiapó'),
(18, 3, 'Caldera'),
(19, 3, 'Tierra Amarilla'),
(20, 3, 'Chañaral'),
(21, 3, 'Diego de Almagro'),
(22, 3, 'Vallenar'),
(23, 3, 'Alto del Carmen'),
(24, 3, 'Freirina'),
(25, 3, 'Huasco'),
(26, 4, 'Huasco'),
(27, 4, 'La Serena'),
(28, 4, 'Coquimbo'),
(29, 4, 'Andacollo'),
(30, 4, 'La Higuera'),
(31, 4, 'Paiguano'),
(32, 4, 'Vicuña'),
(33, 4, 'Illapel'),
(34, 4, 'Canela'),
(35, 4, 'Los Vilos'),
(36, 4, 'Salamanca'),
(37, 4, 'Ovalle'),
(38, 4, 'Combarbalá'),
(39, 4, 'Monte Patria'),
(40, 4, 'Punitaqui'),
(41, 4, 'Río Hurtado'),
(42, 5, 'Río Hurtado'),
(43, 5, 'Valparaíso'),
(44, 5, 'Casablanca'),
(45, 5, 'Concón'),
(46, 5, 'Juan Fernández'),
(47, 5, 'Puchuncaví'),
(48, 5, 'Quilpué'),
(49, 5, 'Quintero'),
(50, 5, 'Villa Alemana'),
(51, 5, 'Viña del Mar'),
(52, 5, 'Isla de Pascua'),
(53, 5, 'Los Andes'),
(54, 5, 'Calle Larga'),
(55, 5, 'Rinconada'),
(56, 5, 'San Esteban'),
(57, 5, 'La Ligua'),
(58, 5, 'Cabildo'),
(59, 5, 'Papudo'),
(60, 5, 'Petorca'),
(61, 5, 'Zapallar'),
(62, 5, 'Quillota'),
(63, 5, 'Calera'),
(64, 5, 'Hijuelas'),
(65, 5, 'La Cruz'),
(66, 5, 'Limache'),
(67, 5, 'Nogales'),
(68, 5, 'Olmué'),
(69, 5, 'San Antonio'),
(70, 5, 'Algarrobo'),
(71, 5, 'Cartagena'),
(72, 5, 'El Quisco'),
(73, 5, 'El Tabo'),
(74, 5, 'Santo Domingo'),
(75, 5, 'San Felipe'),
(76, 5, 'Catemu'),
(77, 5, 'Llaillay'),
(78, 5, 'Panquehue'),
(79, 5, 'Putaendo'),
(80, 5, 'Santa María'),
(81, 6, 'Santiago'),
(82, 6, 'Cerrillos'),
(83, 6, 'Cerro Navia'),
(84, 6, 'Conchalí'),
(85, 6, 'El Bosque'),
(86, 6, 'Estación Central '),
(87, 6, 'Huechuraba'),
(88, 6, 'Independencia'),
(89, 6, 'La Cisterna'),
(90, 6, 'La Florida'),
(91, 6, 'La Pintana'),
(92, 6, 'La Granja'),
(93, 6, 'La Reina'),
(94, 6, 'Las Condes'),
(95, 6, 'Lo Barnechea'),
(96, 6, 'Lo Espejo'),
(97, 6, 'Lo Prado'),
(98, 6, 'Macul'),
(99, 6, 'Maipú'),
(100, 6, 'Ñuñoa'),
(101, 6, 'Pedro Aguirre Cerda'),
(102, 6, 'Peñalolén'),
(103, 6, 'Providencia'),
(104, 6, 'Pudahuel'),
(105, 6, 'Quilicura'),
(106, 6, 'Quinta Normal'),
(107, 6, 'Recoleta'),
(108, 6, 'Renca'),
(109, 6, 'San Joaquín'),
(110, 6, 'San Miguel'),
(111, 6, 'San Ramón'),
(112, 6, 'Vitacura'),
(113, 6, 'Puente Alto'),
(114, 6, 'Pirque'),
(115, 6, 'San José de Maipo'),
(116, 6, 'Colina'),
(117, 6, 'Lampa'),
(118, 6, 'Tiltil'),
(119, 6, 'San Bernardo'),
(120, 6, 'Buin'),
(121, 6, 'Calera de Tango'),
(122, 6, 'Paine'),
(123, 6, 'Melipilla'),
(124, 6, 'Alhué'),
(125, 6, 'Curacaví'),
(126, 6, 'María Pinto'),
(127, 6, 'San Pedro'),
(128, 6, 'Talagante'),
(129, 6, 'El Monte'),
(130, 6, 'Isla de Maipo'),
(131, 6, 'Padre Hurtado'),
(132, 6, 'Peñaflor'),
(133, 7, 'Rancagua'),
(134, 7, 'Codegua'),
(135, 7, 'Coinco'),
(136, 7, 'Coltauco'),
(137, 7, 'Doñihue'),
(138, 7, 'Graneros'),
(139, 7, 'Las Cabras'),
(140, 7, 'Machalí'),
(141, 7, 'Malloa'),
(142, 7, 'Mostazal'),
(143, 7, 'Olivar'),
(144, 7, 'Peumo'),
(145, 7, 'Pichidegua'),
(146, 7, 'Quinta de Tilcoco'),
(147, 7, 'Rengo'),
(148, 7, 'Requínoa'),
(149, 7, 'San Vicente'),
(150, 7, 'Pichilemu'),
(151, 7, 'La Estrella'),
(152, 7, 'Litueche'),
(153, 7, 'Marchihue'),
(154, 7, 'Navidad'),
(155, 7, 'Paredones'),
(156, 7, 'San Fernando'),
(157, 7, 'Chépica'),
(158, 7, 'Chimbarongo'),
(159, 7, 'Lolol'),
(160, 7, 'Nancagua'),
(161, 7, 'Palmilla'),
(162, 7, 'Peralillo'),
(163, 7, 'Placilla'),
(164, 7, 'Pumanque'),
(165, 7, 'Santa Cruz'),
(166, 8, 'Talca'),
(167, 8, 'Constitución'),
(168, 8, 'Curepto'),
(169, 8, 'Empedrado'),
(170, 8, 'Maule'),
(171, 8, 'Pelarco'),
(172, 8, 'Pencahue'),
(173, 8, 'Río Claro'),
(174, 8, 'San Clemente'),
(175, 8, 'San Rafael'),
(176, 8, 'Cauquenes'),
(177, 8, 'Chanco'),
(178, 8, 'Pelluhue'),
(179, 8, 'Curicó'),
(180, 8, 'Hualañé'),
(181, 8, 'Licantén'),
(182, 8, 'Molina'),
(183, 8, 'Rauco'),
(184, 8, 'Romeral'),
(185, 8, 'Sagrada Familia'),
(186, 8, 'Teno'),
(187, 8, 'Vichuquén'),
(188, 8, 'Linares'),
(189, 8, 'Colbún'),
(190, 8, 'Longaví'),
(191, 8, 'Parral'),
(192, 8, 'Retiro'),
(193, 8, 'San Javier'),
(194, 8, 'Villa Alegre'),
(195, 8, 'Yerbas Buenas'),
(196, 9, 'Concepción'),
(197, 9, 'Coronel'),
(198, 9, 'Chiguayante'),
(199, 9, 'Florida'),
(200, 9, 'Hualqui'),
(201, 9, 'Lota'),
(202, 9, 'Penco'),
(203, 9, 'San Pedro de la Paz'),
(204, 9, 'Santa Juana'),
(205, 9, 'Talcahuano'),
(206, 9, 'Tomé'),
(207, 9, 'Hualpén'),
(208, 9, 'Lebu'),
(209, 9, 'Arauco'),
(210, 9, 'Cañete'),
(211, 9, 'Contulmo'),
(212, 9, 'Curanilahue'),
(213, 9, 'Los Álamos'),
(214, 9, 'Tirúa'),
(215, 9, 'Los Ángeles'),
(216, 9, 'Antuco'),
(217, 9, 'Cabrero'),
(218, 9, 'Laja'),
(219, 9, 'Mulchén'),
(220, 9, 'Nacimiento'),
(221, 9, 'Negrete'),
(222, 9, 'Quilaco'),
(223, 9, 'Quilleco'),
(224, 9, 'San Rosendo'),
(225, 9, 'Santa Bárbara'),
(226, 9, 'Tucapel'),
(227, 9, 'Yumbel'),
(228, 9, 'Alto Bío-Bío'),
(229, 9, 'Chillán'),
(230, 9, 'Bulnes'),
(231, 9, 'Cobquecura'),
(232, 9, 'Coelemu'),
(233, 9, 'Coihueco'),
(234, 9, 'Chillán Viejo'),
(235, 9, 'El Carmen'),
(236, 9, 'Ninhue'),
(237, 9, 'Ñiquén'),
(238, 9, 'Pemuco'),
(239, 9, 'Pinto'),
(240, 9, 'Portezuelo'),
(241, 9, 'Quillón'),
(242, 9, 'Quirihue'),
(243, 9, 'Ránquil'),
(244, 9, 'San Carlos'),
(245, 9, 'San Fabián'),
(246, 9, 'San Ignacio'),
(247, 9, 'San Nicolás'),
(248, 9, 'Treguaco'),
(249, 9, 'Yungay'),
(250, 10, 'Temuco'),
(251, 10, 'Carahue'),
(252, 10, 'Cunco'),
(253, 10, 'Curarrehue'),
(254, 10, 'Freire'),
(255, 10, 'Galvarino'),
(256, 10, 'Gorbea'),
(257, 10, 'Lautaro'),
(258, 10, 'Loncoche'),
(259, 10, 'Melipeuco'),
(260, 10, 'Nueva Imperial'),
(261, 10, 'Padre las Casas'),
(262, 10, 'Perquenco'),
(263, 10, 'Pitrufquén'),
(264, 10, 'Pucón'),
(265, 10, 'Saavedra'),
(266, 10, 'Teodoro Schmidt'),
(267, 10, 'Toltén'),
(268, 10, 'Vilcún'),
(269, 10, 'Villarrica'),
(270, 10, 'Cholchol'),
(271, 10, 'Angol'),
(272, 10, 'Collipulli'),
(273, 10, 'Curacautín'),
(274, 10, 'Ercilla'),
(275, 10, 'Lonquimay'),
(276, 10, 'Los Sauces'),
(277, 10, 'Lumaco'),
(278, 10, 'Purén'),
(279, 10, 'Renaico'),
(280, 10, 'Traiguén'),
(281, 10, 'Victoria'),
(282, 11, 'Puerto Montt'),
(283, 11, 'Calbuco'),
(284, 11, 'Cochamó'),
(285, 11, 'Fresia'),
(286, 11, 'Frutillar'),
(287, 11, 'Los Muermos'),
(288, 11, 'Llanquihue'),
(289, 11, 'Maullín'),
(290, 11, 'Puerto Varas'),
(291, 11, 'Castro'),
(292, 11, 'Ancud'),
(293, 11, 'Chonchi'),
(294, 11, 'Curaco de Vélez'),
(295, 11, 'Dalcahue'),
(296, 11, 'Puqueldón'),
(297, 11, 'Queilén'),
(298, 11, 'Quellón'),
(299, 11, 'Quemchi'),
(300, 11, 'Quinchao'),
(301, 11, 'Osorno'),
(302, 11, 'Puerto Octay'),
(303, 11, 'Purranque'),
(304, 11, 'Puyehue'),
(305, 11, 'Río Negro'),
(306, 11, 'San Juan de La Costa'),
(307, 11, 'San Pablo'),
(308, 11, 'Chaitén'),
(309, 11, 'Futaleufú'),
(310, 11, 'Hualaihué'),
(311, 11, 'Palena'),
(312, 12, 'Coihaique'),
(313, 12, 'Lago Verde'),
(314, 12, 'Aysen'),
(315, 12, 'Cisnes'),
(316, 12, 'Guaitecas'),
(317, 12, 'Cochrane'),
(318, 12, 'O\'Higgins'),
(319, 12, 'Tortel'),
(320, 12, 'Chile Chico'),
(321, 12, 'Río Ibáñez'),
(322, 13, 'Punta Arenas'),
(323, 13, 'Laguna Blanca'),
(324, 13, 'Río Verde'),
(325, 13, 'San Gregorio'),
(326, 13, 'Cabo de Hornos'),
(327, 13, 'Antártica'),
(328, 13, 'Porvenir'),
(329, 13, 'Primavera'),
(330, 13, 'Timaukel'),
(331, 13, 'Natales'),
(332, 13, 'Torres del Paine'),
(333, 14, 'Valdivia'),
(334, 14, 'Corral'),
(335, 14, 'Lanco'),
(336, 14, 'Los Lagos'),
(337, 14, 'Máfil'),
(338, 14, 'Mariquina'),
(339, 14, 'Paillaco'),
(340, 14, 'Panguipulli'),
(341, 14, 'La Unión'),
(342, 14, 'Futrono'),
(343, 14, 'Lago Ranco'),
(344, 14, 'Río Bueno'),
(345, 15, 'Arica'),
(346, 15, 'Camarones'),
(347, 15, 'Putre'),
(348, 15, 'General Lagos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gp_correo_colaborador`
--

CREATE TABLE `gp_correo_colaborador` (
  `id` int(11) NOT NULL,
  `colaborador_id` int(11) NOT NULL,
  `tipo_correo` int(11) NOT NULL,
  `correo_colaborador` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gp_empresa`
--

CREATE TABLE `gp_empresa` (
  `id` int(11) NOT NULL,
  `rut` varchar(20) NOT NULL,
  `nombre_empresa` varchar(50) NOT NULL,
  `giro_empresa` varchar(50) NOT NULL,
  `direccion_empresa` varchar(100) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `comuna_id` int(11) NOT NULL,
  `rut_representante` varchar(20) NOT NULL,
  `nombre_representante` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gp_empresa`
--

INSERT INTO `gp_empresa` (`id`, `rut`, `nombre_empresa`, `giro_empresa`, `direccion_empresa`, `pais_id`, `region_id`, `comuna_id`, `rut_representante`, `nombre_representante`) VALUES
(1, '23589956-6', 'Tienda Médica Margarita', 'insumos Médicos', 'El alto 1340', 1, 6, 99, '23589956-6', 'Krusty The Clow');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gp_expediente_colaborador`
--

CREATE TABLE `gp_expediente_colaborador` (
  `id` int(11) NOT NULL,
  `colaborador_id` int(11) NOT NULL,
  `path_archivo` varchar(100) NOT NULL,
  `nombre_archivo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gp_pais`
--

CREATE TABLE `gp_pais` (
  `id` int(11) NOT NULL,
  `nombre_pais` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gp_pais`
--

INSERT INTO `gp_pais` (`id`, `nombre_pais`) VALUES
(1, 'Chile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gp_perfil`
--

CREATE TABLE `gp_perfil` (
  `id` int(11) NOT NULL,
  `nombre_perfil` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gp_perfil`
--

INSERT INTO `gp_perfil` (`id`, `nombre_perfil`) VALUES
(1, 'Administrador'),
(2, 'Colaborador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gp_region`
--

CREATE TABLE `gp_region` (
  `id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `nombre_region` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gp_region`
--

INSERT INTO `gp_region` (`id`, `pais_id`, `nombre_region`) VALUES
(1, 1, 'Tarapacá'),
(2, 1, 'Antofagasta'),
(3, 1, 'Atacama'),
(4, 1, 'Coquimbo'),
(5, 1, 'Valparaiso'),
(6, 1, 'Metropolitana de Santiago'),
(7, 1, 'Libertador General Bernardo O\'Higgins'),
(8, 1, 'Maule'),
(9, 1, 'Biobío'),
(10, 1, 'La Araucanía'),
(11, 1, 'Los Lagos'),
(12, 1, 'Aisén del General Carlos Ibáñez del Campo'),
(13, 1, 'Magallanes y de la Antártica Chilena'),
(14, 1, 'Los Ríos'),
(15, 1, 'Arica y Parinacota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gp_telefono_colaborador`
--

CREATE TABLE `gp_telefono_colaborador` (
  `id` int(11) NOT NULL,
  `colaborador_id` int(11) NOT NULL,
  `tipo_telefono` int(11) NOT NULL,
  `numero_telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gp_cargo`
--
ALTER TABLE `gp_cargo`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `gp_comuna`
--
ALTER TABLE `gp_comuna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_region_comuna` (`region_id`);

--
-- Indices de la tabla `gp_correo_colaborador`
--
ALTER TABLE `gp_correo_colaborador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_correo_colaborador` (`colaborador_id`);

--
-- Indices de la tabla `gp_empresa`
--
ALTER TABLE `gp_empresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pais_empresa` (`pais_id`),
  ADD KEY `fk_region_empresa` (`region_id`),
  ADD KEY `fk_comuna_empresa` (`comuna_id`);

--
-- Indices de la tabla `gp_expediente_colaborador`
--
ALTER TABLE `gp_expediente_colaborador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_expediente_colaborador` (`colaborador_id`);

--
-- Indices de la tabla `gp_pais`
--
ALTER TABLE `gp_pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gp_perfil`
--
ALTER TABLE `gp_perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gp_region`
--
ALTER TABLE `gp_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pais_region` (`pais_id`);

--
-- Indices de la tabla `gp_telefono_colaborador`
--
ALTER TABLE `gp_telefono_colaborador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fono_colaborador` (`colaborador_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `gp_cargo`
--
ALTER TABLE `gp_cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gp_colaborador`
--
ALTER TABLE `gp_colaborador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gp_comuna`
--
ALTER TABLE `gp_comuna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT de la tabla `gp_correo_colaborador`
--
ALTER TABLE `gp_correo_colaborador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gp_empresa`
--
ALTER TABLE `gp_empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gp_expediente_colaborador`
--
ALTER TABLE `gp_expediente_colaborador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gp_pais`
--
ALTER TABLE `gp_pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gp_perfil`
--
ALTER TABLE `gp_perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gp_region`
--
ALTER TABLE `gp_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `gp_telefono_colaborador`
--
ALTER TABLE `gp_telefono_colaborador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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

--
-- Filtros para la tabla `gp_comuna`
--
ALTER TABLE `gp_comuna`
  ADD CONSTRAINT `fk_region_comuna` FOREIGN KEY (`region_id`) REFERENCES `gp_region` (`id`);

--
-- Filtros para la tabla `gp_correo_colaborador`
--
ALTER TABLE `gp_correo_colaborador`
  ADD CONSTRAINT `fk_correo_colaborador` FOREIGN KEY (`colaborador_id`) REFERENCES `gp_colaborador` (`id`);

--
-- Filtros para la tabla `gp_empresa`
--
ALTER TABLE `gp_empresa`
  ADD CONSTRAINT `fk_comuna_empresa` FOREIGN KEY (`comuna_id`) REFERENCES `gp_comuna` (`id`),
  ADD CONSTRAINT `fk_pais_empresa` FOREIGN KEY (`pais_id`) REFERENCES `gp_pais` (`id`),
  ADD CONSTRAINT `fk_region_empresa` FOREIGN KEY (`region_id`) REFERENCES `gp_region` (`id`);

--
-- Filtros para la tabla `gp_expediente_colaborador`
--
ALTER TABLE `gp_expediente_colaborador`
  ADD CONSTRAINT `fk_expediente_colaborador` FOREIGN KEY (`colaborador_id`) REFERENCES `gp_colaborador` (`id`);

--
-- Filtros para la tabla `gp_region`
--
ALTER TABLE `gp_region`
  ADD CONSTRAINT `fk_pais_region` FOREIGN KEY (`pais_id`) REFERENCES `gp_pais` (`id`);

--
-- Filtros para la tabla `gp_telefono_colaborador`
--
ALTER TABLE `gp_telefono_colaborador`
  ADD CONSTRAINT `fk_fono_colaborador` FOREIGN KEY (`colaborador_id`) REFERENCES `gp_colaborador` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
