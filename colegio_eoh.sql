-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2019 at 12:59 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `colegio_eoh`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_acudiente` (IN `_nombre_acudiente` VARCHAR(20), IN `_identificacion_acudiente` INT(11), IN `_telefono_acudiente` BIGINT(11), IN `_id_acudiente` SMALLINT(5))  BEGIN
UPDATE acudiente SET nombre_acudiente=_nombre_acudiente, telefono_acudiente=_telefono_acudiente, identificacion_acudiente=_identificacion_acudiente WHERE id_acudiente = _id_acudiente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_clave` (IN `_usuario` VARCHAR(20), IN `_clave` VARCHAR(20), IN `_new_clave` VARCHAR(20))  BEGIN

UPDATE usuario SET CLAVE = _new_clave WHERE USUARIO = _usuario AND CLAVE = _clave;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_estudiante` (IN `_nombre_estudiante` VARCHAR(20), IN `_apellido_estudiante` VARCHAR(20), IN `_identificacion_estudiante` INT(11), IN `_telefono_estudiante` BIGINT(11), IN `_grado` SMALLINT(5), IN `_estado_estudiante` TINYINT(1), IN `_id_estudiante` SMALLINT(5))  BEGIN
UPDATE estudiante SET nombre_estudiante = _nombre_estudiante, apellido_estudiante = _apellido_estudiante, identificacion_estudiante = _identificacion_estudiante,  telefono_estudiante = _telefono_estudiante, grado = _grado, estado_estudiante = _estado_estudiante WHERE id_estudiante= _id_estudiante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_nota` (IN `_nombre_nota` VARCHAR(30), IN `_periodo` VARCHAR(13), IN `_nota` DOUBLE(4,1), IN `_id_estudiante` SMALLINT(5), IN `_id_materia` SMALLINT(2), IN `_id_nota` SMALLINT(5))  BEGIN
UPDATE nota SET nombre_nota = _nombre_nota, periodo_nota = _periodo, nota = _nota WHERE id_nota = _id_nota AND id_estudiante = _id_estudiante AND id_materia = _id_materia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_observador` (IN `_id_observador` SMALLINT(5), IN `_descripcion_observador` VARCHAR(254), IN `_compromiso_observador` VARCHAR(254))  BEGIN
UPDATE observador SET descripcion_observador = _descripcion_observador, compromiso_observador = _compromiso_observador WHERE id_observador = _id_observador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_profesor` (IN `_nombre_profesor` VARCHAR(20), IN `_identificacion_profesor` INT(11), IN `_telefono_profesor` BIGINT(11), IN `_id_profesor` SMALLINT(5))  BEGIN
UPDATE profesor SET nombre_profesor = _nombre_profesor, identificacion_profesor = _identificacion_profesor, telefono_profesor =_telefono_profesor WHERE id_profesor = _id_profesor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_usuario` (IN `_usuario` VARCHAR(20), IN `_clave` VARCHAR(20), IN `_new_usuario` VARCHAR(20))  BEGIN

UPDATE usuario SET usuario = _new_usuario WHERE usuario = _usuario AND clave = _clave;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_acudiente` (IN `_id_usuario` SMALLINT(5))  BEGIN
SELECT id_acudiente, nombre_acudiente, identificacion_acudiente, telefono_acudiente FROM acudiente where id_usuario = _id_usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_estudiante` (IN `_identificacion_estudiante` INT(11))  BEGIN
SELECT id_estudiante from estudiante WHERE identificacion_estudiante = _identificacion_estudiante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_perfil_acudiente` (IN `_id_acudiente` SMALLINT(5))  BEGIN
SELECT nombre_acudiente, identificacion_acudiente, telefono_acudiente FROM acudiente where id_acudiente = _id_acudiente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_perfil_profesor` (IN `_id_profesor` SMALLINT(5))  BEGIN
SELECT nombre_profesor, identificacion_profesor, telefono_profesor FROM profesor where id_profesor = _id_profesor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_usuario` (IN `_usuario` VARCHAR(20), IN `_clave` VARCHAR(20))  BEGIN

