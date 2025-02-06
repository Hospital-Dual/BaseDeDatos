-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2025 a las 20:32:52
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
-- Base de datos: `medico`
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
  `amount` double NOT NULL COMMENT 'costo total de la cita medica',
  `status_pay` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 pagado , 2 deuda ',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 es pendiente , 2 seria atendido',
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
  `method_payment` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_schedule_days`
--

CREATE TABLE `doctor_schedule_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) NOT NULL,
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
  `hour_start` varchar(255) NOT NULL,
  `hour_end` varchar(255) NOT NULL,
  `hour` varchar(255) NOT NULL,
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
-- Estructura de tabla para la tabla `failed_jobs`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `genders`
--

INSERT INTO `genders` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Masculino', NULL, NULL, NULL),
(2, 'Femenino', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
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
-- Estructura de tabla para la tabla `job_batches`
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
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_02_06_01_create_permissions_table', 1),
(4, '2024_02_06_02_create_roles_table', 1),
(5, '2024_02_06_03_create_specialities_table', 1),
(6, '2024_02_06_04_create_doctor_schedule_hours_table', 1),
(7, '2024_02_06_05_create_password_reset_tokens_table', 1),
(8, '2024_02_06_06_create_genders_table', 1),
(9, '2024_02_06_07_create_users_table', 1),
(10, '2024_02_06_08_create_patients_table', 1),
(11, '2024_02_06_09_create_doctor_schedule_days_table copy', 1),
(12, '2024_02_06_10_create_doctor_schedule_join_hours_table copy', 1),
(13, '2024_02_06_11_create_appointments_table', 1),
(14, '2024_02_06_12_create_appointment_attentions_table', 1),
(15, '2024_02_06_13_create_appointment_pays_table', 1),
(16, '2024_02_06_14_create_patient_persons_table', 1),
(17, '2024_02_06_15_create_model_has_permissions_table copy', 1),
(18, '2024_02_06_16_create_model_has_roles_table', 1),
(19, '2024_02_06_17_create_role_has_permissions_table copy', 1),
(20, '2024_02_06_18_create_personal_access_tokens_table', 1);

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
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 es masculino y 2 es femenino',
  `avatar` varchar(255) DEFAULT NULL,
  `n_document` varchar(255) DEFAULT NULL,
  `birth_date` timestamp NULL DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `antecedent_family` text DEFAULT NULL,
  `antecedent_personal` text DEFAULT NULL,
  `antecedent_allergic` text DEFAULT NULL,
  `ta` varchar(255) DEFAULT NULL COMMENT 'presion arterial',
  `temperatura` varchar(255) DEFAULT NULL,
  `fc` varchar(255) DEFAULT NULL COMMENT 'frecuencia cardiaca',
  `fr` varchar(255) DEFAULT NULL COMMENT 'frecuencia respiratoria',
  `peso` varchar(255) DEFAULT NULL,
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
  `name_companion` varchar(255) NOT NULL,
  `surname_companion` varchar(255) NOT NULL,
  `mobile_companion` varchar(255) DEFAULT NULL,
  `relationship_companion` varchar(255) DEFAULT NULL,
  `name_responsible` varchar(255) DEFAULT NULL,
  `surname_responsible` varchar(255) DEFAULT NULL,
  `mobile_responsible` varchar(255) DEFAULT NULL,
  `relationship_responsible` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'register_rol', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(2, 'list_rol', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(3, 'edit_rol', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(4, 'delete_rol', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(5, 'register_doctor', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(6, 'list_doctor', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(7, 'edit_doctor', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(8, 'delete_doctor', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(9, 'profile_doctor', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(10, 'register_patient', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(11, 'list_patient', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(12, 'edit_patient', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(13, 'delete_patient', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(14, 'profile_patient', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(15, 'register_staff', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(16, 'list_staff', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(17, 'edit_staff', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(18, 'delete_staff', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(19, 'register_appointment', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(20, 'list_appointment', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(21, 'edit_appointment', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(22, 'delete_appointment', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(23, 'register_specialty', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(24, 'list_specialty', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(25, 'edit_specialty', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(26, 'delete_specialty', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(27, 'show_payment', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(28, 'edit_payment', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(29, 'activitie', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(30, 'calendar', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(31, 'expense_report', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(32, 'invoice_report', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56'),
(33, 'settings', 'api', '2023-09-28 16:46:56', '2023-09-28 16:46:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(255) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 1,
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
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `specialitie_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `education` longtext DEFAULT NULL,
  `designation` longtext DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
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
  ADD KEY `appointments_user_id_foreign` (`user_id`);

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
  ADD KEY `appointment_pays_appointment_id_foreign` (`appointment_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `doctor_schedule_days`
--
ALTER TABLE `doctor_schedule_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_schedule_days_user_id_foreign` (`user_id`);

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
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
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
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `patient_persons`
--
ALTER TABLE `patient_persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_persons_patient_id_foreign` (`patient_id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_doctor_schedule_join_hour_id_foreign` FOREIGN KEY (`doctor_schedule_join_hour_id`) REFERENCES `doctor_schedule_join_hours` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
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
  ADD CONSTRAINT `appointment_pays_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `doctor_schedule_days`
--
ALTER TABLE `doctor_schedule_days`
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
-- Filtros para la tabla `patient_persons`
--
ALTER TABLE `patient_persons`
  ADD CONSTRAINT `patient_persons_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `users_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_specialitie_id_foreign` FOREIGN KEY (`specialitie_id`) REFERENCES `specialities` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
