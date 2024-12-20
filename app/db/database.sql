-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 14, 2024 at 12:53 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peng_emperor`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories_table`
--

CREATE TABLE `categories_table` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `status` tinyint DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT (now()),
  `updatedAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments_table`
--

CREATE TABLE `comments_table` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `content` text,
  `mediaType` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT (now()),
  `updatedAt` timestamp NULL DEFAULT (now()),
  `mediaUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_likes_table`
--

CREATE TABLE `comment_likes_table` (
  `id` int NOT NULL,
  `commentId` int NOT NULL,
  `userId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_replies_table`
--

CREATE TABLE `comment_replies_table` (
  `id` int NOT NULL,
  `commentId` int NOT NULL,
  `replyId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events_table`
--

CREATE TABLE `events_table` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `bannerUrl` varchar(255) DEFAULT NULL,
  `content` text,
  `status` tinyint DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT (now()),
  `updatedAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_follows_table`
--

CREATE TABLE `event_follows_table` (
  `id` int NOT NULL,
  `eventId` int NOT NULL,
  `userId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups_table`
--

CREATE TABLE `groups_table` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `bannerUrl` varchar(255) DEFAULT NULL,
  `bio` text,
  `status` tinyint DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT (now()),
  `updatedAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_members_table`
--

CREATE TABLE `group_members_table` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_type_table`
--

CREATE TABLE `media_type_table` (
  `id` tinyint UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `description` text,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages_table`
--

CREATE TABLE `messages_table` (
  `id` int NOT NULL,
  `senderId` int NOT NULL,
  `roomId` int NOT NULL,
  `content` text,
  `status` tinyint DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT (now()),
  `updatedAt` timestamp NULL DEFAULT (now()),
  `mediaType` tinyint DEFAULT NULL,
  `mediaUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_rooms_table`
--

CREATE TABLE `message_rooms_table` (
  `id` int NOT NULL,
  `user1` int NOT NULL,
  `user2` int NOT NULL,
  `status` tinyint DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT (now()),
  `updatedAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions_table`
--

CREATE TABLE `permissions_table` (
  `id` tinyint UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `description` text,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts_table`
--

CREATE TABLE `posts_table` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `mediaType` tinyint DEFAULT NULL,
  `mediaUrl` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT (now()),
  `updatedAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories_table`
--

CREATE TABLE `post_categories_table` (
  `id` int NOT NULL,
  `postId` int NOT NULL,
  `categoryId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_comments_table`
--

CREATE TABLE `post_comments_table` (
  `id` int NOT NULL,
  `postId` int NOT NULL,
  `commentsId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_likes_table`
--

CREATE TABLE `post_likes_table` (
  `id` int NOT NULL,
  `postId` int NOT NULL,
  `userId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles_table`
--

CREATE TABLE `roles_table` (
  `id` tinyint UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `description` text,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles_table`
--

INSERT INTO `roles_table` (`id`, `key`, `description`, `createdAt`) VALUES
(1, 'admin', NULL, '2024-11-06 09:23:29'),
(2, 'user', NULL, '2024-11-06 09:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions_table`
--

CREATE TABLE `role_permissions_table` (
  `id` int NOT NULL,
  `roleId` tinyint UNSIGNED NOT NULL,
  `permissionId` tinyint UNSIGNED NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_table`
--

CREATE TABLE `status_table` (
  `id` tinyint UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `description` text,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `status_table`
--

INSERT INTO `status_table` (`id`, `key`, `description`, `createdAt`) VALUES
(1, 'onDeleted', NULL, '2024-11-06 09:24:33'),
(3, 'onPublished', NULL, '2024-11-06 09:29:24'),
(4, 'onPrivated', NULL, '2024-11-06 09:29:39'),
(5, 'onProtected', NULL, '2024-11-06 09:29:56');

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `id` int NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatarUrl` varchar(255) DEFAULT NULL,
  `role` tinyint DEFAULT '2',
  `verifyEmailAt` timestamp NULL DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT (now()),
  `updatedAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`id`, `userName`, `password`, `fullName`, `email`, `avatarUrl`, `role`, `verifyEmailAt`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'locshino', '@Locshino123', 'locshino', 'locshino123@gmail.com', NULL, 2, NULL, 1, '2024-11-11 12:18:29', '2024-11-11 12:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_follows_table`
--

CREATE TABLE `user_follows_table` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `followerId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_friendship_table`
--

CREATE TABLE `user_friendship_table` (
  `id` int NOT NULL,
  `userId1` int NOT NULL,
  `userId2` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions_table`
--

CREATE TABLE `user_permissions_table` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `permissionId` tinyint UNSIGNED NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles_table`
--

CREATE TABLE `user_profiles_table` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `bannerUrl` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `socialAccounts` text,
  `bio` text,
  `status` tinyint DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT (now()),
  `updatedAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_wishlist`
--

CREATE TABLE `user_wishlist` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `categoryId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT (now())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__drizzle_migrations`
--

CREATE TABLE `__drizzle_migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `hash` text NOT NULL,
  `created_at` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `__drizzle_migrations`
--

INSERT INTO `__drizzle_migrations` (`id`, `hash`, `created_at`) VALUES
(1, '704034c9665f6e19c9f3cc7ed8c7c5506f65d964e07f1521903fa293084f253e', 1730544835539),
(2, 'f890aa75b717764ef100c749d1284e0de2ebc77333fa6b31ba4ad7c9b85357c3', 1731232072242),
(3, '817528baf7490ae68c63bd9dae8b9ac7f733b66e7b2ba51f4d83cde60df173de', 1731233459251),
(4, '7635ef914920f7255eb45534941874668ea4d427b4ad953359f3ba4bb3f108c9', 1731545543292);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories_table`
--
ALTER TABLE `categories_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_table_name_unique` (`name`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `comments_table`
--
ALTER TABLE `comments_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_table_userId_users_table_id_fk` (`userId`),
  ADD KEY `mediaType_idx` (`mediaType`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `comment_likes_table`
--
ALTER TABLE `comment_likes_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentId_idx` (`commentId`),
  ADD KEY `userId_idx` (`userId`);

--
-- Indexes for table `comment_replies_table`
--
ALTER TABLE `comment_replies_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentId_idx` (`commentId`),
  ADD KEY `replyId_idx` (`replyId`);

--
-- Indexes for table `events_table`
--
ALTER TABLE `events_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_table_userId_users_table_id_fk` (`userId`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `event_follows_table`
--
ALTER TABLE `event_follows_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventId_idx` (`eventId`),
  ADD KEY `userId_idx` (`userId`);

--
-- Indexes for table `groups_table`
--
ALTER TABLE `groups_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_table_userId_users_table_id_fk` (`userId`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `group_members_table`
--
ALTER TABLE `group_members_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupId_idx` (`groupId`),
  ADD KEY `userId_idx` (`userId`);

--
-- Indexes for table `media_type_table`
--
ALTER TABLE `media_type_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_type_table_key_unique` (`key`);

--
-- Indexes for table `messages_table`
--
ALTER TABLE `messages_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_table_senderId_users_table_id_fk` (`senderId`),
  ADD KEY `roomId_idx` (`roomId`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `message_rooms_table`
--
ALTER TABLE `message_rooms_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_rooms_table_user1_users_table_id_fk` (`user1`),
  ADD KEY `message_rooms_table_user2_users_table_id_fk` (`user2`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `permissions_table`
--
ALTER TABLE `permissions_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_table_key_unique` (`key`);

--
-- Indexes for table `posts_table`
--
ALTER TABLE `posts_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_table_userId_users_table_id_fk` (`userId`),
  ADD KEY `mediaType_idx` (`mediaType`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `post_categories_table`
--
ALTER TABLE `post_categories_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postId_idx` (`postId`),
  ADD KEY `categoryId_idx` (`categoryId`);

--
-- Indexes for table `post_comments_table`
--
ALTER TABLE `post_comments_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postId_idx` (`postId`),
  ADD KEY `commentsId_idx` (`commentsId`);

--
-- Indexes for table `post_likes_table`
--
ALTER TABLE `post_likes_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postId_idx` (`postId`),
  ADD KEY `userId_idx` (`userId`);

--
-- Indexes for table `roles_table`
--
ALTER TABLE `roles_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_table_key_unique` (`key`);

--
-- Indexes for table `role_permissions_table`
--
ALTER TABLE `role_permissions_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleId_idx` (`roleId`),
  ADD KEY `permissionId_idx` (`permissionId`);

--
-- Indexes for table `status_table`
--
ALTER TABLE `status_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_table_key_unique` (`key`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_table_userName_unique` (`userName`),
  ADD UNIQUE KEY `users_table_email_unique` (`email`),
  ADD KEY `role_idx` (`role`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `user_follows_table`
--
ALTER TABLE `user_follows_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId_idx` (`userId`),
  ADD KEY `followerId_idx` (`followerId`);

--
-- Indexes for table `user_friendship_table`
--
ALTER TABLE `user_friendship_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId1_idx` (`userId1`),
  ADD KEY `userId2_idx` (`userId2`);

--
-- Indexes for table `user_permissions_table`
--
ALTER TABLE `user_permissions_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId_idx` (`userId`),
  ADD KEY `permissionId_idx` (`permissionId`);

--
-- Indexes for table `user_profiles_table`
--
ALTER TABLE `user_profiles_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_table_userId_users_table_id_fk` (`userId`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId_idx` (`userId`),
  ADD KEY `categoryId_idx` (`categoryId`);

--
-- Indexes for table `__drizzle_migrations`
--
ALTER TABLE `__drizzle_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories_table`
--
ALTER TABLE `categories_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments_table`
--
ALTER TABLE `comments_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment_likes_table`
--
ALTER TABLE `comment_likes_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment_replies_table`
--
ALTER TABLE `comment_replies_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_table`
--
ALTER TABLE `events_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_follows_table`
--
ALTER TABLE `event_follows_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_table`
--
ALTER TABLE `groups_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members_table`
--
ALTER TABLE `group_members_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_type_table`
--
ALTER TABLE `media_type_table`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages_table`
--
ALTER TABLE `messages_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_rooms_table`
--
ALTER TABLE `message_rooms_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions_table`
--
ALTER TABLE `permissions_table`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_table`
--
ALTER TABLE `posts_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_categories_table`
--
ALTER TABLE `post_categories_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_comments_table`
--
ALTER TABLE `post_comments_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_likes_table`
--
ALTER TABLE `post_likes_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles_table`
--
ALTER TABLE `roles_table`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_permissions_table`
--
ALTER TABLE `role_permissions_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_table`
--
ALTER TABLE `status_table`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_follows_table`
--
ALTER TABLE `user_follows_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_friendship_table`
--
ALTER TABLE `user_friendship_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_permissions_table`
--
ALTER TABLE `user_permissions_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profiles_table`
--
ALTER TABLE `user_profiles_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `__drizzle_migrations`
--
ALTER TABLE `__drizzle_migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments_table`
--
ALTER TABLE `comments_table`
  ADD CONSTRAINT `comments_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `comment_likes_table`
--
ALTER TABLE `comment_likes_table`
  ADD CONSTRAINT `comment_likes_table_commentId_comments_table_id_fk` FOREIGN KEY (`commentId`) REFERENCES `comments_table` (`id`),
  ADD CONSTRAINT `comment_likes_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `comment_replies_table`
--
ALTER TABLE `comment_replies_table`
  ADD CONSTRAINT `comment_replies_table_commentId_comments_table_id_fk` FOREIGN KEY (`commentId`) REFERENCES `comments_table` (`id`),
  ADD CONSTRAINT `comment_replies_table_replyId_comments_table_id_fk` FOREIGN KEY (`replyId`) REFERENCES `comments_table` (`id`);

--
-- Constraints for table `events_table`
--
ALTER TABLE `events_table`
  ADD CONSTRAINT `events_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `event_follows_table`
--
ALTER TABLE `event_follows_table`
  ADD CONSTRAINT `event_follows_table_eventId_events_table_id_fk` FOREIGN KEY (`eventId`) REFERENCES `events_table` (`id`),
  ADD CONSTRAINT `event_follows_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `groups_table`
--
ALTER TABLE `groups_table`
  ADD CONSTRAINT `groups_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `group_members_table`
--
ALTER TABLE `group_members_table`
  ADD CONSTRAINT `group_members_table_groupId_groups_table_id_fk` FOREIGN KEY (`groupId`) REFERENCES `groups_table` (`id`),
  ADD CONSTRAINT `group_members_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `messages_table`
--
ALTER TABLE `messages_table`
  ADD CONSTRAINT `messages_table_roomId_message_rooms_table_id_fk` FOREIGN KEY (`roomId`) REFERENCES `message_rooms_table` (`id`),
  ADD CONSTRAINT `messages_table_senderId_users_table_id_fk` FOREIGN KEY (`senderId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `message_rooms_table`
--
ALTER TABLE `message_rooms_table`
  ADD CONSTRAINT `message_rooms_table_user1_users_table_id_fk` FOREIGN KEY (`user1`) REFERENCES `users_table` (`id`),
  ADD CONSTRAINT `message_rooms_table_user2_users_table_id_fk` FOREIGN KEY (`user2`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `posts_table`
--
ALTER TABLE `posts_table`
  ADD CONSTRAINT `posts_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `post_categories_table`
--
ALTER TABLE `post_categories_table`
  ADD CONSTRAINT `post_categories_table_categoryId_categories_table_id_fk` FOREIGN KEY (`categoryId`) REFERENCES `categories_table` (`id`),
  ADD CONSTRAINT `post_categories_table_postId_posts_table_id_fk` FOREIGN KEY (`postId`) REFERENCES `posts_table` (`id`);

--
-- Constraints for table `post_comments_table`
--
ALTER TABLE `post_comments_table`
  ADD CONSTRAINT `post_comments_table_commentsId_comments_table_id_fk` FOREIGN KEY (`commentsId`) REFERENCES `comments_table` (`id`),
  ADD CONSTRAINT `post_comments_table_postId_posts_table_id_fk` FOREIGN KEY (`postId`) REFERENCES `posts_table` (`id`);

--
-- Constraints for table `post_likes_table`
--
ALTER TABLE `post_likes_table`
  ADD CONSTRAINT `post_likes_table_postId_posts_table_id_fk` FOREIGN KEY (`postId`) REFERENCES `posts_table` (`id`),
  ADD CONSTRAINT `post_likes_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `role_permissions_table`
--
ALTER TABLE `role_permissions_table`
  ADD CONSTRAINT `role_permissions_table_permissionId_permissions_table_id_fk` FOREIGN KEY (`permissionId`) REFERENCES `permissions_table` (`id`),
  ADD CONSTRAINT `role_permissions_table_roleId_roles_table_id_fk` FOREIGN KEY (`roleId`) REFERENCES `roles_table` (`id`);

--
-- Constraints for table `user_follows_table`
--
ALTER TABLE `user_follows_table`
  ADD CONSTRAINT `user_follows_table_followerId_users_table_id_fk` FOREIGN KEY (`followerId`) REFERENCES `users_table` (`id`),
  ADD CONSTRAINT `user_follows_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `user_friendship_table`
--
ALTER TABLE `user_friendship_table`
  ADD CONSTRAINT `user_friendship_table_userId1_users_table_id_fk` FOREIGN KEY (`userId1`) REFERENCES `users_table` (`id`),
  ADD CONSTRAINT `user_friendship_table_userId2_users_table_id_fk` FOREIGN KEY (`userId2`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `user_permissions_table`
--
ALTER TABLE `user_permissions_table`
  ADD CONSTRAINT `user_permissions_table_permissionId_permissions_table_id_fk` FOREIGN KEY (`permissionId`) REFERENCES `permissions_table` (`id`),
  ADD CONSTRAINT `user_permissions_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `user_profiles_table`
--
ALTER TABLE `user_profiles_table`
  ADD CONSTRAINT `user_profiles_table_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);

--
-- Constraints for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  ADD CONSTRAINT `user_wishlist_categoryId_categories_table_id_fk` FOREIGN KEY (`categoryId`) REFERENCES `categories_table` (`id`),
  ADD CONSTRAINT `user_wishlist_userId_users_table_id_fk` FOREIGN KEY (`userId`) REFERENCES `users_table` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
