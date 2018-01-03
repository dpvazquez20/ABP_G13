-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-01-2018 a las 20:24:23
-- Versión del servidor: 5.5.44-0+deb8u1
-- Versión de PHP: 5.6.13-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `actifit`
--
CREATE DATABASE IF NOT EXISTS `actifit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `actifit`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE IF NOT EXISTS `actividades` (
`id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` longtext,
  `frecuencia` varchar(50) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `numMaxParticipantes` int(11) NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  `coach_id` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT IGNORE INTO `actividades` (`id`, `nombre`, `descripcion`, `frecuencia`, `horaInicio`, `horaFin`, `tipo`, `numMaxParticipantes`, `borrado`, `coach_id`, `fechaInicio`, `fechaFin`) VALUES
(40, 'Zumba', 'Se trata de una fusiÃ³n de ritmos aerÃ³bicos o coreografÃ­as sencillas con distintos gÃ©neros, inspirados en la mÃºsica latina y con una mezcla de mÃºsica internacional.', 'Martes', '17:00:00', '19:00:00', 'Grupal', 5, 0, 3, '2018-01-08', '2018-01-25'),
(41, 'SoftBoxing', 'Clase de cardio utilizando movimientos propios del boxeo y otras artesmarciales que obligan a ejercitar todos los grupos musculares. ', 'Jueves', '20:00:00', '21:00:00', 'Grupal', 8, 0, 3, '2018-01-16', '2018-01-26'),
(42, 'Spinning', 'El spinning es una variante de los deportes de fitness (o de gimnasio) que consiste en pedalear sobre una bicicleta estÃ¡tica al ritmo de la mÃºsica y siguiendo los ejercicios que nos marca el monitor. TambiÃ©n se le llama indoor cycling.', 'MiÃ©rcoles', '19:30:00', '21:00:00', 'Grupal', 8, 0, 3, '2018-01-09', '2018-01-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicios`
--

