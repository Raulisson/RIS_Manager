-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 22-Abr-2024 às 17:00
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `corpmng`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acl_acao`
--

DROP TABLE IF EXISTS `acl_acao`;
CREATE TABLE IF NOT EXISTS `acl_acao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `metodo` varchar(200) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `id_acl_controle` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_acl_controle` (`id_acl_controle`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acl_acao`
--

INSERT INTO `acl_acao` (`id`, `nome`, `metodo`, `descricao`, `id_acl_controle`) VALUES
(1, 'Criar usuário', 'form', 'Permite o cadastro de um novo usuário na base de dados', 1),
(2, 'Alterar usuário', 'alterar', 'Permite alteração de usuários já cadastrados na base de dados', 1),
(3, 'Visualizar usuário', 'visualizar', 'Permite a visualização dos dados dos usuários cadastrados na base de dados', 1),
(4, 'Excluir usuário', 'excluir', 'Permite a exclusão dos usuários cadastrados na base de dados', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `acl_controle`
--

DROP TABLE IF EXISTS `acl_controle`;
CREATE TABLE IF NOT EXISTS `acl_controle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `classe` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acl_controle`
--

INSERT INTO `acl_controle` (`id`, `nome`, `classe`) VALUES
(1, 'Usuario', 'usuario');

-- --------------------------------------------------------

--
-- Estrutura da tabela `acl_grupo`
--

DROP TABLE IF EXISTS `acl_grupo`;
CREATE TABLE IF NOT EXISTS `acl_grupo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `id_empresa` int DEFAULT NULL,
  `publico` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acl_grupo`
--

INSERT INTO `acl_grupo` (`id`, `nome`, `descricao`, `id_empresa`, `publico`) VALUES
(1, 'Administrador', 'Perfil administrador da empresa', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `acl_grupo_acao`
--

DROP TABLE IF EXISTS `acl_grupo_acao`;
CREATE TABLE IF NOT EXISTS `acl_grupo_acao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_acl_grupo` int NOT NULL,
  `id_acl_acao` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `acl_grupo_id` (`id_acl_grupo`),
  KEY `acl_metodo_id` (`id_acl_acao`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acl_grupo_acao`
--

INSERT INTO `acl_grupo_acao` (`id`, `id_acl_grupo`, `id_acl_acao`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 1, 4),
(4, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `acl_grupo_usuario`
--

DROP TABLE IF EXISTS `acl_grupo_usuario`;
CREATE TABLE IF NOT EXISTS `acl_grupo_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_acl_grupo` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_acl_grupo` (`id_acl_grupo`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `obs` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prioridade` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `bookings`
--

INSERT INTO `bookings` (`id`, `title`, `start_date`, `end_date`, `created_at`, `updated_at`, `obs`, `ativo`, `prioridade`) VALUES
(1, 'Pier 21', '2023-12-04 00:00:00', '2023-12-05 00:00:00', '2023-12-07 22:08:15', '2023-12-08 17:44:51', 'Limpar telas', '0', NULL),
(2, 'Malunga Lago Sul', '2023-12-04 00:00:00', '2023-12-05 00:00:00', '2023-12-07 22:08:52', '2023-12-08 17:44:57', 'Máquina Offline', '0', NULL),
(3, 'LED Oba Taquari', '2023-12-05 00:00:00', '2023-12-06 00:00:00', '2023-12-07 22:10:29', '2023-12-08 17:44:37', 'Troca de fonte', '0', NULL),
(4, 'Pizza César Guará', '2023-12-05 00:00:00', '2023-12-06 00:00:00', '2023-12-07 22:10:55', '2023-12-08 17:44:12', 'Máquina Offline', '0', NULL),
(5, 'Malunga Sudoeste', '2023-12-05 00:00:00', '2023-12-06 00:00:00', '2023-12-07 22:11:20', '2023-12-08 17:44:31', 'Troca de máquina', '0', NULL),
(6, 'Manutenção tela 75', '2023-12-05 00:00:00', '2023-12-06 00:00:00', '2023-12-07 22:11:41', '2023-12-08 17:44:22', 'Buscar tela 75', '0', NULL),
(7, 'Manutenção tela 75', '2023-12-06 00:00:00', '2023-12-07 00:00:00', '2023-12-07 22:12:02', '2023-12-08 17:44:21', 'Buscar tela 75', '0', NULL),
(8, 'OMNI', '2023-12-06 00:00:00', '2023-12-07 00:00:00', '2023-12-07 22:12:19', '2023-12-08 17:44:00', 'Uma tela desligada', '0', NULL),
(10, 'Felicittá Videowall', '2023-12-06 00:00:00', '2023-12-07 00:00:00', '2023-12-07 22:12:51', '2023-12-08 17:44:05', 'Retirada do suporte', '0', NULL),
(11, 'Armando Monteiro Neto', '2023-12-07 00:00:00', '2023-12-08 00:00:00', '2023-12-07 22:13:08', '2023-12-08 17:41:52', 'Trocar extensão elevador F', '0', NULL),
(12, 'Steak Bull', '2023-12-07 00:00:00', '2023-12-08 00:00:00', '2023-12-07 22:14:19', '2023-12-08 17:46:23', 'Tres telas desligadas, precisando de um Avaara 5000', '0', NULL),
(14, 'Instalação Big Box 408', '2023-12-08 00:00:00', '2023-12-09 00:00:00', '2023-12-07 22:15:19', '2023-12-08 21:40:07', 'Gerente não autorizou instalação, precisa estar alinhado com a ti, equipe de prevenção de perca, etc.', '0', NULL),
(15, 'Compra de Material', '2023-12-07 00:00:00', '2023-12-08 00:00:00', '2023-12-07 22:15:28', '2023-12-08 17:46:16', 'Comprar parafusadeira', '0', NULL),
(16, 'Academia World Gym', '2023-12-08 00:00:00', '2023-12-09 00:00:00', '2023-12-07 22:15:51', '2023-12-08 21:40:23', 'Um computador travou na inicialização - tela do meio', '0', NULL),
(18, 'Lampião Gastrobar', '2023-12-13 00:00:00', '2023-12-14 00:00:00', '2023-12-07 22:18:16', '2023-12-13 18:48:25', 'Cliente está pedindo para conectar uma das maquinas à internet pessoal, pois a publica so liga as 16', '0', 1),
(19, 'Academia Raia 10', '2023-12-08 00:00:00', '2023-12-09 00:00:00', '2023-12-07 22:44:47', '2023-12-08 17:46:43', 'Trocar tela - LG 42', '0', NULL),
(20, 'Superbom Guará', '2023-12-11 00:00:00', '2023-12-12 00:00:00', '2023-12-08 14:54:47', '2023-12-12 14:36:50', 'Máquina offline', '0', 0),
(21, 'SteakBull', '2023-12-08 00:00:00', '2023-12-09 00:00:00', '2023-12-08 14:58:29', '2023-12-08 17:47:05', 'Trocar transmissor e receptores', '0', NULL),
(22, 'Pizza Hut Águas Claras', '2023-12-11 00:00:00', '2023-12-12 00:00:00', '2023-12-08 17:00:15', '2023-12-12 14:36:43', 'Instalação 9h - marcada com o eletricista', '0', 1),
(23, 'Superbom QS 604', '2023-12-06 00:00:00', '2023-12-07 00:00:00', '2023-12-08 17:43:36', '2023-12-08 17:43:36', 'tela do açougue retirada', '0', NULL),
(24, 'Felicittá', '2023-12-13 00:00:00', '2023-12-14 00:00:00', '2023-12-08 21:48:42', '2023-12-13 15:00:23', 'Instalação Videowall', '0', 1),
(27, 'Big Box 105 Sudoeste', '2023-12-12 00:00:00', '2023-12-13 00:00:00', '2023-12-11 17:13:01', '2023-12-12 17:49:07', 'Máquina Travada', '0', 0),
(28, 'Compra de material (bucha)', '2023-12-11 00:00:00', '2023-12-12 00:00:00', '2023-12-11 17:13:23', '2023-12-12 14:36:35', 'Comprar no sia', '0', 1),
(29, 'Big box QI 05 Lago norte', '2023-12-12 00:00:00', '2023-12-13 00:00:00', '2023-12-12 14:42:22', '2023-12-12 17:48:54', 'OfflinE 1 dia', '0', 0),
(30, 'Superbom Águas Claras', '2023-12-13 00:00:00', '2023-12-14 00:00:00', '2023-12-12 14:52:02', '2023-12-13 14:59:56', 'Máquina offline à 1 dia', '0', 0),
(32, 'Retirada Dom Bosco Samambaia', '2023-12-12 00:00:00', '2023-12-13 00:00:00', '2023-12-12 15:14:42', '2023-12-13 12:42:38', 'Retirada de equipamentos, contrato cancelado', '0', NULL),
(33, 'Felicittá', '2023-12-12 00:00:00', '2023-12-13 00:00:00', '2023-12-12 15:32:06', '2023-12-13 12:42:31', 'Levar duas telas para adiantar instalação na quarta', '0', NULL),
(35, 'Felicittà', '2023-12-14 00:00:00', '2023-12-15 00:00:00', '2023-12-13 15:00:46', '2023-12-14 14:25:01', 'Instalação Videowall - finalizar', '0', 1),
(36, 'Aquafan', '2023-12-13 00:00:00', '2023-12-14 00:00:00', '2023-12-13 15:01:03', '2023-12-14 12:06:23', 'Problema no cabo ou máquina - trouxe para testar', '0', 0),
(37, 'Big Box 512 Sul', '2023-12-14 00:00:00', '2023-12-15 00:00:00', '2023-12-13 15:39:12', '2023-12-14 18:48:41', 'Máquina travada', '0', 0),
(38, 'Aquafan', '2023-12-14 00:00:00', '2023-12-15 00:00:00', '2023-12-14 12:06:45', '2023-12-14 18:48:31', 'Cabo oxidado, realizado troca', '0', 0),
(39, 'Posto Igrejinha Asa Sul', '2023-12-14 00:00:00', '2023-12-15 00:00:00', '2023-12-14 12:06:59', '2023-12-14 18:49:30', 'Máquina travada', '0', 0),
(40, 'Runway Sudoeste - 75\"', '2023-12-15 00:00:00', '2023-12-16 00:00:00', '2023-12-14 15:55:23', '2023-12-15 14:36:30', 'Máquina Offline des do dia 13/12', '0', 0),
(49, 'Alameda', '2023-12-15 00:00:00', '2023-12-16 00:00:00', '2023-12-15 12:48:13', '2023-12-15 13:30:40', 'Máquina liga 10 horas.', '0', 1),
(51, 'Instalação BigBox', '2023-12-18 00:00:00', '2023-12-19 00:00:00', '2023-12-18 11:23:09', '2023-12-19 11:28:26', '3 suportes instalados', '0', 1),
(53, 'Bonamix QR 122 - Caixas', '2023-12-18 00:00:00', '2023-12-19 00:00:00', '2023-12-18 11:24:36', '2023-12-18 13:35:14', 'Internet do cliente apresenta defeito.', '0', 0),
(54, 'Malunga Lago Sul', '2023-12-19 00:00:00', '2023-12-20 00:00:00', '2023-12-18 11:26:06', '2023-12-19 13:22:35', 'Loja de mudança', '0', 0),
(55, 'Shopping Felicittà videowall', '2023-12-18 00:00:00', '2023-12-19 00:00:00', '2023-12-18 11:26:20', '2023-12-18 13:35:29', 'Máquina estava travada, pico de energia.', '0', 1),
(56, 'Big Box QI 11 Lago Sul', '2023-12-19 00:00:00', '2023-12-20 00:00:00', '2023-12-18 14:05:26', '2023-12-19 14:16:42', 'Máquina travada', '0', 0),
(59, 'Felicittà Videowall', '2023-12-20 00:00:00', '2023-12-21 00:00:00', '2023-12-19 13:04:17', '2023-12-20 14:02:38', 'Efetuada troca de máquina', '0', 1),
(61, 'Fausto e Manoel Sudoeste', '2023-12-20 00:00:00', '2023-12-21 00:00:00', '2023-12-20 12:58:16', '2023-12-20 14:02:59', 'Nenhum problema detectado. Telas de publicidade ok', '0', 0),
(62, 'Painel perto da escada', '2023-12-20 00:00:00', '2023-12-21 00:00:00', '2023-12-20 14:24:41', '2023-12-21 11:36:38', 'Fazer ligar', '0', 0),
(63, 'Pier 21', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2023-12-20 16:03:44', '2024-01-15 13:21:49', 'Efetuada troca de tela.', '0', 1),
(64, 'Malunga Lago Sul', '2023-12-26 00:00:00', '2023-12-27 00:00:00', '2023-12-20 16:06:33', '2023-12-26 18:42:35', 'Ainda sem lugar para instalação de tela, sem ponto, etc..', '0', 1),
(65, 'Big Box 301 Sudoeste', '2023-12-22 00:00:00', '2023-12-23 00:00:00', '2023-12-21 11:37:15', '2023-12-26 11:19:25', 'Tirar do ar para recolhimento dos caixas no natal', '0', 1),
(66, 'Big Box 512 Sul', '2023-12-21 00:00:00', '2023-12-22 00:00:00', '2023-12-21 11:39:25', '2023-12-21 14:45:10', 'Troca de máquina', '0', 1),
(67, 'Painel Correios', '2024-01-17 00:00:00', '2024-01-18 00:00:00', '2023-12-21 11:48:00', '2024-01-17 19:41:02', 'Faltando um cabo', '0', 0),
(70, 'Alameda Shopping', '2023-12-26 00:00:00', '2023-12-27 00:00:00', '2023-12-21 12:34:14', '2023-12-26 14:46:46', 'Trocar configuração da Bios para ligar 9 horas', '0', 1),
(72, 'Big Box QI 11 Lago Sul', '2023-12-26 00:00:00', '2023-12-27 00:00:00', '2023-12-21 15:09:32', '2023-12-26 18:42:45', 'Efetuada troca de máquina', '0', 0),
(73, 'Entrega de Lembranças', '2023-12-21 00:00:00', '2023-12-22 00:00:00', '2023-12-21 15:28:16', '2023-12-22 11:22:01', 'Entregar na região Sudoeste e Cruzeiro', '0', 0),
(74, 'Big Box 508 Sul', '2023-12-27 00:00:00', '2023-12-28 00:00:00', '2023-12-22 11:39:35', '2023-12-27 18:57:48', 'Máquina travada', '0', 0),
(75, 'Aquafan', '2023-12-27 00:00:00', '2023-12-28 00:00:00', '2023-12-22 11:39:51', '2023-12-27 13:58:34', 'Recesso', '0', 0),
(77, 'Coworkout One', '2023-12-27 00:00:00', '2023-12-28 00:00:00', '2023-12-26 11:21:17', '2023-12-27 13:05:11', 'Academia em reforma', '0', 0),
(79, 'Superbom QNJ Açougue', '2023-12-26 00:00:00', '2023-12-27 00:00:00', '2023-12-26 11:22:14', '2023-12-26 14:47:15', 'Internet do cliente apresenta defeito', '0', 0),
(80, 'Big Box 301 Sudoeste', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2023-12-26 13:25:22', '2024-01-15 18:50:57', 'Feita emenda do cabo', '0', 1),
(82, 'Julio Adnet - Terraço Shopping', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-27 11:31:23', '2023-12-28 14:14:02', 'Zotac Travada', '0', 0),
(83, 'Centro Empresarial Brasília', '2023-12-27 00:00:00', '2023-12-28 00:00:00', '2023-12-27 11:35:49', '2023-12-27 18:58:37', 'Máquina elevador travada, SIC\'s desligados, 2 andar bloco B - Raspberry não inicializava com cabo de rede conectado.', '0', 0),
(84, 'Runway Sudoeste Escritorio', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-27 11:53:26', '2023-12-28 14:14:10', 'Troca de máquina, erro de dll', '0', 0),
(85, 'Academia OMNI', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-27 13:38:42', '2023-12-28 14:13:50', 'Discutido mudanças, 1 tela queimada, retirar uma tela isolada e trocar pela queimada.', '0', 0),
(86, 'Big Box 402 Norte', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-27 18:06:26', '2023-12-29 11:15:53', 'Metade das telas desligadas - Duas fontes do TNT com defeito.', '0', 1),
(87, 'Posto Igrejinha Asa Sul', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-28 15:51:14', '2023-12-29 11:18:04', 'Internet do cliente apresenta instabilidade.', '0', 0),
(88, 'Big Box QI 11 Lago Sul', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-28 15:51:41', '2023-12-29 11:16:02', 'Máquina travada', '0', 0),
(89, 'Academia OMNI', '2023-12-29 00:00:00', '2023-12-30 00:00:00', '2023-12-28 15:52:06', '2024-01-02 11:59:03', 'Retirada 1 tela trocada pela academia e 1 tela da entrada, a qual foi trocada pela do mezanino, que apresentava defeito.', '0', 1),
(90, 'Pier 21', '2023-12-29 00:00:00', '2023-12-30 00:00:00', '2023-12-29 11:18:24', '2024-01-02 11:59:35', 'Troca de fonte para telas do corredor e andar de baixo, telas de 75 desligadas no controle e perderam configuração devido pico de energia.', '0', 0),
(91, 'CB Lojinha', '2024-01-02 00:00:00', '2024-01-03 00:00:00', '2024-01-02 11:36:03', '2024-01-02 11:50:04', 'Máquina Travada', '0', 0),
(92, 'Big Box QI 11', '2024-01-02 00:00:00', '2024-01-03 00:00:00', '2024-01-02 11:37:27', '2024-01-02 14:35:35', 'Máquina travada', '0', 0),
(93, 'Julio Adnet 01', '2024-01-02 00:00:00', '2024-01-03 00:00:00', '2024-01-02 11:38:15', '2024-01-02 15:07:05', 'Máquina dos Alongamentos - Zotac queimada', '0', 0),
(95, 'Pizza César Guará', '2024-01-03 00:00:00', '2024-01-04 00:00:00', '2024-01-02 11:39:22', '2024-01-04 11:29:41', 'Cabo de rede mal conectado', '0', 0),
(98, 'Centro Empresarial Brasília Elevador', '2024-01-10 00:00:00', '2024-01-11 00:00:00', '2024-01-02 12:04:53', '2024-01-10 15:37:53', '3º elevador depois do elevador de serviço', '0', 0),
(100, 'Vence Assinatura Teamviewer', '2024-02-10 00:00:00', '2024-02-11 00:00:00', '2024-01-02 16:18:36', '2024-01-16 19:58:34', 'Vencimento da assinatura', '0', 0),
(101, 'Big Box QI 11', '2024-01-03 00:00:00', '2024-01-04 00:00:00', '2024-01-03 13:35:20', '2024-01-04 11:29:29', 'Troca de máquina', '0', 1),
(102, 'Academia OMNI', '2024-01-04 00:00:00', '2024-01-05 00:00:00', '2024-01-03 15:37:34', '2024-01-04 11:30:06', 'Máquina pedindo inicialização segura após pico de energia', '0', 1),
(105, 'Big Box QI 05 Lago Norte', '2024-01-09 00:00:00', '2024-01-10 00:00:00', '2024-01-05 11:47:04', '2024-01-09 19:52:46', 'Cabo de rede no 104 mal conectado.', '0', 1),
(106, 'CNI', '2024-01-08 00:00:00', '2024-01-09 00:00:00', '2024-01-05 11:47:30', '2024-01-08 19:35:29', 'Máquina do elevador Roberto com HD corrompido, Armando travada e tela do Armando 9 andar queimada.', '0', 1),
(107, 'SESI Lab', '2024-01-09 00:00:00', '2024-01-10 00:00:00', '2024-01-05 11:47:58', '2024-01-09 16:12:39', 'Tela de exposição temporária retirada e do cni estava fora da rede.', '0', 1),
(109, 'Runway Sudoeste', '2024-01-08 00:00:00', '2024-01-09 00:00:00', '2024-01-08 11:48:56', '2024-01-08 13:22:33', 'Internet do cliente apresenta defeito', '0', 0),
(110, 'Academia Ultra - Cruzeiro', '2024-01-08 00:00:00', '2024-01-09 00:00:00', '2024-01-08 11:49:41', '2024-01-08 16:24:44', 'Player rodando, porém sem acesso ao teamviewer. voltar com escada', '0', 1),
(111, 'InMove', '2024-01-08 00:00:00', '2024-01-09 00:00:00', '2024-01-08 11:52:03', '2024-01-08 16:25:01', 'Máquina desligada', '0', 0),
(112, 'CNI', '2024-01-09 00:00:00', '2024-01-10 00:00:00', '2024-01-08 19:36:02', '2024-01-09 19:52:32', 'Máquina reposta. Defeito na tela encaminhada aos responsáveis. Samsung de propriedade do cni.', '0', 1),
(113, 'Ultra Cruzeiro', '2024-01-09 00:00:00', '2024-01-10 00:00:00', '2024-01-09 11:28:10', '2024-01-09 19:52:06', 'Internet voltou, telas continuam azuis, podendo ser o kramer 120 que não tem fonte. Alimentados pelo cabo de rede.', '0', 0),
(114, 'Pizza César Guará', '2024-01-10 00:00:00', '2024-01-11 00:00:00', '2024-01-09 16:38:37', '2024-01-11 11:41:02', 'Defeito na internet do cliente', '0', 0),
(115, 'Big Box 503 Sul', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:43:08', '2024-01-11 17:57:36', 'Adriano gerente disse que amanhã o pessoal da elétrica vai dar uma olhada, tela está sem alimentação.', '0', 0),
(116, 'Big Box Sibéria', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:43:26', '2024-01-11 14:22:08', 'Mal contato no cabo de rede.', '0', 0),
(117, 'Coworkout One', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:43:48', '2024-01-11 18:50:57', 'Feito troca de bateria da máquina; Se perder configuração, levar outro mini pc.', '0', 0),
(118, 'Aquafan', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:44:09', '2024-01-11 14:20:57', 'Ainda em obras: Funcionário Patrick informou que previsão para término é à partir do dia 21.', '0', 0),
(119, 'Acqua Sul', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:44:22', '2024-01-11 17:57:05', 'Ainda em obras, previsão: Dia 20', '0', 0),
(120, 'Big Box 106 Norte', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:46:31', '2024-01-11 14:21:32', 'Telas desligadas pelo cabo de força.', '0', 0),
(121, 'Aquafan', '2024-01-22 00:00:00', '2024-01-23 00:00:00', '2024-01-11 15:45:37', '2024-01-22 14:12:25', 'Ainda em reforma.', '0', 0),
(123, 'Big Box 503 Sul', '2024-01-12 00:00:00', '2024-01-13 00:00:00', '2024-01-12 11:42:55', '2024-01-12 15:15:21', 'Eletricista não estava. Gernete foi informado para verificar a situação da energia das linhas quentes.', '0', 0),
(125, 'Academia Ultra Cruzeiro', '2024-01-12 00:00:00', '2024-01-13 00:00:00', '2024-01-12 11:43:33', '2024-01-15 13:17:01', 'Internet do cliente apresenta defeito.', '0', 0),
(126, 'Coworkout One', '2024-01-12 00:00:00', '2024-01-13 00:00:00', '2024-01-12 15:14:27', '2024-01-15 13:17:09', 'Troca de máquina', '0', 0),
(127, 'CNI', '2024-01-12 00:00:00', '2024-01-13 00:00:00', '2024-01-12 15:19:36', '2024-01-12 15:19:36', 'Verificado todos elevadores, telas todas ligadas.', '0', 0),
(128, 'UNICEUB', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-01-12 15:37:21', '2024-02-19 16:00:34', 'Pendências: 1 tela LG, 1 tela Samsung 300MX e 1 kramer Bloco 06.', '0', 1),
(129, 'Sesi Lab - tela CNI', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2024-01-15 11:15:36', '2024-01-15 18:51:47', 'Conectado na internet do Sesi.', '0', 0),
(132, 'Conserto tela 75', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2024-01-15 13:22:51', '2024-01-15 15:23:15', 'Deixar tela de 75 para conserto na Asa Sul.', '0', 1),
(133, 'Malunga Gilberto Salomão', '2024-01-16 00:00:00', '2024-01-17 00:00:00', '2024-01-15 13:23:28', '2024-01-16 16:34:46', 'Instalação.', '0', 1),
(134, 'Academia Ultra Cruzeiro', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2024-01-15 15:39:38', '2024-01-15 19:12:27', 'Pegar senha do wifi.', '0', 0),
(135, 'FitOne', '2024-01-16 00:00:00', '2024-01-17 00:00:00', '2024-01-15 19:08:46', '2024-01-16 19:27:59', 'Feito troca de discabo.', '0', 0),
(136, 'Big Box 301 Sudoeste', '2024-01-16 00:00:00', '2024-01-17 00:00:00', '2024-01-15 19:34:28', '2024-01-16 19:27:42', 'Reinstalado', '0', 1),
(137, 'Big Box Península', '2024-01-19 00:00:00', '2024-01-20 00:00:00', '2024-01-16 13:51:05', '2024-01-22 15:31:09', 'Passado cabo.', '0', 1),
(138, 'Big Box CN 01 Taguatinga', '2024-01-17 00:00:00', '2024-01-18 00:00:00', '2024-01-16 15:40:38', '2024-01-17 19:21:15', 'Uma tela apagada, troca de kramer', '0', 0),
(139, 'Pegar escada Hermínio', '2024-01-17 00:00:00', '2024-01-18 00:00:00', '2024-01-16 15:40:59', '2024-01-17 17:53:31', 'Pegar escada', '0', 1),
(140, 'Big Box CNB 12', '2024-01-17 00:00:00', '2024-01-18 00:00:00', '2024-01-16 19:25:03', '2024-01-17 14:12:56', 'Modem instalado.', '0', 0),
(142, 'Big Box 402 Norte', '2024-01-18 00:00:00', '2024-01-19 00:00:00', '2024-01-17 15:27:14', '2024-01-18 14:20:31', 'Cabo de rede desconectado.', '0', 0),
(143, 'Big Box Península', '2024-01-18 00:00:00', '2024-01-19 00:00:00', '2024-01-18 10:48:34', '2024-01-22 15:31:08', 'Passado cabo.', '0', 1),
(144, 'Comprar material', '2024-01-18 00:00:00', '2024-01-19 00:00:00', '2024-01-18 11:15:47', '2024-01-18 14:20:59', 'Tem outra loja que faz, verá o orçamento.', '0', 0),
(145, 'Academia OMNI', '2024-01-18 00:00:00', '2024-01-19 00:00:00', '2024-01-18 11:33:37', '2024-01-18 19:42:49', 'Realizada troca de tela - LG piscando', '0', 0),
(146, 'Big Box Península', '2024-01-22 00:00:00', '2024-01-23 00:00:00', '2024-01-19 12:00:39', '2024-01-22 18:55:52', 'Responsáveis em reunião, instalação não autorizada.', '0', 1),
(147, 'Big Box Península', '2024-01-23 00:00:00', '2024-01-24 00:00:00', '2024-01-19 12:00:53', '2024-01-24 11:26:14', 'Instalação concluída', '0', 1),
(148, 'Big Box Noroeste - Inspeção', '2024-01-25 00:00:00', '2024-01-26 00:00:00', '2024-01-19 15:53:37', '2024-01-25 15:51:57', 'Fazer vistoria para instalação', '0', 0),
(149, 'CNI - Roberto Simonsen Elevador', '2024-01-22 00:00:00', '2024-01-23 00:00:00', '2024-01-22 11:51:00', '2024-01-22 14:12:14', 'Placa de vídeo bugou resolução.', '0', 1),
(150, 'Pizza Hut - Águas Claras', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-22 11:57:18', '2024-01-24 19:29:23', 'Tinham retirado antena.', '0', 0),
(151, 'Big Box 208 Norte', '2024-01-22 00:00:00', '2024-01-23 00:00:00', '2024-01-22 11:57:46', '2024-01-22 14:11:56', 'Placa de rede travada.', '0', 0),
(153, 'Big Box 413', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-23 11:14:28', '2024-01-24 14:27:03', 'Máquina travada e uma tela queimada.', '0', 0),
(154, 'Fit One Cruzeiro', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-24 11:26:45', '2024-01-24 19:28:23', 'Tela reiniciando, após muito tempo estabiliza.', '0', 0),
(155, 'Malunga Lago Sul', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-24 11:26:58', '2024-01-24 14:28:16', 'Input errado.', '0', 0),
(156, 'Big Box 208 Norte', '2024-01-25 00:00:00', '2024-01-26 00:00:00', '2024-01-24 11:27:11', '2024-01-25 15:51:48', 'Troca de máquina', '0', 0),
(157, 'Fit Park', '2024-01-25 00:00:00', '2024-01-26 00:00:00', '2024-01-24 11:30:10', '2024-01-25 15:52:12', 'Máquina com defeito - traga ao laboratório', '0', 0),
(158, 'Escada Herminio', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-24 12:07:46', '2024-01-24 19:28:31', 'Devolver escada', '0', 0),
(159, 'Big Box Paineras', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-24 12:13:31', '2024-01-24 19:28:50', 'Modem colocado.', '0', 0),
(160, 'Big Box 413 Sul', '2024-02-23 00:00:00', '2024-02-24 00:00:00', '2024-01-24 14:27:59', '2024-03-26 17:05:01', 'Troca de uma tela LG', '0', 0),
(161, 'Centro Empresarial Brasília', '2024-01-25 00:00:00', '2024-01-26 00:00:00', '2024-01-25 15:53:02', '2024-01-26 11:29:58', 'Andar 3 Bl. B, Andar 5', '0', 0),
(162, 'Centro Empresarial Brasília', '2024-01-26 00:00:00', '2024-01-27 00:00:00', '2024-01-26 11:30:29', '2024-01-26 14:23:31', 'Máquina 3. A colocada', '0', 0),
(163, 'Pier 21 Praça 02', '2024-01-26 00:00:00', '2024-01-27 00:00:00', '2024-01-26 11:30:47', '2024-01-26 14:23:42', 'Pau no HD', '0', 1),
(164, 'Sesi Lab', '2024-01-26 00:00:00', '2024-01-27 00:00:00', '2024-01-26 11:31:16', '2024-01-26 14:24:01', 'Sem acesso ao teamviewer ainda, informado para abrir chamado pra T.I', '0', 1),
(167, 'Big Box 408 Norte', '2024-01-30 00:00:00', '2024-01-31 00:00:00', '2024-01-26 11:34:14', '2024-01-31 11:42:50', 'Colocado suportes de telas', '0', 1),
(168, 'Big Box 408 Norte', '2024-02-02 00:00:00', '2024-02-03 00:00:00', '2024-01-26 11:34:28', '2024-02-05 11:25:11', 'Instalação', '0', 1),
(169, 'Armando Cirillo', '2024-02-07 00:00:00', '2024-02-08 00:00:00', '2024-01-26 11:34:58', '2024-02-08 12:48:36', 'Vistoria de como vai ser feito a instalação.', '0', 1),
(170, 'Uniceub', '2024-02-06 00:00:00', '2024-02-07 00:00:00', '2024-01-26 11:35:27', '2024-02-06 19:45:32', 'Vistoria, deixar todos online.', '0', 1),
(171, 'Big Box Península', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-26 11:43:24', '2024-01-31 11:42:15', 'Troca de máquina', '0', 1),
(172, 'Pizza Hut Asa Sul', '2024-01-26 00:00:00', '2024-01-27 00:00:00', '2024-01-26 11:43:50', '2024-01-29 11:40:30', 'Gerente desligou as telas', '0', 0),
(173, 'Pier 21 Praça 02', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-26 14:24:14', '2024-01-29 16:03:07', 'Trocada máquina', '0', 1),
(174, 'Centro Empresarial Brasília', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-26 14:25:49', '2024-01-29 16:02:26', 'Trocar máquina e tela 3. B e maquina 5. A', '0', 1),
(175, 'UDF Asa Sul', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-29 11:41:49', '2024-01-29 16:03:33', 'Praça em reforma, sem energia.', '0', 0),
(176, 'Felicittà', '2024-01-31 00:00:00', '2024-02-01 00:00:00', '2024-01-29 11:42:29', '2024-01-31 19:53:17', 'Tudo ok, porém subsolo torre A segue sem conexão. Marcar volta co teclado e acesso a casa de maquina', '0', 1),
(177, 'Black Fit Esteiras', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-29 11:43:14', '2024-01-31 11:42:25', 'Máquina travada', '0', 0),
(178, 'Pizza César Guará', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-29 16:34:08', '2024-01-31 11:42:34', 'Cliente sem internet', '0', 0),
(179, 'Superbom Guará', '2024-01-31 00:00:00', '2024-02-01 00:00:00', '2024-01-31 11:43:12', '2024-01-31 19:53:39', 'Máquina com problema', '0', 0),
(180, 'Compra de Material', '2024-01-31 00:00:00', '2024-02-01 00:00:00', '2024-01-31 11:43:24', '2024-01-31 19:52:30', 'Comprado capacitores, ferro e estanho de solda. Faltando cano e chave tiktak', '0', 0),
(181, 'Pier 21 Vertical', '2024-02-01 00:00:00', '2024-02-02 00:00:00', '2024-01-31 20:06:55', '2024-02-01 14:33:11', 'Máquina travada', '0', 1),
(182, 'Big Box Península', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-02-01 11:26:50', '2024-03-12 11:21:02', 'Troca de tela', '0', 1),
(183, 'Big Box 208 Norte', '2024-02-01 00:00:00', '2024-02-02 00:00:00', '2024-02-01 11:28:18', '2024-02-01 14:33:05', 'Máquina travada', '0', 0),
(185, 'Moto Checkin', '2024-02-01 00:00:00', '2024-02-02 00:00:00', '2024-02-01 19:57:31', '2024-02-01 19:57:31', 'levar moto para orçamento do conserto', '0', 0),
(186, 'Compra de material', '2024-02-01 00:00:00', '2024-02-02 00:00:00', '2024-02-01 19:57:49', '2024-02-01 19:57:49', 'finalizar compra de materiais para bigbox 408 norte', '0', 0),
(187, 'Suporte Hermínio', '2024-02-05 00:00:00', '2024-02-06 00:00:00', '2024-02-05 11:26:06', '2024-02-05 15:04:41', 'Buscar suporte', '0', 1),
(188, 'Fitmore', '2024-02-05 00:00:00', '2024-02-06 00:00:00', '2024-02-05 11:26:23', '2024-02-05 15:04:18', 'Internet do cliente apresenta defeito', '0', 0),
(189, 'Superbom QS 305 samambaia', '2024-02-05 00:00:00', '2024-02-06 00:00:00', '2024-02-05 11:31:08', '2024-02-05 15:04:35', 'HD com defeito', '0', 0),
(190, 'Big Box 408 Norte', '2024-02-05 00:00:00', '2024-02-06 00:00:00', '2024-02-05 15:05:07', '2024-02-06 19:44:47', 'Instalação', '0', 1),
(191, 'Black Fit', '2024-02-06 00:00:00', '2024-02-07 00:00:00', '2024-02-06 11:45:20', '2024-02-06 19:45:04', 'Trocar máquina esteiras', '0', 0),
(192, 'Fit One Cruzeiro', '2024-02-06 00:00:00', '2024-02-07 00:00:00', '2024-02-06 11:45:57', '2024-02-06 19:45:22', 'Trocar telas - 2 lgs', '0', 0),
(193, 'Uniceub', '2024-02-07 00:00:00', '2024-02-08 00:00:00', '2024-02-06 19:45:52', '2024-02-08 12:49:15', 'Vistoria finalizada. Pendências: 1 tela LG, 1 tela Samsung 300MX e 1 kramer Bloco 06.', '0', 0),
(194, 'Alameda', '2024-02-08 00:00:00', '2024-02-09 00:00:00', '2024-02-08 12:49:50', '2024-02-08 12:49:50', 'Máquina ou fonte com defeito', '0', 1),
(195, 'Felicittà Shopping', '2024-02-08 00:00:00', '2024-02-09 00:00:00', '2024-02-08 12:50:08', '2024-02-08 14:28:05', 'Ver teamviewer máquina subsolo torre A', '0', 1),
(196, 'Big Box qi 05 Lago Norte', '2024-02-07 00:00:00', '2024-02-08 00:00:00', '2024-02-08 12:50:29', '2024-02-08 12:50:29', 'Máquina travada', '0', 0),
(197, 'Armando Cirillo', '2024-02-08 00:00:00', '2024-02-09 00:00:00', '2024-02-08 12:50:46', '2024-02-08 19:36:59', 'Instalação cancelada devido falha de comunicação. Drywall e não alvenaria.', '0', 1),
(198, 'ACM Asa Sul', '2024-02-16 00:00:00', '2024-02-17 00:00:00', '2024-02-08 14:27:54', '2024-02-16 20:06:39', 'Defeito no 210', '0', 0),
(199, 'Alameda', '2024-02-09 00:00:00', '2024-02-10 00:00:00', '2024-02-08 16:09:01', '2024-02-14 13:53:04', 'Colocar máquina de volta', '0', 1),
(200, 'Bluefit Samambaia', '2024-02-09 00:00:00', '2024-02-10 00:00:00', '2024-02-08 16:09:13', '2024-02-14 13:53:14', 'Desmontar', '0', 1),
(201, 'Armando Cirillo', '2024-02-09 00:00:00', '2024-02-10 00:00:00', '2024-02-08 19:36:39', '2024-02-14 13:53:09', 'Instalação', '0', 0),
(202, 'World Gym', '2024-02-16 00:00:00', '2024-02-17 00:00:00', '2024-02-14 13:53:57', '2024-02-16 20:07:47', 'Desligadas.', '0', 0),
(203, 'O2 Fitness Lago Sul', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-14 13:54:47', '2024-02-16 11:21:36', 'Offline', '0', 0),
(204, 'Big Box 301 sudoeste', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:55:22', '2024-02-15 11:26:20', 'Má conexão', '0', 0),
(205, 'Steakbull lago sul', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-14 13:55:44', '2024-02-16 11:21:53', 'Pendenciado - voltar para verificar toda a rede', '0', 0),
(206, 'Academia inmove', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-14 13:56:32', '2024-02-16 11:21:29', 'offline', '0', 0),
(207, 'Big Box 402 Norte', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:56:56', '2024-02-15 11:26:46', 'offline', '0', 0),
(208, 'Big box 208 norte', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:58:18', '2024-02-15 11:26:05', 'Recuperação do hd', '0', 0),
(209, 'Big box 310 norte', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:58:39', '2024-02-15 11:26:40', 'Má conexão', '0', 0),
(210, 'Big box 106 norte', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:59:10', '2024-02-15 11:25:52', 'Internet do cliente apresenta defeito', '0', 0),
(211, 'Master Gym - Gama', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-02-15 11:29:41', '2024-02-19 19:37:15', 'Trocou a senha da internet', '0', 0),
(212, 'Runway Sudoeste Escritório', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-15 11:31:16', '2024-02-15 15:54:11', 'Internet do cliente apresentava defeito', '0', 0),
(213, 'Big Box 208 Norte', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-15 11:32:33', '2024-02-15 15:53:52', 'Devolver maquina', '0', 1),
(214, 'SteakBull', '2024-02-16 00:00:00', '2024-02-17 00:00:00', '2024-02-16 11:22:11', '2024-02-16 20:07:31', 'Adicionado switch e trocado receivers discabo 2.0 pelo 4.0', '0', 0),
(215, 'Julio Adnet', '2024-02-16 00:00:00', '2024-02-17 00:00:00', '2024-02-16 11:26:23', '2024-02-16 20:07:06', 'Teamviewer fechado e configurações feitas na máquina que pedia f1.', '0', 0),
(216, 'Água Vida', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-02-19 11:28:53', '2024-02-19 19:35:25', 'Energia sem fase, esperar retorno.', '0', 0),
(217, 'ACM Asa Sul', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 11:29:21', '2024-02-21 11:48:31', 'Tela com problema e maquina travada', '0', 0),
(218, 'Pizza Hut Águas Claras', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-02-19 11:29:49', '2024-02-19 19:38:12', 'Pendencia - maquina ou fonte', '0', 0),
(219, 'Pier 21', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 11:31:20', '2024-02-21 11:49:26', 'Telas sem energia; Máquina da tela 75 no pau', '0', 1),
(220, 'Academia omni', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-02-19 11:32:52', '2024-02-19 19:34:44', 'Pendenciado - levar testador de cabo', '0', 0),
(221, 'Black Fit Esteiras', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 15:59:35', '2024-02-21 11:50:24', 'Troca de maquina', '0', 1),
(222, 'Academia Omni', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 21:00:51', '2024-02-21 11:48:12', 'Ainda fora', '0', 1),
(223, 'Fit one cruzeiro', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-19 21:01:07', '2024-02-21 20:58:35', '2 telas fora', '0', 0),
(224, 'Big box paineras', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 21:02:01', '2024-02-21 11:48:59', 'Problema na maquina ou sender ou switch', '0', 0),
(225, 'Pizza Hut Águas Claras', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-20 11:36:47', '2024-02-21 11:49:41', 'Máquina de volta; Internet do cliente com defeito', '0', 0),
(226, 'Academia OMNI', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 11:50:05', '2024-02-21 20:57:52', 'Voltar discabo com cabo certo', '0', 1),
(227, 'Compra de máquinas', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 11:51:19', '2024-02-21 20:58:14', 'Comprar máquinas Taguatinga', '0', 1),
(228, 'Big Box Paineras', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 11:52:24', '2024-02-21 20:58:03', 'Troca de maquina', '0', 1),
(229, 'Shopping Metrópoles', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 11:53:03', '2024-02-21 20:59:03', 'Máquina offline', '0', 0),
(230, 'Uniceub Bloco 2 Shaft', '2024-02-23 00:00:00', '2024-02-24 00:00:00', '2024-02-21 11:53:30', '2024-03-26 17:05:15', 'Máquina offline', '0', 0),
(231, 'Julio Adnet', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 17:33:54', '2024-02-21 20:58:57', 'Primeira tela offline', '0', 0),
(232, 'Pier 21', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-21 20:59:20', '2024-02-23 11:30:15', 'Troca de máquina e placa de vídeo da máquina vertical', '0', 1),
(234, 'Acqua Sul', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-21 20:59:54', '2024-02-23 11:29:13', 'Ver se ja pode instalar', '0', 0),
(235, 'Aquafan', '2024-02-27 00:00:00', '2024-02-28 00:00:00', '2024-02-21 21:00:05', '2024-02-28 10:53:47', 'Ver se ja pode instalar', '0', 0),
(236, 'Pizza César Guará', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-22 11:35:00', '2024-02-23 11:30:28', 'Pendencia - troca de tela', '0', 0),
(237, 'One Way Guará', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-22 11:35:13', '2024-02-23 11:29:58', 'Dono não estava presente', '0', 0),
(238, 'Fit One Cruzeiro', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-22 11:35:25', '2024-02-23 11:29:42', 'Troca de 2 receiver discabo', '0', 0),
(239, 'AcquaSul', '2024-02-27 00:00:00', '2024-02-28 00:00:00', '2024-02-23 11:29:29', '2024-02-28 10:53:41', 'Retirada de equipamentos', '0', 1),
(240, 'UDF Asa Sul', '2024-02-23 00:00:00', '2024-02-24 00:00:00', '2024-02-23 11:31:44', '2024-03-26 17:05:08', 'Máquina offline, ver se terminaram obras', '0', 0),
(241, 'Pizza Cesar Guará (Tarde)', '2024-02-26 00:00:00', '2024-02-27 00:00:00', '2024-02-23 11:50:37', '2024-02-28 10:53:31', 'Verificar conexao com o teamviewer', '0', 0),
(242, 'One Way (Manhã)', '2024-02-26 00:00:00', '2024-02-27 00:00:00', '2024-02-23 11:50:57', '2024-02-28 10:53:26', 'Maquina offline', '0', 0),
(243, 'Centro Empresarial Brasília', '2024-02-26 00:00:00', '2024-02-27 00:00:00', '2024-02-26 10:38:10', '2024-02-28 10:53:20', 'Andar 5 Bl. A, Andar 8, Andar 7 e Andar 3 Bl. B', '0', 1),
(244, 'Pizza Hut Águas (Tarde)', '2024-02-26 00:00:00', '2024-02-27 00:00:00', '2024-02-26 10:39:37', '2024-02-28 10:53:36', 'Verificar conexao', '0', 0),
(245, 'CEB', '2024-02-27 00:00:00', '2024-02-28 00:00:00', '2024-02-27 11:03:38', '2024-02-28 10:53:52', 'andar 8', '0', 1),
(246, 'superbom qs 106 samambaia', '2024-02-27 00:00:00', '2024-02-28 00:00:00', '2024-02-27 11:05:37', '2024-02-28 10:54:04', 'Informar ti do superbom', '0', 0),
(248, 'Bar lampiao', '2024-02-28 00:00:00', '2024-02-29 00:00:00', '2024-02-28 11:00:40', '2024-03-04 11:31:50', 'offline 1 dia', '0', 0),
(249, 'World Gym', '2024-02-28 00:00:00', '2024-02-29 00:00:00', '2024-02-28 11:01:53', '2024-03-04 11:31:55', 'Maquina off', '0', 1),
(250, 'Alameda', '2024-02-29 00:00:00', '2024-03-01 00:00:00', '2024-02-29 11:18:46', '2024-03-04 11:32:02', 'Tela apagada', '0', 1),
(251, 'Bonamix Samambaia', '2024-02-29 00:00:00', '2024-03-01 00:00:00', '2024-02-29 11:19:30', '2024-03-04 11:32:07', 'maq offline', '0', 0),
(252, 'superbom qs 305', '2024-02-29 00:00:00', '2024-03-01 00:00:00', '2024-02-29 11:19:52', '2024-03-04 11:32:13', 'fora', '0', 0),
(253, 'Alameda', '2024-03-01 00:00:00', '2024-03-02 00:00:00', '2024-03-04 11:32:35', '2024-03-04 11:32:35', 'Troca de tela', '0', 0),
(255, 'One Way Guará', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-04 11:35:27', '2024-03-05 16:19:34', 'Colocar máquina nova', '0', 1),
(256, 'Fitmore', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-04 11:35:47', '2024-03-05 16:18:21', 'Local em reforma', '0', 0),
(257, 'Pier 21 - Corredor', '2024-03-04 00:00:00', '2024-03-05 00:00:00', '2024-03-04 11:36:40', '2024-03-05 11:24:11', 'Máquina fora, configurações de botão de energia', '0', 1),
(258, 'Academia Omni', '2024-03-06 00:00:00', '2024-03-07 00:00:00', '2024-03-04 11:38:06', '2024-03-07 11:41:46', 'Uma tela desligada', '0', 0),
(259, 'Big Box 208 Norte', '2024-03-04 00:00:00', '2024-03-05 00:00:00', '2024-03-04 11:38:31', '2024-03-05 11:23:36', 'Máquina travada, uma tela com defeito na imagem.', '0', 0),
(260, 'Malunga Gilberto Salomão', '2024-03-04 00:00:00', '2024-03-05 00:00:00', '2024-03-04 11:56:13', '2024-03-05 11:23:57', 'Internet apresenta defeito, sem pagamento', '0', 0),
(261, 'Uniceub Bloco 06', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-04 11:56:45', '2024-03-06 11:39:11', 'Maquina colocada de volta', '0', 1),
(263, 'Rosenilto', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-05 11:25:28', '2024-03-05 16:19:27', 'Assinar recibo', '0', 0),
(264, 'SteakBull', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-05 16:18:01', '2024-03-06 11:38:56', 'Colocado modem', '0', 1),
(265, 'Desinstalar Malunga', '2024-03-06 00:00:00', '2024-03-07 00:00:00', '2024-03-05 16:36:33', '2024-03-06 13:48:11', 'Retirada de Equipamentos', '0', 0),
(266, 'Pier 21', '2024-03-06 00:00:00', '2024-03-07 00:00:00', '2024-03-06 11:41:53', '2024-03-06 13:48:03', 'Modem travado', '0', 1),
(267, 'Big Box qi 05 Lago Norte', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-03-06 11:42:50', '2024-03-12 11:21:12', 'Máquina travada', '0', 0),
(268, 'Big Box 208 Norte', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-06 11:44:21', '2024-03-15 15:57:12', 'Máquina trocada e cabo de rede apertado', '0', 0),
(269, 'Aquafan', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-03-06 11:45:43', '2024-03-12 11:21:47', 'Retirada', '0', 0),
(270, 'Centro Empresarial Brasília', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-06 11:46:22', '2024-03-07 17:20:19', 'Andar 7, 5 e 8', '0', 1),
(271, 'Bar Lampião Guará', '2024-03-06 00:00:00', '2024-03-07 00:00:00', '2024-03-06 11:46:56', '2024-03-07 11:41:58', 'Máquina tinha perdido configuração', '0', 0),
(272, 'Armando Monteiro Neto', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-06 13:47:49', '2024-03-08 11:25:41', 'Elevador E, Elevador Roberto Simonsen', '0', 1),
(273, 'Pegar tv 75', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-07 11:27:16', '2024-03-07 17:20:26', 'pegar tv', '0', 1),
(274, 'Pegar moto', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-07 11:27:26', '2024-03-07 17:20:40', 'pegar tv', '0', 1),
(275, 'Retirada Malunga', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-07 11:27:44', '2024-03-08 11:25:52', 'retirar malunga', '0', 0),
(276, 'Led Oba V.P', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-03-07 17:21:38', '2024-03-12 11:21:26', 'send card travada', '0', 0),
(277, 'Retirar Malunga Asa Norte', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-03-08 12:15:11', '2024-03-12 11:21:33', 'Retirada de equipamentos', '0', 0),
(278, 'UDF Asa Sul', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-08 14:29:24', '2024-03-14 16:37:34', 'Praça desativada, agora está no subsolo', '0', 0),
(279, 'Big box 408 norte', '2024-03-11 00:00:00', '2024-03-12 00:00:00', '2024-03-12 11:22:06', '2024-03-12 11:22:06', 'instalação', '0', 1),
(280, 'Levar motos conserto', '2024-03-12 00:00:00', '2024-03-13 00:00:00', '2024-03-12 11:22:34', '2024-03-12 19:29:21', 'Levar motos para manutenção', '0', 1),
(281, 'Omni', '2024-03-12 00:00:00', '2024-03-13 00:00:00', '2024-03-12 11:22:49', '2024-03-12 19:29:33', 'Trocar tela', '0', 1),
(282, 'Buscar Motos conserto', '2024-03-12 00:00:00', '2024-03-13 00:00:00', '2024-03-12 11:23:02', '2024-03-12 19:29:00', 'buscar', '0', 1),
(284, 'One Way Salão', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-12 12:29:21', '2024-03-13 15:48:02', 'Máquina fora', '0', 1),
(285, 'Julio Adnet', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-12 19:30:12', '2024-03-13 15:47:47', 'Cliente informou tela sem sinal', '0', 0),
(286, 'Felicittà', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-12 19:30:36', '2024-03-13 15:47:37', 'Troca de tela', '0', 1),
(287, 'Malunga Asa Sul', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-12 19:32:05', '2024-03-14 16:36:21', 'Desmontar', '0', 0),
(288, 'Pizza Hut Águas Claras', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-13 11:52:39', '2024-03-14 18:57:55', 'Internet do cliente', '0', 0),
(289, 'Big Box 508 Asa Sul', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-13 11:53:57', '2024-03-13 18:38:42', 'Internet do cliente apresenta defeito', '0', 0),
(291, 'Uniceub Bloco 10 Hits', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-13 12:07:04', '2024-03-13 18:38:23', 'Colocar internet.', '0', 0),
(292, 'Big Box QI 5 Lago Norte', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-13 18:40:35', '2024-03-15 15:57:24', 'Máquina trocada; Cliente sem internet', '0', 0),
(293, 'O2 Fitness', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-14 11:47:49', '2024-03-14 16:36:44', 'Máquina travada, retiraram 2 telas temporariamente', '0', 0),
(294, 'Big Box CN 01', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-14 11:48:09', '2024-03-14 18:57:45', 'Máquina travada', '0', 0),
(295, 'Big Box 402 Norte', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-15 11:39:19', '2024-03-18 11:32:57', 'Máquina offline 1 dia', '0', 0),
(296, 'Edifício União', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-15 11:40:07', '2024-03-18 19:32:34', 'Reiniciar modem', '0', 0),
(297, 'Julio Adnet Centro Clínico', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-15 11:40:40', '2024-03-18 11:33:23', 'Internet do cliente apresenta defeito', '0', 0),
(298, 'Deck Norte', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-15 11:41:03', '2024-03-15 15:57:57', 'Modem travado', '0', 0),
(299, 'Fiore', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-15 11:41:42', '2024-03-18 16:41:56', 'Máquina offline', '0', 0),
(300, 'Led  Oba Vicente Pires', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-18 11:35:34', '2024-03-18 16:41:31', 'Offline 3 dias', '0', 0),
(303, 'Assis Chateaubriand Torre A', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-18 11:50:08', '2024-03-19 14:56:50', 'Modem, hdmi, uma pendência: tela lg led', '0', 0),
(304, 'Uniceub Campus Taguatinga', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-18 11:50:24', '2024-03-20 16:37:07', 'Modem reiniciado', '0', 0),
(307, 'Pier 21', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-18 11:52:06', '2024-03-19 14:57:00', 'Elevador e corredor', '0', 0),
(308, 'Deck Norte', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-18 11:52:54', '2024-03-19 18:31:43', 'Modem', '0', 0),
(309, 'Espaço 115', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-18 11:53:40', '2024-03-19 18:31:50', 'Modem', '0', 0),
(310, 'Julio Adnet', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-18 16:42:45', '2024-03-18 19:32:55', 'Máquina trocada e outra iniciada, trocar maquina', '0', 0),
(311, 'CEB', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-18 16:46:20', '2024-03-20 18:46:03', 'Modem bloco b', '0', 0),
(313, 'Big Box 512 Sul', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:45:51', '2024-03-19 14:57:21', 'Fonte do 104 TNT', '0', 0),
(314, 'Big Box 211 Norte', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:47:20', '2024-03-19 18:31:17', 'Modem', '0', 0),
(315, 'Fit Park', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:49:08', '2024-03-19 18:31:57', 'Modem', '0', 0),
(316, 'Assis Chateubriand', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-19 11:49:38', '2024-03-20 18:46:10', 'Trocar tela', '0', 0),
(318, 'Shopping Metropoles', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:50:47', '2024-03-19 18:32:12', 'Máquina offline 2 dias', '0', 0),
(319, 'Julio Adnet Academia', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-19 11:52:01', '2024-03-20 16:36:57', 'Máquina trocada', '0', 0),
(320, 'Big Box 208 Norte', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:52:34', '2024-03-19 18:31:07', 'Maquina travada', '0', 0),
(321, 'Big Box 402 Norte', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:54:15', '2024-03-19 18:31:36', 'Modem', '0', 0),
(322, 'I9 Fit', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-19 14:57:37', '2024-03-20 16:36:48', 'Sem energia', '0', 0),
(323, 'Upis Planaltina', '2024-03-21 00:00:00', '2024-03-22 00:00:00', '2024-03-20 11:43:10', '2024-03-22 11:31:18', 'Pendencia: Troca de maquina, 1 tela queimada', '0', 1),
(324, 'CNI', '2024-03-21 00:00:00', '2024-03-22 00:00:00', '2024-03-20 11:43:55', '2024-03-22 11:30:59', 'Sala Aline', '0', 1),
(325, 'One Way Salão', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-20 18:47:23', '2024-03-22 14:18:45', 'Modem', '0', 0),
(326, 'UNICEUB Bl 09 Shaft', '2024-03-21 00:00:00', '2024-03-22 00:00:00', '2024-03-20 18:47:57', '2024-03-22 11:31:05', 'Fora 2 dias', '0', 0),
(327, 'Armando Cirillo', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-22 11:31:33', '2024-03-22 14:18:28', 'Modem', '0', 0),
(328, 'Bodystation', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-22 11:31:43', '2024-03-22 14:18:39', 'Academia fechada', '0', 0),
(329, 'Sesi Lab', '2024-03-25 00:00:00', '2024-03-26 00:00:00', '2024-03-22 11:37:53', '2024-03-25 19:46:11', 'Colocar modem', '0', 0),
(330, 'Academia Inmove', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-22 14:18:17', '2024-03-22 14:18:17', 'Modem desconfigurado e sem internet', '0', 0),
(335, 'Água Vida', '2024-03-25 00:00:00', '2024-03-26 00:00:00', '2024-03-25 12:24:47', '2024-03-25 14:59:12', 'Mudou internet', '0', 0),
(337, 'Black Fit Esteiras', '2024-03-25 00:00:00', '2024-03-26 00:00:00', '2024-03-25 12:38:42', '2024-03-25 14:59:16', 'Offline 1 dia', '0', 0),
(338, 'Black Fit', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 11:28:17', '2024-03-26 18:03:53', 'Trocar maquina', '0', 1),
(339, 'Shopping Felicittá elevador torre A', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 11:30:25', '2024-03-26 16:06:18', 'Máquina offline 2 dias', '0', 0),
(341, 'Big Box 402 Norte', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 11:32:44', '2024-03-26 18:03:45', 'Reiniciar modem', '0', 0),
(342, 'Uniceub Bloco 01', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 11:35:13', '2024-03-26 18:14:17', 'modem', '0', 0),
(343, 'Assis Chateaubriand', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 12:03:38', '2024-03-26 18:03:33', 'Reiniciar modem', '0', 0),
(344, 'Big Box', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 11:36:25', '2024-03-27 14:06:39', 'Verificar para onde irão as telas', '0', 1),
(346, 'Pier 21', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 11:36:51', '2024-03-27 14:06:49', 'Reiniciar modem', '0', 0),
(347, 'I9 Fit', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 11:42:46', '2024-03-28 11:13:22', 'Modem', '0', 0),
(348, 'Pizza Hut Águas', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 11:43:08', '2024-03-28 11:12:06', 'troca de maquina', '0', 0),
(349, 'One Way Guará', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 12:09:35', '2024-03-27 14:06:57', 'Modem', '0', 0),
(350, 'Fit Park', '2024-03-28 00:00:00', '2024-03-29 00:00:00', '2024-03-28 11:25:04', '2024-03-28 15:02:02', 'Reiniciar modem', '0', 0),
(351, 'Centro Empresarial Brasília', '2024-03-28 00:00:00', '2024-03-29 00:00:00', '2024-03-28 11:25:29', '2024-03-28 14:11:48', 'Reiniciar modem Bloco B, Andar 5 Bl. A, Hall [A], Andar 3 Bl. A, Andar 8 e 4 Bl. A', '0', 0),
(353, 'Espaço 115', '2024-03-28 00:00:00', '2024-03-29 00:00:00', '2024-03-28 11:26:10', '2024-03-28 15:01:58', 'Reiniciar Modem', '0', 0),
(354, 'LED Diários', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-28 15:01:06', '2024-03-28 15:01:10', 'Modem', '0', 0),
(355, 'LED Diários', '2024-03-28 00:00:00', '2024-03-29 00:00:00', '2024-03-28 15:01:20', '2024-03-28 15:01:53', 'Modem', '0', 0),
(356, 'LED Diários', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-28 15:01:31', '2024-03-28 15:01:31', 'Modem', '0', 0),
(357, 'LED Diários', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-28 15:01:43', '2024-03-28 15:01:43', 'Modem', '0', 0),
(358, 'LED Diários', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-28 15:02:11', '2024-03-28 15:02:11', 'Modem', '0', 0),
(359, 'Alameda - Pilar', '2024-04-01 00:00:00', '2024-04-02 00:00:00', '2024-04-01 12:31:24', '2024-04-01 14:06:15', 'Tela LG LED queimado', '0', 1),
(360, 'Led Oba Vicente Pires', '2024-04-01 00:00:00', '2024-04-02 00:00:00', '2024-04-01 12:31:36', '2024-04-01 14:26:52', 'Reiniciar modem', '0', 0),
(362, 'Fiore', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-01 12:37:40', '2024-04-02 14:28:54', 'Reiniciar modem', '0', 0),
(363, 'Felicittá Vertical', '2024-04-01 00:00:00', '2024-04-02 00:00:00', '2024-04-01 12:42:10', '2024-04-01 20:45:19', 'Modem travado', '0', 0),
(364, 'I9 Fit', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-01 12:42:28', '2024-04-02 18:36:49', 'Modem', '0', 0),
(365, 'Uniceub Campus Taguatinga', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-01 12:43:56', '2024-04-02 18:37:09', 'Modem', '0', 0),
(366, 'Alameda Pilar - LG', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-01 14:06:32', '2024-04-02 14:28:43', 'Trocar duas telas LG', '0', 0),
(367, 'UDF Asa Sul', '2024-04-01 00:00:00', '2024-04-02 00:00:00', '2024-04-01 14:30:13', '2024-04-01 20:45:12', 'Retirada de equipamento Campus 01', '0', 0),
(368, 'Pizza Hut Águas Claras', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-02 11:32:38', '2024-04-02 18:36:59', 'Configuração de tela', '0', 0),
(373, 'Pier 21', '2024-04-03 00:00:00', '2024-04-04 00:00:00', '2024-04-02 16:22:12', '2024-04-03 14:10:11', 'Modem', '0', 1),
(375, 'Superbom EQNL', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-02 16:23:33', '2024-04-02 19:00:13', 'Máquina fora', '0', 0),
(377, 'Armando Monteiro Neto', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-02 18:37:33', '2024-04-02 18:37:33', 'Elevador C, modem', '0', 0),
(380, 'CNI Academia (TeamViewer)', '2024-04-03 00:00:00', '2024-04-04 00:00:00', '2024-04-03 11:27:48', '2024-04-03 18:33:30', 'Teamviewer perdeu atribuiçao', '0', 0),
(381, 'Big Box 408 Norte (TeamViewer)', '2024-04-03 00:00:00', '2024-04-04 00:00:00', '2024-04-03 11:28:19', '2024-04-03 14:10:21', 'Teamviewer estava desinstalado', '0', 0),
(382, 'One Way Salão', '2024-04-04 00:00:00', '2024-04-05 00:00:00', '2024-04-04 11:19:29', '2024-04-04 16:27:54', 'Config. modem', '0', 0),
(383, 'Felicittà elevador Torre A', '2024-04-04 00:00:00', '2024-04-05 00:00:00', '2024-04-04 11:20:02', '2024-04-04 16:27:47', 'Config. modem', '0', 0),
(384, 'Centro Empresarial Brasília Torre B', '2024-04-04 00:00:00', '2024-04-05 00:00:00', '2024-04-04 11:20:42', '2024-04-04 18:55:49', 'Modem', '0', 0),
(385, 'SteakBull', '2024-04-05 00:00:00', '2024-04-06 00:00:00', '2024-04-04 16:28:09', '2024-04-05 14:59:05', 'Config. modem', '0', 0),
(386, 'Pier 21', '2024-04-05 00:00:00', '2024-04-06 00:00:00', '2024-04-04 16:48:04', '2024-04-05 14:59:00', 'Config. modem', '0', 0),
(387, 'Fit Park', '2024-04-05 00:00:00', '2024-04-06 00:00:00', '2024-04-04 19:21:53', '2024-04-05 14:58:55', 'Config. modem', '0', 0),
(388, 'Ed. União', '2024-04-05 00:00:00', '2024-04-06 00:00:00', '2024-04-04 19:22:01', '2024-04-05 14:58:48', 'Config. modem', '0', 0),
(389, 'UDF Campus 02', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-05 11:32:13', '2024-04-09 14:19:24', 'Configuração do Modem', '0', 0),
(390, 'Painel Taquari - Acompanhar', '2024-04-08 00:00:00', '2024-04-09 00:00:00', '2024-04-05 12:12:35', '2024-04-09 11:40:42', 'Ledwave não compareceu', '0', 0);
INSERT INTO `bookings` (`id`, `title`, `start_date`, `end_date`, `created_at`, `updated_at`, `obs`, `ativo`, `prioridade`) VALUES
(391, 'Big Box 208 Norte', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-08 11:36:00', '2024-04-09 18:35:47', 'Configuração do Modem', '0', 0),
(392, 'Felicittà - Vertical / Videowall', '2024-04-08 00:00:00', '2024-04-09 00:00:00', '2024-04-08 11:37:36', '2024-04-08 16:03:06', 'Modem', '0', 1),
(393, 'Shopping Metrópoles', '2024-04-08 00:00:00', '2024-04-09 00:00:00', '2024-04-08 11:38:06', '2024-04-08 16:03:12', 'Modem', '0', 1),
(394, 'Upis Asa Sul', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-08 16:03:26', '2024-04-09 14:19:17', 'Configuração do Modem', '0', 0),
(395, 'Centro Empresarial Brasília', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-08 17:28:58', '2024-04-09 14:18:51', 'Faltando: Troca de modem do bloco B e máquina hall do A', '0', 0),
(396, 'Uniceub', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-09 11:40:31', '2024-04-09 18:35:00', 'Modem', '0', 0),
(397, 'CNI - Roberto Elevador', '2024-04-10 00:00:00', '2024-04-11 00:00:00', '2024-04-09 11:41:12', '2024-04-10 18:07:05', 'Pedir para reiniciar modem', '0', 0),
(398, 'Centro Empresarial Brasília', '2024-04-10 00:00:00', '2024-04-11 00:00:00', '2024-04-09 14:20:00', '2024-04-10 14:26:25', 'Levar modem e máquina com cabo de força', '0', 0),
(399, 'Uniceub', '2024-04-10 00:00:00', '2024-04-11 00:00:00', '2024-04-09 18:35:35', '2024-04-10 18:06:44', 'Bloco 02: Kramer, Pier: Levar escada, maquina desligada', '0', 1),
(400, 'Big Box 208 Norte', '2024-04-15 00:00:00', '2024-04-16 00:00:00', '2024-04-09 18:36:06', '2024-04-15 15:33:06', 'Telas todas ok', '0', 0),
(401, 'Portal Fitbox 1º Andar', '2024-04-10 00:00:00', '2024-04-11 00:00:00', '2024-04-10 11:18:20', '2024-04-10 14:26:16', 'Offline 1 dia', '0', 0),
(402, 'Armando - Carro F', '2024-04-12 00:00:00', '2024-04-13 00:00:00', '2024-04-10 11:18:45', '2024-04-15 11:19:59', 'Offline 1 dia', '0', 0),
(403, 'Alameda Shopping', '2024-04-11 00:00:00', '2024-04-12 00:00:00', '2024-04-11 11:34:32', '2024-04-11 14:08:33', 'Tela desligada', '0', 0),
(404, 'Assis Bl 01 SIC', '2024-04-11 00:00:00', '2024-04-12 00:00:00', '2024-04-11 11:37:10', '2024-04-11 22:04:05', 'Offline', '0', 0),
(405, 'Superbom São Sebastião', '2024-04-11 00:00:00', '2024-04-12 00:00:00', '2024-04-11 11:37:43', '2024-04-11 11:44:56', 'Aberto chamado para T.I do Superbom', '0', 0),
(406, 'Big Box 408 Norte', '2024-04-15 00:00:00', '2024-04-16 00:00:00', '2024-04-11 16:53:38', '2024-04-15 15:33:45', 'Troca de tela efetuada', '0', 0),
(407, 'Deck Norte', '2024-04-12 00:00:00', '2024-04-13 00:00:00', '2024-04-11 16:54:32', '2024-04-15 12:02:17', 'Modem', '0', 0),
(408, 'Pizza hut Asa sul', '2024-04-12 00:00:00', '2024-04-13 00:00:00', '2024-04-11 16:55:02', '2024-04-15 11:20:16', 'Pendencia: Só está dando imagem em uma tela', '0', 0),
(409, 'Steakbull', '2024-04-15 00:00:00', '2024-04-16 00:00:00', '2024-04-11 16:55:13', '2024-04-15 19:48:28', 'Pendencia: Trocar aavaras', '0', 0),
(411, 'Pizza Hut Asa Sul', '2024-04-15 00:00:00', '2024-04-16 00:00:00', '2024-04-15 11:20:30', '2024-04-15 19:47:56', 'Pendencia: Só está dando imagem em uma tela', '0', 1),
(412, 'Big Box 105 Sudoeste', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 11:23:34', '2024-04-16 15:08:12', 'Pendência: Levar 104 tnt', '0', 0),
(413, 'Big Box CN 01', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 11:23:46', '2024-04-16 13:01:28', 'Máquina travada, pendência: 1 fonte tnt', '0', 0),
(415, 'Pizza Hut Asa Sul', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 19:48:13', '2024-04-16 18:32:37', 'Pendencia: trocar maquina', '0', 1),
(416, 'Steakbull', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 19:48:47', '2024-04-16 20:45:19', 'Trocados Aavara por Discabos, Pendencia: Trocar maquina', '0', 1),
(417, 'Pegar Mini-pc Taguatinga', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 19:49:15', '2024-04-16 15:09:15', 'Fazer a compra do mini pc.', '0', 1),
(418, 'LED Aeroporto 10:30', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 19:52:13', '2024-04-16 16:15:07', 'Problema na configuração da bios e da TB', '0', 0),
(420, 'Big Box CN 01', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-16 13:01:43', '2024-04-19 15:11:13', 'Trocar fonte tnt', '0', 0),
(421, 'Big Box 105 Sudoeste', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-16 15:08:22', '2024-04-19 15:11:04', 'Pendência: Levar 104 tnt', '0', 0),
(423, 'SteakBull', '2024-04-17 00:00:00', '2024-04-18 00:00:00', '2024-04-16 20:45:34', '2024-04-18 11:42:22', 'Pendencia: Trocar maquina', '0', 1),
(424, 'LED Oba Taquari 10h', '2024-04-17 00:00:00', '2024-04-18 00:00:00', '2024-04-17 11:15:07', '2024-04-18 11:42:11', 'Acompanhar rosenilton', '0', 1),
(425, 'Assis Torre A', '2024-04-17 00:00:00', '2024-04-18 00:00:00', '2024-04-17 11:26:54', '2024-04-18 11:42:05', 'Configurar modem', '0', 0),
(426, 'Pier 21 elevador', '2024-04-17 00:00:00', '2024-04-18 00:00:00', '2024-04-17 12:05:16', '2024-04-18 11:42:17', 'Trocar modem', '0', 0),
(427, 'SteakBull', '2024-04-18 00:00:00', '2024-04-19 00:00:00', '2024-04-18 11:42:36', '2024-04-18 17:02:56', 'Organizado cabos, switch e telas', '0', 1),
(428, 'Big Box Paineras', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-18 11:42:54', '2024-04-19 15:11:38', 'Máquina offline', '0', 0),
(429, 'Big Box Sibéria', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-18 11:43:08', '2024-04-19 18:21:52', 'Uma tela com defeito samsung borda fina', '0', 0),
(431, 'Uniceub', '2024-04-18 00:00:00', '2024-04-19 00:00:00', '2024-04-18 11:51:33', '2024-04-18 19:22:54', 'Reitoria, Professores e RH Bloco 01, Professores Bl 03, Bloco 01, 05 e 12 Shaft', '0', 0),
(432, 'Zimbrus Asa Sul', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-18 15:39:18', '2024-04-19 18:22:07', 'Tela funçao nao suportada', '0', 0),
(433, 'Centro Clinico Julio Adnet', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-19 11:39:54', '2024-04-19 18:22:01', 'Maquina off 1 dia', '0', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `computador`
--

DROP TABLE IF EXISTS `computador`;
CREATE TABLE IF NOT EXISTS `computador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `observacoes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
CREATE TABLE IF NOT EXISTS `equipamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) NOT NULL,
  `voltagem` varchar(20) NOT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

DROP TABLE IF EXISTS `plano`;
CREATE TABLE IF NOT EXISTS `plano` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `plano`
--

INSERT INTO `plano` (`id`, `nome`) VALUES
(1, 'Básico'),
(2, 'Mensal'),
(3, 'Anual'),
(4, 'Acesso Total');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ponto`
--

DROP TABLE IF EXISTS `ponto`;
CREATE TABLE IF NOT EXISTS `ponto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `nome_responsavel` varchar(100) DEFAULT NULL,
  `contato_responsavel` varchar(100) DEFAULT NULL,
  `id_computador` int NOT NULL,
  `id_tela` int NOT NULL,
  `id_equipamento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_computador` (`id_computador`) USING BTREE,
  KEY `id_tela` (`id_tela`) USING BTREE,
  KEY `id_equipamento` (`id_equipamento`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ponto_equipamento`
--

DROP TABLE IF EXISTS `ponto_equipamento`;
CREATE TABLE IF NOT EXISTS `ponto_equipamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ponto` int NOT NULL,
  `id_computador` int NOT NULL,
  `id_tela` int NOT NULL,
  `id_equipamento` int NOT NULL,
  `quantidade_computador` varchar(200) NOT NULL,
  `quantidade_tela` varchar(200) NOT NULL,
  `quantidade_equipamento` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ponto` (`id_ponto`),
  KEY `id_computador` (`id_computador`),
  KEY `id_tela` (`id_tela`),
  KEY `id_equipamento` (`id_equipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

DROP TABLE IF EXISTS `sala`;
CREATE TABLE IF NOT EXISTS `sala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sala` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descricao` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `arquivo` varchar(100) DEFAULT NULL,
  `id_andar` int NOT NULL,
  `patrocinado` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`id`, `sala`, `descricao`, `arquivo`, `id_andar`, `patrocinado`) VALUES
(86, '1', 'Clinica Oftalmo', '1708507793.png', 23, 1),
(87, '22', 'Contabilidade Jean', '1710836385.jpg', 22, 1),
(88, '33', 'Contabilidade', '1710902563.png', 23, 0),
(89, '310', 'Empresarial Contas', '1710836210.png', 22, 1),
(91, 'Sala Empresarial', 'Atendimento Empresarial Especializado', '1710879306.png', 27, 1),
(93, '3213', '323', '1710880585.jpg', 27, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tela`
--

DROP TABLE IF EXISTS `tela`;
CREATE TABLE IF NOT EXISTS `tela` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) NOT NULL,
  `tamanho` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `perfil` int NOT NULL DEFAULT '0',
  `id_plano` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_plano` (`id_plano`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `perfil`, `id_plano`) VALUES
(1, 'Raulisson', 'raulisson@gmail.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 1, 4);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `acl_acao`
--
ALTER TABLE `acl_acao`
  ADD CONSTRAINT `acl_acao_ibfk_1` FOREIGN KEY (`id_acl_controle`) REFERENCES `acl_controle` (`id`);

--
-- Limitadores para a tabela `acl_grupo_acao`
--
ALTER TABLE `acl_grupo_acao`
  ADD CONSTRAINT `acl_grupo_acao_ibfk_1` FOREIGN KEY (`id_acl_grupo`) REFERENCES `acl_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acl_grupo_acao_ibfk_2` FOREIGN KEY (`id_acl_acao`) REFERENCES `acl_acao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `acl_grupo_usuario`
--
ALTER TABLE `acl_grupo_usuario`
  ADD CONSTRAINT `acl_grupo_usuario_ibfk_1` FOREIGN KEY (`id_acl_grupo`) REFERENCES `acl_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acl_grupo_usuario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `ponto`
--
ALTER TABLE `ponto`
  ADD CONSTRAINT `ponto_ibfk_1` FOREIGN KEY (`id_computador`) REFERENCES `computador` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ponto_ibfk_2` FOREIGN KEY (`id_tela`) REFERENCES `tela` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ponto_ibfk_3` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamento` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `ponto_equipamento`
--
ALTER TABLE `ponto_equipamento`
  ADD CONSTRAINT `ponto_equipamento_ibfk_1` FOREIGN KEY (`id_ponto`) REFERENCES `ponto` (`id`),
  ADD CONSTRAINT `ponto_equipamento_ibfk_2` FOREIGN KEY (`id_computador`) REFERENCES `computador` (`id`),
  ADD CONSTRAINT `ponto_equipamento_ibfk_3` FOREIGN KEY (`id_tela`) REFERENCES `tela` (`id`),
  ADD CONSTRAINT `ponto_equipamento_ibfk_4` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamento` (`id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_plano`) REFERENCES `plano` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
