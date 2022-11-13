-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2022 a las 22:38:25
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comanda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `comentarioId` int(11) NOT NULL,
  `mesaId` int(11) NOT NULL,
  `puntuacionMesa` int(11) NOT NULL,
  `mozoId` int(11) NOT NULL,
  `puntuacionMozo` int(11) NOT NULL,
  `cocineroId` int(11) NOT NULL,
  `puntuacionCocinero` int(11) NOT NULL,
  `puntuacionRestaurante` int(11) NOT NULL,
  `comentarios` varchar(66) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedidos`
--

CREATE TABLE `detallespedidos` (
  `detallePedidoId` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `codigoAlfanumerico` varchar(5) NOT NULL,
  `empleadoId` int(11) DEFAULT NULL,
  `productoId` int(11) NOT NULL,
  `horaPedido` date NOT NULL,
  `tiempoPreparacion` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `perfil` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `mesaId` int(11) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fotoUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`mesaId`, `estado`, `activo`, `fotoUrl`) VALUES
(1, 'Cerrada', 1, ''),
(2, 'Con cliente esperando PEDIDOO', 1, ''),
(3, 'con cliente comiendo', 1, ''),
(4, 'cerrada', 1, 'ddd'),
(5, 'cerrada :)', 0, ''),
(6, 'cerrada', 1, 'c'),
(7, 'cerrada :)', 1, 'bbbb'),
(8, 'Closed', 1, 'aaaa'),
(9, 'Closed', 1, 'zzzz'),
(10, 'cerrada', 0, 'ooooo'),
(11, 'Closed', 1, 'zzzz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedidoId` int(11) NOT NULL,
  `codigoAlfanumerico` varchar(5) NOT NULL,
  `nombreCliente` varchar(25) NOT NULL,
  `mesaId` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`pedidoId`, `codigoAlfanumerico`, `nombreCliente`, `mesaId`, `estado`) VALUES
(1, '23bca', 'Daii', 3, ''),
(2, '123ab', 'Gonzis', 2, ''),
(3, 'sderf', 'Fabian', 3, ''),
(4, 'sdf34', 'Daniel', 1, ''),
(5, '17dae', 'Daniel', 1, ''),
(6, '19158', 'Daniel', 1, ''),
(7, '19550', 'Daniel', 1, ''),
(8, '196cb', 'Daniel', 1, ''),
(9, '19860', 'Daniel', 1, ''),
(10, '337ab', 'Daniel', 1, ''),
(11, '44c44', 'Daniel', 1, ''),
(12, '44f10', 'Daniel', 1, ''),
(13, '45319', 'Daniel', 1, ''),
(14, '454af', 'Daniel', 1, ''),
(15, '3260b', 'Daniel', 1, ''),
(16, 'ac486', 'Daniel', 1, ''),
(17, 'ec977', 'Daniel', 1, ''),
(18, '03c4c', 'Daniel', 1, ''),
(19, '4aece', 'Daniel1', 11, ''),
(20, '0249f', 'Daniel1', 11, ''),
(21, '6f0ca', 'Daniel1', 11, ''),
(22, '94c50', 'Daniel1', 11, '999999999'),
(23, 'd43b2', 'Daniel1', 11, 'cancelado'),
(24, 'cd2a2', 'Daniel1', 11, 'cancelado'),
(25, '2dcfc', 'Daniel222', 1122, 'cancelado'),
(26, 'd3be9', 'Daniel222', 1122, 'cancelado'),
(27, 'c1352', 'Daniel222', 1122, 'en preparacion3'),
(28, '98d78', 'Daniel222', 1122, 'en preparacion3'),
(29, '3f246', 'Daniel222', 1122, 'cancelado'),
(30, '76b53', 'Daniel222', 1122, 'en preparacion3'),
(31, 'aae48', 'Daniel222', 1122, 'en preparacion3'),
(32, '42d35', 'Daniel222', 1122, 'en preparacion3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `productoId` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `precio` double NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `perfil` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`productoId`, `nombre`, `precio`, `activo`, `perfil`) VALUES
(9, 'Lemon Pie', 250, 0, 'cocinero'),
(10, 'Cerveza', 100, 1, 'cervecero'),
(11, 'Daikiri', 95, 1, 'bartender'),
(12, 'pizza', 150, 1, 'cocinero'),
(13, 'milanesa', 130, 1, 'cocinero'),
(14, 'papas', 250, 0, 'cocinero'),
(15, 'papas', 13, 1, 'cocinero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `empleadoId` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `perfil` varchar(25) NOT NULL,
  `fechaIngreso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(25) NOT NULL,
  `clave` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`empleadoId`, `nombre`, `perfil`, `fechaIngreso`, `estado`, `clave`) VALUES
(1, 'Gon', 'Admin', '2022-11-09 03:00:00', 'Baja', '$2y$10$oKj52F4cNCZoB6e5Na'),
(2, 'Gon', 'Admin', '2022-10-10 03:00:00', 'Baja', '$2y$10$YA.aN1BlabgK5dDcra'),
(3, 'Gonza', 'Admin', '2022-11-13 20:29:42', 'Baja', '$2y$10$xIEJc6WQdXeh70l9tZ'),
(4, 'Daniel', 'cocinero', '2022-12-11 03:00:00', 'activo', '$2y$10$jCQEH7FvBC.l05lvjK'),
(5, 'Nicolas', 'mozo', '2022-12-11 03:00:00', 'activo', '$2y$10$eX2cYm63JCcJEG1hOm'),
(6, 'Priscila', 'bartender', '2020-12-11 03:00:00', 'activo', '$2y$10$563EfggCOYa7.ZQ2rM'),
(7, 'Priscila', 'bartender', '2020-12-11 03:00:00', 'activo', '$2y$10$QmdfrZ6IIlvf4UO/AU'),
(8, 'Priscila', 'bartender', '2020-12-11 03:00:00', 'activo', '$2y$10$LZeUlvFXwyw5T7r98c');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`comentarioId`);

--
-- Indices de la tabla `detallespedidos`
--
ALTER TABLE `detallespedidos`
  ADD PRIMARY KEY (`detallePedidoId`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`mesaId`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedidoId`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`productoId`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`empleadoId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `comentarioId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallespedidos`
--
ALTER TABLE `detallespedidos`
  MODIFY `detallePedidoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `mesaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedidoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `productoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `empleadoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
