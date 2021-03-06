-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-01-2018 a las 03:37:58
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `fechaFin` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT IGNORE INTO `actividades` (`id`, `nombre`, `descripcion`, `frecuencia`, `horaInicio`, `horaFin`, `tipo`, `numMaxParticipantes`, `borrado`, `coach_id`, `fechaInicio`, `fechaFin`) VALUES
(40, 'Zumba', 'Se trata de una fusiÃ³n de ritmos aerÃ³bicos o coreografÃ­as sencillas con distintos gÃ©neros, inspirados en la mÃºsica latina y con una mezcla de mÃºsica internacional.', 'Martes', '17:00:00', '19:00:00', 'Grupal', 5, 0, 3, '2018-01-08', '2018-01-25'),
(41, 'SoftBoxing', 'Clase de cardio utilizando movimientos propios del boxeo y otras artesmarciales que obligan a ejercitar todos los grupos musculares. ', 'Jueves', '20:00:00', '21:00:00', 'Grupal', 8, 0, 3, '2018-01-16', '2018-01-26'),
(42, 'Spinning', 'El spinning es una variante de los deportes de fitness (o de gimnasio) que consiste en pedalear sobre una bicicleta estÃ¡tica al ritmo de la mÃºsica y siguiendo los ejercicios que nos marca el monitor. TambiÃ©n se le llama indoor cycling.', 'MiÃ©rcoles', '19:30:00', '21:00:00', 'Grupal', 8, 0, 3, '2018-01-09', '2018-01-26'),
(43, 'Actividad viernes', '', 'Viernes', '00:00:00', '00:01:00', 'Individual', 1, 0, 3, '2018-01-12', '2018-01-12'),
(44, 'Actividad lunes', '', 'Lunes', '00:00:00', '00:01:00', 'Individual', 1, 0, 3, '2018-01-15', '2018-01-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicios`
--

CREATE TABLE IF NOT EXISTS `ejercicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` longtext,
  `imagen` varchar(90) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nombre_2` (`nombre`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  `sesiones` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `entrenamientos`
--

INSERT IGNORE INTO `entrenamientos` (`id`, `nombre`, `tipo`, `borrado`, `sesiones`) VALUES
(1, 'Principiante', 'Normal', 0, 1),
(2, 'Medio', 'Normal', 0, 2),
(3, 'Avanzado', 'Normal', 0, 3),
(5, 'Entrenamiento personalizado', 'Personal', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamientos_has_tablas`
--

CREATE TABLE IF NOT EXISTS `entrenamientos_has_tablas` (
  `entrenamiento_id` int(11) NOT NULL,
  `tabla_id` int(11) NOT NULL,
  `orden_sesion` int(11) NOT NULL,
  PRIMARY KEY (`entrenamiento_id`,`tabla_id`,`orden_sesion`),
  KEY `fk_entrenamiento_has_tabla_tabla1_idx` (`tabla_id`),
  KEY `fk_entrenamiento_has_tabla_entrenamiento1_idx` (`entrenamiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `entrenamientos_has_tablas`
--

INSERT IGNORE INTO `entrenamientos_has_tablas` (`entrenamiento_id`, `tabla_id`, `orden_sesion`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(5, 1, 2),
(2, 2, 2),
(3, 2, 2),
(3, 3, 3),
(5, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamientos_has_usuarios`
--

CREATE TABLE IF NOT EXISTS `entrenamientos_has_usuarios` (
  `entrenamiento_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`entrenamiento_id`,`usuario_id`),
  KEY `fk_entrenamiento_has_usuario_usuario1_idx` (`usuario_id`),
  KEY `fk_entrenamiento_has_usuario_entrenamiento1_idx` (`entrenamiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `entrenamientos_has_usuarios`
--

INSERT IGNORE INTO `entrenamientos_has_usuarios` (`entrenamiento_id`, `usuario_id`) VALUES
(3, 4),
(3, 25),
(5, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` longtext,
  `imagen` varchar(90) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `nombre`, `descripcion`, `imagen`, `fechaInicio`, `fechaFin`, `horaInicio`, `horaFin`, `borrado`) VALUES
(1, 'Zumba', 'Tendra lugar una clase de demostracion de Zumba para todas las edades. Los niÃ±os deberan ir acompaÃ±ados de un adulto o llevar una autorizacion. Aquellos que se inscriban en actividades de Zumba del gimnasio tras esta clase tendran un descuento del 30% los 3 primeros meses.', '', '2018-01-26', '2018-01-27', '15:30:00', '17:00:00', 0),
(2, 'Inauguracion', 'Evento inaugural del gimansio donde se hara una presentacion de sus instalaciones asi como de la aplicacion de la que hace uso. Se hara un recorrido por el gimnasio mostrando las distintas salas y maquinas ademas de contar con la participacion de entrenadores especializados. Habra churrasco.', '', '2018-01-22', '2018-01-23', '12:30:00', '15:00:00', 0),
(3, 'Torneo Futbol 7', 'Se organizara un pequeÃ±o torneo de Futbol 7 de hasta 16 equipos. Los interesados en apuntarse deberan acudir al gimnasio durante la semana previa al torneo para inscribirse. No hay lÃ­mite de edad pero los menores de 16 aÃ±os deberan presentar una autorizacion firmada de sus padres o tutores legales.', '', '2018-01-29', '2018-01-31', '09:00:00', '21:00:00', 0),
(4, 'Carrera popular', 'Media maratÃ³n. Los interesados en apuntarse deberan acudir al gimnasio durante la semana previa a la carrera para inscribirse. No hay lÃ­mite de edad pero los menores de 16 aÃ±os deberan presentar una autorizacion firmada de sus padres o tutores legales.', 'carrera.png', '2018-02-27', '2018-02-27', '10:00:00', '13:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE IF NOT EXISTS `inscripciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inscripcion_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT IGNORE INTO `inscripciones` (`id`, `fecha`, `borrado`, `usuario_id`) VALUES
(11, '2018-01-02', 1, 4),
(12, '2018-01-02', 0, 5),
(13, '2018-01-02', 0, 5),
(14, '2018-01-09', 1, 4),
(15, '2018-01-11', 0, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_has_actividades`
--

CREATE TABLE IF NOT EXISTS `inscripciones_has_actividades` (
  `inscripciones_id` int(11) NOT NULL,
  `actividades_id` int(11) NOT NULL,
  PRIMARY KEY (`inscripciones_id`,`actividades_id`),
  KEY `fk_inscripciones_has_actividades_actividades1_idx` (`actividades_id`),
  KEY `fk_inscripciones_has_actividades_inscripciones1_idx` (`inscripciones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inscripciones_has_actividades`
--

INSERT IGNORE INTO `inscripciones_has_actividades` (`inscripciones_id`, `actividades_id`) VALUES
(13, 40),
(12, 41),
(14, 41),
(11, 42),
(15, 44);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineasdetabla`
--

CREATE TABLE IF NOT EXISTS `lineasdetabla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repeticiones` varchar(45) DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `descanso` varchar(45) DEFAULT NULL,
  `series` int(11) DEFAULT NULL,
  `tabla_id` int(11) NOT NULL,
  `ejercicio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`tabla_id`,`ejercicio_id`),
  KEY `fk_lineasDeTabla_tablas1_idx` (`tabla_id`),
  KEY `fk_lineasDeTabla_ejercicios1_idx` (`ejercicio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
(18, NULL, NULL, NULL, NULL, 3, 11),
(19, '1', NULL, '1', 1, 6, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE IF NOT EXISTS `recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `aforo` varchar(45) DEFAULT NULL,
  `descripcion` longtext,
  `borrado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  `actividades_id` int(11) NOT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reservas_actividades1_idx` (`actividades_id`),
  KEY `fk_recursos_id` (`recurso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18992 DEFAULT CHARSET=utf8;

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
(18988, '2018-01-24', 0, 42, 4),
(18989, '2018-01-12', 0, 43, 1),
(18990, '2018-01-15', 0, 44, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiondelineadetabla`
--

CREATE TABLE IF NOT EXISTS `sesiondelineadetabla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `completado` tinyint(4) NOT NULL,
  `sesiones_id` int(11) NOT NULL,
  `lineasDeTabla_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sesiones_id`),
  KEY `fk_sesion_lineaDeTabla_sesiones1_idx` (`sesiones_id`),
  KEY `fk_sesion_lineaDeTabla_lineasDeTabla1_idx` (`lineasDeTabla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sesiondelineadetabla`
--

INSERT IGNORE INTO `sesiondelineadetabla` (`id`, `completado`, `sesiones_id`, `lineasDeTabla_id`) VALUES
(127, 0, 258, 1),
(128, 0, 258, 2),
(129, 0, 258, 3),
(130, 0, 258, 4),
(131, 0, 258, 5),
(132, 0, 258, 6),
(133, 0, 259, 7),
(134, 0, 259, 8),
(135, 0, 259, 9),
(136, 0, 259, 10),
(137, 0, 259, 11),
(138, 0, 259, 12),
(139, 0, 260, 13),
(140, 0, 260, 14),
(141, 0, 260, 15),
(142, 0, 260, 16),
(143, 0, 260, 17),
(144, 0, 260, 18),
(145, 0, 261, 1),
(146, 0, 261, 2),
(147, 0, 261, 3),
(148, 0, 261, 4),
(149, 0, 261, 5),
(150, 0, 261, 6),
(151, 0, 262, 7),
(152, 0, 262, 8),
(153, 0, 262, 9),
(154, 0, 262, 10),
(155, 0, 262, 11),
(156, 0, 262, 12),
(157, 0, 263, 13),
(158, 0, 263, 14),
(159, 0, 263, 15),
(160, 0, 263, 16),
(161, 0, 263, 17),
(162, 0, 263, 18),
(163, 1, 264, 1),
(164, 0, 264, 2),
(165, 1, 264, 3),
(166, 1, 264, 4),
(167, 0, 264, 5),
(168, 0, 264, 6),
(169, 0, 265, 7),
(170, 0, 265, 8),
(171, 0, 265, 9),
(172, 0, 265, 10),
(173, 0, 265, 11),
(174, 0, 265, 12),
(175, 0, 266, 13),
(176, 0, 266, 14),
(177, 0, 266, 15),
(178, 0, 266, 16),
(179, 0, 266, 17),
(180, 0, 266, 18),
(187, 0, 269, 1),
(188, 0, 269, 2),
(189, 0, 269, 3),
(190, 0, 269, 4),
(191, 0, 269, 5),
(192, 0, 269, 6),
(193, 0, 270, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE IF NOT EXISTS `sesiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `completado` tinyint(4) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `comentario` varchar(1000) DEFAULT NULL,
  `tablas_id` int(11) NOT NULL,
  `orden_sesion` int(11) NOT NULL,
  `orden_sesion_max` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `entrenamientos_id` int(11) NOT NULL,
  `anterior_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sesiones_tablas1_idx` (`tablas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sesiones`
--

INSERT IGNORE INTO `sesiones` (`id`, `completado`, `fecha`, `inicio`, `fin`, `comentario`, `tablas_id`, `orden_sesion`, `orden_sesion_max`, `usuarios_id`, `entrenamientos_id`, `anterior_id`) VALUES
(258, 1, '2018-01-09 19:03:01', '2018-01-09 19:03:41', '2018-01-09 19:37:43', NULL, 1, 1, 3, 4, 3, NULL),
(259, 1, '2018-01-09 19:03:01', '2018-01-09 19:07:58', '2018-01-09 19:45:59', NULL, 2, 2, 3, 4, 3, 258),
(260, 1, '2018-01-09 19:03:01', '2018-01-09 19:07:08', '2018-01-09 19:55:14', NULL, 3, 3, 3, 4, 3, 259),
(261, 1, '2018-01-09 19:07:59', '2018-01-09 19:10:06', '2018-01-09 19:59:07', NULL, 1, 1, 3, 4, 3, 260),
(262, 1, '2018-01-09 19:07:59', '2018-01-09 19:11:04', '2018-01-09 20:11:06', NULL, 2, 2, 3, 4, 3, 261),
(263, 1, '2018-01-09 19:07:59', '2018-01-09 19:10:40', '2018-01-09 20:22:48', NULL, 3, 3, 3, 4, 3, 262),
(264, 1, '2018-01-09 19:11:06', '2018-01-10 11:57:05', '2018-01-10 12:23:09', 'Comentario de la sesiÃ³n', 1, 1, 3, 4, 3, 263),
(265, 0, '2018-01-09 19:11:06', NULL, NULL, NULL, 2, 2, 3, 4, 3, 264),
(266, 0, '2018-01-09 19:11:06', NULL, NULL, NULL, 3, 3, 3, 4, 3, 265),
(269, 0, '2018-01-09 19:36:25', NULL, NULL, NULL, 1, 2, 2, 27, 5, NULL),
(270, 0, '2018-01-09 19:36:25', NULL, NULL, NULL, 6, 1, 2, 27, 5, 269);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablas`
--

CREATE TABLE IF NOT EXISTS `tablas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tablas`
--

INSERT IGNORE INTO `tablas` (`id`, `nombre`, `tipo`, `borrado`) VALUES
(1, 'Tabla 1', 'Normal', 0),
(2, 'Tabla 2', 'Normal', 0),
(3, 'Tabla 3', 'Normal', 0),
(6, 'Tabalala', 'Personal', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `contrasenha` varchar(300) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `borrado` tinyint(4) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `clase` varchar(10) NOT NULL,
  `entrenador_id` int(11) DEFAULT NULL,
  `entrenador_nombre` varchar(90) DEFAULT NULL,
  `imagen` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT IGNORE INTO `usuarios` (`id`, `login`, `contrasenha`, `nombre`, `apellidos`, `sexo`, `dni`, `email`, `borrado`, `tipo`, `clase`, `entrenador_id`, `entrenador_nombre`, `imagen`) VALUES
(1, 'admin', '$2y$15$tKzm9o7fcPtDC9jD91nBHev7FVl15cgUJFReu/e/xuUrQNZfssnYa', 'admin', 'admin', '', '26826819X', 'actifitmail@gmail.com', 0, 'Administrador', 'Otro', NULL, NULL, 'default.png'),
(2, 'secretario', '$2y$15$nKNj3f1/BkxclMiJYp/1PeQ7sVkrO4J5A3vWSrPqXQ3/dAWaCbJD6', 'secretario', 'secretario', '', '91690140L', 'saveiga@esei.uvigo.es', 0, 'Secretario', 'Otro', NULL, NULL, 'default.png'),
(3, 'entrenador', '$2y$15$8n35X28JIU46CXjTACBZTO6Y1radwkcEZFRyrBzSY5AqvIhzJ5wMm', 'entrenador', 'entrenador', 'Hombre', '78879758Q', 'dpvazquez@esei.uvigo.es', 0, 'Entrenador', 'Otro', NULL, NULL, 'default.png'),
(4, 'deportista', '$2y$15$LKEFHg8CLu7wKfmGg605R.nJDwVkrFWMtW41KFIvfYXUX2hYUZQbW', 'deportista', 'deportista', 'Hombre', '27245554F', 'pcperez2@esei.uvigo.es', 0, 'Deportista', 'PEF', 3, 'entrenador, entrenador', 'default.png'),
(5, 'deportista2', '$2y$15$GAnBBHxkDagIEmM4MBClY.sLyzXF358348Jy6Uub6H8z5rq5gfn4m', 'deportistaDos', 'deportistaDos', 'Mujer', '72946407K', 'afmontero@esei.uvigo.es', 0, 'Deportista', 'PEF', 3, 'entrenador, entrenador', 'default.png'),
(20, 'entrenador2', '$2y$15$5TkMsABh4XEIWaNyLsKnZ.ZqVBA/Tg4KnvQkVVv5RI0RplIk3cNf6', 'entrenadorDos', 'entrenadorDos', 'Mujer', '29567043Z', 'entrenador2@gmail.com', 0, 'Entrenador', 'Otro', NULL, NULL, 'default.png'),
(25, 'deportista3', '$2y$15$mJLfWdXBuWDx/KlwbRItaOGd.2Y795GmOYZHvqWPZYk8XxORhzt2W', 'deportistaTres', 'deportistaTres', 'Otro', '96275637Y', 'deportista3@gmail.com', 0, 'Deportista', 'TDU', NULL, NULL, 'default.png'),
(27, 'deportista4', '$2y$15$2yXtUJy4JcPNt0ckygAU7ekoYtb8qtpYj63Wfr5.Jr8ORgmbez66y', 'deportistaCuatro', 'deportistaCuatro', 'Otro', '68215504B', 'deportista4@gmail.com', 0, 'Deportista', 'TDU', NULL, NULL, 'default.png'),
(28, 'deportista5', '$2y$15$7gEdZgiEAEwIk0R61NkUqOj4FyB4PF97i6BXai.Pt37bnAE4DKrPe', 'deportistaCinco', 'deportistaCinco', 'Mujer', '59249012T', 'deportista5@gmail.com', 0, 'Deportista', 'PEF', 3, 'entrenador, entrenador', 'default.png');

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
