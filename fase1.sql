-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-02-2025 a las 01:30:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fase1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `date_appointment` timestamp NULL DEFAULT NULL,
  `specialitie_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_schedule_join_hour_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_status_id` bigint(20) UNSIGNED NOT NULL,
  `appointment_status_id` bigint(20) UNSIGNED NOT NULL,
  `date_attention` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment_attentions`
--

CREATE TABLE `appointment_attentions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `receta_medica` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment_pays`
--

CREATE TABLE `appointment_pays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `method_payment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment_statuses`
--

CREATE TABLE `appointment_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'Nombre del estado de la cita, ej: Pendiente, Atendido',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `appointment_statuses`
--

INSERT INTO `appointment_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pendiente', NULL, NULL),
(2, 'Atendido', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `days`
--

CREATE TABLE `days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `days`
--

INSERT INTO `days` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Lunes', NULL, NULL),
(2, 'Martes', NULL, NULL),
(3, 'Miércoles', NULL, NULL),
(4, 'Jueves', NULL, NULL),
(5, 'Viernes', NULL, NULL),
(6, 'Sábado', NULL, NULL),
(7, 'Domingo', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_schedule_days`
--

CREATE TABLE `doctor_schedule_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `day_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_schedule_hours`
--

CREATE TABLE `doctor_schedule_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hour_start` time NOT NULL,
  `hour_end` time NOT NULL,
  `hour` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_schedule_join_hours`
--

CREATE TABLE `doctor_schedule_join_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_schedule_day_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_schedule_hour_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `genders`
--

INSERT INTO `genders` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Masculino', NULL, NULL),
(2, 'Femenino', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `methods_payment`
--

CREATE TABLE `methods_payment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `methods_payment`
--

INSERT INTO `methods_payment` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Efectivo', NULL, NULL),
(2, 'Tarjeta de Crédito', NULL, NULL),
(3, 'Tarjeta de Débito', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(24, '2024_06_07_01_create_genders_table', 1),
(25, '2024_06_07_02_create_specialities_table', 1),
(26, '2024_06_07_03_create_days_table', 1),
(27, '2024_06_07_04_create_methods_payment_table', 1),
(28, '2024_06_07_05_create_relationships_table', 1),
(29, '2024_06_07_06_create_payment_statuses_table', 1),
(30, '2024_06_07_07_create_appointment_statuses_table', 1),
(31, '2024_06_07_08_create_users_table', 1),
(32, '2024_06_07_09_create_patients_table', 1),
(33, '2024_06_07_10_create_doctor_schedule_hours_table', 1),
(34, '2024_06_07_11_create_doctor_schedule_days_table', 1),
(35, '2024_06_07_12_create_doctor_schedule_join_hours_table', 1),
(36, '2024_06_07_13_create_appointments_table', 1),
(37, '2024_06_07_14_create_appointment_attentions_table', 1),
(38, '2024_06_07_15_create_appointment_pays_table', 1),
(39, '2024_06_07_16_create_patient_persons_table', 1),
(40, '2024_06_07_17_create_permissions_table', 1),
(41, '2024_06_07_18_create_roles_table', 1),
(42, '2024_06_07_19_create_role_has_permissions_table', 1),
(43, '2024_06_07_20_create_model_has_permissions_table', 1),
(44, '2024_06_07_21_create_model_has_roles_table', 1),
(45, '2024_06_07_22_create_password_reset_tokens_table', 1),
(46, '2024_06_07_23_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `surname` varchar(250) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `n_document` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `education` varchar(250) DEFAULT NULL,
  `antecedent_family` text DEFAULT NULL,
  `antecedent_personal` text DEFAULT NULL,
  `antecedent_allergic` text DEFAULT NULL,
  `ta` varchar(250) DEFAULT NULL COMMENT 'presion arterial',
  `temperatura` varchar(20) DEFAULT NULL,
  `fc` varchar(50) DEFAULT NULL COMMENT 'frecuencia cardiaca',
  `fr` varchar(50) DEFAULT NULL COMMENT 'frecuencia respiratoria',
  `peso` varchar(25) DEFAULT NULL,
  `current_disease` text DEFAULT NULL COMMENT 'enfermedad actual',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_persons`
--

CREATE TABLE `patient_persons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `name_companion` varchar(250) NOT NULL,
  `surname_companion` varchar(250) NOT NULL,
  `mobile_companion` varchar(250) DEFAULT NULL,
  `relationship_companion_id` bigint(20) UNSIGNED NOT NULL,
  `name_responsible` varchar(250) DEFAULT NULL,
  `surname_responsible` varchar(250) DEFAULT NULL,
  `mobile_responsible` varchar(250) DEFAULT NULL,
  `relationship_responsible_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_statuses`
--

CREATE TABLE `payment_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'Nombre del estado de pago, ej: Pagado, Deuda',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payment_statuses`
--

INSERT INTO `payment_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pagado', NULL, NULL),
(2, 'Deuda', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relationships`
--

CREATE TABLE `relationships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `relationships`
--

INSERT INTO `relationships` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Padre', NULL, NULL),
(2, 'Madre', NULL, NULL),
(3, 'Hermano', NULL, NULL),
(4, 'Hermana', NULL, NULL),
(5, 'Amigo', NULL, NULL),
(6, 'Amiga', NULL, NULL),
(7, 'Novio', NULL, NULL),
(8, 'Novia', NULL, NULL),
(9, 'Tío', NULL, NULL),
(10, 'Tía', NULL, NULL),
(11, 'Abuelo', NULL, NULL),
(12, 'Abuela', NULL, NULL),
(13, 'Primo', NULL, NULL),
(14, 'Prima', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialities`
--

CREATE TABLE `specialities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `specialitie_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `education` longtext DEFAULT NULL,
  `designation` longtext DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`),
  ADD KEY `appointments_specialitie_id_foreign` (`specialitie_id`),
  ADD KEY `appointments_doctor_schedule_join_hour_id_foreign` (`doctor_schedule_join_hour_id`),
  ADD KEY `appointments_user_id_foreign` (`user_id`),
  ADD KEY `appointments_payment_status_id_foreign` (`payment_status_id`),
  ADD KEY `appointments_appointment_status_id_foreign` (`appointment_status_id`);

--
-- Indices de la tabla `appointment_attentions`
--
ALTER TABLE `appointment_attentions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_attentions_appointment_id_foreign` (`appointment_id`),
  ADD KEY `appointment_attentions_patient_id_foreign` (`patient_id`);

--
-- Indices de la tabla `appointment_pays`
--
ALTER TABLE `appointment_pays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_pays_appointment_id_foreign` (`appointment_id`),
  ADD KEY `appointment_pays_method_payment_id_foreign` (`method_payment_id`);

--
-- Indices de la tabla `appointment_statuses`
--
ALTER TABLE `appointment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctor_schedule_days`
--
ALTER TABLE `doctor_schedule_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_schedule_days_user_id_foreign` (`user_id`),
  ADD KEY `doctor_schedule_days_day_id_foreign` (`day_id`);

--
-- Indices de la tabla `doctor_schedule_hours`
--
ALTER TABLE `doctor_schedule_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctor_schedule_join_hours`
--
ALTER TABLE `doctor_schedule_join_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_schedule_join_hours_doctor_schedule_day_id_foreign` (`doctor_schedule_day_id`),
  ADD KEY `doctor_schedule_join_hours_doctor_schedule_hour_id_foreign` (`doctor_schedule_hour_id`);

--
-- Indices de la tabla `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `methods_payment`
--
ALTER TABLE `methods_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_gender_id_foreign` (`gender_id`);

--
-- Indices de la tabla `patient_persons`
--
ALTER TABLE `patient_persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_persons_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_persons_relationship_companion_id_foreign` (`relationship_companion_id`),
  ADD KEY `patient_persons_relationship_responsible_id_foreign` (`relationship_responsible_id`);

--
-- Indices de la tabla `payment_statuses`
--
ALTER TABLE `payment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `specialities`
--
ALTER TABLE `specialities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_specialitie_id_foreign` (`specialitie_id`),
  ADD KEY `users_gender_id_foreign` (`gender_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appointment_attentions`
--
ALTER TABLE `appointment_attentions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appointment_pays`
--
ALTER TABLE `appointment_pays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appointment_statuses`
--
ALTER TABLE `appointment_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `days`
--
ALTER TABLE `days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `doctor_schedule_days`
--
ALTER TABLE `doctor_schedule_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doctor_schedule_hours`
--
ALTER TABLE `doctor_schedule_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doctor_schedule_join_hours`
--
ALTER TABLE `doctor_schedule_join_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `methods_payment`
--
ALTER TABLE `methods_payment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `patient_persons`
--
ALTER TABLE `patient_persons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment_statuses`
--
ALTER TABLE `payment_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `relationships`
--
ALTER TABLE `relationships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `specialities`
--
ALTER TABLE `specialities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_appointment_status_id_foreign` FOREIGN KEY (`appointment_status_id`) REFERENCES `appointment_statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_doctor_schedule_join_hour_id_foreign` FOREIGN KEY (`doctor_schedule_join_hour_id`) REFERENCES `doctor_schedule_join_hours` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_specialitie_id_foreign` FOREIGN KEY (`specialitie_id`) REFERENCES `specialities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `appointment_attentions`
--
ALTER TABLE `appointment_attentions`
  ADD CONSTRAINT `appointment_attentions_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_attentions_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `appointment_pays`
--
ALTER TABLE `appointment_pays`
  ADD CONSTRAINT `appointment_pays_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_pays_method_payment_id_foreign` FOREIGN KEY (`method_payment_id`) REFERENCES `methods_payment` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `doctor_schedule_days`
--
ALTER TABLE `doctor_schedule_days`
  ADD CONSTRAINT `doctor_schedule_days_day_id_foreign` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `doctor_schedule_days_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `doctor_schedule_join_hours`
--
ALTER TABLE `doctor_schedule_join_hours`
  ADD CONSTRAINT `doctor_schedule_join_hours_doctor_schedule_day_id_foreign` FOREIGN KEY (`doctor_schedule_day_id`) REFERENCES `doctor_schedule_days` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `doctor_schedule_join_hours_doctor_schedule_hour_id_foreign` FOREIGN KEY (`doctor_schedule_hour_id`) REFERENCES `doctor_schedule_hours` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `patient_persons`
--
ALTER TABLE `patient_persons`
  ADD CONSTRAINT `patient_persons_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `patient_persons_relationship_companion_id_foreign` FOREIGN KEY (`relationship_companion_id`) REFERENCES `relationships` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `patient_persons_relationship_responsible_id_foreign` FOREIGN KEY (`relationship_responsible_id`) REFERENCES `relationships` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_specialitie_id_foreign` FOREIGN KEY (`specialitie_id`) REFERENCES `specialities` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
