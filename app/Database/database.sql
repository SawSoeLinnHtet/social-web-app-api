-- -------------------------------------------------------------
-- TablePlus 6.7.0(634)
--
-- https://tableplus.com/
--
-- Database: social_web_app
-- Generation Time: 2025-09-26 12:33:25.1400 AM
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `reactions`;
CREATE TABLE `reactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_24_065921_create_personal_access_tokens_table', 1),
(5, '2025_09_24_184002_create_posts_table', 1),
(6, '2025_09_24_184013_create_comments_table', 1),
(7, '2025_09_24_184018_create_reactions_table', 1);

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'my-app-token', '487ec2d96064e3f5cecb9b5be833403f09da17a295c97a5af0d8d2aab7883d31', '[\"*\"]', '2025-09-25 16:32:09', NULL, '2025-09-25 16:31:05', '2025-09-25 16:32:09'),
(2, 'App\\Models\\User', 1, 'my-app-token', '063fca419dae894f111d2e825ee4855818c11e34652ae9a9ae2d40d5a9c33137', '[\"*\"]', '2025-09-25 16:48:03', NULL, '2025-09-25 16:36:02', '2025-09-25 16:48:03');

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `content_image`, `created_at`, `updated_at`) VALUES
(1, 8, 'Velit ut et quia dolore.', 'Necessitatibus voluptatibus laboriosam debitis esse quia rem. Provident provident porro iure quas facere eligendi. Ipsa aspernatur dolorem eos delectus debitis itaque dicta. Ducimus sunt non est illo est nulla. Iusto nihil ducimus non incidunt. Assumenda quia similique unde minus pariatur. Facilis aut est qui et quia et et.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(2, 10, 'Neque recusandae in ut.', 'Impedit amet perspiciatis voluptas. Adipisci est voluptas dicta dolorem repellendus eos ut. Ut voluptate sed mollitia. Aut ut earum enim. Quisquam ut voluptatum expedita deserunt doloremque dolore. Quos aspernatur eum hic. Ut nam quo minus numquam in facilis provident. Rem et magni perferendis ut quod. Omnis vel nisi quia illo iusto repudiandae. Laborum deleniti aperiam minima recusandae provident non numquam. Quia dolore illo vel. Accusamus quis ut reprehenderit eum.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(3, 5, 'Rerum quibusdam possimus blanditiis dicta eveniet.', 'Exercitationem vitae qui est voluptas accusamus omnis. Quia sit unde dolores officiis eum recusandae. Animi autem et quia quidem. Deserunt non qui quia quia alias. Nostrum eos placeat eos et. Explicabo non odit aut quisquam et magni nihil ad. Voluptatem velit ex veniam vitae consectetur velit adipisci. A delectus itaque et quas. Commodi quia voluptatum temporibus libero quas fugiat facilis. Optio sit tempora et veniam voluptatum qui. Veritatis voluptas blanditiis non et. Et ipsum veritatis distinctio at. Saepe veritatis libero est hic voluptatum. Earum porro veniam sapiente atque incidunt nisi. Placeat numquam libero mollitia.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(4, 8, 'Qui exercitationem ratione voluptatibus amet nostrum.', 'Magnam qui itaque aut officia numquam. A dolorem ut et aut excepturi voluptas. Repudiandae dolore est ullam deleniti. Non odit reprehenderit fugit laborum vel exercitationem. Ad animi est cupiditate aut et aut. Aut voluptatem quia labore libero accusamus molestiae. Eum porro impedit est sequi hic minima qui. Minus vel accusamus rerum. Quod modi sit consequatur magni. Deleniti laudantium soluta eaque odit non. Sed ut voluptas et laboriosam impedit iusto placeat cumque. Incidunt est sunt cumque sint eum omnis. Necessitatibus et omnis consequatur autem et. Nam laboriosam autem omnis id qui.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(5, 11, 'Minus odio optio ab at dolor tempora.', 'Corporis eum eos voluptas perspiciatis et reprehenderit. Molestias adipisci illo at sequi aspernatur. Laudantium hic harum sit commodi qui repellat. In beatae numquam dolorum eos est cum iste. Rem numquam eos velit reprehenderit ipsa. Aperiam consectetur alias nulla eos nesciunt. Modi maiores deserunt qui veniam. Ullam adipisci libero quis expedita explicabo. Possimus qui doloribus quia sed. Neque quis voluptas quos. Quas sint dolores dolorum dolores in dolorem tenetur. Est voluptatibus laboriosam et voluptas maxime amet aliquam. Et consectetur possimus excepturi in. Similique consequatur suscipit nisi.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(6, 5, 'Et autem non quo quis inventore.', 'Accusantium eos esse vero aut. Consequatur debitis quia magni. Est quia vitae dolor quia est. Ducimus ut minus vitae nihil aut sapiente. Inventore quaerat cumque qui in. Omnis consequatur repudiandae repellat tempora. Recusandae blanditiis consequatur sed ea error. Eveniet accusamus ratione id facere fuga. Ut ut quia et. Qui minima incidunt voluptatum rerum nihil. Dolor sit eum ut nemo. Exercitationem similique quia veniam rerum perspiciatis doloremque temporibus. Nulla dicta deleniti hic.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(7, 2, 'Occaecati cupiditate ex laborum.', 'Aspernatur quia voluptas laudantium amet quidem fugiat. Alias non dolores ratione optio est. Beatae blanditiis sapiente maxime dolorem sit dolorum voluptatem. Ut labore temporibus ut molestias pariatur. Qui autem quos quo iste et. Vel quidem illum sed possimus soluta. Eos voluptatem atque dolor temporibus. Blanditiis corrupti provident accusantium et non. Est id in ratione vel vel. Enim et sint illum ea et explicabo qui. A a impedit fuga nisi non ut.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(8, 10, 'Animi dolorum et a sit non distinctio.', 'Ut culpa consequatur fugiat aliquid tenetur maxime veniam a. Omnis quia ut ullam laborum molestiae error. Sunt dolores voluptatibus perspiciatis dolorem. Non voluptatibus incidunt reprehenderit consequatur repudiandae nihil quo. Architecto esse saepe minima quasi voluptatem ducimus consequatur et. Id quos voluptate maxime tempora aliquam aut sed nobis. Occaecati reprehenderit quos eum nulla. Vel soluta amet perspiciatis sequi. Velit natus eveniet sapiente illum repellat voluptatum fugit adipisci. In omnis molestias magni vitae voluptates. Porro vel explicabo id cumque accusamus. Aut velit pariatur in est perspiciatis quis.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(9, 10, 'Magni accusamus error architecto nihil.', 'Modi corrupti possimus perferendis aut earum quis earum. Voluptas voluptate nemo voluptatum minima magnam consequatur. Recusandae est libero facilis non ad ut. Nobis minus et laudantium suscipit suscipit quasi. Qui iure ea quod et quia dolorem laborum. Dolorem distinctio non et qui. Aut omnis laboriosam rerum. Qui vitae recusandae sapiente aut ut quos sed at. Assumenda ex est aliquam vel minima adipisci deleniti eos. Sed impedit fuga ipsa nihil at et. Et officia eligendi quisquam nesciunt temporibus. Officia et quaerat laborum voluptatem aut. Pariatur rerum quis nesciunt exercitationem velit rerum consequatur.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(10, 10, 'Magnam aperiam tempore quisquam vitae.', 'Perferendis nisi aut et esse itaque omnis. Vel laudantium itaque distinctio exercitationem quae rerum. Expedita nihil et eum. Doloremque id voluptatibus iure minus ratione vel. Ab non quas sed temporibus. Atque hic delectus molestiae iure aut. Maiores sit aperiam commodi facilis commodi fugit explicabo ut. Quod magnam voluptatum corporis fuga. Suscipit culpa unde esse corporis vel placeat consequatur. Minus modi iste et iure itaque. Incidunt aut et alias. Voluptatem quo beatae quam nesciunt quibusdam esse nesciunt. Iste minus quia quibusdam reprehenderit tenetur sequi. Rerum et dolores non voluptatem quas.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(11, 3, 'Ab quo rerum est laudantium illum.', 'Autem nisi blanditiis aliquid. Repellat ea ut voluptates id. Et explicabo perferendis et saepe. Eos et accusantium expedita possimus odio. Fuga voluptatem architecto quaerat rem qui voluptatem qui. Temporibus aut dolor quae aut aut qui tempora. Sed sapiente magni voluptates repudiandae modi voluptatem. Ut molestiae nihil eum dolore qui. Tenetur dolores qui officiis illo cum. Eveniet ut consectetur qui sint quia quo officiis. Esse consequatur pariatur ut nulla. Possimus iste sapiente ut consequuntur amet qui. Rerum libero odit rem ducimus deserunt. Eveniet perspiciatis officiis voluptatibus saepe voluptatem. Aliquam voluptatem consequatur aperiam a ut eaque.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(12, 6, 'Quo vitae aut dignissimos est.', 'Qui enim voluptatem non modi atque repudiandae. Magni placeat ut sed eius cum laudantium. Similique occaecati et voluptatem voluptatum ad est facere. Incidunt laborum ratione blanditiis eius. Sed atque ut voluptatibus aperiam officia placeat praesentium. Illo ab laboriosam temporibus et. Quisquam id aut ab eos. Quo aut vel aut in hic quaerat nisi. A aut et repellat voluptatem dolor. Rem quae magnam minus qui recusandae non enim. Aut tempora ipsam placeat magni omnis aliquam et. Ut ut eaque autem et alias tempora. Architecto quis et nulla qui odit facilis est. Quidem sapiente et ut voluptas tempore non.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(13, 2, 'Veniam nihil eius expedita dolorum quo.', 'Porro velit sint itaque. Enim rerum maxime corporis dolorem voluptate aut. Eius aut harum earum aliquid necessitatibus illo eveniet. Ea id accusantium commodi veritatis. Sed molestias totam quam tempore explicabo consequuntur quos. Modi rem tempore et a autem tempora labore voluptas. Incidunt non autem rerum et. Doloremque eaque architecto est aperiam ut.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(14, 11, 'Autem blanditiis nihil eligendi et sunt itaque.', 'Ratione eos doloremque quo recusandae. Quae sit qui eum. Ducimus ipsa et aliquid aliquam accusantium. Sit impedit animi voluptates magni maiores animi consequatur. Molestiae debitis rerum nulla vel vitae. Et veniam et autem dolores officia tempore vero. Provident rem qui itaque aut. Totam ut sunt voluptatem molestiae.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(15, 9, 'Quo porro doloremque ad aliquam distinctio eum.', 'Voluptate quibusdam minima dolores saepe. Odit enim culpa ad dolorem. Eius dolor autem praesentium occaecati numquam velit et. Similique consequuntur est rerum aut. Similique dolor aliquid sunt ut qui. Nulla ut nemo ut quisquam molestiae molestiae. Dignissimos omnis placeat omnis quae eum. Eos sed enim et qui nihil velit. Officia odio repellendus dolores labore voluptatem. Animi delectus corporis sit modi corporis. Autem ipsam voluptas ut. Sunt rerum inventore quia voluptas.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(16, 2, 'Sunt hic molestias voluptate impedit.', 'Qui id corporis eum est voluptas architecto. Ipsa aliquam quia quod non est vel voluptatem omnis. Nemo sit ut in ut. Odio amet velit dolores officiis a consequatur. Dolor culpa saepe aut pariatur nesciunt. Dicta dolor omnis numquam occaecati quod facilis necessitatibus. Laborum ipsa ut aspernatur non qui eum. In voluptatem sit et alias voluptate doloremque. Neque doloribus consequatur veniam delectus quam omnis.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(17, 3, 'Veniam minima neque dolores quaerat.', 'Quia tempore porro quae deserunt amet. Consectetur dolores veritatis debitis et fuga expedita in. Sequi perspiciatis quo aperiam illum nisi enim aliquam. Commodi dolores repellendus quidem sunt dolorem. Eum sunt atque et aliquam eligendi suscipit dolorem voluptatem. A reprehenderit laudantium qui temporibus tempora quis. Ea in recusandae corrupti consequuntur nihil aperiam rerum. Quam minus aut animi qui facere. Libero quis modi aut dolores soluta. Ea consequatur fuga id blanditiis vero qui sed ut. In facilis quis sit inventore. Consequatur dignissimos consequatur nam est neque.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(18, 8, 'Atque quae iusto rerum neque occaecati ea possimus.', 'Ut beatae aspernatur ducimus consequatur. Sit quisquam autem minima dicta. Rem totam corrupti voluptas consequatur magni quidem vero mollitia. Laborum vitae excepturi soluta dolor nihil a. Neque et est maxime quia autem. Rerum saepe dicta in alias numquam consectetur. Ea explicabo accusantium autem atque esse. Excepturi nesciunt ea nulla est. Accusamus omnis aut eum aut voluptatem. Odio ad impedit minima vel maiores. Quia sapiente dicta eius quos. Ducimus alias repudiandae dolores sint distinctio. Ut doloremque fugit illo cum maxime.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(19, 6, 'Maiores veritatis possimus ut commodi delectus qui vitae.', 'Nulla natus qui ipsam itaque consequatur qui. Odio qui perferendis et laborum et quia voluptatem molestiae. Debitis perferendis facilis quia nihil eveniet quo. Dicta iure qui eos aut nobis facere. Facere magnam itaque natus. Voluptas aut velit voluptatem totam minus. Temporibus assumenda cum expedita sit. Laboriosam necessitatibus similique qui eligendi quam. Debitis doloremque qui quasi qui consequatur dolore impedit. Quod quia omnis aut.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(20, 5, 'Non doloremque omnis rerum nam qui.', 'Sunt iure neque voluptatem placeat non harum rerum. Delectus temporibus voluptas velit est. Voluptatum non debitis minima voluptates repellendus est. Eius perferendis ducimus voluptas non sunt. Eius cumque quo eveniet repudiandae velit et. Vitae amet error ab placeat in consequatur perspiciatis. Facilis molestiae corporis mollitia quaerat sapiente qui nam dolorum. Quibusdam aliquam iusto est maxime veritatis velit et. In non quidem fuga aut a omnis ea. Expedita inventore eaque mollitia culpa. Nobis voluptas consequatur eum consequatur hic debitis.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(21, 1, 'Hee', 'Hee', NULL, '2025-09-25 16:44:05', '2025-09-25 16:44:05');

INSERT INTO `reactions` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(6, 1, 2, '2025-09-25 16:41:39', '2025-09-25 16:41:39'),
(8, 1, 1, '2025-09-25 16:43:57', '2025-09-25 16:43:57');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo User', 'demo@example.com', NULL, '$2y$12$FjrULuRJ5My27dZl6YrxqeDoXrQKIytlct0uU32pmXXBNb6elX1ne', NULL, '2025-09-25 16:29:42', '2025-09-25 16:29:42'),
(2, 'User 1', 'user1@example.com', NULL, '$2y$12$DUdj10UFBoSaAaYPn90of.EjYgO/uDctNipDXMtF6jRVqnEDx44DW', NULL, '2025-09-25 16:29:42', '2025-09-25 16:29:42'),
(3, 'User 2', 'user2@example.com', NULL, '$2y$12$8GMWFfUiWIS.ExFKRDiSv.xaBYb086dLNE8eZoniNTt5VGa4nYULW', NULL, '2025-09-25 16:29:42', '2025-09-25 16:29:42'),
(4, 'User 3', 'user3@example.com', NULL, '$2y$12$gX3CgjGqFKwxHL9BbSGiyeI4fB.jj8DuhB26hVJFvVcz2hJwKkoH2', NULL, '2025-09-25 16:29:42', '2025-09-25 16:29:42'),
(5, 'User 4', 'user4@example.com', NULL, '$2y$12$tX7SlLUYGIvQjPIR0OKPaORcCHEdad4iHoBg4wrt7AIQAiWnKHNXC', NULL, '2025-09-25 16:29:43', '2025-09-25 16:29:43'),
(6, 'User 5', 'user5@example.com', NULL, '$2y$12$hpi1jk9BFxi.yRPQ4ITrlekp1CxWVsnvDv4PZ5MtP8ARI.BxxpvVq', NULL, '2025-09-25 16:29:43', '2025-09-25 16:29:43'),
(7, 'User 6', 'user6@example.com', NULL, '$2y$12$yROfOvtfQnG5N6DA3D9/VubfwZChcvqHGZg45jpXjevAjy.kirjAS', NULL, '2025-09-25 16:29:43', '2025-09-25 16:29:43'),
(8, 'User 7', 'user7@example.com', NULL, '$2y$12$JXXin92bLyeDfZK2jhkhHeRdNNQfsl9Lf3a9BaE5HUvp1k0V/tvA6', NULL, '2025-09-25 16:29:43', '2025-09-25 16:29:43'),
(9, 'User 8', 'user8@example.com', NULL, '$2y$12$V/sEq04Qaunk.UIFwY.C9.OMLD7lnu5Q.E.rJ3RtOSVujH8cg2ZT.', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(10, 'User 9', 'user9@example.com', NULL, '$2y$12$Iq6H7o6FoYcMW25.mAZ08udLikbLl0XZVTQU/I8sapVZpXzBJDoqS', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44'),
(11, 'User 10', 'user10@example.com', NULL, '$2y$12$mVDd1iTvuIap5p5GBiWkd.QC7jYjSK8gvxHrE2zK2KcrrPkQjYncy', NULL, '2025-09-25 16:29:44', '2025-09-25 16:29:44');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;