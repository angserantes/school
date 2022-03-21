-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-03-2022 a las 09:40:07
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `school`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `client_name` varchar(40) CHARACTER SET latin1 NOT NULL,
  `address` varchar(60) CHARACTER SET latin1 NOT NULL,
  `industry` varchar(20) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`client_id`, `client_name`, `address`, `industry`) VALUES
(101, 'Big Business Federation', '123 Falschungstraße, 10999 Berlin', 'NGO'),
(102, 'eCommerce GmbH', '27 Ersatz Allee, 10317 Berlin', 'Retail'),
(103, 'AutoMaker AG', '20 Künstlichstraße, 10023 Berlin', 'Auto'),
(104, 'Banko Bank', '12 Betrugstraße, 12345 Berlin', 'Banking'),
(105, 'WeMoveIt GmbH', '138 Arglistweg, 10065 Berlin', 'Logistics');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(40) CHARACTER SET latin1 NOT NULL,
  `language` varchar(3) CHARACTER SET latin1 NOT NULL,
  `level` varchar(2) CHARACTER SET latin1 DEFAULT NULL,
  `course_length_weeks` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `in_school` tinyint(1) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `language`, `level`, `course_length_weeks`, `start_date`, `in_school`, `teacher`, `client`) VALUES
(12, 'English for Logistics', 'ENG', 'A1', 10, '2020-02-01', 1, 1, 105),
(13, 'Beginner English', 'ENG', 'A2', 40, '2019-11-12', 0, 6, 101),
(14, 'Intermediate English', 'ENG', 'B2', 40, '2019-11-12', 0, 6, 101),
(15, 'Advanced English', 'ENG', 'C1', 40, '2019-11-12', 0, 6, 101),
(16, 'Mandarin für Autoindustrie', 'MAN', 'B1', 15, '2020-01-15', 1, 3, 103),
(17, 'Français intermédiaire', 'FRA', 'B1', 18, '2020-04-03', 0, 2, 101),
(18, 'Deutsch für Anfänger', 'DEU', 'A2', 8, '2020-02-14', 1, 4, 102),
(19, 'Intermediate English', 'ENG', 'B2', 10, '2020-03-29', 0, 1, 104),
(20, 'Fortgeschrittenes Russisch', 'RUS', 'C1', 4, '2020-04-08', 0, 5, 103);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participant`
--

CREATE TABLE `participant` (
  `participant_id` int(11) NOT NULL,
  `first_name` varchar(40) CHARACTER SET latin1 NOT NULL,
  `last_name` varchar(40) CHARACTER SET latin1 NOT NULL,
  `phone_no` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `participant`
--

INSERT INTO `participant` (`participant_id`, `first_name`, `last_name`, `phone_no`, `client`) VALUES
(101, 'Marina', 'Berg', '491635558182', 101),
(102, 'Andrea', 'Duerr', '49159555740', 101),
(103, 'Philipp', 'Probst', '49155555692', 102),
(104, 'René', 'Brandt', '4916355546', 102),
(105, 'Susanne', 'Shuster', '49155555779', 102),
(106, 'Christian', 'Schreiner', '49162555375', 101),
(107, 'Harry', 'Kim', '49177555633', 101),
(108, 'Jan', 'Nowak', '49151555824', 101),
(109, 'Pablo', 'Garcia', '49162555176', 101),
(110, 'Melanie', 'Dreschler', '49151555527', 103),
(111, 'Dieter', 'Durr', '49178555311', 103),
(112, 'Max', 'Mustermann', '49152555195', 104),
(113, 'Maxine', 'Mustermann', '49177555355', 104),
(114, 'Heiko', 'Fleischer', '49155555581', 105);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `takes_course`
--

CREATE TABLE `takes_course` (
  `participant_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `takes_course`
--

INSERT INTO `takes_course` (`participant_id`, `course_id`) VALUES
(114, 12),
(106, 13),
(107, 13),
(108, 13),
(109, 14),
(101, 15),
(109, 15),
(110, 16),
(111, 16),
(101, 17),
(102, 17),
(103, 18),
(104, 18),
(105, 18),
(112, 19),
(113, 19),
(110, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `first_name` varchar(40) CHARACTER SET latin1 NOT NULL,
  `last_name` varchar(40) CHARACTER SET latin1 NOT NULL,
  `language_1` varchar(3) CHARACTER SET latin1 NOT NULL,
  `language_2` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `phone_no` varchar(20) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `first_name`, `last_name`, `language_1`, `language_2`, `dob`, `tax_id`, `phone_no`) VALUES
(1, 'James', 'Smith', 'ENG', NULL, '1985-04-20', 12345, '+491774553676'),
(2, 'Stefanie', 'Martin', 'FRA', NULL, '1970-02-17', 23456, '+491234567890'),
(3, 'Steve', 'Wang', 'MAN', 'ENG', '1990-11-12', 34567, '+447840921333'),
(4, 'Friederike', 'Müller-Rossi', 'DEU', 'ITA', '1987-07-07', 45678, '+492345678901'),
(5, 'Isobel', 'Ivanova', 'RUS', 'ENG', '1963-05-30', 56789, '+491772635467'),
(6, 'Niamh', 'Murphy', 'ENG', 'IRI', '1995-09-08', 67890, '+491231231232');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indices de la tabla `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `teacher` (`teacher`),
  ADD KEY `client` (`client`);

--
-- Indices de la tabla `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`participant_id`),
  ADD KEY `client` (`client`);

--
-- Indices de la tabla `takes_course`
--
ALTER TABLE `takes_course`
  ADD PRIMARY KEY (`participant_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indices de la tabla `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `tax_id` (`tax_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`teacher_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`client_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `takes_course`
--
ALTER TABLE `takes_course`
  ADD CONSTRAINT `takes_course_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`participant_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `takes_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
