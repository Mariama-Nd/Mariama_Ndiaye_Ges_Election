-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 08 jan. 2025 à 22:10
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Ges_election_examen`
--

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `candidats`
--

CREATE TABLE `candidats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `etudiant_id` bigint(20) UNSIGNED NOT NULL,
  `niveau` enum('Licence','Master','Doctorat') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `candidats`
--

INSERT INTO `candidats` (`id`, `etudiant_id`, `niveau`, `created_at`, `updated_at`) VALUES
(1, 1, 'Licence', '2024-12-28 01:53:12', '2024-12-28 01:53:12'),
(2, 2, 'Master', '2024-12-28 02:06:58', '2024-12-28 02:06:58'),
(3, 11, 'Licence', '2024-12-30 19:45:22', '2024-12-30 19:45:22'),
(4, 10, 'Master', '2024-12-30 19:45:37', '2024-12-30 19:45:37'),
(5, 9, 'Doctorat', '2025-01-02 11:41:29', '2025-01-02 11:41:29');

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 'Medecine', '2024-12-26 18:35:58', '2024-12-26 18:35:58'),
(2, 'Faseg', '2024-12-30 19:24:28', '2024-12-30 19:24:28'),
(3, 'Geographie', '2024-12-30 19:24:50', '2024-12-30 19:24:50'),
(4, 'DDDD', '2024-12-30 19:25:17', '2024-12-30 19:25:17'),
(5, 'wwww', '2024-12-30 19:25:24', '2024-12-30 19:25:24'),
(6, 'iiii', '2024-12-30 19:25:30', '2024-12-30 19:25:30'),
(7, 'mmmm', '2024-12-30 19:25:36', '2024-12-30 19:25:36');

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matricule` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `naissance` date NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `sexe` enum('Masculin','Feminin') NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `programme_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id`, `matricule`, `nom`, `prenom`, `naissance`, `lieu`, `sexe`, `adresse`, `programme_id`, `created_at`, `updated_at`, `telephone`, `email`) VALUES
(1, '230007', 'Ndiaye', 'Mariam', '2024-12-01', 'Guediawaye', 'Feminin', 'Ouagou Niayes', 2, '2024-12-28 01:46:20', '2024-12-28 01:46:20', NULL, NULL),
(2, '240365', 'Dione', 'Michel', '2024-12-11', 'Mbour', 'Masculin', 'Parccelles', 2, '2024-12-28 02:04:50', '2024-12-28 02:04:50', NULL, NULL),
(3, '240564', 'Gueye', 'Mame Asta', '2024-12-03', 'Mbacke', 'Feminin', 'Pickine', 2, '2024-12-28 02:05:56', '2024-12-28 02:05:56', NULL, NULL),
(4, '240012', 'wade', 'Aliou', '2017-10-06', 'Kaoulack', 'Masculin', 'Medina', 2, '2024-12-28 23:27:03', '2024-12-28 23:27:03', NULL, NULL),
(5, '34567', 'aert', 'vvvvv', '2024-12-14', 'ccccc', 'Feminin', 'wwwww', 2, '2024-12-28 23:58:57', '2024-12-28 23:58:57', NULL, NULL),
(6, '230389', 'Sene', 'Mamoud', '2002-11-21', 'Louga', 'Masculin', 'Thiaroye', 2, '2024-12-29 19:31:40', '2024-12-29 19:31:40', '773535242', 'mamoud.sene@uahb.sn'),
(7, '230532', 'sane', 'Amy', '2004-11-28', 'Kebemere', 'Feminin', 'Keur Massar', 2, '2024-12-29 22:27:14', '2024-12-29 22:27:14', '784360965', 'amy.sane@uahb.sn'),
(8, '240434', 'Beye', 'Soda', '2003-01-13', 'Dakar', 'Feminin', 'Dakar', 2, '2024-12-29 23:08:24', '2024-12-29 23:08:24', '774359337', 'soda@uahb.sn'),
(9, '230683', 'Faye', 'Maman', '2005-08-04', 'Saoukom', 'Feminin', 'Tattaguine Scale', 2, '2024-12-30 02:03:11', '2024-12-30 02:03:11', '785434564', 'maman.faye@uahb.sn'),
(10, '240064', 'Faye', 'Khady', '2001-10-18', 'Fatick', 'Feminin', 'Malika', 9, '2024-12-30 19:33:40', '2024-12-30 19:33:40', '763340923', 'khady.faye@uahb.sn'),
(11, '230987', 'Sall', 'Mansour', '2023-10-10', 'Touba', 'Masculin', 'Mermoz', 3, '2024-12-30 19:35:51', '2024-12-30 19:35:51', '774186540', 'mansour.sall@uahb.sn'),
(12, '220077', 'Ndiaye', 'Nabou', '2000-01-26', 'Keur Massar', 'Feminin', 'Guediawaye', 3, '2024-12-30 19:38:45', '2024-12-30 19:38:45', '707236830', 'nabou.ndiaye@uahb.sn'),
(13, '240123', 'Ndour', 'Doudou', '2004-04-25', 'Dakar', 'Masculin', 'Fass', 8, '2024-12-30 19:40:35', '2024-12-30 19:40:35', '783233607', 'doudou.ndour@uahb.sn'),
(14, '220432', 'Gueye', 'Omar', '2024-12-18', 'Saint-Louis', 'Masculin', 'HLM5', 8, '2024-12-30 19:44:26', '2024-12-30 19:44:26', '753560801', 'omar.gueye@uahb.sn'),
(15, '230763', 'Ndiaye', 'Daba', '2000-11-22', 'Guediawaye', 'Feminin', 'Ouakam', 11, '2024-12-30 20:00:52', '2024-12-30 20:00:52', '785532355', 'daba.ndiaye@uahb.sn'),
(16, '230306', 'Fall', 'Déguéne', '2000-06-02', 'Touba', 'Feminin', 'Parcelles Unite 26', 11, '2024-12-31 00:48:45', '2024-12-31 00:48:45', '705283700', 'deguene.fall@uahb.sn'),
(17, '230045', 'Diallo', 'Omar', '2003-04-18', 'Ziginchor', 'Masculin', 'Ouest Foire', 12, '2024-12-31 00:58:50', '2024-12-31 00:58:50', '782964239', 'omar.diallo@uahb.sn'),
(22, '230534', 'Soniane', 'Arame', '2003-02-17', 'Guediawaye', 'Feminin', 'Guediawaye', 10, '2025-01-03 14:24:30', '2025-01-03 14:24:30', '780456234', 'ararame.soniane@uahb.sn'),
(23, '546574', 'ooo', 'ooo', '2025-01-21', 'ooo', 'Feminin', 'ooo', 7, '2025-01-03 15:04:30', '2025-01-03 15:04:30', '775547872', 'ooo@gmail.com'),
(25, '240345', 'Ndiaye', 'Yama', '2005-08-13', 'Thies', 'Feminin', 'Malika', 8, '2025-01-08 17:34:21', '2025-01-08 17:34:21', '776209714', 'ndiayemama868@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '28f6feca-3616-4132-8313-37639d9a044e', 'database', 'default', '{\"uuid\":\"28f6feca-3616-4132-8313-37639d9a044e\",\"displayName\":\"App\\\\Events\\\\VoteRecorded\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\VoteRecorded\\\":1:{s:4:\\\"vote\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Vote\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition \"App\\Events\\VoteRecorded\" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php:76\nStack trace:\n#0 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(76): method_exists(Object(__PHP_Incomplete_Class), \'broadcastAs\')\n#1 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#7 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-01-08 17:05:25'),
(2, '5896b1ce-330c-4d70-807e-bc8cf025ddfc', 'database', 'default', '{\"uuid\":\"5896b1ce-330c-4d70-807e-bc8cf025ddfc\",\"displayName\":\"App\\\\Events\\\\VoteRecorded\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\VoteRecorded\\\":1:{s:4:\\\"vote\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Vote\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition \"App\\Events\\VoteRecorded\" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php:76\nStack trace:\n#0 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(76): method_exists(Object(__PHP_Incomplete_Class), \'broadcastAs\')\n#1 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#7 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-01-08 17:05:25'),
(3, '8dfe1e52-7f5f-4916-a151-38d537443ec7', 'database', 'default', '{\"uuid\":\"8dfe1e52-7f5f-4916-a151-38d537443ec7\",\"displayName\":\"App\\\\Events\\\\VoteRecorded\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\VoteRecorded\\\":1:{s:4:\\\"vote\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Vote\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition \"App\\Events\\VoteRecorded\" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php:76\nStack trace:\n#0 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(76): method_exists(Object(__PHP_Incomplete_Class), \'broadcastAs\')\n#1 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#7 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-01-08 17:05:25'),
(4, '207517c7-0f6c-442f-b900-1dfd68eff228', 'database', 'default', '{\"uuid\":\"207517c7-0f6c-442f-b900-1dfd68eff228\",\"displayName\":\"App\\\\Events\\\\VoteRecorded\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\VoteRecorded\\\":1:{s:4:\\\"vote\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Vote\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition \"App\\Events\\VoteRecorded\" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php:76\nStack trace:\n#0 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(76): method_exists(Object(__PHP_Incomplete_Class), \'broadcastAs\')\n#1 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#7 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-01-08 17:05:25');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(5, '6afc0016-9884-4559-9c28-964c18f76513', 'database', 'default', '{\"uuid\":\"6afc0016-9884-4559-9c28-964c18f76513\",\"displayName\":\"App\\\\Events\\\\VoteRecorded\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\VoteRecorded\\\":1:{s:4:\\\"vote\\\";a:5:{s:2:\\\"id\\\";i:1;s:11:\\\"candidat_id\\\";i:1;s:11:\\\"etudiant_id\\\";i:1;s:4:\\\"date\\\";s:10:\\\"2024-12-28\\\";s:5:\\\"temps\\\";s:8:\\\"01:53:38\\\";}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition \"App\\Events\\VoteRecorded\" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php:76\nStack trace:\n#0 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(76): method_exists(Object(__PHP_Incomplete_Class), \'broadcastAs\')\n#1 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#7 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-01-08 17:05:25'),
(6, 'ff7245ad-e54b-4826-9ed9-1d9cc05b54d4', 'database', 'default', '{\"uuid\":\"ff7245ad-e54b-4826-9ed9-1d9cc05b54d4\",\"displayName\":\"App\\\\Events\\\\VoteRecorded\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\VoteRecorded\\\":1:{s:4:\\\"vote\\\";a:5:{s:2:\\\"id\\\";i:1;s:11:\\\"candidat_id\\\";i:1;s:11:\\\"etudiant_id\\\";i:1;s:4:\\\"date\\\";s:10:\\\"2024-12-28\\\";s:5:\\\"temps\\\";s:8:\\\"01:53:38\\\";}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition \"App\\Events\\VoteRecorded\" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php:76\nStack trace:\n#0 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(76): method_exists(Object(__PHP_Incomplete_Class), \'broadcastAs\')\n#1 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#7 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-01-08 17:05:25'),
(7, 'afce1e6b-fb7a-40d8-84e5-3a47838eaabe', 'database', 'default', '{\"uuid\":\"afce1e6b-fb7a-40d8-84e5-3a47838eaabe\",\"displayName\":\"App\\\\Events\\\\VoteRecorded\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\VoteRecorded\\\":1:{s:4:\\\"vote\\\";a:5:{s:2:\\\"id\\\";i:1;s:11:\\\"candidat_id\\\";i:1;s:11:\\\"etudiant_id\\\";i:1;s:4:\\\"date\\\";s:10:\\\"2024-12-28\\\";s:5:\\\"temps\\\";s:8:\\\"01:53:38\\\";}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition \"App\\Events\\VoteRecorded\" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php:76\nStack trace:\n#0 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(76): method_exists(Object(__PHP_Incomplete_Class), \'broadcastAs\')\n#1 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle(Object(Illuminate\\Broadcasting\\BroadcastManager))\n#2 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#7 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#8 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#9 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Broadcasting\\BroadcastEvent), false)\n#11 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#12 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#13 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Broadcasting\\BroadcastEvent))\n#15 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /Applications/XAMPP/xamppfiles/htdocs/Mariama_Ndiaye_Ges_Election/artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2025-01-08 17:05:25');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_22_171039_create_departements_table', 2),
(5, '2024_12_22_174434_create_programmes_table', 3),
(7, '2024_12_22_193400_create_etudiants_table', 4),
(9, '2024_12_22_201250_create_candidats_table', 5),
(10, '2024_12_22_210403_create_votes_table', 6),
(11, '2024_12_27_213119_create_permission_tables', 7),
(12, '2024_12_27_231348_add_role_to_users_table', 8),
(13, '2024_12_29_185649_add_telephone_and_email_to_etudiants_table', 9),
(14, '2025_01_01_162004_create_permission_tables', 10),
(18, '2025_01_03_132740_add_photo_to_etudiants_table', 11),
(20, '2025_01_03_145916_add_photo_to_users_table', 12);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `programmes`
--

CREATE TABLE `programmes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `departement_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `programmes`
--

INSERT INTO `programmes` (`id`, `nom`, `departement_id`, `created_at`, `updated_at`) VALUES
(2, 'aaaaa', 1, '2024-12-28 01:45:18', '2024-12-28 01:45:18'),
(3, 'dddd', 4, '2024-12-30 19:26:02', '2024-12-30 19:26:02'),
(4, 'ffff', 2, '2024-12-30 19:26:13', '2024-12-30 19:26:13'),
(5, 'gggg', 3, '2024-12-30 19:26:24', '2025-01-02 23:07:01'),
(6, 'ettt', 4, '2024-12-30 19:26:43', '2024-12-30 19:26:43'),
(7, 'ndndnd', 4, '2024-12-30 19:26:54', '2024-12-30 19:26:54'),
(8, 'qwert', 6, '2024-12-30 19:27:13', '2024-12-30 19:27:13'),
(9, 'mnbv', 7, '2024-12-30 19:27:24', '2024-12-30 19:27:24'),
(10, 'ftftft', 3, '2024-12-30 19:27:40', '2024-12-30 19:27:40'),
(11, 'pious', 7, '2024-12-30 19:27:55', '2024-12-30 19:27:55'),
(12, 'wsdfg', 5, '2024-12-30 19:28:11', '2024-12-30 19:28:11');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('zE4YJUGIXA3bwnoep4bTWoajJcRrndBjW8TTo9e2', 6, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR0VWa0tZUmJwS0RJeGc1alRxc2NaQU9nN1VkV2lHV2lKeXFqRDhyYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O30=', 1736365355);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'etudiant'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'mama', 'mama@gmail.com', NULL, NULL, '$2y$12$.r3C9BDd4QT2QG2yIx855Oy.YoUS1HshPX9wSPEzm26HbaLMpiph2', NULL, '2024-12-26 17:42:40', '2024-12-26 17:42:40', 'etudiant'),
(2, 'mamoud sene', 'mamoud.sene@uahb.sn', NULL, NULL, '$2y$12$/vn/qwKhu3YmlHjhdR8C8OL3da69z1ip37Je7PhBaPFKGYb45hxuK', NULL, '2024-12-29 19:32:50', '2024-12-29 19:32:50', 'etudiant'),
(3, 'Soda', 'soda@uahb.sn', NULL, NULL, '$2y$12$ItSVk5oK0fDrF3rlAAps9OhOr5uMBcaduW6.AhmGaI.C5qIRqiu/i', 'GTqLvVlPoj4rXxoIS3KFmQukhdFSY8NjCq7FPXwAXJBp2yljbcio1X25zvsv', '2024-12-29 22:14:20', '2024-12-29 22:14:20', 'etudiant'),
(4, 'Amy Sane', 'amy.sane@uahb.sn', NULL, NULL, '$2y$12$C7oQDokgKmpeKmbSav0UYu4jp0dzVCTODBjiR423llmDNieW7Rde2', NULL, '2024-12-29 22:23:39', '2024-12-29 22:23:39', 'étudiant'),
(6, 'Kara samb', 'kara.samb@uahb.sn', NULL, NULL, '$2y$12$SZLLyIXYmK87AP1.G9GmA.k2RPXaXpdXi3R1mGCRgDP3S7G2dYTG2', NULL, '2024-12-30 01:04:53', '2024-12-30 01:04:53', 'administrateur'),
(7, 'maman faye', 'maman.faye@uahb.sn', NULL, NULL, '$2y$12$scZCf5m5mKKL2lESDVEt5uxcITcQDZYzFPtYcBPWDS2Q/fn7jUqUe', NULL, '2024-12-30 02:05:19', '2024-12-30 02:05:19', 'etudiant'),
(8, 'Doudou Ndour', 'doudou.ndour@uahb.sn', NULL, NULL, '$2y$12$gFlXJHJnbWWWZMcYFGGpj.nna9S8jM226vljOYpzNu4ISV37ocq/a', NULL, '2024-12-30 19:49:14', '2024-12-30 19:49:14', 'etudiant'),
(9, 'Nabou Ndiaye', 'nabou.ndiaye@uahb.sn', NULL, NULL, '$2y$12$NiH4pDY5kX9k6RYXCiI7dOb.G6WdVXbH3tEl17qzOPJ55WNR.tgoS', NULL, '2024-12-30 19:50:37', '2024-12-30 19:50:37', 'etudiant'),
(10, 'Khady Faye', 'khady.faye@uahb.sn', NULL, NULL, '$2y$12$faTEHf8XWcv0MAW./r4nguAqL5RNqa7g6d/ZBR4aUvQfQgCvxXehG', NULL, '2024-12-30 19:52:02', '2024-12-30 19:52:02', 'etudiant'),
(11, 'Omar Gueye', 'omar.gueye@uahb.sn', NULL, NULL, '$2y$12$GqsW6L6Yq0qNYp3R1JMZ/.H2h50dy74de//hXm3s1tNYI4nPYEBJi', NULL, '2024-12-30 19:56:51', '2024-12-30 19:56:51', 'etudiant'),
(12, 'Daba Ndiaye', 'daba.ndiaye@uahb.sn', NULL, NULL, '$2y$12$GdM1BcvIPkZDoJzlYfGRFei/O8SPrMQVMPjPd5sER0h.xyoxIWJCa', NULL, '2024-12-30 19:58:36', '2024-12-30 19:58:36', 'etudiant'),
(13, 'Sene', 'papemoussa.sene@uahb.sn', NULL, NULL, '$2y$12$gxiSxMxFjcQOL2rN0CycPuJLbsmQH00gYnAeVQLAK/wllGkx8v7tq', NULL, '2024-12-31 00:35:58', '2024-12-31 00:35:58', 'etudiant'),
(14, 'Fall', 'deguene.fall@uahb.sn', NULL, NULL, '$2y$12$r/p/FAoS2V51dJauiX.15OLJrLBpEWTcPcRYJ2zX7/0IDiAyYEFga', NULL, '2024-12-31 00:41:57', '2024-12-31 00:41:57', 'etudiant'),
(15, 'Diallo', 'omar.diallo@uahb.sn', NULL, NULL, '$2y$12$ZJQUuWipoi9YU0WDtRIB0ex9zuMyMdR5TGXm..76QuTqePxohHPkG', NULL, '2024-12-31 00:58:50', '2024-12-31 00:58:50', 'etudiant'),
(21, 'vvv', 'vb@gmail.cpm', NULL, NULL, '$2y$12$QhX/fw3WOi2qX32ozBGAAeLjjrdGf2FHkdceyW3xf/C/zBaSK44VK', NULL, '2025-01-03 14:18:48', '2025-01-03 14:18:48', 'etudiant'),
(22, 'Soniane', 'ararame.soniane@uahb.sn', 'images/arame.jpeg', NULL, '$2y$12$z1mUnTJPbT8P1zxUzmM63OotGb9S3WL.Xm/Ytjck3jFglIZ1J4QKC', NULL, '2025-01-03 14:24:30', '2025-01-03 14:24:30', 'etudiant'),
(23, 'ooo', 'ooo@gmail.com', '/private/var/folders/r7/_5z_84nd58gcgyjjgzz_l1j40000gn/T/phpm4795d', NULL, '$2y$12$RFGJW22bhIwk8OOcKz1jHupxPbXG3.s8mSN5sd171kJMuRQ9IAcVS', NULL, '2025-01-03 15:04:30', '2025-01-03 15:04:30', 'etudiant'),
(24, 'www', 'baba@gmail.com', 'images/KBntzH7Xi2690eeoePjmY6nb8zD8YrQmbw517M1K.jpg', NULL, '$2y$12$gYE5ZgOrNd55dIm1C28BpeaiFrY37flwuC/ZukISumV2K/Q5Km.ki', NULL, '2025-01-03 20:41:26', '2025-01-03 20:41:26', 'etudiant'),
(25, 'Ndiaye', 'ndiayemama868@gmail.com', 'images/YWUtAcuyz4TF5KIUWZ1WNyzt8NVzVuFMMLnXTpbz.jpg', NULL, '$2y$12$RbQsZLEtymSNtTUkbr058eUuySpmCQSd7mtLlJrpbBqRogwzi/d5G', NULL, '2025-01-08 17:34:21', '2025-01-08 17:34:21', 'etudiant');

-- --------------------------------------------------------

--
-- Structure de la table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `etudiant_id` bigint(20) UNSIGNED NOT NULL,
  `candidat_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `temps` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `votes`
