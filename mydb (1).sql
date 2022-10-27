-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Paź 2022, 10:38
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `is_right` varchar(45) DEFAULT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `answers`
--

INSERT INTO `answers` (`id`, `content`, `is_right`, `questions_id`) VALUES
(1, 'niggi', '0', 1),
(2, 'godfist', '1', 1),
(3, 'pawciogrubasek', '0', 1),
(4, '17', '0', 2),
(5, '18', '1', 2),
(6, '20', '0', 2),
(7, '12', '0', 3),
(8, '34', '0', 3),
(9, '18', '1', 3),
(10, '15', '0', 4),
(11, '18', '1', 4),
(12, '19', '0', 4),
(13, 'pawel k', '1', 5),
(14, 'oskar', '1', 5),
(15, 'pawel l', '1', 5),
(16, 'szymi', '0', 5),
(17, 'pawel k', '1', 6),
(18, 'oskar', '1', 6),
(19, 'milosz', '1', 6),
(20, 'pawel l', '0', 6),
(21, 'kacper', '0', 6),
(22, '4', '1', 7),
(23, '6-2', '1', 7),
(24, '6', '0', 7),
(25, '17', '0', 7),
(26, 'pies', '0', 8),
(27, 'kot', '1', 8),
(28, 'małpa', '0', 8),
(29, 'tygrys', '1', 8),
(30, 'gruby', '1', 9),
(31, 'fajny', '1', 9),
(32, 'szczeka', '0', 9),
(33, 'warczy', '0', 9),
(34, 'zajawkowiczem', '1', 10),
(35, 'gangsterem', '0', 10),
(36, 'szeregowym', '1', 10),
(37, 'kierowca', '0', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `questions`
--

INSERT INTO `questions` (`id`, `content`) VALUES
(1, 'Jaki pseudonim ma Paweł K'),
(2, 'Ile lat ma Paweł K'),
(3, 'Ile lat ma oskar'),
(4, 'Ile lat ma kacper'),
(5, 'kto gra w lola'),
(6, 'kto ma prawko'),
(7, 'ile to 2+2'),
(8, 'ktore zwierze jest z rodziny kotowatych'),
(9, 'ktore okreslenie pasuje do kota'),
(10, 'kim jest szymi');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students_checks`
--

CREATE TABLE `students_checks` (
  `id` int(11) NOT NULL,
  `answers_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students_has_tests`
--

CREATE TABLE `students_has_tests` (
  `id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests_has_questions`
--

CREATE TABLE `tests_has_questions` (
  `id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`,`questions_id`),
  ADD KEY `fk_answers_questions` (`questions_id`);

--
-- Indeksy dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `students_checks`
--
ALTER TABLE `students_checks`
  ADD PRIMARY KEY (`id`,`answers_id`,`questions_id`,`tests_id`,`students_id`),
  ADD KEY `fk_students_checks_answers1` (`answers_id`),
  ADD KEY `fk_students_checks_questions1` (`questions_id`),
  ADD KEY `fk_students_checks_tests1` (`tests_id`),
  ADD KEY `fk_students_checks_students1` (`students_id`);

--
-- Indeksy dla tabeli `students_has_tests`
--
ALTER TABLE `students_has_tests`
  ADD PRIMARY KEY (`id`,`students_id`,`tests_id`),
  ADD KEY `fk_students_has_tests_students1` (`students_id`),
  ADD KEY `fk_students_has_tests_tests1` (`tests_id`);

--
-- Indeksy dla tabeli `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tests_has_questions`
--
ALTER TABLE `tests_has_questions`
  ADD PRIMARY KEY (`id`,`tests_id`,`questions_id`),
  ADD KEY `fk_tests_has_questions_tests1` (`tests_id`),
  ADD KEY `fk_tests_has_questions_questions1` (`questions_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answers_questions` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `students_checks`
--
ALTER TABLE `students_checks`
  ADD CONSTRAINT `fk_students_checks_answers1` FOREIGN KEY (`answers_id`) REFERENCES `answers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_checks_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_checks_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_checks_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `students_has_tests`
--
ALTER TABLE `students_has_tests`
  ADD CONSTRAINT `fk_students_has_tests_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_has_tests_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `tests_has_questions`
--
ALTER TABLE `tests_has_questions`
  ADD CONSTRAINT `fk_tests_has_questions_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tests_has_questions_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
