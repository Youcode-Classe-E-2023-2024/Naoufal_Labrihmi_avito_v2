SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `annoncer` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `is_admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `annoncer` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `avatar`, `is_admin`) VALUES
(1, 'don', 'jhon', 'don', 'don@gmail.com', '$2y$10$Vc4tD2450ADh0QN0qnz4.eQMh8KaBo3tGcAFgKc.BbFGTGCUrKCSS', '1701034070avatar2.jpg', 1),
(12, 'naoufal', 'lb', 'nlb', 'nlb@gmail.com', '$2y$10$J21C5atMbk/EoLNuNNHQE.nHdbsIEYF/mlMURf/wzVkoIvKXSLp9i', '1701211827avatar11.jpg', 1);


CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `categories` (`id`, `title`, `description`) VALUES
(5, 'tv', 'tv'),
(6, 'art', 'gbfv');



CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `price` int(100) NOT NULL,
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `aut_id` int(11) UNSIGNED NOT NULL,
  `is_featured` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `posts` (`id`, `title`, `body`, `thumbnail`, `price`, `category_id`, `aut_id`, `is_featured`) VALUES
(8, 'zd', 'defr', 'Array', 22, 5, 12, 1);


ALTER TABLE `annoncer`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_annonce_category` (`category_id`),
  ADD KEY `FK_annonce_aut` (`aut_id`);


ALTER TABLE `annoncer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE `posts`
  ADD CONSTRAINT `FK_annonce_aut` FOREIGN KEY (`aut_id`) REFERENCES `annoncer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_annonce_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

