-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 02-Maio-2025 às 13:55
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
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `id_empresa` int DEFAULT NULL,
  `publico` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acl_grupo`
--

INSERT INTO `acl_grupo` (`id`, `nome`, `descricao`, `id_empresa`, `publico`) VALUES
(1, 'Administrador', 'Perfil administrador da empresa', 1, 0),
(2, 'Técnico', 'Tecnico para visualizar calendários.', 1, 0),
(3, 'Vendedor', 'Vendedores da empresa', 1, 0);

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
  `id_empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `atividade_empresa_fk` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=866 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `bookings`
--

INSERT INTO `bookings` (`id`, `title`, `start_date`, `end_date`, `created_at`, `updated_at`, `obs`, `ativo`, `prioridade`, `id_empresa`) VALUES
(1, 'Pier 21', '2023-12-04 00:00:00', '2023-12-05 00:00:00', '2023-12-07 22:08:15', '2023-12-08 17:44:51', 'Limpar telas', '0', NULL, 1),
(2, 'Malunga Lago Sul', '2023-12-04 00:00:00', '2023-12-05 00:00:00', '2023-12-07 22:08:52', '2023-12-08 17:44:57', 'Máquina Offline', '0', NULL, 1),
(3, 'LED Oba Taquari', '2023-12-05 00:00:00', '2023-12-06 00:00:00', '2023-12-07 22:10:29', '2023-12-08 17:44:37', 'Troca de fonte', '0', NULL, 1),
(4, 'Pizza César Guará', '2023-12-05 00:00:00', '2023-12-06 00:00:00', '2023-12-07 22:10:55', '2023-12-08 17:44:12', 'Máquina Offline', '0', NULL, 1),
(5, 'Malunga Sudoeste', '2023-12-05 00:00:00', '2023-12-06 00:00:00', '2023-12-07 22:11:20', '2023-12-08 17:44:31', 'Troca de máquina', '0', NULL, 1),
(6, 'Manutenção tela 75', '2023-12-05 00:00:00', '2023-12-06 00:00:00', '2023-12-07 22:11:41', '2023-12-08 17:44:22', 'Buscar tela 75', '0', NULL, 1),
(7, 'Manutenção tela 75', '2023-12-06 00:00:00', '2023-12-07 00:00:00', '2023-12-07 22:12:02', '2023-12-08 17:44:21', 'Buscar tela 75', '0', NULL, 1),
(8, 'OMNI', '2023-12-06 00:00:00', '2023-12-07 00:00:00', '2023-12-07 22:12:19', '2023-12-08 17:44:00', 'Uma tela desligada', '0', NULL, 1),
(10, 'Felicittá Videowall', '2023-12-06 00:00:00', '2023-12-07 00:00:00', '2023-12-07 22:12:51', '2023-12-08 17:44:05', 'Retirada do suporte', '0', NULL, 1),
(11, 'Armando Monteiro Neto', '2023-12-07 00:00:00', '2023-12-08 00:00:00', '2023-12-07 22:13:08', '2023-12-08 17:41:52', 'Trocar extensão elevador F', '0', NULL, 1),
(12, 'Steak Bull', '2023-12-07 00:00:00', '2023-12-08 00:00:00', '2023-12-07 22:14:19', '2023-12-08 17:46:23', 'Tres telas desligadas, precisando de um Avaara 5000', '0', NULL, 1),
(14, 'Instalação Big Box 408', '2023-12-08 00:00:00', '2023-12-09 00:00:00', '2023-12-07 22:15:19', '2023-12-08 21:40:07', 'Gerente não autorizou instalação, precisa estar alinhado com a ti, equipe de prevenção de perca, etc.', '0', NULL, 1),
(15, 'Compra de Material', '2023-12-07 00:00:00', '2023-12-08 00:00:00', '2023-12-07 22:15:28', '2023-12-08 17:46:16', 'Comprar parafusadeira', '0', NULL, 1),
(16, 'Academia World Gym', '2023-12-08 00:00:00', '2023-12-09 00:00:00', '2023-12-07 22:15:51', '2023-12-08 21:40:23', 'Um computador travou na inicialização - tela do meio', '0', NULL, 1),
(18, 'Lampião Gastrobar', '2023-12-13 00:00:00', '2023-12-14 00:00:00', '2023-12-07 22:18:16', '2023-12-13 18:48:25', 'Cliente está pedindo para conectar uma das maquinas à internet pessoal, pois a publica so liga as 16', '0', 1, 1),
(19, 'Academia Raia 10', '2023-12-08 00:00:00', '2023-12-09 00:00:00', '2023-12-07 22:44:47', '2023-12-08 17:46:43', 'Trocar tela - LG 42', '0', NULL, 1),
(20, 'Superbom Guará', '2023-12-11 00:00:00', '2023-12-12 00:00:00', '2023-12-08 14:54:47', '2023-12-12 14:36:50', 'Máquina offline', '0', 0, 1),
(21, 'SteakBull', '2023-12-08 00:00:00', '2023-12-09 00:00:00', '2023-12-08 14:58:29', '2023-12-08 17:47:05', 'Trocar transmissor e receptores', '0', NULL, 1),
(22, 'Pizza Hut Águas Claras', '2023-12-11 00:00:00', '2023-12-12 00:00:00', '2023-12-08 17:00:15', '2023-12-12 14:36:43', 'Instalação 9h - marcada com o eletricista', '0', 1, 1),
(23, 'Superbom QS 604', '2023-12-06 00:00:00', '2023-12-07 00:00:00', '2023-12-08 17:43:36', '2023-12-08 17:43:36', 'tela do açougue retirada', '0', NULL, 1),
(24, 'Felicittá', '2023-12-13 00:00:00', '2023-12-14 00:00:00', '2023-12-08 21:48:42', '2023-12-13 15:00:23', 'Instalação Videowall', '0', 1, 1),
(27, 'Big Box 105 Sudoeste', '2023-12-12 00:00:00', '2023-12-13 00:00:00', '2023-12-11 17:13:01', '2023-12-12 17:49:07', 'Máquina Travada', '0', 0, 1),
(28, 'Compra de material (bucha)', '2023-12-11 00:00:00', '2023-12-12 00:00:00', '2023-12-11 17:13:23', '2023-12-12 14:36:35', 'Comprar no sia', '0', 1, 1),
(29, 'Big box QI 05 Lago norte', '2023-12-12 00:00:00', '2023-12-13 00:00:00', '2023-12-12 14:42:22', '2023-12-12 17:48:54', 'OfflinE 1 dia', '0', 0, 1),
(30, 'Superbom Águas Claras', '2023-12-13 00:00:00', '2023-12-14 00:00:00', '2023-12-12 14:52:02', '2023-12-13 14:59:56', 'Máquina offline à 1 dia', '0', 0, 1),
(32, 'Retirada Dom Bosco Samambaia', '2023-12-12 00:00:00', '2023-12-13 00:00:00', '2023-12-12 15:14:42', '2023-12-13 12:42:38', 'Retirada de equipamentos, contrato cancelado', '0', NULL, 1),
(33, 'Felicittá', '2023-12-12 00:00:00', '2023-12-13 00:00:00', '2023-12-12 15:32:06', '2023-12-13 12:42:31', 'Levar duas telas para adiantar instalação na quarta', '0', NULL, 1),
(35, 'Felicittà', '2023-12-14 00:00:00', '2023-12-15 00:00:00', '2023-12-13 15:00:46', '2023-12-14 14:25:01', 'Instalação Videowall - finalizar', '0', 1, 1),
(36, 'Aquafan', '2023-12-13 00:00:00', '2023-12-14 00:00:00', '2023-12-13 15:01:03', '2023-12-14 12:06:23', 'Problema no cabo ou máquina - trouxe para testar', '0', 0, 1),
(37, 'Big Box 512 Sul', '2023-12-14 00:00:00', '2023-12-15 00:00:00', '2023-12-13 15:39:12', '2023-12-14 18:48:41', 'Máquina travada', '0', 0, 1),
(38, 'Aquafan', '2023-12-14 00:00:00', '2023-12-15 00:00:00', '2023-12-14 12:06:45', '2023-12-14 18:48:31', 'Cabo oxidado, realizado troca', '0', 0, 1),
(39, 'Posto Igrejinha Asa Sul', '2023-12-14 00:00:00', '2023-12-15 00:00:00', '2023-12-14 12:06:59', '2023-12-14 18:49:30', 'Máquina travada', '0', 0, 1),
(40, 'Runway Sudoeste - 75\"', '2023-12-15 00:00:00', '2023-12-16 00:00:00', '2023-12-14 15:55:23', '2023-12-15 14:36:30', 'Máquina Offline des do dia 13/12', '0', 0, 1),
(49, 'Alameda', '2023-12-15 00:00:00', '2023-12-16 00:00:00', '2023-12-15 12:48:13', '2023-12-15 13:30:40', 'Máquina liga 10 horas.', '0', 1, 1),
(51, 'Instalação BigBox', '2023-12-18 00:00:00', '2023-12-19 00:00:00', '2023-12-18 11:23:09', '2023-12-19 11:28:26', '3 suportes instalados', '0', 1, 1),
(53, 'Bonamix QR 122 - Caixas', '2023-12-18 00:00:00', '2023-12-19 00:00:00', '2023-12-18 11:24:36', '2023-12-18 13:35:14', 'Internet do cliente apresenta defeito.', '0', 0, 1),
(54, 'Malunga Lago Sul', '2023-12-19 00:00:00', '2023-12-20 00:00:00', '2023-12-18 11:26:06', '2023-12-19 13:22:35', 'Loja de mudança', '0', 0, 1),
(55, 'Shopping Felicittà videowall', '2023-12-18 00:00:00', '2023-12-19 00:00:00', '2023-12-18 11:26:20', '2023-12-18 13:35:29', 'Máquina estava travada, pico de energia.', '0', 1, 1),
(56, 'Big Box QI 11 Lago Sul', '2023-12-19 00:00:00', '2023-12-20 00:00:00', '2023-12-18 14:05:26', '2023-12-19 14:16:42', 'Máquina travada', '0', 0, 1),
(59, 'Felicittà Videowall', '2023-12-20 00:00:00', '2023-12-21 00:00:00', '2023-12-19 13:04:17', '2023-12-20 14:02:38', 'Efetuada troca de máquina', '0', 1, 1),
(61, 'Fausto e Manoel Sudoeste', '2023-12-20 00:00:00', '2023-12-21 00:00:00', '2023-12-20 12:58:16', '2023-12-20 14:02:59', 'Nenhum problema detectado. Telas de publicidade ok', '0', 0, 1),
(62, 'Painel perto da escada', '2023-12-20 00:00:00', '2023-12-21 00:00:00', '2023-12-20 14:24:41', '2023-12-21 11:36:38', 'Fazer ligar', '0', 0, 1),
(63, 'Pier 21', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2023-12-20 16:03:44', '2024-01-15 13:21:49', 'Efetuada troca de tela.', '0', 1, 1),
(64, 'Malunga Lago Sul', '2023-12-26 00:00:00', '2023-12-27 00:00:00', '2023-12-20 16:06:33', '2023-12-26 18:42:35', 'Ainda sem lugar para instalação de tela, sem ponto, etc..', '0', 1, 1),
(65, 'Big Box 301 Sudoeste', '2023-12-22 00:00:00', '2023-12-23 00:00:00', '2023-12-21 11:37:15', '2023-12-26 11:19:25', 'Tirar do ar para recolhimento dos caixas no natal', '0', 1, 1),
(66, 'Big Box 512 Sul', '2023-12-21 00:00:00', '2023-12-22 00:00:00', '2023-12-21 11:39:25', '2023-12-21 14:45:10', 'Troca de máquina', '0', 1, 1),
(67, 'Painel Correios', '2024-01-17 00:00:00', '2024-01-18 00:00:00', '2023-12-21 11:48:00', '2024-01-17 19:41:02', 'Faltando um cabo', '0', 0, 1),
(70, 'Alameda Shopping', '2023-12-26 00:00:00', '2023-12-27 00:00:00', '2023-12-21 12:34:14', '2023-12-26 14:46:46', 'Trocar configuração da Bios para ligar 9 horas', '0', 1, 1),
(72, 'Big Box QI 11 Lago Sul', '2023-12-26 00:00:00', '2023-12-27 00:00:00', '2023-12-21 15:09:32', '2023-12-26 18:42:45', 'Efetuada troca de máquina', '0', 0, 1),
(73, 'Entrega de Lembranças', '2023-12-21 00:00:00', '2023-12-22 00:00:00', '2023-12-21 15:28:16', '2023-12-22 11:22:01', 'Entregar na região Sudoeste e Cruzeiro', '0', 0, 1),
(74, 'Big Box 508 Sul', '2023-12-27 00:00:00', '2023-12-28 00:00:00', '2023-12-22 11:39:35', '2023-12-27 18:57:48', 'Máquina travada', '0', 0, 1),
(75, 'Aquafan', '2023-12-27 00:00:00', '2023-12-28 00:00:00', '2023-12-22 11:39:51', '2023-12-27 13:58:34', 'Recesso', '0', 0, 1),
(77, 'Coworkout One', '2023-12-27 00:00:00', '2023-12-28 00:00:00', '2023-12-26 11:21:17', '2023-12-27 13:05:11', 'Academia em reforma', '0', 0, 1),
(79, 'Superbom QNJ Açougue', '2023-12-26 00:00:00', '2023-12-27 00:00:00', '2023-12-26 11:22:14', '2023-12-26 14:47:15', 'Internet do cliente apresenta defeito', '0', 0, 1),
(80, 'Big Box 301 Sudoeste', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2023-12-26 13:25:22', '2024-01-15 18:50:57', 'Feita emenda do cabo', '0', 1, 1),
(82, 'Julio Adnet - Terraço Shopping', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-27 11:31:23', '2023-12-28 14:14:02', 'Zotac Travada', '0', 0, 1),
(83, 'Centro Empresarial Brasília', '2023-12-27 00:00:00', '2023-12-28 00:00:00', '2023-12-27 11:35:49', '2023-12-27 18:58:37', 'Máquina elevador travada, SIC\'s desligados, 2 andar bloco B - Raspberry não inicializava com cabo de rede conectado.', '0', 0, 1),
(84, 'Runway Sudoeste Escritorio', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-27 11:53:26', '2023-12-28 14:14:10', 'Troca de máquina, erro de dll', '0', 0, 1),
(85, 'Academia OMNI', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-27 13:38:42', '2023-12-28 14:13:50', 'Discutido mudanças, 1 tela queimada, retirar uma tela isolada e trocar pela queimada.', '0', 0, 1),
(86, 'Big Box 402 Norte', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-27 18:06:26', '2023-12-29 11:15:53', 'Metade das telas desligadas - Duas fontes do TNT com defeito.', '0', 1, 1),
(87, 'Posto Igrejinha Asa Sul', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-28 15:51:14', '2023-12-29 11:18:04', 'Internet do cliente apresenta instabilidade.', '0', 0, 1),
(88, 'Big Box QI 11 Lago Sul', '2023-12-28 00:00:00', '2023-12-29 00:00:00', '2023-12-28 15:51:41', '2023-12-29 11:16:02', 'Máquina travada', '0', 0, 1),
(89, 'Academia OMNI', '2023-12-29 00:00:00', '2023-12-30 00:00:00', '2023-12-28 15:52:06', '2024-01-02 11:59:03', 'Retirada 1 tela trocada pela academia e 1 tela da entrada, a qual foi trocada pela do mezanino, que apresentava defeito.', '0', 1, 1),
(90, 'Pier 21', '2023-12-29 00:00:00', '2023-12-30 00:00:00', '2023-12-29 11:18:24', '2024-01-02 11:59:35', 'Troca de fonte para telas do corredor e andar de baixo, telas de 75 desligadas no controle e perderam configuração devido pico de energia.', '0', 0, 1),
(91, 'CB Lojinha', '2024-01-02 00:00:00', '2024-01-03 00:00:00', '2024-01-02 11:36:03', '2024-01-02 11:50:04', 'Máquina Travada', '0', 0, 1),
(92, 'Big Box QI 11', '2024-01-02 00:00:00', '2024-01-03 00:00:00', '2024-01-02 11:37:27', '2024-01-02 14:35:35', 'Máquina travada', '0', 0, 1),
(93, 'Julio Adnet 01', '2024-01-02 00:00:00', '2024-01-03 00:00:00', '2024-01-02 11:38:15', '2024-01-02 15:07:05', 'Máquina dos Alongamentos - Zotac queimada', '0', 0, 1),
(95, 'Pizza César Guará', '2024-01-03 00:00:00', '2024-01-04 00:00:00', '2024-01-02 11:39:22', '2024-01-04 11:29:41', 'Cabo de rede mal conectado', '0', 0, 1),
(98, 'Centro Empresarial Brasília Elevador', '2024-01-10 00:00:00', '2024-01-11 00:00:00', '2024-01-02 12:04:53', '2024-01-10 15:37:53', '3º elevador depois do elevador de serviço', '0', 0, 1),
(100, 'Vence Assinatura Teamviewer', '2024-02-10 00:00:00', '2024-02-11 00:00:00', '2024-01-02 16:18:36', '2024-01-16 19:58:34', 'Vencimento da assinatura', '0', 0, 1),
(101, 'Big Box QI 11', '2024-01-03 00:00:00', '2024-01-04 00:00:00', '2024-01-03 13:35:20', '2024-01-04 11:29:29', 'Troca de máquina', '0', 1, 1),
(102, 'Academia OMNI', '2024-01-04 00:00:00', '2024-01-05 00:00:00', '2024-01-03 15:37:34', '2024-01-04 11:30:06', 'Máquina pedindo inicialização segura após pico de energia', '0', 1, 1),
(105, 'Big Box QI 05 Lago Norte', '2024-01-09 00:00:00', '2024-01-10 00:00:00', '2024-01-05 11:47:04', '2024-01-09 19:52:46', 'Cabo de rede no 104 mal conectado.', '0', 1, 1),
(106, 'CNI', '2024-01-08 00:00:00', '2024-01-09 00:00:00', '2024-01-05 11:47:30', '2024-01-08 19:35:29', 'Máquina do elevador Roberto com HD corrompido, Armando travada e tela do Armando 9 andar queimada.', '0', 1, 1),
(107, 'SESI Lab', '2024-01-09 00:00:00', '2024-01-10 00:00:00', '2024-01-05 11:47:58', '2024-01-09 16:12:39', 'Tela de exposição temporária retirada e do cni estava fora da rede.', '0', 1, 1),
(109, 'Runway Sudoeste', '2024-01-08 00:00:00', '2024-01-09 00:00:00', '2024-01-08 11:48:56', '2024-01-08 13:22:33', 'Internet do cliente apresenta defeito', '0', 0, 1),
(110, 'Academia Ultra - Cruzeiro', '2024-01-08 00:00:00', '2024-01-09 00:00:00', '2024-01-08 11:49:41', '2024-01-08 16:24:44', 'Player rodando, porém sem acesso ao teamviewer. voltar com escada', '0', 1, 1),
(111, 'InMove', '2024-01-08 00:00:00', '2024-01-09 00:00:00', '2024-01-08 11:52:03', '2024-01-08 16:25:01', 'Máquina desligada', '0', 0, 1),
(112, 'CNI', '2024-01-09 00:00:00', '2024-01-10 00:00:00', '2024-01-08 19:36:02', '2024-01-09 19:52:32', 'Máquina reposta. Defeito na tela encaminhada aos responsáveis. Samsung de propriedade do cni.', '0', 1, 1),
(113, 'Ultra Cruzeiro', '2024-01-09 00:00:00', '2024-01-10 00:00:00', '2024-01-09 11:28:10', '2024-01-09 19:52:06', 'Internet voltou, telas continuam azuis, podendo ser o kramer 120 que não tem fonte. Alimentados pelo cabo de rede.', '0', 0, 1),
(114, 'Pizza César Guará', '2024-01-10 00:00:00', '2024-01-11 00:00:00', '2024-01-09 16:38:37', '2024-01-11 11:41:02', 'Defeito na internet do cliente', '0', 0, 1),
(115, 'Big Box 503 Sul', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:43:08', '2024-01-11 17:57:36', 'Adriano gerente disse que amanhã o pessoal da elétrica vai dar uma olhada, tela está sem alimentação.', '0', 0, 1),
(116, 'Big Box Sibéria', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:43:26', '2024-01-11 14:22:08', 'Mal contato no cabo de rede.', '0', 0, 1),
(117, 'Coworkout One', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:43:48', '2024-01-11 18:50:57', 'Feito troca de bateria da máquina; Se perder configuração, levar outro mini pc.', '0', 0, 1),
(118, 'Aquafan', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:44:09', '2024-01-11 14:20:57', 'Ainda em obras: Funcionário Patrick informou que previsão para término é à partir do dia 21.', '0', 0, 1),
(119, 'Acqua Sul', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:44:22', '2024-01-11 17:57:05', 'Ainda em obras, previsão: Dia 20', '0', 0, 1),
(120, 'Big Box 106 Norte', '2024-01-11 00:00:00', '2024-01-12 00:00:00', '2024-01-11 11:46:31', '2024-01-11 14:21:32', 'Telas desligadas pelo cabo de força.', '0', 0, 1),
(121, 'Aquafan', '2024-01-22 00:00:00', '2024-01-23 00:00:00', '2024-01-11 15:45:37', '2024-01-22 14:12:25', 'Ainda em reforma.', '0', 0, 1),
(123, 'Big Box 503 Sul', '2024-01-12 00:00:00', '2024-01-13 00:00:00', '2024-01-12 11:42:55', '2024-01-12 15:15:21', 'Eletricista não estava. Gernete foi informado para verificar a situação da energia das linhas quentes.', '0', 0, 1),
(125, 'Academia Ultra Cruzeiro', '2024-01-12 00:00:00', '2024-01-13 00:00:00', '2024-01-12 11:43:33', '2024-01-15 13:17:01', 'Internet do cliente apresenta defeito.', '0', 0, 1),
(126, 'Coworkout One', '2024-01-12 00:00:00', '2024-01-13 00:00:00', '2024-01-12 15:14:27', '2024-01-15 13:17:09', 'Troca de máquina', '0', 0, 1),
(127, 'CNI', '2024-01-12 00:00:00', '2024-01-13 00:00:00', '2024-01-12 15:19:36', '2024-01-12 15:19:36', 'Verificado todos elevadores, telas todas ligadas.', '0', 0, 1),
(128, 'UNICEUB', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-01-12 15:37:21', '2024-02-19 16:00:34', 'Pendências: 1 tela LG, 1 tela Samsung 300MX e 1 kramer Bloco 06.', '0', 1, 1),
(129, 'Sesi Lab - tela CNI', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2024-01-15 11:15:36', '2024-01-15 18:51:47', 'Conectado na internet do Sesi.', '0', 0, 1),
(132, 'Conserto tela 75', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2024-01-15 13:22:51', '2024-01-15 15:23:15', 'Deixar tela de 75 para conserto na Asa Sul.', '0', 1, 1),
(133, 'Malunga Gilberto Salomão', '2024-01-16 00:00:00', '2024-01-17 00:00:00', '2024-01-15 13:23:28', '2024-01-16 16:34:46', 'Instalação.', '0', 1, 1),
(134, 'Academia Ultra Cruzeiro', '2024-01-15 00:00:00', '2024-01-16 00:00:00', '2024-01-15 15:39:38', '2024-01-15 19:12:27', 'Pegar senha do wifi.', '0', 0, 1),
(135, 'FitOne', '2024-01-16 00:00:00', '2024-01-17 00:00:00', '2024-01-15 19:08:46', '2024-01-16 19:27:59', 'Feito troca de discabo.', '0', 0, 1),
(136, 'Big Box 301 Sudoeste', '2024-01-16 00:00:00', '2024-01-17 00:00:00', '2024-01-15 19:34:28', '2024-01-16 19:27:42', 'Reinstalado', '0', 1, 1),
(137, 'Big Box Península', '2024-01-19 00:00:00', '2024-01-20 00:00:00', '2024-01-16 13:51:05', '2024-01-22 15:31:09', 'Passado cabo.', '0', 1, 1),
(138, 'Big Box CN 01 Taguatinga', '2024-01-17 00:00:00', '2024-01-18 00:00:00', '2024-01-16 15:40:38', '2024-01-17 19:21:15', 'Uma tela apagada, troca de kramer', '0', 0, 1),
(139, 'Pegar escada Hermínio', '2024-01-17 00:00:00', '2024-01-18 00:00:00', '2024-01-16 15:40:59', '2024-01-17 17:53:31', 'Pegar escada', '0', 1, 1),
(140, 'Big Box CNB 12', '2024-01-17 00:00:00', '2024-01-18 00:00:00', '2024-01-16 19:25:03', '2024-01-17 14:12:56', 'Modem instalado.', '0', 0, 1),
(142, 'Big Box 402 Norte', '2024-01-18 00:00:00', '2024-01-19 00:00:00', '2024-01-17 15:27:14', '2024-01-18 14:20:31', 'Cabo de rede desconectado.', '0', 0, 1),
(143, 'Big Box Península', '2024-01-18 00:00:00', '2024-01-19 00:00:00', '2024-01-18 10:48:34', '2024-01-22 15:31:08', 'Passado cabo.', '0', 1, 1),
(144, 'Comprar material', '2024-01-18 00:00:00', '2024-01-19 00:00:00', '2024-01-18 11:15:47', '2024-01-18 14:20:59', 'Tem outra loja que faz, verá o orçamento.', '0', 0, 1),
(145, 'Academia OMNI', '2024-01-18 00:00:00', '2024-01-19 00:00:00', '2024-01-18 11:33:37', '2024-01-18 19:42:49', 'Realizada troca de tela - LG piscando', '0', 0, 1),
(146, 'Big Box Península', '2024-01-22 00:00:00', '2024-01-23 00:00:00', '2024-01-19 12:00:39', '2024-01-22 18:55:52', 'Responsáveis em reunião, instalação não autorizada.', '0', 1, 1),
(147, 'Big Box Península', '2024-01-23 00:00:00', '2024-01-24 00:00:00', '2024-01-19 12:00:53', '2024-01-24 11:26:14', 'Instalação concluída', '0', 1, 1),
(148, 'Big Box Noroeste - Inspeção', '2024-01-25 00:00:00', '2024-01-26 00:00:00', '2024-01-19 15:53:37', '2024-01-25 15:51:57', 'Fazer vistoria para instalação', '0', 0, 1),
(149, 'CNI - Roberto Simonsen Elevador', '2024-01-22 00:00:00', '2024-01-23 00:00:00', '2024-01-22 11:51:00', '2024-01-22 14:12:14', 'Placa de vídeo bugou resolução.', '0', 1, 1),
(150, 'Pizza Hut - Águas Claras', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-22 11:57:18', '2024-01-24 19:29:23', 'Tinham retirado antena.', '0', 0, 1),
(151, 'Big Box 208 Norte', '2024-01-22 00:00:00', '2024-01-23 00:00:00', '2024-01-22 11:57:46', '2024-01-22 14:11:56', 'Placa de rede travada.', '0', 0, 1),
(153, 'Big Box 413', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-23 11:14:28', '2024-01-24 14:27:03', 'Máquina travada e uma tela queimada.', '0', 0, 1),
(154, 'Fit One Cruzeiro', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-24 11:26:45', '2024-01-24 19:28:23', 'Tela reiniciando, após muito tempo estabiliza.', '0', 0, 1),
(155, 'Malunga Lago Sul', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-24 11:26:58', '2024-01-24 14:28:16', 'Input errado.', '0', 0, 1),
(156, 'Big Box 208 Norte', '2024-01-25 00:00:00', '2024-01-26 00:00:00', '2024-01-24 11:27:11', '2024-01-25 15:51:48', 'Troca de máquina', '0', 0, 1),
(157, 'Fit Park', '2024-01-25 00:00:00', '2024-01-26 00:00:00', '2024-01-24 11:30:10', '2024-01-25 15:52:12', 'Máquina com defeito - traga ao laboratório', '0', 0, 1),
(158, 'Escada Herminio', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-24 12:07:46', '2024-01-24 19:28:31', 'Devolver escada', '0', 0, 1),
(159, 'Big Box Paineras', '2024-01-24 00:00:00', '2024-01-25 00:00:00', '2024-01-24 12:13:31', '2024-01-24 19:28:50', 'Modem colocado.', '0', 0, 1),
(160, 'Big Box 413 Sul', '2024-02-23 00:00:00', '2024-02-24 00:00:00', '2024-01-24 14:27:59', '2024-03-26 17:05:01', 'Troca de uma tela LG', '0', 0, 1),
(161, 'Centro Empresarial Brasília', '2024-01-25 00:00:00', '2024-01-26 00:00:00', '2024-01-25 15:53:02', '2024-01-26 11:29:58', 'Andar 3 Bl. B, Andar 5', '0', 0, 1),
(162, 'Centro Empresarial Brasília', '2024-01-26 00:00:00', '2024-01-27 00:00:00', '2024-01-26 11:30:29', '2024-01-26 14:23:31', 'Máquina 3. A colocada', '0', 0, 1),
(163, 'Pier 21 Praça 02', '2024-01-26 00:00:00', '2024-01-27 00:00:00', '2024-01-26 11:30:47', '2024-01-26 14:23:42', 'Pau no HD', '0', 1, 1),
(164, 'Sesi Lab', '2024-01-26 00:00:00', '2024-01-27 00:00:00', '2024-01-26 11:31:16', '2024-01-26 14:24:01', 'Sem acesso ao teamviewer ainda, informado para abrir chamado pra T.I', '0', 1, 1),
(167, 'Big Box 408 Norte', '2024-01-30 00:00:00', '2024-01-31 00:00:00', '2024-01-26 11:34:14', '2024-01-31 11:42:50', 'Colocado suportes de telas', '0', 1, 1),
(168, 'Big Box 408 Norte', '2024-02-02 00:00:00', '2024-02-03 00:00:00', '2024-01-26 11:34:28', '2024-02-05 11:25:11', 'Instalação', '0', 1, 1),
(169, 'Armando Cirillo', '2024-02-07 00:00:00', '2024-02-08 00:00:00', '2024-01-26 11:34:58', '2024-02-08 12:48:36', 'Vistoria de como vai ser feito a instalação.', '0', 1, 1),
(170, 'Uniceub', '2024-02-06 00:00:00', '2024-02-07 00:00:00', '2024-01-26 11:35:27', '2024-02-06 19:45:32', 'Vistoria, deixar todos online.', '0', 1, 1),
(171, 'Big Box Península', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-26 11:43:24', '2024-01-31 11:42:15', 'Troca de máquina', '0', 1, 1),
(172, 'Pizza Hut Asa Sul', '2024-01-26 00:00:00', '2024-01-27 00:00:00', '2024-01-26 11:43:50', '2024-01-29 11:40:30', 'Gerente desligou as telas', '0', 0, 1),
(173, 'Pier 21 Praça 02', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-26 14:24:14', '2024-01-29 16:03:07', 'Trocada máquina', '0', 1, 1),
(174, 'Centro Empresarial Brasília', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-26 14:25:49', '2024-01-29 16:02:26', 'Trocar máquina e tela 3. B e maquina 5. A', '0', 1, 1),
(175, 'UDF Asa Sul', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-29 11:41:49', '2024-01-29 16:03:33', 'Praça em reforma, sem energia.', '0', 0, 1),
(176, 'Felicittà', '2024-01-31 00:00:00', '2024-02-01 00:00:00', '2024-01-29 11:42:29', '2024-01-31 19:53:17', 'Tudo ok, porém subsolo torre A segue sem conexão. Marcar volta co teclado e acesso a casa de maquina', '0', 1, 1),
(177, 'Black Fit Esteiras', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-29 11:43:14', '2024-01-31 11:42:25', 'Máquina travada', '0', 0, 1),
(178, 'Pizza César Guará', '2024-01-29 00:00:00', '2024-01-30 00:00:00', '2024-01-29 16:34:08', '2024-01-31 11:42:34', 'Cliente sem internet', '0', 0, 1),
(179, 'Superbom Guará', '2024-01-31 00:00:00', '2024-02-01 00:00:00', '2024-01-31 11:43:12', '2024-01-31 19:53:39', 'Máquina com problema', '0', 0, 1),
(180, 'Compra de Material', '2024-01-31 00:00:00', '2024-02-01 00:00:00', '2024-01-31 11:43:24', '2024-01-31 19:52:30', 'Comprado capacitores, ferro e estanho de solda. Faltando cano e chave tiktak', '0', 0, 1),
(181, 'Pier 21 Vertical', '2024-02-01 00:00:00', '2024-02-02 00:00:00', '2024-01-31 20:06:55', '2024-02-01 14:33:11', 'Máquina travada', '0', 1, 1),
(182, 'Big Box Península', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-02-01 11:26:50', '2024-03-12 11:21:02', 'Troca de tela', '0', 1, 1),
(183, 'Big Box 208 Norte', '2024-02-01 00:00:00', '2024-02-02 00:00:00', '2024-02-01 11:28:18', '2024-02-01 14:33:05', 'Máquina travada', '0', 0, 1),
(185, 'Moto Checkin', '2024-02-01 00:00:00', '2024-02-02 00:00:00', '2024-02-01 19:57:31', '2024-02-01 19:57:31', 'levar moto para orçamento do conserto', '0', 0, 1),
(186, 'Compra de material', '2024-02-01 00:00:00', '2024-02-02 00:00:00', '2024-02-01 19:57:49', '2024-02-01 19:57:49', 'finalizar compra de materiais para bigbox 408 norte', '0', 0, 1),
(187, 'Suporte Hermínio', '2024-02-05 00:00:00', '2024-02-06 00:00:00', '2024-02-05 11:26:06', '2024-02-05 15:04:41', 'Buscar suporte', '0', 1, 1),
(188, 'Fitmore', '2024-02-05 00:00:00', '2024-02-06 00:00:00', '2024-02-05 11:26:23', '2024-02-05 15:04:18', 'Internet do cliente apresenta defeito', '0', 0, 1),
(189, 'Superbom QS 305 samambaia', '2024-02-05 00:00:00', '2024-02-06 00:00:00', '2024-02-05 11:31:08', '2024-02-05 15:04:35', 'HD com defeito', '0', 0, 1),
(190, 'Big Box 408 Norte', '2024-02-05 00:00:00', '2024-02-06 00:00:00', '2024-02-05 15:05:07', '2024-02-06 19:44:47', 'Instalação', '0', 1, 1),
(191, 'Black Fit', '2024-02-06 00:00:00', '2024-02-07 00:00:00', '2024-02-06 11:45:20', '2024-02-06 19:45:04', 'Trocar máquina esteiras', '0', 0, 1),
(192, 'Fit One Cruzeiro', '2024-02-06 00:00:00', '2024-02-07 00:00:00', '2024-02-06 11:45:57', '2024-02-06 19:45:22', 'Trocar telas - 2 lgs', '0', 0, 1),
(193, 'Uniceub', '2024-02-07 00:00:00', '2024-02-08 00:00:00', '2024-02-06 19:45:52', '2024-02-08 12:49:15', 'Vistoria finalizada. Pendências: 1 tela LG, 1 tela Samsung 300MX e 1 kramer Bloco 06.', '0', 0, 1),
(194, 'Alameda', '2024-02-08 00:00:00', '2024-02-09 00:00:00', '2024-02-08 12:49:50', '2024-02-08 12:49:50', 'Máquina ou fonte com defeito', '0', 1, 1),
(195, 'Felicittà Shopping', '2024-02-08 00:00:00', '2024-02-09 00:00:00', '2024-02-08 12:50:08', '2024-02-08 14:28:05', 'Ver teamviewer máquina subsolo torre A', '0', 1, 1),
(196, 'Big Box qi 05 Lago Norte', '2024-02-07 00:00:00', '2024-02-08 00:00:00', '2024-02-08 12:50:29', '2024-02-08 12:50:29', 'Máquina travada', '0', 0, 1),
(197, 'Armando Cirillo', '2024-02-08 00:00:00', '2024-02-09 00:00:00', '2024-02-08 12:50:46', '2024-02-08 19:36:59', 'Instalação cancelada devido falha de comunicação. Drywall e não alvenaria.', '0', 1, 1),
(198, 'ACM Asa Sul', '2024-02-16 00:00:00', '2024-02-17 00:00:00', '2024-02-08 14:27:54', '2024-02-16 20:06:39', 'Defeito no 210', '0', 0, 1),
(199, 'Alameda', '2024-02-09 00:00:00', '2024-02-10 00:00:00', '2024-02-08 16:09:01', '2024-02-14 13:53:04', 'Colocar máquina de volta', '0', 1, 1),
(200, 'Bluefit Samambaia', '2024-02-09 00:00:00', '2024-02-10 00:00:00', '2024-02-08 16:09:13', '2024-02-14 13:53:14', 'Desmontar', '0', 1, 1),
(201, 'Armando Cirillo', '2024-02-09 00:00:00', '2024-02-10 00:00:00', '2024-02-08 19:36:39', '2024-02-14 13:53:09', 'Instalação', '0', 0, 1),
(202, 'World Gym', '2024-02-16 00:00:00', '2024-02-17 00:00:00', '2024-02-14 13:53:57', '2024-02-16 20:07:47', 'Desligadas.', '0', 0, 1),
(203, 'O2 Fitness Lago Sul', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-14 13:54:47', '2024-02-16 11:21:36', 'Offline', '0', 0, 1),
(204, 'Big Box 301 sudoeste', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:55:22', '2024-02-15 11:26:20', 'Má conexão', '0', 0, 1),
(205, 'Steakbull lago sul', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-14 13:55:44', '2024-02-16 11:21:53', 'Pendenciado - voltar para verificar toda a rede', '0', 0, 1),
(206, 'Academia inmove', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-14 13:56:32', '2024-02-16 11:21:29', 'offline', '0', 0, 1),
(207, 'Big Box 402 Norte', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:56:56', '2024-02-15 11:26:46', 'offline', '0', 0, 1),
(208, 'Big box 208 norte', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:58:18', '2024-02-15 11:26:05', 'Recuperação do hd', '0', 0, 1),
(209, 'Big box 310 norte', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:58:39', '2024-02-15 11:26:40', 'Má conexão', '0', 0, 1),
(210, 'Big box 106 norte', '2024-02-14 00:00:00', '2024-02-15 00:00:00', '2024-02-14 13:59:10', '2024-02-15 11:25:52', 'Internet do cliente apresenta defeito', '0', 0, 1),
(211, 'Master Gym - Gama', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-02-15 11:29:41', '2024-02-19 19:37:15', 'Trocou a senha da internet', '0', 0, 1),
(212, 'Runway Sudoeste Escritório', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-15 11:31:16', '2024-02-15 15:54:11', 'Internet do cliente apresentava defeito', '0', 0, 1),
(213, 'Big Box 208 Norte', '2024-02-15 00:00:00', '2024-02-16 00:00:00', '2024-02-15 11:32:33', '2024-02-15 15:53:52', 'Devolver maquina', '0', 1, 1),
(214, 'SteakBull', '2024-02-16 00:00:00', '2024-02-17 00:00:00', '2024-02-16 11:22:11', '2024-02-16 20:07:31', 'Adicionado switch e trocado receivers discabo 2.0 pelo 4.0', '0', 0, 1),
(215, 'Julio Adnet', '2024-02-16 00:00:00', '2024-02-17 00:00:00', '2024-02-16 11:26:23', '2024-02-16 20:07:06', 'Teamviewer fechado e configurações feitas na máquina que pedia f1.', '0', 0, 1),
(216, 'Água Vida', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-02-19 11:28:53', '2024-02-19 19:35:25', 'Energia sem fase, esperar retorno.', '0', 0, 1),
(217, 'ACM Asa Sul', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 11:29:21', '2024-02-21 11:48:31', 'Tela com problema e maquina travada', '0', 0, 1),
(218, 'Pizza Hut Águas Claras', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-02-19 11:29:49', '2024-02-19 19:38:12', 'Pendencia - maquina ou fonte', '0', 0, 1),
(219, 'Pier 21', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 11:31:20', '2024-02-21 11:49:26', 'Telas sem energia; Máquina da tela 75 no pau', '0', 1, 1),
(220, 'Academia omni', '2024-02-19 00:00:00', '2024-02-20 00:00:00', '2024-02-19 11:32:52', '2024-02-19 19:34:44', 'Pendenciado - levar testador de cabo', '0', 0, 1),
(221, 'Black Fit Esteiras', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 15:59:35', '2024-02-21 11:50:24', 'Troca de maquina', '0', 1, 1),
(222, 'Academia Omni', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 21:00:51', '2024-02-21 11:48:12', 'Ainda fora', '0', 1, 1),
(223, 'Fit one cruzeiro', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-19 21:01:07', '2024-02-21 20:58:35', '2 telas fora', '0', 0, 1),
(224, 'Big box paineras', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-19 21:02:01', '2024-02-21 11:48:59', 'Problema na maquina ou sender ou switch', '0', 0, 1),
(225, 'Pizza Hut Águas Claras', '2024-02-20 00:00:00', '2024-02-21 00:00:00', '2024-02-20 11:36:47', '2024-02-21 11:49:41', 'Máquina de volta; Internet do cliente com defeito', '0', 0, 1),
(226, 'Academia OMNI', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 11:50:05', '2024-02-21 20:57:52', 'Voltar discabo com cabo certo', '0', 1, 1),
(227, 'Compra de máquinas', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 11:51:19', '2024-02-21 20:58:14', 'Comprar máquinas Taguatinga', '0', 1, 1),
(228, 'Big Box Paineras', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 11:52:24', '2024-02-21 20:58:03', 'Troca de maquina', '0', 1, 1),
(229, 'Shopping Metrópoles', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 11:53:03', '2024-02-21 20:59:03', 'Máquina offline', '0', 0, 1),
(230, 'Uniceub Bloco 2 Shaft', '2024-02-23 00:00:00', '2024-02-24 00:00:00', '2024-02-21 11:53:30', '2024-03-26 17:05:15', 'Máquina offline', '0', 0, 1),
(231, 'Julio Adnet', '2024-02-21 00:00:00', '2024-02-22 00:00:00', '2024-02-21 17:33:54', '2024-02-21 20:58:57', 'Primeira tela offline', '0', 0, 1),
(232, 'Pier 21', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-21 20:59:20', '2024-02-23 11:30:15', 'Troca de máquina e placa de vídeo da máquina vertical', '0', 1, 1),
(234, 'Acqua Sul', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-21 20:59:54', '2024-02-23 11:29:13', 'Ver se ja pode instalar', '0', 0, 1),
(235, 'Aquafan', '2024-02-27 00:00:00', '2024-02-28 00:00:00', '2024-02-21 21:00:05', '2024-02-28 10:53:47', 'Ver se ja pode instalar', '0', 0, 1),
(236, 'Pizza César Guará', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-22 11:35:00', '2024-02-23 11:30:28', 'Pendencia - troca de tela', '0', 0, 1),
(237, 'One Way Guará', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-22 11:35:13', '2024-02-23 11:29:58', 'Dono não estava presente', '0', 0, 1),
(238, 'Fit One Cruzeiro', '2024-02-22 00:00:00', '2024-02-23 00:00:00', '2024-02-22 11:35:25', '2024-02-23 11:29:42', 'Troca de 2 receiver discabo', '0', 0, 1),
(239, 'AcquaSul', '2024-02-27 00:00:00', '2024-02-28 00:00:00', '2024-02-23 11:29:29', '2024-02-28 10:53:41', 'Retirada de equipamentos', '0', 1, 1),
(240, 'UDF Asa Sul', '2024-02-23 00:00:00', '2024-02-24 00:00:00', '2024-02-23 11:31:44', '2024-03-26 17:05:08', 'Máquina offline, ver se terminaram obras', '0', 0, 1),
(241, 'Pizza Cesar Guará (Tarde)', '2024-02-26 00:00:00', '2024-02-27 00:00:00', '2024-02-23 11:50:37', '2024-02-28 10:53:31', 'Verificar conexao com o teamviewer', '0', 0, 1),
(242, 'One Way (Manhã)', '2024-02-26 00:00:00', '2024-02-27 00:00:00', '2024-02-23 11:50:57', '2024-02-28 10:53:26', 'Maquina offline', '0', 0, 1),
(243, 'Centro Empresarial Brasília', '2024-02-26 00:00:00', '2024-02-27 00:00:00', '2024-02-26 10:38:10', '2024-02-28 10:53:20', 'Andar 5 Bl. A, Andar 8, Andar 7 e Andar 3 Bl. B', '0', 1, 1),
(244, 'Pizza Hut Águas (Tarde)', '2024-02-26 00:00:00', '2024-02-27 00:00:00', '2024-02-26 10:39:37', '2024-02-28 10:53:36', 'Verificar conexao', '0', 0, 1),
(245, 'CEB', '2024-02-27 00:00:00', '2024-02-28 00:00:00', '2024-02-27 11:03:38', '2024-02-28 10:53:52', 'andar 8', '0', 1, 1),
(246, 'superbom qs 106 samambaia', '2024-02-27 00:00:00', '2024-02-28 00:00:00', '2024-02-27 11:05:37', '2024-02-28 10:54:04', 'Informar ti do superbom', '0', 0, 1),
(248, 'Bar lampiao', '2024-02-28 00:00:00', '2024-02-29 00:00:00', '2024-02-28 11:00:40', '2024-03-04 11:31:50', 'offline 1 dia', '0', 0, 1),
(249, 'World Gym', '2024-02-28 00:00:00', '2024-02-29 00:00:00', '2024-02-28 11:01:53', '2024-03-04 11:31:55', 'Maquina off', '0', 1, 1),
(250, 'Alameda', '2024-02-29 00:00:00', '2024-03-01 00:00:00', '2024-02-29 11:18:46', '2024-03-04 11:32:02', 'Tela apagada', '0', 1, 1),
(251, 'Bonamix Samambaia', '2024-02-29 00:00:00', '2024-03-01 00:00:00', '2024-02-29 11:19:30', '2024-03-04 11:32:07', 'maq offline', '0', 0, 1),
(252, 'superbom qs 305', '2024-02-29 00:00:00', '2024-03-01 00:00:00', '2024-02-29 11:19:52', '2024-03-04 11:32:13', 'fora', '0', 0, 1),
(253, 'Alameda', '2024-03-01 00:00:00', '2024-03-02 00:00:00', '2024-03-04 11:32:35', '2024-03-04 11:32:35', 'Troca de tela', '0', 0, 1),
(255, 'One Way Guará', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-04 11:35:27', '2024-03-05 16:19:34', 'Colocar máquina nova', '0', 1, 1),
(256, 'Fitmore', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-04 11:35:47', '2024-03-05 16:18:21', 'Local em reforma', '0', 0, 1),
(257, 'Pier 21 - Corredor', '2024-03-04 00:00:00', '2024-03-05 00:00:00', '2024-03-04 11:36:40', '2024-03-05 11:24:11', 'Máquina fora, configurações de botão de energia', '0', 1, 1),
(258, 'Academia Omni', '2024-03-06 00:00:00', '2024-03-07 00:00:00', '2024-03-04 11:38:06', '2024-03-07 11:41:46', 'Uma tela desligada', '0', 0, 1),
(259, 'Big Box 208 Norte', '2024-03-04 00:00:00', '2024-03-05 00:00:00', '2024-03-04 11:38:31', '2024-03-05 11:23:36', 'Máquina travada, uma tela com defeito na imagem.', '0', 0, 1),
(260, 'Malunga Gilberto Salomão', '2024-03-04 00:00:00', '2024-03-05 00:00:00', '2024-03-04 11:56:13', '2024-03-05 11:23:57', 'Internet apresenta defeito, sem pagamento', '0', 0, 1),
(261, 'Uniceub Bloco 06', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-04 11:56:45', '2024-03-06 11:39:11', 'Maquina colocada de volta', '0', 1, 1),
(263, 'Rosenilto', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-05 11:25:28', '2024-03-05 16:19:27', 'Assinar recibo', '0', 0, 1),
(264, 'SteakBull', '2024-03-05 00:00:00', '2024-03-06 00:00:00', '2024-03-05 16:18:01', '2024-03-06 11:38:56', 'Colocado modem', '0', 1, 1),
(265, 'Desinstalar Malunga', '2024-03-06 00:00:00', '2024-03-07 00:00:00', '2024-03-05 16:36:33', '2024-03-06 13:48:11', 'Retirada de Equipamentos', '0', 0, 1),
(266, 'Pier 21', '2024-03-06 00:00:00', '2024-03-07 00:00:00', '2024-03-06 11:41:53', '2024-03-06 13:48:03', 'Modem travado', '0', 1, 1),
(267, 'Big Box qi 05 Lago Norte', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-03-06 11:42:50', '2024-03-12 11:21:12', 'Máquina travada', '0', 0, 1),
(268, 'Big Box 208 Norte', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-06 11:44:21', '2024-03-15 15:57:12', 'Máquina trocada e cabo de rede apertado', '0', 0, 1),
(269, 'Aquafan', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-03-06 11:45:43', '2024-03-12 11:21:47', 'Retirada', '0', 0, 1),
(270, 'Centro Empresarial Brasília', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-06 11:46:22', '2024-03-07 17:20:19', 'Andar 7, 5 e 8', '0', 1, 1),
(271, 'Bar Lampião Guará', '2024-03-06 00:00:00', '2024-03-07 00:00:00', '2024-03-06 11:46:56', '2024-03-07 11:41:58', 'Máquina tinha perdido configuração', '0', 0, 1),
(272, 'Armando Monteiro Neto', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-06 13:47:49', '2024-03-08 11:25:41', 'Elevador E, Elevador Roberto Simonsen', '0', 1, 1),
(273, 'Pegar tv 75', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-07 11:27:16', '2024-03-07 17:20:26', 'pegar tv', '0', 1, 1),
(274, 'Pegar moto', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-07 11:27:26', '2024-03-07 17:20:40', 'pegar tv', '0', 1, 1),
(275, 'Retirada Malunga', '2024-03-07 00:00:00', '2024-03-08 00:00:00', '2024-03-07 11:27:44', '2024-03-08 11:25:52', 'retirar malunga', '0', 0, 1),
(276, 'Led Oba V.P', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-03-07 17:21:38', '2024-03-12 11:21:26', 'send card travada', '0', 0, 1),
(277, 'Retirar Malunga Asa Norte', '2024-03-08 00:00:00', '2024-03-09 00:00:00', '2024-03-08 12:15:11', '2024-03-12 11:21:33', 'Retirada de equipamentos', '0', 0, 1),
(278, 'UDF Asa Sul', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-08 14:29:24', '2024-03-14 16:37:34', 'Praça desativada, agora está no subsolo', '0', 0, 1),
(279, 'Big box 408 norte', '2024-03-11 00:00:00', '2024-03-12 00:00:00', '2024-03-12 11:22:06', '2024-03-12 11:22:06', 'instalação', '0', 1, 1),
(280, 'Levar motos conserto', '2024-03-12 00:00:00', '2024-03-13 00:00:00', '2024-03-12 11:22:34', '2024-03-12 19:29:21', 'Levar motos para manutenção', '0', 1, 1),
(281, 'Omni', '2024-03-12 00:00:00', '2024-03-13 00:00:00', '2024-03-12 11:22:49', '2024-03-12 19:29:33', 'Trocar tela', '0', 1, 1),
(282, 'Buscar Motos conserto', '2024-03-12 00:00:00', '2024-03-13 00:00:00', '2024-03-12 11:23:02', '2024-03-12 19:29:00', 'buscar', '0', 1, 1),
(284, 'One Way Salão', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-12 12:29:21', '2024-03-13 15:48:02', 'Máquina fora', '0', 1, 1),
(285, 'Julio Adnet', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-12 19:30:12', '2024-03-13 15:47:47', 'Cliente informou tela sem sinal', '0', 0, 1),
(286, 'Felicittà', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-12 19:30:36', '2024-03-13 15:47:37', 'Troca de tela', '0', 1, 1),
(287, 'Malunga Asa Sul', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-12 19:32:05', '2024-03-14 16:36:21', 'Desmontar', '0', 0, 1),
(288, 'Pizza Hut Águas Claras', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-13 11:52:39', '2024-03-14 18:57:55', 'Internet do cliente', '0', 0, 1),
(289, 'Big Box 508 Asa Sul', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-13 11:53:57', '2024-03-13 18:38:42', 'Internet do cliente apresenta defeito', '0', 0, 1),
(291, 'Uniceub Bloco 10 Hits', '2024-03-13 00:00:00', '2024-03-14 00:00:00', '2024-03-13 12:07:04', '2024-03-13 18:38:23', 'Colocar internet.', '0', 0, 1),
(292, 'Big Box QI 5 Lago Norte', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-13 18:40:35', '2024-03-15 15:57:24', 'Máquina trocada; Cliente sem internet', '0', 0, 1),
(293, 'O2 Fitness', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-14 11:47:49', '2024-03-14 16:36:44', 'Máquina travada, retiraram 2 telas temporariamente', '0', 0, 1),
(294, 'Big Box CN 01', '2024-03-14 00:00:00', '2024-03-15 00:00:00', '2024-03-14 11:48:09', '2024-03-14 18:57:45', 'Máquina travada', '0', 0, 1),
(295, 'Big Box 402 Norte', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-15 11:39:19', '2024-03-18 11:32:57', 'Máquina offline 1 dia', '0', 0, 1),
(296, 'Edifício União', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-15 11:40:07', '2024-03-18 19:32:34', 'Reiniciar modem', '0', 0, 1),
(297, 'Julio Adnet Centro Clínico', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-15 11:40:40', '2024-03-18 11:33:23', 'Internet do cliente apresenta defeito', '0', 0, 1),
(298, 'Deck Norte', '2024-03-15 00:00:00', '2024-03-16 00:00:00', '2024-03-15 11:41:03', '2024-03-15 15:57:57', 'Modem travado', '0', 0, 1),
(299, 'Fiore', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-15 11:41:42', '2024-03-18 16:41:56', 'Máquina offline', '0', 0, 1),
(300, 'Led  Oba Vicente Pires', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-18 11:35:34', '2024-03-18 16:41:31', 'Offline 3 dias', '0', 0, 1),
(303, 'Assis Chateaubriand Torre A', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-18 11:50:08', '2024-03-19 14:56:50', 'Modem, hdmi, uma pendência: tela lg led', '0', 0, 1),
(304, 'Uniceub Campus Taguatinga', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-18 11:50:24', '2024-03-20 16:37:07', 'Modem reiniciado', '0', 0, 1),
(307, 'Pier 21', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-18 11:52:06', '2024-03-19 14:57:00', 'Elevador e corredor', '0', 0, 1),
(308, 'Deck Norte', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-18 11:52:54', '2024-03-19 18:31:43', 'Modem', '0', 0, 1),
(309, 'Espaço 115', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-18 11:53:40', '2024-03-19 18:31:50', 'Modem', '0', 0, 1),
(310, 'Julio Adnet', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-18 16:42:45', '2024-03-18 19:32:55', 'Máquina trocada e outra iniciada, trocar maquina', '0', 0, 1),
(311, 'CEB', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-18 16:46:20', '2024-03-20 18:46:03', 'Modem bloco b', '0', 0, 1),
(313, 'Big Box 512 Sul', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:45:51', '2024-03-19 14:57:21', 'Fonte do 104 TNT', '0', 0, 1),
(314, 'Big Box 211 Norte', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:47:20', '2024-03-19 18:31:17', 'Modem', '0', 0, 1),
(315, 'Fit Park', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:49:08', '2024-03-19 18:31:57', 'Modem', '0', 0, 1),
(316, 'Assis Chateubriand', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-19 11:49:38', '2024-03-20 18:46:10', 'Trocar tela', '0', 0, 1),
(318, 'Shopping Metropoles', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:50:47', '2024-03-19 18:32:12', 'Máquina offline 2 dias', '0', 0, 1),
(319, 'Julio Adnet Academia', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-19 11:52:01', '2024-03-20 16:36:57', 'Máquina trocada', '0', 0, 1),
(320, 'Big Box 208 Norte', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:52:34', '2024-03-19 18:31:07', 'Maquina travada', '0', 0, 1),
(321, 'Big Box 402 Norte', '2024-03-19 00:00:00', '2024-03-20 00:00:00', '2024-03-19 11:54:15', '2024-03-19 18:31:36', 'Modem', '0', 0, 1),
(322, 'I9 Fit', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-19 14:57:37', '2024-03-20 16:36:48', 'Sem energia', '0', 0, 1),
(323, 'Upis Planaltina', '2024-03-21 00:00:00', '2024-03-22 00:00:00', '2024-03-20 11:43:10', '2024-03-22 11:31:18', 'Pendencia: Troca de maquina, 1 tela queimada', '0', 1, 1),
(324, 'CNI', '2024-03-21 00:00:00', '2024-03-22 00:00:00', '2024-03-20 11:43:55', '2024-03-22 11:30:59', 'Sala Aline', '0', 1, 1),
(325, 'One Way Salão', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-20 18:47:23', '2024-03-22 14:18:45', 'Modem', '0', 0, 1),
(326, 'UNICEUB Bl 09 Shaft', '2024-03-21 00:00:00', '2024-03-22 00:00:00', '2024-03-20 18:47:57', '2024-03-22 11:31:05', 'Fora 2 dias', '0', 0, 1),
(327, 'Armando Cirillo', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-22 11:31:33', '2024-03-22 14:18:28', 'Modem', '0', 0, 1),
(328, 'Bodystation', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-22 11:31:43', '2024-03-22 14:18:39', 'Academia fechada', '0', 0, 1),
(329, 'Sesi Lab', '2024-03-25 00:00:00', '2024-03-26 00:00:00', '2024-03-22 11:37:53', '2024-03-25 19:46:11', 'Colocar modem', '0', 0, 1),
(330, 'Academia Inmove', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-22 14:18:17', '2024-03-22 14:18:17', 'Modem desconfigurado e sem internet', '0', 0, 1),
(335, 'Água Vida', '2024-03-25 00:00:00', '2024-03-26 00:00:00', '2024-03-25 12:24:47', '2024-03-25 14:59:12', 'Mudou internet', '0', 0, 1),
(337, 'Black Fit Esteiras', '2024-03-25 00:00:00', '2024-03-26 00:00:00', '2024-03-25 12:38:42', '2024-03-25 14:59:16', 'Offline 1 dia', '0', 0, 1),
(338, 'Black Fit', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 11:28:17', '2024-03-26 18:03:53', 'Trocar maquina', '0', 1, 1),
(339, 'Shopping Felicittá elevador torre A', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 11:30:25', '2024-03-26 16:06:18', 'Máquina offline 2 dias', '0', 0, 1),
(341, 'Big Box 402 Norte', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 11:32:44', '2024-03-26 18:03:45', 'Reiniciar modem', '0', 0, 1),
(342, 'Uniceub Bloco 01', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 11:35:13', '2024-03-26 18:14:17', 'modem', '0', 0, 1),
(343, 'Assis Chateaubriand', '2024-03-26 00:00:00', '2024-03-27 00:00:00', '2024-03-26 12:03:38', '2024-03-26 18:03:33', 'Reiniciar modem', '0', 0, 1),
(344, 'Big Box', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 11:36:25', '2024-03-27 14:06:39', 'Verificar para onde irão as telas', '0', 1, 1),
(346, 'Pier 21', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 11:36:51', '2024-03-27 14:06:49', 'Reiniciar modem', '0', 0, 1),
(347, 'I9 Fit', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 11:42:46', '2024-03-28 11:13:22', 'Modem', '0', 0, 1),
(348, 'Pizza Hut Águas', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 11:43:08', '2024-03-28 11:12:06', 'troca de maquina', '0', 0, 1),
(349, 'One Way Guará', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-27 12:09:35', '2024-03-27 14:06:57', 'Modem', '0', 0, 1),
(350, 'Fit Park', '2024-03-28 00:00:00', '2024-03-29 00:00:00', '2024-03-28 11:25:04', '2024-03-28 15:02:02', 'Reiniciar modem', '0', 0, 1),
(351, 'Centro Empresarial Brasília', '2024-03-28 00:00:00', '2024-03-29 00:00:00', '2024-03-28 11:25:29', '2024-03-28 14:11:48', 'Reiniciar modem Bloco B, Andar 5 Bl. A, Hall [A], Andar 3 Bl. A, Andar 8 e 4 Bl. A', '0', 0, 1),
(353, 'Espaço 115', '2024-03-28 00:00:00', '2024-03-29 00:00:00', '2024-03-28 11:26:10', '2024-03-28 15:01:58', 'Reiniciar Modem', '0', 0, 1),
(354, 'LED Diários', '2024-03-22 00:00:00', '2024-03-23 00:00:00', '2024-03-28 15:01:06', '2024-03-28 15:01:10', 'Modem', '0', 0, 1),
(355, 'LED Diários', '2024-03-28 00:00:00', '2024-03-29 00:00:00', '2024-03-28 15:01:20', '2024-03-28 15:01:53', 'Modem', '0', 0, 1),
(356, 'LED Diários', '2024-03-20 00:00:00', '2024-03-21 00:00:00', '2024-03-28 15:01:31', '2024-03-28 15:01:31', 'Modem', '0', 0, 1),
(357, 'LED Diários', '2024-03-27 00:00:00', '2024-03-28 00:00:00', '2024-03-28 15:01:43', '2024-03-28 15:01:43', 'Modem', '0', 0, 1),
(358, 'LED Diários', '2024-03-18 00:00:00', '2024-03-19 00:00:00', '2024-03-28 15:02:11', '2024-03-28 15:02:11', 'Modem', '0', 0, 1),
(359, 'Alameda - Pilar', '2024-04-01 00:00:00', '2024-04-02 00:00:00', '2024-04-01 12:31:24', '2024-04-01 14:06:15', 'Tela LG LED queimado', '0', 1, 1),
(360, 'Led Oba Vicente Pires', '2024-04-01 00:00:00', '2024-04-02 00:00:00', '2024-04-01 12:31:36', '2024-04-01 14:26:52', 'Reiniciar modem', '0', 0, 1),
(362, 'Fiore', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-01 12:37:40', '2024-04-02 14:28:54', 'Reiniciar modem', '0', 0, 1),
(363, 'Felicittá Vertical', '2024-04-01 00:00:00', '2024-04-02 00:00:00', '2024-04-01 12:42:10', '2024-04-01 20:45:19', 'Modem travado', '0', 0, 1),
(364, 'I9 Fit', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-01 12:42:28', '2024-04-02 18:36:49', 'Modem', '0', 0, 1),
(365, 'Uniceub Campus Taguatinga', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-01 12:43:56', '2024-04-02 18:37:09', 'Modem', '0', 0, 1),
(366, 'Alameda Pilar - LG', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-01 14:06:32', '2024-04-02 14:28:43', 'Trocar duas telas LG', '0', 0, 1),
(367, 'UDF Asa Sul', '2024-04-01 00:00:00', '2024-04-02 00:00:00', '2024-04-01 14:30:13', '2024-04-01 20:45:12', 'Retirada de equipamento Campus 01', '0', 0, 1),
(368, 'Pizza Hut Águas Claras', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-02 11:32:38', '2024-04-02 18:36:59', 'Configuração de tela', '0', 0, 1),
(373, 'Pier 21', '2024-04-03 00:00:00', '2024-04-04 00:00:00', '2024-04-02 16:22:12', '2024-04-03 14:10:11', 'Modem', '0', 1, 1),
(375, 'Superbom EQNL', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-02 16:23:33', '2024-04-02 19:00:13', 'Máquina fora', '0', 0, 1),
(377, 'Armando Monteiro Neto', '2024-04-02 00:00:00', '2024-04-03 00:00:00', '2024-04-02 18:37:33', '2024-04-02 18:37:33', 'Elevador C, modem', '0', 0, 1),
(380, 'CNI Academia (TeamViewer)', '2024-04-03 00:00:00', '2024-04-04 00:00:00', '2024-04-03 11:27:48', '2024-04-03 18:33:30', 'Teamviewer perdeu atribuiçao', '0', 0, 1),
(381, 'Big Box 408 Norte (TeamViewer)', '2024-04-03 00:00:00', '2024-04-04 00:00:00', '2024-04-03 11:28:19', '2024-04-03 14:10:21', 'Teamviewer estava desinstalado', '0', 0, 1),
(382, 'One Way Salão', '2024-04-04 00:00:00', '2024-04-05 00:00:00', '2024-04-04 11:19:29', '2024-04-04 16:27:54', 'Config. modem', '0', 0, 1),
(383, 'Felicittà elevador Torre A', '2024-04-04 00:00:00', '2024-04-05 00:00:00', '2024-04-04 11:20:02', '2024-04-04 16:27:47', 'Config. modem', '0', 0, 1),
(384, 'Centro Empresarial Brasília Torre B', '2024-04-04 00:00:00', '2024-04-05 00:00:00', '2024-04-04 11:20:42', '2024-04-04 18:55:49', 'Modem', '0', 0, 1);
INSERT INTO `bookings` (`id`, `title`, `start_date`, `end_date`, `created_at`, `updated_at`, `obs`, `ativo`, `prioridade`, `id_empresa`) VALUES
(385, 'SteakBull', '2024-04-05 00:00:00', '2024-04-06 00:00:00', '2024-04-04 16:28:09', '2024-04-05 14:59:05', 'Config. modem', '0', 0, 1),
(386, 'Pier 21', '2024-04-05 00:00:00', '2024-04-06 00:00:00', '2024-04-04 16:48:04', '2024-04-05 14:59:00', 'Config. modem', '0', 0, 1),
(387, 'Fit Park', '2024-04-05 00:00:00', '2024-04-06 00:00:00', '2024-04-04 19:21:53', '2024-04-05 14:58:55', 'Config. modem', '0', 0, 1),
(388, 'Ed. União', '2024-04-05 00:00:00', '2024-04-06 00:00:00', '2024-04-04 19:22:01', '2024-04-05 14:58:48', 'Config. modem', '0', 0, 1),
(389, 'UDF Campus 02', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-05 11:32:13', '2024-04-09 14:19:24', 'Configuração do Modem', '0', 0, 1),
(390, 'Painel Taquari - Acompanhar', '2024-04-08 00:00:00', '2024-04-09 00:00:00', '2024-04-05 12:12:35', '2024-04-09 11:40:42', 'Ledwave não compareceu', '0', 0, 1),
(391, 'Big Box 208 Norte', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-08 11:36:00', '2024-04-09 18:35:47', 'Configuração do Modem', '0', 0, 1),
(392, 'Felicittà - Vertical / Videowall', '2024-04-08 00:00:00', '2024-04-09 00:00:00', '2024-04-08 11:37:36', '2024-04-08 16:03:06', 'Modem', '0', 1, 1),
(393, 'Shopping Metrópoles', '2024-04-08 00:00:00', '2024-04-09 00:00:00', '2024-04-08 11:38:06', '2024-04-08 16:03:12', 'Modem', '0', 1, 1),
(394, 'Upis Asa Sul', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-08 16:03:26', '2024-04-09 14:19:17', 'Configuração do Modem', '0', 0, 1),
(395, 'Centro Empresarial Brasília', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-08 17:28:58', '2024-04-09 14:18:51', 'Faltando: Troca de modem do bloco B e máquina hall do A', '0', 0, 1),
(396, 'Uniceub', '2024-04-09 00:00:00', '2024-04-10 00:00:00', '2024-04-09 11:40:31', '2024-04-09 18:35:00', 'Modem', '0', 0, 1),
(397, 'CNI - Roberto Elevador', '2024-04-10 00:00:00', '2024-04-11 00:00:00', '2024-04-09 11:41:12', '2024-04-10 18:07:05', 'Pedir para reiniciar modem', '0', 0, 1),
(398, 'Centro Empresarial Brasília', '2024-04-10 00:00:00', '2024-04-11 00:00:00', '2024-04-09 14:20:00', '2024-04-10 14:26:25', 'Levar modem e máquina com cabo de força', '0', 0, 1),
(399, 'Uniceub', '2024-04-10 00:00:00', '2024-04-11 00:00:00', '2024-04-09 18:35:35', '2024-04-10 18:06:44', 'Bloco 02: Kramer, Pier: Levar escada, maquina desligada', '0', 1, 1),
(400, 'Big Box 208 Norte', '2024-04-15 00:00:00', '2024-04-16 00:00:00', '2024-04-09 18:36:06', '2024-04-15 15:33:06', 'Telas todas ok', '0', 0, 1),
(401, 'Portal Fitbox 1º Andar', '2024-04-10 00:00:00', '2024-04-11 00:00:00', '2024-04-10 11:18:20', '2024-04-10 14:26:16', 'Offline 1 dia', '0', 0, 1),
(402, 'Armando - Carro F', '2024-04-12 00:00:00', '2024-04-13 00:00:00', '2024-04-10 11:18:45', '2024-04-15 11:19:59', 'Offline 1 dia', '0', 0, 1),
(403, 'Alameda Shopping', '2024-04-11 00:00:00', '2024-04-12 00:00:00', '2024-04-11 11:34:32', '2024-04-11 14:08:33', 'Tela desligada', '0', 0, 1),
(404, 'Assis Bl 01 SIC', '2024-04-11 00:00:00', '2024-04-12 00:00:00', '2024-04-11 11:37:10', '2024-04-11 22:04:05', 'Offline', '0', 0, 1),
(405, 'Superbom São Sebastião', '2024-04-11 00:00:00', '2024-04-12 00:00:00', '2024-04-11 11:37:43', '2024-04-11 11:44:56', 'Aberto chamado para T.I do Superbom', '0', 0, 1),
(406, 'Big Box 408 Norte', '2024-04-15 00:00:00', '2024-04-16 00:00:00', '2024-04-11 16:53:38', '2024-04-15 15:33:45', 'Troca de tela efetuada', '0', 0, 1),
(407, 'Deck Norte', '2024-04-12 00:00:00', '2024-04-13 00:00:00', '2024-04-11 16:54:32', '2024-04-15 12:02:17', 'Modem', '0', 0, 1),
(408, 'Pizza hut Asa sul', '2024-04-12 00:00:00', '2024-04-13 00:00:00', '2024-04-11 16:55:02', '2024-04-15 11:20:16', 'Pendencia: Só está dando imagem em uma tela', '0', 0, 1),
(409, 'Steakbull', '2024-04-15 00:00:00', '2024-04-16 00:00:00', '2024-04-11 16:55:13', '2024-04-15 19:48:28', 'Pendencia: Trocar aavaras', '0', 0, 1),
(411, 'Pizza Hut Asa Sul', '2024-04-15 00:00:00', '2024-04-16 00:00:00', '2024-04-15 11:20:30', '2024-04-15 19:47:56', 'Pendencia: Só está dando imagem em uma tela', '0', 1, 1),
(412, 'Big Box 105 Sudoeste', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 11:23:34', '2024-04-16 15:08:12', 'Pendência: Levar 104 tnt', '0', 0, 1),
(413, 'Big Box CN 01', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 11:23:46', '2024-04-16 13:01:28', 'Máquina travada, pendência: 1 fonte tnt', '0', 0, 1),
(415, 'Pizza Hut Asa Sul', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 19:48:13', '2024-04-16 18:32:37', 'Pendencia: trocar maquina', '0', 1, 1),
(416, 'Steakbull', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 19:48:47', '2024-04-16 20:45:19', 'Trocados Aavara por Discabos, Pendencia: Trocar maquina', '0', 1, 1),
(417, 'Pegar Mini-pc Taguatinga', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 19:49:15', '2024-04-16 15:09:15', 'Fazer a compra do mini pc.', '0', 1, 1),
(418, 'LED Aeroporto 10:30', '2024-04-16 00:00:00', '2024-04-17 00:00:00', '2024-04-15 19:52:13', '2024-04-16 16:15:07', 'Problema na configuração da bios e da TB', '0', 0, 1),
(420, 'Big Box CN 01', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-16 13:01:43', '2024-04-19 15:11:13', 'Trocar fonte tnt', '0', 0, 1),
(421, 'Big Box 105 Sudoeste', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-16 15:08:22', '2024-04-19 15:11:04', 'Pendência: Levar 104 tnt', '0', 0, 1),
(423, 'SteakBull', '2024-04-17 00:00:00', '2024-04-18 00:00:00', '2024-04-16 20:45:34', '2024-04-18 11:42:22', 'Pendencia: Trocar maquina', '0', 1, 1),
(424, 'LED Oba Taquari 10h', '2024-04-17 00:00:00', '2024-04-18 00:00:00', '2024-04-17 11:15:07', '2024-04-18 11:42:11', 'Acompanhar rosenilton', '0', 1, 1),
(425, 'Assis Torre A', '2024-04-17 00:00:00', '2024-04-18 00:00:00', '2024-04-17 11:26:54', '2024-04-18 11:42:05', 'Configurar modem', '0', 0, 1),
(426, 'Pier 21 elevador', '2024-04-17 00:00:00', '2024-04-18 00:00:00', '2024-04-17 12:05:16', '2024-04-18 11:42:17', 'Trocar modem', '0', 0, 1),
(427, 'SteakBull', '2024-04-18 00:00:00', '2024-04-19 00:00:00', '2024-04-18 11:42:36', '2024-04-18 17:02:56', 'Organizado cabos, switch e telas', '0', 1, 1),
(428, 'Big Box Paineras', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-18 11:42:54', '2024-04-19 15:11:38', 'Máquina offline', '0', 0, 1),
(429, 'Big Box Sibéria', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-18 11:43:08', '2024-04-19 18:21:52', 'Uma tela com defeito samsung borda fina', '0', 0, 1),
(431, 'Uniceub', '2024-04-18 00:00:00', '2024-04-19 00:00:00', '2024-04-18 11:51:33', '2024-04-18 19:22:54', 'Reitoria, Professores e RH Bloco 01, Professores Bl 03, Bloco 01, 05 e 12 Shaft', '0', 0, 1),
(432, 'Zimbrus Asa Sul', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-18 15:39:18', '2024-04-19 18:22:07', 'Tela funçao nao suportada', '0', 0, 1),
(433, 'Centro Clinico Julio Adnet', '2024-04-19 00:00:00', '2024-04-20 00:00:00', '2024-04-19 11:39:54', '2024-04-19 18:22:01', 'Maquina off 1 dia', '0', 0, 1),
(434, 'Armando Cirillo', '2024-04-22 09:00:00', '2024-04-22 09:00:00', '2024-04-23 15:26:44', '2024-04-23 15:26:44', 'Internet sem conexao', '0', 0, 1),
(435, 'CNI', '2024-04-22 15:00:00', '2024-04-22 15:00:00', '2024-04-23 15:27:08', '2024-04-23 15:27:08', 'Elevadores Armando, Rack', '0', 1, 1),
(436, 'Liberty Mall', '2024-04-22 14:00:00', '2024-04-22 14:00:00', '2024-04-23 15:27:54', '2024-04-23 15:27:54', 'Vistoria com engenheira para instalaçao', '0', 1, 1),
(437, 'UDF Campus 02', '2024-04-22 09:00:00', '2024-04-22 09:00:00', '2024-04-23 15:28:11', '2024-04-23 15:28:11', 'Maquina offline 2 dias', '0', 0, 1),
(438, 'Centro Empresarial Brasília', '2024-04-23 09:00:00', '2024-04-23 09:00:00', '2024-04-23 15:28:38', '2024-04-23 15:28:38', 'Torre B Sic\'s', '0', 0, 1),
(439, 'Centro Clínico Julio Adnet', '2024-04-23 14:00:00', '2024-04-23 14:00:00', '2024-04-23 15:29:20', '2024-04-23 15:29:00', 'Ver questão da internet do local', '0', 0, 1),
(440, 'UNICEUB', '2024-04-23 15:00:00', '2024-04-23 15:00:00', '2024-04-23 15:30:04', '2024-04-23 15:30:04', 'RH Bloco 01 e Shaft Bloco 01 offline', '0', 0, 1),
(443, 'Big Box Sibéria', '2024-04-26 14:00:00', '2024-04-26 09:00:00', '2024-04-29 08:29:50', '2024-04-23 15:31:15', 'Trocada tela com defeito, ainda tem uma tela queimada poi está em baixo do ar condicionado que está vazando.', '0', 1, 1),
(446, 'UDF Campus 02', '2024-04-24 14:00:00', '2024-04-24 09:00:00', '2024-04-24 13:43:53', '2024-04-24 08:18:40', 'Máquina offline 1 dia', '0', 0, 1),
(448, 'Assis (Cima Elevador)', '2024-04-24 14:00:00', '2024-04-24 09:00:00', '2024-04-24 13:43:47', '2024-04-24 08:19:44', 'Offline 1 dia', '0', 0, 1),
(449, 'Felicittá Vertical', '2024-04-24 09:00:00', '2024-04-24 09:00:00', '2024-04-24 08:20:40', '2024-04-24 08:20:40', ' Máquina offline 2 dias', '0', 0, 1),
(450, 'Pegar MiniPC (Taguatinga)', '2024-04-24 09:00:00', '2024-04-24 09:00:00', '2024-04-24 08:21:31', '2024-04-24 08:21:31', 'Pegar o que havia deixado para reparo na compra.', '0', 0, 1),
(451, 'Big Box CN 01', '2024-04-24 09:00:00', '2024-04-24 09:00:00', '2024-04-24 08:47:00', '2024-04-24 08:47:00', 'Trocar bateria CMOS', '0', 1, 1),
(452, 'Deck Norte', '2024-04-26 15:00:00', '2024-04-26 09:00:00', '2024-04-26 10:06:59', '2024-04-24 13:43:36', 'Modem', '0', 1, 1),
(453, 'Pizza Hut Águas Claras', '2024-04-25 10:00:00', '2024-04-25 09:00:00', '2024-04-24 17:04:22', '2024-04-24 17:04:07', 'Trocar telas por multilaser', '0', 1, 1),
(455, 'UNICEUB RH', '2024-04-25 16:00:00', '2024-04-25 04:00:00', '2024-04-25 08:30:54', '2024-04-25 08:30:37', 'Trocar máquina', '0', 1, 1),
(456, 'CNI', '2024-04-25 14:30:00', '2024-04-25 14:30:00', '2024-04-25 09:53:48', '2024-04-25 09:53:48', 'Agendado com tecnico de elevador', '0', 1, 1),
(458, 'Big Box QI 11', '2024-04-25 15:00:00', '2024-04-25 15:00:00', '2024-04-25 13:47:09', '2024-04-25 13:47:09', 'Máquina offline', '0', 0, 1),
(459, 'Pizza Hut Águas Claras', '2024-04-26 11:00:00', '2024-04-26 11:00:00', '2024-04-26 10:06:08', '2024-04-26 10:06:08', 'Trocar uma tela multilaser', '0', 1, 1),
(460, 'Fitmore', '2024-04-26 09:00:00', '2024-04-26 09:00:00', '2024-04-26 10:06:32', '2024-04-26 10:06:32', 'Confirmar funcionamento e deixar controle multilaser', '0', 0, 1),
(461, 'Big Box Taguatinga Centro', '2024-04-26 09:00:00', '2024-04-26 09:00:00', '2024-04-26 10:06:46', '2024-04-26 10:06:46', 'Trocar maquina', '0', 1, 1),
(462, 'CEB', '2024-04-29 09:00:00', '2024-04-29 09:00:00', '2024-04-29 08:30:35', '2024-04-29 08:30:35', 'Trocar maquina 3B, 7A, 5B e Elevador A', '0', 1, 1),
(463, 'Pizza Cesar Taguatinga', '2024-04-29 16:00:00', '2024-04-29 09:00:00', '2024-04-29 09:19:19', '2024-04-29 08:35:51', 'Offline 2 dias', '0', 0, 1),
(464, 'Agua Vida', '2024-04-29 15:00:00', '2024-04-29 09:00:00', '2024-04-29 09:19:07', '2024-04-29 08:36:02', 'Offline 2 dias', '0', 0, 1),
(465, 'Big Box 413 Sul', '2024-04-29 11:00:00', '2024-04-29 09:00:00', '2024-04-29 09:19:30', '2024-04-29 08:36:20', 'Offline 3 dias', '0', 0, 1),
(466, 'Uniceub Bloco 09 Shaft', '2024-04-30 09:00:00', '2024-04-30 09:00:00', '2024-04-29 08:36:38', '2024-04-29 08:36:38', 'Offline 2 dias', '0', 0, 1),
(469, 'Big Box 408 Norte', '2024-04-30 09:00:00', '2024-04-30 09:00:00', '2024-04-29 08:55:12', '2024-04-29 08:55:12', 'Offline 3 dias', '0', 0, 1),
(470, 'Big Box 301 Sudoeste', '2024-04-29 14:00:00', '2024-04-29 14:00:00', '2024-04-29 09:18:53', '2024-04-29 09:18:53', 'Offline 2 dias', '0', 0, 1),
(471, 'Pizza Cesar Taguatinga', '2024-05-02 14:00:00', '2024-05-02 14:00:00', '2024-04-29 16:24:40', '2024-04-29 16:24:40', 'Trocado modem de lugar, identificar cabo para conectar na internet', '0', 0, 1),
(473, 'Bonamix Samambaia Caixa', '2024-05-02 15:00:00', '2024-05-02 09:00:00', '2024-05-02 09:19:34', '2024-05-02 09:19:12', 'Offline 1 dia', '0', 0, 1),
(475, 'Superbom QS 106 Caixa', '2024-05-02 09:00:00', '2024-05-02 09:00:00', '2024-05-02 09:21:19', '2024-05-02 09:21:19', 'Offline', '0', 0, 1),
(476, 'Água Vida', '2024-05-03 09:00:00', '2024-05-03 09:00:00', '2024-05-02 16:54:55', '2024-05-02 16:54:55', 'Recolher materiais', '0', 0, 1),
(477, 'Shopping Metropoles', '2024-05-03 09:00:00', '2024-05-03 09:00:00', '2024-05-03 08:48:23', '2024-05-03 08:48:23', 'Offline 1 dia, maquina burger king', '0', 0, 1),
(478, 'CEB - 8A', '2024-05-03 15:00:00', '2024-05-03 15:00:00', '2024-05-03 08:48:47', '2024-05-03 08:48:47', 'Perdeu configuração de ligar e data/hora.', '0', 1, 1),
(479, 'CNI', '2024-05-07 15:00:00', '2024-05-07 09:00:00', '2024-05-07 08:30:41', '2024-05-03 12:14:34', 'Trocar modens e chips', '0', 1, 1),
(481, 'CEB - 8A', '2024-05-06 15:00:00', '2024-05-06 09:00:00', '2024-05-06 09:08:53', '2024-05-06 08:43:46', 'Maquina ficou sem hdmi', '0', 1, 1),
(482, 'Armando Cirillo', '2024-05-06 09:00:00', '2024-05-06 09:00:00', '2024-05-06 08:47:19', '2024-05-06 08:47:19', 'Modem', '0', 0, 1),
(483, 'SteakBull', '2024-05-06 09:00:00', '2024-05-06 09:00:00', '2024-05-06 09:07:01', '2024-05-06 09:07:01', 'Trocar chip do modem', '0', 0, 1),
(486, 'Academia Fiore', '2024-05-08 09:00:00', '2024-05-08 09:00:00', '2024-05-06 09:10:05', '2024-05-06 09:10:05', 'Trocar chip do modem', '0', 0, 1),
(487, 'Shopping Felicittà', '2024-05-07 09:30:00', '2024-05-07 09:00:00', '2024-05-07 10:52:39', '2024-05-06 09:10:54', 'Trocar chip do modem', '0', 1, 1),
(489, 'Instalar Mandala', '2024-05-07 14:00:00', '2024-05-06 15:00:00', '2024-05-07 08:48:21', '2024-05-06 11:50:39', 'Instalar mandala na base', '0', 0, 1),
(491, 'Pizza Hut Águas Claras', '2024-05-07 11:00:00', '2024-05-07 09:00:00', '2024-05-07 08:29:50', '2024-05-06 17:28:13', 'Duas telas desligadas', '0', 0, 1),
(492, 'Armando Cirillo', '2024-05-08 14:00:00', '2024-05-08 03:00:00', '2024-05-08 08:19:56', '2024-05-07 10:49:35', 'Trocar um kramer e uma fonte.', '0', 1, 1),
(493, 'Shopping Felicittà', '2024-05-08 09:00:00', '2024-05-08 09:00:00', '2024-05-07 10:53:33', '2024-05-07 10:53:33', 'tela desligada no subsolo, levar TNT', '0', 1, 1),
(494, 'One Way Guara', '2024-05-07 10:00:00', '2024-05-07 10:00:00', '2024-05-07 13:27:51', '2024-05-07 13:27:51', 'Troca de chips', '0', 0, 1),
(495, 'Steakbull', '2024-05-08 15:00:00', '2024-05-08 15:00:00', '2024-05-07 17:19:22', '2024-05-07 17:19:22', 'Tela desligada', '0', 1, 1),
(497, 'Big Box 301 Sudoeste', '2024-05-09 09:00:00', '2024-05-09 09:00:00', '2024-05-08 08:22:51', '2024-05-08 08:22:51', 'Offline 1 dia', '0', 0, 1),
(498, 'Comprar equipamento SIA', '2024-05-09 14:00:00', '2024-05-09 14:00:00', '2024-05-09 08:37:29', '2024-05-09 08:37:29', 'Compra de equipamentos para liberty', '0', 1, 1),
(499, 'Steakbull', '2024-05-10 09:00:00', '2024-05-10 09:00:00', '2024-05-09 08:38:05', '2024-05-09 08:38:05', 'Colocar maquina de volta', '0', 1, 1),
(500, 'Julio Adnet Centro Clinico', '2024-05-09 09:00:00', '2024-05-09 09:00:00', '2024-05-09 09:17:21', '2024-05-09 09:17:21', 'Trocar chip do modem', '0', 0, 1),
(501, 'Armando Cirillo', '2024-05-09 11:00:00', '2024-05-09 11:00:00', '2024-05-09 09:17:44', '2024-05-09 09:17:44', 'Kramer apresentou defeito', '0', 0, 1),
(502, 'Buscar Equipamento Leroy', '2024-05-09 15:00:00', '2024-05-09 15:00:00', '2024-05-09 11:05:18', '2024-05-09 11:05:18', '', '0', 0, 1),
(503, 'Assis Chateaubriand', '2024-05-13 09:30:00', '2024-05-13 09:00:00', '2024-05-10 10:58:16', '2024-05-09 14:40:57', 'Trocar chips', '0', 1, 1),
(504, 'Liberty Mall ', '2024-05-10 14:00:00', '2024-05-10 14:00:00', '2024-05-09 17:45:54', '2024-05-09 17:45:54', 'Entregar materiais', '0', 0, 1),
(505, 'Ultra Cruzeiro', '2024-05-10 14:00:00', '2024-05-10 14:00:00', '2024-05-10 08:37:54', '2024-05-10 08:37:54', '', '0', 0, 1),
(506, 'Pier 21', '2024-05-10 09:00:00', '2024-05-10 09:00:00', '2024-05-10 09:11:20', '2024-05-10 09:11:20', 'Trocar chip do modem', '0', 0, 1),
(507, 'Ultra Cruzeiro', '2024-05-13 14:00:00', '2024-05-13 09:00:00', '2024-05-13 08:44:27', '2024-05-10 14:21:51', 'Kramer com defeito/Senha wi-fi', '0', 1, 1),
(508, 'CEB', '2024-05-13 10:30:00', '2024-05-13 09:00:00', '2024-05-13 11:32:39', '2024-05-10 15:34:01', 'Troca de chip, troca de maquina 8 A', '0', 1, 1),
(510, 'Bonamix Frios', '2024-05-13 15:00:00', '2024-05-13 15:00:00', '2024-05-13 08:50:16', '2024-05-13 08:50:16', 'Offline 2 dias', '0', 0, 1),
(511, 'Pizza Hut Águas Claras', '2024-05-14 15:00:00', '2024-05-13 15:00:00', '2024-05-13 16:34:44', '2024-05-13 13:25:32', 'Deixar controle multilaser', '0', 0, 1),
(512, 'Levar TV p/ assistencia Asa N.', '2024-05-14 09:00:00', '2024-05-14 09:00:00', '2024-05-14 09:07:11', '2024-05-13 13:27:38', '', '0', 1, 1),
(513, 'Academia Julio Adnet', '2024-05-14 14:00:00', '2024-05-14 14:00:00', '2024-05-14 08:38:13', '2024-05-14 08:38:13', 'Offline 01 dia bebedouro', '0', 0, 1),
(514, 'Big Box 106 Norte', '2024-05-14 09:00:00', '2024-05-14 09:00:00', '2024-05-14 08:42:02', '2024-05-14 08:42:02', 'Colocar modem', '0', 0, 1),
(515, 'Big Box 408 Norte', '2024-05-14 09:00:00', '2024-05-14 09:00:00', '2024-05-14 08:42:17', '2024-05-14 08:42:17', 'Colocar modem', '0', 0, 1),
(516, 'i9 Fit', '2024-05-14 15:00:00', '2024-05-14 15:00:00', '2024-05-14 13:28:19', '2024-05-14 13:28:19', 'Offline e sem acesso. Trocar  chip', '0', 0, 1),
(517, 'Pegar TV Assistencia', '2024-05-15 14:00:00', '2024-05-15 09:00:00', '2024-05-15 08:56:04', '2024-05-14 16:19:30', 'Recolher duas samsungs que foram deixadas para reparo', '0', 1, 1),
(518, 'Fausto Manoel Sudoeste', '2024-05-17 09:00:00', '2024-05-17 09:00:00', '2024-05-14 16:19:54', '2024-05-14 16:19:54', 'Troca de tela', '0', 1, 1),
(519, 'Runway Sudoeste', '2024-05-15 09:00:00', '2024-05-15 09:00:00', '2024-05-15 11:03:46', '2024-05-14 16:20:27', 'Escritorio desligada, tela de 75 configuraçao', '0', 0, 1),
(520, 'Steakbull', '2024-05-15 09:00:00', '2024-05-15 09:00:00', '2024-05-15 11:03:09', '2024-05-15 08:55:38', 'Modem travado', '0', 0, 1),
(521, 'Fit Park', '2024-05-15 14:00:00', '2024-05-15 14:00:00', '2024-05-15 11:04:37', '2024-05-15 08:56:27', 'Offline 1 dia', '0', 0, 1),
(522, 'CNI', '2024-05-15 14:00:00', '2024-05-15 14:00:00', '2024-05-15 10:46:50', '2024-05-15 10:46:50', 'Térreo do Roberto', '0', 1, 1),
(523, 'Portal Fitbox', '2024-05-15 09:00:00', '2024-05-15 09:00:00', '2024-05-15 11:04:28', '2024-05-15 11:04:28', 'Troca de chip', '0', 0, 1),
(524, 'Academia Julio Adnet', '2024-05-16 09:00:00', '2024-05-16 09:00:00', '2024-05-15 11:05:38', '2024-05-15 11:05:38', 'Troca de tela', '0', 1, 1),
(526, 'CEB - 8B', '2024-05-16 14:00:00', '2024-05-16 14:00:00', '2024-05-16 08:55:58', '2024-05-16 08:55:58', 'Tela desligada', '0', 0, 1),
(527, 'Edifício União', '2024-05-16 14:00:00', '2024-05-16 14:00:00', '2024-05-16 13:25:52', '2024-05-16 13:25:52', 'Troca de Chip', '0', 0, 1),
(528, 'Sesi Lab', '2024-05-20 14:00:00', '2024-05-20 09:00:00', '2024-05-17 11:17:57', '2024-05-16 13:26:21', 'Troca de chips', '0', 0, 1),
(529, 'Deck Norte', '2024-05-21 10:00:00', '2024-05-17 14:00:00', '2024-05-17 11:17:43', '2024-05-16 13:29:33', 'Trocar chip do modem', '0', 0, 1),
(531, 'Espaço 115', '2024-05-21 09:00:00', '2024-05-17 14:00:00', '2024-05-20 09:25:15', '2024-05-16 13:29:56', 'Trocar chip do modem', '0', 0, 1),
(532, 'Levar TV p/ assistencia Asa N.', '2024-05-17 14:00:00', '2024-05-17 14:00:00', '2024-05-17 08:26:29', '2024-05-17 08:26:29', 'Levar a TV para a assistência tecnica', '0', 0, 1),
(533, 'Big Box 208 Norte', '2024-05-17 14:00:00', '2024-05-17 14:00:00', '2024-05-17 08:50:28', '2024-05-17 08:50:28', 'Trocar chip', '0', 0, 1),
(534, 'Uniceub', '2024-05-17 14:00:00', '2024-05-17 09:00:00', '2024-05-17 09:01:49', '2024-05-17 09:00:56', 'Corporativo offline', '0', 0, 1),
(535, 'Pegar TV Assistencia', '2024-05-20 16:00:00', '2024-05-20 09:00:00', '2024-05-17 11:18:28', '2024-05-17 09:04:13', '', '0', 1, 1),
(537, 'Alameda Shopping', '2024-05-17 09:00:00', '2024-05-17 09:00:00', '2024-05-17 10:37:37', '2024-05-17 10:37:33', 'Tela queimada', '0', 0, 1),
(538, 'Alameda Shopping', '2024-05-20 08:20:00', '2024-05-20 08:00:00', '2024-05-17 11:10:57', '2024-05-17 11:10:50', 'Troca de tela', '0', 1, 1),
(539, 'Uniceub Campus Taguatinga', '2024-05-20 10:00:00', '2024-05-20 10:00:00', '2024-05-17 11:17:16', '2024-05-17 11:17:16', 'Trocar chip do modem', '0', 0, 1),
(540, 'Fit Park', '2024-05-20 16:00:00', '2024-05-20 16:00:00', '2024-05-20 07:24:10', '2024-05-20 07:24:10', 'Trocar tela', '0', 0, 1),
(541, 'Uniceub Campus Taguatinga', '2024-05-22 09:00:00', '2024-05-22 09:00:00', '2024-05-20 11:13:34', '2024-05-20 11:13:34', 'Troca de Mini pc', '0', 1, 1),
(543, 'Big Box Taguatinga Centro', '2024-05-20 11:00:00', '2024-05-20 11:00:00', '2024-05-20 11:31:38', '2024-05-20 11:31:38', 'Maquina travada', '0', 1, 1),
(547, 'Big Box 106 Norte', '2024-05-21 09:00:00', '2024-05-21 09:00:00', '2024-05-21 08:35:08', '2024-05-21 08:35:08', 'Offline 1 dia', '0', 0, 1),
(548, 'Big Box 508 Asa Sul', '2024-05-21 14:00:00', '2024-05-21 14:00:00', '2024-05-21 08:36:32', '2024-05-21 08:36:32', 'Colocar Modem', '0', 0, 1),
(549, 'Portal FitBox', '2024-05-21 15:00:00', '2024-05-21 15:00:00', '2024-05-21 08:38:18', '2024-05-21 08:38:18', 'Offline 1 dia', '0', 0, 1),
(550, 'Trocar óleo da fiorino', '2024-05-22 14:00:00', '2024-05-22 14:00:00', '2024-05-21 09:20:08', '2024-05-21 09:20:08', '', '0', 0, 1),
(551, 'Sesi Lab', '2024-05-22 14:00:00', '2024-05-22 14:00:00', '2024-05-22 08:41:38', '2024-05-22 08:41:38', 'Maquinas offline', '0', 1, 1),
(552, 'CEB - 8B', '2024-05-23 09:00:00', '2024-05-23 09:00:00', '2024-05-23 09:03:41', '2024-05-23 09:03:41', 'Troca de tela', '0', 0, 1),
(554, 'World Gym Sobradinho', '2024-05-28 14:00:00', '2024-05-27 09:00:00', '2024-05-28 12:07:49', '2024-05-23 10:48:34', 'Instalação, responsável: Rafael', '0', 0, 1),
(555, 'BlackFit', '2024-05-23 14:00:00', '2024-05-23 14:00:00', '2024-05-23 11:48:15', '2024-05-23 11:48:15', 'Troca de chip do modem', '0', 0, 1),
(556, 'Bonamix Frios', '2024-05-23 15:00:00', '2024-05-23 15:00:00', '2024-05-23 11:48:38', '2024-05-23 11:48:38', 'Troca de mini pc', '0', 0, 1),
(557, 'Academia Omni', '2024-05-24 09:00:00', '2024-05-24 09:00:00', '2024-05-24 08:20:16', '2024-05-24 08:20:16', 'Máquina offline - Pico de energia', '0', 0, 1),
(558, 'Bodystation', '2024-05-24 14:00:00', '2024-05-24 14:00:00', '2024-05-24 08:20:44', '2024-05-24 08:20:44', 'Trocar chip do modem', '0', 0, 1),
(559, 'InMove', '2024-05-24 09:00:00', '2024-05-24 14:00:00', '2024-05-24 08:55:48', '2024-05-24 08:20:52', 'Trocar chip do modem', '0', 0, 1),
(560, 'Cirqus', '2024-05-24 14:00:00', '2024-05-24 14:00:00', '2024-05-24 08:35:21', '2024-05-24 08:35:21', 'Máquina offline', '0', 0, 1),
(561, 'Big Box 310 Norte', '2024-05-24 14:00:00', '2024-05-24 14:00:00', '2024-05-24 14:50:09', '2024-05-24 14:50:09', 'Maquina travada', '0', 0, 1),
(562, 'Sesi Lab', '2024-05-27 14:00:00', '2024-05-27 09:00:00', '2024-05-27 13:24:07', '2024-05-27 08:27:29', 'Máquinas offline', '0', 1, 1),
(564, 'One Way', '2024-05-27 09:00:00', '2024-05-27 09:00:00', '2024-05-27 08:33:10', '2024-05-27 08:33:10', 'As duas máquinas fora', '0', 0, 1),
(566, 'Felicitta Shopping', '2024-05-27 09:00:00', '2024-05-27 09:00:00', '2024-05-27 08:38:15', '2024-05-27 08:38:15', 'Videowall/Elevador', '0', 1, 1),
(568, 'Academia Ultra - Cruzeiro', '2024-05-27 16:00:00', '2024-05-27 14:00:00', '2024-05-27 13:23:58', '2024-05-27 11:41:01', 'Offline 1 dia', '0', 0, 1),
(569, 'Buscar Moto', '2024-05-27 17:00:00', '2024-05-27 17:00:00', '2024-05-27 16:19:41', '2024-05-27 13:18:56', 'Moto não estava pronta.', '0', 1, 1),
(571, 'Pier 21', '2024-05-28 10:00:00', '2024-05-28 09:00:00', '2024-05-28 12:08:19', '2024-05-27 13:33:50', 'Chips sem internet', '0', 1, 1),
(573, 'Steakbull', '2024-05-28 10:00:00', '2024-05-28 09:00:00', '2024-05-28 12:08:37', '2024-05-28 08:29:52', 'Troca de chip', '0', 0, 1),
(575, 'World Gym Sobradinho', '2024-05-28 09:00:00', '2024-05-28 09:00:00', '2024-05-28 09:01:56', '2024-05-28 09:01:56', 'Vistoria', '0', 0, 1),
(576, 'Pier 21', '2024-05-29 09:00:00', '2024-05-29 09:00:00', '2024-05-29 08:33:43', '2024-05-28 17:35:01', 'Troca de tela', '0', 1, 1),
(577, 'Armando Cirillo', '2024-05-29 10:00:00', '2024-05-29 10:00:00', '2024-05-29 08:34:18', '2024-05-29 08:34:18', 'Reiniciar modem', '0', 1, 1),
(578, 'Academia Omni', '2024-05-29 14:00:00', '2024-05-29 14:00:00', '2024-05-29 08:35:32', '2024-05-29 08:35:32', 'Telas desligadas', '0', 1, 1),
(579, 'Pizza Hut Aguas Claras', '2024-05-29 15:00:00', '2024-05-29 15:00:00', '2024-05-29 08:35:47', '2024-05-29 08:35:47', 'Máquina fora', '0', 1, 1),
(580, 'Ceb - 3A', '2024-05-29 14:00:00', '2024-05-29 14:00:00', '2024-05-29 12:27:23', '2024-05-29 12:27:23', 'Tela apagada', '0', 1, 1),
(583, 'Julio Adnet Centro Clinico', '2024-05-29 14:00:00', '2024-05-29 14:00:00', '2024-05-29 13:40:21', '2024-05-29 13:40:21', 'Trocar chip do modem', '0', 1, 1),
(585, 'Uniceub Campus Taguatinga', '2024-05-29 14:00:00', '2024-05-29 14:00:00', '2024-05-29 13:40:39', '2024-05-29 13:40:39', 'Trocar chip do modem', '0', 1, 1),
(586, 'Big Box 402 Norte', '2024-05-31 14:00:00', '2024-05-31 09:00:00', '2024-05-31 08:14:23', '2024-05-29 13:59:23', 'Trocar fonte do sender', '0', 0, 1),
(588, 'Sesi Lab', '2024-06-03 09:00:00', '2024-06-03 09:00:00', '2024-05-31 08:10:56', '2024-05-31 08:10:56', 'Trocar chip do modem', '0', 1, 1),
(589, 'Julio Adnet Centro Clinico', '2024-05-31 09:00:00', '2024-05-31 09:00:00', '2024-05-31 08:13:48', '2024-05-31 08:13:48', 'Verificar bios', '0', 0, 1),
(591, 'Uniceub', '2024-05-31 14:00:00', '2024-05-31 14:00:00', '2024-05-31 08:33:38', '2024-05-31 08:33:38', 'Salas dos professores', '0', 0, 1),
(593, 'Uniceub', '2024-06-03 14:00:00', '2024-06-03 09:00:00', '2024-06-03 08:31:04', '2024-06-03 08:24:18', 'Sala dos professores', '0', 1, 1),
(594, 'Big Box Sibéria Lago Norte', '2024-06-03 14:00:00', '2024-06-03 09:00:00', '2024-06-03 08:30:51', '2024-06-03 08:24:50', 'Offline 5 dias', '0', 1, 1),
(595, 'Adaptação de Suporte', '2024-06-05 09:00:00', '2024-06-03 15:00:00', '2024-06-05 12:10:26', '2024-06-03 08:29:08', 'adaptar o suporte para instalar world gym', '0', 1, 1),
(596, 'Julio Adnet Centro Clinico', '2024-06-03 09:00:00', '2024-06-03 09:00:00', '2024-06-03 08:30:21', '2024-06-03 08:30:21', 'Troca de Máquina', '0', 1, 1),
(597, 'Comprar Lixa', '2024-06-03 09:00:00', '2024-06-03 09:00:00', '2024-06-03 09:10:40', '2024-06-03 09:10:40', 'compra de equipamento', '0', 1, 1),
(598, 'Big Box Taguatinga Centro', '2024-06-04 14:00:00', '2024-06-03 14:00:00', '2024-06-04 08:18:38', '2024-06-03 10:46:32', 'Offline 4 dias', '0', 1, 1),
(599, 'Pier 21', '2024-06-04 09:00:00', '2024-06-04 09:00:00', '2024-06-03 13:37:28', '2024-06-03 13:37:28', 'Arrumar molduras', '0', 1, 1),
(600, 'World Gym Sobradinho', '2024-06-05 14:00:00', '2024-06-05 09:00:00', '2024-06-05 12:11:31', '2024-06-03 16:09:06', 'Instalação', '0', 0, 1),
(601, 'Big Box 106 Norte', '2024-06-04 11:00:00', '2024-06-04 14:00:00', '2024-06-04 08:18:59', '2024-06-03 16:11:43', 'Offline 1 dia', '0', 1, 1),
(602, 'Pizza Hut Águas Claras', '2024-06-04 15:00:00', '2024-06-04 15:00:00', '2024-06-04 08:19:41', '2024-06-04 08:19:41', 'Tirar maquina de cima da bandeja', '0', 1, 1),
(603, 'Portal Fitbox', '2024-06-06 09:00:00', '2024-06-06 09:00:00', '2024-06-04 16:46:05', '2024-06-04 16:46:05', 'Uma tela fora, receiver ou sender', '0', 1, 1),
(604, 'Big Box 310 Norte', '2024-06-06 14:00:00', '2024-06-06 14:00:00', '2024-06-05 08:48:07', '2024-06-05 08:48:07', 'Offline 2 dia', '0', 0, 1),
(605, 'Zimbrus Asa Sul', '2024-06-07 09:00:00', '2024-06-07 09:00:00', '2024-06-05 13:29:43', '2024-06-05 13:29:43', 'Ver situação das telas e pegar contato responsavel', '0', 0, 1),
(606, 'Coworkout One', '2024-06-06 15:00:00', '2024-06-06 15:00:00', '2024-06-05 14:02:02', '2024-06-05 14:02:02', 'Retirada de telas', '0', 0, 1),
(607, 'Pier 21', '2024-06-06 09:00:00', '2024-06-06 09:00:00', '2024-06-06 08:45:44', '2024-06-06 08:45:44', 'troca de chips/teamviewer fora', '0', 0, 1),
(608, 'Centro Empresarial Brasilia', '2024-06-06 16:00:00', '2024-06-06 16:00:00', '2024-06-06 12:27:11', '2024-06-06 12:27:11', '3B, 5A', '0', 0, 1),
(609, 'World Gym Sobradinho', '2024-06-07 14:00:00', '2024-06-07 09:00:00', '2024-06-07 10:29:04', '2024-06-07 08:39:36', 'Colocar máquinas', '0', 1, 1),
(610, 'Portal Fitbox', '2024-06-07 09:00:00', '2024-06-07 09:00:00', '2024-07-16 14:52:19', '2024-06-07 08:39:49', 'trocar aavaara', '0', 1, 1),
(611, 'Pier 21', '2024-06-07 09:00:00', '2024-06-07 09:00:00', '2024-06-07 10:28:30', '2024-06-07 08:40:00', 'Problema no chip e elevador precisa marcar com tecnico', '0', 1, 1),
(612, 'Pier 21', '2024-06-17 09:00:00', '2024-06-12 09:00:00', '2024-06-12 16:30:36', '2024-06-07 10:28:56', 'Parar elevador para trocar receiver ou fonte', '0', 1, 1),
(613, 'Retirada Uniceub', '2024-07-10 14:00:00', '2024-07-10 14:00:00', '2024-07-09 13:18:42', '2024-06-07 11:23:08', '', '0', 1, 1),
(614, 'Retirada Uniceub', '2024-07-11 14:00:00', '2024-07-11 14:00:00', '2024-06-07 11:23:16', '2024-06-07 11:23:16', '', '0', 1, 1),
(615, 'Retirada Uniceub', '2024-07-12 14:00:00', '2024-07-12 14:00:00', '2024-06-07 11:23:25', '2024-06-07 11:23:25', '', '0', 1, 1),
(616, 'Portal Fitbox', '2024-06-11 09:00:00', '2024-06-11 09:00:00', '2024-06-11 08:59:02', '2024-06-07 12:41:39', 'Passar cabo, o de rede está danificado', '0', 1, 1),
(617, 'Armando Cirillo', '2024-06-10 09:00:00', '2024-06-10 09:00:00', '2024-06-10 08:32:46', '2024-06-10 08:32:46', 'Offline 1 dia', '0', 0, 1),
(618, 'O2 Fitness', '2024-06-10 09:00:00', '2024-06-10 09:00:00', '2024-06-10 08:32:54', '2024-06-10 08:32:54', 'Offline 1 dia', '0', 0, 1),
(620, 'LED Oba VP - Rosenilton', '2024-06-10 15:00:00', '2024-06-10 15:00:00', '2024-06-10 11:43:35', '2024-06-10 08:37:52', 'Offline 2 dias', '0', 0, 1),
(621, 'LED Oba Taquari - Rosenilton', '2024-06-10 14:00:00', '2024-06-10 15:00:00', '2024-06-10 11:43:19', '2024-06-10 08:38:16', 'Trocar chip', '0', 0, 1),
(623, 'BigBox Paineras', '2024-06-11 14:00:00', '2024-06-11 14:00:00', '2024-06-11 08:59:35', '2024-06-10 13:25:35', 'Offline 2 dias', '0', 0, 1),
(625, 'Steakbull', '2024-06-17 09:00:00', '2024-06-12 09:00:00', '2024-06-12 16:30:42', '2024-06-11 08:37:04', 'Teamviewer fora', '0', 0, 1),
(626, 'Bonamix Samambaia Caixa', '2024-06-11 14:00:00', '2024-06-11 09:00:00', '2024-06-11 08:59:30', '2024-06-11 08:58:52', 'Offline 4 dias', '0', 1, 1),
(627, 'World Gym Sobradinho', '2024-06-12 14:00:00', '2024-06-12 09:00:00', '2024-06-12 08:45:00', '2024-06-11 17:25:31', 'Colocar cabos e ligar telas', '0', 1, 1),
(628, 'Bonamix Samambaia Caixa', '2024-06-12 10:00:00', '2024-06-12 14:00:00', '2024-06-12 08:41:48', '2024-06-12 08:39:26', 'Colocar maquina', '0', 1, 1),
(629, 'Academia Julio Adnet', '2024-06-12 09:00:00', '2024-06-12 09:00:00', '2024-06-12 08:40:44', '2024-06-12 08:40:44', 'Troca de tela', '0', 1, 1),
(631, 'Alameda Shopping', '2024-06-13 09:00:00', '2024-06-13 09:00:00', '2024-06-12 16:31:13', '2024-06-12 16:31:13', 'Verificar conexões com teamviewer dos pilares', '0', 0, 1),
(632, 'Sesi Lab', '2024-06-14 14:00:00', '2024-06-13 14:00:00', '2024-06-13 09:01:52', '2024-06-13 08:44:22', 'Totem 9 e 11', '0', 1, 1),
(633, 'Big Box 402 Norte', '2024-06-14 09:00:00', '2024-06-14 09:00:00', '2024-06-13 08:45:22', '2024-06-13 08:45:22', 'Offline 1 dia', '0', 1, 1),
(635, 'Comprar suporte articulado', '2024-06-13 15:00:00', '2024-06-13 15:00:00', '2024-06-13 08:47:25', '2024-06-13 08:47:25', 'Comprar suporte', '0', 1, 1),
(636, 'Big Box Paineras', '2024-06-13 09:00:00', '2024-06-13 09:00:00', '2024-06-13 09:14:28', '2024-06-13 09:14:28', 'Trocar chip do modem', '0', 1, 1),
(637, 'CNI', '2024-06-14 15:00:00', '2024-06-14 15:00:00', '2024-06-14 08:40:29', '2024-06-14 08:40:29', 'Retirada', '0', 1, 1),
(638, 'Steakbull', '2024-06-18 11:00:00', '2024-06-18 09:00:00', '2024-06-18 09:01:18', '2024-06-14 08:41:29', 'Teamviewer perdeu atribuiçao', '0', 0, 1),
(639, 'Big Box 310 Norte', '2024-06-14 09:00:00', '2024-06-14 09:00:00', '2024-06-14 08:42:38', '2024-06-14 08:42:38', 'Offline 1 dia', '0', 1, 1),
(640, 'Big Box 408 Norte', '2024-06-14 09:00:00', '2024-06-14 09:00:00', '2024-06-14 08:43:17', '2024-06-14 08:43:17', 'Offline 2 dias', '0', 1, 1),
(641, 'Sesi Lab', '2024-06-17 14:00:00', '2024-06-17 14:00:00', '2024-06-17 08:51:15', '2024-06-17 08:51:15', 'Modem varanda superior', '0', 1, 1),
(642, 'Big Box 408 Norte', '2024-06-18 14:00:00', '2024-06-17 14:00:00', '2024-06-17 11:21:57', '2024-06-17 08:51:36', 'Troca de maquina', '0', 1, 1),
(644, 'Academia Ultra - Cruzeiro', '2024-06-18 14:00:00', '2024-06-17 14:00:00', '2024-06-17 11:21:45', '2024-06-17 08:54:38', 'Offline 3 dias', '0', 1, 1),
(646, 'Bonamix Samambaia Caixa', '2024-06-17 15:00:00', '2024-06-17 15:00:00', '2024-06-17 11:22:42', '2024-06-17 11:22:42', 'Offline sem internet', '0', 1, 1),
(647, 'World Gym', '2024-06-17 16:00:00', '2024-06-17 16:00:00', '2024-06-17 11:23:17', '2024-06-17 11:23:17', 'Offline 2 dias', '0', 1, 1),
(648, 'Vistoria - Portal Fitbox', '2024-06-18 09:00:00', '2024-06-18 09:00:00', '2024-06-18 08:43:35', '2024-06-18 08:43:35', 'Vitoria para telas novas', '0', 1, 1),
(649, 'Big Box 402 Norte', '2024-06-18 15:00:00', '2024-06-18 15:00:00', '2024-06-18 09:01:10', '2024-06-18 09:01:10', 'Trocar chip do modem', '0', 0, 1),
(650, 'Big Box 208 Norte', '2024-06-18 16:00:00', '2024-06-18 16:00:00', '2024-06-18 10:30:34', '2024-06-18 10:30:34', 'Trocar chip do modem', '0', 0, 1),
(651, 'Bodystation - Vistoria', '2024-06-19 14:00:00', '2024-06-19 14:00:00', '2024-06-19 08:59:04', '2024-06-18 16:31:12', 'Vistoria do novo local', '0', 1, 1),
(652, 'BRT', '2024-06-19 10:00:00', '2024-06-19 10:00:00', '2024-06-19 08:38:58', '2024-06-19 08:38:58', 'Vistoria', '0', 1, 1),
(653, 'Pier 21', '2024-06-25 09:00:00', '2024-06-25 09:00:00', '2024-06-19 08:39:36', '2024-06-19 08:39:36', 'Trocar kramer elevador', '0', 1, 1),
(654, 'Portal Fitbox', '2024-06-20 14:00:00', '2024-06-20 14:00:00', '2024-06-19 08:40:06', '2024-06-19 08:40:06', 'Passar cabos', '0', 0, 1),
(655, 'O2 Fitness', '2024-06-19 14:00:00', '2024-06-19 14:00:00', '2024-06-19 11:43:20', '2024-06-19 11:43:20', 'Uma tela desligada', '0', 0, 1),
(656, 'Big Box 408 Norte', '2024-06-19 14:00:00', '2024-06-19 14:00:00', '2024-06-19 11:43:47', '2024-06-19 11:43:47', 'Troca de maquina', '0', 0, 1),
(658, 'BRT - Verificar maquina', '2024-06-21 09:00:00', '2024-06-21 09:00:00', '2024-06-19 15:50:47', '2024-06-19 15:50:47', 'verificar maquinas do brt', '0', 1, 1),
(659, 'Deck Norte', '2024-06-20 09:00:00', '2024-06-20 09:00:00', '2024-06-20 08:24:18', '2024-06-20 08:24:18', 'telas desligadas', '0', 0, 1),
(661, 'O2 Fitness', '2024-06-24 09:00:00', '2024-06-24 09:00:00', '2024-06-20 17:12:22', '2024-06-20 17:12:22', 'Vistoria trazer tela de volta', '0', 0, 1),
(663, 'Portal Fitbox', '2024-06-21 14:00:00', '2024-06-21 14:00:00', '2024-06-24 08:31:31', '2024-06-24 08:31:31', 'Finalizar instalação', '0', 0, 1),
(665, 'Big Box QI 11', '2024-06-24 09:00:00', '2024-06-24 09:00:00', '2024-06-24 08:37:06', '2024-06-24 08:37:06', 'Patrimonios', '0', 0, 1),
(666, 'Armando Cirillo', '2024-06-24 09:00:00', '2024-06-24 09:00:00', '2024-06-24 08:37:35', '2024-06-24 08:37:35', 'Patrimonios', '0', 0, 1),
(667, 'Steakbull', '2024-06-25 09:00:00', '2024-06-25 09:00:00', '2024-06-25 08:31:21', '2024-06-25 08:31:21', 'Patrimonios', '0', 1, 1),
(668, 'Elevador Correio', '2024-06-25 09:00:00', '2024-06-25 09:00:00', '2024-06-25 08:38:23', '2024-06-25 08:38:23', 'Trocar chip do modem', '0', 1, 1),
(672, 'O2 Fitness', '2024-06-25 14:00:00', '2024-06-25 14:00:00', '2024-06-25 13:24:27', '2024-06-25 13:24:27', 'Finalizar instalação', '0', 1, 1),
(673, 'Big Box Taguatinga Centro', '2024-06-26 14:00:00', '2024-06-26 09:00:00', '2024-06-26 09:15:57', '2024-06-25 13:24:43', 'Todas telas fora', '0', 1, 1),
(674, 'Academia Ultra - Cruzeiro', '2024-06-26 09:00:00', '2024-06-26 09:00:00', '2024-06-26 09:14:57', '2024-06-26 08:34:44', 'Uma tela fora', '0', 1, 1),
(675, 'World Gym Sobradinho', '2024-06-26 09:00:00', '2024-06-26 14:00:00', '2024-06-26 09:15:43', '2024-06-26 08:37:12', 'Uma tela desligada e colocar maquinas na internet', '0', 0, 1),
(676, 'Bonamix Frios', '2024-06-26 15:00:00', '2024-06-26 09:00:00', '2024-06-26 09:16:05', '2024-06-26 08:44:42', 'Troca de maquina', '0', 1, 1),
(678, 'Academia Ultra - Cruzeiro', '2024-06-26 14:00:00', '2024-06-26 14:00:00', '2024-06-26 11:32:30', '2024-06-26 11:32:30', 'Troca de maquina', '0', 1, 1),
(679, 'World Gym Sobradinho', '2024-06-27 10:00:00', '2024-06-27 14:00:00', '2024-06-26 14:33:42', '2024-06-26 11:53:06', 'Trocar tela', '0', 1, 1),
(680, 'Deck Norte', '2024-06-27 09:00:00', '2024-06-27 09:00:00', '2024-06-26 14:33:54', '2024-06-26 14:33:54', 'Troca de tela', '0', 1, 1),
(681, 'Fiore', '2024-06-27 14:00:00', '2024-06-27 14:00:00', '2024-06-26 14:34:31', '2024-06-26 14:34:31', 'Troca de tela', '0', 1, 1),
(683, 'Omni', '2024-06-27 14:00:00', '2024-06-27 14:00:00', '2024-06-27 17:20:56', '2024-06-27 17:20:56', 'uma tela apagada', '0', 0, 1),
(684, 'Big Box Paineiras', '2024-06-27 14:00:00', '2024-06-27 14:00:00', '2024-06-27 17:21:18', '2024-06-27 17:21:18', 'telas foras', '0', 0, 1),
(685, 'Zimbrus Asa Sul', '2024-07-01 11:00:00', '2024-07-01 09:00:00', '2024-07-01 08:23:59', '2024-06-28 08:36:13', 'troca de tela', '0', 0, 1),
(686, 'Academia Ultra - Cruzeiro', '2024-06-28 09:00:00', '2024-06-28 09:00:00', '2024-06-28 08:46:16', '2024-06-28 08:46:16', 'Offline 1 dia', '0', 0, 1),
(688, 'Big Box 310 Norte', '2024-06-28 14:00:00', '2024-06-28 14:00:00', '2024-06-28 08:47:29', '2024-06-28 08:47:29', 'Offline 1 dia', '0', 0, 1),
(690, 'Fit One Cruzeiro - Patrimonios', '2024-06-28 09:00:00', '2024-06-28 09:00:00', '2024-06-28 08:54:18', '2024-06-28 08:54:18', 'Pegar patrimonios', '0', 0, 1),
(691, 'Big Box 301 Sudoeste', '2024-06-28 14:00:00', '2024-06-28 14:00:00', '2024-06-28 10:48:42', '2024-06-28 10:48:42', 'Telas apagadas', '0', 0, 1),
(693, 'Master Gym Gama', '2024-07-01 14:00:00', '2024-07-01 14:00:00', '2024-07-01 11:36:10', '2024-07-01 08:22:06', 'Offline 1 dia', '0', 0, 1),
(694, 'Liberty Mall', '2024-07-01 10:00:00', '2024-07-01 10:00:00', '2024-07-01 08:23:53', '2024-07-01 08:23:53', 'Marcar altura e colocar no wifi', '0', 1, 1),
(695, 'Big Box Taguatinga Centro', '2024-07-02 15:00:00', '2024-07-02 09:00:00', '2024-07-02 10:51:00', '2024-07-01 08:41:07', 'Offline 1 dia', '0', 0, 1),
(697, 'Black Fit - Patrimonio', '2024-07-01 14:00:00', '2024-07-01 14:00:00', '2024-07-01 08:42:49', '2024-07-01 08:42:49', 'pegar patrimonios', '0', 0, 1),
(698, 'Pier 21', '2024-07-10 08:30:00', '2024-07-10 08:30:00', '2024-07-01 11:22:18', '2024-07-01 11:22:18', 'Manutenção elevador', '0', 1, 1),
(699, 'Liberty Mall', '2024-07-02 09:00:00', '2024-07-02 09:00:00', '2024-07-02 08:22:48', '2024-07-02 08:22:48', 'Mover as telas', '0', 0, 1),
(700, 'World Gym Sobradinho', '2024-07-02 10:00:00', '2024-07-02 10:00:00', '2024-07-02 08:23:06', '2024-07-02 08:23:06', 'Sem sinal', '0', 0, 1),
(701, 'CEB', '2024-07-02 14:00:00', '2024-07-02 15:00:00', '2024-07-02 10:50:54', '2024-07-02 10:33:02', 'Elevador travado', '0', 0, 1),
(702, 'Deck Norte', '2024-07-03 09:00:00', '2024-07-03 09:00:00', '2024-07-02 10:44:04', '2024-07-02 10:44:04', 'Troca de tela', '0', 1, 1),
(704, 'Big Box CNB 12 Patrimonios', '2024-07-02 15:00:00', '2024-07-02 15:00:00', '2024-07-02 10:51:24', '2024-07-02 10:51:24', 'Pegar patrimonios', '0', 0, 1),
(705, 'Shopping Metropoles', '2024-07-05 09:00:00', '2024-07-05 09:00:00', '2024-07-02 16:10:10', '2024-07-02 16:10:10', 'troca de chips', '0', 1, 1),
(706, 'Big Box 413 Sul', '2024-07-03 09:00:00', '2024-07-03 14:00:00', '2024-07-03 11:56:12', '2024-07-03 08:14:54', 'Offline 1 dia', '0', 0, 1),
(707, 'Master Gym Gama', '2024-07-03 14:00:00', '2024-07-03 14:00:00', '2024-07-03 08:15:09', '2024-07-03 08:15:09', 'Troca de maquina', '0', 0, 1),
(708, 'Cirqus - Patrimonio', '2024-07-03 09:00:00', '2024-07-03 09:00:00', '2024-07-03 08:16:36', '2024-07-03 08:16:36', 'Patrimonios', '0', 0, 1),
(709, 'Espaço 115 - Patrimonio', '2024-07-03 09:00:00', '2024-07-03 09:00:00', '2024-07-03 08:16:48', '2024-07-03 08:16:48', 'Patrimonios', '0', 0, 1),
(710, 'Zimbrus Asa Sul ', '2024-07-03 09:00:00', '2024-07-03 14:00:00', '2024-07-03 11:55:37', '2024-07-03 08:37:09', 'checar tela', '0', 0, 1),
(711, 'Big Box 408 Norte', '2024-07-03 09:00:00', '2024-07-03 09:00:00', '2024-07-03 13:44:24', '2024-07-03 13:44:24', 'reiniciar modem', '0', 0, 1),
(712, 'Big Box 106 Norte', '2024-07-03 09:00:00', '2024-07-03 09:00:00', '2024-07-03 13:44:39', '2024-07-03 13:44:39', 'reiniciar modem', '0', 0, 1),
(713, 'Led Oba VP', '2024-07-03 14:00:00', '2024-07-03 14:00:00', '2024-07-03 13:44:54', '2024-07-03 13:44:54', 'reiniciar chip', '0', 0, 1),
(714, 'Uniceub - Prof. 01/12, Reitoria', '2024-07-04 14:00:00', '2024-07-04 14:00:00', '2024-07-04 08:10:52', '2024-07-04 08:10:52', 'Offline 1 dia', '0', 0, 1),
(715, 'Fit Park', '2024-07-04 14:00:00', '2024-07-04 14:00:00', '2024-07-04 08:11:03', '2024-07-04 08:11:03', 'Offline 2 dias', '0', 0, 1),
(716, 'Pier 21 - Hor/Ver, Praça', '2024-07-04 09:00:00', '2024-07-04 09:00:00', '2024-07-04 08:14:33', '2024-07-04 08:14:33', 'Offline 2 dias', '0', 0, 1),
(717, 'ACM - Patrimonios', '2024-07-04 09:00:00', '2024-07-04 09:00:00', '2024-07-04 08:14:44', '2024-07-04 08:14:44', 'Pegar patrimonios', '0', 0, 1),
(718, 'Fit One Cruzeiro', '2024-07-05 14:00:00', '2024-07-05 11:00:00', '2024-07-05 08:26:58', '2024-07-05 08:21:51', 'Offline 1 dia', '0', 0, 1),
(719, 'Felicitta Shopping', '2024-07-05 11:00:00', '2024-07-05 11:00:00', '2024-07-05 10:38:57', '2024-07-05 08:27:26', 'Vertical fora', '0', 0, 1),
(720, 'Atlas Fitness', '2024-07-05 10:00:00', '2024-07-05 10:00:00', '2024-07-05 11:37:18', '2024-07-05 11:37:18', 'Patrimonios', '0', 1, 1),
(721, 'Liberty Mall', '2024-07-08 08:00:00', '2024-07-08 08:00:00', '2024-07-05 13:29:34', '2024-07-05 13:29:34', 'Instalação', '0', 1, 1),
(723, 'Sesi Lab', '2024-07-08 10:00:00', '2024-07-08 10:00:00', '2024-07-08 10:57:56', '2024-07-08 10:57:56', 'Modens', '0', 1, 1),
(724, 'Centro Empresarial Brasilia', '2024-07-08 14:00:00', '2024-07-08 14:00:00', '2024-07-08 10:58:44', '2024-07-08 10:58:44', 'Hall A., Elevador A.', '0', 1, 1),
(725, 'Liberty Mall', '2024-07-08 15:00:00', '2024-07-08 15:00:00', '2024-07-08 13:19:07', '2024-07-08 13:19:07', 'Tela horizontal, canal', '0', 1, 1),
(726, 'Big Box Taguatinga Centro', '2024-07-09 09:00:00', '2024-07-09 09:00:00', '2024-07-08 13:19:20', '2024-07-08 13:19:20', 'Offline 2 dias', '0', 0, 1),
(727, 'Big Box Paineras', '2024-07-09 09:00:00', '2024-07-09 09:00:00', '2024-07-08 13:19:30', '2024-07-08 13:19:30', 'Telas com mensagem', '0', 0, 1),
(728, 'Assis Chateaubriand', '2024-07-08 15:00:00', '2024-07-08 14:00:00', '2024-07-08 13:30:53', '2024-07-08 13:29:42', 'Patrimonios', '0', 0, 1),
(729, 'Big Box 106 Norte', '2024-07-09 14:00:00', '2024-07-09 14:00:00', '2024-07-09 08:44:08', '2024-07-09 08:44:08', 'offline 2 dias', '0', 0, 1),
(730, 'BigBox 211 Norte - Patrimonios', '2024-07-09 15:00:00', '2024-07-09 15:00:00', '2024-07-09 13:14:32', '2024-07-09 13:12:13', 'Patrimonio', '0', 0, 1),
(731, 'BigBox 402 - Patrimonios', '2024-07-09 14:00:00', '2024-07-09 14:00:00', '2024-07-09 13:12:46', '2024-07-09 13:12:46', 'Patrimonios', '0', 0, 1),
(733, 'BigBox 208 Norte - Patrimonios', '2024-07-09 14:00:00', '2024-07-09 14:00:00', '2024-07-09 13:15:28', '2024-07-09 13:15:14', '', '0', 0, 1),
(734, 'InMove - Patrimonios', '2024-07-10 10:00:00', '2024-07-10 10:00:00', '2024-07-10 08:15:48', '2024-07-10 08:15:48', 'pegar patrimonios', '0', 0, 1),
(735, 'Pier 21', '2024-07-12 09:00:00', '2024-07-12 08:30:00', '2024-07-11 08:29:02', '2024-07-10 12:04:07', 'Elevador', '0', 1, 1),
(736, 'Big Box 508 Sul', '2024-07-12 10:00:00', '2024-07-12 09:00:00', '2024-07-11 08:29:09', '2024-07-10 12:04:30', 'Todas as telas fora', '0', 1, 1),
(737, 'Retirada Uniceub', '2024-07-11 09:00:00', '2024-07-11 09:00:00', '2024-07-11 08:28:55', '2024-07-11 08:28:55', 'Retirada', '0', 1, 1),
(738, 'Fausto Asa Norte', '2024-07-12 15:00:00', '2024-07-12 14:00:00', '2024-07-15 16:23:23', '2024-07-12 08:18:35', 'Internet do cliente apresenta defeito', '0', 0, 1),
(739, 'Edifício União', '2024-07-15 14:00:00', '2024-07-15 14:00:00', '2024-07-12 13:25:54', '2024-07-12 13:25:54', 'Retirada de telas', '0', 1, 1),
(740, 'Posto Igrejinha', '2024-07-15 14:00:00', '2024-07-15 14:00:00', '2024-07-15 16:23:15', '2024-07-15 08:38:09', 'Internet do cliente apresenta defeito', '0', 0, 1),
(741, 'Master Gym Gama', '2024-07-15 09:00:00', '2024-07-15 09:00:00', '2024-07-15 08:38:24', '2024-07-15 08:38:24', 'Offline', '0', 0, 1),
(742, 'CEB - Modem torre B', '2024-07-16 09:00:00', '2024-07-16 09:00:00', '2024-07-16 08:21:31', '2024-07-16 08:21:31', 'Sem internet', '0', 0, 1),
(743, 'Posto Igrejinha - Modem', '2024-07-16 09:00:00', '2024-07-16 09:00:00', '2024-07-16 08:24:13', '2024-07-16 08:24:13', 'colocar modem', '0', 0, 1),
(745, 'Bluefit - Patrimonios', '2024-07-16 14:00:00', '2024-07-16 14:00:00', '2024-07-16 13:24:22', '2024-07-16 13:24:22', 'Patrimonios', '0', 0, 1),
(746, 'Fit Park - Patrimonios', '2024-07-16 14:00:00', '2024-07-16 14:00:00', '2024-07-16 13:25:31', '2024-07-16 13:25:31', 'Patrimonios', '0', 0, 1),
(747, 'I9 Fit', '2024-07-17 09:00:00', '2024-07-17 09:00:00', '2024-07-17 09:22:42', '2024-07-17 09:22:42', 'Patrimonios', '0', 0, 1),
(748, 'Acquademy', '2024-07-17 09:00:00', '2024-07-17 09:00:00', '2024-07-17 09:23:03', '2024-07-17 09:23:03', 'Patrimonios', '0', 0, 1),
(749, 'World Gym Arniqueiras', '2024-07-17 09:00:00', '2024-07-17 09:00:00', '2024-07-17 09:23:25', '2024-07-17 09:23:25', 'Patrimonios', '0', 0, 1),
(750, 'Fausto Manoel Sudoeste', '2024-07-17 14:00:00', '2024-07-17 14:00:00', '2024-07-17 13:24:00', '2024-07-17 13:24:00', 'Offline 1 dia', '0', 0, 1),
(752, 'Runway Sudoeste', '2024-07-17 14:00:00', '2024-07-17 14:00:00', '2024-07-18 08:55:50', '2024-07-18 08:55:50', 'Patrimonios', '0', 0, 1),
(753, 'Pier 21 - Ver', '2024-07-18 09:00:00', '2024-07-18 09:00:00', '2024-07-18 09:03:01', '2024-07-18 09:03:01', 'Máquina vertical travada', '0', 0, 1),
(755, 'Metrô Águas Claras', '2024-07-18 14:00:00', '2024-07-18 14:00:00', '2024-07-18 13:01:01', '2024-07-18 13:01:01', 'Esconder cabo de rede', '0', 1, 1),
(756, 'Big Box Paineras (Verificar)', '2024-07-18 15:00:00', '2024-07-18 14:00:00', '2024-07-18 13:12:20', '2024-07-18 13:04:56', 'verificar telas', '0', 0, 1),
(757, 'Exame Médico', '2024-07-24 14:30:00', '2024-07-24 14:30:00', '2024-07-18 15:34:41', '2024-07-18 15:34:41', 'Raulisson e wilyklen fazer exame medico', '0', 1, 1),
(758, 'Big Box Qi 05 Lago Norte', '2024-07-19 09:00:00', '2024-07-19 09:00:00', '2024-07-19 13:04:10', '2024-07-19 08:43:41', 'Internet do cliente apresenta defeito', '0', 0, 1),
(759, 'BigBox Península - Patrimonios', '2024-07-19 09:00:00', '2024-07-19 09:00:00', '2024-07-19 08:46:29', '2024-07-19 08:46:29', 'Patrimonios', '0', 0, 1),
(760, 'Big Box Sibéria - Patrimonios', '2024-07-19 09:00:00', '2024-07-19 09:00:00', '2024-07-19 08:48:39', '2024-07-19 08:48:39', 'Patrimonios', '0', 0, 1),
(761, 'Big Box 105 Sudoeste', '2024-07-19 14:00:00', '2024-07-19 14:00:00', '2024-07-19 13:04:28', '2024-07-19 13:04:28', 'Patrimonios', '0', 0, 1),
(762, 'Big Box 301 Sudoeste', '2024-07-19 14:00:00', '2024-07-19 14:00:00', '2024-07-19 13:04:43', '2024-07-19 13:04:43', 'Patrimonios', '0', 0, 1),
(763, 'Pier 21', '2024-07-23 09:00:00', '2024-07-23 09:00:00', '2024-07-22 08:44:48', '2024-07-22 08:44:48', 'Elevador, máquina praça', '0', 0, 1),
(764, 'Fausto Manoel Sudoeste', '2024-07-22 10:00:00', '2024-07-22 10:00:00', '2024-07-22 08:47:43', '2024-07-22 08:47:43', 'Trocar modem', '0', 0, 1),
(765, 'Fausto Manoel Asa Norte', '2024-07-22 10:00:00', '2024-07-22 10:00:00', '2024-07-22 08:47:56', '2024-07-22 08:47:56', 'Colocar modem', '0', 0, 1),
(766, 'Big Box 105 Sudoeste', '2024-07-22 09:00:00', '2024-07-22 09:00:00', '2024-07-22 09:08:51', '2024-07-22 09:00:58', '4 telas piscando', '0', 0, 1),
(767, 'Big Box Paineras', '2024-07-22 14:00:00', '2024-07-22 14:00:00', '2024-07-22 11:55:51', '2024-07-22 11:55:51', 'Trocar maquina', '0', 0, 1),
(768, 'Big Box Castanheiras - Patrimônios', '2024-07-22 14:00:00', '2024-07-22 14:00:00', '2024-07-22 13:25:56', '2024-07-22 13:25:56', 'Patrimonios', '0', 0, 1),
(769, 'Pizza Cesar Taguatinga - Patrimonios', '2024-07-22 14:00:00', '2024-07-22 14:00:00', '2024-07-22 13:26:45', '2024-07-22 13:26:45', 'Patrimonios', '0', 0, 1),
(770, 'Academia Omni - Patrimonios', '2024-07-22 14:00:00', '2024-07-22 14:00:00', '2024-07-22 13:29:09', '2024-07-22 13:29:09', 'Patrimonios', '0', 0, 1),
(771, 'Big Box Lago Norte', '2024-07-23 14:00:00', '2024-07-23 14:00:00', '2024-07-22 17:00:42', '2024-07-22 17:00:42', 'Troca de tela', '0', 0, 1),
(772, 'Big Box 503 Sul - Patrimonio', '2024-07-23 10:00:00', '2024-07-23 10:00:00', '2024-07-23 09:04:30', '2024-07-23 08:57:19', 'Patrimonios', '0', 0, 1),
(774, 'Big Box 508 Sul - Patrimonios', '2024-07-23 10:00:00', '2024-07-23 09:00:00', '2024-07-23 09:06:27', '2024-07-23 09:05:34', 'Patrimonios', '0', 0, 1),
(775, 'Big Box 512 Sul - Patrimonios', '2024-07-23 10:00:00', '2024-07-23 10:00:00', '2024-07-23 09:05:57', '2024-07-23 09:05:57', 'Patrimonios', '0', 0, 1),
(777, 'Big Box 413 Sul', '2024-07-23 10:00:00', '2024-07-23 10:00:00', '2024-07-23 11:43:39', '2024-07-23 11:43:39', 'Patrimonios', '0', 0, 1),
(778, 'Pier 21', '2024-07-24 09:00:00', '2024-07-24 09:00:00', '2024-07-23 16:40:04', '2024-07-23 16:40:04', 'TROCA DE FONTE E LIMPEZA DE TELAS', '0', 1, 1),
(780, 'CEUB - Pós Bl.3 / Patrimonios', '2024-07-24 14:00:00', '2024-07-24 14:00:00', '2024-07-23 16:48:26', '2024-07-23 16:48:26', 'OFFILINE NO TEAMVIEWER E PATRIMÔNIOS', '0', 0, 1),
(781, 'Runway Sudoeste', '2024-07-24 14:00:00', '2024-07-24 14:00:00', '2024-07-24 13:33:57', '2024-07-24 13:33:57', 'Tela 75 offline', '0', 0, 1),
(782, 'Centro Empresarial Brasilia', '2024-07-25 09:00:00', '2024-07-25 09:00:00', '2024-07-25 09:17:30', '2024-07-25 08:42:34', 'Andar 2 Bl. B', '0', 0, 1),
(783, 'Studio Wellness - Patrimonio', '2024-07-25 09:00:00', '2024-07-25 10:00:00', '2024-07-25 09:17:41', '2024-07-25 08:43:18', 'Patrimonios', '0', 0, 1),
(785, 'Pizza Cesar Guara - Patrimonios', '2024-07-25 14:00:00', '2024-07-25 09:00:00', '2024-07-25 09:17:23', '2024-07-25 08:47:09', 'Patrimonios', '0', 0, 1);
INSERT INTO `bookings` (`id`, `title`, `start_date`, `end_date`, `created_at`, `updated_at`, `obs`, `ativo`, `prioridade`, `id_empresa`) VALUES
(786, 'Big Box Paineras', '2024-07-26 09:00:00', '2024-07-26 09:00:00', '2024-07-26 11:30:53', '2024-07-25 08:59:56', 'encaixe do hdmi no receiver', '0', 0, 1),
(787, 'Felicitta - Patrimonios', '2024-07-26 09:00:00', '2024-07-26 09:00:00', '2024-07-25 09:00:49', '2024-07-25 09:00:49', 'Patrimonios', '0', 0, 1),
(788, 'Estação 22 - Patrimonios', '2024-07-25 14:00:00', '2024-07-25 14:00:00', '2024-07-25 09:17:55', '2024-07-25 09:17:55', 'Patrimonios', '0', 0, 1),
(789, 'Comprar Material', '2024-07-25 15:00:00', '2024-07-25 15:00:00', '2024-07-25 13:18:37', '2024-07-25 13:18:37', 'compra de material para world gym', '0', 0, 1),
(790, 'World Gym Arniqueiras', '2024-07-26 14:00:00', '2024-07-26 09:00:00', '2024-07-26 08:25:50', '2024-07-26 08:24:09', 'Suporte frouxo, fazer troca', '0', 0, 1),
(792, 'Big Box 503 Sul', '2024-07-29 09:00:00', '2024-07-29 09:00:00', '2024-07-29 08:39:08', '2024-07-29 08:36:30', 'Offline 4 dias', '0', 0, 1),
(793, 'Atlas Fitness Terreo', '2024-07-29 10:00:00', '2024-07-29 10:00:00', '2024-07-29 08:36:47', '2024-07-29 08:36:47', 'Offline 1 dia', '0', 0, 1),
(794, 'Uniceub', '2024-07-29 14:00:00', '2024-07-29 14:00:00', '2024-07-29 08:37:09', '2024-07-29 08:37:09', 'Máquinas offline', '0', 0, 1),
(795, 'Alameda', '2024-07-30 09:00:00', '2024-07-30 09:00:00', '2024-07-30 08:26:17', '2024-07-30 08:26:17', 'Troca de tela', '0', 0, 1),
(796, 'Fitmore', '2024-07-30 09:00:00', '2024-07-30 09:00:00', '2024-07-30 08:29:32', '2024-07-30 08:26:21', 'Patrimonios', '0', 0, 1),
(797, 'Fiore', '2024-07-30 09:00:00', '2024-07-30 09:00:00', '2024-07-30 09:03:08', '2024-07-30 09:03:08', 'Patrimonios', '0', 0, 1),
(798, 'Assistência tecnica', '2024-07-30 14:00:00', '2024-07-30 14:00:00', '2024-07-30 09:03:33', '2024-07-30 09:03:33', 'deixar tela na assistencia tecnica', '0', 1, 1),
(799, 'Zimbrus Asa Sul', '2024-07-30 15:00:00', '2024-07-30 15:00:00', '2024-07-30 17:38:27', '2024-07-30 10:52:34', 'Uma tela fora', '0', 0, 1),
(800, 'Pizza Hut Asa Sul', '2024-07-30 14:00:00', '2024-07-30 14:00:00', '2024-07-30 13:11:30', '2024-07-30 13:11:30', 'Patrimonios', '0', 0, 1),
(801, 'Comprar EPI - Vicente Pires', '2024-07-31 09:00:00', '2024-07-31 09:00:00', '2024-07-31 08:44:34', '2024-07-31 08:44:34', 'Comprar equipamento', '0', 0, 1),
(802, 'Academia Julio Adnet', '2024-07-31 09:00:00', '2024-07-31 09:00:00', '2024-07-31 08:45:02', '2024-07-31 08:45:02', 'Patrimonios maquinas', '0', 0, 1),
(804, 'Led Oba Taquari', '2024-07-31 14:00:00', '2024-07-31 14:00:00', '2024-07-31 16:11:11', '2024-07-31 12:47:26', 'Re ligar led', '0', 0, 1),
(805, 'Pizza Hut Sudoeste - Patrimonios', '2024-07-31 14:00:00', '2024-07-31 14:00:00', '2024-07-31 12:47:53', '2024-07-31 12:47:53', 'Patrimonios', '0', 0, 1),
(806, 'Pier 21 ', '2024-08-01 09:00:00', '2024-08-01 09:00:00', '2024-08-01 08:47:28', '2024-08-01 08:47:28', 'Trocar máquina vertical e modem praça 01', '0', 0, 1),
(807, 'Raia 10 - Patrimonios', '2024-08-01 09:00:00', '2024-08-01 09:00:00', '2024-08-01 09:05:45', '2024-08-01 09:05:45', 'Patrimonios', '0', 0, 1),
(808, 'Estação 22 - Patrimonios', '2024-08-01 14:00:00', '2024-08-01 14:00:00', '2024-08-01 09:07:00', '2024-08-01 09:07:00', 'Patrimonios', '0', 0, 1),
(809, 'Bar Lampião - Patrimonios', '2024-08-01 14:00:00', '2024-08-01 09:00:00', '2024-08-01 11:33:13', '2024-08-01 09:07:27', 'Patrimonios', '0', 0, 1),
(810, 'Felicittá Shopping', '2024-08-02 09:00:00', '2024-08-02 09:00:00', '2024-08-01 14:44:02', '2024-08-01 14:44:02', 'Videowall e vistoria.', '0', 0, 1),
(811, 'Big Box 208 Norte', '2024-08-02 14:00:00', '2024-08-02 14:00:00', '2024-08-02 08:40:14', '2024-08-02 08:40:14', 'Offline 1 dia', '0', 0, 1),
(812, 'CEUB Taguatinga', '2024-08-02 09:00:00', '2024-08-02 09:00:00', '2024-08-02 08:45:26', '2024-08-02 08:45:26', 'Patrimonios', '0', 0, 1),
(813, 'Big Box 106 Norte', '2024-08-02 14:00:00', '2024-08-02 14:00:00', '2024-08-02 08:47:01', '2024-08-02 08:47:01', 'Patrimonios', '0', 0, 1),
(814, 'Big Box 408 Norte', '2024-08-02 14:00:00', '2024-08-02 14:00:00', '2024-08-02 08:47:14', '2024-08-02 08:47:14', 'Patrimonios', '0', 0, 1),
(815, 'Runway Sudoeste', '2024-08-05 09:00:00', '2024-08-05 09:00:00', '2024-08-05 08:37:47', '2024-08-05 08:37:47', 'Offline 1 dia', '0', 0, 1),
(816, 'Big Box 106 Norte', '2024-08-05 14:00:00', '2024-08-05 09:00:00', '2024-08-05 09:07:17', '2024-08-05 08:37:58', 'Buscar tela', '0', 0, 1),
(817, 'Assistência tecnica - Buscar Tela', '2024-08-05 14:00:00', '2024-08-05 10:00:00', '2024-08-05 09:07:12', '2024-08-05 08:40:41', 'Buscar tela', '0', 0, 1),
(818, 'Upis Asa Sul', '2024-08-05 09:00:00', '2024-08-05 14:00:00', '2024-08-05 09:07:28', '2024-08-05 08:42:08', 'Modem', '0', 0, 1),
(819, 'UDF Campus 02', '2024-08-05 09:00:00', '2024-08-05 14:00:00', '2024-08-05 09:07:23', '2024-08-05 08:42:19', 'Modem', '0', 0, 1),
(820, 'Uniceub Bl. 03 Pós', '2024-08-06 09:00:00', '2024-08-06 09:00:00', '2024-08-06 12:08:38', '2024-08-06 08:36:26', 'Maquina travada', '0', 0, 1),
(821, 'Fitmore', '2024-08-06 14:00:00', '2024-08-06 09:00:00', '2024-08-06 09:24:17', '2024-08-06 09:03:14', 'Fonte maquina', '0', 0, 1),
(822, 'Exame Médico Marco', '2024-08-08 09:00:00', '2024-08-08 09:00:00', '2024-08-06 09:08:29', '2024-08-06 09:08:29', 'Exame Marco de manhã', '1', 0, 1),
(823, 'Fiore', '2024-08-06 14:00:00', '2024-08-06 14:00:00', '2024-08-06 09:24:29', '2024-08-06 09:24:29', 'trocar kramer', '0', 0, 1),
(824, 'Fitmore', '2024-08-07 10:00:00', '2024-08-07 09:00:00', '2024-08-07 08:33:20', '2024-08-07 08:32:19', 'Troca de mini pc', '0', 0, 1),
(826, 'Academia Omni', '2024-08-07 10:00:00', '2024-08-07 10:00:00', '2024-08-07 08:33:10', '2024-08-07 08:33:10', 'Todas telas fora', '0', 0, 1),
(828, 'Centro Empresarial Brasilia', '2024-08-07 14:00:00', '2024-08-07 14:00:00', '2024-08-07 11:54:02', '2024-08-07 11:51:47', 'Hall do A, patrimonios, modem torre B', '1', 0, 1),
(830, 'Upis Asa Sul', '2024-08-08 14:00:00', '2024-08-08 14:00:00', '2024-08-07 12:39:10', '2024-08-07 12:39:10', 'duas telas fora', '1', 0, 1),
(832, 'Backup Banco de dados', '2024-08-09 09:00:00', '2024-08-09 09:00:00', '2024-08-07 15:37:47', '2024-08-07 15:37:47', 'fazer backup do banco de dados', '1', 0, 1),
(837, 'Superbom EQNL - Vistoria', '2025-03-07 09:00:00', '2025-03-07 09:00:00', '2025-03-17 18:11:14', '2025-03-17 18:11:14', '', '0', 0, 1),
(838, 'Superbom QS 409 - Vistoria', '2025-03-10 09:00:00', '2025-03-10 09:00:00', '2025-03-17 18:11:26', '2025-03-17 18:11:26', '', '0', 0, 1),
(839, 'Superbom QS 409 - Instalação', '2025-03-11 09:00:00', '2025-03-11 09:00:00', '2025-03-17 18:12:09', '2025-03-17 18:12:09', '', '0', 0, 1),
(840, 'Superbom Guará - Vistoria', '2025-03-17 09:00:00', '2025-03-17 09:00:00', '2025-03-17 18:12:19', '2025-03-17 18:12:19', '', '0', 0, 1),
(842, 'Superbom QNJ - Vistoria', '2025-03-19 09:00:00', '2025-03-19 09:00:00', '2025-03-17 18:36:25', '2025-03-17 18:12:35', '', '1', 1, 1),
(844, 'Superbom VP - Vistoria', '2025-03-19 09:00:00', '2025-03-19 09:00:00', '2025-03-17 18:36:33', '2025-03-17 18:14:03', '', '1', 1, 1),
(845, 'Superbom EQNL - Instalação', '2025-03-18 09:00:00', '2025-03-18 09:00:00', '2025-03-17 18:36:21', '2025-03-17 18:14:35', '', '1', 1, 1),
(846, 'Superbom QS 314 - Vistoria', '2025-03-20 09:00:00', '2025-03-20 09:00:00', '2025-03-17 18:36:46', '2025-03-17 18:15:03', '', '1', 1, 1),
(847, 'Superbom QS 305 - Vistoria', '2025-03-20 09:00:00', '2025-03-20 09:00:00', '2025-03-17 18:36:42', '2025-03-17 18:15:17', '', '1', 1, 1),
(848, 'Superbom QS 106 - Vistoria', '2025-03-20 09:00:00', '2025-03-20 09:00:00', '2025-03-17 18:36:38', '2025-03-17 18:15:45', '', '1', 1, 1),
(849, 'Superbom QNJ - Instalação', '2025-03-25 09:00:00', '2025-03-25 09:00:00', '2025-03-17 18:36:59', '2025-03-17 18:18:55', '', '1', 1, 1),
(850, 'Superbom São Sebastião - Vistoria', '2025-03-24 09:00:00', '2025-03-24 09:00:00', '2025-03-17 18:36:55', '2025-03-17 18:19:37', '', '1', 1, 1),
(851, 'Superbom Santa Maria - Vistoria', '2025-03-26 09:00:00', '2025-03-26 09:00:00', '2025-03-17 18:37:07', '2025-03-17 18:20:32', '', '1', 1, 1),
(852, 'Superbom Águas Claras - Vistoria', '2025-03-26 09:00:00', '2025-03-26 09:00:00', '2025-03-17 18:37:03', '2025-03-17 18:20:59', '', '1', 1, 1),
(853, 'Superbom Riacho Fundo - Vistoria', '2025-03-21 09:00:00', '2025-03-21 09:00:00', '2025-03-17 18:36:51', '2025-03-17 18:22:32', '', '1', 1, 1),
(854, 'Superbom VP - Instalação', '2025-03-27 09:00:00', '2025-03-27 09:00:00', '2025-03-17 18:37:12', '2025-03-17 18:23:06', '', '1', 1, 1),
(855, 'Superbom QS 106 - Instalação', '2025-03-28 09:00:00', '2025-03-28 09:00:00', '2025-03-17 18:37:16', '2025-03-17 18:23:50', '', '1', 1, 1),
(856, 'Superbom Riacho Fundo - Instalação', '2025-03-31 09:00:00', '2025-03-31 09:00:00', '2025-03-17 18:37:20', '2025-03-17 18:24:05', '', '1', 1, 1),
(857, 'Superbom QS 305 - Instalação', '2025-04-02 09:00:00', '2025-04-02 09:00:00', '2025-03-17 18:37:24', '2025-03-17 18:24:39', '', '1', 1, 1),
(858, 'Superbom QS 314 - Instalação', '2025-04-04 09:00:00', '2025-04-04 09:00:00', '2025-03-17 18:40:14', '2025-03-17 18:24:47', '', '1', 1, 1),
(859, 'Superbom São Sebastião - Instalação', '2025-04-07 09:00:00', '2025-04-07 09:00:00', '2025-03-17 18:40:37', '2025-03-17 18:30:01', '', '1', 1, 1),
(860, 'Superbom Águas Claras - Instalação', '2025-04-09 09:00:00', '2025-04-09 09:00:00', '2025-03-17 18:30:22', '2025-03-17 18:30:22', '', '1', 1, 1),
(861, 'Superbom Santa Maria - Instalação', '2025-04-14 09:00:00', '2025-04-14 09:00:00', '2025-03-17 18:30:31', '2025-03-17 18:30:31', '', '1', 1, 1),
(863, 'Superbom Santa Maria - Instalação', '2025-04-16 09:00:00', '2025-04-16 09:00:00', '2025-03-17 18:30:50', '2025-03-17 18:30:50', '', '1', 1, 1),
(864, 'Superbom Guará - Instalação', '2025-04-18 09:00:00', '2025-04-18 09:00:00', '2025-03-17 18:31:12', '2025-03-17 18:31:00', '', '1', 1, 1),
(865, 'Superbom Guará - Instalação', '2025-04-21 09:00:00', '2025-04-21 09:00:00', '2025-03-17 18:31:07', '2025-03-17 18:31:07', '', '1', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_vendedor` int DEFAULT NULL,
  `id_empresa` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `empresa`, `numero`, `email`, `id_vendedor`, `id_empresa`) VALUES
(1, 'Rdsadas', 'aaaaa', '619865959', 'raulisson@gmail.com', 1, 1),
(3, 'dasdas', '321312', '231321', 'raulisso1n@gmail.com', 1, 1),
(4, 'sadsadsa', 'asda', '131313', 'raulisson12@gmail.com', 1, 1);

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
  `id_empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `computador_empresa_fk` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `computador`
--

INSERT INTO `computador` (`id`, `marca`, `tipo`, `observacoes`, `id_empresa`) VALUES
(2, 'DELL Optiplex 3080', 'Mini PC', 'Entradas: HDMI / DisplayPort', 1),
(3, 'DELL Optiplex 3050', 'Mini Pc', 'Entradas: HDMI / DisplayPort', 1),
(4, 'INTEL NUC', 'Mini Pc', 'Duas entradas HDMI ', 1),
(5, 'DELL OPTIPLEX 360', 'CPU', 'Sem entrada HDMI e sem Wifi', 1),
(6, 'ZOTAC', 'Mini Pc', '', 1),
(7, 'DELL Optiplex 3020', 'Mini Pc', '', 1),
(8, 'CPU Orion', 'CPU', 'CPU de tamanho reduzido', 1),
(9, 'INTEL', 'Mini Pc', 'Windows 11, Entrada HDMI/VGA', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empresa` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`id`, `empresa`) VALUES
(1, 'CB.Dooh'),
(2, 'SAT');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
CREATE TABLE IF NOT EXISTS `equipamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipamento_empresa_fk` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `equipamento`
--

INSERT INTO `equipamento` (`id`, `nome`, `marca`, `descricao`, `id_empresa`) VALUES
(2, 'Modem', 'HUAWEI', 'Modem', 1),
(3, 'Receptor', 'TNT', 'Receptor de Video', 1),
(4, 'Sender', 'HDMI Extender', 'Discabo Sender HDMI 4.0', 1),
(5, 'Receiver', 'HDMI Extender', 'Receiver Discabo 4.0', 1),
(6, 'Furadeira', 'BOSCH', '', 1),
(7, 'Lixadeira', 'BOSCH', '', 1),
(8, 'Receptor 120', 'Kramer', 'Receptor de imagem via cabo de rede | Entrada VGA', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_computador` int DEFAULT NULL,
  `id_tela` int DEFAULT NULL,
  `id_equipamento` int DEFAULT NULL,
  `id_ponto` int DEFAULT NULL,
  `patrimonio` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_empresa` int NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventario_computador_fk` (`id_computador`),
  KEY `inventario_tela_fk` (`id_tela`),
  KEY `inventario_equipamento_fk` (`id_equipamento`),
  KEY `inventario_ponto_fk` (`id_ponto`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `inventario`
--

INSERT INTO `inventario` (`id`, `id_computador`, `id_tela`, `id_equipamento`, `id_ponto`, `patrimonio`, `id_empresa`, `data`) VALUES
(25, 3, NULL, NULL, 35, '005162', 1, '2024-06-07'),
(26, 3, NULL, NULL, 14, '005163', 1, '2024-06-03'),
(28, 3, NULL, NULL, 35, '005160', 1, '2024-06-07'),
(29, 4, NULL, NULL, NULL, '004693', 1, '2024-05-06'),
(31, NULL, 2, NULL, 4, '004699', 1, '2024-05-06'),
(32, 4, NULL, NULL, NULL, '004694', 1, '2024-05-06'),
(33, 3, NULL, NULL, 2, '005164', 1, '2024-05-06'),
(34, 3, NULL, NULL, 35, '005166', 1, '2024-06-07'),
(35, NULL, 2, NULL, 4, '004697', 1, '2024-05-06'),
(36, 5, NULL, NULL, 5, '004696', 1, '2024-05-06'),
(37, NULL, 3, NULL, 6, '005180', 1, '2024-05-06'),
(38, 6, NULL, NULL, 7, '005191', 1, '2024-05-06'),
(39, NULL, NULL, 2, 10, '3976', 1, '2024-05-07'),
(40, NULL, NULL, 2, 10, '3994', 1, '2024-05-07'),
(41, 5, NULL, 2, 10, '001322', 1, '2024-05-07'),
(42, NULL, NULL, 2, 10, '000611', 1, '2024-05-07'),
(43, NULL, NULL, 2, 10, '004068', 1, '2024-05-07'),
(44, NULL, NULL, 2, 11, '3692', 1, '2024-05-07'),
(45, 2, NULL, NULL, 11, '005131', 1, '2024-05-07'),
(46, 6, NULL, NULL, 11, '3173', 1, '2024-05-07'),
(47, NULL, NULL, 2, NULL, '000601', 1, '2024-05-07'),
(48, NULL, NULL, 2, NULL, '3950', 1, '2024-05-07'),
(49, NULL, NULL, 2, NULL, '3902', 1, '2024-05-07'),
(50, 5, NULL, NULL, NULL, '001324', 1, '2024-05-07'),
(51, NULL, NULL, 2, NULL, '3959', 1, '2024-05-07'),
(52, NULL, NULL, 2, NULL, '004006', 1, '2024-05-07'),
(53, NULL, NULL, 2, NULL, '3874', 1, '2024-05-07'),
(54, NULL, NULL, 2, NULL, '000615', 1, '2024-05-07'),
(55, NULL, NULL, 2, NULL, '004071', 1, '2024-05-07'),
(56, NULL, NULL, 3, NULL, '004852', 1, '2024-05-08'),
(57, NULL, NULL, 3, NULL, '004851', 1, '2024-05-08'),
(58, NULL, NULL, 4, NULL, '004598', 1, '2024-05-08'),
(59, NULL, NULL, 7, NULL, '005186', 1, '2024-05-09'),
(60, NULL, NULL, 6, NULL, '005182', 1, '2024-05-09'),
(61, NULL, NULL, 2, 13, '3971', 1, '2024-05-10'),
(62, 7, NULL, NULL, 14, '001296', 1, '2024-05-10'),
(63, NULL, NULL, 2, 14, '3990', 1, '2024-05-10'),
(64, NULL, NULL, 2, 15, '3870', 1, '2024-05-10'),
(65, NULL, NULL, 2, 15, '3938', 1, '2024-05-10'),
(66, 2, NULL, NULL, 15, '005124', 1, '2024-05-10'),
(67, 8, NULL, NULL, 15, '3621', 1, '2024-05-10'),
(68, NULL, NULL, 2, 15, '3998', 1, '2024-05-10'),
(69, 5, NULL, NULL, 15, '000085', 1, '2024-05-10'),
(70, NULL, NULL, 2, 15, '3882', 1, '2024-05-10'),
(71, NULL, NULL, 2, 15, '3913', 1, '2024-05-10'),
(72, NULL, NULL, 2, 7, '3980', 1, '2024-05-13'),
(73, NULL, NULL, 2, 7, '3963', 1, '2024-05-13'),
(74, NULL, NULL, 2, 7, '000604', 1, '2024-05-13'),
(75, NULL, NULL, 2, 16, '3974', 1, '2024-05-13'),
(76, NULL, NULL, 2, 16, '3987', 1, '2024-05-13'),
(77, 5, NULL, NULL, 16, '005181', 1, '2024-05-13'),
(78, NULL, NULL, 2, 16, '3891', 1, '2024-05-13'),
(79, 5, NULL, NULL, 16, '005179', 1, '2024-05-13'),
(80, NULL, NULL, 2, 16, '004027', 1, '2024-05-13'),
(81, 6, NULL, NULL, 7, '3467', 1, '2024-05-13'),
(82, NULL, NULL, 2, 7, '3866', 1, '2024-05-13'),
(83, 5, NULL, NULL, 7, '005136', 1, '2024-05-13'),
(84, NULL, 2, NULL, 17, '005032', 1, '2024-05-13'),
(85, NULL, NULL, 8, 17, '000237', 1, '2024-05-13'),
(86, NULL, 2, NULL, 17, '004701', 1, '2024-05-13'),
(87, NULL, NULL, 8, 17, '000444', 1, '2024-05-13'),
(88, 6, NULL, NULL, 17, '3466', 1, '2024-05-13'),
(89, NULL, NULL, 8, 17, '140', 1, '2024-05-13'),
(90, NULL, 2, NULL, 17, '004702', 1, '2024-05-13'),
(92, NULL, 3, NULL, 18, '000756', 1, '2024-05-13'),
(94, NULL, 3, NULL, 18, '004750', 1, '2024-05-13'),
(95, NULL, NULL, 2, 19, '004011', 1, '2024-05-14'),
(96, NULL, NULL, 2, 20, '004710', 1, '2024-05-14'),
(97, NULL, NULL, 2, 21, '3942', 1, '2024-05-14'),
(98, 5, NULL, NULL, 22, '000371', 1, '2024-05-15'),
(99, NULL, NULL, 2, 22, '3869', 1, '2024-05-15'),
(100, 9, NULL, NULL, 23, '005157', 1, '2024-05-15'),
(101, NULL, NULL, 2, 23, '3887', 1, '2024-05-15'),
(102, NULL, 5, NULL, 24, '000089', 1, '2024-05-16'),
(103, NULL, NULL, 2, 25, '3953', 1, '2024-05-17'),
(104, NULL, 3, NULL, 26, '000721', 1, '2024-05-20'),
(105, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(106, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(107, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(108, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(109, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(110, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(111, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(112, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(113, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(114, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(115, NULL, 3, NULL, 26, '', 1, '2024-05-20'),
(116, 8, NULL, NULL, 26, '', 1, '2024-05-20'),
(117, 4, NULL, NULL, 26, '', 1, '2024-05-20'),
(118, 4, NULL, NULL, 26, '', 1, '2024-05-20'),
(119, 4, NULL, NULL, 26, '', 1, '2024-05-20'),
(120, 2, NULL, NULL, 24, '', 1, '2024-05-20'),
(121, NULL, 2, NULL, 24, '', 1, '2024-05-20'),
(122, NULL, 2, NULL, 24, '', 1, '2024-05-20'),
(123, NULL, 2, NULL, 24, '', 1, '2024-05-20'),
(124, 3, NULL, NULL, 24, '', 1, '2024-05-20'),
(125, 3, NULL, NULL, 24, '', 1, '2024-05-20'),
(126, 6, NULL, NULL, 24, '', 1, '2024-05-20'),
(127, NULL, 3, NULL, 27, '', 1, '2024-05-20'),
(129, 9, NULL, NULL, 29, '', 1, '2024-05-21'),
(130, 3, NULL, NULL, 27, '005161', 1, '2024-05-22'),
(131, NULL, NULL, 5, NULL, '004716', 1, '2024-05-27'),
(132, NULL, NULL, 5, NULL, '004717', 1, '2024-05-27'),
(133, NULL, NULL, 5, NULL, '004711', 1, '2024-05-27'),
(134, NULL, NULL, 5, NULL, '004719', 1, '2024-05-27'),
(135, NULL, NULL, 5, NULL, '004740', 1, '2024-05-27'),
(136, NULL, NULL, 5, NULL, '004747', 1, '2024-05-27'),
(137, NULL, NULL, 5, NULL, '004746', 1, '2024-05-27'),
(138, NULL, NULL, 5, NULL, '004726', 1, '2024-05-27'),
(139, NULL, NULL, 5, NULL, '004748', 1, '2024-05-27'),
(140, NULL, NULL, 5, NULL, '005133', 1, '2024-05-27'),
(141, NULL, NULL, 5, NULL, '005125', 1, '2024-05-27'),
(142, NULL, 6, NULL, 35, '004715', 1, '2024-06-05'),
(143, NULL, 6, NULL, 35, '004714', 1, '2024-06-05'),
(144, NULL, 6, NULL, 35, '004729', 1, '2024-06-05'),
(145, NULL, 6, NULL, 35, '004725', 1, '2024-06-05'),
(146, NULL, 6, NULL, 35, '004741', 1, '2024-06-05'),
(147, NULL, NULL, 4, NULL, '005195', 1, '2024-06-05'),
(148, NULL, NULL, 4, NULL, '005196', 1, '2024-06-05'),
(149, 3, NULL, NULL, 35, '004970', 1, '2024-06-07'),
(150, 3, NULL, NULL, 35, '004584', 1, '2024-06-07'),
(151, 4, NULL, NULL, 18, '004552', 1, '2024-06-11'),
(152, 5, NULL, NULL, 39, '0001222', 1, '2024-06-14'),
(153, NULL, 2, NULL, 24, '004897', 1, '2024-06-14'),
(154, NULL, 2, NULL, 24, '004896', 1, '2024-06-14'),
(155, NULL, 2, NULL, 24, '004858', 1, '2024-06-14'),
(156, NULL, 7, NULL, 30, '004607', 1, '2024-06-20'),
(157, NULL, 7, NULL, 30, '004606', 1, '2024-06-20'),
(158, NULL, 7, NULL, 30, '004605', 1, '2024-06-20'),
(159, NULL, 7, NULL, 30, '004604', 1, '2024-06-20'),
(160, NULL, 7, NULL, 30, '004603', 1, '2024-06-20'),
(161, NULL, 7, NULL, 30, '004602', 1, '2024-06-20'),
(162, NULL, 7, NULL, 30, '004601', 1, '2024-06-20'),
(163, 5, NULL, NULL, 30, '000249', 1, '2024-06-20'),
(164, NULL, 8, NULL, 42, '004860', 1, '2024-06-25'),
(165, NULL, 8, NULL, 42, '004861', 1, '2024-06-25'),
(166, NULL, 8, NULL, 42, '004862', 1, '2024-06-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `modem`
--

DROP TABLE IF EXISTS `modem`;
CREATE TABLE IF NOT EXISTS `modem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `id_ponto` int DEFAULT NULL,
  `id_empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modem_ponto_fk` (`id_ponto`),
  KEY `modem_empresa_fk` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `modem`
--

INSERT INTO `modem` (`id`, `numero`, `id_ponto`, `id_empresa`) VALUES
(3, '61998228334', 8, 1),
(4, '61996819180', 9, 1),
(14, '61999893522', 11, 1),
(15, '61998761929', 10, 1),
(16, '61996280152', 10, 1),
(17, '61996164480', 10, 1),
(18, '61996518206', 10, 1),
(21, '61996297670', 13, 1),
(22, '61996237261', 14, 1),
(23, '61996011787', 16, 1),
(24, '61998382751', 7, 1),
(25, '61998833230', 7, 1),
(26, '61998364904', 7, 1),
(27, '61996256654', 7, 1),
(28, '61998932927', 16, 1),
(29, '61996456138', 16, 1),
(30, '61996444058', 16, 1),
(31, '61998938233', 16, 1),
(32, '61998515280', 20, 1),
(33, '61998571004', 19, 1),
(34, '61996321293', 21, 1),
(35, '61998744907', 23, 1),
(36, '61996419813', 22, 1),
(37, '61996092223', 7, 1),
(38, '61996390018', 7, 1),
(39, '61996476240', 7, 1),
(40, '61998253481', 45, 1),
(41, '61999763342', 28, 1),
(42, '6199642658', 27, 1),
(43, '61996364498', 29, 1),
(44, '61999127960', 29, 1),
(45, '61996456688', 29, 1),
(46, '61999975238', 29, 1),
(47, '61996845831', 30, 1),
(48, '61999389719', 31, 1),
(49, '61999597308', 32, 1),
(50, '61996395092', 33, 1),
(51, '61996248160', 34, 1),
(52, '61998462088', 36, 1),
(53, '61996445315', 37, 1),
(54, '61996480564', 38, 1),
(55, '61996510455', 40, 1),
(56, '61998649953', 41, 1),
(57, '61996398511', 44, 1),
(58, '61996668329', 44, 1);

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
  `id_empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ponto_empresa_fk` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ponto`
--

INSERT INTO `ponto` (`id`, `nome`, `endereco`, `nome_responsavel`, `contato_responsavel`, `id_empresa`) VALUES
(2, 'UNICEUB', 'SEPN 707/907 Asa Norte', 'Cleyci', '6185592098', 1),
(3, 'Fitmore', ' ADE Q 1 - Ceilandia', 'Josie', '6185617244', 1),
(4, 'Pizza Hut - Aguas Claras', 'Rua 4 Sul', 'Rogerio', '6182574005', 1),
(5, 'Big Box - Taguatinga Centro', 'Taguatinga Centro C1', 'Jocelio - Gerente', '6193728071', 1),
(6, 'Big Box - Siberia', 'QI 09 Lago Norte', 'Joaquin - Gerente', '6193081130', 1),
(7, 'Centro Empresarial Brasilia', 'Setor de Radio e Televisao Sul Q 701 Conj. D', 'Claudia', '6181111859', 1),
(8, 'Armando Cirillo', ' QI 23 ChÃ¡cara 5 - Lago Sul', '', '', 1),
(9, 'SteakBull', 'St. de Clubes Esportivos Sul Trecho 2 Conjunto 35', 'Paulo', '6199726757', 1),
(10, 'Felicitta Shopping', 'Av. das Castanheiras, s/n - Lote 5 - Ãguas Claras', 'Jezi', '61982164545', 1),
(11, 'One Way Guara', 'Guara II QE 19', '', '', 1),
(13, 'Fiore', 'St. N QNN 2 - Ceilandia', '', '', 1),
(14, 'Centro Clinico Julio Adnet', 'SEPS Q 709/909  - Asa Sul', 'Raquel', '61985154754', 1),
(15, 'Pier 21', 'St. de Clubes Esportivos Sul Trecho 2 - Asa Sul', '', '', 1),
(16, 'Assis Chateaubriand', 'SRTVS QD. 701 Conjunto L', '', '', 1),
(17, 'Academia Ultra', 'Q411, s/n - Loja 25, SHCES Cruzeiro', '', '', 1),
(18, 'Bonamix', 'QR 122 Conjunto 3, LT 01/03 - Samambaia', '', '', 1),
(19, 'Big Box 408 Norte', 'BL A - SHC/N EQ. 408/409 - Asa Norte', 'Aecio', '6191610268', 1),
(20, 'Big Box 106 Norte', 'SCL/N 106, Bloco D Lojas 08/14, SHCN', 'Jose Ximenes', '6191947190', 1),
(21, 'I9 Fit', 'Av. Parque Aguas Claras, 405 - Aguas Claras', '', '', 1),
(22, 'Portal Fitbox', 'Condominio Portal do Lago Sul loja 17B', '', '', 1),
(23, 'Fit Park', 'CLN 214 Block D SS - Asa Norte', '', '', 1),
(24, 'Julio Adnet', 'AOS 2/8 - Lote 5, Octogonal TerraÃ§o Shopping', '', '', 1),
(25, 'Edificio Uniao', 'Setor Comercial Sul Q. 1 EdifÃ­cio UniÃ£o - Asa Sul', '', '', 1),
(26, 'Alameda Shopping', 'CSB 02, Lotes 01/04 - Taguatinga', 'Valeria', '6198418392', 1),
(27, 'UNICEUB Campus Taguatinga', 'QS 01, Lotes 01/17 - Taguatinga', '', '', 1),
(28, 'Big Box 208 Norte', 'SHCN CL QD 208 BL D - Asa Norte', '', '', 1),
(29, 'Sesi Lab', 'Setor Cultural Sul Lote 1', 'Thalles', '6181141800', 1),
(30, 'Shopping Deck Norte', 'SHIN CA 1, Bloco A, Lote A, s/n - Lago Norte', '', '', 1),
(31, 'EspaÃ§o 115', 'BLOCO C SUBSOLO, Via W1 Norte - Asa Norte', '', '', 1),
(32, 'Academia InMove', 'SCES Trecho 2 Conj. 16/17, St. de Clubes Esportivos Sul', '', '', 1),
(33, 'Academia BlackFit', 'Terceira avenida area especial 2 lotes T/U Edificio Paulo Sarkis - Nucleo Bandeirante', '', '', 1),
(34, 'Big Box 508 Sul', 'SHC/S CR QD 508, Bloco C Lojas 43 e 44', '', '', 1),
(35, 'World Gym - Sobradinho', 'Q 4 - Sobradinho', 'Renan - Gerente', '6185983399', 1),
(36, 'Diarios Associados', 'St. Sudoeste', '', '', 1),
(37, 'Oba Taquari', 'St. TaquarÃ­ Q. 3 Conj. 1 ST - Setor Habitacional Taquari', '', '', 1),
(38, 'Oba Vicente Pires', 'Chacara 53, rua 3, St. Hab. Vicente Pires lote 01', '', '', 1),
(39, 'Big Box 310 Norte', 'Asa Norte CLN 310 BL C S/N Loja 10', '', '', 1),
(40, 'Big Box Paineras', 'Rua das Paineiras 03, R. 30 Norte, 04 - Ãguas Claras', '', '', 1),
(41, 'Big Box 402 Norte', 'BL A - SHC/N EQ 402/403 - Asa Norte', '', '', 1),
(42, 'Metro - Estacao Aguas', 'Aguas Claras', '', '', 1),
(43, 'Big Box (Geral)', 'Brasilia', 'Felipe - Marketing', '6191150633', 1),
(44, 'Shopping Metropoles', 'Av. das Araucarias, 1525', '', '', 1),
(45, 'Posto Igrejinha', 'SQS 307', '', '', 1);

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
-- Estrutura da tabela `tela`
--

DROP TABLE IF EXISTS `tela`;
CREATE TABLE IF NOT EXISTS `tela` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) NOT NULL,
  `tamanho` varchar(20) NOT NULL,
  `tipo` varchar(200) NOT NULL,
  `id_empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tela_empresa_fk` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tela`
--

INSERT INTO `tela` (`id`, `marca`, `tamanho`, `tipo`, `id_empresa`) VALUES
(2, 'Multilaser', '40\'\'', 'Televisao', 1),
(3, 'LG', '42\"', 'Monitor Profissional', 1),
(4, 'Samsung 400MX', '40\"', 'Monitor', 1),
(5, 'Samsung', '40\"', 'Monitor', 1),
(6, 'Semp', '42\"', 'Televisao', 1),
(7, 'Samsung', '46\"', 'Monitor', 1),
(8, 'Mandala', '20\"', 'LED', 1);

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
  `id_empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_plano` (`id_plano`),
  KEY `usuario_empresa_fk` (`id_empresa`),
  KEY `usuario_grupo` (`perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `perfil`, `id_plano`, `id_empresa`) VALUES
(1, 'Raulisson', 'raulissonvalbuquerque@gmail.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 1, 4, 1),
(2, 'Geral', 'geral@email.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 3, 4, 1),
(3, 'Fabio', 'fabio@sat.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 1, 4, 2),
(24, 'SAC Look', 'sac@plux.com.br', 'a93b5bfb429a2981b4edf556f181427c4472f1d6', 1, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE IF NOT EXISTS `vendedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `numero` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`id`, `nome`, `numero`) VALUES
(1, 'Josefa', '61111111');

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
-- Limitadores para a tabela `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `atividade_empresa_fk` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Limitadores para a tabela `computador`
--
ALTER TABLE `computador`
  ADD CONSTRAINT `computador_empresa_fk` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Limitadores para a tabela `equipamento`
--
ALTER TABLE `equipamento`
  ADD CONSTRAINT `equipamento_empresa_fk` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Limitadores para a tabela `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_computador_fk` FOREIGN KEY (`id_computador`) REFERENCES `computador` (`id`),
  ADD CONSTRAINT `inventario_equipamento_fk` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamento` (`id`),
  ADD CONSTRAINT `inventario_ponto_fk` FOREIGN KEY (`id_ponto`) REFERENCES `ponto` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `inventario_tela_fk` FOREIGN KEY (`id_tela`) REFERENCES `tela` (`id`);

--
-- Limitadores para a tabela `modem`
--
ALTER TABLE `modem`
  ADD CONSTRAINT `modem_empresa_fk` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `modem_ponto_fk` FOREIGN KEY (`id_ponto`) REFERENCES `ponto` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ponto`
--
ALTER TABLE `ponto`
  ADD CONSTRAINT `ponto_empresa_fk` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Limitadores para a tabela `ponto_equipamento`
--
ALTER TABLE `ponto_equipamento`
  ADD CONSTRAINT `ponto_equipamento_ibfk_1` FOREIGN KEY (`id_ponto`) REFERENCES `ponto` (`id`),
  ADD CONSTRAINT `ponto_equipamento_ibfk_2` FOREIGN KEY (`id_computador`) REFERENCES `computador` (`id`),
  ADD CONSTRAINT `ponto_equipamento_ibfk_3` FOREIGN KEY (`id_tela`) REFERENCES `tela` (`id`),
  ADD CONSTRAINT `ponto_equipamento_ibfk_4` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamento` (`id`);

--
-- Limitadores para a tabela `tela`
--
ALTER TABLE `tela`
  ADD CONSTRAINT `tela_empresa_fk` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_empresa_fk` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `usuario_grupo` FOREIGN KEY (`perfil`) REFERENCES `acl_grupo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_plano`) REFERENCES `plano` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