--

INSERT INTO `votes` (`id`, `etudiant_id`, `candidat_id`, `date`, `temps`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-12-28', '01:53:38', '2024-12-28 01:53:38', '2024-12-28 01:53:38'),
(2, 2, 1, '2024-12-16', '02:06:19', '2024-12-28 02:06:19', '2024-12-28 02:06:19'),
(3, 3, 2, '2024-12-28', '02:07:22', '2024-12-28 02:07:22', '2024-12-28 02:07:22'),
(4, 4, 2, '2024-12-29', '23:27:37', '2024-12-28 23:27:37', '2024-12-28 23:27:37'),
(5, 6, 1, '2024-12-29', '19:33:07', '2024-12-29 19:33:07', '2024-12-29 19:33:07'),
(6, 7, 2, '2024-12-29', '22:27:27', '2024-12-29 22:27:27', '2024-12-29 22:27:27'),
(7, 8, 1, '2024-12-29', '23:08:36', '2024-12-29 23:08:36', '2024-12-29 23:08:36'),
(8, 9, 2, '2024-12-30', '02:05:36', '2024-12-30 02:05:36', '2024-12-30 02:05:36'),
(9, 13, 3, '2024-12-30', '19:49:35', '2024-12-30 19:49:35', '2024-12-30 19:49:35'),
(10, 12, 4, '2024-12-30', '19:50:50', '2024-12-30 19:50:50', '2024-12-30 19:50:50'),
(11, 10, 3, '2024-12-30', '19:52:16', '2024-12-30 19:52:16', '2024-12-30 19:52:16'),
(12, 14, 1, '2024-12-30', '19:57:44', '2024-12-30 19:57:44', '2024-12-30 19:57:44'),
(13, 16, 4, '2024-12-31', '00:49:29', '2024-12-31 00:49:29', '2024-12-31 00:49:29'),
(14, 17, 3, '2024-12-31', '00:59:28', '2024-12-31 00:59:28', '2024-12-31 00:59:28');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `candidats`
--
ALTER TABLE `candidats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidats_etudiant_id_foreign` (`etudiant_id`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departements_nom_unique` (`nom`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `etudiants_matricule_unique` (`matricule`),
  ADD UNIQUE KEY `etudiants_email_unique` (`email`),
  ADD KEY `etudiants_programme_id_foreign` (`programme_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `programmes`
--
ALTER TABLE `programmes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `programmes_nom_unique` (`nom`),
  ADD KEY `programmes_departement_id_foreign` (`departement_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `votes_etudiant_id_unique` (`etudiant_id`),
  ADD KEY `votes_candidat_id_foreign` (`candidat_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `candidats`
--
ALTER TABLE `candidats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `programmes`
--
ALTER TABLE `programmes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidats`
--
ALTER TABLE `candidats`
  ADD CONSTRAINT `candidats_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_programme_id_foreign` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `programmes`
--
ALTER TABLE `programmes`
  ADD CONSTRAINT `programmes_departement_id_foreign` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_candidat_id_foreign` FOREIGN KEY (`candidat_id`) REFERENCES `candidats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
