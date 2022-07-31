-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2022 a las 03:06:08
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reto1_g54_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `idDireccion` int(11) NOT NULL,
  `zona` enum('Urbana','Rural') DEFAULT NULL,
  `tipoCalle` enum('Avenida','Calle','Carrera','Circumbalar','Transversal','Otro') DEFAULT NULL,
  `numero1` varchar(9) NOT NULL,
  `numero2` varchar(9) NOT NULL,
  `numero3` varchar(9) NOT NULL,
  `nombreDepartamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `zona`, `tipoCalle`, `numero1`, `numero2`, `numero3`, `nombreDepartamento`) VALUES
(1, 'Rural', 'Otro', '11', '1', '1', 'Amazonas'),
(2, 'Urbana', 'Calle', '12', '12', '12', 'Antioquia'),
(3, 'Urbana', 'Carrera', '22', '10', '10', 'Antioquia'),
(4, 'Urbana', 'Circumbalar', '2', '22', '22', 'Bolívar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domiciliario`
--

CREATE TABLE `domiciliario` (
  `idDomiciliario` int(11) NOT NULL,
  `tipoTransporte` varchar(25) NOT NULL,
  `FK_idEmp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmp` int(11) NOT NULL,
  `nombreEmp` varchar(25) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `tipoDocumento` enum('CedulaCiudadania','CedulaExtranjera','LibretaMilitar','Pasaporte','Otro') DEFAULT NULL,
  `documento` varchar(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `FK_idSucursal` int(11) NOT NULL,
  `FK_idPuestoTrabajo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmp`, `nombreEmp`, `apellidos`, `tipoDocumento`, `documento`, `correo`, `FK_idSucursal`, `FK_idPuestoTrabajo`) VALUES
(1, 'Edwin', 'Brito Arenas', 'CedulaCiudadania', '74858328', 'briton@gmail.com', 3, 1),
(2, 'Nicoll', 'Brito', 'Pasaporte', '1010000', 'nikita2@gmail.com', 3, 1),
(3, 'Jacinto', 'Perez', 'CedulaCiudadania', '55500005', 'jacinto@gmail.com', 5, 5),
(4, 'Jepeto', 'Perez', 'CedulaCiudadania', '222111122', 'japeto@gmail.com', 4, 2),
(5, 'Maria', 'Perez', 'CedulaCiudadania', '2045125', 'ferc@gmail.com', 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `nit` int(11) NOT NULL,
  `nombreEmpresa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`nit`, `nombreEmpresa`) VALUES
(844000282, 'Falck Services');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerente`
--

CREATE TABLE `gerente` (
  `idGerente` int(11) NOT NULL,
  `personasCargo` int(11) NOT NULL,
  `FK_idEmp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gerente`
--

INSERT INTO `gerente` (`idGerente`, `personasCargo`, `FK_idEmp`) VALUES
(1, 10, 3),
(2, 11, 4),
(3, 20, 5),
(4, 5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operario`
--

CREATE TABLE `operario` (
  `idOperario` int(11) NOT NULL,
  `manejoMaquinaP` binary(1) NOT NULL,
  `FK_idEmp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestotrabajo`
--

CREATE TABLE `puestotrabajo` (
  `idPuestoTrabajo` int(11) NOT NULL,
  `nombrePuestoTrabajo` varchar(50) NOT NULL,
  `salario` float NOT NULL,
  `FK_idSucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `puestotrabajo`
--

INSERT INTO `puestotrabajo` (`idPuestoTrabajo`, `nombrePuestoTrabajo`, `salario`, `FK_idSucursal`) VALUES
(1, 'Domiciliario', 200000, 3),
(2, 'Gerente', 5000000, 4),
(3, 'Gerente', 5000000, 3),
(5, 'Operario', 2000000, 4),
(6, 'Gerente', 5500000, 3),
(7, 'Domiciliario', 1100000, 5),
(8, 'Operario', 1560000, 4),
(9, 'Gerente', 100000, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idSucursal` int(11) NOT NULL,
  `nombreSucursal` varchar(50) NOT NULL,
  `FK_nit` int(11) NOT NULL,
  `FK_idDireccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idSucursal`, `nombreSucursal`, `FK_nit`, `FK_idDireccion`) VALUES
(3, 'Oriental', 844000282, 1),
(4, 'Paisa', 844000282, 3),
(5, 'Costa', 844000282, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`);

--
-- Indices de la tabla `domiciliario`
--
ALTER TABLE `domiciliario`
  ADD PRIMARY KEY (`idDomiciliario`),
  ADD KEY `FK_idEmp` (`FK_idEmp`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmp`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `FK_idSucursal` (`FK_idSucursal`),
  ADD KEY `FK_idPuestoTrabajo` (`FK_idPuestoTrabajo`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`nit`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`idGerente`),
  ADD KEY `FK_idEmp` (`FK_idEmp`);

--
-- Indices de la tabla `operario`
--
ALTER TABLE `operario`
  ADD PRIMARY KEY (`idOperario`),
  ADD KEY `FK_idEmp` (`FK_idEmp`);

--
-- Indices de la tabla `puestotrabajo`
--
ALTER TABLE `puestotrabajo`
  ADD PRIMARY KEY (`idPuestoTrabajo`),
  ADD KEY `FK_idSucursal` (`FK_idSucursal`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idSucursal`),
  ADD UNIQUE KEY `nombreSucursal` (`nombreSucursal`),
  ADD KEY `FK_nit` (`FK_nit`),
  ADD KEY `FK_idDireccion` (`FK_idDireccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `domiciliario`
--
ALTER TABLE `domiciliario`
  MODIFY `idDomiciliario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `gerente`
--
ALTER TABLE `gerente`
  MODIFY `idGerente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `operario`
--
ALTER TABLE `operario`
  MODIFY `idOperario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puestotrabajo`
--
ALTER TABLE `puestotrabajo`
  MODIFY `idPuestoTrabajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `idSucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `domiciliario`
--
ALTER TABLE `domiciliario`
  ADD CONSTRAINT `domiciliario_ibfk_1` FOREIGN KEY (`FK_idEmp`) REFERENCES `empleado` (`idEmp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`FK_idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`FK_idPuestoTrabajo`) REFERENCES `puestotrabajo` (`idPuestoTrabajo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `gerente_ibfk_1` FOREIGN KEY (`FK_idEmp`) REFERENCES `empleado` (`idEmp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `operario`
--
ALTER TABLE `operario`
  ADD CONSTRAINT `operario_ibfk_1` FOREIGN KEY (`FK_idEmp`) REFERENCES `empleado` (`idEmp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `puestotrabajo`
--
ALTER TABLE `puestotrabajo`
  ADD CONSTRAINT `puestotrabajo_ibfk_1` FOREIGN KEY (`FK_idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`FK_nit`) REFERENCES `empresa` (`nit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sucursal_ibfk_2` FOREIGN KEY (`FK_idDireccion`) REFERENCES `direccion` (`idDireccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
