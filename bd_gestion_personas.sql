






CREATE TABLE `gp_cargo` (
  `id` int(11) NOT NULL,
  `nombre_cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



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



CREATE TABLE `gp_comuna` (
  `id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `nombre_comuna` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



CREATE TABLE `gp_correo_colaborador` (
  `id` int(11) NOT NULL,
  `colaborador_id` int(11) NOT NULL,
  `tipo_correo` int(11) NOT NULL,
  `correo_colaborador` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



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



CREATE TABLE `gp_expediente_colaborador` (
  `id` int(11) NOT NULL,
  `colaborador_id` int(11) NOT NULL,
  `path_archivo` varchar(100) NOT NULL,
  `nombre_archivo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


CREATE TABLE `gp_pais` (
  `id` int(11) NOT NULL,
  `nombre_pais` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;






CREATE TABLE `gp_perfil` (
  `id` int(11) NOT NULL,
  `nombre_perfil` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



CREATE TABLE `gp_region` (
  `id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `nombre_region` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



CREATE TABLE `gp_telefono_colaborador` (
  `id` int(11) NOT NULL,
  `colaborador_id` int(11) NOT NULL,
  `tipo_telefono` int(11) NOT NULL,
  `numero_telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



