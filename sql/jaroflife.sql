-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Ven 06 Avril 2018 à 11:49
-- Version du serveur :  10.0.34-MariaDB-0ubuntu0.16.04.1
-- Version de PHP :  7.1.12-3+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `jaroflife`
--

-- --------------------------------------------------------

--
-- Structure de la table `todos`
--

CREATE TABLE `todos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `todos`
--

INSERT INTO `todos` (`id`, `id_user`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'partager des bières avec quelqu\'un', 'peu importe à quel point ta vie semble remplie, tu as toujours le temps de partager des bières avec quelqu\'un', '2017-11-01 17:30:20', '2017-11-14 10:51:18', '2017-11-03 10:29:44'),
(2, 1, 'ranger les balles de ping-pong', 'ramasser les balles de ping-pong dans la salle de jeu, et les ranger dans mon bocal', '2017-11-01 18:16:50', '2017-11-14 10:51:18', '2017-11-09 10:34:29'),
(3, 1, 'kevin', 'oh yeah!!!', '2017-11-01 18:18:14', '2017-11-14 10:51:18', '2017-11-09 15:57:06'),
(4, 1, 'ranger le sable', 'ramasser le sable sur la plage, et le ranger dans mon bocal', '2017-11-01 18:19:54', '2017-11-14 10:51:18', NULL),
(5, 1, 'hggs', 'qgqgqg', '2017-11-07 15:34:39', '2017-11-14 10:51:18', '2017-11-07 15:36:34'),
(6, 1, 'lalalallaa', 'lalallalala', '2017-11-07 15:37:01', '2017-11-14 10:51:18', NULL),
(7, 1, 'prout', 'prout', '2017-11-09 15:57:17', '2017-11-14 10:51:18', NULL),
(8, NULL, 'faire caca', 'jaime le caca', '2018-03-18 18:19:45', '2018-03-18 18:20:16', '2018-03-18 18:19:50');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `login`, `mail`, `password`) VALUES
(1, 'aurelia', 'aurelia@gmail.com', 'aurelia'),
(2, 'orelia', 'orelia@gmail.com', 'orelia');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_todos_user` (`id_user`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `todos`
--
ALTER TABLE `todos`
  ADD CONSTRAINT `fk_todos_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
