-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 14-Jul-2019 às 22:04
-- Versão do servidor: 5.7.24
-- versão do PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `receitas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `receita`
--

DROP TABLE IF EXISTS `receita`;
CREATE TABLE IF NOT EXISTS `receita` (
  `idreceita` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(36) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ingredientes` text NOT NULL,
  `preparo` text NOT NULL,
  `categoria` text NOT NULL,
  `cor` int(11) NOT NULL,
  `dia` varchar(10) NOT NULL,
  `hora` varchar(5) NOT NULL,
  PRIMARY KEY (`idreceita`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `receita`
--

INSERT INTO `receita` (`idreceita`, `img`, `nome`, `ingredientes`, `preparo`, `categoria`, `cor`, `dia`, `hora`) VALUES
(2, 'bolo-milho.jpg', 'Bolo de milho cremoso', '1 lata de milho verde | 1 lata de Ã³leo (medida da lata de milho) |  1 lata de aÃ§Ãºcar (medida da lata de milho) | 1 lata de fubÃ¡ (medida da lata de milho) | 4 ovos | 2 colheres (sopa) de farinha de trigo | 2 colheres (sopa) de coco ralado | 1 e 1/2 colher (chÃ¡) de fermento em pÃ³ ', 'Em um liquidificador, adicione o milho verde, o Ã³leo, o aÃ§Ãºcar, o fubÃ¡, os ovos e a farinha de trigo, depois bata atÃ© obter uma consistÃªncia cremosa. |  Depois, acrescente o coco ralado e o fermento, misture novamente.| Despeje a massa em uma assadeira untada e leve para assar, em um forno mÃ©dio a 180 Â°C, preaquecido por 40 minutos.', 'Bolo', 0, '14/07/2019', '13:39'),
(7, 'bolo-fuba.jpg', 'Bolo de fubÃ¡', '3 ovos inteiros |\r\n2 xÃ­caras (chÃ¡) de aÃ§Ãºcar|\r\n2 xÃ­caras (chÃ¡) de fubÃ¡|\r\n3 colheres (sopa) de farinha de trigo|\r\n1/2 copo (americano) de Ã³leo|\r\n1 copo (americano) de leite|\r\n1 colher (sopa) de fermento em pÃ³', 'Em um liquidificador, adicione os ovos, o aÃ§Ãºcar, o fubÃ¡, a farinha de trigo, o Ã³leo, o leite e o fermento, depois bata atÃ© a massa ficar lisa e homogÃªnea.|\r\n\r\nDespeje a massa em uma forma untada e polvilhada.|\r\n\r\nLeve para assar em forno mÃ©dio 180 Â°C) preaquecido por 40 minutos.', 'Bolo', 1, '14/07/2019', '12:20'),
(8, 'creme-milho.jpg', 'Creme de milho', '1 lata de milho |\r\n1 e 1/2 xÃ­cara (chÃ¡) de leite|\r\n1 colher (sopa) de manteiga|\r\n1 cebola mÃ©dia ralada|\r\n1 tablete de caldo de legumes|\r\n1 lata de creme de leite|\r\n2 colheres (sopa) de farinha de trigo', 'No liquidificador, bata o milho e o leite e reserve.|\r\n\r\nEm uma panela, aqueÃ§a a manteiga, junte a cebola e refogue um pouco.|\r\n\r\nAdicione a farinha de trigo e mexa rapidamente.|\r\n\r\nDeixe dourar e misture o milho batido com o leite ao caldo.|\r\n\r\nMexa atÃ© dissolvÃª-lo completamente e cozinhe por cerca de 10 minutos, atÃ© obter uma consistÃªncia cremosa.|\r\n\r\nAcrescente o creme de leite, mexa e desligue o fogo.', 'Acompanhamentos', 2, '14/07/2019', '07:51'),
(5, 'maca-amor.jpg', 'MaÃ§Ã£ do amor', 'MaÃ§Ã£s |\r\n\r\nPalitos de sorvetes|\r\n\r\nMel|\r\n\r\nBiscoito ou cereais\r\n\r\n', 'Espete a maÃ§Ã£ no palito.|\r\n\r\nMergulhe-a em uma vasilha com mel.|\r\n\r\nPasse-a em um prato com cereais ou biscoitos picadinhos.', 'Doces', 4, '14/07/2019', '19:30'),
(10, 'quentao-vinho.jpg', 'QuentÃ£o de vinho', '2 l de vinho tinto suave |\r\n1 copo de Ã¡gua 200 ml|\r\nMeio copo de cachaÃ§a|\r\n1 1/2 copo de aÃ§Ãºcar|\r\n2 pauzinhos de canela|\r\n12 cravos (ou a gosto)|\r\n8 rodelinhas de gengibre (ou a gosto)', 'Misture todos os ingredientes ao fogo em uma panela.|\r\nDepois que levantar fervura, deixe por mais 10 minutos.|\r\nEstÃ¡ pronto Ã© sÃ³ servir.|\r\nTomar a bebida quente. ', 'Bebidas', 1, '14/07/2019', '15:13'),
(11, 'milkshake-crocante.jpg', 'Milkshake crocante', '5 bolas de sorvete de creme |\r\n2 colheres (sopa) de Ovomaltine|\r\n1 dose de leite|\r\ncreme crocante de Ovomaltine|\r\nOvomaltine em pÃ³ para polvilhar|\r\nbiscoito wafer recheado em palito para confeitar', 'Coloque em um recipiente o sorvete, as duas colheres de Ovomaltine e o leite e mexa bem atÃ© ficar homogÃªneo.|\r\nCom o auxÃ­lio de uma colher, espalhe uma quantidade generosa de creme crocante de Ovomaltine na borda do copo em que servirÃ¡ a bebida.|\r\nDespeje a mistura do recipiente no copo, polvilhe Ovomaltine em pÃ³ e decore com o biscoito.', 'Milkshake | Bebidas', 5, '14/07/2019', '15:25'),
(23, 'fondue-queijo.jpg', 'Fondue de Queijo', '200g de queijo gruyÃ¨re|\r\n300g de queijo estepe ou emmental|\r\n1 dente de alho|\r\n1 pitada de noz-moscada\r\n1 colher de sopa de amido de milho|\r\n1 cÃ¡lice de conhaque ( 20 ml) ( opcional)|\r\n3/4 de um copo de vinho branco seco ( cerca de 180ml)', 'Rale os queijos no ralador ou processador.|\r\nDissolva o amido de milho no vinho branco e misture com o conhaque.|\r\nAdicione a noz-moscada a este lÃ­quido.|\r\nPasse o alho nos lados e fundo da panela.|\r\nColoque os queijos e o lÃ­quido que vocÃª preparou na panela e vÃ¡ misturando, sempre em fogo baixo, atÃ© fundir totalmente o queijo.|\r\nContinue mexendo atÃ© que a massa ganhe uma consistÃªncia homogÃªnea, logo apÃ³s levantar fervura.|\r\nCaso fique muito lÃ­quido, dissolva mais um pouco de amido de milho em um cÃ¡lice de Ã¡gua e adicione Ã  mistura.|\r\nSirva preferencialmente com pÃ£o italiano, mas na falta desse vocÃª pode usar outro pÃ£o, desde tenha consistÃªncia firme para nÃ£o se despedaÃ§ar quando vocÃª mergulhar no queijo.', 'Prato Ãºnico | Panqueca', 8, '14/07/2019', '17:49'),
(25, 'bolo-cenoura.jpg', 'Bolo de cenoura', '1/2 xÃ­cara (chÃ¡) de Ã³leo |\r\n3 cenouras mÃ©dias raladas |\r\n4 ovos|\r\n2 xÃ­caras (chÃ¡) de aÃ§Ãºcar|\r\n2 e 1/2 xÃ­caras (chÃ¡) de farinha de trigo|\r\n1 colher (sopa) de fermento em pÃ³', 'MASSA|\r\nEm um liquidificador, adicione a cenoura, os ovos e o Ã³leo, depois misture.|\r\n\r\nAcrescente o aÃ§Ãºcar e bata novamente por 5 minutos.|\r\n\r\nEm uma tigela ou na batedeira, adicione a farinha de trigo e depois misture novamente.|\r\n\r\nAcrescente o fermento e misture lentamente com uma colher.|\r\n\r\nAsse em um forno preaquecido a 180Â° C por aproximadamente 40 minutos.|\r\n\r\nCOBERTURA|\r\nDespeje em uma tigela a manteiga, o chocolate em pÃ³, o aÃ§Ãºcar e o leite, depois misture.|\r\n\r\nLeve a mistura ao fogo e continue misturando atÃ© obter uma consistÃªncia cremosa, depois despeje a calda por cima do bolo.', 'Bolo', 6, '14/07/2019', '17:56');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
