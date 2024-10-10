-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 21, 2024 at 05:34 PM
-- Server version: 8.0.36
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wtid_academy`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$ujGwI/iFDDtEyAOy5pWLT.yuN8WWTd4T.Rek5aU2bSduvoErsAs.i', NULL, '2024-08-21 09:25:54', '2024-08-21 09:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `completed_lessons`
--

CREATE TABLE `completed_lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `slug`, `description`, `is_published`, `created_at`, `updated_at`) VALUES
(1, 'Web Dev Fundamentals', 'web-dev-fundamentals', 'Grasp the core technologies of HTML, CSS, and JavaScript.', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(2, 'Full-Stack Mastery', 'full-stack-mastery', 'Learn both front-end and back-end development for complete web applications.', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(3, 'Modern JavaScript Essentials', 'modern-javascript-essentials', 'Explore ES6+ features and modern JavaScript practices.', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(4, 'Responsive Design Workshop', 'responsive-design-workshop', 'Create websites that adapt to any screen size or device.', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(5, 'Backend Development Bootcamp', 'backend-development-bootcamp', 'Build robust server-side applications and APIs.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(6, 'Frontend Frameworks Deep Dive', 'frontend-frameworks-deep-dive', 'Master popular frameworks like React, Vue, or Angular.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(7, 'Dynamic Web Applications', 'dynamic-web-applications', 'Develop interactive, data-driven web experiences.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(8, 'Progressive Web App Development', 'progressive-web-app-development', 'Build fast, reliable, and engaging web apps that work offline.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(9, 'Web Security Essentials', 'web-security-essentials', 'Protect your web applications from common vulnerabilities and threats.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `set_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `set_id`, `name`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'Introduction to HTML', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(2, 1, 'HTML Tags and Elements', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(3, 1, 'HTML Structure', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(4, 2, 'Introduction to CSS', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(5, 2, 'CSS Selectors', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(6, 2, 'CSS Properties', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(7, 3, 'Introduction to JavaScript', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(8, 3, 'JavaScript Data Types', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(9, 3, 'JavaScript Operators', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(10, 4, 'Introduction to HTML', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(11, 4, 'HTML Tags and Elements', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(12, 4, 'HTML Forms', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(13, 4, 'HTML Links', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(14, 4, 'HTML Media', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(15, 5, 'Introduction to CSS', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(16, 5, 'CSS Selectors', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(17, 5, 'CSS Box Model', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(18, 5, 'CSS Flexbox', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(19, 5, 'CSS Grid', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(20, 6, 'Introduction to JavaScript', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(21, 6, 'JavaScript Variables', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(22, 6, 'JavaScript Functions', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(23, 6, 'JavaScript Events', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(24, 7, 'ES6 and Beyond', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(25, 7, 'Asynchronous JavaScript', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(26, 8, 'Closures and Scope', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(27, 8, 'Prototypes and Inheritance', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(28, 9, 'JavaScript Design Patterns', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(29, 9, 'JavaScript Testing', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(30, 10, 'Introduction to Responsive Design', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(31, 10, 'Flexible Grid Layouts', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(32, 11, 'CSS Flexbox', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(33, 11, 'CSS Grid', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(34, 12, 'Fluid Images', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(35, 12, 'Viewport Meta Tag', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_contents`
--

CREATE TABLE `lesson_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `type` enum('learn','quiz') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'learn',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_contents`
--

INSERT INTO `lesson_contents` (`id`, `lesson_id`, `type`, `content`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'learn', 'HTML stands for HyperText Markup Language. It is the standard markup language for creating web pages.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(2, 1, 'quiz', 'What does HTML stand for?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(3, 1, 'learn', 'HTML elements define the structure of a web page. They are enclosed in angle brackets (< and >).', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(4, 1, 'quiz', 'Which characters are used to enclose HTML elements?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(5, 1, 'learn', 'HTML attributes provide additional information about HTML elements. They are placed within the starting tag.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(6, 1, 'quiz', 'Where are HTML attributes placed?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(7, 2, 'learn', 'Common HTML elements include headings (<h1> to <h6>), paragraphs (<p>), images (<img>), links (<a>), and divisions (<div>).', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(8, 2, 'quiz', 'Which HTML element is used to define a paragraph?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(9, 2, 'learn', 'HTML headings structure content and improve readability. They range from <h1> (most important) to <h6> (least important).', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(10, 2, 'quiz', 'Which HTML element is used for the most important heading?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(11, 2, 'learn', 'The <img> element is used to embed images in a web page. It requires the \'src\' attribute to specify the image source.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(12, 2, 'quiz', 'Which HTML attribute specifies the image source for the <img> element?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(13, 3, 'learn', 'The basic structure of an HTML document includes the <html>, <head>, and <body> elements.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(14, 3, 'quiz', 'Which element is the root of an HTML document?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(15, 3, 'learn', 'The <head> element contains meta-information about the document, such as title and stylesheets.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(16, 3, 'quiz', 'Where is the title of a web page defined?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(17, 3, 'learn', 'The <body> element contains the visible content of the web page.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(18, 3, 'quiz', 'Where is the main content of a web page placed?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(19, 4, 'learn', 'CSS stands for Cascading Style Sheets. It is used to style HTML elements.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(20, 4, 'quiz', 'What does CSS stand for?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(21, 4, 'learn', 'CSS rules consist of a selector, a property, and a value.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(22, 4, 'quiz', 'What are the three main components of a CSS rule?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(23, 4, 'learn', 'CSS can be applied in three ways: inline, internal, and external.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(24, 4, 'quiz', 'How many ways can CSS be applied to HTML?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(25, 5, 'learn', 'CSS selectors target the HTML elements to which styles will be applied.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(26, 5, 'quiz', 'What is the purpose of CSS selectors?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(27, 5, 'learn', 'Common selectors include element selectors, class selectors, and ID selectors.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(28, 5, 'quiz', 'Which type of selector targets elements based on their class attribute?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(29, 5, 'learn', 'CSS selectors can be combined using various combinators to create complex rules.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(30, 5, 'quiz', 'What are used to combine CSS selectors for more complex rules?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(31, 6, 'learn', 'CSS properties define the styles of HTML elements.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(32, 6, 'quiz', 'What do CSS properties define?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(33, 6, 'learn', 'Common CSS properties include color, font, background, margin, padding, and border.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(34, 6, 'quiz', 'Which CSS property is used to set the background color of an element?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(35, 6, 'learn', 'CSS properties can have multiple values separated by spaces.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(36, 6, 'quiz', 'How are multiple values separated in a CSS property?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(37, 7, 'learn', 'JavaScript is a programming language used to create interactive web pages.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(38, 7, 'quiz', 'What is JavaScript used for?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(39, 7, 'learn', 'JavaScript code can be embedded within HTML files or linked externally.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(40, 7, 'quiz', 'How can JavaScript code be included in an HTML file?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(41, 7, 'learn', 'JavaScript variables store data values.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(42, 7, 'quiz', 'What do JavaScript variables store?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(43, 8, 'learn', 'JavaScript has several data types, including numbers, strings, booleans, null, and undefined.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(44, 8, 'quiz', 'Which data type represents text values in JavaScript?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(45, 8, 'learn', 'Numbers in JavaScript can be integers or floating-point numbers.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(46, 8, 'quiz', 'What are the two main types of numbers in JavaScript?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(47, 8, 'learn', 'Booleans represent true or false values.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(48, 8, 'quiz', 'What do booleans represent?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(49, 9, 'learn', 'JavaScript operators perform operations on variables and values.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(50, 9, 'quiz', 'What do JavaScript operators do?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(51, 9, 'learn', 'Arithmetic operators include +, -, *, /, and %.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(52, 9, 'quiz', 'Which operator is used for division in JavaScript?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(53, 9, 'learn', 'Comparison operators compare values and return a boolean result.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(54, 9, 'quiz', 'What do comparison operators do?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(55, 10, 'learn', 'HTML stands for HyperText Markup Language. It is the standard markup language for creating web pages.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(56, 10, 'quiz', 'What does HTML stand for?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(57, 10, 'learn', 'HTML elements define the structure of a web page. They are enclosed in angle brackets (< and >).', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(58, 10, 'quiz', 'Which characters are used to enclose HTML elements?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(59, 10, 'learn', 'HTML attributes provide additional information about HTML elements. They are placed within the starting tag.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(60, 10, 'quiz', 'Where are HTML attributes placed?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(61, 10, 'learn', 'HTML is the foundation for all web development.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(62, 11, 'learn', 'Common HTML elements include headings (<h1> to <h6>), paragraphs (<p>), images (<img>), links (<a>), and divisions (<div>).', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(63, 11, 'quiz', 'Which HTML element is used to define a paragraph?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(64, 11, 'learn', 'HTML headings structure content and improve readability. They range from <h1> (most important) to <h6> (least important).', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(65, 11, 'quiz', 'Which HTML element is used for the most important heading?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(66, 11, 'learn', 'The <img> element is used to embed images in a web page. It requires the \'src\' attribute to specify the image source.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(67, 11, 'quiz', 'Which HTML attribute specifies the image source for the <img> element?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(68, 11, 'learn', 'Divisions (<div>) are block-level elements used to group other elements and apply CSS styling.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(69, 12, 'learn', 'Forms are used to collect user input. The <form> element wraps all input fields.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(70, 12, 'quiz', 'Which HTML element is used to create a form?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(71, 12, 'learn', 'Input elements include text fields, radio buttons, checkboxes, and submit buttons.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(72, 12, 'quiz', 'Which HTML element is used to create a text input field?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(73, 12, 'learn', 'The <label> element is used to provide a label for an input field.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(74, 12, 'quiz', 'Which HTML element is associated with an input field for accessibility?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(75, 13, 'learn', 'The <a> element is used to create hyperlinks, which are used to navigate between web pages.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(76, 13, 'quiz', 'Which HTML element is used to create a hyperlink?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(77, 13, 'learn', 'The href attribute specifies the URL of the page the link goes to.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(78, 13, 'quiz', 'What does the href attribute in an <a> element specify?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(79, 13, 'learn', 'You can open links in a new tab by using the target=\'_blank\' attribute.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(80, 13, 'quiz', 'Which attribute is used to open a link in a new tab?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(81, 14, 'learn', 'HTML allows you to embed media such as images, videos, and audio.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(82, 14, 'quiz', 'Which HTML element is used to embed a video?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(83, 14, 'learn', 'The <audio> element is used to embed sound content in a web page.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(84, 14, 'quiz', 'Which HTML element is used to embed audio?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(85, 14, 'learn', 'The <img> element requires the \'alt\' attribute to provide alternative text.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(86, 14, 'quiz', 'Which HTML attribute provides alternative text for an image?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(87, 14, 'learn', 'The <source> element is used to specify multiple media sources for <video> and <audio> elements.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(88, 15, 'learn', 'CSS stands for Cascading Style Sheets. It is used to style and layout web pages.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(89, 15, 'quiz', 'What does CSS stand for?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(90, 15, 'learn', 'CSS can be applied to HTML elements in three ways: inline, internal, and external.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(91, 15, 'quiz', 'Which method is NOT a way to apply CSS to HTML?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(92, 15, 'learn', 'The <style> tag is used for internal CSS.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(93, 15, 'quiz', 'Where is internal CSS placed?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(94, 16, 'learn', 'CSS selectors are used to select the HTML elements you want to style.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(95, 16, 'quiz', 'Which CSS selector is used to select an element by its ID?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(96, 16, 'learn', 'The class selector is used to select elements with a specific class.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(97, 16, 'quiz', 'Which CSS selector is used to select elements with a specific class?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(98, 16, 'learn', 'The universal selector (*) selects all elements.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(99, 16, 'quiz', 'Which CSS selector selects all elements?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(100, 16, 'learn', 'The type selector selects elements based on their tag name.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(101, 17, 'learn', 'The CSS box model is a box that wraps around every HTML element. It consists of margins, borders, padding, and the content itself.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(102, 17, 'quiz', 'Which is NOT part of the CSS box model?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(103, 17, 'learn', 'Margins are transparent spaces outside the border of an element.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(104, 17, 'quiz', 'Which part of the box model is transparent and outside the border?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(105, 17, 'learn', 'Padding is the space between the content and the border.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(106, 17, 'quiz', 'Where is padding in the box model?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(107, 17, 'learn', 'The content area is where text and images appear.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(108, 18, 'learn', 'CSS Flexbox is a layout model that provides a more efficient way to align and distribute space among items in a container.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(109, 18, 'quiz', 'Which CSS module is used to create flexible layouts?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(110, 18, 'learn', 'The flex container is the parent element that contains the flex items.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(111, 18, 'quiz', 'What is the parent element in a Flexbox layout called?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(112, 18, 'learn', 'Flex items can be aligned along the main axis or the cross axis.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(113, 18, 'quiz', 'In Flexbox, what are the two axes used to align items?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(114, 18, 'learn', 'You can change the direction of the main axis using the flex-direction property.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(115, 19, 'learn', 'CSS Grid is a powerful layout system that allows you to create complex, responsive grid-based layouts.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(116, 19, 'quiz', 'Which CSS module is used to create grid layouts?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(117, 19, 'learn', 'A grid container is the parent element in a grid layout.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(118, 19, 'quiz', 'What is the parent element in a Grid layout called?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(119, 19, 'learn', 'Grid items are placed inside the grid container.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(120, 19, 'quiz', 'What are the child elements inside a Grid container called?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(121, 19, 'learn', 'The grid-template-columns property defines the number and width of columns in a grid.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(122, 19, 'quiz', 'Which CSS property defines the number and width of columns in a grid?', 7, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(123, 20, 'learn', 'JavaScript is a programming language that allows you to implement complex features on web pages.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(124, 20, 'quiz', 'What type of language is JavaScript?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(125, 20, 'learn', 'JavaScript can change HTML content and attributes.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(126, 20, 'quiz', 'Which language can be used to change the content of an HTML element?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(127, 20, 'learn', 'JavaScript can be written directly in the HTML using the <script> tag.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(128, 20, 'quiz', 'Where is JavaScript code typically written within an HTML document?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(129, 20, 'learn', 'JavaScript can also be included externally using the src attribute in the <script> tag.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(130, 21, 'learn', 'Variables in JavaScript are used to store data values. You can create a variable using the var, let, or const keyword.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(131, 21, 'quiz', 'Which keyword is NOT used to declare a variable in JavaScript?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(132, 21, 'learn', 'The var keyword can be used to declare a variable in JavaScript.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(133, 21, 'quiz', 'Which keyword is the most commonly used to declare a variable?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(134, 21, 'learn', 'JavaScript variables can store different data types, such as strings, numbers, and booleans.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(135, 21, 'quiz', 'Which of the following is NOT a valid data type in JavaScript?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(136, 21, 'learn', 'The let keyword allows you to declare a block-scoped variable.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(137, 22, 'learn', 'Functions in JavaScript are blocks of code designed to perform a specific task.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(138, 22, 'quiz', 'What are functions in JavaScript?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(139, 22, 'learn', 'Functions are defined using the function keyword.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(140, 22, 'quiz', 'Which keyword is used to define a function in JavaScript?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(141, 22, 'learn', 'JavaScript functions can take parameters and return values.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(142, 22, 'quiz', 'What can functions in JavaScript accept and return?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(143, 22, 'learn', 'The return statement is used to return a value from a function.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(144, 23, 'learn', 'Events in JavaScript are actions that can be detected by your web application.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(145, 23, 'quiz', 'Which of the following is an example of a JavaScript event?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(146, 23, 'learn', 'JavaScript events include user actions like clicking, submitting forms, and loading a page.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(147, 23, 'quiz', 'Which event occurs when a user clicks on an HTML element?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(148, 23, 'learn', 'The addEventListener method is used to attach an event handler to an element.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(149, 23, 'quiz', 'Which method is used to attach an event handler to an element?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(150, 23, 'learn', 'The load event occurs when a page is fully loaded.', 6, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(151, 24, 'learn', 'ES6 introduced new features like let, const, and arrow functions.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(152, 24, 'quiz', 'Which of the following is a feature introduced in ES6?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(153, 24, 'learn', 'The const keyword is used to declare variables that cannot be reassigned.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(154, 24, 'quiz', 'Which keyword declares a variable that cannot be reassigned?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(155, 24, 'learn', 'Arrow functions provide a concise syntax for writing function expressions.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(156, 24, 'quiz', 'What does an arrow function provide in JavaScript?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(157, 25, 'learn', 'JavaScript handles asynchronous operations using callbacks, promises, and async/await.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(158, 25, 'quiz', 'Which method is used to handle asynchronous operations in JavaScript?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(159, 25, 'learn', 'The async/await syntax makes asynchronous code look synchronous.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(160, 25, 'quiz', 'Which syntax makes asynchronous code look synchronous?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(161, 25, 'learn', 'A promise is an object that represents the eventual completion or failure of an asynchronous operation.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(162, 25, 'quiz', 'What does a promise represent in JavaScript?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(163, 26, 'learn', 'A closure is a function that retains access to its outer scope, even after the outer function has returned.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(164, 26, 'quiz', 'What is a closure in JavaScript?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(165, 26, 'learn', 'JavaScript has function scope and block scope.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(166, 26, 'quiz', 'Which types of scope does JavaScript have?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(167, 26, 'learn', 'The let and const keywords create variables with block scope.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(168, 26, 'quiz', 'Which keywords create block-scoped variables?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(169, 27, 'learn', 'JavaScript uses prototypes to achieve inheritance between objects.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(170, 27, 'quiz', 'What does JavaScript use to achieve inheritance between objects?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(171, 27, 'learn', 'The prototype chain allows properties and methods to be inherited.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(172, 27, 'quiz', 'What does the prototype chain allow in JavaScript?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(173, 27, 'learn', 'All JavaScript objects inherit properties and methods from a prototype.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(174, 27, 'quiz', 'From what do all JavaScript objects inherit properties and methods?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(175, 28, 'learn', 'Design patterns are reusable solutions to common problems in software design.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(176, 28, 'quiz', 'What are design patterns?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(177, 28, 'learn', 'The Singleton pattern restricts the instantiation of a class to one object.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(178, 28, 'quiz', 'What does the Singleton pattern do?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(179, 28, 'learn', 'The Observer pattern allows objects to subscribe to and receive updates from other objects.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(180, 28, 'quiz', 'Which pattern allows objects to subscribe to updates?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(181, 29, 'learn', 'Testing is essential for ensuring code quality and reliability.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(182, 29, 'quiz', 'Why is testing important in JavaScript development?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(183, 29, 'learn', 'Unit testing focuses on testing individual units or components of code.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(184, 29, 'quiz', 'What is unit testing focused on?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(185, 29, 'learn', 'Integration testing ensures that different components of the application work together as expected.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(186, 29, 'quiz', 'What is the focus of integration testing?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(187, 30, 'learn', 'Responsive design ensures that web pages look good on all devices, from desktops to smartphones.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(188, 30, 'quiz', 'What is the goal of responsive design?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(189, 30, 'learn', 'Responsive design relies on flexible grids, fluid images, and media queries.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(190, 30, 'quiz', 'Which of the following is NOT a component of responsive design?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(191, 30, 'learn', 'Media queries are used to apply different styles depending on the device’s characteristics, such as screen size.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(192, 30, 'quiz', 'What is the purpose of media queries in responsive design?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(193, 31, 'learn', 'A flexible grid layout allows elements to resize proportionally based on the screen size.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(194, 31, 'quiz', 'What does a flexible grid layout do?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(195, 31, 'learn', 'Percentages are often used in grid layouts to create flexible columns.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(196, 31, 'quiz', 'Which unit is commonly used in grid layouts to create flexible columns?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(197, 31, 'learn', 'A grid system divides the page into a series of rows and columns, making it easier to design layouts.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(198, 31, 'quiz', 'What is the purpose of a grid system in web design?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(199, 32, 'learn', 'Flexbox is a layout module in CSS that allows items to align and distribute space within a container.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(200, 32, 'quiz', 'What is CSS Flexbox used for?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(201, 32, 'learn', 'The flex-direction property defines the direction in which the flex items are placed.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(202, 32, 'quiz', 'What does the flex-direction property define?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(203, 32, 'learn', 'The justify-content property is used to align the flex items along the main axis.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(204, 32, 'quiz', 'What does the justify-content property do in a Flexbox layout?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(205, 33, 'learn', 'CSS Grid is a powerful layout system for creating complex web layouts.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(206, 33, 'quiz', 'What is CSS Grid used for?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(207, 33, 'learn', 'The grid-template-columns property defines the columns of the grid.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(208, 33, 'quiz', 'What does the grid-template-columns property do?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(209, 33, 'learn', 'The grid-gap property is used to set the spacing between grid items.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(210, 33, 'quiz', 'What is the purpose of the grid-gap property?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(211, 34, 'learn', 'Fluid images resize automatically to fit their container, ensuring they look good on all screen sizes.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(212, 34, 'quiz', 'What are fluid images in responsive design?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(213, 34, 'learn', 'The max-width property is often used with images to ensure they do not exceed the width of their container.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(214, 34, 'quiz', 'Which property is commonly used to prevent images from exceeding their container’s width?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(215, 34, 'learn', 'Responsive images can be implemented using the srcset attribute, which provides different image sources based on screen size.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(216, 34, 'quiz', 'What is the srcset attribute used for in responsive design?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(217, 35, 'learn', 'The viewport meta tag is essential for controlling the layout on mobile browsers.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(218, 35, 'quiz', 'What is the purpose of the viewport meta tag?', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(219, 35, 'learn', 'The content attribute of the viewport meta tag typically includes the width and initial-scale properties.', 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(220, 35, 'quiz', 'Which properties are typically included in the content attribute of the viewport meta tag?', 3, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(221, 35, 'learn', 'The viewport meta tag is crucial for creating a responsive layout that adapts to different screen sizes.', 4, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(222, 35, 'quiz', 'Why is the viewport meta tag important in responsive design?', 5, '2024-08-21 09:25:54', '2024-08-21 09:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '2024_08_03_064643_create_personal_access_tokens_table', 1),
(3, '2024_08_03_065113_create_administrators_table', 1),
(4, '2024_08_03_065121_create_courses_table', 1),
(5, '2024_08_03_065124_create_sets_table', 1),
(6, '2024_08_03_065127_create_lessons_table', 1),
(7, '2024_08_04_054827_create_lesson_contents_table', 1),
(8, '2024_08_04_054851_create_options_table', 1),
(9, '2024_08_04_054852_create_enrollments_table', 1),
(10, '2024_08_07_034258_create_completed_lessons_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint UNSIGNED NOT NULL,
  `lesson_content_id` bigint UNSIGNED NOT NULL,
  `option_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `lesson_content_id`, `option_text`, `is_correct`, `created_at`, `updated_at`) VALUES
(1, 2, 'Hyper Text Markup Language', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(2, 2, 'Home Tool Markup Language', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(3, 2, 'Hyper Transfer Markup Language', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(4, 2, 'Hyperlink and Text Markup Language', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(5, 4, '< and >', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(6, 4, '[] and []', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(7, 4, '{} and {}', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(8, 4, '() and ()', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(9, 6, 'Within the starting tag', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(10, 6, 'Within the closing tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(11, 6, 'After the closing tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(12, 6, 'Anywhere in the HTML document', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(13, 8, '<p>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(14, 8, '<par>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(15, 8, '<text>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(16, 8, '<div>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(17, 10, '<h1>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(18, 10, '<header>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(19, 10, '<heading>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(20, 10, '<title>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(21, 12, 'src', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(22, 12, 'alt', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(23, 12, 'href', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(24, 12, 'image', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(25, 14, '<html>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(26, 14, '<body>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(27, 14, '<head>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(28, 14, '<div>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(29, 16, '<head>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(30, 16, '<title>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(31, 16, '<body>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(32, 16, '<html>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(33, 18, '<body>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(34, 18, '<head>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(35, 18, '<html>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(36, 18, '<div>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(37, 20, 'Cascading Style Sheets', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(38, 20, 'Computer Style Sheets', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(39, 20, 'Creative Style Sheets', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(40, 20, 'Colorful Style Sheets', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(41, 22, 'selector, property, value', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(42, 22, 'element, attribute, style', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(43, 22, 'tag, class, id', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(44, 22, 'color, font, size', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(45, 24, '3', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(46, 24, '2', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(47, 24, '4', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(48, 24, '1', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(49, 26, 'To target HTML elements for styling', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(50, 26, 'To create new HTML elements', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(51, 26, 'To add interactivity to web pages', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(52, 26, 'To define the structure of a web page', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(53, 28, 'class selector', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(54, 28, 'element selector', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(55, 28, 'ID selector', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(56, 28, 'universal selector', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(57, 30, 'combinators', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(58, 30, 'operators', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(59, 30, 'functions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(60, 30, 'variables', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(61, 32, 'styles of HTML elements', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(62, 32, 'the behavior of HTML elements', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(63, 32, 'the content of HTML elements', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(64, 32, 'the structure of HTML elements', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(65, 34, 'background', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(66, 34, 'color', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(67, 34, 'border', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(68, 34, 'margin', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(69, 36, 'spaces', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(70, 36, 'commas', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(71, 36, 'semicolons', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(72, 36, 'colons', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(73, 38, 'Creating interactive web pages', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(74, 38, 'Designing web pages', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(75, 38, 'Storing data', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(76, 38, 'Creating server-side applications', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(77, 40, 'Embedded within or linked externally', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(78, 40, 'Only embedded within', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(79, 40, 'Only linked externally', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(80, 40, 'Neither', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(81, 42, 'Data values', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(82, 42, 'Functions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(83, 42, 'Objects', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(84, 42, 'HTML elements', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(85, 44, 'string', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(86, 44, 'number', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(87, 44, 'boolean', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(88, 44, 'object', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(89, 46, 'integers and floating-point numbers', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(90, 46, 'positive and negative numbers', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(91, 46, 'decimal and non-decimal numbers', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(92, 46, 'whole numbers and fractions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(93, 48, 'true or false values', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(94, 48, 'yes or no values', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(95, 48, 'on or off values', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(96, 48, 'true or undefined values', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(97, 50, 'Perform operations on variables and values', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(98, 50, 'Declare variables', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(99, 50, 'Define functions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(100, 50, 'Create objects', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(101, 52, '/', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(102, 52, '\\', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(103, 52, ':', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(104, 52, '%', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(105, 54, 'Compare values and return a boolean result', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(106, 54, 'Perform arithmetic operations', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(107, 54, 'Assign values to variables', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(108, 54, 'Create new objects', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(109, 56, 'Hyper Text Markup Language', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(110, 56, 'Home Tool Markup Language', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(111, 56, 'Hyper Transfer Markup Language', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(112, 56, 'Hyperlink and Text Markup Language', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(113, 58, '< and >', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(114, 58, '[] and []', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(115, 58, '{} and {}', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(116, 58, '() and ()', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(117, 60, 'Within the starting tag', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(118, 60, 'Within the closing tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(119, 60, 'After the closing tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(120, 60, 'Anywhere in the HTML document', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(121, 63, '<p>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(122, 63, '<par>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(123, 63, '<text>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(124, 63, '<div>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(125, 65, '<h1>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(126, 65, '<header>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(127, 65, '<heading>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(128, 65, '<title>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(129, 67, 'src', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(130, 67, 'alt', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(131, 67, 'href', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(132, 67, 'image', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(133, 70, '<form>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(134, 70, '<input>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(135, 70, '<button>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(136, 70, '<label>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(137, 72, '<input type=\'text\'>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(138, 72, '<input type=\'password\'>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(139, 72, '<textarea>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(140, 72, '<button>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(141, 74, '<label>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(142, 74, '<form>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(143, 74, '<button>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(144, 74, '<select>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(145, 76, '<a>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(146, 76, '<link>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(147, 76, '<href>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(148, 76, '<nav>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(149, 78, 'The URL of the linked page', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(150, 78, 'The link\'s text', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(151, 78, 'The link\'s color', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(152, 78, 'The link\'s target', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(153, 80, 'target=\'_blank\'', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(154, 80, 'href=\'_new\'', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(155, 80, 'window=\'_blank\'', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(156, 80, 'link=\'_newtab\'', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(157, 82, '<video>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(158, 82, '<media>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(159, 82, '<embed>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(160, 82, '<iframe>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(161, 84, '<audio>', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(162, 84, '<sound>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(163, 84, '<track>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(164, 84, '<embed>', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(165, 86, 'alt', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(166, 86, 'src', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(167, 86, 'title', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(168, 86, 'href', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(169, 89, 'Cascading Style Sheets', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(170, 89, 'Computer Style Sheets', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(171, 89, 'Creative Style Sheets', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(172, 89, 'Colorful Style Sheets', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(173, 91, 'Internal', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(174, 91, 'External', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(175, 91, 'Inline', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(176, 91, 'Remote', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(177, 93, 'In the <style> tag', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(178, 93, 'In the <head> tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(179, 93, 'In the <link> tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(180, 93, 'In the <body> tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(181, 95, '#id', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(182, 95, '.id', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(183, 95, 'id', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(184, 95, '*id', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(185, 97, '.class', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(186, 97, '#class', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(187, 97, 'class', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(188, 97, '*class', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(189, 99, '*', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(190, 99, 'All', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(191, 99, '.', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(192, 99, '#', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(193, 102, 'Padding', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(194, 102, 'Margin', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(195, 102, 'Border', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(196, 102, 'Font', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(197, 104, 'Margin', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(198, 104, 'Padding', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(199, 104, 'Border', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(200, 104, 'Content', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(201, 106, 'Between the content and the border', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(202, 106, 'Outside the margin', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(203, 106, 'Between the border and margin', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(204, 106, 'Inside the content', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(205, 109, 'Flexbox', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(206, 109, 'Grid', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(207, 109, 'Box Model', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(208, 109, 'Float', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(209, 111, 'Flex container', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(210, 111, 'Flex item', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(211, 111, 'Flex row', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(212, 111, 'Flex column', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(213, 113, 'Main axis and cross axis', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(214, 113, 'Horizontal axis and vertical axis', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(215, 113, 'X-axis and Y-axis', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(216, 113, 'Top axis and bottom axis', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(217, 116, 'Grid', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(218, 116, 'Flexbox', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(219, 116, 'Box Model', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(220, 116, 'Float', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(221, 118, 'Grid container', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(222, 118, 'Grid item', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(223, 118, 'Grid row', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(224, 118, 'Grid column', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(225, 120, 'Grid items', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(226, 120, 'Grid rows', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(227, 120, 'Grid cells', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(228, 120, 'Grid blocks', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(229, 122, 'grid-template-columns', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(230, 122, 'grid-template-rows', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(231, 122, 'grid-column-gap', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(232, 122, 'grid-row-gap', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(233, 124, 'Programming language', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(234, 124, 'Markup language', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(235, 124, 'Styling language', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(236, 124, 'Database language', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(237, 126, 'JavaScript', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(238, 126, 'HTML', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(239, 126, 'CSS', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(240, 126, 'SQL', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(241, 128, 'In the <script> tag', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(242, 128, 'In the <style> tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(243, 128, 'In the <body> tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(244, 128, 'In the <head> tag', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(245, 131, 'let', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(246, 131, 'const', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(247, 131, 'var', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(248, 131, 'new', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(249, 133, 'var', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(250, 133, 'let', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(251, 133, 'const', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(252, 133, 'variable', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(253, 135, 'Integer', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(254, 135, 'String', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(255, 135, 'Number', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(256, 135, 'Boolean', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(257, 138, 'Blocks of code designed to perform specific tasks', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(258, 138, 'Variables that store data', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(259, 138, 'Loops that iterate over data', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(260, 138, 'Conditions that check for equality', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(261, 140, 'function', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(262, 140, 'def', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(263, 140, 'method', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(264, 140, 'var', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(265, 142, 'Parameters and values', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(266, 142, 'Variables and objects', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(267, 142, 'Classes and objects', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(268, 142, 'Loops and conditions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(269, 145, 'Click', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(270, 145, 'Variable', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(271, 145, 'Function', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(272, 145, 'Condition', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(273, 147, 'onclick', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(274, 147, 'onmouseover', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(275, 147, 'onload', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(276, 147, 'onkeydown', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(277, 149, 'addEventListener', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(278, 149, 'setEventHandler', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(279, 149, 'onEvent', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(280, 149, 'attachEvent', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(281, 152, 'Arrow functions', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(282, 152, 'var', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(283, 152, 'function', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(284, 152, 'document.write', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(285, 154, 'const', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(286, 154, 'let', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(287, 154, 'var', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(288, 154, 'new', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(289, 156, 'Concise syntax for function expressions', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(290, 156, 'Object creation', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(291, 156, 'Class inheritance', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(292, 156, 'Error handling', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(293, 158, 'Promises', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(294, 158, 'Loops', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(295, 158, 'Variables', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(296, 158, 'Objects', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(297, 160, 'async/await', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(298, 160, 'Promises', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(299, 160, 'Callbacks', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(300, 160, 'Arrow functions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(301, 162, 'Eventual completion or failure of an asynchronous operation', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(302, 162, 'A resolved function', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(303, 162, 'A delayed loop', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(304, 162, 'A callback', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(305, 164, 'A function that retains access to its outer scope', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(306, 164, 'A global variable', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(307, 164, 'A loop that executes multiple times', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(308, 164, 'A function that only works inside loops', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(309, 166, 'Function scope and block scope', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(310, 166, 'Global scope and local scope', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(311, 166, 'Loop scope and function scope', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(312, 166, 'Object scope and array scope', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(313, 168, 'let and const', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(314, 168, 'var and const', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(315, 168, 'function and var', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(316, 168, 'if and else', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(317, 170, 'Prototypes', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(318, 170, 'Classes', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(319, 170, 'Functions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(320, 170, 'Variables', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(321, 172, 'Inheritance of properties and methods', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(322, 172, 'Execution of functions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(323, 172, 'Creation of new variables', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(324, 172, 'Definition of loops', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(325, 174, 'A prototype', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(326, 174, 'A function', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(327, 174, 'A class', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(328, 174, 'An array', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(329, 176, 'Reusable solutions to common problems in software design', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(330, 176, 'JavaScript functions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(331, 176, 'Variable declarations', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(332, 176, 'Programming languages', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(333, 178, 'Restricts the instantiation of a class to one object', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(334, 178, 'Creates multiple instances of a class', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(335, 178, 'Defines a function', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(336, 178, 'Declares a variable', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(337, 180, 'Observer pattern', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(338, 180, 'Singleton pattern', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(339, 180, 'Factory pattern', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(340, 180, 'Decorator pattern', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(341, 182, 'To ensure code quality and reliability', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(342, 182, 'To create new variables', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(343, 182, 'To define functions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(344, 182, 'To style web pages', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(345, 184, 'Testing individual units or components of code', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(346, 184, 'Testing the entire application', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(347, 184, 'Testing the user interface', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(348, 184, 'Testing database connections', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(349, 186, 'Ensuring different components work together as expected', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(350, 186, 'Testing individual units of code', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(351, 186, 'Testing user interactions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(352, 186, 'Testing database queries', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(353, 188, 'To make web pages look good on all devices', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(354, 188, 'To create mobile apps', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(355, 188, 'To improve server performance', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(356, 188, 'To optimize images', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(357, 190, 'Server-side scripting', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(358, 190, 'Flexible grids', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(359, 190, 'Fluid images', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(360, 190, 'Media queries', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(361, 192, 'To apply styles based on device characteristics', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(362, 192, 'To optimize page loading speed', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(363, 192, 'To enhance server communication', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(364, 192, 'To create animations', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(365, 194, 'Allows elements to resize proportionally based on screen size', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(366, 194, 'Creates fixed-width layouts', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(367, 194, 'Centers content vertically', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(368, 194, 'Aligns text to the left', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(369, 196, 'Percentages', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(370, 196, 'Pixels', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(371, 196, 'Em units', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(372, 196, 'Points', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(373, 198, 'To divide the page into rows and columns for layout design', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(374, 198, 'To style text elements', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(375, 198, 'To manage image resolution', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(376, 198, 'To enhance SEO', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(377, 200, 'Aligning and distributing space within a container', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(378, 200, 'Creating animations', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(379, 200, 'Adding color to elements', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(380, 200, 'Optimizing images', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(381, 202, 'The direction in which flex items are placed', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(382, 202, 'The alignment of text', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(383, 202, 'The size of images', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(384, 202, 'The color of backgrounds', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(385, 204, 'Aligns flex items along the main axis', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(386, 204, 'Sets the font size', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(387, 204, 'Changes the background color', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(388, 204, 'Adds padding to elements', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(389, 206, 'Creating complex web layouts', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(390, 206, 'Styling text', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(391, 206, 'Handling events', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(392, 206, 'Optimizing images', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(393, 208, 'Defines the columns of the grid', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(394, 208, 'Sets the row height', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(395, 208, 'Adjusts the font size', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(396, 208, 'Applies a background image', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(397, 210, 'To set the spacing between grid items', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(398, 210, 'To align text', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(399, 210, 'To apply padding', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(400, 210, 'To set the font color', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(401, 212, 'Images that resize automatically to fit their container', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(402, 212, 'Images with fixed dimensions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(403, 212, 'Images that only work on desktops', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(404, 212, 'Images that change color', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(405, 214, 'max-width', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(406, 214, 'height', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(407, 214, 'min-width', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(408, 214, 'width', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(409, 216, 'To provide different image sources based on screen size', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(410, 216, 'To set the image’s background color', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(411, 216, 'To align text', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(412, 216, 'To add a border around images', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(413, 218, 'To control the layout on mobile browsers', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(414, 218, 'To set the background color', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(415, 218, 'To optimize page speed', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(416, 218, 'To add text shadows', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(417, 220, 'width and initial-scale', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(418, 220, 'height and min-width', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(419, 220, 'font-size and color', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(420, 220, 'padding and margin', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(421, 222, 'To create a responsive layout that adapts to different screen sizes', 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(422, 222, 'To set fixed dimensions', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(423, 222, 'To add animations', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(424, 222, 'To manage server requests', 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sets`
--

CREATE TABLE `sets` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sets`
--

INSERT INTO `sets` (`id`, `name`, `course_id`, `order`, `created_at`, `updated_at`) VALUES
(1, 'HTML Basics', 1, 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(2, 'CSS Fundamentals', 1, 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(3, 'JavaScript Basics', 1, 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(4, 'HTML Basics', 2, 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(5, 'CSS Basics', 2, 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(6, 'JavaScript Basics', 2, 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(7, 'Modern JavaScript Essentials', 3, 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(8, 'Advanced JavaScript Concepts', 3, 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(9, 'JavaScript in Practice', 3, 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(10, 'Responsive Design Workshop', 4, 0, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(11, 'Advanced CSS Techniques', 4, 1, '2024-08-21 09:25:54', '2024-08-21 09:25:54'),
(12, 'Responsive Design Techniques', 4, 2, '2024-08-21 09:25:54', '2024-08-21 09:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john.doe', '$2y$12$LPJ1fSgXLPLpaSq.yUmRbeyaFVZ9F7ePuPRyNUXbbcxjLvvYZT/ti', NULL, '2024-08-21 09:25:53', '2024-08-21 09:25:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `administrators_username_unique` (`username`);

--
-- Indexes for table `completed_lessons`
--
ALTER TABLE `completed_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `completed_lessons_user_id_foreign` (`user_id`),
  ADD KEY `completed_lessons_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courses_slug_unique` (`slug`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_user_id_foreign` (`user_id`),
  ADD KEY `enrollments_course_id_foreign` (`course_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_set_id_foreign` (`set_id`);

--
-- Indexes for table `lesson_contents`
--
ALTER TABLE `lesson_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_contents_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_lesson_content_id_foreign` (`lesson_content_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sets_course_id_foreign` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `completed_lessons`
--
ALTER TABLE `completed_lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `lesson_contents`
--
ALTER TABLE `lesson_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sets`
--
ALTER TABLE `sets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `completed_lessons`
--
ALTER TABLE `completed_lessons`
  ADD CONSTRAINT `completed_lessons_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `completed_lessons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `sets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lesson_contents`
--
ALTER TABLE `lesson_contents`
  ADD CONSTRAINT `lesson_contents_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_lesson_content_id_foreign` FOREIGN KEY (`lesson_content_id`) REFERENCES `lesson_contents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sets`
--
ALTER TABLE `sets`
  ADD CONSTRAINT `sets_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