SELECT * FROM usuario WHERE usuario = _usuario AND clave = _clave;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_estudiante` (IN `_nombre_estudiante` VARCHAR(20), IN `_apellido_estudiante` VARCHAR(20), IN `_identificacion_estudiante` INT(11), IN `_telefono_estudiante` BIGINT(11), IN `_grado` SMALLINT(5))  BEGIN
INSERT INTO estudiante (nombre_estudiante,apellido_estudiante,identificacion_estudiante,telefono_estudiante,grado) VALUES (_nombre_estudiante, _apellido_estudiante, _identificacion_estudiante, _telefono_estudiante, _grado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `detalle_estudiante` (IN `_fecha_detalle_estudiante` DATETIME, IN `_id_profesor` SMALLINT(5), IN `_id_estudiante` SMALLINT(5), IN `tipo_detalle` TINYINT(1))  BEGIN
IF(tipo_detalle = 1) THEN
INSERT INTO detalle_gestion_estudiante(fecha_detalle_estudiante, descripcion_detalle_estudiante,id_profesor, id_estudiante) VALUES (_fecha_detalle_estudiante, "Se ha registrado un nuevo Estudiante", _id_profesor, _id_estudiante);
ELSEIF(tipo_detalle = 2) THEN
INSERT INTO detalle_gestion_estudiante(fecha_detalle_estudiante, descripcion_detalle_estudiante, id_profesor, id_estudiante) VALUES (_fecha_detalle_estudiante, "Se han actualizado datos del Estudiante", _id_profesor, _id_estudiante);
ELSE
INSERT INTO detalle_gestion_estudiante(fecha_detalle_estudiante, descripcion_detalle_estudiante, id_profesor, id_estudiante) VALUES (_fecha_detalle_estudiante, "Se ha inhabilitado el Estudiante", _id_profesor, _id_estudiante);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `enlazar_estudiante` (IN `_id_acudiente` SMALLINT(5), IN `_identificacion_estudiante` INT(11))  BEGIN
UPDATE estudiante SET id_acudiente = _id_acudiente WHERE identificacion_estudiante = _identificacion_estudiante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `estudiante_a_actualizar` (IN `_id_estudiante` SMALLINT(5))  BEGIN
SELECT id_estudiante, nombre_estudiante, apellido_estudiante, identificacion_estudiante, telefono_estudiante, grado, estado_estudiante FROM estudiante WHERE id_estudiante = _id_estudiante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `habilitar_estudiante` (IN `_id_estudiante` SMALLINT(5))  BEGIN

UPDATE estudiante SET estado_estudiante = 1 WHERE id_estudiante = _id_estudiante;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `habilitar_usuario` (IN `_usuario` VARCHAR(20), IN `_clave` VARCHAR(20))  BEGIN

UPDATE usuario SET estado_usuario = 1 WHERE usuario = _usuario AND clave = _clave;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inhabilitar_usuario` (IN `_usuario` VARCHAR(20), IN `_clave` VARCHAR(20))  BEGIN

