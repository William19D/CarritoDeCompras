-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2024 a las 10:58:46
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
(1, 1, 'CC001', '2024-11-21', '08:30:00', 'Pendiente', 'Observación 1', 'Apple iPhone 14 - 128GB', 'Smartphone con cámara dual de 12 MP', 'Electrónica', 10.50, 999.99, 1109.49),
(2, 2, 'CC002', '2024-11-22', '14:00:00', 'Completado', 'Observación 2', 'Samsung Galaxy S23 - 256GB', 'Smartphone con pantalla Dynamic AMOLED 2X', 'Electrónica', 5.25, 1199.99, 1265.24),
(3, 3, 'CC003', '2024-11-23', '09:00:00', 'Pendiente', 'Observación 3', 'Sony PlayStation 5', 'Consola de videojuegos de última generación', 'Videojuegos', 8.00, 499.99, 539.99),
(4, 4, 'CC004', '2024-11-24', '11:15:00', 'Completado', 'Observación 4', 'Dell XPS 13', 'Laptop ultradelgada con procesador Intel i7', 'Computación', 6.75, 1299.00, 1384.74),
(5, 5, 'CC005', '2024-11-25', '13:45:00', 'Pendiente', 'Observación 5', 'Bose QuietComfort 35 II', 'Auriculares con cancelación de ruido', 'Accesorios', 12.00, 299.99, 335.99),
(6, 6, 'CC006', '2024-11-26', '10:30:00', 'Completado', 'Observación 6', 'Apple MacBook Pro 16\"', 'Laptop con pantalla Retina y chip M1 Pro', 'Computación', 15.25, 2399.00, 2627.75),
(7, 7, 'CC007', '2024-11-27', '12:00:00', 'Pendiente', 'Observación 7', 'LG OLED65CXPUA', 'Televisor OLED de 65 pulgadas 4K', 'Electrónica', 3.50, 1799.99, 1899.49),
(8, 8, 'CC008', '2024-11-28', '16:30:00', 'Completado', 'Observación 8', 'Ninja Air Fryer', 'Freidora de aire de 4 cuartos de capacidad', 'Cocina', 9.00, 99.99, 109.99),
(9, 9, 'CC009', '2024-11-29', '17:00:00', 'Pendiente', 'Observación 9', 'Canon EOS Rebel T7', 'Cámara DSLR con lente 18-55mm', 'Fotografía', 7.50, 449.99, 499.99),
(10, 10, 'CC010', '2024-11-30', '19:30:00', 'Completado', 'Observación 10', 'Apple Watch Series 8', 'Reloj inteligente con monitorización de salud', 'Accesorios', 13.00, 399.00, 442.88),
(11, 11, 'CC011', '2024-12-01', '09:30:00', 'Pendiente', 'Observación 11', 'GoPro HERO10 Black', 'Cámara de acción 5.3K a 60 fps', 'Fotografía', 4.25, 499.99, 539.99),
(12, 12, 'CC012', '2024-12-02', '14:30:00', 'Completado', 'Observación 12', 'HP Spectre x360', 'Laptop convertible con pantalla táctil 4K', 'Computación', 10.00, 1699.00, 1868.90),
(13, 13, 'CC013', '2024-12-03', '11:00:00', 'Pendiente', 'Observación 13', 'JBL Charge 5', 'Altavoz Bluetooth portátil resistente al agua', 'Accesorios', 5.75, 179.99, 199.99),
(14, 14, 'CC014', '2024-12-04', '15:00:00', 'Completado', 'Observación 14', 'Microsoft Surface Pro 8', 'Tablet con procesador Intel i7 y teclado desmontable', 'Computación', 2.00, 1099.99, 1159.99),
(15, 15, 'CC015', '2024-12-05', '10:00:00', 'Pendiente', 'Observación 15', 'Samsung 65\" QLED 4K', 'Televisor QLED con HDR10+ y Alexa integrado', 'Electrónica', 11.50, 1499.99, 1664.99),
(16, 16, 'CC016', '2024-12-06', '12:30:00', 'Completado', 'Observación 16', 'Dyson V11 Torque Drive', 'Aspiradora inalámbrica de alta potencia', 'Hogar', 14.00, 599.99, 683.99),
(17, 17, 'CC017', '2024-12-07', '18:00:00', 'Pendiente', 'Observación 17', 'Fujifilm X-T4', 'Cámara mirrorless con 4K a 60fps', 'Fotografía', 6.75, 1699.00, 1813.75),
(18, 18, 'CC018', '2024-12-08', '09:45:00', 'Completado', 'Observación 18', 'iRobot Roomba i7+', 'Robot aspirador con autovaciado', 'Hogar', 3.00, 699.00, 758.88),
(19, 19, 'CC019', '2024-12-09', '16:00:00', 'Pendiente', 'Observación 19', 'Sennheiser Momentum 3', 'Auriculares inalámbricos con cancelación de ruido', 'Accesorios', 8.50, 399.99, 439.99),
(20, 20, 'CC020', '2024-12-10', '14:15:00', 'Completado', 'Observación 20', 'Bose SoundLink Revolve+', 'Altavoz Bluetooth 360°', 'Accesorios', 5.25, 299.99, 324.99),
(21, 21, 'CC021', '2024-12-11', '10:00:00', 'Pendiente', 'Observación 21', 'Oculus Quest 2', 'Gafas de realidad virtual con 64 GB', 'Videojuegos', 9.75, 299.99, 328.49),
(22, 22, 'CC022', '2024-12-12', '17:30:00', 'Completado', 'Observación 22', 'Samsung Galaxy Tab S8', 'Tablet Android de 11\" con S Pen', 'Electrónica', 7.25, 649.99, 696.99),
(23, 23, 'CC023', '2024-12-13', '13:00:00', 'Pendiente', 'Observación 23', 'Bose QuietComfort 45', 'Auriculares con cancelación activa de ruido', 'Accesorios', 10.00, 329.99, 362.99),
(24, 24, 'CC024', '2024-12-14', '11:30:00', 'Completado', 'Observación 24', 'Razer Blade 15', 'Laptop para juegos con tarjeta gráfica RTX 3070', 'Computación', 12.50, 1799.00, 1959.00),
(25, 25, 'CC025', '2024-12-15', '18:45:00', 'Pendiente', 'Observación 25', 'Fitbit Charge 5', 'Reloj de actividad con GPS y monitoreo de salud', 'Accesorios', 6.00, 149.99, 159.99),
(26, 26, 'CC026', '2024-12-16', '14:00:00', 'Completado', 'Observación 26', 'Logitech MX Master 3', 'Raton inalámbrico ergonómico para productividad', 'Computación', 13.00, 99.99, 112.99),
(27, 27, 'CC027', '2024-12-17', '12:15:00', 'Pendiente', 'Observación 27', 'Lenovo ThinkPad X1 Carbon', 'Laptop ultradelgada para profesionales', 'Computación', 4.50, 1799.00, 1899.99),
(28, 28, 'CC028', '2024-12-18', '16:30:00', 'Completado', 'Observación 28', 'Anker PowerCore 26800', 'Batería externa de alta capacidad', 'Accesorios', 7.00, 59.99, 64.99),
(29, 29, 'CC029', '2024-12-19', '13:00:00', 'Pendiente', 'Observación 29', 'Nest Thermostat', 'Termostato inteligente para control remoto', 'Hogar', 5.25, 119.99, 127.99),
(30, 30, 'CC030', '2024-12-20', '09:45:00', 'Completado', 'Observación 30', 'Google Pixel 7', 'Smartphone con cámara de 50 MP y Google Tensor', 'Electrónica', 8.50, 599.99, 651.49),
(31, 31, 'CC031', '2024-12-21', '11:00:00', 'Pendiente', 'Observación 31', 'TCL 55\" 6-Series QLED', 'Televisor 4K con Dolby Vision', 'Electrónica', 10.00, 649.99, 719.99),
(32, 32, 'CC032', '2024-12-22', '18:30:00', 'Completado', 'Observación 32', 'Nikon Z6 II', 'Cámara mirrorless de 24.5 MP', 'Fotografía', 5.75, 1699.00, 1813.75),
(33, 33, 'CC033', '2024-12-23', '12:00:00', 'Pendiente', 'Observación 33', 'Jabra Elite 85h', 'Auriculares inalámbricos con cancelación de ruido', 'Accesorios', 9.25, 299.99, 328.49),
(34, 34, 'CC034', '2024-12-24', '10:15:00', 'Completado', 'Observación 34', 'Sony WH-1000XM5', 'Auriculares inalámbricos de alta gama con cancelación activa', 'Accesorios', 12.00, 399.99, 439.99),
(35, 35, 'CC035', '2024-12-25', '17:00:00', 'Pendiente', 'Observación 35', 'Apple MacBook Air M2', 'Laptop ultradelgada con chip M2', 'Computación', 10.50, 999.00, 1069.99),
(36, 36, 'CC036', '2024-12-26', '13:30:00', 'Completado', 'Observación 36', 'Apple AirPods Pro 2', 'Auriculares inalámbricos con cancelación de ruido', 'Accesorios', 14.25, 249.99, 285.49),
(37, 37, 'CC037', '2024-12-27', '15:00:00', 'Pendiente', 'Observación 37', 'Samsung 32\" 4K Monitor', 'Pantalla ultra ancha 4K', 'Computación', 6.75, 329.99, 357.49),
(38, 38, 'CC038', '2024-12-28', '10:00:00', 'Completado', 'Observación 38', 'Fitbit Versa 3', 'Reloj inteligente con monitoreo de salud y GPS', 'Accesorios', 8.25, 229.99, 249.99),
(39, 39, 'CC039', '2024-12-29', '16:15:00', 'Pendiente', 'Observación 39', 'Sony Alpha 7 III', 'Cámara full-frame sin espejo de 24.2 MP', 'Fotografía', 7.00, 1999.00, 2139.99),
(40, 40, 'CC040', '2024-12-30', '14:45:00', 'Completado', 'Observación 40', 'GoPro HERO11 Black', 'Cámara de acción con estabilización avanzada', 'Fotografía', 5.00, 549.99, 594.99),
(41, 41, 'CC041', '2024-12-31', '09:00:00', 'Pendiente', 'Observación 41', 'LG OLED55CXPUA', 'Televisor OLED 4K de 55 pulgadas', 'Electrónica', 3.00, 1299.99, 1379.99),
(42, 42, 'CC042', '2024-12-01', '13:30:00', 'Completado', 'Observación 42', 'Toshiba Canvio Basics 2TB', 'Disco duro portátil USB 3.0', 'Computación', 9.50, 59.99, 64.99),
(43, 43, 'CC043', '2024-12-02', '10:45:00', 'Pendiente', 'Observación 43', 'Harman Kardon Onyx Studio 7', 'Altavoz Bluetooth de alta fidelidad', 'Accesorios', 12.00, 449.99, 499.99),
(44, 44, 'CC044', '2024-12-03', '12:00:00', 'Completado', 'Observación 44', 'Anker Soundcore Liberty 3 Pro', 'Auriculares true wireless con cancelación de ruido', 'Accesorios', 10.25, 169.99, 186.99),
(45, 45, 'CC045', '2024-12-04', '14:30:00', 'Pendiente', 'Observación 45', 'Bose Soundbar 700', 'Barra de sonido con Alexa integrada', 'Electrónica', 5.50, 799.99, 879.99),
(46, 46, 'CC046', '2024-12-05', '17:45:00', 'Completado', 'Observación 46', 'Logitech G Pro X Wireless', 'Auriculares inalámbricos para juegos con micrófono Blue VO!CE', 'Accesorios', 13.75, 199.99, 227.99),
(47, 47, 'CC047', '2024-12-06', '09:30:00', 'Pendiente', 'Observación 47', 'Oculus Rift S', 'Gafas de realidad virtual para PC', 'Videojuegos', 6.50, 399.99, 439.99),
(48, 48, 'CC048', '2024-12-07', '14:00:00', 'Completado', 'Observación 48', 'Samsung Galaxy Watch 5', 'Reloj inteligente con monitoreo de salud y batería de larga duración', 'Accesorios', 7.00, 279.99, 306.99),
(49, 49, 'CC049', '2024-12-08', '18:30:00', 'Pendiente', 'Observación 49', 'Apple iPad Pro 11\"', 'Tablet de 11\" con chip M2 y pantalla Liquid Retina', 'Electrónica', 8.00, 799.99, 871.99),
(50, 50, 'CC050', '2024-12-09', '11:15:00', 'Completado', 'Observación 50', 'Dell UltraSharp U2720Q', 'Monitor 4K de 27\" con color preciso', 'Computación', 10.25, 649.00, 719.99);

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
(1, 1, 1, 'CP001', 'Sony WH-1000XM5', 'Auriculares con cancelación de ruido de alta calidad', 10, 'Disponible', '2024-12-21', 15.00, '123456789012'),
(2, 2, 2, 'CP002', 'Apple iPad Pro 12.9\"', 'Tablet con pantalla Liquid Retina', 5, 'Disponible', '2024-12-22', 10.00, '234567890123'),
(3, 3, 3, 'CP003', 'Nikon D7500', 'Cámara DSLR de 20.9 megapíxeles', 8, 'Disponible', '2024-12-23', 5.00, '345678901234'),
(4, 4, 4, 'CP004', 'Microsoft Xbox Series X', 'Consola de videojuegos 4K', 12, 'Disponible', '2024-12-24', 20.00, '456789012345'),
(5, 5, 5, 'CP005', 'Samsung Galaxy Z Flip 5', 'Smartphone plegable con cámara de 12 MP', 6, 'Disponible', '2024-12-25', 8.00, '567890123456'),
(6, 6, 6, 'CP006', 'Asus ROG Strix G15', 'Laptop gaming con RTX 3060', 4, 'Disponible', '2024-12-26', 12.50, '678901234567'),
(7, 7, 7, 'CP007', 'GoPro HERO11 Black', 'Cámara de acción con 5.3K y estabilización de video', 15, 'Disponible', '2024-12-27', 18.00, '789012345678'),
(8, 8, 8, 'CP008', 'iPad Air 5', 'Tablet con chip M1 y pantalla Liquid Retina', 10, 'Disponible', '2024-12-28', 10.00, '890123456789'),
(9, 9, 9, 'CP009', 'Bose Home Speaker 500', 'Altavoz inteligente con Alexa', 7, 'Disponible', '2024-12-29', 25.00, '901234567890'),
(10, 10, 10, 'CP010', 'Oculus Quest 3', 'Gafas de realidad virtual con mayor resolución', 9, 'Disponible', '2024-12-30', 22.00, '012345678901'),
(11, 11, 11, 'CP011', 'Sony A7 III', 'Cámara sin espejo full-frame', 5, 'Disponible', '2024-12-31', 18.50, '123456789013'),
(12, 12, 12, 'CP012', 'Razer Naga X', 'Ratón ergonómico para juegos MMO', 20, 'Disponible', '2025-01-01', 12.75, '234567890124'),
(13, 13, 13, 'CP013', 'Apple MacBook Air M2', 'Laptop ultradelgada con chip M2', 7, 'Disponible', '2025-01-02', 14.00, '345678901235'),
(14, 14, 14, 'CP014', 'Bose QuietComfort 35 III', 'Auriculares con cancelación activa de ruido', 8, 'Disponible', '2025-01-03', 16.00, '456789012346'),
(15, 15, 15, 'CP015', 'Samsung 27\" Odyssey G7', 'Monitor curvado 1440p con frecuencia de 240Hz', 4, 'Disponible', '2025-01-04', 19.50, '567890123457'),
(16, 16, 16, 'CP016', 'Canon EOS 90D', 'Cámara DSLR de 32.5 megapíxeles', 3, 'Disponible', '2025-01-05', 22.00, '678901234568'),
(17, 17, 17, 'CP017', 'Apple iPhone 15 Pro Max', 'Smartphone con cámara de 48 MP y 5G', 6, 'Disponible', '2025-01-06', 18.00, '789012345679'),
(18, 18, 18, 'CP018', 'JBL Flip 6', 'Altavoz Bluetooth con sonido estéreo', 14, 'Disponible', '2025-01-07', 10.50, '890123456790'),
(19, 19, 19, 'CP019', 'Lenovo Legion 5 Pro', 'Laptop gaming con AMD Ryzen 7', 5, 'Disponible', '2025-01-08', 17.25, '901234567892'),
(20, 20, 20, 'CP020', 'Fujifilm X100V', 'Cámara compacta con lente fijo 23mm', 4, 'Disponible', '2025-01-09', 21.50, '012345678903'),
(21, 21, 21, 'CP021', 'Microsoft Surface Pro 9', 'Tablet convertible 2 en 1 con procesador Intel Core i7', 3, 'Disponible', '2025-01-10', 12.00, '123456789014'),
(22, 22, 22, 'CP022', 'Acer Predator Helios 300', 'Laptop gaming con procesador Intel i7 y RTX 3070', 6, 'Disponible', '2025-01-11', 20.00, '234567890125'),
(23, 23, 23, 'CP023', 'Philips Sonicare HX9903', 'Cepillo de dientes eléctrico con sensor de presión', 18, 'Disponible', '2025-01-12', 15.00, '345678901236'),
(24, 24, 24, 'CP024', 'Samsung Galaxy Watch 6', 'Reloj inteligente con monitoreo de salud', 10, 'Disponible', '2025-01-13', 8.50, '456789012347'),
(25, 25, 25, 'CP025', 'DJI Mavic Air 2', 'Dron con cámara 4K y hasta 34 minutos de vuelo', 7, 'Disponible', '2025-01-14', 18.75, '567890123458'),
(26, 26, 26, 'CP026', 'Sony 65\" 4K UHD TV', 'Televisor con pantalla OLED y HDR', 3, 'Disponible', '2025-01-15', 25.00, '678901234569'),
(27, 27, 27, 'CP027', 'Oculus Rift S', 'Gafas de realidad virtual con seguimiento de 6 grados de libertad', 5, 'Disponible', '2025-01-16', 22.00, '789012345680'),
(28, 28, 28, 'CP028', 'Fitbit Charge 5', 'Reloj inteligente con monitoreo de actividad física', 12, 'Disponible', '2025-01-17', 10.25, '890123456791'),
(29, 29, 29, 'CP029', 'Nikon Z9', 'Cámara sin espejo profesional con 45.7 MP', 4, 'Disponible', '2025-01-18', 21.00, '901234567893'),
(30, 30, 30, 'CP030', 'GoPro HERO10 Black', 'Cámara de acción resistente al agua con 5.3K', 9, 'Disponible', '2025-01-19', 20.50, '012345678904'),
(31, 31, 31, 'CP031', 'MacBook Pro 16\" M2', 'Laptop profesional con chip M2 y pantalla Retina', 2, 'Disponible', '2025-01-20', 15.00, '123456789015'),
(32, 32, 32, 'CP032', 'Samsung QLED 75\" TV', 'Televisor con resolución 4K y tecnología QLED', 6, 'Disponible', '2025-01-21', 22.50, '234567890126'),
(33, 33, 33, 'CP033', 'Bose SoundLink Revolve+', 'Altavoz Bluetooth portátil con sonido 360°', 14, 'Disponible', '2025-01-22', 11.25, '345678901237'),
(34, 34, 34, 'CP034', 'Huawei MateBook X Pro', 'Laptop ultradelgada con pantalla táctil 3K', 4, 'Disponible', '2025-01-23', 19.00, '456789012348'),
(35, 35, 35, 'CP035', 'Apple Watch Series 8', 'Reloj inteligente con monitorización de salud avanzada', 10, 'Disponible', '2025-01-24', 18.00, '567890123459'),
(36, 36, 36, 'CP036', 'Dell XPS 13', 'Laptop ultradelgada con pantalla InfinityEdge', 5, 'Disponible', '2025-01-25', 16.00, '678901234570'),
(37, 37, 37, 'CP037', 'Sony WH-1000XM4', 'Auriculares con cancelación de ruido y sonido envolvente', 9, 'Disponible', '2025-01-26', 17.00, '789012345681'),
(38, 38, 38, 'CP038', 'Razer Blade 15', 'Laptop gaming con pantalla 4K y RTX 3080', 3, 'Disponible', '2025-01-27', 23.50, '890123456792'),
(39, 39, 39, 'CP039', 'Apple AirPods Pro 2', 'Auriculares inalámbricos con cancelación activa de ruido', 7, 'Disponible', '2025-01-28', 14.25, '901234567894'),
(40, 40, 40, 'CP040', 'Bose QuietComfort 45', 'Auriculares con cancelación activa de ruido y conectividad Bluetooth', 5, 'Disponible', '2025-01-29', 16.00, '012345678905'),
(41, 41, 41, 'CP041', 'Microsoft Surface Laptop 4', 'Laptop ultradelgada con pantalla táctil PixelSense', 6, 'Disponible', '2025-01-30', 19.00, '123456789016'),
(42, 42, 42, 'CP042', 'Nintendo Switch OLED', 'Consola híbrida con pantalla OLED', 8, 'Disponible', '2025-01-31', 14.75, '234567890127'),
(43, 43, 43, 'CP043', 'LG UltraGear 27GL850', 'Monitor gaming con resolución 2K y frecuencia de 144Hz', 5, 'Disponible', '2025-02-01', 21.00, '345678901238'),
(44, 44, 44, 'CP044', 'Anker PowerCore 10000', 'Batería externa compacta con carga rápida', 11, 'Disponible', '2025-02-02', 9.00, '456789012349'),
(45, 45, 45, 'CP045', 'JBL PartyBox 310', 'Altavoz Bluetooth portátil con luces y sonido potente', 4, 'Disponible', '2025-02-03', 27.50, '567890123460'),
(46, 46, 46, 'CP046', 'Apple Mac mini M2', 'Mini ordenador con chip M2 para profesionales', 2, 'Disponible', '2025-02-04', 22.00, '678901234571'),
(47, 47, 47, 'CP047', 'DJI Pocket 2', 'Cámara de mano con gimbal estabilizador', 7, 'Disponible', '2025-02-05', 20.00, '789012345682'),
(48, 48, 48, 'CP048', 'Samsung Galaxy Buds Pro', 'Auriculares inalámbricos con cancelación activa de ruido', 10, 'Disponible', '2025-02-06', 15.50, '890123456793'),
(49, 49, 49, 'CP049', 'Microsoft Surface Book 3', 'Laptop convertible 2 en 1 con pantalla 13.5\"', 3, 'Disponible', '2025-02-07', 18.25, '901234567895'),
(50, 50, 50, 'CP050', 'Logitech MX Master 3', 'Ratón ergonómico avanzado con conectividad Bluetooth', 14, 'Disponible', '2025-02-08', 16.50, '012345678906');

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
(1, '1234567890', 'Juan', 'Pérez', 'Calle Falsa 123, Bogotá', '3001234567', 'juanperez@email.com', '1990-01-15', 'M', 'En camino'),
(2, '9876543210', 'María', 'Gómez', 'Avenida Libertador 456, Medellín', '3002345678', 'mariagomez@email.com', '1985-03-22', 'F', 'Embarque'),
(3, '5647382910', 'Carlos', 'Ramírez', 'Calle 50, Cali', '3003456789', 'carlosramirez@email.com', '1980-07-12', 'M', 'Entregado'),
(4, '4561237890', 'Laura', 'Hernández', 'Calle 21, Cartagena', '3004567890', 'laurahernandez@email.com', '1992-08-30', 'F', 'En proceso'),
(5, '7684352091', 'David', 'Martínez', 'Calle 10, Barranquilla', '3005678901', 'davidmartinez@email.com', '1995-11-05', 'M', 'Cancelado'),
(6, '6543129870', 'Ana', 'López', 'Avenida 7, Bucaramanga', '3006789012', 'analópez@email.com', '1987-02-19', 'F', 'En camino'),
(7, '9023847561', 'José', 'Fernández', 'Carrera 8, Bogotá', '3007890123', 'josefernandez@email.com', '1994-06-10', 'M', 'Embarque'),
(8, '1230987456', 'Sofía', 'García', 'Calle 33, Medellín', '3008901234', 'sofiagarcia@email.com', '2000-12-25', 'F', 'Entregado'),
(9, '3217654890', 'Miguel', 'Vásquez', 'Carrera 9, Cali', '3009012345', 'miguelvasquez@email.com', '1992-04-10', 'M', 'En proceso'),
(10, '5648791023', 'Verónica', 'Díaz', 'Calle 42, Barranquilla', '3000123456', 'veronicadiaz@email.com', '1984-10-05', 'F', 'Cancelado'),
(11, '3458761920', 'Raúl', 'Torres', 'Avenida 5, Bucaramanga', '3001234567', 'raultorres@email.com', '1996-05-30', 'M', 'En camino'),
(12, '9087562310', 'Claudia', 'Sánchez', 'Calle 17, Bogotá', '3002345678', 'claudiasanchez@email.com', '1989-11-10', 'F', 'Embarque'),
(13, '6548129073', 'Javier', 'Ramírez', 'Carrera 5, Medellín', '3003456789', 'javierramirez@email.com', '1991-09-22', 'M', 'Entregado'),
(14, '1092837465', 'Patricia', 'Cruz', 'Calle 29, Cali', '3004567890', 'patriciacruz@email.com', '1993-01-14', 'F', 'En proceso'),
(15, '9837264510', 'Francisco', 'Reyes', 'Avenida 3, Barranquilla', '3005678901', 'franciscoreyes@email.com', '1982-06-05', 'M', 'Cancelado'),
(16, '1234897650', 'Marta', 'Morales', 'Calle 35, Bucaramanga', '3006789012', 'martamorales@email.com', '1986-12-18', 'F', 'En camino'),
(17, '5678123094', 'Felipe', 'Jiménez', 'Calle 24, Medellín', '3007890123', 'felipejimenez@email.com', '1997-08-22', 'M', 'Embarque'),
(18, '8907465123', 'Isabel', 'Paredes', 'Carrera 6, Cali', '3008901234', 'isabelparedes@email.com', '1990-04-11', 'F', 'Entregado'),
(19, '4562390187', 'Andrés', 'Rojas', 'Avenida 2, Barranquilla', '3009012345', 'andresrojas@email.com', '1988-07-03', 'M', 'En proceso'),
(20, '3216549870', 'Lucía', 'Ramírez', 'Calle 17, Bucaramanga', '3000123456', 'luciaramirez@email.com', '1993-11-25', 'F', 'Cancelado'),
(21, '2345678901', 'Carlos', 'Serrano', 'Calle 10, Bogotá', '3001234567', 'carlosserrano@email.com', '1985-10-14', 'M', 'En camino'),
(22, '3456789012', 'Patricia', 'Martínez', 'Avenida 6, Medellín', '3002345678', 'patriciamartinez@email.com', '1983-02-20', 'F', 'Embarque'),
(23, '4567890123', 'Antonio', 'López', 'Carrera 3, Cali', '3003456789', 'antoniolópez@email.com', '1991-12-11', 'M', 'Entregado'),
(24, '5678901234', 'Elena', 'Pérez', 'Calle 15, Barranquilla', '3004567890', 'elenaperez@email.com', '1988-06-03', 'F', 'En proceso'),
(25, '6789012345', 'Mario', 'Vargas', 'Avenida 9, Bucaramanga', '3005678901', 'mariovargas@email.com', '1994-09-12', 'M', 'Cancelado'),
(26, '7890123456', 'Teresa', 'Gómez', 'Calle 12, Medellín', '3006789012', 'teresagomez@email.com', '1980-07-01', 'F', 'En camino'),
(27, '8901234567', 'Víctor', 'Figueroa', 'Carrera 2, Cali', '3007890123', 'victorfigueroa@email.com', '1992-04-17', 'M', 'Embarque'),
(28, '9012345678', 'Mónica', 'Ramírez', 'Calle 19, Barranquilla', '3008901234', 'monicaramirez@email.com', '1987-08-28', 'F', 'Entregado'),
(29, '1234567891', 'Ricardo', 'Alvarado', 'Avenida 5, Bucaramanga', '3009012345', 'ricardoalvarado@email.com', '1990-12-05', 'M', 'En proceso'),
(30, '2345678902', 'Carmen', 'Díaz', 'Calle 8, Bogotá', '3000123456', 'carmendiaz@email.com', '1993-01-28', 'F', 'Cancelado'),
(31, '3456789013', 'José', 'Sánchez', 'Avenida 10, Medellín', '3001234567', 'josesanchez@email.com', '1989-04-22', 'M', 'En camino'),
(32, '4567890124', 'Ana', 'Rodríguez', 'Carrera 7, Cali', '3002345678', 'anarodriguez@email.com', '1995-03-18', 'F', 'Embarque'),
(33, '5678901235', 'Luis', 'González', 'Calle 3, Barranquilla', '3003456789', 'luisgonzalez@email.com', '1987-06-09', 'M', 'Entregado'),
(34, '6789012346', 'Raquel', 'Martínez', 'Avenida 8, Bucaramanga', '3004567890', 'raquelmartinez@email.com', '1994-12-14', 'F', 'En proceso'),
(35, '7890123457', 'Sergio', 'Ramírez', 'Calle 6, Medellín', '3005678901', 'sergioramirez@email.com', '1990-02-23', 'M', 'Cancelado'),
(36, '8901234568', 'Diana', 'Hernández', 'Carrera 4, Cali', '3006789012', 'dianahernandez@email.com', '1986-11-17', 'F', 'En camino'),
(37, '9012345679', 'Andrés', 'Gómez', 'Calle 20, Barranquilla', '3007890123', 'andresgomez@email.com', '1983-05-02', 'M', 'Embarque'),
(38, '1234567892', 'Isabel', 'Torres', 'Avenida 4, Bucaramanga', '3008901234', 'isabeltorres@email.com', '1984-09-08', 'F', 'Entregado'),
(39, '2345678903', 'Juan', 'Vásquez', 'Calle 25, Bogotá', '3009012345', 'juanvasquez@email.com', '1988-06-30', 'M', 'En proceso'),
(40, '3456789014', 'Lucía', 'García', 'Carrera 9, Medellín', '3000123456', 'luciagarcia@email.com', '1991-03-12', 'F', 'Cancelado'),
(41, '4567890126', 'Miguel', 'Ruiz', 'Calle 13, Cali', '3001234567', 'miguelruiz@email.com', '1992-10-16', 'M', 'En camino'),
(42, '5678901237', 'Cecilia', 'Jiménez', 'Avenida 11, Barranquilla', '3002345678', 'ceciliajimenez@email.com', '1985-07-11', 'F', 'Embarque'),
(43, '6789012348', 'José', 'Gómez', 'Carrera 6, Bucaramanga', '3003456789', 'josegomez@email.com', '1990-11-30', 'M', 'Entregado'),
(44, '7890123459', 'Patricia', 'Morales', 'Calle 9, Medellín', '3004567890', 'patriciamorales@email.com', '1994-04-14', 'F', 'En proceso'),
(45, '8901234570', 'Carlos', 'González', 'Calle 11, Cali', '3005678901', 'carlosgonzalez@email.com', '1992-03-06', 'M', 'Cancelado'),
(46, '9012345680', 'María', 'Ruíz', 'Avenida 6, Barranquilla', '3006789012', 'mariaruiz@email.com', '1987-12-21', 'F', 'En camino'),
(47, '1234567901', 'Eduardo', 'Torres', 'Calle 22, Bucaramanga', '3007890123', 'eduardotorres@email.com', '1991-02-17', 'M', 'Embarque'),
(48, '2345678904', 'Carolina', 'Díaz', 'Carrera 8, Medellín', '3008901234', 'carolinadiaz@email.com', '1995-08-25', 'F', 'Entregado'),
(49, '3456789015', 'Javier', 'Fernández', 'Calle 30, Cali', '3009012345', 'javierfernandez@email.com', '1993-01-02', 'M', 'En proceso'),
(50, '4567890127', 'Beatriz', 'Serrano', 'Avenida 5, Barranquilla', '3000123456', 'beatrizserrano@email.com', '1986-05-18', 'F', 'Cancelado');

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
(1, 1, 1, 'Pendiente', 2, 'Auriculares Sony WH-1000XM5', 400.00, 40.00, 440.00, '2024-12-01', '2024-11-30'),
(2, 2, 2, 'Confirmado', 1, 'Tablet Apple iPad Pro 12.9\"', 1000.00, 100.00, 1100.00, '2024-12-02', '2024-12-01'),
(3, 3, 3, 'Pendiente', 3, 'Cámara Nikon D7500', 1200.00, 120.00, 1320.00, '2024-12-03', '2024-12-02'),
(4, 4, 4, 'Confirmado', 1, 'Consola Xbox Series X', 500.00, 50.00, 550.00, '2024-12-04', '2024-12-03'),
(5, 5, 5, 'Pendiente', 2, 'Smartphone Samsung Galaxy Z Flip 5', 1800.00, 180.00, 1980.00, '2024-12-05', '2024-12-04'),
(6, 6, 6, 'Confirmado', 1, 'Laptop Asus ROG Strix G15', 2000.00, 200.00, 2200.00, '2024-12-06', '2024-12-05'),
(7, 7, 7, 'Pendiente', 4, 'Cámara GoPro HERO11 Black', 400.00, 40.00, 440.00, '2024-12-07', '2024-12-06'),
(8, 8, 8, 'Confirmado', 3, 'Tablet iPad Air 5', 600.00, 60.00, 660.00, '2024-12-08', '2024-12-07'),
(9, 9, 9, 'Pendiente', 2, 'Altavoz Bose Home Speaker 500', 300.00, 30.00, 330.00, '2024-12-09', '2024-12-08'),
(10, 10, 10, 'Confirmado', 5, 'Gafas Oculus Quest 3', 1000.00, 100.00, 1100.00, '2024-12-10', '2024-12-09'),
(11, 11, 11, 'Pendiente', 1, 'Cámara Sony A7 III', 1500.00, 150.00, 1650.00, '2024-12-11', '2024-12-10'),
(12, 12, 12, 'Confirmado', 2, 'Ratón Razer Naga X', 60.00, 6.00, 66.00, '2024-12-12', '2024-12-11'),
(13, 13, 13, 'Pendiente', 3, 'Laptop Apple MacBook Air M2', 1300.00, 130.00, 1430.00, '2024-12-13', '2024-12-12'),
(14, 14, 14, 'Confirmado', 4, 'Auriculares Bose QuietComfort 35 III', 350.00, 35.00, 385.00, '2024-12-14', '2024-12-13'),
(15, 15, 15, 'Pendiente', 2, 'Monitor Samsung 27\" Odyssey G7', 800.00, 80.00, 880.00, '2024-12-15', '2024-12-14'),
(16, 16, 16, 'Confirmado', 3, 'Cámara Canon EOS 90D', 1200.00, 120.00, 1320.00, '2024-12-16', '2024-12-15'),
(17, 17, 17, 'Pendiente', 1, 'Smartphone Apple iPhone 15 Pro Max', 1100.00, 110.00, 1210.00, '2024-12-17', '2024-12-16'),
(18, 18, 18, 'Confirmado', 4, 'Altavoz JBL Flip 6', 100.00, 10.00, 110.00, '2024-12-18', '2024-12-17'),
(19, 19, 19, 'Pendiente', 2, 'Laptop Lenovo Legion 5 Pro', 1500.00, 150.00, 1650.00, '2024-12-19', '2024-12-18'),
(20, 20, 20, 'Confirmado', 1, 'Cámara Fujifilm X100V', 1300.00, 130.00, 1430.00, '2024-12-20', '2024-12-19'),
(21, 21, 21, 'Pendiente', 2, 'Cámara Olympus OM-D E-M10 Mark IV', 600.00, 60.00, 660.00, '2024-12-21', '2024-12-20'),
(22, 22, 22, 'Confirmado', 1, 'Auriculares Bose QuietComfort 45', 350.00, 35.00, 385.00, '2024-12-22', '2024-12-21'),
(23, 23, 23, 'Pendiente', 3, 'Consola Sony PlayStation 5', 500.00, 50.00, 550.00, '2024-12-23', '2024-12-22'),
(24, 24, 24, 'Confirmado', 2, 'Smartwatch Garmin Fenix 7', 600.00, 60.00, 660.00, '2024-12-24', '2024-12-23'),
(25, 25, 25, 'Pendiente', 4, 'Teclado mecánico Corsair K95 RGB', 200.00, 20.00, 220.00, '2024-12-25', '2024-12-24'),
(26, 26, 26, 'Confirmado', 1, 'Altavoz Sonos One', 200.00, 20.00, 220.00, '2024-12-26', '2024-12-25'),
(27, 27, 27, 'Pendiente', 2, 'Monitor Dell 24\" P2422H', 250.00, 25.00, 275.00, '2024-12-27', '2024-12-26'),
(28, 28, 28, 'Confirmado', 3, 'Cámara Sony Alpha 7C', 2000.00, 200.00, 2200.00, '2024-12-28', '2024-12-27'),
(29, 29, 29, 'Pendiente', 1, 'Cámara de seguridad Nest Cam', 120.00, 12.00, 132.00, '2024-12-29', '2024-12-28'),
(30, 30, 30, 'Confirmado', 2, 'Smartphone Xiaomi Mi 11', 650.00, 65.00, 715.00, '2024-12-30', '2024-12-29'),
(31, 31, 31, 'Pendiente', 3, 'Cámara Sony RX100 VII', 1200.00, 120.00, 1320.00, '2024-12-31', '2024-12-30'),
(32, 32, 32, 'Confirmado', 1, 'Auriculares Sony WH-1000XM4', 350.00, 35.00, 385.00, '2024-12-01', '2024-11-30'),
(33, 33, 33, 'Pendiente', 2, 'Smartwatch Apple Watch Ultra', 800.00, 80.00, 880.00, '2024-12-02', '2024-12-01'),
(34, 34, 34, 'Confirmado', 3, 'Consola Nintendo Switch OLED', 350.00, 35.00, 385.00, '2024-12-03', '2024-12-02'),
(35, 35, 35, 'Pendiente', 4, 'Laptop Dell XPS 13', 1200.00, 120.00, 1320.00, '2024-12-04', '2024-12-03'),
(36, 36, 36, 'Confirmado', 1, 'Altavoz Google Nest Audio', 100.00, 10.00, 110.00, '2024-12-05', '2024-12-04'),
(37, 37, 37, 'Pendiente', 2, 'Smartphone OnePlus 9 Pro', 950.00, 95.00, 1045.00, '2024-12-06', '2024-12-05'),
(38, 38, 38, 'Confirmado', 3, 'Cámara GoPro HERO9 Black', 450.00, 45.00, 495.00, '2024-12-07', '2024-12-06'),
(39, 39, 39, 'Pendiente', 4, 'Teclado Logitech G Pro X', 150.00, 15.00, 165.00, '2024-12-08', '2024-12-07'),
(40, 40, 40, 'Confirmado', 1, 'Auriculares Sennheiser Momentum 3', 400.00, 40.00, 440.00, '2024-12-09', '2024-12-08'),
(41, 41, 41, 'Pendiente', 2, 'Tablet Samsung Galaxy Tab S7', 600.00, 60.00, 660.00, '2024-12-10', '2024-12-09'),
(42, 42, 42, 'Confirmado', 3, 'Cámara Panasonic Lumix GH5', 1500.00, 150.00, 1650.00, '2024-12-11', '2024-12-10'),
(43, 43, 43, 'Pendiente', 4, 'Ratón Logitech MX Master 3', 100.00, 10.00, 110.00, '2024-12-12', '2024-12-11'),
(44, 44, 44, 'Confirmado', 1, 'Consola PlayStation 5 Digital Edition', 400.00, 40.00, 440.00, '2024-12-13', '2024-12-12'),
(45, 45, 45, 'Pendiente', 2, 'Smartphone Huawei P40 Pro', 900.00, 90.00, 990.00, '2024-12-14', '2024-12-13'),
(46, 46, 46, 'Confirmado', 3, 'Laptop Microsoft Surface Laptop 4', 1200.00, 120.00, 1320.00, '2024-12-15', '2024-12-14'),
(47, 47, 47, 'Pendiente', 4, 'Cámara Nikon Z6 II', 1500.00, 150.00, 1650.00, '2024-12-16', '2024-12-15'),
(48, 48, 48, 'Confirmado', 1, 'Auriculares Beats Studio Buds', 200.00, 20.00, 220.00, '2024-12-17', '2024-12-16'),
(49, 49, 49, 'Pendiente', 2, 'Smartphone Motorola Edge 30', 700.00, 70.00, 770.00, '2024-12-18', '2024-12-17'),
(50, 50, 50, 'Confirmado', 3, 'Cámara Leica Q2', 4500.00, 450.00, 4950.00, '2024-12-19', '2024-12-18');

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
(1, 'P1001', 'Samsung Galaxy S24', 'Tecnología', 'Celulares', 'Smartphone con pantalla AMOLED de 6.2 pulgadas, cámara de 50 MP, procesador Exynos 2200', 999.99, 50, 'Nuevo, color blanco', 'Pantalla AMOLED, 5G, cámara triple', '2 años', 'Disponible'),
(2, 'P1002', 'LG OLED 55\" TV', 'Electrodomésticos', 'Televisores', 'Televisor OLED de 55 pulgadas con resolución 4K, tecnología HDR', 1599.99, 20, 'Nuevo, color negro', 'Pantalla OLED, 4K, HDR', '2 años', 'Disponible'),
(3, 'P1003', 'Apple AirPods Pro 2', 'Tecnología', 'Audífonos', 'Auriculares inalámbricos con cancelación de ruido activa, duración de batería de 6 horas', 249.99, 100, 'Nuevo, color blanco', 'Cancelación de ruido, sonido envolvente', '1 año', 'Disponible'),
(4, 'P1004', 'Sony WH-1000XM5', 'Tecnología', 'Audífonos', 'Auriculares inalámbricos con cancelación de ruido de alta calidad, hasta 30 horas de batería', 399.99, 50, 'Nuevo, color negro', 'Cancelación de ruido, 30 horas de batería', '1 año', 'Disponible'),
(5, 'P1005', 'NVIDIA GeForce RTX 4090', 'Tecnología', 'Componentes', 'Tarjeta gráfica de alto rendimiento, ideal para gaming 4K, 24 GB de memoria GDDR6X', 1599.99, 10, 'Nuevo', '8K, 24 GB de VRAM', '2 años', 'Disponible'),
(6, 'P1006', 'Acer Nitro 5', 'Tecnología', 'Laptops', 'Laptop gaming con pantalla de 15.6 pulgadas, procesador Intel Core i7, tarjeta gráfica NVIDIA GTX 1660 Ti', 1199.99, 30, 'Nuevo', 'Pantalla FHD, 16GB RAM, 512GB SSD', '2 años', 'Disponible'),
(7, 'P1007', 'Apple iPad Pro 12.9\"', 'Tecnología', 'Tablets', 'Tablet de 12.9 pulgadas con chip M1, 128GB de almacenamiento, compatible con Apple Pencil', 1099.99, 60, 'Nuevo, color gris', 'Pantalla Liquid Retina, chip M1', '1 año', 'Disponible'),
(8, 'P1008', 'Bose QuietComfort 45', 'Tecnología', 'Audífonos', 'Auriculares inalámbricos con cancelación de ruido, hasta 24 horas de batería', 329.99, 40, 'Nuevo, color negro', 'Cancelación de ruido, 24 horas de batería', '1 año', 'Disponible'),
(9, 'P1009', 'Microsoft Xbox Series X', 'Tecnología', 'Consolas', 'Consola de videojuegos Xbox Series X, resolución 4K a 120 fps', 499.99, 15, 'Nuevo', '8K, 1TB SSD', '2 años', 'Disponible'),
(10, 'P1010', 'Samsung Galaxy Buds Pro', 'Tecnología', 'Audífonos', 'Auriculares inalámbricos con sonido premium y cancelación activa de ruido', 199.99, 80, 'Nuevo, color negro', 'Sonido de alta calidad, cancelación de ruido', '1 año', 'Disponible'),
(11, 'P1011', 'Canon EOS 90D', 'Tecnología', 'Cámaras', 'Cámara DSLR de 32.5 MP, video 4K, pantalla táctil articulada', 1299.99, 25, 'Nuevo, color negro', '32.5 MP, grabación 4K, pantalla articulada', '2 años', 'Disponible'),
(12, 'P1012', 'HP Envy 13', 'Tecnología', 'Laptops', 'Laptop ultradelgada con procesador Intel Core i7, 16GB de RAM, pantalla 13.3\" FHD', 999.99, 40, 'Nuevo, color plata', 'Pantalla FHD, 16GB RAM, 512GB SSD', '2 años', 'Disponible'),
(13, 'P1013', 'Google Pixel 8', 'Tecnología', 'Celulares', 'Smartphone con cámara de 50 MP, pantalla OLED de 6.3 pulgadas', 799.99, 70, 'Nuevo, color blanco', 'Pantalla OLED, 5G, cámara dual', '2 años', 'Disponible'),
(14, 'P1014', 'Samsung Galaxy Tab S8', 'Tecnología', 'Tablets', 'Tablet de 11 pulgadas, procesador Snapdragon 8 Gen 1, 128GB de almacenamiento', 649.99, 50, 'Nuevo, color gris', 'Pantalla LTPS, 8GB RAM', '1 año', 'Disponible'),
(15, 'P1015', 'Sony PlayStation 5', 'Tecnología', 'Consolas', 'Consola de videojuegos PlayStation 5, resolución 4K, incluye mando DualSense', 499.99, 30, 'Nuevo, color blanco', '4K, SSD de 825 GB, mando DualSense', '2 años', 'Disponible'),
(16, 'P1016', 'Apple MacBook Pro 16\"', 'Tecnología', 'Laptops', 'Laptop profesional con chip M1 Pro, pantalla Retina 16 pulgadas, 512GB SSD', 2499.99, 15, 'Nuevo, color gris espacial', 'Pantalla Retina, chip M1 Pro, 16GB RAM', '2 años', 'Disponible'),
(17, 'P1017', 'Fitbit Charge 5', 'Tecnología', 'Accesorios', 'Banda inteligente con monitoreo de ritmo cardíaco, GPS integrado, pantalla AMOLED', 179.99, 100, 'Nuevo, color negro', 'Monitoreo de salud, GPS', '1 año', 'Disponible'),
(18, 'P1018', 'Samsung QLED 65\"', 'Electrodomésticos', 'Televisores', 'Televisor QLED de 65 pulgadas, resolución 4K, tecnología HDR10+', 1799.99, 15, 'Nuevo, color negro', '4K, HDR10+', '2 años', 'Disponible'),
(19, 'P1019', 'Dyson V11', 'Electrodomésticos', 'Aspiradoras', 'Aspiradora inalámbrica con tecnología de succión potente, hasta 60 minutos de autonomía', 599.99, 30, 'Nuevo, color azul', 'Tecnología de succión, 60 minutos de autonomía', '2 años', 'Disponible'),
(20, 'P1020', 'GoPro Hero 11', 'Tecnología', 'Cámaras', 'Cámara de acción GoPro Hero 11 con grabación 5.3K, resistente al agua hasta 10 metros', 399.99, 45, 'Nuevo, color negro', '5.3K, resistente al agua, estabilización de imagen', '2 años', 'Disponible'),
(21, 'P1021', 'Nikon Z9', 'Tecnología', 'Cámaras', 'Cámara sin espejo de 45.7 MP, grabación 8K, pantalla LCD de 3.2 pulgadas', 5499.99, 10, 'Nuevo, color negro', '45.7 MP, grabación 8K, pantalla LCD', '2 años', 'Disponible'),
(22, 'P1022', 'Razer Blade 15', 'Tecnología', 'Laptops', 'Laptop gaming con procesador Intel i7, pantalla 15.6\" 144Hz, GPU NVIDIA RTX 3070', 1999.99, 20, 'Nuevo, color negro', 'Pantalla 144Hz, RTX 3070', '2 años', 'Disponible'),
(23, 'P1023', 'Oculus Quest 2', 'Tecnología', 'Realidad Virtual', 'Auriculares VR autónomos, pantalla 1832x1920, compatible con PC', 299.99, 60, 'Nuevo, color blanco', 'Pantalla 1832x1920, compatibilidad con PC', '1 año', 'Disponible'),
(24, 'P1024', 'Bose QuietComfort 45', 'Tecnología', 'Audífonos', 'Audífonos inalámbricos con cancelación activa de ruido, hasta 24 horas de autonomía', 329.99, 80, 'Nuevo, color negro', 'Cancelación de ruido, hasta 24 horas', '1 año', 'Disponible'),
(25, 'P1025', 'Xiaomi Mi Band 6', 'Tecnología', 'Accesorios', 'Banda inteligente con monitoreo de sueño, pantalla AMOLED, resistencia al agua', 44.99, 200, 'Nuevo, color negro', 'Monitoreo de sueño, pantalla AMOLED', '1 año', 'Disponible'),
(26, 'P1026', 'iPad Pro 11\"', 'Tecnología', 'Tablets', 'Tablet con chip M1, pantalla Liquid Retina, 128GB de almacenamiento', 799.99, 35, 'Nuevo, color plata', 'Chip M1, pantalla Liquid Retina', '1 año', 'Disponible'),
(27, 'P1027', 'LG OLED 55\"', 'Electrodomésticos', 'Televisores', 'Televisor OLED de 55 pulgadas, resolución 4K, sonido Dolby Atmos', 1399.99, 25, 'Nuevo, color negro', '4K, Dolby Atmos', '2 años', 'Disponible'),
(28, 'P1028', 'Lenovo ThinkPad X1 Carbon', 'Tecnología', 'Laptops', 'Laptop ultradelgada, procesador Intel Core i5, 16GB de RAM, 512GB SSD', 1499.99, 30, 'Nuevo, color negro', 'Pantalla 14\", 16GB RAM', '2 años', 'Disponible'),
(29, 'P1029', 'Dell XPS 13', 'Tecnología', 'Laptops', 'Laptop con procesador Intel Core i7, pantalla FHD, 16GB RAM', 1299.99, 40, 'Nuevo, color plata', 'Pantalla FHD, 16GB RAM, SSD 512GB', '2 años', 'Disponible'),
(30, 'P1030', 'Sennheiser Momentum 3', 'Tecnología', 'Audífonos', 'Audífonos inalámbricos con cancelación activa de ruido, sonido de alta fidelidad', 399.99, 50, 'Nuevo, color negro', 'Cancelación activa de ruido, sonido Hi-Fi', '2 años', 'Disponible'),
(31, 'P1031', 'Apple Watch Series 8', 'Tecnología', 'Relojes', 'Reloj inteligente con monitoreo de salud, GPS, pantalla Retina', 399.99, 60, 'Nuevo, color plata', 'Pantalla Retina, monitoreo de salud', '1 año', 'Disponible'),
(32, 'P1032', 'Samsung Galaxy Watch 5', 'Tecnología', 'Relojes', 'Reloj inteligente con monitoreo de sueño, pantalla Super AMOLED', 279.99, 100, 'Nuevo, color negro', 'Pantalla Super AMOLED, monitoreo de sueño', '1 año', 'Disponible'),
(33, 'P1033', 'GoPro Hero 10', 'Tecnología', 'Cámaras', 'Cámara de acción GoPro Hero 10, grabación 5.3K, resistente al agua', 399.99, 40, 'Nuevo, color negro', '5.3K, resistente al agua, estabilización de imagen', '2 años', 'Disponible'),
(34, 'P1034', 'Asus ROG Strix Scar 17', 'Tecnología', 'Laptops', 'Laptop gaming con procesador Intel i9, 32GB RAM, 1TB SSD, pantalla 17.3\" 360Hz', 2499.99, 20, 'Nuevo, color negro', 'Pantalla 360Hz, 32GB RAM, RTX 3080', '2 años', 'Disponible'),
(35, 'P1035', 'Sony WH-1000XM5', 'Tecnología', 'Audífonos', 'Audífonos inalámbricos con cancelación activa de ruido, hasta 30 horas de autonomía', 349.99, 70, 'Nuevo, color negro', 'Cancelación de ruido, hasta 30 horas', '2 años', 'Disponible'),
(36, 'P1036', 'Samsung Galaxy S22', 'Tecnología', 'Celulares', 'Smartphone con cámara de 50 MP, pantalla AMOLED de 6.1 pulgadas, 5G', 799.99, 50, 'Nuevo, color blanco', 'Pantalla AMOLED, cámara de 50 MP', '1 año', 'Disponible'),
(37, 'P1037', 'MacBook Air M2', 'Tecnología', 'Laptops', 'Laptop ultradelgada con chip M2, 256GB SSD, pantalla Retina 13.3\"', 1199.99, 30, 'Nuevo, color plata', 'Chip M2, pantalla Retina', '1 año', 'Disponible'),
(38, 'P1038', 'DJI Air 2S', 'Tecnología', 'Drones', 'Drone con cámara de 5.4K, hasta 31 minutos de vuelo, control remoto incluido', 999.99, 25, 'Nuevo, color negro', 'Cámara 5.4K, 31 minutos de vuelo', '1 año', 'Disponible'),
(39, 'P1039', 'Sonos One', 'Electrodomésticos', 'Altavoces', 'Altavoz inteligente con Alexa, sonido estéreo, compatible con AirPlay 2', 199.99, 100, 'Nuevo, color blanco', 'Sonido estéreo, compatible con AirPlay 2', '2 años', 'Disponible'),
(40, 'P1040', 'JBL Charge 5', 'Electrodomésticos', 'Altavoces', 'Altavoz portátil Bluetooth resistente al agua, 20 horas de reproducción', 179.99, 150, 'Nuevo, color azul', 'Resistente al agua, 20 horas de autonomía', '2 años', 'Disponible'),
(41, 'P1041', 'Nest Thermostat', 'Electrodomésticos', 'Climatización', 'Termostato inteligente con control por app, programación de temperatura, energía eficiente', 129.99, 80, 'Nuevo, color blanco', 'Control por app, programación de temperatura', '2 años', 'Disponible'),
(42, 'P1042', 'Ring Video Doorbell', 'Electrodomésticos', 'Seguridad', 'Videoportero con cámara HD, audio bidireccional, visión nocturna', 99.99, 100, 'Nuevo, color plata', 'Cámara HD, audio bidireccional', '2 años', 'Disponible'),
(43, 'P1043', 'Lego Star Wars X-Wing', 'Juguetes', 'Modelos de construcción', 'Set de 1,023 piezas, incluye minifiguras, modelo de X-Wing', 119.99, 150, 'Nuevo, color multicolor', '1,023 piezas, minifiguras', '1 año', 'Disponible'),
(44, 'P1044', 'Nintendo Switch OLED', 'Tecnología', 'Consolas', 'Consola Nintendo Switch con pantalla OLED, dock incluido', 349.99, 40, 'Nuevo, color negro', 'Pantalla OLED, dock incluido', '1 año', 'Disponible'),
(45, 'P1045', 'Zara 7584', 'Ropa', 'Hombres', 'Camisa de manga larga, 100% algodón, ajuste regular', 29.99, 120, 'Nuevo, color azul', 'Algodón, ajuste regular', '6 meses', 'Disponible'),
(46, 'P1046', 'Adidas Ultraboost 22', 'Calzado', 'Deportivo', 'Zapatillas deportivas para correr, suela Boost, diseño ergonómico', 179.99, 200, 'Nuevo, color negro', 'Suela Boost, diseño ergonómico', '1 año', 'Disponible'),
(47, 'P1047', 'Puma Sport Pro', 'Calzado', 'Deportivo', 'Zapatillas deportivas para entrenamiento, material transpirable', 99.99, 150, 'Nuevo, color gris', 'Material transpirable, soporte', '1 año', 'Disponible'),
(48, 'P1048', 'Sony A7R IV', 'Tecnología', 'Cámaras', 'Cámara sin espejo de 61 MP, video 4K, 10 fotogramas por segundo', 3299.99, 10, 'Nuevo, color negro', '61 MP, grabación 4K', '2 años', 'Disponible'),
(49, 'P1049', 'Philips Hue White', 'Electrodomésticos', 'Iluminación', 'Bombilla inteligente LED, compatible con Alexa y Google Assistant', 49.99, 200, 'Nuevo, color blanco', 'Compatible con Alexa, Google Assistant', '1 año', 'Disponible'),
(50, 'P1050', 'Samsung 970 EVO Plus', 'Tecnología', 'Accesorios', 'Disco duro SSD NVMe de 500GB, velocidad de lectura hasta 3,500MB/s', 69.99, 150, 'Nuevo, color negro', 'SSD NVMe, velocidad 3,500MB/s', '1 año', 'Disponible');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `catalogopreferencias`
--
ALTER TABLE `catalogopreferencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `detalleproducto`
--
ALTER TABLE `detalleproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
