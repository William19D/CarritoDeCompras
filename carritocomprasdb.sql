-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 04:11:26
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
-- Base de datos: `carritocomprasdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrocompras`
--

CREATE TABLE `carrocompras` (
  `id` int(11) NOT NULL,
  `idCiudadano` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `concepto` text DEFAULT NULL,
  `impuesto` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrocompras`
--

INSERT INTO `carrocompras` (`id`, `idCiudadano`, `codigo`, `fecha`, `hora`, `estado`, `observaciones`, `descripcion`, `detalle`, `concepto`, `impuesto`, `subtotal`, `total`) VALUES
(1, 1, 'CARR001', '2024-11-20', '10:30:00', 'Pendiente', 'Primera compra', 'Compra de Laptop y accesorios', 'Laptop + Mouse', 'Electrónica', 100.00, 1300.50, 1400.50),
(2, 2, 'CARR002', '2024-11-20', '11:45:00', 'Pendiente', 'Compra urgente', 'Compra de Smartphone', 'Smartphone', 'Electrónica', 60.00, 800.00, 860.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogopreferencias`
--

CREATE TABLE `catalogopreferencias` (
  `id` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idCiudadano` int(11) DEFAULT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `oferta` decimal(10,2) DEFAULT NULL,
  `codigoBarras` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catalogopreferencias`
--

INSERT INTO `catalogopreferencias` (`id`, `idProducto`, `idCiudadano`, `codigo`, `nombre`, `descripcion`, `cantidad`, `estado`, `fecha`, `oferta`, `codigoBarras`) VALUES
(1, 1, 1, 'C101', 'Laptop Gaming Favorita', 'Preferencia de alto rendimiento', 1, 'Activa', '2024-11-20', 1400.00, 'LPT12345'),
(2, 2, 2, 'C102', 'Smartphone Básico Favorito', 'Modelo económico popular', 3, 'Activa', '2024-11-20', 250.00, 'SMB67890'),
(3, 3, NULL, 'C103', 'Audífonos Premium', 'Audífonos para música profesional', 5, 'Pendiente', '2024-11-20', 110.00, 'AUDP12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`id`, `cedula`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `fechaNacimiento`, `genero`, `estado`) VALUES
(1, '1010101010', 'Juan', 'Pérez', 'Calle 1 #123', '3001234567', 'juan.perez@example.com', '1990-05-15', 'M', 'Activo'),
(2, '2020202020', 'María', 'Gómez', 'Calle 2 #456', '3109876543', 'maria.gomez@example.com', '1985-08-20', 'F', 'Activo'),
(3, '3030303030', 'Carlos', 'Rodríguez', 'Calle 3 #789', '3201122334', 'carlos.rodriguez@example.com', '1995-11-12', 'M', 'Activo'),
(4, '123123', 'sara', 'martines', 'dasdaw', '3123497', 'gdfgdg@gasdad.com', '2024-11-14', 'M', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleproducto`
--

CREATE TABLE `detalleproducto` (
  `id` int(11) NOT NULL,
  `idCarroCompras` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `concepto` text DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `impuesto` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `fechaPrestamo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleproducto`
--

INSERT INTO `detalleproducto` (`id`, `idCarroCompras`, `idProducto`, `estado`, `cantidad`, `concepto`, `monto`, `impuesto`, `subtotal`, `fechaEntrega`, `fechaPrestamo`) VALUES
(1, 1, 1, 'En proceso', 1, 'Laptop', 1200.50, 100.00, 1300.50, '2024-11-22', NULL),
(2, 1, 3, 'En proceso', 1, 'Audífonos', 150.00, 10.00, 160.00, '2024-11-22', NULL),
(3, 2, 2, 'En proceso', 1, 'Smartphone', 800.00, 60.00, 860.00, '2024-11-22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoriaPrincipal` varchar(50) DEFAULT NULL,
  `categoriaSecundaria` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `caracteristicas` text DEFAULT NULL,
  `garantia` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `nombre`, `categoriaPrincipal`, `categoriaSecundaria`, `descripcion`, `precio`, `stock`, `detalle`, `caracteristicas`, `garantia`, `estado`) VALUES
(1, 'P001', 'Laptop', 'Electrónica', 'Computadoras', 'Laptop de alta gama', 1200.50, 15, 'Pantalla 15 pulgadas, SSD 512GB', 'Intel i7, 16GB RAM', '2 años', 'Disponible'),
(2, 'P002', 'Smartphone', 'Electrónica', 'Celulares', 'Teléfono inteligente de última generación', 800.00, 30, 'Pantalla AMOLED', '128GB almacenamiento', '1 año', 'Disponible'),
(3, 'P003', 'Audífonos', 'Electrónica', 'Audio', 'Audífonos inalámbricos', 150.00, 50, 'Bluetooth 5.0', 'Cancelación de ruido', '6 meses', 'Disponible');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrocompras`
--
ALTER TABLE `carrocompras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCiudadano` (`idCiudadano`);

--
-- Indices de la tabla `catalogopreferencias`
--
ALTER TABLE `catalogopreferencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idCiudadano` (`idCiudadano`);

--
-- Indices de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `detalleproducto`
--
ALTER TABLE `detalleproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCarroCompras` (`idCarroCompras`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrocompras`
--
ALTER TABLE `carrocompras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `catalogopreferencias`
--
ALTER TABLE `catalogopreferencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalleproducto`
--
ALTER TABLE `detalleproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrocompras`
--
ALTER TABLE `carrocompras`
  ADD CONSTRAINT `carrocompras_ibfk_1` FOREIGN KEY (`idCiudadano`) REFERENCES `ciudadano` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catalogopreferencias`
--
ALTER TABLE `catalogopreferencias`
  ADD CONSTRAINT `catalogopreferencias_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catalogopreferencias_ibfk_2` FOREIGN KEY (`idCiudadano`) REFERENCES `ciudadano` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleproducto`
--
ALTER TABLE `detalleproducto`
  ADD CONSTRAINT `detalleproducto_ibfk_1` FOREIGN KEY (`idCarroCompras`) REFERENCES `carrocompras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleproducto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
