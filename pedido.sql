-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/10/2024 às 22:55
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `carrinho`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `itens` text NOT NULL,
  `nome` varchar(220) NOT NULL,
  `email` varchar(220) NOT NULL,
  `endereco` varchar(220) NOT NULL,
  `Mensagem` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id`, `itens`, `nome`, `email`, `endereco`, `Mensagem`, `created`, `modified`) VALUES
(0, '', 'cxcvxcvxc', 'vxcvxcvxc@dfsgdg', 'gdgdgdfg', '', '0000-00-00 00:00:00', NULL),
(0, '', 'mauricio ', 'mauri@dkismfdsi', 'd,msol,dslf', '', '0000-00-00 00:00:00', NULL),
(0, '', 'dada', 'dsadasda@gfdsgd', 'daasdsad', '', '0000-00-00 00:00:00', NULL),
(0, '', 'dsds', 'dsdas@fdsfds', 'sddsda', 'fdsfdsfsdf', '0000-00-00 00:00:00', NULL),
(0, '', 'dsasdasda', 'sdadas@dfdsf', 'dsadas', 'dadsdasdas', '0000-00-00 00:00:00', NULL),
(0, '', 'dsasdasda', 'sdadas@dfdsf', 'dsadas', 'dadsdasdas', '0000-00-00 00:00:00', NULL),
(0, '', 'dsasdasda', 'sdadas@dfdsf', 'dsadas', 'dadsdasdas', '0000-00-00 00:00:00', NULL),
(0, '', 'dsasdasda', 'sdadas@dfdsf', 'dsadas', 'dadsdasdas', '0000-00-00 00:00:00', NULL),
(0, '', 'dsasdasda', 'sdadas@dfdsf', 'dsadas', 'dadsdasdas', '0000-00-00 00:00:00', NULL),
(0, '', 'dsasdasda', 'sdadas@dfdsf', 'dsadas', 'dadsdasdas', '0000-00-00 00:00:00', NULL),
(0, '', 'dsasdasda', 'sdadas@dfdsf', 'dsadas', 'dadsdasdas', '0000-00-00 00:00:00', NULL),
(0, '', 'fdfsdf', 'fdfdsf@gdfgdf', 'gdfgdf', 'dgfgdfgfgfg', '0000-00-00 00:00:00', NULL),
(0, '', 'tretre', 'tretreter@fdsfdf', 'fsdfds', 'fsfsfd', '0000-00-00 00:00:00', NULL),
(0, '', 'tretre', 'tretreter@fdsfdf', 'fsdfds', 'fsfsfd', '0000-00-00 00:00:00', NULL),
(0, '', 'tretre', 'tretreter@fdsfdf', 'fsdfds', 'fsfsfd', '0000-00-00 00:00:00', NULL),
(0, '', 'mauricio', 'tretreter@fdsfdf', 'fsdfds', 'fsfsfd', '0000-00-00 00:00:00', NULL),
(0, '', 'mauricio', 'tretreter@fdsfdf', 'fsdfds', 'fsfsfd', '0000-00-00 00:00:00', NULL),
(0, '', 'mauricio', 'tretreter@fdsfdf', 'fsdfds', 'fsfsfd', '0000-00-00 00:00:00', NULL),
(0, '', 'mauricio', 'tretreter@fdsfdf', 'fsdfds', 'fsfsfd', '0000-00-00 00:00:00', NULL),
(0, '', 'mauricio', 'tretreter@fdsfdf', 'rua duque', 'fsfsfd', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"}]', 'daads', 'fsfs@fsfd', 'fdsfdsf', 'fdsfdsfdsfd', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"},{\"name\":\"Heróis - Superman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gms.com', 'casa 2', 'mauricio aqui', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Modelo Moderno\",\"price\":\"40.00\",\"image\":\"frioquente.png\"}]', 'mauricio', 'matheus@gmail.com', 'rua duque de caxias', 'quero todos na cor vermelha', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Modelo Moderno\",\"price\":\"40.00\",\"image\":\"frioquente.png\"}]', 'mauricio', 'matheus@gmail.com', 'rua duque de caxias', 'quero todos na cor vermelha', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Modelo Moderno\",\"price\":\"40.00\",\"image\":\"frioquente.png\"}]', 'mauricio', 'matheus@gmail.com', 'rua duque de caxias', 'quero todos na cor vermelha', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Modelo Moderno\",\"price\":\"40.00\",\"image\":\"frioquente.png\"}]', 'mauricio', 'matheus@gmail.com', 'rua duque de caxias', 'quero todos na cor vermelha', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Modelo Moderno\",\"price\":\"40.00\",\"image\":\"frioquente.png\"}]', 'mauricio', 'matheus@gmail.com', 'rua duque de caxias', 'quero todos na cor vermelha', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Modelo Moderno\",\"price\":\"40.00\",\"image\":\"frioquente.png\"}]', 'mauricio', 'matheus@gmail.com', 'rua duque de caxias', 'quero todos na cor vermelha', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Modelo Moderno\",\"price\":\"40.00\",\"image\":\"frioquente.png\"},{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'Lilianna', 'lili@gmail.com', 'france145 ', 'funcionando', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Modelo Elegante\",\"price\":\"45.00\",\"image\":\"xicara-personalizacao/BlackandBluemug.webp\"}]', 'mauricio', 'mauriciomts@gmail.com', 'rua france 26', 'quero amarelo', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Jogo do amor\",\"price\":\"55.00\",\"image\":\"Captura de tela_28-9-2024_204237_www.bing.com.jpeg\"},{\"name\":\"Flork\",\"price\":\"35.00\",\"image\":\"imagens/caneca-flork-rosa-melhor-mae-do-mundo-74i-dia-das-maes.webp\"}]', 'mauricio oliveira', 'mauriciomts9@gmail', 'rua france', 'amarelo e vermelho ', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Jogo do amor\",\"price\":\"55.00\",\"image\":\"Captura de tela_28-9-2024_204237_www.bing.com.jpeg\"},{\"name\":\"Flork\",\"price\":\"35.00\",\"image\":\"imagens/caneca-flork-rosa-melhor-mae-do-mundo-74i-dia-das-maes.webp\"}]', 'mauricio oliveira', 'mauriciomts9@gmail', 'rua france', 'amarelo e vermelho ', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Jogo do amor\",\"price\":\"55.00\",\"image\":\"Captura de tela_28-9-2024_204237_www.bing.com.jpeg\"},{\"name\":\"Flork\",\"price\":\"35.00\",\"image\":\"imagens/caneca-flork-rosa-melhor-mae-do-mundo-74i-dia-das-maes.webp\"}]', 'dasadasdas', 'dasdad@dfsfs', 'fsdfds', 'fsdfdsfds', '0000-00-00 00:00:00', NULL),
(0, '[{\"name\":\"Modelo Clássico\",\"price\":\"35.00\",\"image\":\"caneca-amarela-flork-melhor-vovo-avo-perfeita-flork.webp\"},{\"name\":\"Heróis - Batman\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"},{\"name\":\"Heróis - Mulher-Maravilha\",\"price\":\"35.00\",\"image\":\"71kmFzd7U8L._SX569_.jpg\"}]', 'mauricio', 'mauricio@gmail.com', 'rua france 26', 'amarelo e azul', '0000-00-00 00:00:00', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
