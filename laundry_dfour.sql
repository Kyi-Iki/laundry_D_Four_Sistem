-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jun 2026 pada 03.21
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry_dfour`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `registered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `name`, `phone`, `address`, `registered_at`, `created_at`) VALUES
(7, 7, 'Admin D\'four', '081111111111', 'Jl. Test no 1', NULL, '2026-01-16 11:53:26'),
(11, NULL, 'rofiq', '081234567777', NULL, '2026-01-18 15:23:34', '2026-01-18 15:23:34'),
(12, NULL, 'Rofiq', '0895337252896', 'padang', NULL, '2026-01-18 15:59:04'),
(13, 14, 'wiwiiw', '0895337252897', 'padang', '2026-01-18 16:08:32', '2026-01-18 16:04:52'),
(14, 15, 'Jilan', '0812345678910', NULL, '2026-04-15 16:04:04', '2026-04-15 16:04:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expires_at`, `used_at`, `created_at`) VALUES
(1, 'rofiqislamy88@gmail.com', '633777e0237b0e21d7591f1ee9c2077eaac9b3efa6f908146028e260c5dcc556', '2026-01-18 10:19:44', NULL, '2026-01-18 15:19:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_types`
--

CREATE TABLE `service_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(10) NOT NULL COMMENT 'kg atau pcs',
  `price_per_unit` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `service_types`
--

INSERT INTO `service_types` (`id`, `name`, `unit`, `price_per_unit`, `description`, `is_active`, `created_at`) VALUES
(1, 'Cuci Kering', 'kg', 5000.00, 'Cuci + setrika (per kilogram)', 1, '2025-12-17 14:12:18'),
(2, 'Cuci Setrika', 'kg', 7000.00, 'Cuci + setrika + lipat (per kilogram)', 1, '2025-12-17 14:12:18'),
(3, 'Setrika Saja', 'kg', 4000.00, 'Hanya setrika (per kilogram)', 1, '2025-12-17 14:12:18'),
(4, 'Bed Cover Single', 'pcs', 15000.00, 'Cuci bed cover ukuran single', 1, '2025-12-17 14:12:18'),
(5, 'Bed Cover Double', 'pcs', 25000.00, 'Cuci bed cover ukuran double', 1, '2025-12-17 14:12:18'),
(6, 'Selimut', 'pcs', 20000.00, 'Cuci selimut', 1, '2025-12-17 14:12:18'),
(7, 'Boneka Kecil', 'pcs', 10000.00, 'Cuci boneka ukuran kecil', 1, '2025-12-17 14:12:18'),
(8, 'Boneka Besar', 'pcs', 25000.00, 'Cuci boneka ukuran besar', 1, '2025-12-17 14:12:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `weight` decimal(10,2) DEFAULT 0.00,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `status` enum('pending','washing','drying','ironing','done','picked_up','cancelled') DEFAULT 'pending',
  `payment_status` enum('unpaid','pending','paid') DEFAULT 'unpaid',
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `estimated_done` timestamp NULL DEFAULT NULL,
  `picked_up_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `customer_id`, `service_type`, `weight`, `quantity`, `price`, `status`, `payment_status`, `payment_method`, `payment_method_id`, `notes`, `estimated_done`, `picked_up_at`, `created_at`, `updated_at`) VALUES
(5, 11, 'Bed Cover Double', 5.00, 5, 125000.00, 'pending', 'unpaid', NULL, NULL, '', NULL, NULL, '2026-01-18 23:04:40', '2026-01-18 23:04:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `profile_picture` text DEFAULT NULL,
  `role` enum('superadmin','admin','cashier','user') DEFAULT 'user',
  `login_method` enum('email','google') DEFAULT 'email',
  `is_active` tinyint(1) DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_token` varchar(64) DEFAULT NULL,
  `verification_expires` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `google_id`, `email`, `name`, `phone`, `password_hash`, `profile_picture`, `role`, `login_method`, `is_active`, `email_verified_at`, `verification_token`, `verification_expires`, `created_at`, `last_login`) VALUES
(7, NULL, 'admin@dfour.com', 'Admin D\'four', '081111111111', '$2y$10$Oz9RvHg1Olical.vqfRD8uKyyR22tyqodmGHEgfPYI8K7Bq8Jxgoe', NULL, 'admin', 'email', 1, '2026-01-07 08:45:40', NULL, NULL, '2026-01-07 08:45:40', '2026-04-15 16:01:19'),
(14, '115288981473321457299', 'ujanh903@gmail.com', 'Ujanh', '0895337252897', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJ5LNYipZtxYGew4l8mIA-Z3wAVfzoqkzF-ybwQoDlMXxaJ=s96-c', 'user', 'email', 1, NULL, NULL, NULL, '2026-01-18 16:05:17', '2026-01-18 16:08:22'),
(15, NULL, 'jilan@gmail.com', 'Jilan', '0812345678910', '$2y$10$vEpMDQqB0qmvJSaqzX8qt.jm7FNVjDxAws8N/LqB0HAC6Opib779m', NULL, 'user', 'email', 1, NULL, '55c3051f2642bb282af6b9ec70d047ba7d6324e2861df6a6fa0a47253d176c5e', '2026-04-16 11:04:04', '2026-04-15 16:04:04', '2026-04-15 16:04:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `idx_phone` (`phone`),
  ADD KEY `fk_customer_user` (`user_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_email` (`email`);

--
-- Indeks untuk tabel `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idx_is_active` (`is_active`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_customer_id` (`customer_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `google_id` (`google_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `idx_google_id` (`google_id`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_verification_token` (`verification_token`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customer_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
