ALTER TABLE `posts` 
ADD COLUMN `premium_content` TEXT NULL AFTER `is_premium`;

ALTER TABLE `companies` 
ADD COLUMN `header_bg_image` VARCHAR(255) NULL AFTER `favicon`;

CREATE TABLE `post_cates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
