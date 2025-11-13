-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2025 a las 07:45:25
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
-- Base de datos: `empresa_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `ID_Admin` int(11) NOT NULL,
  `Pass_Admin` varchar(20) DEFAULT NULL,
  `Nom_Admin` varchar(35) DEFAULT NULL,
  `Correo_Admin` varchar(40) DEFAULT NULL,
  `GESTION_ID_Gest` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`ID_Admin`, `Pass_Admin`, `Nom_Admin`, `Correo_Admin`, `GESTION_ID_Gest`) VALUES
(1, 'admin123', 'Carlos Ruiz', 'carlosruiz@empresa.com', 1),
(2, 'admin456', 'Laura Gómez', 'lauragomez@empresa.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE `clasificacion` (
  `ID_Clasif` int(11) NOT NULL,
  `Nom_Clasif` varchar(35) DEFAULT NULL,
  `Cant_Prod` int(11) DEFAULT NULL,
  `Info_Prod` varchar(60) DEFAULT NULL,
  `PRODUCTO_ID_Prod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`ID_Clasif`, `Nom_Clasif`, `Cant_Prod`, `Info_Prod`, `PRODUCTO_ID_Prod`) VALUES
(1, 'Bebidas calientes', 1, 'Producto derivado del café', 1),
(2, 'Bebidas saludables', 1, 'Infusión natural antioxidante', 2),
(3, 'Bebidas dulces', 1, 'Bebida tradicional a base de cacao', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Client` int(11) NOT NULL,
  `Passw_Client` varchar(10) DEFAULT NULL,
  `Nom_Client` varchar(35) DEFAULT NULL,
  `Tele_Client` int(11) DEFAULT NULL,
  `Correo_Client` varchar(45) DEFAULT NULL,
  `Dir_Client` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_Client`, `Passw_Client`, `Nom_Client`, `Tele_Client`, `Correo_Client`, `Dir_Client`) VALUES
(1, '1234', 'Juan Pérez', 2147483647, 'juanperez@gmail.com', 'Calle 10 #12-34'),
(2, 'abcd', 'María López', 2147483647, 'marialopez@gmail.com', 'Carrera 15 #8-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion`
--

CREATE TABLE `gestion` (
  `ID_Gest` int(11) NOT NULL,
  `Cant_Venta` float DEFAULT NULL,
  `Total_Venta` float DEFAULT NULL,
  `Ganancias` float DEFAULT NULL,
  `PEDIDO_ID_Pedido` int(11) DEFAULT NULL,
  `PEDIDO_CLIENTE_ID_Client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gestion`
--

INSERT INTO `gestion` (`ID_Gest`, `Cant_Venta`, `Total_Venta`, `Ganancias`, `PEDIDO_ID_Pedido`, `PEDIDO_CLIENTE_ID_Client`) VALUES
(1, 2, 30000, 5000, 1, 1),
(2, 1, 12000, 3000, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID_Pedido` int(11) NOT NULL,
  `Fecha_Ped` date DEFAULT NULL,
  `Cant_Ped` float DEFAULT NULL,
  `Desc_Ped` float DEFAULT NULL,
  `Forma_Pago` varchar(20) DEFAULT NULL,
  `CLIENTE_ID_Client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`ID_Pedido`, `Fecha_Ped`, `Cant_Ped`, `Desc_Ped`, `Forma_Pago`, `CLIENTE_ID_Client`) VALUES
(1, '2025-11-12', 2, 0, 'Efectivo', 1),
(2, '2025-11-12', 1, 5, 'Tarjeta', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_Prod` int(11) NOT NULL,
  `Nom_Prod` varchar(35) DEFAULT NULL,
  `Precio_Prod` float DEFAULT NULL,
  `Stock_Prod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_Prod`, `Nom_Prod`, `Precio_Prod`, `Stock_Prod`) VALUES
(1, 'Café en grano', 15000, 50),
(2, 'Té verde', 12000, 30),
(3, 'Chocolate caliente', 10000, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_producto`
--

CREATE TABLE `venta_producto` (
  `PEDIDO_ID_Pedido` int(11) NOT NULL,
  `PEDIDO_CLIENTE_ID_Client` int(11) DEFAULT NULL,
  `PRODUCTO_ID_Prod` int(11) NOT NULL,
  `Cant_Ped` float DEFAULT NULL,
  `Desc_Pedido` float DEFAULT NULL,
  `Forma_Pago` varchar(25) DEFAULT NULL,
  `VENTA_PRODUCTOCOL` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta_producto`
--

INSERT INTO `venta_producto` (`PEDIDO_ID_Pedido`, `PEDIDO_CLIENTE_ID_Client`, `PRODUCTO_ID_Prod`, `Cant_Ped`, `Desc_Pedido`, `Forma_Pago`, `VENTA_PRODUCTOCOL`) VALUES
(1, 1, 1, 2, 0, 'Efectivo', 'Venta directa'),
(2, 2, 2, 1, 5, 'Tarjeta', 'Venta tienda online');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ID_Admin`),
  ADD KEY `GESTION_ID_Gest` (`GESTION_ID_Gest`);

--
-- Indices de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`ID_Clasif`),
  ADD KEY `PRODUCTO_ID_Prod` (`PRODUCTO_ID_Prod`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Client`);

--
-- Indices de la tabla `gestion`
--
ALTER TABLE `gestion`
  ADD PRIMARY KEY (`ID_Gest`),
  ADD KEY `PEDIDO_ID_Pedido` (`PEDIDO_ID_Pedido`),
  ADD KEY `PEDIDO_CLIENTE_ID_Client` (`PEDIDO_CLIENTE_ID_Client`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `CLIENTE_ID_Client` (`CLIENTE_ID_Client`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_Prod`);

--
-- Indices de la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD PRIMARY KEY (`PEDIDO_ID_Pedido`,`PRODUCTO_ID_Prod`),
  ADD KEY `PEDIDO_CLIENTE_ID_Client` (`PEDIDO_CLIENTE_ID_Client`),
  ADD KEY `PRODUCTO_ID_Prod` (`PRODUCTO_ID_Prod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `ID_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  MODIFY `ID_Clasif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gestion`
--
ALTER TABLE `gestion`
  MODIFY `ID_Gest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_Prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`GESTION_ID_Gest`) REFERENCES `gestion` (`ID_Gest`);

--
-- Filtros para la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD CONSTRAINT `clasificacion_ibfk_1` FOREIGN KEY (`PRODUCTO_ID_Prod`) REFERENCES `producto` (`ID_Prod`);

--
-- Filtros para la tabla `gestion`
--
ALTER TABLE `gestion`
  ADD CONSTRAINT `gestion_ibfk_1` FOREIGN KEY (`PEDIDO_ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`),
  ADD CONSTRAINT `gestion_ibfk_2` FOREIGN KEY (`PEDIDO_CLIENTE_ID_Client`) REFERENCES `cliente` (`ID_Client`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`CLIENTE_ID_Client`) REFERENCES `cliente` (`ID_Client`);

--
-- Filtros para la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD CONSTRAINT `venta_producto_ibfk_1` FOREIGN KEY (`PEDIDO_ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`),
  ADD CONSTRAINT `venta_producto_ibfk_2` FOREIGN KEY (`PEDIDO_CLIENTE_ID_Client`) REFERENCES `cliente` (`ID_Client`),
  ADD CONSTRAINT `venta_producto_ibfk_3` FOREIGN KEY (`PRODUCTO_ID_Prod`) REFERENCES `producto` (`ID_Prod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
