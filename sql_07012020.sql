ALTER TABLE `posts` 
ADD COLUMN `premium_content` TEXT NULL AFTER `is_premium`;

ALTER TABLE `companies` 
ADD COLUMN `header_bg_image` VARCHAR(255) NULL AFTER `favicon`;