CREATE TABLE IF NOT EXISTS `ejercicios` (
`id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` longtext,
  `imagen` varchar(90) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `borrado` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ejercicios`
--

INSERT IGNORE INTO `ejercicios` (`id`, `nombre`, `descripcion`, `imagen`, `tipo`, `borrado`) VALUES
(1, 'Biceps barra', 'Ejercicio de biceps con barra', 'bicepsbarra.jpg', 'Muscular', 0),
(2, 'Cinta', 'Correr en la cinta', 'cinta.jpg', 'Cardiovascular', 0),
(3, 'Press banca', 'Ejercicio de pecho en banco horizontal. ', 'pressbanca.jpg', 'Muscular', 0),
(4, 'Curl biceps', 'Ejercicio biceps con mancuernas.', 'bicepsmancuerna.jpg', 'Muscular', 0),
(5, 'Dominadas', 'Ejercicio de espalda en barra con peso muerto. ', 'dominadas.jpg', 'Muscular', 0),
(6, 'Remo', 'Ejercicio espalda imitando el movimiento de remo. ', 'remo.jpg', 'Muscular', 0),
(7, 'Ascension triceps', 'Ejercicio triceps levantando la mancuerna por encima de la cabeza.', 'ascensiontriceps.jpg', 'Muscular', 0),
(8, 'Sentadillas', 'Ejercicio gluteos de cuadriceps con peso muerto. ', 'sentadillas.jpg', 'Muscular', 0),
(9, 'Abdominales', 'Ejercicio de abdominales tumbado en suelo.', 'abdominales.jpg', 'Muscular', 0),
(10, 'Estiramiento pecho', 'Estiramiento pecho con los brazos juntos estirados hacia atrás ', 'estiramientopecho.jpg', 'Estiramiento', 0),
(11, 'Estiramiento abductores', 'Estiramiento de abductores sentado y con las piernas estiradas', 'estiramientoabductores.jpg', 'Estiramiento', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamientos`
--

CREATE TABLE IF NOT EXISTS `entrenamientos` (
`id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  `sesiones` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `entrenamientos`
--

INSERT IGNORE INTO `entrenamientos` (`id`, `nombre`, `borrado`, `sesiones`) VALUES
(1, 'Principiante', 0, 1),
(2, 'Medio', 0, 2),
(3, 'Avanzado', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamientos_has_tablas`
--

CREATE TABLE IF NOT EXISTS `entrenamientos_has_tablas` (
  `entrenamiento_id` int(11) NOT NULL,
  `tabla_id` int(11) NOT NULL,
  `orden_sesion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `entrenamientos_has_tablas`:
--   `entrenamiento_id`
--       `entrenamientos` -> `id`
--   `tabla_id`
--       `tablas` -> `id`
--

--
-- Volcado de datos para la tabla `entrenamientos_has_tablas`
--

INSERT IGNORE INTO `entrenamientos_has_tablas` (`entrenamiento_id`, `tabla_id`, `orden_sesion`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(2, 2, 2),
(3, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamientos_has_usuarios`
--

CREATE TABLE IF NOT EXISTS `entrenamientos_has_usuarios` (
  `entrenamiento_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `entrenamientos_has_usuarios`:
--   `entrenamiento_id`
--       `entrenamientos` -> `id`
--   `usuario_id`
--       `usuarios` -> `id`
--

--
-- Volcado de datos para la tabla `entrenamientos_has_usuarios`
--

INSERT IGNORE INTO `entrenamientos_has_usuarios` (`entrenamiento_id`, `usuario_id`) VALUES
(3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE IF NOT EXISTS `inscripciones` (
`id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `inscripciones`:
--   `usuario_id`
--       `usuarios` -> `id`
--

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT IGNORE INTO `inscripciones` (`id`, `fecha`, `borrado`, `usuario_id`) VALUES
(11, '2018-01-02', 0, 4),
(12, '2018-01-02', 0, 5),
(13, '2018-01-02', 0, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_has_actividades`
--

CREATE TABLE IF NOT EXISTS `inscripciones_has_actividades` (
  `inscripciones_id` int(11) NOT NULL,
  `actividades_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `inscripciones_has_actividades`:
--   `actividades_id`
--       `actividades` -> `id`
--   `inscripciones_id`
--       `inscripciones` -> `id`
--

--
-- Volcado de datos para la tabla `inscripciones_has_actividades`
--

INSERT IGNORE INTO `inscripciones_has_actividades` (`inscripciones_id`, `actividades_id`) VALUES
(13, 40),
(12, 41),
(11, 42);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineasdetabla`
--

CREATE TABLE IF NOT EXISTS `lineasdetabla` (
`id` int(11) NOT NULL,
  `repeticiones` varchar(45) DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `descanso` varchar(45) DEFAULT NULL,
  `series` int(11) DEFAULT NULL,
  `tabla_id` int(11) NOT NULL,
  `ejercicio_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `lineasdetabla`:
--   `ejercicio_id`
--       `ejercicios` -> `id`
--   `tabla_id`
--       `tablas` -> `id`
--

--
-- Volcado de datos para la tabla `lineasdetabla`
--

INSERT IGNORE INTO `lineasdetabla` (`id`, `repeticiones`, `duracion`, `descanso`, `series`, `tabla_id`, `ejercicio_id`) VALUES
(1, '10', NULL, '60 seg', 4, 1, 1),
(2, NULL, '10 min', NULL, NULL, 1, 2),
(3, '10', NULL, '30 seg', 4, 1, 3),
(4, '8', NULL, '30 seg', 3, 1, 4),
(5, '10', NULL, '1 min', 4, 1, 5),
(6, NULL, NULL, NULL, NULL, 1, 11),
(7, '10', NULL, '30 seg', 3, 2, 7),
(8, '10', NULL, '30 seg', 4, 2, 3),
(9, '20', NULL, '30 seg', 4, 2, 9),
(10, '10', NULL, '1 min', 3, 2, 1),
(11, '8', NULL, '1 min', 4, 2, 4),
(12, NULL, NULL, NULL, NULL, 2, 11),
(13, '10', NULL, '1 min', 4, 3, 1),
(14, NULL, NULL, NULL, NULL, 3, 10),
(15, '10', NULL, '30 seg', 3, 3, 3),
(16, NULL, '10 min', NULL, NULL, 3, 6),
(17, '25', NULL, '30 seg', 4, 3, 9),
(18, NULL, NULL, NULL, NULL, 3, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE IF NOT EXISTS `recursos` (
`id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `aforo` varchar(45) DEFAULT NULL,
  `descripcion` longtext,
  `borrado` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recursos`
--

INSERT IGNORE INTO `recursos` (`id`, `nombre`, `aforo`, `descripcion`, `borrado`) VALUES
(1, 'Sala A1', '10', 'Sala primer piso ', 0),
(2, 'Sala A2', '10', 'Sala primer piso ', 0),
(3, 'Sala A3', '20', 'Sala primer piso ', 0),
(4, 'Sala B1', '30', 'Sala segundo piso ', 0),
(5, 'Sala B2', '15', 'Sala segundo piso', 0),
(6, 'Sala B3', '25', 'Sala segundo piso', 0),
(7, 'Sala B4', '10', 'Sala segundo piso', 0),
(8, 'Mesa Ping Pong 1', '4', 'Mesa ping pong con raquetas NO incluidas', 0),
(9, 'Mesa Ping Pong 2', '4', 'Mesa ping pong con raquetas NO incluidas', 0),
(10, 'Mesa Ping Pong 3', '4', 'Mesa ping pong con raquetas NO incluidas', 0),
(11, 'Pista Baloncesto', '25', 'Pista baloncesto no incluye gradas', 0),
(12, 'Pista Volleyball', '25', 'Pista volleyball no incluye gradas', 0),
(13, 'Pista Fútbol Sala', '25', 'Pista futbol sala no incluye gradas', 0),
(14, 'Campo Fútbol Hierba', '35', 'Campo de fútbol hierba no incluye gradas', 0),
(15, 'Pista tennis 1', '4', 'Pista de tenis 1vs1 o 2vs2', 0),
(16, 'Pista tennis 2', '4', 'Pista de tenis 1vs1 o 2vs2', 0),
(17, 'Gradas pistas 1', '150', 'Gradas pistas grandes', 0),
(18, 'Gradas pistas 2', '80', 'Gradas pistas pequeñas', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE IF NOT EXISTS `reservas` (
`id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  `actividades_id` int(11) NOT NULL,
  `recurso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18989 DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `reservas`:
--   `recurso_id`
--       `recursos` -> `id`
--   `actividades_id`
--       `actividades` -> `id`
--

--
-- Volcado de datos para la tabla `reservas`
--

INSERT IGNORE INTO `reservas` (`id`, `fecha`, `borrado`, `actividades_id`, `recurso_id`) VALUES
(18981, '2018-01-09', 0, 40, 1),
(18982, '2018-01-16', 0, 40, 1),
(18983, '2018-01-23', 0, 40, 1),
(18984, '2018-01-18', 0, 41, 3),
(18985, '2018-01-25', 0, 41, 3),
(18986, '2018-01-10', 0, 42, 4),
(18987, '2018-01-17', 0, 42, 4),
(18988, '2018-01-24', 0, 42, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiondelineadetabla`
--

CREATE TABLE IF NOT EXISTS `sesiondelineadetabla` (
`id` int(11) NOT NULL,
  `completado` tinyint(4) NOT NULL,
  `comentario` mediumtext,
  `sesiones_id` int(11) NOT NULL,
  `lineasDeTabla_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `sesiondelineadetabla`:
--   `lineasDeTabla_id`
--       `lineasdetabla` -> `id`
--   `sesiones_id`
--       `sesiones` -> `id`
--

--
-- Volcado de datos para la tabla `sesiondelineadetabla`
--

INSERT IGNORE INTO `sesiondelineadetabla` (`id`, `completado`, `comentario`, `sesiones_id`, `lineasDeTabla_id`) VALUES
(679, 0, NULL, 199, 1),
(680, 0, NULL, 199, 2),
(681, 0, NULL, 199, 3),
(682, 0, NULL, 199, 4),
(683, 0, NULL, 199, 5),
(684, 0, NULL, 199, 6),
(685, 0, NULL, 200, 7),
(686, 0, NULL, 200, 8),
(687, 0, NULL, 200, 9),
(688, 0, NULL, 200, 10),
(689, 0, NULL, 200, 11),
(690, 0, NULL, 200, 12),
(691, 0, NULL, 201, 13),
(692, 0, NULL, 201, 14),
(693, 0, NULL, 201, 15),
(694, 0, NULL, 201, 16),
(695, 0, NULL, 201, 17),
(696, 0, NULL, 201, 18),
(769, 0, NULL, 235, 1),
(770, 0, NULL, 235, 2),
(771, 0, NULL, 235, 3),
(772, 0, NULL, 235, 4),
(773, 0, NULL, 235, 5),
(774, 0, NULL, 235, 6),
(775, 0, NULL, 236, 7),
(776, 0, NULL, 236, 8),
(777, 0, NULL, 236, 9),
(778, 0, NULL, 236, 10),
(779, 0, NULL, 236, 11),
(780, 0, NULL, 236, 12),
(781, 0, NULL, 237, 13),
(782, 0, NULL, 237, 14),
(783, 0, NULL, 237, 15),
(784, 0, NULL, 237, 16),
(785, 0, NULL, 237, 17),
(786, 0, NULL, 237, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE IF NOT EXISTS `sesiones` (
`id` int(11) NOT NULL,
  `completado` tinyint(4) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tablas_id` int(11) NOT NULL,
  `orden_sesion` int(11) NOT NULL,
  `orden_sesion_max` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `entrenamientos_id` int(11) NOT NULL,
  `anterior_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `sesiones`:
--   `tablas_id`
--       `tablas` -> `id`
--

--
-- Volcado de datos para la tabla `sesiones`
--

INSERT IGNORE INTO `sesiones` (`id`, `completado`, `fecha`, `tablas_id`, `orden_sesion`, `orden_sesion_max`, `usuarios_id`, `entrenamientos_id`, `anterior_id`) VALUES
(199, 1, NULL, 1, 1, 3, 4, 3, NULL),
(200, 1, NULL, 2, 2, 3, 4, 3, 199),
(201, 1, NULL, 3, 3, 3, 4, 3, 200),
(235, 0, NULL, 1, 1, 3, 4, 3, 201),
(236, 0, NULL, 2, 2, 3, 4, 3, 235),
(237, 1, NULL, 3, 3, 3, 4, 3, 236);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablas`
--

CREATE TABLE IF NOT EXISTS `tablas` (
`id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `borrado` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tablas`
--

INSERT IGNORE INTO `tablas` (`id`, `nombre`, `borrado`) VALUES
(1, 'Tabla 1', 0),
(2, 'Tabla 2', 0),
(3, 'Tabla 3', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`id` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `contrasenha` varchar(300) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `imagen` varchar(90) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT IGNORE INTO `usuarios` (`id`, `login`, `contrasenha`, `nombre`, `apellidos`, `dni`, `email`, `borrado`, `tipo`, `imagen`) VALUES
(1, 'admin', '$2y$15$tKzm9o7fcPtDC9jD91nBHev7FVl15cgUJFReu/e/xuUrQNZfssnYa', 'admin', 'admin', '00000001A', 'admin@admin', 0, 'Administrador', NULL),
(2, 'secretario', '$2y$15$nKNj3f1/BkxclMiJYp/1PeQ7sVkrO4J5A3vWSrPqXQ3/dAWaCbJD6', 'secretario', 'secretario', '00000002A', 'secretario@secretario', 0, 'Secretario', NULL),
(3, 'entrenador', '$2y$15$8n35X28JIU46CXjTACBZTO6Y1radwkcEZFRyrBzSY5AqvIhzJ5wMm', 'entrenador', 'entrenador', '00000003A', 'entrenador@entrenador', 0, 'Entrenador', NULL),
(4, 'deportista', '$2y$15$LKEFHg8CLu7wKfmGg605R.nJDwVkrFWMtW41KFIvfYXUX2hYUZQbW', 'deportista', 'deportista', '00000004A', 'deportista@deportista', 0, 'Deportista', NULL),
(5, 'deportista2', '$2y$15$GAnBBHxkDagIEmM4MBClY.sLyzXF358348Jy6Uub6H8z5rq5gfn4m', 'deportistaDos', 'deportistaDos', '72946407K', 'deportista2@gmail.com', 0, 'Deportista', 'default.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`), ADD UNIQUE KEY `nombre_2` (`nombre`);

--
-- Indices de la tabla `entrenamientos`
--
ALTER TABLE `entrenamientos`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `entrenamientos_has_tablas`
--
ALTER TABLE `entrenamientos_has_tablas`
 ADD PRIMARY KEY (`entrenamiento_id`,`tabla_id`,`orden_sesion`), ADD KEY `fk_entrenamiento_has_tabla_tabla1_idx` (`tabla_id`), ADD KEY `fk_entrenamiento_has_tabla_entrenamiento1_idx` (`entrenamiento_id`);

--
-- Indices de la tabla `entrenamientos_has_usuarios`
--
ALTER TABLE `entrenamientos_has_usuarios`
 ADD PRIMARY KEY (`entrenamiento_id`,`usuario_id`), ADD KEY `fk_entrenamiento_has_usuario_usuario1_idx` (`usuario_id`), ADD KEY `fk_entrenamiento_has_usuario_entrenamiento1_idx` (`entrenamiento_id`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_inscripcion_usuario1_idx` (`usuario_id`);

--
-- Indices de la tabla `inscripciones_has_actividades`
--
ALTER TABLE `inscripciones_has_actividades`
 ADD PRIMARY KEY (`inscripciones_id`,`actividades_id`), ADD KEY `fk_inscripciones_has_actividades_actividades1_idx` (`actividades_id`), ADD KEY `fk_inscripciones_has_actividades_inscripciones1_idx` (`inscripciones_id`);

--
-- Indices de la tabla `lineasdetabla`
--
ALTER TABLE `lineasdetabla`
 ADD PRIMARY KEY (`id`,`tabla_id`,`ejercicio_id`), ADD KEY `fk_lineasDeTabla_tablas1_idx` (`tabla_id`), ADD KEY `fk_lineasDeTabla_ejercicios1_idx` (`ejercicio_id`);

--
-- Indices de la tabla `recursos`
--
ALTER TABLE `recursos`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_reservas_actividades1_idx` (`actividades_id`), ADD KEY `fk_recursos_id` (`recurso_id`);

--
-- Indices de la tabla `sesiondelineadetabla`
--
ALTER TABLE `sesiondelineadetabla`
 ADD PRIMARY KEY (`id`,`sesiones_id`), ADD KEY `fk_sesion_lineaDeTabla_sesiones1_idx` (`sesiones_id`), ADD KEY `fk_sesion_lineaDeTabla_lineasDeTabla1_idx` (`lineasDeTabla_id`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_sesiones_tablas1_idx` (`tablas_id`);

--
-- Indices de la tabla `tablas`
--
ALTER TABLE `tablas`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `login_UNIQUE` (`login`), ADD UNIQUE KEY `dni_UNIQUE` (`dni`), ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `entrenamientos`
--
ALTER TABLE `entrenamientos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `lineasdetabla`
--
ALTER TABLE `lineasdetabla`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `recursos`
--
ALTER TABLE `recursos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18989;
--
-- AUTO_INCREMENT de la tabla `sesiondelineadetabla`
--
ALTER TABLE `sesiondelineadetabla`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=787;
--
-- AUTO_INCREMENT de la tabla `sesiones`
--
ALTER TABLE `sesiones`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=238;
--
-- AUTO_INCREMENT de la tabla `tablas`
--
ALTER TABLE `tablas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrenamientos_has_tablas`
--
ALTER TABLE `entrenamientos_has_tablas`
ADD CONSTRAINT `fk_entrenamiento_has_tabla_entrenamiento1` FOREIGN KEY (`entrenamiento_id`) REFERENCES `entrenamientos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_entrenamiento_has_tabla_tabla1` FOREIGN KEY (`tabla_id`) REFERENCES `tablas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrenamientos_has_usuarios`
--
ALTER TABLE `entrenamientos_has_usuarios`
ADD CONSTRAINT `fk_entrenamiento_has_usuario_entrenamiento1` FOREIGN KEY (`entrenamiento_id`) REFERENCES `entrenamientos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_entrenamiento_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
ADD CONSTRAINT `fk_inscripcion_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscripciones_has_actividades`
--
ALTER TABLE `inscripciones_has_actividades`
ADD CONSTRAINT `fk_inscripciones_has_actividades_actividades1` FOREIGN KEY (`actividades_id`) REFERENCES `actividades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_inscripciones_has_actividades_inscripciones1` FOREIGN KEY (`inscripciones_id`) REFERENCES `inscripciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lineasdetabla`
--
ALTER TABLE `lineasdetabla`
ADD CONSTRAINT `fk_lineasDeTabla_ejercicios1` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_lineasDeTabla_tablas1` FOREIGN KEY (`tabla_id`) REFERENCES `tablas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
ADD CONSTRAINT `fk_recursos_id` FOREIGN KEY (`recurso_id`) REFERENCES `recursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_reservas_actividades1` FOREIGN KEY (`actividades_id`) REFERENCES `actividades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sesiondelineadetabla`
--
ALTER TABLE `sesiondelineadetabla`
ADD CONSTRAINT `fk_sesion_lineaDeTabla_lineasDeTabla1` FOREIGN KEY (`lineasDeTabla_id`) REFERENCES `lineasdetabla` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_sesion_lineaDeTabla_sesiones1` FOREIGN KEY (`sesiones_id`) REFERENCES `sesiones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sesiones`
--
ALTER TABLE `sesiones`
ADD CONSTRAINT `fk_sesiones_tablas1` FOREIGN KEY (`tablas_id`) REFERENCES `tablas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