UPDATE usuario SET estado_usuario = 2 WHERE usuario = _usuario AND clave = _clave;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_nota_final` (IN `_id_estudiante` SMALLINT(5), IN `_id_materia` SMALLINT(5), IN `_id_profesor` SMALLINT(5))  BEGIN
DECLARE promedio double(4,2);
DECLARE desempeño tinyint(1);
SELECT calcular_promedio(_id_estudiante, _id_materia) INTO promedio;
SELECT calcular_desempeño(promedio) INTO desempeño;
INSERT INTO nota (promedio_nota, desempeño_nota, id_estudiante, id_profesor, id_materia) VALUES (promedio, desempeño, _id_estudiante, _id_profesor, _id_materia);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_datos_profesor` (IN `_id_usuario` SMALLINT(5))  BEGIN
SELECT id_profesor, nombre_profesor, identificacion_profesor, telefono_profesor FROM profesor WHERE id_usuario = _id_usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_detalle_estudiante` (IN `_id_estudiante` SMALLINT(5))  BEGIN
SELECT est.nombre_estudiante, est.apellido_estudiante, est.grado, dge.fecha_detalle_estudiante, dge.descripcion_detalle_estudiante, dge.id_profesor FROM estudiante est 
INNER JOIN detalle_gestion_estudiante dge ON est.id_estudiante = dge.id_estudiante WHERE
est.id_estudiante = _id_estudiante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_estudiantes` (IN `_estado` TINYINT(1))  BEGIN
IF(_estado = 1) THEN
SELECT * FROM estudiante WHERE estado_estudiante = 1;
ELSE
SELECT * FROM estudiante WHERE estado_estudiante = 2;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_estudiantes_enlazados` (IN `_id_acudiente` SMALLINT(5))  BEGIN
SELECT id_estudiante, nombre_estudiante, apellido_estudiante, identificacion_estudiante, telefono_estudiante, grado, estado_estudiante from estudiante WHERE id_acudiente = _id_acudiente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_notas` (IN `_id_estudiante` SMALLINT(5), IN `_id_materia` SMALLINT(2))  BEGIN
SELECT * FROM nota WHERE id_estudiante = _id_estudiante AND id_materia = _id_materia; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_observador` (IN `_id_estudiante` SMALLINT(5))  BEGIN
SELECT * FROM observador WHERE id_estudiante = _id_estudiante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_materias` (IN `_id_estudiante` SMALLINT(5))  BEGIN
SELECT DISTINCT nta.id_materia, mat.materia FROM nota nta 
INNER JOIN materia mat ON nta.id_materia = mat.id_materia WHERE
nta.id_estudiante = _id_estudiante and nota is not null;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `observador_a_actualizar` (IN `_id_observador` MEDIUMINT(8))  BEGIN
SELECT * FROM observador WHERE id_observador = _id_observador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_nota` (IN `_nombre_nota` VARCHAR(30), IN `_periodo_nota` TINYINT(1), IN `_nota` DOUBLE(4,1), IN `_id_estudiante` SMALLINT(5), IN `_id_profesor` SMALLINT(5), IN `_id_materia` SMALLINT(2))  BEGIN
INSERT INTO nota (nombre_nota, periodo_nota, nota, id_estudiante, id_profesor, id_materia) VALUES (_nombre_nota, _periodo_nota, _nota, _id_estudiante, _id_profesor, _id_materia);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_observador` (IN `_compromiso_observador` VARCHAR(254), IN `_descripcion_observador` VARCHAR(254), IN `_grado` SMALLINT(5), IN `_id_estudiante` SMALLINT(5))  BEGIN
INSERT INTO observador (compromiso_observador, descripcion_observador, grado, id_estudiante) VALUES (_compromiso_observador, _descripcion_observador, _grado, _id_estudiante);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_usuario` (IN `_usuario` VARCHAR(20), IN `_clave` VARCHAR(20), IN `_codigo` VARCHAR(15))  BEGIN

CASE _codigo
WHEN 'H1nG8Jy9K2tD6xF' THEN
INSERT into usuario (usuario,clave,rol) VALUES (_usuario,_clave,2);

WHEN '' THEN
INSERT into usuario (usuario,clave,rol) VALUES (_usuario,_clave,1);
END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `traer_id_profesor` (IN `_id_usuario` SMALLINT(5))  BEGIN
SELECT id_profesor FROM profesor WHERE id_usuario = _id_usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validar_datos_usuario` (IN `_usuario` VARCHAR(20), IN `_clave` VARCHAR(20))  BEGIN
SELECT usuario, clave FROM usuario WHERE usuario = _usuario AND clave = _clave;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_desempeño` (`_promedio` DOUBLE(4,2)) RETURNS TINYINT(1) BEGIN
DECLARE desempeño tinyint(1);
IF (_promedio < 3) THEN
SET desempeño = 1;
ELSEIF (_promedio > 3 AND _promedio <= 3.5) THEN
SET desempeño = 2;
ELSEIF (_promedio > 3.5 AND _promedio <= 4.5 ) THEN
SET desempeño = 3;
ELSEIF (_promedio > 4.5) THEN
SET desempeño = 4;
END IF;
RETURN desempeño;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_promedio` (`_id_estudiante` SMALLINT(5), `_id_materia` SMALLINT(5)) RETURNS DOUBLE(4,2) BEGIN
DECLARE numNotas SMALLINT(2);
DECLARE sumaNotas double(4,2);
DECLARE promedio double(4,2);
select count(nota)
into numNotas
from nota
where id_estudiante = _id_estudiante AND id_materia = _id_materia AND id_nota is not null;
select sum(nota) INTO sumaNotas from nota
WHERE id_estudiante = _id_estudiante AND id_materia = _id_materia;
SET promedio = sumaNotas/numNotas;
RETURN promedio;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `acudiente`
--

