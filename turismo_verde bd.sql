-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2025 a las 19:57:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `turismo_verde`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`idperfil`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Administrador', 'Acceso total al sistema', 'A'),
(2, 'Persona', 'Personas', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `nom1` varchar(50) NOT NULL,
  `nom2` varchar(50) DEFAULT NULL,
  `apell1` varchar(50) NOT NULL,
  `apell2` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `tele` varchar(20) DEFAULT NULL,
  `movil` varchar(20) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `estado` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `nom1`, `nom2`, `apell1`, `apell2`, `direccion`, `tele`, `movil`, `correo`, `fecha_nac`, `estado`) VALUES
(1, 'Admin', '', 'Principal', '', 'Calle 123', '6040000000', '3000000000', 'admin@turismo.com', '1990-01-01', 'A'),
(2, 'Esteban', 'Reins', 'Cano', 'Perez', 'guayabal', '0000000', '3014889536', 'sebastianhenaolopez1719@gmail.com', '2001-06-19', 'A'),
(4, 'jairo', '', 'henao', '', 'guayabal', '0000000', '3014889536', 'jairohenaor@gmail.com', '2001-06-19', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombreu` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `idperfil` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `estado` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombreu`, `contrasena`, `idperfil`, `idpersona`, `estado`) VALUES
(1, 'admin', 'admin123', 1, 1, 'A'),
(2, 'esteban869', '8JAegD1i', 2, 2, 'A'),
(4, 'jairo925', 'R3kYFDAB', 2, 4, 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idperfil`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `idperfil` (`idperfil`),
  ADD KEY `idpersona` (`idpersona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