CREATE TABLE `acudiente` (
  `id_acudiente` smallint(5) NOT NULL,
  `nombre_acudiente` varchar(20) NOT NULL,
  `identificacion_acudiente` int(11) DEFAULT NULL,
  `telefono_acudiente` bigint(11) DEFAULT '0',
  `id_usuario` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acudiente`
--

INSERT INTO `acudiente` (`id_acudiente`, `nombre_acudiente`, `identificacion_acudiente`, `telefono_acudiente`, `id_usuario`) VALUES
(17, '', NULL, 0, 71);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_gestion_estudiante`
--

CREATE TABLE `detalle_gestion_estudiante` (
  `id_detalle_estudiante` smallint(5) NOT NULL,
  `fecha_detalle_estudiante` datetime NOT NULL,
  `descripcion_detalle_estudiante` varchar(254) NOT NULL,
  `id_profesor` smallint(5) DEFAULT NULL,
  `id_estudiante` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalle_gestion_estudiante`
--

INSERT INTO `detalle_gestion_estudiante` (`id_detalle_estudiante`, `fecha_detalle_estudiante`, `descripcion_detalle_estudiante`, `id_profesor`, `id_estudiante`) VALUES
(1, '2019-10-02 16:47:42', 'Se han actualizado datos del Estudiante', 13, 125);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_gestion_nota`
--

CREATE TABLE `detalle_gestion_nota` (
  `id_detalle_nota` smallint(5) NOT NULL,
  `fecha_detalle_nota` datetime NOT NULL,
  `descripcion_detalle_nota` varchar(254) NOT NULL,
  `id_profesor` smallint(5) NOT NULL,
  `id_nota` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_gestion_observador`
--

CREATE TABLE `detalle_gestion_observador` (
  `id_detalle_observador` smallint(5) NOT NULL,
  `fecha_detalle_observador` datetime NOT NULL,
  `descripcion_detalle_observador` varchar(254) NOT NULL,
  `id_profesor` smallint(5) DEFAULT NULL,
  `id_observador` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` smallint(5) NOT NULL,
  `nombre_estudiante` varchar(20) NOT NULL,
  `apellido_estudiante` varchar(20) NOT NULL,
  `identificacion_estudiante` int(11) NOT NULL,
  `telefono_estudiante` bigint(11) DEFAULT '0',
  `grado` smallint(5) NOT NULL,
  `estado_estudiante` tinyint(1) NOT NULL DEFAULT '1',
  `id_acudiente` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `nombre_estudiante`, `apellido_estudiante`, `identificacion_estudiante`, `telefono_estudiante`, `grado`, `estado_estudiante`, `id_acudiente`) VALUES
(125, 'Carlos', 'Pinilla', 1001272534, 0, 11, 1, 17),
(126, 'Carlos', 'Pinilla', 10012454, 0, 11, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `materia`
--

CREATE TABLE `materia` (
  `id_materia` smallint(2) NOT NULL,
  `materia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materia`
--

INSERT INTO `materia` (`id_materia`, `materia`) VALUES
(1, 'Matemáticas'),
(2, 'Español'),
(3, 'Economia'),
(4, 'Filosofia'),
(5, 'Quimica'),
(6, 'Fisica'),
(7, 'Educacion Fisica'),
(8, 'Ingles'),
(9, 'Sociales'),
(10, 'Trigonometria'),
(11, 'Calculo'),
(12, 'Etica'),
(13, 'Religion'),
(14, 'Biologia');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `id_nota` smallint(5) NOT NULL,
  `nombre_nota` varchar(30) NOT NULL DEFAULT 'No hay dato',
  `periodo_nota` tinyint(1) DEFAULT NULL,
  `nota` double(4,1) DEFAULT NULL,
  `promedio_nota` double(4,1) DEFAULT NULL,
  `desempeño_nota` varchar(13) DEFAULT NULL,
  `id_estudiante` smallint(5) NOT NULL,
  `id_profesor` smallint(5) NOT NULL,
  `id_materia` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`id_nota`, `nombre_nota`, `periodo_nota`, `nota`, `promedio_nota`, `desempeño_nota`, `id_estudiante`, `id_profesor`, `id_materia`) VALUES
(21, 'Exposicion', 3, 3.2, NULL, NULL, 125, 13, 1),
(22, 'Evaluacion de funciones', 3, 3.8, NULL, NULL, 125, 13, 1),
(23, 'Tarea 1', 3, 3.6, NULL, NULL, 125, 13, 2),
(24, 'Promedio', 3, 3.2, 4.2, '3', 125, 13, 5),
(25, 'Pruebafinal', 1, 4.3, NULL, NULL, 125, 13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `observador`
--

CREATE TABLE `observador` (
  `id_observador` smallint(5) NOT NULL,
  `grado` smallint(5) NOT NULL,
  `descripcion_observador` varchar(254) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `compromiso_observador` varchar(254) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_estudiante` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` smallint(5) NOT NULL,
  `nombre_profesor` varchar(20) NOT NULL,
  `identificacion_profesor` int(11) DEFAULT NULL,
  `telefono_profesor` bigint(11) NOT NULL DEFAULT '0',
  `id_usuario` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `nombre_profesor`, `identificacion_profesor`, `telefono_profesor`, `id_usuario`) VALUES
(13, '', NULL, 0, 72);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` smallint(5) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `rol` tinyint(1) NOT NULL,
  `estado_usuario` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `clave`, `rol`, `estado_usuario`) VALUES
(71, 'Carlos', '123', 1, 1),
(72, 'Alejandro', '1452', 2, 1);

--
-- Triggers `usuario`
--
DELIMITER $$
CREATE TRIGGER `AsigUsuario_AI` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
IF (new.rol = 2) THEN
INSERT INTO profesor(ID_usuario) VALUES (new.ID_usuario);
ELSEIF (new.rol = 1) THEN
INSERT INTO acudiente(ID_usuario) VALUES (new.ID_usuario);
END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acudiente`
--
ALTER TABLE `acudiente`
  ADD PRIMARY KEY (`id_acudiente`),
  ADD UNIQUE KEY `identi_Acu` (`identificacion_acudiente`) USING BTREE,
  ADD KEY `acudiente_ibfk_3` (`id_usuario`);

--
-- Indexes for table `detalle_gestion_estudiante`
--
ALTER TABLE `detalle_gestion_estudiante`
  ADD PRIMARY KEY (`id_detalle_estudiante`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indexes for table `detalle_gestion_nota`
--
ALTER TABLE `detalle_gestion_nota`
  ADD PRIMARY KEY (`id_detalle_nota`),
  ADD KEY `id_nota` (`id_nota`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indexes for table `detalle_gestion_observador`
--
ALTER TABLE `detalle_gestion_observador`
  ADD PRIMARY KEY (`id_detalle_observador`),
  ADD KEY `id_observador` (`id_observador`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indexes for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD UNIQUE KEY `identificación_Est` (`identificacion_estudiante`) USING BTREE,
  ADD KEY `id_acudiente` (`id_acudiente`);

--
-- Indexes for table `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `nota_ibfk_3` (`id_materia`);

--
-- Indexes for table `observador`
--
ALTER TABLE `observador`
  ADD PRIMARY KEY (`id_observador`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indexes for table `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD UNIQUE KEY `identi_Pro` (`identificacion_profesor`),
  ADD KEY `profesor_ibfk_2` (`id_usuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `USUARIO` (`usuario`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acudiente`
--
ALTER TABLE `acudiente`
  MODIFY `id_acudiente` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `detalle_gestion_estudiante`
--
ALTER TABLE `detalle_gestion_estudiante`
  MODIFY `id_detalle_estudiante` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detalle_gestion_nota`
--
ALTER TABLE `detalle_gestion_nota`
  MODIFY `id_detalle_nota` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalle_gestion_observador`
--
ALTER TABLE `detalle_gestion_observador`
  MODIFY `id_detalle_observador` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `observador`
--
ALTER TABLE `observador`
  MODIFY `id_observador` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_profesor` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acudiente`
--
ALTER TABLE `acudiente`
  ADD CONSTRAINT `acudiente_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `acudiente_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `detalle_gestion_estudiante`
--
ALTER TABLE `detalle_gestion_estudiante`
  ADD CONSTRAINT `detalle_gestion_estudiante_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `detalle_gestion_estudiante_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`);

--
-- Constraints for table `detalle_gestion_nota`
--
ALTER TABLE `detalle_gestion_nota`
  ADD CONSTRAINT `detalle_gestion_nota_ibfk_1` FOREIGN KEY (`id_nota`) REFERENCES `nota` (`id_nota`),
  ADD CONSTRAINT `detalle_gestion_nota_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`);

--
-- Constraints for table `detalle_gestion_observador`
--
ALTER TABLE `detalle_gestion_observador`
  ADD CONSTRAINT `detalle_gestion_observador_ibfk_1` FOREIGN KEY (`id_observador`) REFERENCES `observador` (`id_observador`),
  ADD CONSTRAINT `detalle_gestion_observador_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`);

--
-- Constraints for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_acudiente`) REFERENCES `acudiente` (`id_acudiente`);

--
-- Constraints for table `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `nota_ibfk_3` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`);

--
-- Constraints for table `observador`
--
ALTER TABLE `observador`
  ADD CONSTRAINT `observador_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
