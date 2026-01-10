-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 29, 2025 at 02:32 PM
-- Server version: 8.0.44-0ubuntu0.24.04.2
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mentor-lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submissions`
--

CREATE TABLE `assignment_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `attachment_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `submitted_at` timestamp NOT NULL DEFAULT '2025-12-29 14:31:06',
  `marks_obtained` decimal(8,2) NOT NULL DEFAULT '0.00',
  `instructor_feedback` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `attempt_number` int NOT NULL DEFAULT '1',
  `is_late` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `course_assignment_id` bigint UNSIGNED NOT NULL,
  `grader_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` bigint UNSIGNED NOT NULL,
  `backup_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_code_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `database_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_code_size` bigint NOT NULL,
  `database_size` bigint NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'completed',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `blog_category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `icon`, `sort`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'default', 'recycle', 1, 'When a specific category is deleted, all blogs in that category will be moved to this default category. So default category cannot be edited or removed.', 'active', '2025-12-29 14:31:17', '2025-12-29 14:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_like_dislikes`
--

CREATE TABLE `blog_like_dislikes` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('like','dislike') COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('mentorlms_cache_language_properties', 'a:1356:{s:11:\"auth.failed\";s:43:\"These credentials do not match our records.\";s:13:\"auth.password\";s:35:\"The provided password is incorrect.\";s:13:\"auth.throttle\";s:62:\"Too many login attempts. Please try again in :seconds seconds.\";s:21:\"auth.password_updated\";s:31:\"Your password has been updated.\";s:24:\"auth.password_reset_sent\";s:41:\"We have emailed your password reset link.\";s:25:\"auth.google_auth_settings\";s:20:\"Google Auth Settings\";s:27:\"auth.verification_link_sent\";s:62:\"A fresh verification link has been sent to your email address.\";s:28:\"auth.google_auth_description\";s:23:\"Google Auth Description\";s:15:\"auth.no_account\";s:22:\"Don\'t have an account?\";s:16:\"auth.google_auth\";s:11:\"Google Auth\";s:16:\"auth.login_title\";s:22:\"Log in to your account\";s:16:\"auth.remember_me\";s:11:\"Remember me\";s:18:\"auth.continue_with\";s:16:\"Or continue with\";s:20:\"auth.forgot_password\";s:15:\"Forgot Password\";s:22:\"auth.login_description\";s:45:\"Enter your email and password below to log in\";s:17:\"auth.have_account\";s:24:\"Already have an account?\";s:19:\"auth.register_title\";s:17:\"Create an account\";s:25:\"auth.register_description\";s:47:\"Enter your details below to create your account\";s:20:\"auth.return_to_login\";s:13:\"Or, return to\";s:23:\"auth.forgot_description\";s:49:\"Enter your email to receive a password reset link\";s:16:\"auth.reset_title\";s:14:\"Reset password\";s:22:\"auth.reset_description\";s:36:\"Please enter your new password below\";s:18:\"auth.confirm_title\";s:21:\"Confirm your password\";s:24:\"auth.confirm_description\";s:89:\"This is a secure area of the application. Please confirm your password before continuing.\";s:17:\"auth.change_email\";s:12:\"Change Email\";s:17:\"auth.verify_title\";s:12:\"Verify email\";s:22:\"auth.verification_sent\";s:92:\"A new verification link has been sent to the email address you provided during registration.\";s:23:\"auth.verify_description\";s:80:\"Please verify your email address by clicking on the link we just emailed to you.\";s:10:\"button.add\";s:3:\"Add\";s:11:\"button.dark\";s:4:\"Dark\";s:11:\"button.edit\";s:4:\"Edit\";s:11:\"button.save\";s:4:\"Save\";s:12:\"button.apply\";s:5:\"Apply\";s:12:\"button.close\";s:5:\"Close\";s:12:\"button.light\";s:5:\"Light\";s:12:\"button.reply\";s:5:\"Reply\";s:13:\"button.cancel\";s:6:\"Cancel\";s:13:\"button.create\";s:6:\"Create\";s:13:\"button.delete\";s:6:\"Delete\";s:13:\"button.remove\";s:6:\"Remove\";s:13:\"button.submit\";s:6:\"Submit\";s:13:\"button.update\";s:6:\"Update\";s:15:\"button.previous\";s:8:\"Previous\";s:15:\"button.view_all\";s:8:\"View All\";s:20:\"button.collaborative\";s:13:\"Collaborative\";s:21:\"button.administrative\";s:14:\"Administrative\";s:11:\"button.form\";s:4:\"Form\";s:11:\"button.free\";s:4:\"Free\";s:11:\"button.list\";s:4:\"List\";s:11:\"button.send\";s:4:\"Send\";s:11:\"button.sort\";s:4:\"Sort\";s:11:\"button.true\";s:4:\"True\";s:11:\"button.type\";s:4:\"Type\";s:12:\"button.false\";s:5:\"False\";s:13:\"button.active\";s:6:\"Active\";s:13:\"button.filter\";s:6:\"Filter\";s:13:\"button.search\";s:6:\"Search\";s:13:\"button.upload\";s:6:\"Upload\";s:14:\"button.lessons\";s:7:\"Lessons\";s:14:\"button.refresh\";s:7:\"Refresh\";s:14:\"button.reorder\";s:7:\"Reorder\";s:15:\"button.add_item\";s:8:\"Add Item\";s:15:\"button.download\";s:8:\"Download\";s:15:\"button.inactive\";s:8:\"Inactive\";s:17:\"button.backup_now\";s:10:\"Backup Now\";s:17:\"button.class_note\";s:10:\"Class Note\";s:17:\"button.deactivate\";s:10:\"Deactivate\";s:17:\"button.join_class\";s:10:\"Join Class\";s:19:\"button.add_language\";s:12:\"Add Language\";s:19:\"button.delete_class\";s:12:\"Delete Class\";s:19:\"button.live_classes\";s:12:\"Live Classes\";s:19:\"button.save_changes\";s:12:\"Save Changes\";s:20:\"button.delete_backup\";s:13:\"Delete Backup\";s:21:\"button.add_newsletter\";s:14:\"Add Newsletter\";s:21:\"button.refresh_server\";s:14:\"Refresh Server\";s:21:\"button.restore_backup\";s:14:\"Restore Backup\";s:21:\"button.schedule_class\";s:14:\"Schedule Class\";s:22:\"button.edit_live_class\";s:15:\"Edit Live Class\";s:24:\"button.update_newsletter\";s:17:\"Update Newsletter\";s:25:\"button.update_application\";s:18:\"Update Application\";s:11:\"button.like\";s:4:\"like\";s:14:\"button.buy_now\";s:7:\"Buy Now\";s:14:\"button.dislike\";s:7:\"dislike\";s:14:\"button.posting\";s:10:\"Posting...\";s:15:\"button.add_quiz\";s:8:\"Add Quiz\";s:15:\"button.continue\";s:8:\"Continue\";s:16:\"button.next_step\";s:9:\"Next Step\";s:16:\"button.subscribe\";s:9:\"Subscribe\";s:17:\"button.add_lesson\";s:10:\"Add Lesson\";s:17:\"button.enroll_now\";s:10:\"Enroll Now\";s:17:\"button.learn_more\";s:10:\"Learn More\";s:18:\"button.add_section\";s:11:\"Add Section\";s:18:\"button.add_to_cart\";s:11:\"Add to cart\";s:18:\"button.download_as\";s:11:\"Download as\";s:18:\"button.pick_a_date\";s:11:\"Pick a date\";s:18:\"button.play_course\";s:11:\"Play Course\";s:18:\"button.save_lesson\";s:11:\"Save Lesson\";s:19:\"button.add_question\";s:12:\"Add Question\";s:19:\"button.edit_section\";s:12:\"Edit Section\";s:19:\"button.post_comment\";s:12:\"Post Comment\";s:19:\"button.sort_lessons\";s:12:\"Sort Lessons\";s:19:\"button.sort_section\";s:12:\"Sort Section\";s:19:\"button.toggle_theme\";s:12:\"Toggle theme\";s:20:\"button.course_player\";s:13:\"Course Player\";s:20:\"button.previous_step\";s:13:\"Previous Step\";s:20:\"button.submit_review\";s:13:\"Submit Review\";s:21:\"button.course_details\";s:14:\"Course Details\";s:21:\"button.course_preview\";s:14:\"Course Preview\";s:21:\"button.delete_account\";s:14:\"Delete account\";s:21:\"button.delete_section\";s:14:\"Delete Section\";s:21:\"button.quiz_questions\";s:14:\"Quiz Questions\";s:22:\"button.add_to_wishlist\";s:15:\"Add to Wishlist\";s:22:\"button.approval_status\";s:15:\"Approval Status\";s:22:\"button.sort_categories\";s:15:\"Sort Categories\";s:23:\"button.mark_all_as_read\";s:16:\"Mark all as read\";s:26:\"button.continue_to_payment\";s:19:\"Continue to payment\";s:26:\"button.submit_for_approval\";s:19:\"Submit for Approval\";s:27:\"button.become_an_instructor\";s:20:\"Become an Instructor\";s:27:\"button.generate_certificate\";s:20:\"Generate Certificate\";s:27:\"button.remove_from_wishlist\";s:20:\"Remove from Wishlist\";s:29:\"button.are_you_sure_to_delete\";s:23:\"Are you sure to delete?\";s:29:\"button.generating_certificate\";s:25:\"Generating Certificate...\";s:29:\"button.view_all_notifications\";s:22:\"View all notifications\";s:12:\"button.login\";s:5:\"Login\";s:13:\"button.log_in\";s:6:\"Log in\";s:13:\"button.logout\";s:6:\"Logout\";s:14:\"button.log_out\";s:7:\"Log out\";s:14:\"button.sign_up\";s:7:\"Sign up\";s:19:\"button.change_email\";s:12:\"Change Email\";s:21:\"button.create_account\";s:14:\"Create account\";s:21:\"button.reset_password\";s:14:\"Reset password\";s:22:\"button.change_password\";s:15:\"Change Password\";s:22:\"button.forget_password\";s:15:\"Forget Password\";s:22:\"button.forgot_password\";s:16:\"Forgot password?\";s:23:\"button.confirm_password\";s:16:\"Confirm password\";s:27:\"button.continue_with_google\";s:20:\"Continue With Google\";s:28:\"button.get_email_change_link\";s:21:\"Get Email Change Link\";s:30:\"button.get_password_reset_link\";s:23:\"Get Password Reset Link\";s:32:\"button.email_password_reset_link\";s:25:\"Email password reset link\";s:32:\"button.resend_verification_email\";s:25:\"Resend verification email\";s:13:\"button.saving\";s:9:\"Saving...\";s:16:\"button.uploading\";s:12:\"Uploading...\";s:18:\"button.upload_file\";s:11:\"Upload File\";s:19:\"button.start_upload\";s:12:\"Start Upload\";s:20:\"button.cancel_upload\";s:13:\"Cancel Upload\";s:23:\"button.completed_upload\";s:16:\"Completed upload\";s:24:\"button.finalizing_upload\";s:20:\"Finalizing upload...\";s:26:\"button.initializing_upload\";s:22:\"Initializing upload...\";s:28:\"button.select_different_file\";s:21:\"Select Different File\";s:28:\"button.uploading_file_chunks\";s:24:\"Uploading file chunks...\";s:36:\"button.upload_completed_successfully\";s:29:\"Upload completed successfully\";s:11:\"button.back\";s:4:\"Back\";s:11:\"button.last\";s:4:\"Last\";s:11:\"button.next\";s:4:\"Next\";s:11:\"button.prev\";s:4:\"Prev\";s:12:\"button.first\";s:5:\"First\";s:16:\"button.show_full\";s:9:\"Show Full\";s:16:\"button.show_less\";s:9:\"Show Less\";s:11:\"button.smtp\";s:4:\"SMTP\";s:12:\"button.auth0\";s:5:\"Auth0\";s:12:\"button.blogs\";s:5:\"Blogs\";s:12:\"button.pages\";s:5:\"Pages\";s:13:\"button.system\";s:6:\"System\";s:14:\"button.account\";s:7:\"Account\";s:14:\"button.courses\";s:7:\"Courses\";s:14:\"button.payouts\";s:7:\"Payouts\";s:14:\"button.profile\";s:7:\"Profile\";s:14:\"button.storage\";s:7:\"Storage\";s:15:\"button.all_jobs\";s:8:\"All Jobs\";s:15:\"button.edit_job\";s:8:\"Edit Job\";s:15:\"button.settings\";s:8:\"Settings\";s:15:\"button.wishlist\";s:8:\"Wishlist\";s:15:\"button.withdraw\";s:8:\"Withdraw\";s:16:\"button.all_users\";s:9:\"All Users\";s:16:\"button.dashboard\";s:9:\"Dashboard\";s:16:\"button.main_menu\";s:9:\"Main Menu\";s:17:\"button.categories\";s:10:\"Categories\";s:17:\"button.create_job\";s:10:\"Create Job\";s:17:\"button.live_class\";s:10:\"Live Class\";s:17:\"button.my_courses\";s:10:\"My Courses\";s:18:\"button.create_blog\";s:11:\"Create Blog\";s:18:\"button.enrollments\";s:11:\"Enrollments\";s:18:\"button.instructors\";s:11:\"Instructors\";s:18:\"button.maintenance\";s:11:\"Maintenance\";s:18:\"button.manage_blog\";s:11:\"Manage Blog\";s:18:\"button.newsletters\";s:11:\"Newsletters\";s:19:\"button.applications\";s:12:\"Applications\";s:20:\"button.create_course\";s:13:\"Create Course\";s:20:\"button.job_circulars\";s:13:\"Job Circulars\";s:20:\"button.payout_report\";s:13:\"Payout Report\";s:21:\"button.manage_courses\";s:14:\"Manage Courses\";s:21:\"button.payout_history\";s:14:\"Payout History\";s:21:\"button.payout_request\";s:14:\"Payout Request\";s:21:\"button.profile_update\";s:14:\"Profile Update\";s:22:\"button.payment_methods\";s:15:\"Payment Methods\";s:24:\"button.create_instructor\";s:17:\"Create Instructor\";s:25:\"button.add_new_enrollment\";s:18:\"Add New Enrollment\";s:25:\"button.add_new_instructor\";s:18:\"Add New Instructor\";s:25:\"button.manage_enrollments\";s:18:\"Manage Enrollments\";s:25:\"button.manage_instructors\";s:18:\"Manage Instructors\";s:10:\"button.seo\";s:3:\"SEO\";s:11:\"button.info\";s:4:\"Info\";s:11:\"button.quiz\";s:4:\"Quiz\";s:12:\"button.basic\";s:5:\"Basic\";s:12:\"button.forum\";s:5:\"Forum\";s:12:\"button.media\";s:5:\"Media\";s:12:\"button.style\";s:5:\"Style\";s:13:\"button.footer\";s:6:\"Footer\";s:13:\"button.lesson\";s:6:\"Lesson\";s:13:\"button.navbar\";s:6:\"Navbar\";s:13:\"button.review\";s:6:\"Review\";s:13:\"button.social\";s:6:\"Social\";s:14:\"button.actions\";s:7:\"Actions\";s:14:\"button.details\";s:7:\"Details\";s:14:\"button.payment\";s:7:\"Payment\";s:14:\"button.pricing\";s:7:\"Pricing\";s:14:\"button.reviews\";s:7:\"Reviews\";s:14:\"button.summery\";s:7:\"Summery\";s:14:\"button.website\";s:7:\"Website\";s:15:\"button.overview\";s:8:\"Overview\";s:16:\"button.copyright\";s:9:\"Copyright\";s:16:\"button.dropdowns\";s:9:\"Dropdowns\";s:16:\"button.url_items\";s:9:\"URL Items\";s:17:\"button.curriculum\";s:10:\"Curriculum\";s:17:\"button.instructor\";s:10:\"Instructor\";s:18:\"button.certificate\";s:11:\"Certificate\";s:18:\"button.edit_footer\";s:11:\"Edit Footer\";s:18:\"button.edit_navbar\";s:11:\"Edit Navbar\";s:19:\"button.social_media\";s:12:\"Social Media\";s:24:\"button.become_instructor\";s:17:\"Become Instructor\";s:10:\"common.url\";s:3:\"URL\";s:11:\"common.name\";s:4:\"Name\";s:11:\"common.role\";s:4:\"Role\";s:11:\"common.type\";s:4:\"Type\";s:12:\"common.email\";s:5:\"Email\";s:12:\"common.image\";s:5:\"Image\";s:12:\"common.level\";s:5:\"Level\";s:12:\"common.price\";s:5:\"Price\";s:12:\"common.title\";s:5:\"Title\";s:13:\"common.action\";s:6:\"Action\";s:13:\"common.rating\";s:6:\"Rating\";s:13:\"common.status\";s:6:\"Status\";s:14:\"common.actions\";s:7:\"Actions\";s:14:\"common.comment\";s:7:\"Comment\";s:14:\"common.courses\";s:7:\"Courses\";s:14:\"common.reviews\";s:7:\"Reviews\";s:15:\"common.category\";s:8:\"Category\";s:15:\"common.comments\";s:8:\"Comments\";s:15:\"common.location\";s:8:\"Location\";s:15:\"common.password\";s:8:\"Password\";s:15:\"common.students\";s:8:\"Students\";s:17:\"common.categories\";s:10:\"Categories\";s:17:\"common.instructor\";s:10:\"Instructor\";s:18:\"common.description\";s:11:\"Description\";s:9:\"common.on\";s:2:\"On\";s:10:\"common.off\";s:3:\"Off\";s:11:\"common.free\";s:4:\"Free\";s:12:\"common.draft\";s:5:\"Draft\";s:13:\"common.active\";s:6:\"Active\";s:13:\"common.closed\";s:6:\"Closed\";s:13:\"common.paused\";s:6:\"Paused\";s:14:\"common.default\";s:7:\"default\";s:14:\"common.enabled\";s:7:\"Enabled\";s:14:\"common.expired\";s:7:\"Expired\";s:14:\"common.pending\";s:7:\"Pending\";s:15:\"common.disabled\";s:8:\"Disabled\";s:15:\"common.inactive\";s:8:\"Inactive\";s:15:\"common.language\";s:8:\"Language\";s:16:\"common.completed\";s:9:\"Completed\";s:16:\"common.published\";s:9:\"Published\";s:9:\"common.no\";s:2:\"No\";s:9:\"common.ok\";s:2:\"OK\";s:10:\"common.yes\";s:3:\"Yes\";s:11:\"common.back\";s:4:\"Back\";s:11:\"common.edit\";s:4:\"Edit\";s:11:\"common.save\";s:4:\"Save\";s:11:\"common.skip\";s:4:\"Skip\";s:11:\"common.view\";s:4:\"View\";s:12:\"common.apply\";s:5:\"Apply\";s:12:\"common.close\";s:5:\"Close\";s:12:\"common.retry\";s:5:\"Retry\";s:13:\"common.cancel\";s:6:\"Cancel\";s:13:\"common.create\";s:6:\"Create\";s:13:\"common.delete\";s:6:\"Delete\";s:13:\"common.filter\";s:6:\"Filter\";s:13:\"common.reload\";s:6:\"Reload\";s:13:\"common.search\";s:6:\"Search\";s:13:\"common.submit\";s:6:\"Submit\";s:13:\"common.update\";s:6:\"Update\";s:14:\"common.confirm\";s:7:\"Confirm\";s:14:\"common.preview\";s:7:\"Preview\";s:14:\"common.refresh\";s:7:\"Refresh\";s:15:\"common.continue\";s:8:\"Continue\";s:15:\"common.download\";s:8:\"Download\";s:19:\"common.change_email\";s:12:\"Change Email\";s:22:\"common.change_password\";s:15:\"Change Password\";s:22:\"common.forget_password\";s:15:\"Forget Password\";s:10:\"common.ago\";s:3:\"ago\";s:12:\"common.today\";s:5:\"Today\";s:13:\"common.saving\";s:9:\"Saving...\";s:14:\"common.loading\";s:10:\"Loading...\";s:15:\"common.deleting\";s:11:\"Deleting...\";s:15:\"common.updating\";s:11:\"Updating...\";s:16:\"common.searching\";s:12:\"Searching...\";s:16:\"common.uploading\";s:12:\"Uploading...\";s:16:\"common.yesterday\";s:9:\"Yesterday\";s:17:\"common.processing\";s:13:\"Processing...\";s:23:\"common.no_results_found\";s:16:\"No results found\";s:15:\"common.settings\";s:8:\"Settings\";s:21:\"common.email_settings\";s:14:\"Email Settings\";s:23:\"common.general_settings\";s:16:\"General Settings\";s:23:\"common.payment_settings\";s:16:\"Payment Settings\";s:19:\"common.invalid_file\";s:53:\"Invalid file format. Please upload a valid .zip file.\";s:21:\"common.file_too_large\";s:48:\"File is too large. Please select a smaller file.\";s:21:\"common.required_field\";s:23:\"This field is required.\";s:11:\"common.help\";s:4:\"Help\";s:11:\"common.home\";s:4:\"Home\";s:12:\"common.about\";s:5:\"About\";s:14:\"common.contact\";s:7:\"Contact\";s:14:\"common.support\";s:7:\"Support\";s:16:\"common.dashboard\";s:9:\"Dashboard\";s:9:\"common.of\";s:2:\"of\";s:11:\"common.last\";s:6:\"Last>>\";s:11:\"common.next\";s:4:\"Next\";s:11:\"common.page\";s:4:\"Page\";s:12:\"common.first\";s:7:\"<<First\";s:15:\"common.previous\";s:8:\"Previous\";s:17:\"common.go_to_page\";s:10:\"Go to page\";s:11:\"common.file\";s:4:\"File\";s:12:\"common.audio\";s:5:\"Audio\";s:12:\"common.video\";s:5:\"Video\";s:15:\"common.document\";s:8:\"Document\";s:33:\"common.select_the_approval_status\";s:26:\"Select the approval status\";s:24:\"dashboard.faq_management\";s:14:\"FAQ Management\";s:25:\"dashboard.user_management\";s:15:\"User Management\";s:27:\"dashboard.course_management\";s:17:\"Course Management\";s:27:\"dashboard.refund_management\";s:17:\"Refund Management\";s:28:\"dashboard.content_management\";s:18:\"Content Management\";s:30:\"dashboard.financial_management\";s:20:\"Financial Management\";s:17:\"dashboard.reports\";s:7:\"Reports\";s:19:\"dashboard.analytics\";s:9:\"Analytics\";s:22:\"dashboard.sales_report\";s:12:\"Sales Report\";s:23:\"dashboard.export_report\";s:13:\"Export Report\";s:26:\"dashboard.course_analytics\";s:16:\"Course Analytics\";s:26:\"dashboard.financial_report\";s:16:\"Financial Report\";s:27:\"dashboard.course_statistics\";s:17:\"Course Statistics\";s:27:\"dashboard.visitor_analytics\";s:17:\"Visitor Analytics\";s:28:\"dashboard.revenue_statistics\";s:18:\"Revenue Statistics\";s:30:\"dashboard.user_activity_report\";s:20:\"User Activity Report\";s:31:\"dashboard.enrollment_statistics\";s:21:\"Enrollment Statistics\";s:35:\"dashboard.course_performance_report\";s:25:\"Course Performance Report\";s:23:\"dashboard.media_details\";s:13:\"Media Details\";s:26:\"dashboard.blog_information\";s:16:\"Blog Information\";s:26:\"dashboard.user_information\";s:16:\"User Information\";s:27:\"dashboard.basic_information\";s:17:\"Basic Information\";s:30:\"dashboard.compensation_details\";s:22:\"Compensation & Details\";s:20:\"dashboard.total_jobs\";s:10:\"Total Jobs\";s:21:\"dashboard.total_blogs\";s:11:\"Total Blogs\";s:21:\"dashboard.total_users\";s:11:\"Total Users\";s:24:\"dashboard.total_earnings\";s:14:\"Total Earnings\";s:26:\"dashboard.total_categories\";s:16:\"Total Categories\";s:27:\"dashboard.total_withdrawals\";s:17:\"Total Withdrawals\";s:22:\"dashboard.select_media\";s:12:\"Select Media\";s:26:\"dashboard.select_user_type\";s:16:\"Select user type\";s:27:\"dashboard.select_recipients\";s:17:\"Select Recipients\";s:34:\"dashboard.select_withdrawal_method\";s:24:\"Select withdrawal method\";s:20:\"dashboard.no_results\";s:11:\"No results.\";s:26:\"dashboard.no_results_found\";s:16:\"No results found\";s:29:\"dashboard.update_the_category\";s:19:\"Update The Category\";s:33:\"dashboard.are_you_absolutely_sure\";s:24:\"Are you absolutely sure?\";s:35:\"dashboard.image_upload_requirements\";s:24:\"Image upload is required\";s:15:\"dashboard.admin\";s:5:\"Admin\";s:17:\"dashboard.lessons\";s:7:\"Lessons\";s:17:\"dashboard.quizzes\";s:7:\"Quizzes\";s:18:\"dashboard.archived\";s:8:\"Archived\";s:19:\"dashboard.user_list\";s:9:\"User List\";s:20:\"dashboard.enrollment\";s:10:\"Enrollment\";s:20:\"dashboard.sort_items\";s:10:\"Sort Items\";s:21:\"dashboard.course_list\";s:11:\"Course List\";s:21:\"dashboard.payout_list\";s:11:\"Payout List\";s:21:\"dashboard.update_quiz\";s:11:\"Update Quiz\";s:23:\"dashboard.course_status\";s:13:\"Course Status\";s:23:\"dashboard.update_lesson\";s:13:\"Update Lesson\";s:24:\"dashboard.update_section\";s:14:\"Update Section\";s:25:\"dashboard.instructor_list\";s:15:\"Instructor List\";s:25:\"dashboard.newsletter_list\";s:15:\"Newsletter List\";s:29:\"dashboard.total_content_items\";s:19:\"Total Content Items\";s:18:\"dashboard.job_type\";s:8:\"Job Type\";s:19:\"dashboard.work_type\";s:9:\"Work Type\";s:21:\"dashboard.job_details\";s:11:\"Job Details\";s:22:\"dashboard.salary_range\";s:12:\"Salary Range\";s:23:\"dashboard.contact_email\";s:13:\"Contact Email\";s:23:\"dashboard.job_circulars\";s:13:\"Job Circulars\";s:25:\"dashboard.salary_currency\";s:15:\"Salary Currency\";s:25:\"dashboard.skills_required\";s:15:\"Skills Required\";s:26:\"dashboard.experience_level\";s:16:\"Experience Level\";s:27:\"dashboard.job_details_title\";s:59:\"Specify the job type, location, and experience requirements\";s:27:\"dashboard.salary_negotiable\";s:17:\"Salary Negotiable\";s:28:\"dashboard.salary_information\";s:18:\"Salary Information\";s:29:\"dashboard.positions_available\";s:19:\"Positions Available\";s:30:\"dashboard.application_deadline\";s:20:\"Application Deadline\";s:32:\"dashboard.no_job_circulars_found\";s:22:\"No job circulars found\";s:32:\"dashboard.provide_salary_details\";s:51:\"Provide salary range and other compensation details\";s:34:\"dashboard.salary_information_title\";s:44:\"Set the compensation range for this position\";s:34:\"dashboard.specify_job_requirements\";s:61:\"Specify the requirements and qualifications for this position\";s:39:\"dashboard.provide_essential_job_details\";s:52:\"Provide the essential details about the job position\";s:13:\"dashboard.all\";s:3:\"All\";s:17:\"dashboard.send_to\";s:7:\"Send To\";s:17:\"dashboard.student\";s:7:\"Student\";s:25:\"dashboard.send_newsletter\";s:15:\"Send newsletter\";s:30:\"dashboard.no_newsletters_found\";s:20:\"No newsletters found\";s:19:\"dashboard.available\";s:9:\"Available\";s:19:\"dashboard.requested\";s:9:\"Requested\";s:22:\"dashboard.total_payout\";s:12:\"Total Payout\";s:23:\"dashboard.withdraw_list\";s:13:\"Withdraw List\";s:24:\"dashboard.payout_history\";s:14:\"Payout History\";s:24:\"dashboard.payout_request\";s:14:\"Payout Request\";s:18:\"dashboard.feedback\";s:8:\"Feedback\";s:25:\"dashboard.approval_status\";s:15:\"Approval Status\";s:27:\"dashboard.course_instructor\";s:17:\"Course Instructor\";s:14:\"dashboard.blog\";s:4:\"Blog\";s:21:\"dashboard.icon_picker\";s:11:\"Icon Picker\";s:22:\"dashboard.add_category\";s:12:\"Add Category\";s:22:\"dashboard.add_new_blog\";s:12:\"Add new blog\";s:23:\"dashboard.blog_category\";s:13:\"Blog Category\";s:25:\"dashboard.blog_categories\";s:15:\"Blog Categories\";s:25:\"dashboard.category_status\";s:15:\"Category Status\";s:25:\"dashboard.create_category\";s:15:\"Create Category\";s:25:\"dashboard.sort_categories\";s:15:\"Sort Categories\";s:26:\"dashboard.add_new_category\";s:16:\"Add New Category\";s:26:\"dashboard.enter_blog_title\";s:16:\"Enter blog title\";s:28:\"dashboard.pick_category_icon\";s:23:\"Pick your category icon\";s:28:\"dashboard.protected_category\";s:18:\"Protected Category\";s:29:\"dashboard.enter_category_name\";s:19:\"Enter category name\";s:31:\"dashboard.blog_information_desc\";s:50:\"Provide the essential details about your blog post\";s:33:\"dashboard.protected_category_desc\";s:154:\"When a specific category is deleted, all courses in that category will be moved to this default category. So default category cannot be edited or removed.\";s:35:\"dashboard.provide_essential_details\";s:50:\"Provide the essential details about your blog post\";s:38:\"dashboard.default_category_description\";s:154:\"When a specific category is deleted, all courses in that category will be moved to this default category. So default category cannot be edited or removed.\";s:19:\"dashboard.all_users\";s:9:\"All Users\";s:23:\"dashboard.only_students\";s:13:\"Only Students\";s:26:\"dashboard.only_instructors\";s:16:\"Only Instructors\";s:25:\"dashboard.withdraw_amount\";s:15:\"Withdraw Amount\";s:25:\"dashboard.withdrawal_note\";s:15:\"Withdrawal Note\";s:26:\"dashboard.maximum_withdraw\";s:16:\"Maximum Withdraw\";s:26:\"dashboard.minimum_withdraw\";s:16:\"Minimum Withdraw\";s:27:\"dashboard.available_balance\";s:17:\"Available Balance\";s:27:\"dashboard.withdrawal_method\";s:17:\"Withdrawal Method\";s:29:\"dashboard.pending_withdrawals\";s:19:\"Pending Withdrawals\";s:37:\"dashboard.withdrawal_note_placeholder\";s:41:\"Add a note for this withdrawal (optional)\";s:19:\"dashboard.user_role\";s:9:\"User Role\";s:40:\"dashboard.provide_essential_user_details\";s:44:\"Provide the essential details about the user\";s:19:\"dashboard.file_name\";s:9:\"File Name\";s:19:\"dashboard.file_size\";s:9:\"File Size\";s:19:\"dashboard.file_type\";s:9:\"File Type\";s:20:\"dashboard.dimensions\";s:10:\"Dimensions\";s:21:\"dashboard.upload_date\";s:11:\"Upload Date\";s:22:\"dashboard.file_manager\";s:12:\"File Manager\";s:22:\"dashboard.upload_media\";s:12:\"Upload Media\";s:23:\"dashboard.media_library\";s:13:\"Media Library\";s:18:\"dashboard.messages\";s:8:\"Messages\";s:23:\"dashboard.announcements\";s:13:\"Announcements\";s:23:\"dashboard.notifications\";s:13:\"Notifications\";s:18:\"dashboard.og_title\";s:8:\"OG Title\";s:20:\"dashboard.meta_title\";s:10:\"Meta Title\";s:23:\"dashboard.meta_keywords\";s:13:\"Meta Keywords\";s:24:\"dashboard.enter_og_title\";s:14:\"Enter OG Title\";s:24:\"dashboard.og_description\";s:14:\"OG Description\";s:26:\"dashboard.enter_meta_title\";s:16:\"Enter Meta Title\";s:26:\"dashboard.meta_description\";s:16:\"Meta Description\";s:29:\"dashboard.enter_meta_keywords\";s:19:\"Enter Meta Keywords\";s:30:\"dashboard.enter_og_description\";s:20:\"Enter OG Description\";s:32:\"dashboard.enter_meta_description\";s:22:\"Enter Meta Description\";s:17:\"dashboard.is_free\";s:7:\"Is Free\";s:18:\"dashboard.duration\";s:8:\"Duration\";s:19:\"dashboard.video_url\";s:9:\"Video URL\";s:20:\"dashboard.image_file\";s:10:\"Image File\";s:20:\"dashboard.video_file\";s:10:\"Video File\";s:21:\"dashboard.lesson_type\";s:11:\"Lesson Type\";s:22:\"dashboard.embed_source\";s:12:\"Embed Source\";s:22:\"dashboard.lesson_title\";s:12:\"Lesson Title\";s:22:\"dashboard.text_content\";s:12:\"Text Content\";s:23:\"dashboard.document_file\";s:13:\"Document File\";s:23:\"dashboard.lesson_source\";s:13:\"Lesson Source\";s:23:\"dashboard.lesson_status\";s:13:\"Lesson Status\";s:24:\"dashboard.lesson_summary\";s:14:\"Lesson Summary\";s:25:\"dashboard.lesson_provider\";s:15:\"Lesson Provider\";s:28:\"dashboard.lesson_description\";s:18:\"Lesson Description\";s:15:\"dashboard.hours\";s:5:\"Hours\";s:16:\"dashboard.retake\";s:6:\"Retake\";s:17:\"dashboard.minutes\";s:7:\"Minutes\";s:17:\"dashboard.seconds\";s:7:\"Seconds\";s:19:\"dashboard.pass_mark\";s:9:\"Pass Mark\";s:20:\"dashboard.quiz_title\";s:10:\"Quiz Title\";s:20:\"dashboard.total_mark\";s:10:\"Total Mark\";s:22:\"dashboard.quiz_summary\";s:12:\"Quiz Summary\";s:26:\"dashboard.enter_quiz_title\";s:16:\"Enter quiz title\";s:20:\"dashboard.true_false\";s:13:\"True of False\";s:22:\"dashboard.add_question\";s:12:\"Add Question\";s:23:\"dashboard.edit_question\";s:13:\"Edit Question\";s:23:\"dashboard.question_type\";s:13:\"Question Type\";s:23:\"dashboard.single_choice\";s:13:\"Single Choice\";s:24:\"dashboard.correct_answer\";s:14:\"Correct Answer\";s:24:\"dashboard.question_title\";s:14:\"Question Title\";s:25:\"dashboard.multiple_choice\";s:15:\"Multiple Choice\";s:26:\"dashboard.question_options\";s:16:\"Question Options\";s:30:\"dashboard.select_question_type\";s:20:\"Select question type\";s:18:\"dashboard.sections\";s:8:\"Sections\";s:21:\"dashboard.assignments\";s:11:\"Assignments\";s:23:\"dashboard.section_title\";s:13:\"Section Title\";s:24:\"dashboard.lesson_content\";s:14:\"Lesson Content\";s:24:\"dashboard.quiz_questions\";s:14:\"Quiz Questions\";s:29:\"dashboard.section_description\";s:19:\"Section Description\";s:20:\"dashboard.user_roles\";s:10:\"User Roles\";s:21:\"dashboard.permissions\";s:11:\"Permissions\";s:21:\"dashboard.update_user\";s:11:\"Update User\";s:23:\"dashboard.login_history\";s:13:\"Login History\";s:23:\"dashboard.user_activity\";s:13:\"User Activity\";s:26:\"dashboard.user_preferences\";s:16:\"User Preferences\";s:32:\"dashboard.select_approval_status\";s:26:\"Select the approval status\";s:20:\"dashboard.time_spent\";s:10:\"Time Spent\";s:21:\"dashboard.quiz_scores\";s:11:\"Quiz Scores\";s:25:\"dashboard.completion_rate\";s:15:\"Completion Rate\";s:25:\"dashboard.course_progress\";s:15:\"Course Progress\";s:29:\"dashboard.certificates_issued\";s:19:\"Certificates Issued\";s:23:\"dashboard.admin_revenue\";s:13:\"Admin Revenue\";s:25:\"dashboard.payment_history\";s:15:\"Payment History\";s:26:\"dashboard.commission_rates\";s:16:\"Commission Rates\";s:26:\"dashboard.revenue_tracking\";s:16:\"Revenue Tracking\";s:28:\"dashboard.instructor_revenue\";s:18:\"Instructor Revenue\";s:33:\"dashboard.admin_revenue_this_year\";s:23:\"Admin Revenue This Year\";s:38:\"dashboard.instructor_revenue_this_year\";s:28:\"Instructor Revenue This Year\";s:24:\"dashboard.content_review\";s:14:\"Content Review\";s:25:\"dashboard.flagged_content\";s:15:\"Flagged Content\";s:26:\"dashboard.moderation_queue\";s:16:\"Moderation Queue\";s:28:\"dashboard.content_guidelines\";s:18:\"Content Guidelines\";s:19:\"dashboard.help_desk\";s:9:\"Help Desk\";s:23:\"dashboard.documentation\";s:13:\"Documentation\";s:25:\"dashboard.support_tickets\";s:15:\"Support Tickets\";s:25:\"dashboard.email_marketing\";s:15:\"Email Marketing\";s:27:\"dashboard.affiliate_program\";s:17:\"Affiliate Program\";s:27:\"dashboard.promotional_codes\";s:17:\"Promotional Codes\";s:29:\"dashboard.marketing_campaigns\";s:19:\"Marketing Campaigns\";s:24:\"dashboard.api_management\";s:14:\"API Management\";s:27:\"dashboard.external_services\";s:17:\"External Services\";s:34:\"dashboard.third_party_integrations\";s:24:\"Third Party Integrations\";s:15:\"dashboard.draft\";s:5:\"Draft\";s:16:\"dashboard.active\";s:6:\"Active\";s:18:\"dashboard.inactive\";s:8:\"Inactive\";s:19:\"dashboard.published\";s:9:\"Published\";s:25:\"dashboard.status_required\";s:8:\"Status *\";s:27:\"dashboard.category_required\";s:10:\"Category *\";s:34:\"dashboard.select_course_instructor\";s:28:\"Select the course instructor\";s:15:\"dashboard.price\";s:5:\"Price\";s:21:\"dashboard.expiry_type\";s:11:\"Expiry Type\";s:22:\"dashboard.course_level\";s:12:\"Course Level\";s:22:\"dashboard.drip_content\";s:12:\"Drip Content\";s:25:\"dashboard.course_category\";s:15:\"Course Category\";s:25:\"dashboard.course_language\";s:15:\"Course Language\";s:25:\"dashboard.expiry_duration\";s:15:\"Expiry Duration\";s:25:\"dashboard.select_category\";s:26:\"Select the course category\";s:27:\"dashboard.select_instructor\";s:28:\"Select the course instructor\";s:27:\"dashboard.type_content_here\";s:25:\"Type your content here...\";s:28:\"dashboard.enter_course_price\";s:28:\"Enter your course price ($0)\";s:28:\"dashboard.enter_course_title\";s:18:\"Enter Course Title\";s:29:\"dashboard.enable_drip_content\";s:35:\"Enable drip content for this course\";s:30:\"dashboard.enter_discount_price\";s:20:\"Enter discount price\";s:31:\"dashboard.check_course_discount\";s:33:\"Check if this course has discount\";s:31:\"dashboard.pricing_type_required\";s:14:\"Pricing type *\";s:31:\"dashboard.type_caption_optional\";s:33:\"Type caption for image (optional)\";s:33:\"dashboard.enter_short_description\";s:23:\"Enter Short Description\";s:23:\"dashboard.course_player\";s:13:\"Course Player\";s:24:\"dashboard.course_preview\";s:14:\"Course Preview\";s:29:\"dashboard.submit_for_approval\";s:19:\"Submit for Approval\";s:31:\"dashboard.course_ready_approval\";s:34:\"This course is ready for approval!\";s:32:\"dashboard.course_approval_status\";s:22:\"Course Approval Status\";s:32:\"dashboard.course_content_summary\";s:22:\"Course Content Summary\";s:32:\"dashboard.course_needs_attention\";s:54:\"This course needs attention before it can be approved:\";s:18:\"dashboard.outcomes\";s:8:\"Outcomes\";s:21:\"dashboard.course_faqs\";s:11:\"Course Faqs\";s:22:\"dashboard.requirements\";s:12:\"Requirements\";s:20:\"dashboard.edit_class\";s:10:\"Edit Class\";s:20:\"dashboard.join_class\";s:10:\"Join Class\";s:20:\"dashboard.scheduling\";s:13:\"Scheduling...\";s:21:\"dashboard.enable_zoom\";s:11:\"Enable Zoom\";s:22:\"dashboard.delete_class\";s:12:\"Delete Class\";s:22:\"dashboard.live_classes\";s:12:\"Live Classes\";s:24:\"dashboard.schedule_class\";s:14:\"Schedule Class\";s:26:\"dashboard.zoom_not_enabled\";s:81:\"Zoom is not enabled for this course. Please enable Zoom to schedule live classes.\";s:27:\"dashboard.enter_class_topic\";s:17:\"Enter class topic\";s:29:\"dashboard.schedule_live_class\";s:19:\"Schedule Live Class\";s:30:\"dashboard.class_notes_optional\";s:22:\"Class Notes (Optional)\";s:30:\"dashboard.class_topic_required\";s:13:\"Class Topic *\";s:33:\"dashboard.schedule_new_live_class\";s:23:\"Schedule New Live Class\";s:34:\"dashboard.start_date_time_required\";s:19:\"Start Date & Time *\";s:35:\"dashboard.no_live_classes_scheduled\";s:25:\"No Live Classes Scheduled\";s:35:\"dashboard.schedule_first_live_class\";s:56:\"Schedule your first live class to get started with Zoom.\";s:16:\"dashboard.banner\";s:6:\"Banner\";s:19:\"dashboard.thumbnail\";s:9:\"Thumbnail\";s:25:\"dashboard.enter_video_url\";s:15:\"Enter video URL\";s:27:\"dashboard.preview_video_url\";s:17:\"Preview Video URL\";s:28:\"dashboard.preview_video_type\";s:18:\"Preview Video Type\";s:25:\"dashboard.update_category\";s:15:\"Update Category\";s:28:\"dashboard.category_thumbnail\";s:18:\"Category Thumbnail\";s:30:\"dashboard.category_description\";s:20:\"Category Description\";s:30:\"dashboard.total_number_of_blog\";s:20:\"Total number of blog\";s:18:\"dashboard.add_blog\";s:8:\"Add Blog\";s:21:\"dashboard.blog_banner\";s:11:\"Blog Banner\";s:21:\"dashboard.media_files\";s:11:\"Media Files\";s:21:\"dashboard.update_blog\";s:11:\"Update Blog\";s:23:\"dashboard.title_80_char\";s:20:\"Title (80 Character)\";s:24:\"dashboard.blog_thumbnail\";s:14:\"Blog Thumbnail\";s:26:\"dashboard.keywords_80_char\";s:23:\"Keywords (80 Character)\";s:29:\"dashboard.enter_your_keywords\";s:19:\"Enter your keywords\";s:30:\"dashboard.provide_blog_details\";s:50:\"Provide the essential details about your blog post\";s:33:\"dashboard.write_blog_content_here\";s:31:\"Write your blog content here...\";s:38:\"dashboard.upload_banner_thumbnail_desc\";s:48:\"Upload banner and thumbnail images for your blog\";s:26:\"dashboard.subtitle_80_char\";s:23:\"Subtitle (80 Character)\";s:36:\"dashboard.enter_category_description\";s:26:\"Enter category description\";s:25:\"dashboard.lesson_duration\";s:15:\"Lesson Duration\";s:21:\"dashboard.class_notes\";s:22:\"Class Notes (Optional)\";s:21:\"dashboard.class_topic\";s:11:\"Class Topic\";s:25:\"dashboard.start_date_time\";s:17:\"Start Date & Time\";s:34:\"dashboard.zoom_not_enabled_message\";s:81:\"Zoom is not enabled for this course. Please enable Zoom to schedule live classes.\";s:14:\"dashboard.live\";s:4:\"live\";s:15:\"dashboard.ended\";s:5:\"ended\";s:18:\"dashboard.upcoming\";s:8:\"upcoming\";s:19:\"dashboard.scheduled\";s:9:\"scheduled\";s:16:\"frontend.posting\";s:10:\"Posting...\";s:16:\"frontend.replies\";s:7:\"Replies\";s:17:\"frontend.replying\";s:11:\"Replying...\";s:22:\"frontend.network_error\";s:44:\"Network error. Please check your connection.\";s:23:\"frontend.delete_warning\";s:23:\"Are you sure to delete?\";s:26:\"frontend.invalid_file_type\";s:46:\"Invalid file type. Please select a valid file.\";s:29:\"frontend.no_element_available\";s:20:\"No element available\";s:29:\"frontend.something_went_wrong\";s:39:\"Something went wrong. Please try again.\";s:12:\"frontend.all\";s:3:\"All\";s:15:\"frontend.closed\";s:6:\"Closed\";s:16:\"frontend.section\";s:7:\"Section\";s:18:\"frontend.grid_view\";s:9:\"Grid View\";s:18:\"frontend.list_view\";s:9:\"List View\";s:19:\"frontend.join_class\";s:10:\"Join Class\";s:24:\"frontend.no_lesson_found\";s:15:\"No lesson found\";s:25:\"frontend.company_fallback\";s:13:\"TechCorp Inc.\";s:26:\"frontend.notification_list\";s:17:\"Notification List\";s:27:\"frontend.section_properties\";s:18:\"Section Properties\";s:32:\"frontend.no_unread_notifications\";s:23:\"No unread notifications\";s:21:\"frontend.reply_posted\";s:25:\"Reply posted successfully\";s:22:\"frontend.email_changed\";s:26:\"Email changed successfully\";s:22:\"frontend.job_circulars\";s:13:\"Job Circulars\";s:23:\"frontend.comment_posted\";s:27:\"Comment posted successfully\";s:24:\"frontend.profile_updated\";s:28:\"Profile updated successfully\";s:25:\"frontend.password_changed\";s:29:\"Password changed successfully\";s:27:\"frontend.email_not_verified\";s:112:\"Your email is not verified yet. Please verify your email address by clicking on the link we just emailed to you.\";s:30:\"frontend.application_submitted\";s:34:\"Application submitted successfully\";s:31:\"frontend.verification_link_sent\";s:92:\"A new verification link has been sent to the email address you provided during registration.\";s:16:\"frontend.sort_by\";s:7:\"Sort by\";s:18:\"frontend.last_page\";s:9:\"Last page\";s:19:\"frontend.first_page\";s:10:\"First page\";s:23:\"frontend.privacy_policy\";s:14:\"Privacy Policy\";s:24:\"frontend.showing_results\";s:38:\"Showing :from to :to of :total results\";s:25:\"frontend.terms_of_service\";s:16:\"Terms of Service\";s:26:\"frontend.student_dashboard\";s:17:\"Student Dashboard\";s:13:\"frontend.star\";s:4:\"Star\";s:14:\"frontend.stars\";s:5:\"Stars\";s:15:\"frontend.review\";s:6:\"Review\";s:19:\"frontend.characters\";s:10:\"Characters\";s:20:\"frontend.edit_review\";s:11:\"Edit Review\";s:22:\"frontend.submit_review\";s:13:\"Submit Review\";s:23:\"frontend.you_rated_this\";s:14:\"You rated this\";s:25:\"frontend.no_courses_found\";s:16:\"No courses found\";s:26:\"frontend.no_wishlist_items\";s:23:\"No wishlist items found\";s:15:\"frontend.posted\";s:6:\"Posted\";s:17:\"frontend.day_left\";s:10:\"1 day left\";s:17:\"frontend.job_type\";s:8:\"Job Type\";s:17:\"frontend.location\";s:8:\"Location\";s:18:\"frontend.days_left\";s:15:\":days days left\";s:18:\"frontend.work_type\";s:9:\"Work Type\";s:19:\"frontend.negotiable\";s:10:\"Negotiable\";s:20:\"frontend.quick_apply\";s:11:\"Quick Apply\";s:21:\"frontend.last_updated\";s:12:\"Last updated\";s:22:\"frontend.contact_email\";s:13:\"Contact Email\";s:23:\"frontend.job_statistics\";s:14:\"Job Statistics\";s:24:\"frontend.apply_via_email\";s:15:\"Apply via Email\";s:24:\"frontend.job_description\";s:15:\"Job Description\";s:24:\"frontend.skills_required\";s:15:\"Skills Required\";s:25:\"frontend.experience_level\";s:16:\"Experience Level\";s:25:\"frontend.send_application\";s:42:\"Send your application directly to our team\";s:28:\"frontend.positions_available\";s:19:\"Positions Available\";s:29:\"frontend.application_deadline\";s:20:\"Application Deadline\";s:12:\"frontend.tax\";s:3:\"Tax\";s:14:\"frontend.total\";s:5:\"Total\";s:17:\"frontend.discount\";s:8:\"Discount\";s:18:\"frontend.sub_total\";s:9:\"Sub total\";s:19:\"frontend.cart_items\";s:10:\"Cart items\";s:24:\"frontend.payment_summary\";s:15:\"Payment summary\";s:27:\"frontend.your_cart_is_empty\";s:18:\"Your cart is empty\";s:13:\"frontend.like\";s:4:\"like\";s:16:\"frontend.dislike\";s:7:\"dislike\";s:18:\"frontend.all_blogs\";s:9:\"All Blogs\";s:19:\"frontend.author_alt\";s:6:\"Author\";s:22:\"frontend.blog_list_alt\";s:9:\"Blog List\";s:23:\"frontend.post_a_comment\";s:14:\"Post A Comment\";s:24:\"frontend.blog_banner_alt\";s:11:\"Blog banner\";s:24:\"frontend.no_comments_yet\";s:41:\"No comments yet. Be the first to comment!\";s:26:\"frontend.default_site_name\";s:33:\"Mentor Learning Management System\";s:26:\"frontend.latest_blog_posts\";s:17:\"Latest Blog Posts\";s:27:\"frontend.blog_page_keywords\";s:60:\"blogs, articles, tutorials, news, posts, learning, education\";s:27:\"frontend.blog_thumbnail_alt\";s:14:\"Blog thumbnail\";s:30:\"frontend.blog_page_description\";s:121:\"Read :total+ articles and tutorials from our instructors and team. Stay updated with insights, news, and how‑to guides.\";s:33:\"frontend.author_initials_fallback\";s:2:\"AU\";s:18:\"frontend.try_again\";s:9:\"Try Again\";s:24:\"frontend.joining_meeting\";s:18:\"Joining Meeting...\";s:25:\"frontend.loading_zoom_sdk\";s:19:\"Loading Zoom SDK...\";s:25:\"frontend.open_in_zoom_app\";s:16:\"Open in Zoom App\";s:28:\"frontend.zoom_sdk_not_loaded\";s:19:\"Zoom SDK not loaded\";s:30:\"frontend.you_can_join_directly\";s:28:\"You can join directly using:\";s:31:\"frontend.failed_to_join_meeting\";s:22:\"Failed to join meeting\";s:31:\"frontend.unable_to_join_meeting\";s:22:\"Unable to Join Meeting\";s:32:\"frontend.zoom_sdk_not_configured\";s:54:\"Zoom SDK not configured. Please contact administrator.\";s:37:\"frontend.failed_to_initialize_meeting\";s:28:\"Failed to initialize meeting\";s:38:\"frontend.meeting_information_not_found\";s:30:\"Meeting information not found.\";s:44:\"frontend.failed_to_get_meeting_configuration\";s:35:\"Failed to get meeting configuration\";s:21:\"frontend.completed_on\";s:19:\"Completed on: :date\";s:24:\"frontend.download_format\";s:15:\"Download Format\";s:30:\"frontend.pdf_certificate_saved\";s:61:\"Your PDF certificate has been saved to your downloads folder.\";s:30:\"frontend.png_certificate_saved\";s:61:\"Your PNG certificate has been saved to your downloads folder.\";s:31:\"frontend.authorized_certificate\";s:37:\"Authorized Certificate of Achievement\";s:32:\"frontend.certificate_description\";s:219:\"This certificate is proudly presented to acknowledge the successful completion of all course requirements and demonstrates a strong commitment to professional development and learning excellence. This is to certify that\";s:34:\"frontend.certificate_of_completion\";s:25:\"Certificate of Completion\";s:35:\"frontend.has_successfully_completed\";s:37:\"has successfully completed the course\";s:36:\"frontend.course_certificate_download\";s:27:\"Course Certificate Download\";s:38:\"frontend.download_official_certificate\";s:52:\"Download your official course completion certificate\";s:13:\"frontend.true\";s:4:\"True\";s:14:\"frontend.false\";s:5:\"False\";s:14:\"frontend.hours\";s:5:\"Hours\";s:15:\"frontend.passed\";s:6:\"Passed\";s:15:\"frontend.result\";s:6:\"Result\";s:15:\"frontend.retake\";s:6:\"Retake\";s:16:\"frontend.minutes\";s:7:\"Minutes\";s:16:\"frontend.seconds\";s:7:\"Seconds\";s:16:\"frontend.summery\";s:7:\"Summery\";s:17:\"frontend.duration\";s:8:\"Duration\";s:19:\"frontend.not_passed\";s:10:\"Not Passed\";s:19:\"frontend.pass_marks\";s:10:\"Pass Marks\";s:19:\"frontend.start_quiz\";s:10:\"Start Quiz\";s:20:\"frontend.retake_quiz\";s:11:\"Retake Quiz\";s:20:\"frontend.total_marks\";s:11:\"Total Marks\";s:23:\"frontend.quiz_submitted\";s:14:\"Quiz Submitted\";s:24:\"frontend.correct_answers\";s:15:\"Correct Answers\";s:24:\"frontend.retake_attempts\";s:15:\"Retake Attempts\";s:24:\"frontend.total_questions\";s:15:\"Total Questions\";s:26:\"frontend.incorrect_answers\";s:17:\"Incorrect Answers\";s:17:\"frontend.document\";s:8:\"Document\";s:17:\"frontend.download\";s:8:\"Download\";s:21:\"frontend.pdf_document\";s:12:\"PDF Document\";s:22:\"frontend.text_document\";s:13:\"Text Document\";s:24:\"frontend.open_in_new_tab\";s:15:\"Open in new tab\";s:26:\"frontend.download_document\";s:17:\"Download document\";s:31:\"frontend.open_in_new_tab_button\";s:15:\"Open in New Tab\";s:36:\"frontend.unsupported_document_format\";s:27:\"Unsupported Document Format\";s:44:\"frontend.document_format_cannot_be_previewed\";s:126:\"This document format (.{extension}) cannot be previewed directly. You can download it to view with an appropriate application.\";s:13:\"frontend.free\";s:4:\"Free\";s:14:\"frontend.level\";s:5:\"Level\";s:17:\"frontend.language\";s:8:\"Language\";s:17:\"frontend.outcomes\";s:8:\"Outcomes\";s:17:\"frontend.students\";s:8:\"Students\";s:21:\"frontend.requirements\";s:12:\"Requirements\";s:21:\"frontend.view_details\";s:12:\"View Details\";s:22:\"frontend.expiry_period\";s:13:\"Expiry Period\";s:23:\"frontend.default_author\";s:5:\"UiLib\";s:24:\"frontend.student_reviews\";s:15:\"Student Reviews\";s:25:\"frontend.no_reviews_found\";s:17:\"No reviews found.\";s:26:\"frontend.course_curriculum\";s:17:\"Course curriculum\";s:26:\"frontend.enrolled_students\";s:17:\"Enrolled Students\";s:27:\"frontend.course_certificate\";s:18:\"Course Certificate\";s:29:\"frontend.certificate_included\";s:20:\"Certificate Included\";s:33:\"frontend.there_is_no_lesson_added\";s:24:\"There is no lesson added\";s:35:\"frontend.learn_comprehensive_course\";s:35:\"Learn with our comprehensive course\";s:35:\"frontend.online_course_learning_lms\";s:28:\"online course, learning, LMS\";s:16:\"frontend.buy_now\";s:7:\"Buy Now\";s:19:\"frontend.enroll_now\";s:10:\"Enroll Now\";s:20:\"frontend.add_to_cart\";s:11:\"Add to cart\";s:20:\"frontend.play_course\";s:11:\"Play Course\";s:22:\"frontend.course_player\";s:13:\"Course Player\";s:24:\"frontend.add_to_wishlist\";s:15:\"Add to Wishlist\";s:29:\"frontend.remove_from_wishlist\";s:20:\"Remove from Wishlist\";s:13:\"frontend.next\";s:4:\"Next\";s:13:\"frontend.prev\";s:4:\"Prev\";s:25:\"frontend.go_to_page_colon\";s:11:\"Go to page:\";s:16:\"frontend.student\";s:7:\"Student\";s:17:\"frontend.progress\";s:8:\"Progress\";s:17:\"frontend.trending\";s:8:\"Trending\";s:23:\"frontend.course_details\";s:14:\"Course Details\";s:16:\"frontend.courses\";s:7:\"Courses\";s:16:\"frontend.lessons\";s:7:\"Lessons\";s:17:\"frontend.view_all\";s:8:\"View All\";s:18:\"frontend.dashboard\";s:9:\"Dashboard\";s:19:\"frontend.enrollment\";s:10:\"Enrollment\";s:19:\"frontend.no_results\";s:11:\"No results.\";s:22:\"frontend.course_status\";s:13:\"Course Status\";s:42:\"frontend.latest_pending_withdrawal_request\";s:33:\"Latest Pending Withdrawal Request\";s:19:\"frontend.click_here\";s:10:\"Click here\";s:20:\"frontend.admin_setup\";s:11:\"Admin Setup\";s:22:\"frontend.php_extension\";s:13:\"PHP Extension\";s:23:\"frontend.setup_complete\";s:14:\"Setup complete\";s:24:\"frontend.important_notes\";s:15:\"Important Notes\";s:24:\"frontend.test_connection\";s:15:\"Test Connection\";s:25:\"frontend.symlink_function\";s:16:\"Symlink Function\";s:25:\"frontend.symlink_required\";s:86:\"Required for Laravel\'s storage:link command to make uploaded files publicly accessible\";s:26:\"frontend.environment_setup\";s:17:\"Environment Setup\";s:28:\"frontend.database_connection\";s:19:\"Database Connection\";s:28:\"frontend.get_back_to_project\";s:28:\"to get back to your project.\";s:34:\"frontend.environment_variables_set\";s:64:\"Your changed environment variables are set in the .env file now.\";s:36:\"frontend.server_requirements_not_met\";s:51:\"Your server doesn\'t meet the following requirements\";s:17:\"frontend.days_ago\";s:14:\":days days ago\";s:17:\"frontend.hour_ago\";s:10:\"1 hour ago\";s:17:\"frontend.just_now\";s:8:\"Just now\";s:17:\"frontend.week_ago\";s:10:\"1 week ago\";s:17:\"frontend.year_ago\";s:10:\"1 year ago\";s:18:\"frontend.hours_ago\";s:16:\":hours hours ago\";s:18:\"frontend.month_ago\";s:11:\"1 month ago\";s:18:\"frontend.weeks_ago\";s:16:\":weeks weeks ago\";s:18:\"frontend.years_ago\";s:16:\":years years ago\";s:19:\"frontend.minute_ago\";s:12:\"1 minute ago\";s:19:\"frontend.months_ago\";s:18:\":months months ago\";s:20:\"frontend.minutes_ago\";s:20:\":minutes minutes ago\";s:11:\"input.email\";s:5:\"Email\";s:11:\"input.phone\";s:5:\"Phone\";s:14:\"input.password\";s:8:\"Password\";s:14:\"input.username\";s:8:\"Username\";s:15:\"input.from_name\";s:9:\"From Name\";s:15:\"input.full_name\";s:9:\"Full Name\";s:15:\"input.new_email\";s:9:\"New Email\";s:16:\"input.your_email\";s:10:\"Your Email\";s:17:\"input.profile_url\";s:11:\"Profile URL\";s:17:\"input.remember_me\";s:11:\"Remember me\";s:18:\"input.from_address\";s:12:\"From Address\";s:18:\"input.new_password\";s:12:\"New Password\";s:18:\"input.system_email\";s:12:\"System Email\";s:19:\"input.account_email\";s:13:\"Account Email\";s:19:\"input.contact_email\";s:13:\"Contact Email\";s:19:\"input.current_email\";s:13:\"Current Email\";s:19:\"input.email_address\";s:13:\"Email address\";s:22:\"input.confirm_password\";s:16:\"Confirm password\";s:22:\"input.current_password\";s:16:\"Current Password\";s:26:\"input.confirm_new_password\";s:20:\"Confirm New Password\";s:9:\"input.url\";s:3:\"URL\";s:10:\"input.icon\";s:4:\"Icon\";s:10:\"input.name\";s:4:\"Name\";s:10:\"input.slug\";s:4:\"Slug\";s:10:\"input.tags\";s:4:\"Tags\";s:11:\"input.title\";s:5:\"Title\";s:12:\"input.active\";s:6:\"Active\";s:12:\"input.author\";s:6:\"Author\";s:12:\"input.banner\";s:6:\"Banner\";s:12:\"input.slogan\";s:6:\"Slogan\";s:12:\"input.status\";s:6:\"Status\";s:14:\"input.og_title\";s:8:\"OG Title\";s:14:\"input.url_slug\";s:8:\"URL Slug\";s:15:\"input.sub_title\";s:9:\"Sub Title\";s:15:\"input.thumbnail\";s:9:\"Thumbnail\";s:16:\"input.list_items\";s:10:\"List Items\";s:16:\"input.meta_title\";s:10:\"Meta Title\";s:17:\"input.action_type\";s:11:\"Action Type\";s:17:\"input.description\";s:11:\"Description\";s:19:\"input.meta_keywords\";s:13:\"Meta Keywords\";s:20:\"input.dropdown_items\";s:14:\"Dropdown Items\";s:20:\"input.og_description\";s:14:\"OG Description\";s:22:\"input.background_color\";s:16:\"Background Color\";s:22:\"input.background_image\";s:16:\"Background Image\";s:22:\"input.meta_description\";s:16:\"Meta Description\";s:11:\"input.price\";s:5:\"Price\";s:12:\"input.select\";s:6:\"Select\";s:13:\"input.made_in\";s:7:\"Made in\";s:13:\"input.summary\";s:7:\"Summary\";s:14:\"input.duration\";s:8:\"Duration\";s:15:\"input.video_url\";s:9:\"Video URL\";s:17:\"input.class_notes\";s:22:\"Class Notes (Optional)\";s:17:\"input.class_topic\";s:11:\"Class Topic\";s:17:\"input.course_name\";s:11:\"Course Name\";s:17:\"input.expiry_date\";s:11:\"Expiry date\";s:17:\"input.lesson_type\";s:11:\"Lesson type\";s:17:\"input.requirement\";s:11:\"Requirement\";s:18:\"input.course_level\";s:12:\"Course level\";s:18:\"input.embed_source\";s:12:\"Embed source\";s:18:\"input.pricing_type\";s:12:\"Pricing type\";s:18:\"input.select_image\";s:12:\"Select image\";s:18:\"input.select_video\";s:12:\"Select video\";s:18:\"input.student_name\";s:12:\"Student Name\";s:19:\"input.preview_video\";s:13:\"Preview Video\";s:21:\"input.completion_date\";s:15:\"Completion Date\";s:21:\"input.course_discount\";s:15:\"Course Discount\";s:21:\"input.course_language\";s:15:\"Course Language\";s:21:\"input.download_format\";s:15:\"Download Format\";s:21:\"input.enrollment_type\";s:15:\"Enrollment Type\";s:21:\"input.select_document\";s:15:\"Select document\";s:21:\"input.select_provider\";s:15:\"Select Provider\";s:21:\"input.start_date_time\";s:17:\"Start Date & Time\";s:22:\"input.certificate_size\";s:16:\"Certificate Size\";s:23:\"input.course_instructor\";s:17:\"Course Instructor\";s:23:\"input.short_description\";s:17:\"Short Description\";s:24:\"input.expiry_period_type\";s:18:\"Expiry period type\";s:24:\"input.preview_video_type\";s:18:\"Preview Video Type\";s:24:\"input.video_url_provider\";s:18:\"Video URL Provider\";s:25:\"input.enable_drip_content\";s:19:\"Enable drip content\";s:11:\"input.hours\";s:5:\"Hours\";s:12:\"input.answer\";s:6:\"Answer\";s:12:\"input.rating\";s:6:\"Rating\";s:13:\"input.minutes\";s:7:\"Minutes\";s:13:\"input.options\";s:7:\"Options\";s:13:\"input.outcome\";s:7:\"Outcome\";s:13:\"input.seconds\";s:7:\"Seconds\";s:14:\"input.feedback\";s:8:\"Feedback\";s:14:\"input.keywords\";s:8:\"Keywords\";s:14:\"input.question\";s:8:\"Question\";s:15:\"input.pass_mark\";s:9:\"Pass Mark\";s:15:\"input.your_text\";s:15:\"Enter your text\";s:16:\"input.total_mark\";s:10:\"Total Mark\";s:17:\"input.your_review\";s:11:\"Your Review\";s:19:\"input.question_type\";s:13:\"Question Type\";s:19:\"input.section_title\";s:13:\"Section Title\";s:20:\"input.question_title\";s:14:\"Question Title\";s:21:\"input.retake_attempts\";s:15:\"Retake Attempts\";s:24:\"input.title_80_character\";s:20:\"Title (80 Character)\";s:27:\"input.keywords_80_character\";s:23:\"Keywords (80 Character)\";s:27:\"input.subtitle_80_character\";s:23:\"Subtitle (80 Character)\";s:12:\"input.resume\";s:6:\"Resume\";s:12:\"input.skills\";s:6:\"Skills\";s:14:\"input.currency\";s:8:\"Currency\";s:14:\"input.job_type\";s:8:\"Job Type\";s:14:\"input.location\";s:8:\"Location\";s:15:\"input.biography\";s:9:\"Biography\";s:15:\"input.job_title\";s:9:\"Job Title\";s:15:\"input.work_type\";s:9:\"Work Type\";s:17:\"input.designation\";s:11:\"Designation\";s:20:\"input.maximum_salary\";s:14:\"Maximum Salary\";s:20:\"input.minimum_salary\";s:14:\"Minimum Salary\";s:21:\"input.job_description\";s:15:\"Job Description\";s:21:\"input.skills_required\";s:15:\"Skills Required\";s:22:\"input.experience_level\";s:16:\"Experience Level\";s:25:\"input.positions_available\";s:19:\"Positions Available\";s:26:\"input.application_deadline\";s:20:\"Application Deadline\";s:26:\"input.salary_is_negotiable\";s:20:\"Salary is Negotiable\";s:10:\"input.host\";s:4:\"Host\";s:10:\"input.port\";s:4:\"Port\";s:12:\"input.amount\";s:6:\"Amount\";s:13:\"input.api_key\";s:7:\"API Key\";s:13:\"input.send_to\";s:7:\"Send To\";s:13:\"input.subject\";s:7:\"Subject\";s:14:\"input.store_id\";s:8:\"Store ID\";s:15:\"input.client_id\";s:9:\"Client ID\";s:16:\"input.account_id\";s:10:\"Account ID\";s:16:\"input.api_secret\";s:10:\"API Secret\";s:16:\"input.encryption\";s:10:\"Encryption\";s:16:\"input.secret_key\";s:10:\"Secret Key\";s:17:\"input.bucket_name\";s:11:\"Bucket Name\";s:17:\"input.mail_driver\";s:11:\"Mail Driver\";s:18:\"input.live_api_key\";s:12:\"Live API Key\";s:18:\"input.test_api_key\";s:12:\"Test API Key\";s:19:\"input.access_key_id\";s:13:\"Access Key ID\";s:19:\"input.client_secret\";s:13:\"Client Secret\";s:20:\"input.default_region\";s:14:\"Default Region\";s:20:\"input.storage_driver\";s:14:\"Storage Driver\";s:20:\"input.store_password\";s:14:\"Store Password\";s:20:\"input.webhook_secret\";s:14:\"Webhook Secret\";s:21:\"input.live_public_key\";s:15:\"Live Public Key\";s:21:\"input.live_secret_key\";s:15:\"Live Secret Key\";s:21:\"input.public_live_key\";s:15:\"Public Live Key\";s:21:\"input.public_test_key\";s:15:\"Public Test Key\";s:21:\"input.secret_live_key\";s:15:\"Secret Live Key\";s:21:\"input.secret_test_key\";s:15:\"Secret Test Key\";s:21:\"input.test_public_key\";s:15:\"Test Public Key\";s:21:\"input.test_secret_key\";s:15:\"Test Secret Key\";s:23:\"input.sandbox_client_id\";s:17:\"Sandbox Client ID\";s:23:\"input.secret_access_key\";s:17:\"Secret Access Key\";s:24:\"input.sandbox_secret_key\";s:18:\"Sandbox Secret Key\";s:26:\"input.production_client_id\";s:20:\"Production Client ID\";s:27:\"input.meeting_sdk_client_id\";s:21:\"Meeting SDK Client ID\";s:27:\"input.production_secret_key\";s:21:\"Production Secret Key\";s:29:\"input.do_you_want_use_web_sdk\";s:47:\"Do you want to use Web SDK for your live class?\";s:31:\"input.meeting_sdk_client_secret\";s:25:\"Meeting SDK Client Secret\";s:12:\"input.coupon\";s:6:\"Coupon\";s:12:\"input.github\";s:6:\"GitHub\";s:13:\"input.favicon\";s:7:\"Favicon\";s:13:\"input.twitter\";s:7:\"Twitter\";s:13:\"input.website\";s:7:\"Website\";s:14:\"input.category\";s:8:\"Category\";s:14:\"input.facebook\";s:8:\"Facebook\";s:14:\"input.linkedin\";s:8:\"LinkedIn\";s:15:\"input.logo_dark\";s:9:\"Logo Dark\";s:15:\"input.mail_host\";s:9:\"Mail Host\";s:15:\"input.mail_port\";s:9:\"Mail Port\";s:16:\"input.logo_light\";s:10:\"Logo Light\";s:17:\"input.blog_banner\";s:11:\"Blog Banner\";s:18:\"input.website_name\";s:12:\"Website Name\";s:19:\"input.category_icon\";s:13:\"Category Icon\";s:19:\"input.mail_password\";s:13:\"Mail Password\";s:19:\"input.mail_username\";s:13:\"Mail Username\";s:19:\"input.page_contents\";s:13:\"Page Contents\";s:19:\"input.select_option\";s:16:\"Select an option\";s:19:\"input.website_title\";s:13:\"Website Title\";s:20:\"input.blog_thumbnail\";s:14:\"Blog Thumbnail\";s:20:\"input.mail_from_name\";s:14:\"Mail From Name\";s:21:\"input.category_status\";s:15:\"Category Status\";s:21:\"input.mail_encryption\";s:15:\"Mail Encryption\";s:21:\"input.select_zip_file\";s:23:\"Select File (.zip only)\";s:22:\"input.google_client_id\";s:16:\"Google Client ID\";s:23:\"input.aws_access_key_id\";s:17:\"AWS Access Key ID\";s:23:\"input.mail_from_address\";s:17:\"Mail From Address\";s:24:\"input.aws_default_region\";s:18:\"AWS Default Region\";s:24:\"input.course_selling_tax\";s:22:\"Course Selling Tax (%)\";s:24:\"input.instructor_revenue\";s:22:\"Instructor Revenue (%)\";s:25:\"input.google_redirect_uri\";s:19:\"Google Redirect URI\";s:26:\"input.google_client_secret\";s:20:\"Google Client Secret\";s:28:\"input.merchant_id_public_key\";s:22:\"Merchant ID/Public Key\";s:29:\"input.course_selling_currency\";s:23:\"Course Selling Currency\";s:29:\"input.merchant_key_secret_key\";s:23:\"Merchant Key/Secret Key\";s:23:\"input.email_placeholder\";s:17:\"email@example.com\";s:26:\"input.password_placeholder\";s:14:\"Enter password\";s:26:\"input.username_placeholder\";s:14:\"Enter username\";s:27:\"input.full_name_placeholder\";s:20:\"Enter your full name\";s:27:\"input.new_email_placeholder\";s:20:\"Enter your new email\";s:27:\"input.your_name_placeholder\";s:15:\"Enter your name\";s:29:\"input.system_type_placeholder\";s:18:\"Select System Type\";s:30:\"input.new_password_placeholder\";s:23:\"Enter your new password\";s:30:\"input.phone_number_placeholder\";s:18:\"Enter Phone Number\";s:31:\"input.contact_email_placeholder\";s:14:\"hr@company.com\";s:31:\"input.current_email_placeholder\";s:24:\"Enter your current email\";s:34:\"input.confirm_password_placeholder\";s:16:\"Confirm password\";s:34:\"input.current_password_placeholder\";s:27:\"Enter your current password\";s:34:\"input.rewrite_password_placeholder\";s:25:\"Rewrite your new password\";s:21:\"input.url_placeholder\";s:47:\"Enter URL (e.g., /courses, https://example.com)\";s:22:\"input.icon_placeholder\";s:14:\"Pick your icon\";s:22:\"input.name_placeholder\";s:15:\"Enter your name\";s:22:\"input.slug_placeholder\";s:17:\"Enter unique slug\";s:22:\"input.tags_placeholder\";s:13:\"Enter tags...\";s:23:\"input.title_placeholder\";s:11:\"Enter title\";s:24:\"input.status_placeholder\";s:13:\"Select status\";s:25:\"input.caption_placeholder\";s:33:\"Type caption for image (optional)\";s:26:\"input.og_title_placeholder\";s:14:\"Enter OG Title\";s:27:\"input.image_url_placeholder\";s:17:\"Image URL or path\";s:27:\"input.page_name_placeholder\";s:15:\"Enter Page Name\";s:27:\"input.page_slug_placeholder\";s:15:\"Enter Page Slug\";s:28:\"input.meta_title_placeholder\";s:16:\"Enter Meta Title\";s:28:\"input.page_title_placeholder\";s:16:\"Enter Page Title\";s:29:\"input.action_type_placeholder\";s:18:\"Select action type\";s:29:\"input.description_placeholder\";s:17:\"Enter description\";s:30:\"input.content_here_placeholder\";s:25:\"Type your content here...\";s:31:\"input.meta_keywords_placeholder\";s:19:\"Enter Meta Keywords\";s:31:\"input.section_title_placeholder\";s:24:\"Enter your section title\";s:32:\"input.og_description_placeholder\";s:20:\"Enter OG Description\";s:34:\"input.meta_description_placeholder\";s:22:\"Enter Meta Description\";s:26:\"input.category_placeholder\";s:17:\"Select a category\";s:26:\"input.duration_placeholder\";s:8:\"00:00:00\";s:26:\"input.provider_placeholder\";s:17:\"Select a provider\";s:27:\"input.video_url_placeholder\";s:20:\"Enter your video url\";s:28:\"input.instructor_placeholder\";s:28:\"Select the course instructor\";s:28:\"input.quiz_title_placeholder\";s:16:\"Enter quiz title\";s:29:\"input.class_topic_placeholder\";s:17:\"Enter class topic\";s:29:\"input.course_name_placeholder\";s:21:\"Enter the course name\";s:30:\"input.course_level_placeholder\";s:24:\"Select your course level\";s:30:\"input.course_price_placeholder\";s:28:\"Enter your course price ($0)\";s:30:\"input.course_title_placeholder\";s:18:\"Enter Course Title\";s:30:\"input.embed_source_placeholder\";s:26:\"Enter the embed source url\";s:30:\"input.lesson_title_placeholder\";s:12:\"Lesson title\";s:32:\"input.discount_price_placeholder\";s:30:\"Enter your discount price ($0)\";s:32:\"input.type_video_url_placeholder\";s:19:\"Type your video url\";s:33:\"input.approval_status_placeholder\";s:26:\"Select the approval status\";s:33:\"input.course_language_placeholder\";s:27:\"Select your course language\";s:34:\"input.certificate_size_placeholder\";s:23:\"Select certificate size\";s:35:\"input.short_description_placeholder\";s:23:\"Enter Short Description\";s:26:\"input.currency_placeholder\";s:20:\"Select your currency\";s:26:\"input.location_placeholder\";s:23:\"e.g., Dhaka, Bangladesh\";s:26:\"input.url_slug_placeholder\";s:22:\"senior-react-developer\";s:27:\"input.biography_placeholder\";s:20:\"Write about yourself\";s:27:\"input.job_title_placeholder\";s:28:\"e.g., Senior React Developer\";s:28:\"input.skills_tag_placeholder\";s:25:\"Enter the skills as a tag\";s:29:\"input.designation_placeholder\";s:22:\"Enter your designation\";s:32:\"input.about_yourself_placeholder\";s:20:\"Write about yourself\";s:32:\"input.maximum_salary_placeholder\";s:20:\"Enter maximum salary\";s:32:\"input.minimum_salary_placeholder\";s:20:\"Enter minimum salary\";s:33:\"input.job_description_placeholder\";s:101:\"Provide a detailed description of the role, expectations, and what makes this opportunity exciting...\";s:24:\"input.coupon_placeholder\";s:12:\"Enter coupon\";s:25:\"input.api_key_placeholder\";s:13:\"Enter api key\";s:28:\"input.api_secret_placeholder\";s:16:\"Enter api secret\";s:29:\"input.your_amount_placeholder\";s:17:\"Enter your amount\";s:30:\"input.live_api_key_placeholder\";s:18:\"Enter live api key\";s:30:\"input.test_api_key_placeholder\";s:18:\"Enter test api key\";s:32:\"input.webhook_secret_placeholder\";s:20:\"Enter webhook secret\";s:33:\"input.live_public_key_placeholder\";s:21:\"Enter live public key\";s:33:\"input.live_secret_key_placeholder\";s:21:\"Enter live secret key\";s:33:\"input.test_public_key_placeholder\";s:21:\"Enter test public key\";s:33:\"input.test_secret_key_placeholder\";s:21:\"Enter test secret key\";s:35:\"input.paytm_merchant_id_placeholder\";s:23:\"Enter Paytm merchant ID\";s:35:\"input.sandbox_client_id_placeholder\";s:23:\"Enter sandbox client ID\";s:36:\"input.paytm_merchant_key_placeholder\";s:24:\"Enter Paytm merchant key\";s:36:\"input.sandbox_secret_key_placeholder\";s:24:\"Enter sandbox secret key\";s:37:\"input.mollie_live_api_key_placeholder\";s:25:\"Enter Mollie live api key\";s:37:\"input.mollie_test_api_key_placeholder\";s:25:\"Enter Mollie test api key\";s:37:\"input.razorpay_public_key_placeholder\";s:25:\"Enter Razorpay public key\";s:37:\"input.razorpay_secret_key_placeholder\";s:25:\"Enter Razorpay secret key\";s:38:\"input.production_client_id_placeholder\";s:26:\"Enter production client ID\";s:39:\"input.production_secret_key_placeholder\";s:27:\"Enter production secret key\";s:39:\"input.sslcommerz_public_key_placeholder\";s:27:\"Enter SSLCommerz public key\";s:39:\"input.sslcommerz_secret_key_placeholder\";s:27:\"Enter SSLCommerz secret key\";s:23:\"input.https_placeholder\";s:19:\"https://example.com\";s:26:\"input.keywords_placeholder\";s:14:\"Enter Keywords\";s:26:\"input.port_587_placeholder\";s:3:\"587\";s:27:\"input.mail_host_placeholder\";s:16:\"smtp.example.com\";s:27:\"input.mail_port_placeholder\";s:3:\"587\";s:28:\"input.encryption_placeholder\";s:17:\"Select Encryption\";s:29:\"input.author_name_placeholder\";s:17:\"Enter Author Name\";s:29:\"input.bucket_name_placeholder\";s:17:\"Enter Bucket Name\";s:29:\"input.mail_driver_placeholder\";s:18:\"Select Mail Driver\";s:29:\"input.select_logo_placeholder\";s:11:\"Select Logo\";s:29:\"input.select_user_placeholder\";s:13:\"Select a user\";s:30:\"input.smtp_example_placeholder\";s:16:\"smtp.example.com\";s:30:\"input.system_email_placeholder\";s:18:\"Enter System Email\";s:30:\"input.website_name_placeholder\";s:18:\"Enter Website Name\";s:31:\"input.access_key_id_placeholder\";s:19:\"Enter Access Key ID\";s:31:\"input.mail_password_placeholder\";s:24:\"Enter your mail password\";s:31:\"input.mail_username_placeholder\";s:22:\"your-email@example.com\";s:31:\"input.select_banner_placeholder\";s:13:\"Select Banner\";s:31:\"input.select_course_placeholder\";s:15:\"Select a course\";s:31:\"input.website_title_placeholder\";s:19:\"Enter Website Title\";s:32:\"input.default_region_placeholder\";s:20:\"Enter Default Region\";s:32:\"input.mail_from_name_placeholder\";s:21:\"Your Application Name\";s:32:\"input.select_favicon_placeholder\";s:14:\"Select Favicon\";s:32:\"input.storage_driver_placeholder\";s:21:\"Select Storage Driver\";s:32:\"input.website_slogan_placeholder\";s:20:\"Enter Website Slogan\";s:32:\"input.zoom_client_id_placeholder\";s:25:\"Enter your Zoom client ID\";s:33:\"input.noreply_example_placeholder\";s:19:\"noreply@example.com\";s:33:\"input.zoom_account_id_placeholder\";s:26:\"Enter your Zoom account ID\";s:34:\"input.google_client_id_placeholder\";s:27:\"Enter your google client id\";s:34:\"input.selling_currency_placeholder\";s:23:\"Select Selling Currency\";s:35:\"input.aws_access_key_id_placeholder\";s:23:\"Enter AWS Access Key ID\";s:35:\"input.mail_from_address_placeholder\";s:19:\"noreply@example.com\";s:35:\"input.secret_access_key_placeholder\";s:23:\"Enter Secret Access Key\";s:35:\"input.your_company_name_placeholder\";s:17:\"Your Company Name\";s:36:\"input.aws_default_region_placeholder\";s:9:\"us-east-1\";s:36:\"input.revenue_percentage_placeholder\";s:35:\"Enter Instructor Revenue Percentage\";s:36:\"input.zoom_account_email_placeholder\";s:29:\"Enter your Zoom account email\";s:36:\"input.zoom_client_secret_placeholder\";s:29:\"Enter your Zoom client secret\";s:37:\"input.google_redirect_url_placeholder\";s:30:\"Enter your google redirect url\";s:37:\"input.website_description_placeholder\";s:25:\"Enter Website Description\";s:38:\"input.google_client_secret_placeholder\";s:31:\"Enter your google client secret\";s:39:\"input.meeting_sdk_client_id_placeholder\";s:32:\"Enter your Meeting SDK client ID\";s:40:\"input.selling_tax_percentage_placeholder\";s:28:\"Enter Selling Tax Percentage\";s:43:\"input.meeting_sdk_client_secret_placeholder\";s:36:\"Enter your Meeting SDK client secret\";s:9:\"table.csv\";s:3:\"CSV\";s:10:\"table.type\";s:4:\"Type\";s:12:\"table.resume\";s:6:\"Resume\";s:13:\"table.no_data\";s:17:\"No data available\";s:14:\"table.previous\";s:4:\"Prev\";s:16:\"table.go_to_page\";s:11:\"Go to page:\";s:17:\"table.view_resume\";s:11:\"View Resume\";s:19:\"table.total_results\";s:13:\"Total results\";s:21:\"table.img_placeholder\";s:3:\"IMG\";s:21:\"table.showing_results\";s:15:\"Showing results\";s:27:\"table.delete_course_warning\";s:137:\"After deleting the course, all the related data, like, course sections, lessons, quizzes, enrollments, etc will be deleted automatically.\";s:31:\"table.delete_instructor_warning\";s:116:\"After deleting the instructor, the admin will be the assign as a new instructor, of this instructor all the courses.\";s:10:\"table.name\";s:4:\"Name\";s:10:\"table.role\";s:4:\"Role\";s:10:\"table.slug\";s:4:\"Slug\";s:11:\"table.email\";s:5:\"Email\";s:11:\"table.title\";s:5:\"Title\";s:13:\"table.creator\";s:7:\"Creator\";s:14:\"table.sections\";s:8:\"Sections\";s:14:\"table.use_case\";s:8:\"Use Case\";s:17:\"table.enrollments\";s:11:\"Enrollments\";s:17:\"table.expiry_date\";s:11:\"Expiry Date\";s:17:\"table.payout_date\";s:11:\"Payout Date\";s:18:\"table.course_title\";s:12:\"Course Title\";s:19:\"table.category_name\";s:13:\"Category Name\";s:19:\"table.enrolled_date\";s:13:\"Enrolled Date\";s:19:\"table.meta_keywords\";s:13:\"Meta Keywords\";s:19:\"table.payout_amount\";s:13:\"Payout amount\";s:19:\"table.payout_method\";s:13:\"Payout Method\";s:20:\"table.category_child\";s:14:\"Category Child\";s:20:\"table.processed_date\";s:14:\"Processed Date\";s:21:\"table.enrolled_course\";s:15:\"Enrolled Course\";s:22:\"table.meta_description\";s:16:\"Meta Description\";s:22:\"table.number_of_course\";s:16:\"Number Of Course\";s:12:\"table.action\";s:6:\"Action\";s:12:\"table.status\";s:6:\"Status\";s:18:\"table.custom_pages\";s:12:\"Custom Pages\";s:21:\"table.add_custom_page\";s:15:\"Add Custom Page\";s:9:\"table.pay\";s:3:\"Pay\";s:11:\"table.print\";s:5:\"Print\";s:12:\"table.select\";s:6:\"Select\";s:14:\"table.copy_url\";s:8:\"Copy URL\";s:14:\"table.selected\";s:8:\"Selected\";s:15:\"table.edit_page\";s:9:\"Edit Page\";s:18:\"table.preview_page\";s:12:\"Preview Page\";s:21:\"table.lifetime_access\";s:15:\"Lifetime access\";s:16:\"table.url_copied\";s:23:\"URL copied to clipboard\";s:28:\"table.best_single_instructor\";s:26:\"Best for Single Instructor\";s:31:\"table.best_multiple_instructors\";s:29:\"Best for Multiple Instructors\";s:21:\"settings.social_links\";s:12:\"Social Links\";s:22:\"settings.page_settings\";s:13:\"Page Settings\";s:22:\"settings.smtp_settings\";s:13:\"SMTP Settings\";s:24:\"settings.system_settings\";s:15:\"System Settings\";s:25:\"settings.account_settings\";s:16:\"Account Settings\";s:25:\"settings.payment_gateways\";s:16:\"Payment Gateways\";s:25:\"settings.storage_settings\";s:16:\"Storage Settings\";s:26:\"settings.language_settings\";s:17:\"Language Settings\";s:28:\"settings.custom_global_style\";s:19:\"Custom Global Style\";s:28:\"settings.language_properties\";s:19:\"Language Properties\";s:28:\"settings.live_class_settings\";s:19:\"Live Class Settings\";s:38:\"settings.translate_language_properties\";s:29:\"Translate Language Properties\";s:27:\"settings.application_backup\";s:18:\"Application Backup\";s:27:\"settings.application_update\";s:18:\"Application Update\";s:28:\"settings.application_updated\";s:32:\"Application updated successfully\";s:29:\"settings.updating_application\";s:23:\"Updating application...\";s:20:\"settings.backup_date\";s:11:\"Backup Date\";s:20:\"settings.backup_name\";s:11:\"Backup Name\";s:20:\"settings.backup_size\";s:4:\"Size\";s:22:\"settings.backup_failed\";s:41:\"Backup creation failed. Please try again.\";s:22:\"settings.backup_status\";s:6:\"Status\";s:23:\"settings.backup_actions\";s:7:\"Actions\";s:23:\"settings.backup_created\";s:27:\"Backup created successfully\";s:23:\"settings.backup_deleted\";s:27:\"Backup deleted successfully\";s:23:\"settings.backup_history\";s:14:\"Backup History\";s:24:\"settings.backup_restored\";s:28:\"Backup restored successfully\";s:30:\"settings.backup_recommendation\";s:56:\"We strongly recommend creating a backup before updating.\";s:17:\"settings.elements\";s:8:\"Elements\";s:23:\"settings.configure_zoom\";s:49:\"Configure Zoom Server-to-Server OAuth Credentials\";s:24:\"settings.css_description\";s:59:\"Write custom CSS that will be applied globally to the site.\";s:25:\"settings.edit_custom_page\";s:16:\"Edit Custom Page\";s:27:\"settings.backup_description\";s:73:\"Create a complete backup of your application including files and database\";s:27:\"settings.translation_update\";s:18:\"Translation Update\";s:27:\"settings.update_description\";s:45:\"Upload and install application updates safely\";s:29:\"settings.available_home_pages\";s:20:\"Available Home Pages\";s:31:\"settings.home_pages_description\";s:36:\"List of all home pages in the system\";s:32:\"settings.maintenance_description\";s:69:\"Update, backup and restore your application safely and automatically.\";s:32:\"settings.translation_description\";s:29:\"Translate Language Properties\";s:33:\"settings.custom_pages_description\";s:24:\"Manage your custom pages\";s:35:\"settings.backup_history_description\";s:40:\"View and manage your application backups\";s:35:\"settings.email_settings_description\";s:37:\"Configure your email sending settings\";s:36:\"settings.system_settings_description\";s:34:\"Manage your system\'s core settings\";s:37:\"settings.storage_settings_description\";s:31:\"Configure your storage settings\";s:16:\"settings.browser\";s:7:\"Browser\";s:17:\"settings.downtime\";s:8:\"Downtime\";s:18:\"settings.uploading\";s:12:\"Uploading...\";s:19:\"settings.migrations\";s:10:\"Migrations\";s:20:\"settings.file_format\";s:11:\"File Format\";s:21:\"settings.backup_first\";s:12:\"Backup First\";s:22:\"settings.compatibility\";s:13:\"Compatibility\";s:22:\"settings.selected_file\";s:14:\"Selected file:\";s:23:\"settings.refresh_server\";s:14:\"Refresh Server\";s:24:\"settings.select_zip_file\";s:23:\"Select File (.zip only)\";s:25:\"settings.maintenance_mode\";s:32:\"Put the site in maintenance mode\";s:25:\"settings.this_update_will\";s:17:\"This update will:\";s:26:\"settings.browser_guideline\";s:45:\"Do not refresh or close browser during update\";s:27:\"settings.downtime_guideline\";s:39:\"Update process may take several minutes\";s:27:\"settings.update_application\";s:18:\"Update Application\";s:28:\"settings.do_not_close_window\";s:31:\"Please do not close this window\";s:29:\"settings.backup_first_warning\";s:72:\"Make sure you have created a backup first! This action cannot be undone.\";s:29:\"settings.migrations_guideline\";s:49:\"Database migrations will be automatically applied\";s:29:\"settings.put_site_maintenance\";s:32:\"Put the site in maintenance mode\";s:30:\"settings.file_format_guideline\";s:31:\"Upload must be a valid ZIP file\";s:30:\"settings.refresh_server_button\";s:14:\"Refresh Server\";s:31:\"settings.backup_first_guideline\";s:38:\"Always create a backup before updating\";s:32:\"settings.compatibility_guideline\";s:48:\"Ensure the update is compatible with your system\";s:32:\"settings.run_database_migrations\";s:23:\"Run database migrations\";s:32:\"settings.update_application_with\";s:63:\"Are you sure you want to update the application with :filename?\";s:33:\"settings.application_update_title\";s:18:\"Application Update\";s:33:\"settings.process_may_take_minutes\";s:32:\"Process may take several minutes\";s:33:\"settings.refresh_server_guideline\";s:41:\"Every time refresh server before updating\";s:34:\"settings.replace_application_files\";s:29:\"Replace all application files\";s:35:\"settings.confirm_application_update\";s:26:\"Confirm Application Update\";s:35:\"settings.file_selected_successfully\";s:66:\"File selected successfully. Click \"Update Application\" to proceed.\";s:35:\"settings.maintenance_mode_guideline\";s:50:\"Site will be temporarily unavailable during update\";s:35:\"settings.upload_install_description\";s:57:\"Upload and install the latest version of your application\";s:36:\"settings.important_update_guidelines\";s:27:\"Important Update Guidelines\";s:36:\"settings.updating_application_button\";s:23:\"Updating Application...\";s:23:\"settings.paytm_settings\";s:14:\"Paytm Settings\";s:24:\"settings.mollie_settings\";s:15:\"Mollie Settings\";s:24:\"settings.paypal_settings\";s:15:\"PayPal Settings\";s:24:\"settings.stripe_settings\";s:15:\"Stripe Settings\";s:26:\"settings.paystack_settings\";s:17:\"Paystack Settings\";s:26:\"settings.razorpay_settings\";s:17:\"Razorpay Settings\";s:28:\"settings.sslcommerz_settings\";s:19:\"SSLCommerz Settings\";s:34:\"settings.configure_payment_gateway\";s:34:\"Configure :gateway payment gateway\";s:18:\"settings.test_mode\";s:9:\"Test Mode\";s:24:\"settings.using_live_keys\";s:15:\"Using Live Keys\";s:24:\"settings.using_test_keys\";s:15:\"Using Test Keys\";s:31:\"settings.using_live_environment\";s:22:\"Using Live Environment\";s:31:\"settings.using_test_environment\";s:22:\"Using Test Environment\";s:34:\"settings.using_sandbox_environment\";s:25:\"Using Sandbox Environment\";s:34:\"settings.using_staging_environment\";s:25:\"Using Staging Environment\";s:37:\"settings.using_production_environment\";s:28:\"Using Production Environment\";s:24:\"settings.api_credentials\";s:15:\"API Credentials\";s:25:\"settings.live_credentials\";s:16:\"Live Credentials\";s:25:\"settings.test_credentials\";s:16:\"Test Credentials\";s:28:\"settings.sandbox_credentials\";s:19:\"Sandbox Credentials\";s:31:\"settings.production_credentials\";s:22:\"Production Credentials\";s:24:\"settings.use_staging_key\";s:21:\"Use your staging :key\";s:26:\"settings.use_live_mode_key\";s:23:\"Use your live mode :key\";s:26:\"settings.use_test_mode_key\";s:23:\"Use your test mode :key\";s:27:\"settings.use_production_key\";s:24:\"Use your production :key\";s:23:\"settings.update_warning\";s:17:\"This update will:\";s:28:\"settings.system_type_warning\";s:105:\"Are you sure you want to change the system type? This action will affect the entire application behavior.\";s:30:\"settings.delete_backup_warning\";s:74:\"Are you sure you want to delete this backup? This action cannot be undone.\";s:31:\"settings.restore_backup_warning\";s:61:\"Are you sure you want to restore from this backup? This will:\";s:35:\"settings.update_system_type_warning\";s:35:\"Are you sure to update system type?\";s:22:\"settings.configuration\";s:43:\"Configuration: Environment and config files\";s:25:\"settings.config_not_found\";s:24:\"Configuration not found.\";s:32:\"settings.footer_config_not_found\";s:31:\"Footer configuration not found.\";s:32:\"settings.navbar_config_not_found\";s:31:\"Navbar configuration not found.\";s:20:\"settings.app_version\";s:11:\"App Version\";s:24:\"settings.app_maintenance\";s:15:\"App Maintenance\";s:24:\"settings.current_version\";s:16:\"Current Version:\";s:29:\"settings.manage_core_settings\";s:34:\"Manage your system\'s core settings\";s:20:\"settings.after_login\";s:11:\"After Login\";s:21:\"settings.before_login\";s:12:\"Before Login\";s:28:\"settings.interactive_preview\";s:22:\"Interactive preview of\";s:28:\"settings.live_footer_preview\";s:19:\"Live Footer Preview\";s:28:\"settings.live_navbar_preview\";s:19:\"Live Navbar Preview\";s:21:\"settings.custom_pages\";s:12:\"Custom Pages\";s:22:\"settings.collaborative\";s:13:\"Collaborative\";s:23:\"settings.administrative\";s:14:\"Administrative\";s:13:\"settings.note\";s:4:\"Note\";s:15:\"settings.assets\";s:39:\"Assets: Uploaded media and public files\";s:17:\"settings.database\";s:38:\"Database: Complete MySQL database dump\";s:20:\"settings.source_code\";s:43:\"Source Code: All application files and code\";s:21:\"settings.refresh_note\";s:46:\"Note: Every time refresh server before backup.\";s:23:\"settings.what_backed_up\";s:23:\"What will be backed up?\";s:21:\"settings.do_not_close\";s:31:\"Please do not close this window\";s:23:\"settings.backup_details\";s:14:\"Backup Details\";s:24:\"settings.deleting_backup\";s:18:\"Deleting backup...\";s:25:\"settings.cannot_be_undone\";s:29:\"Cannot be undone or recovered\";s:25:\"settings.critical_warning\";s:16:\"Critical Warning\";s:25:\"settings.restoring_backup\";s:19:\"Restoring backup...\";s:26:\"settings.current_data_lost\";s:39:\"All current data and files will be lost\";s:29:\"settings.action_cannot_undone\";s:28:\"This action cannot be undone\";s:29:\"settings.remove_backup_record\";s:42:\"Remove the backup record from the database\";s:29:\"settings.restore_process_time\";s:32:\"Process may take several minutes\";s:30:\"settings.replace_current_files\";s:39:\"Overwrite all current application files\";s:31:\"settings.restore_database_state\";s:44:\"Replace the entire database with backup data\";s:33:\"settings.maintenance_mode_enabled\";s:32:\"Put the site in maintenance mode\";s:33:\"settings.permanently_delete_files\";s:48:\"Permanently delete the backup files from storage\";s:36:\"settings.restore_backup_confirmation\";s:59:\"Are you sure you want to restore the backup \":backup_name\"?\";s:21:\"settings.logo_favicon\";s:14:\"Logo & Favicon\";s:23:\"settings.media_settings\";s:14:\"Media Settings\";s:27:\"settings.social_media_links\";s:18:\"Social Media Links\";s:28:\"settings.contact_information\";s:19:\"Contact Information\";s:28:\"settings.website_information\";s:19:\"Website Information\";s:22:\"settings.replace_files\";s:29:\"Replace all application files\";s:23:\"settings.process_update\";s:32:\"Process the update automatically\";s:23:\"settings.run_migrations\";s:23:\"Run database migrations\";s:24:\"settings.create_zoom_app\";s:55:\"Create a Server-to-Server OAuth app in Zoom Marketplace\";s:24:\"settings.get_credentials\";s:49:\"Get your Account ID, Client ID, and Client Secret\";s:25:\"settings.configure_scopes\";s:42:\"Configure the required scopes for your app\";s:25:\"settings.zoom_setup_guide\";s:16:\"Zoom Setup Guide\";s:27:\"settings.setup_instructions\";s:46:\"Follow these steps to set up Zoom integration:\";}', 2082378679);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_templates`
--

CREATE TABLE `certificate_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'course',
  `logo_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` json NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificate_templates`
--

INSERT INTO `certificate_templates` (`id`, `name`, `type`, `logo_path`, `template_data`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Professional Blue', 'course', NULL, '{\"titleText\": \"Certificate of Achievement\", \"fontFamily\": \"sans-serif\", \"footerText\": \"Authorized and Certified\", \"borderColor\": \"#2563eb\", \"primaryColor\": \"#1e40af\", \"completionText\": \"for successfully completing the course\", \"secondaryColor\": \"#475569\", \"backgroundColor\": \"#eff6ff\", \"descriptionText\": \"This certificate is proudly presented to\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(2, 'Elegant Green', 'course', NULL, '{\"titleText\": \"Certificate of Excellence\", \"fontFamily\": \"serif\", \"footerText\": \"Congratulations on your accomplishment\", \"borderColor\": \"#10b981\", \"primaryColor\": \"#047857\", \"completionText\": \"has demonstrated outstanding achievement in\", \"secondaryColor\": \"#1f2937\", \"backgroundColor\": \"#d1fae5\", \"descriptionText\": \"This is to certify that\"}', 0, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(3, 'Royal Purple', 'course', NULL, '{\"titleText\": \"Certificate of Completion\", \"fontFamily\": \"cursive\", \"footerText\": \"Excellence in Learning\", \"borderColor\": \"#c026d3\", \"primaryColor\": \"#6b21a8\", \"completionText\": \"for exceptional dedication and successful completion of\", \"secondaryColor\": \"#374151\", \"backgroundColor\": \"#fae8ff\", \"descriptionText\": \"This prestigious certificate is awarded to\"}', 0, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(4, 'Classic Red Exam', 'exam', NULL, '{\"titleText\": \"Certificate of Examination Excellence\", \"fontFamily\": \"sans-serif\", \"footerText\": \"Authorized Examination Certificate\", \"borderColor\": \"#ef4444\", \"primaryColor\": \"#dc2626\", \"completionText\": \"for outstanding performance in the examination\", \"secondaryColor\": \"#1f2937\", \"backgroundColor\": \"#fef2f2\", \"descriptionText\": \"This certificate is proudly presented to\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(5, 'Modern Orange Exam', 'exam', NULL, '{\"titleText\": \"Certificate of Assessment Achievement\", \"fontFamily\": \"serif\", \"footerText\": \"Verified Assessment Certificate\", \"borderColor\": \"#f97316\", \"primaryColor\": \"#ea580c\", \"completionText\": \"has successfully passed the assessment with distinction\", \"secondaryColor\": \"#374151\", \"backgroundColor\": \"#fff7ed\", \"descriptionText\": \"This is to certify that\"}', 0, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(6, 'Bold Teal Exam', 'exam', NULL, '{\"titleText\": \"Certificate of Test Excellence\", \"fontFamily\": \"cursive\", \"footerText\": \"Certified Test Achievement\", \"borderColor\": \"#14b8a6\", \"primaryColor\": \"#0d9488\", \"completionText\": \"for exceptional performance in the test\", \"secondaryColor\": \"#1f2937\", \"backgroundColor\": \"#f0fdfa\", \"descriptionText\": \"This prestigious certificate is awarded to\"}', 0, '2025-12-29 14:31:18', '2025-12-29 14:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `chunked_uploads`
--

CREATE TABLE `chunked_uploads` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 's3',
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint NOT NULL DEFAULT '0',
  `upload_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'AWS S3 multipart upload ID',
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'S3 object key',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `chunks_completed` int NOT NULL DEFAULT '0',
  `total_chunks` int NOT NULL DEFAULT '0',
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chunked_upload_parts`
--

CREATE TABLE `chunked_upload_parts` (
  `id` bigint UNSIGNED NOT NULL,
  `upload_id` bigint UNSIGNED NOT NULL,
  `part_number` int NOT NULL,
  `etag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricing_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `price` double DEFAULT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_price` double DEFAULT NULL,
  `drip_content` tinyint(1) NOT NULL DEFAULT '0',
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lifetime',
  `expiry_duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `og_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` text COLLATE utf8mb4_unicode_ci,
  `instructor_id` bigint UNSIGNED NOT NULL,
  `course_category_id` bigint UNSIGNED NOT NULL,
  `course_category_child_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_assignments`
--

CREATE TABLE `course_assignments` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_mark` int NOT NULL,
  `pass_mark` int NOT NULL,
  `retake` int NOT NULL DEFAULT '1',
  `summary` text COLLATE utf8mb4_unicode_ci,
  `deadline` datetime NOT NULL DEFAULT '2026-01-05 20:31:06',
  `late_submission` tinyint(1) NOT NULL DEFAULT '0',
  `late_total_mark` int NOT NULL DEFAULT '0',
  `late_deadline` datetime DEFAULT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_carts`
--

CREATE TABLE `course_carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `title`, `slug`, `sort`, `status`, `icon`, `description`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'default', 1, 1, NULL, NULL, NULL, '2025-12-29 14:31:17', '2025-12-29 14:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `course_category_children`
--

CREATE TABLE `course_category_children` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_certificates`
--

CREATE TABLE `course_certificates` (
  `id` bigint UNSIGNED NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_coupons`
--

CREATE TABLE `course_coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_to` timestamp NULL DEFAULT NULL,
  `usage_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unlimited',
  `usage_limit` int DEFAULT NULL,
  `used_count` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollments`
--

CREATE TABLE `course_enrollments` (
  `id` bigint UNSIGNED NOT NULL,
  `enrollment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_date` timestamp NOT NULL,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_faqs`
--

CREATE TABLE `course_faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `answer` text COLLATE utf8mb4_unicode_ci,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_forums`
--

CREATE TABLE `course_forums` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` json DEFAULT NULL,
  `dislikes` json DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `section_lesson_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_forum_replies`
--

CREATE TABLE `course_forum_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_forum_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_live_classes`
--

CREATE TABLE `course_live_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `class_topic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_date_and_time` timestamp NOT NULL,
  `class_note` text COLLATE utf8mb4_unicode_ci,
  `additional_info` json DEFAULT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_outcomes`
--

CREATE TABLE `course_outcomes` (
  `id` bigint UNSIGNED NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `outcome` text COLLATE utf8mb4_unicode_ci,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_progress`
--

CREATE TABLE `course_progress` (
  `id` bigint UNSIGNED NOT NULL,
  `total_lessons` int NOT NULL DEFAULT '0',
  `completed_lessons` int NOT NULL DEFAULT '0',
  `progress_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_requirements`
--

CREATE TABLE `course_requirements` (
  `id` bigint UNSIGNED NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `requirement` text COLLATE utf8mb4_unicode_ci,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_reviews`
--

CREATE TABLE `course_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `likes` json DEFAULT NULL,
  `dislikes` json DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_sections`
--

CREATE TABLE `course_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_wishlists`
--

CREATE TABLE `course_wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'beginner',
  `pricing_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `price` double DEFAULT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_price` double DEFAULT NULL,
  `duration_hours` int NOT NULL DEFAULT '0',
  `duration_minutes` int NOT NULL DEFAULT '0',
  `pass_mark` decimal(5,2) NOT NULL DEFAULT '0.00',
  `total_marks` decimal(10,2) NOT NULL DEFAULT '0.00',
  `max_attempts` int NOT NULL DEFAULT '1',
  `total_questions` int NOT NULL DEFAULT '0',
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lifetime',
  `expiry_duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `og_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` text COLLATE utf8mb4_unicode_ci,
  `instructor_id` bigint UNSIGNED NOT NULL,
  `exam_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempts`
--

CREATE TABLE `exam_attempts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `attempt_number` int NOT NULL DEFAULT '1',
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `total_marks` decimal(10,2) NOT NULL DEFAULT '0.00',
  `obtained_marks` decimal(10,2) NOT NULL DEFAULT '0.00',
  `correct_answers` int NOT NULL DEFAULT '0',
  `incorrect_answers` int NOT NULL DEFAULT '0',
  `is_passed` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in_progress',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempt_answers`
--

CREATE TABLE `exam_attempt_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_attempt_id` bigint UNSIGNED NOT NULL,
  `exam_question_id` bigint UNSIGNED NOT NULL,
  `answer_data` json NOT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `marks_obtained` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_categories`
--

CREATE TABLE `exam_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_categories`
--

INSERT INTO `exam_categories` (`id`, `title`, `slug`, `icon`, `sort`, `status`, `description`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'default', 'recycle', 1, 1, NULL, NULL, '2025-12-29 14:31:19', '2025-12-29 14:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `exam_coupons`
--

CREATE TABLE `exam_coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_to` timestamp NULL DEFAULT NULL,
  `usage_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unlimited',
  `usage_limit` int DEFAULT NULL,
  `used_count` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_enrollments`
--

CREATE TABLE `exam_enrollments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `enrollment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lifetime',
  `entry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_faqs`
--

CREATE TABLE `exam_faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_outcomes`
--

CREATE TABLE `exam_outcomes` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `outcome` text COLLATE utf8mb4_unicode_ci,
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `question_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `marks` decimal(5,2) NOT NULL DEFAULT '1.00',
  `sort` int NOT NULL DEFAULT '0',
  `options` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_question_options`
--

CREATE TABLE `exam_question_options` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_question_id` bigint UNSIGNED NOT NULL,
  `option_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_requirements`
--

CREATE TABLE `exam_requirements` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `requirement` text COLLATE utf8mb4_unicode_ci,
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_resources`
--

CREATE TABLE `exam_resources` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_reviews`
--

CREATE TABLE `exam_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `rating` int NOT NULL DEFAULT '5',
  `review` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_wishlists`
--

CREATE TABLE `exam_wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footers`
--

CREATE TABLE `footers` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footers`
--

INSERT INTO `footers` (`id`, `title`, `slug`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Footer 1', 'footer_1', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `footer_items`
--

CREATE TABLE `footer_items` (
  `id` bigint UNSIGNED NOT NULL,
  `sort` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `items` json DEFAULT NULL,
  `footer_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_items`
--

INSERT INTO `footer_items` (`id`, `sort`, `type`, `slug`, `title`, `active`, `items`, `footer_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'list', 'company', 'Company', 1, '[{\"url\": \"/about-us\", \"title\": \"About Us\"}, {\"url\": \"/our-team\", \"title\": \"Our Team\"}, {\"url\": \"/careers\", \"title\": \"Careers\"}, {\"url\": \"/contact-us\", \"title\": \"Contact Us\"}]', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(2, 2, 'list', 'legal_policies', 'Legal & Policies', 1, '[{\"url\": \"/cookie-policy\", \"title\": \"Cookie Policy\"}, {\"url\": \"/terms-and-conditions\", \"title\": \"Terms & Conditions\"}, {\"url\": \"/privacy-policy\", \"title\": \"Privacy Policy\"}, {\"url\": \"/refund-policy\", \"title\": \"Refund Policy\"}]', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(3, 3, 'list', 'address', 'Address', 1, '[{\"title\": \"Corner view Subudbazar, Sylhet, Bangladesh.\"}, {\"title\": \"Email: uilib@gmail.com\"}, {\"title\": \"Phone: +880 1123 456 780\"}]', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(4, 4, 'social_media', 'social_media', 'Social Media', 1, '[{\"url\": \"https://www.facebook.com/\", \"icon\": \"facebook\", \"title\": \"Facebook\"}, {\"url\": \"https://www.twitter.com/\", \"icon\": \"twitter\", \"title\": \"Twitter\"}, {\"url\": \"https://www.instagram.com/\", \"icon\": \"instagram\", \"title\": \"Instagram\"}, {\"url\": \"https://www.linkedin.com/\", \"icon\": \"linkedin\", \"title\": \"LinkedIn\"}]', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(5, 5, 'payment_methods', 'payment_methods', 'We support multiple payment gateways.', 1, '[{\"image\": \"/assets/payment/stripe.png\"}, {\"image\": \"/assets/payment/paypal.png\"}, {\"image\": \"/assets/payment/mollie.png\"}, {\"image\": \"/assets/payment/paystack.png\"}]', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(6, 6, 'copyright', 'copyright', '© Copyright 2025 UI Lib, All rights reserved.', 1, '[]', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` bigint UNSIGNED NOT NULL,
  `skills` json NOT NULL,
  `biography` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resume` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payout_methods` json NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `skills`, `biography`, `resume`, `designation`, `status`, `payout_methods`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '\"[\\\"admin\\\"]\"', 'Administrator of the platform to manage the platform and the users of the platform', 'https://www.sbs.ox.ac.uk/sites/default/files/2019-01/cv-template.pdf', 'Administrator', 'approved', '[{\"type\": \"payout\", \"title\": \"Paypal Settings\", \"fields\": {\"active\": false, \"currency\": \"USD\", \"test_mode\": false, \"sandbox_client_id\": \"\", \"sandbox_secret_key\": \"\", \"production_client_id\": \"\", \"production_secret_key\": \"\"}, \"sub_type\": \"paypal\"}, {\"type\": \"payout\", \"title\": \"Stripe Settings\", \"fields\": {\"active\": false, \"currency\": \"USD\", \"test_mode\": false, \"webhook_secret\": \"\", \"live_public_key\": \"\", \"live_secret_key\": \"\", \"test_public_key\": \"\", \"test_secret_key\": \"\"}, \"sub_type\": \"stripe\"}, {\"type\": \"payout\", \"title\": \"Mollie Settings\", \"fields\": {\"active\": false, \"currency\": \"USD\", \"test_mode\": false, \"live_api_key\": \"\", \"test_api_key\": \"\"}, \"sub_type\": \"mollie\"}, {\"type\": \"payout\", \"title\": \"Paystack Settings\", \"fields\": {\"active\": false, \"currency\": \"USD\", \"test_mode\": false, \"live_public_key\": \"\", \"live_secret_key\": \"\", \"test_public_key\": \"\", \"test_secret_key\": \"\"}, \"sub_type\": \"paystack\"}, {\"type\": \"payout\", \"title\": \"SSLCommerz Settings\", \"fields\": {\"active\": false, \"currency\": \"BDT\", \"store_id\": \"\", \"test_mode\": true, \"store_password\": \"\"}, \"sub_type\": \"sslcommerz\"}, {\"type\": \"payout\", \"title\": \"Razorpay Settings\", \"fields\": {\"active\": false, \"api_key\": \"\", \"currency\": \"INR\", \"test_mode\": true, \"api_secret\": \"\"}, \"sub_type\": \"razorpay\"}]', 1, '2025-12-29 14:31:19', '2025-12-29 14:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_circulars`
--

CREATE TABLE `job_circulars` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mid',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_min` decimal(10,2) DEFAULT NULL,
  `salary_max` decimal(10,2) DEFAULT NULL,
  `salary_currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `salary_negotiable` tinyint(1) NOT NULL DEFAULT '0',
  `application_deadline` date NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skills_required` json DEFAULT NULL,
  `positions_available` int NOT NULL DEFAULT '1',
  `job_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'full-time',
  `work_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on-site',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nativeName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `flag`, `nativeName`, `is_active`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', NULL, 'English', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `language_properties`
--

CREATE TABLE `language_properties` (
  `id` bigint UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties` json NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_properties`
--

INSERT INTO `language_properties` (`id`, `group`, `name`, `slug`, `properties`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'auth', 'Authentication Messages', 'authentication_messages', '{\"failed\": \"These credentials do not match our records.\", \"password\": \"The provided password is incorrect.\", \"throttle\": \"Too many login attempts. Please try again in :seconds seconds.\", \"password_updated\": \"Your password has been updated.\", \"password_reset_sent\": \"We have emailed your password reset link.\", \"google_auth_settings\": \"Google Auth Settings\", \"verification_link_sent\": \"A fresh verification link has been sent to your email address.\", \"google_auth_description\": \"Google Auth Description\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(2, 'auth', 'Login Page', 'login_page', '{\"no_account\": \"Don\'t have an account?\", \"google_auth\": \"Google Auth\", \"login_title\": \"Log in to your account\", \"remember_me\": \"Remember me\", \"continue_with\": \"Or continue with\", \"forgot_password\": \"Forgot Password\", \"login_description\": \"Enter your email and password below to log in\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(3, 'auth', 'Register Page', 'register_page', '{\"have_account\": \"Already have an account?\", \"register_title\": \"Create an account\", \"register_description\": \"Enter your details below to create your account\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(4, 'auth', 'Forgot Password', 'forgot_password', '{\"return_to_login\": \"Or, return to\", \"forgot_description\": \"Enter your email to receive a password reset link\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(5, 'auth', 'Reset Password', 'reset_password', '{\"reset_title\": \"Reset password\", \"reset_description\": \"Please enter your new password below\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(6, 'auth', 'Confirm Password', 'confirm_password', '{\"confirm_title\": \"Confirm your password\", \"confirm_description\": \"This is a secure area of the application. Please confirm your password before continuing.\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(7, 'auth', 'Verify Email', 'verify_email', '{\"change_email\": \"Change Email\", \"verify_title\": \"Verify email\", \"verification_sent\": \"A new verification link has been sent to the email address you provided during registration.\", \"verify_description\": \"Please verify your email address by clicking on the link we just emailed to you.\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(8, 'button', 'Common Buttons', 'common_buttons', '{\"add\": \"Add\", \"dark\": \"Dark\", \"edit\": \"Edit\", \"save\": \"Save\", \"apply\": \"Apply\", \"close\": \"Close\", \"light\": \"Light\", \"reply\": \"Reply\", \"cancel\": \"Cancel\", \"create\": \"Create\", \"delete\": \"Delete\", \"remove\": \"Remove\", \"submit\": \"Submit\", \"update\": \"Update\", \"previous\": \"Previous\", \"view_all\": \"View All\", \"collaborative\": \"Collaborative\", \"administrative\": \"Administrative\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(9, 'button', 'General Buttons', 'general_buttons', '{\"form\": \"Form\", \"free\": \"Free\", \"list\": \"List\", \"send\": \"Send\", \"sort\": \"Sort\", \"true\": \"True\", \"type\": \"Type\", \"false\": \"False\", \"active\": \"Active\", \"filter\": \"Filter\", \"search\": \"Search\", \"upload\": \"Upload\", \"lessons\": \"Lessons\", \"refresh\": \"Refresh\", \"reorder\": \"Reorder\", \"add_item\": \"Add Item\", \"download\": \"Download\", \"inactive\": \"Inactive\", \"backup_now\": \"Backup Now\", \"class_note\": \"Class Note\", \"deactivate\": \"Deactivate\", \"join_class\": \"Join Class\", \"add_language\": \"Add Language\", \"delete_class\": \"Delete Class\", \"live_classes\": \"Live Classes\", \"save_changes\": \"Save Changes\", \"delete_backup\": \"Delete Backup\", \"add_newsletter\": \"Add Newsletter\", \"refresh_server\": \"Refresh Server\", \"restore_backup\": \"Restore Backup\", \"schedule_class\": \"Schedule Class\", \"edit_live_class\": \"Edit Live Class\", \"update_newsletter\": \"Update Newsletter\", \"update_application\": \"Update Application\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(10, 'button', 'Action Buttons', 'action_buttons', '{\"like\": \"like\", \"buy_now\": \"Buy Now\", \"dislike\": \"dislike\", \"posting\": \"Posting...\", \"add_quiz\": \"Add Quiz\", \"continue\": \"Continue\", \"next_step\": \"Next Step\", \"subscribe\": \"Subscribe\", \"add_lesson\": \"Add Lesson\", \"enroll_now\": \"Enroll Now\", \"learn_more\": \"Learn More\", \"add_section\": \"Add Section\", \"add_to_cart\": \"Add to cart\", \"download_as\": \"Download as\", \"pick_a_date\": \"Pick a date\", \"play_course\": \"Play Course\", \"save_lesson\": \"Save Lesson\", \"add_question\": \"Add Question\", \"edit_section\": \"Edit Section\", \"post_comment\": \"Post Comment\", \"sort_lessons\": \"Sort Lessons\", \"sort_section\": \"Sort Section\", \"toggle_theme\": \"Toggle theme\", \"course_player\": \"Course Player\", \"previous_step\": \"Previous Step\", \"submit_review\": \"Submit Review\", \"course_details\": \"Course Details\", \"course_preview\": \"Course Preview\", \"delete_account\": \"Delete account\", \"delete_section\": \"Delete Section\", \"quiz_questions\": \"Quiz Questions\", \"add_to_wishlist\": \"Add to Wishlist\", \"approval_status\": \"Approval Status\", \"sort_categories\": \"Sort Categories\", \"mark_all_as_read\": \"Mark all as read\", \"continue_to_payment\": \"Continue to payment\", \"submit_for_approval\": \"Submit for Approval\", \"become_an_instructor\": \"Become an Instructor\", \"generate_certificate\": \"Generate Certificate\", \"remove_from_wishlist\": \"Remove from Wishlist\", \"are_you_sure_to_delete\": \"Are you sure to delete?\", \"generating_certificate\": \"Generating Certificate...\", \"view_all_notifications\": \"View all notifications\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(11, 'button', 'Authentication Buttons', 'authentication_buttons', '{\"login\": \"Login\", \"log_in\": \"Log in\", \"logout\": \"Logout\", \"log_out\": \"Log out\", \"sign_up\": \"Sign up\", \"change_email\": \"Change Email\", \"create_account\": \"Create account\", \"reset_password\": \"Reset password\", \"change_password\": \"Change Password\", \"forget_password\": \"Forget Password\", \"forgot_password\": \"Forgot password?\", \"confirm_password\": \"Confirm password\", \"continue_with_google\": \"Continue With Google\", \"get_email_change_link\": \"Get Email Change Link\", \"get_password_reset_link\": \"Get Password Reset Link\", \"email_password_reset_link\": \"Email password reset link\", \"resend_verification_email\": \"Resend verification email\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(12, 'button', 'File Upload Buttons', 'file_upload_buttons', '{\"saving\": \"Saving...\", \"uploading\": \"Uploading...\", \"upload_file\": \"Upload File\", \"start_upload\": \"Start Upload\", \"cancel_upload\": \"Cancel Upload\", \"completed_upload\": \"Completed upload\", \"finalizing_upload\": \"Finalizing upload...\", \"initializing_upload\": \"Initializing upload...\", \"select_different_file\": \"Select Different File\", \"uploading_file_chunks\": \"Uploading file chunks...\", \"upload_completed_successfully\": \"Upload completed successfully\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(13, 'button', 'Pagination Buttons', 'pagination_buttons', '{\"back\": \"Back\", \"last\": \"Last\", \"next\": \"Next\", \"prev\": \"Prev\", \"first\": \"First\", \"show_full\": \"Show Full\", \"show_less\": \"Show Less\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(14, 'button', 'Navigation Buttons', 'navigation_buttons', '{\"smtp\": \"SMTP\", \"auth0\": \"Auth0\", \"blogs\": \"Blogs\", \"pages\": \"Pages\", \"system\": \"System\", \"account\": \"Account\", \"courses\": \"Courses\", \"payouts\": \"Payouts\", \"profile\": \"Profile\", \"storage\": \"Storage\", \"all_jobs\": \"All Jobs\", \"edit_job\": \"Edit Job\", \"settings\": \"Settings\", \"wishlist\": \"Wishlist\", \"withdraw\": \"Withdraw\", \"all_users\": \"All Users\", \"dashboard\": \"Dashboard\", \"main_menu\": \"Main Menu\", \"categories\": \"Categories\", \"create_job\": \"Create Job\", \"live_class\": \"Live Class\", \"my_courses\": \"My Courses\", \"create_blog\": \"Create Blog\", \"enrollments\": \"Enrollments\", \"instructors\": \"Instructors\", \"maintenance\": \"Maintenance\", \"manage_blog\": \"Manage Blog\", \"newsletters\": \"Newsletters\", \"applications\": \"Applications\", \"create_course\": \"Create Course\", \"job_circulars\": \"Job Circulars\", \"payout_report\": \"Payout Report\", \"manage_courses\": \"Manage Courses\", \"payout_history\": \"Payout History\", \"payout_request\": \"Payout Request\", \"profile_update\": \"Profile Update\", \"payment_methods\": \"Payment Methods\", \"create_instructor\": \"Create Instructor\", \"add_new_enrollment\": \"Add New Enrollment\", \"add_new_instructor\": \"Add New Instructor\", \"manage_enrollments\": \"Manage Enrollments\", \"manage_instructors\": \"Manage Instructors\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(15, 'button', 'Sub Navigation Buttons', 'sub_navigation_buttons', '{\"seo\": \"SEO\", \"info\": \"Info\", \"quiz\": \"Quiz\", \"basic\": \"Basic\", \"forum\": \"Forum\", \"media\": \"Media\", \"style\": \"Style\", \"footer\": \"Footer\", \"lesson\": \"Lesson\", \"navbar\": \"Navbar\", \"review\": \"Review\", \"social\": \"Social\", \"actions\": \"Actions\", \"details\": \"Details\", \"payment\": \"Payment\", \"pricing\": \"Pricing\", \"reviews\": \"Reviews\", \"summery\": \"Summery\", \"website\": \"Website\", \"overview\": \"Overview\", \"copyright\": \"Copyright\", \"dropdowns\": \"Dropdowns\", \"url_items\": \"URL Items\", \"curriculum\": \"Curriculum\", \"instructor\": \"Instructor\", \"certificate\": \"Certificate\", \"edit_footer\": \"Edit Footer\", \"edit_navbar\": \"Edit Navbar\", \"social_media\": \"Social Media\", \"become_instructor\": \"Become Instructor\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(16, 'common', 'Common Entities', 'common_entities', '{\"url\": \"URL\", \"name\": \"Name\", \"role\": \"Role\", \"type\": \"Type\", \"email\": \"Email\", \"image\": \"Image\", \"level\": \"Level\", \"price\": \"Price\", \"title\": \"Title\", \"action\": \"Action\", \"rating\": \"Rating\", \"status\": \"Status\", \"actions\": \"Actions\", \"comment\": \"Comment\", \"courses\": \"Courses\", \"reviews\": \"Reviews\", \"category\": \"Category\", \"comments\": \"Comments\", \"location\": \"Location\", \"password\": \"Password\", \"students\": \"Students\", \"categories\": \"Categories\", \"instructor\": \"Instructor\", \"description\": \"Description\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(17, 'common', 'Common Status', 'common_status', '{\"on\": \"On\", \"off\": \"Off\", \"free\": \"Free\", \"draft\": \"Draft\", \"active\": \"Active\", \"closed\": \"Closed\", \"paused\": \"Paused\", \"default\": \"default\", \"enabled\": \"Enabled\", \"expired\": \"Expired\", \"pending\": \"Pending\", \"disabled\": \"Disabled\", \"inactive\": \"Inactive\", \"language\": \"Language\", \"completed\": \"Completed\", \"published\": \"Published\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(18, 'common', 'Common Actions & Account Management', 'common_actions_account_management', '{\"no\": \"No\", \"ok\": \"OK\", \"yes\": \"Yes\", \"back\": \"Back\", \"edit\": \"Edit\", \"save\": \"Save\", \"skip\": \"Skip\", \"view\": \"View\", \"apply\": \"Apply\", \"close\": \"Close\", \"retry\": \"Retry\", \"cancel\": \"Cancel\", \"create\": \"Create\", \"delete\": \"Delete\", \"filter\": \"Filter\", \"reload\": \"Reload\", \"search\": \"Search\", \"submit\": \"Submit\", \"update\": \"Update\", \"confirm\": \"Confirm\", \"preview\": \"Preview\", \"refresh\": \"Refresh\", \"continue\": \"Continue\", \"download\": \"Download\", \"change_email\": \"Change Email\", \"change_password\": \"Change Password\", \"forget_password\": \"Forget Password\"}', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(19, 'common', 'Common Status Messages & Time Terms', 'common_status_messages_time_terms', '{\"ago\": \"ago\", \"today\": \"Today\", \"saving\": \"Saving...\", \"loading\": \"Loading...\", \"deleting\": \"Deleting...\", \"updating\": \"Updating...\", \"searching\": \"Searching...\", \"uploading\": \"Uploading...\", \"yesterday\": \"Yesterday\", \"processing\": \"Processing...\", \"no_results_found\": \"No results found\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(20, 'common', 'Common Settings', 'common_settings', '{\"settings\": \"Settings\", \"email_settings\": \"Email Settings\", \"general_settings\": \"General Settings\", \"payment_settings\": \"Payment Settings\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(21, 'common', 'Common Error Messages', 'common_error_messages', '{\"invalid_file\": \"Invalid file format. Please upload a valid .zip file.\", \"file_too_large\": \"File is too large. Please select a smaller file.\", \"required_field\": \"This field is required.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(22, 'common', 'Common Navigation', 'common_navigation', '{\"help\": \"Help\", \"home\": \"Home\", \"about\": \"About\", \"contact\": \"Contact\", \"support\": \"Support\", \"settings\": \"Settings\", \"dashboard\": \"Dashboard\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(23, 'common', 'Common Pagination', 'common_pagination', '{\"of\": \"of\", \"last\": \"Last>>\", \"next\": \"Next\", \"page\": \"Page\", \"first\": \"<<First\", \"previous\": \"Previous\", \"go_to_page\": \"Go to page\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(24, 'common', 'Common Media Types', 'common_media_types', '{\"file\": \"File\", \"audio\": \"Audio\", \"video\": \"Video\", \"document\": \"Document\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(25, 'common', 'Course Related', 'course_related', '{\"free\": \"Free\", \"courses\": \"Courses\", \"reviews\": \"Reviews\", \"students\": \"Students\", \"select_the_approval_status\": \"Select the approval status\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(26, 'dashboard', 'Common Management', 'common_management', '{\"faq_management\": \"FAQ Management\", \"user_management\": \"User Management\", \"course_management\": \"Course Management\", \"refund_management\": \"Refund Management\", \"content_management\": \"Content Management\", \"financial_management\": \"Financial Management\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(27, 'dashboard', 'Common Analytics & Reports', 'common_analytics_reports', '{\"reports\": \"Reports\", \"analytics\": \"Analytics\", \"sales_report\": \"Sales Report\", \"export_report\": \"Export Report\", \"course_analytics\": \"Course Analytics\", \"financial_report\": \"Financial Report\", \"course_statistics\": \"Course Statistics\", \"visitor_analytics\": \"Visitor Analytics\", \"revenue_statistics\": \"Revenue Statistics\", \"user_activity_report\": \"User Activity Report\", \"enrollment_statistics\": \"Enrollment Statistics\", \"course_performance_report\": \"Course Performance Report\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(28, 'dashboard', 'Common Information & Details', 'common_information_details', '{\"media_details\": \"Media Details\", \"blog_information\": \"Blog Information\", \"user_information\": \"User Information\", \"basic_information\": \"Basic Information\", \"compensation_details\": \"Compensation & Details\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(29, 'dashboard', 'Common Totals', 'common_totals', '{\"total_jobs\": \"Total Jobs\", \"total_blogs\": \"Total Blogs\", \"total_users\": \"Total Users\", \"total_earnings\": \"Total Earnings\", \"total_categories\": \"Total Categories\", \"total_withdrawals\": \"Total Withdrawals\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(30, 'dashboard', 'Common Selectors', 'common_selectors', '{\"select_media\": \"Select Media\", \"select_user_type\": \"Select user type\", \"select_recipients\": \"Select Recipients\", \"select_withdrawal_method\": \"Select withdrawal method\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(31, 'dashboard', 'Common Messages', 'common_messages', '{\"no_results\": \"No results.\", \"no_results_found\": \"No results found\", \"update_the_category\": \"Update The Category\", \"are_you_absolutely_sure\": \"Are you absolutely sure?\", \"image_upload_requirements\": \"Image upload is required\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(32, 'dashboard', 'Dashboard Related', 'dashboard_related', '{\"admin\": \"Admin\", \"lessons\": \"Lessons\", \"quizzes\": \"Quizzes\", \"archived\": \"Archived\", \"user_list\": \"User List\", \"enrollment\": \"Enrollment\", \"sort_items\": \"Sort Items\", \"course_list\": \"Course List\", \"payout_list\": \"Payout List\", \"update_quiz\": \"Update Quiz\", \"course_status\": \"Course Status\", \"update_lesson\": \"Update Lesson\", \"update_section\": \"Update Section\", \"instructor_list\": \"Instructor List\", \"newsletter_list\": \"Newsletter List\", \"total_content_items\": \"Total Content Items\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(33, 'dashboard', 'Job Circular Management', 'job_circular_management', '{\"job_type\": \"Job Type\", \"work_type\": \"Work Type\", \"job_details\": \"Job Details\", \"salary_range\": \"Salary Range\", \"contact_email\": \"Contact Email\", \"job_circulars\": \"Job Circulars\", \"salary_currency\": \"Salary Currency\", \"skills_required\": \"Skills Required\", \"experience_level\": \"Experience Level\", \"job_details_title\": \"Specify the job type, location, and experience requirements\", \"salary_negotiable\": \"Salary Negotiable\", \"salary_information\": \"Salary Information\", \"positions_available\": \"Positions Available\", \"application_deadline\": \"Application Deadline\", \"no_job_circulars_found\": \"No job circulars found\", \"provide_salary_details\": \"Provide salary range and other compensation details\", \"salary_information_title\": \"Set the compensation range for this position\", \"specify_job_requirements\": \"Specify the requirements and qualifications for this position\", \"provide_essential_job_details\": \"Provide the essential details about the job position\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(34, 'dashboard', 'Newsletter Management', 'newsletter_management', '{\"all\": \"All\", \"send_to\": \"Send To\", \"student\": \"Student\", \"send_newsletter\": \"Send newsletter\", \"no_newsletters_found\": \"No newsletters found\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(35, 'dashboard', 'Payout Management', 'payout_management', '{\"available\": \"Available\", \"requested\": \"Requested\", \"total_payout\": \"Total Payout\", \"withdraw_list\": \"Withdraw List\", \"payout_history\": \"Payout History\", \"payout_request\": \"Payout Request\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(36, 'dashboard', 'Instructor Management', 'instructor_management', '{\"feedback\": \"Feedback\", \"approval_status\": \"Approval Status\", \"course_instructor\": \"Course Instructor\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(37, 'dashboard', 'Blog Management', 'blog_management', '{\"blog\": \"Blog\", \"icon_picker\": \"Icon Picker\", \"add_category\": \"Add Category\", \"add_new_blog\": \"Add new blog\", \"blog_category\": \"Blog Category\", \"blog_categories\": \"Blog Categories\", \"category_status\": \"Category Status\", \"create_category\": \"Create Category\", \"sort_categories\": \"Sort Categories\", \"add_new_category\": \"Add New Category\", \"blog_information\": \"Blog Information\", \"enter_blog_title\": \"Enter blog title\", \"pick_category_icon\": \"Pick your category icon\", \"protected_category\": \"Protected Category\", \"enter_category_name\": \"Enter your category name\", \"blog_information_desc\": \"Provide the essential details about your blog post\", \"protected_category_desc\": \"When a specific category is deleted, all courses in that category will be moved to this default category. So default category cannot be edited or removed.\", \"provide_essential_details\": \"Provide the essential details about your blog post\", \"default_category_description\": \"When a specific category is deleted, all courses in that category will be moved to this default category. So default category cannot be edited or removed.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(38, 'dashboard', 'Newsletters', 'newsletters', '{\"all_users\": \"All Users\", \"only_students\": \"Only Students\", \"only_instructors\": \"Only Instructors\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(39, 'dashboard', 'Payouts Details', 'payouts_details', '{\"withdraw_amount\": \"Withdraw Amount\", \"withdrawal_note\": \"Withdrawal Note\", \"maximum_withdraw\": \"Maximum Withdraw\", \"minimum_withdraw\": \"Minimum Withdraw\", \"available_balance\": \"Available Balance\", \"withdrawal_method\": \"Withdrawal Method\", \"pending_withdrawals\": \"Pending Withdrawals\", \"withdrawal_note_placeholder\": \"Add a note for this withdrawal (optional)\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(40, 'dashboard', 'Users', 'users', '{\"user_role\": \"User Role\", \"provide_essential_user_details\": \"Provide the essential details about the user\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(41, 'dashboard', 'Content Management', 'content_management', '{\"file_name\": \"File Name\", \"file_size\": \"File Size\", \"file_type\": \"File Type\", \"dimensions\": \"Dimensions\", \"upload_date\": \"Upload Date\", \"file_manager\": \"File Manager\", \"upload_media\": \"Upload Media\", \"media_library\": \"Media Library\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(42, 'dashboard', 'Communication Management', 'communication_management', '{\"messages\": \"Messages\", \"announcements\": \"Announcements\", \"notifications\": \"Notifications\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(43, 'dashboard', 'SEO Management', 'seo_management', '{\"og_title\": \"OG Title\", \"meta_title\": \"Meta Title\", \"meta_keywords\": \"Meta Keywords\", \"enter_og_title\": \"Enter OG Title\", \"og_description\": \"OG Description\", \"enter_meta_title\": \"Enter Meta Title\", \"meta_description\": \"Meta Description\", \"enter_meta_keywords\": \"Enter Meta Keywords\", \"enter_og_description\": \"Enter OG Description\", \"enter_meta_description\": \"Enter Meta Description\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(44, 'dashboard', 'Lesson Forms', 'lesson_forms', '{\"is_free\": \"Is Free\", \"duration\": \"Duration\", \"video_url\": \"Video URL\", \"image_file\": \"Image File\", \"video_file\": \"Video File\", \"lesson_type\": \"Lesson Type\", \"embed_source\": \"Embed Source\", \"lesson_title\": \"Lesson Title\", \"text_content\": \"Text Content\", \"document_file\": \"Document File\", \"lesson_source\": \"Lesson Source\", \"lesson_status\": \"Lesson Status\", \"lesson_summary\": \"Lesson Summary\", \"lesson_provider\": \"Lesson Provider\", \"lesson_description\": \"Lesson Description\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(45, 'dashboard', 'Quiz Forms', 'quiz_forms', '{\"hours\": \"Hours\", \"retake\": \"Retake\", \"minutes\": \"Minutes\", \"seconds\": \"Seconds\", \"pass_mark\": \"Pass Mark\", \"quiz_title\": \"Quiz Title\", \"total_mark\": \"Total Mark\", \"quiz_summary\": \"Quiz Summary\", \"enter_quiz_title\": \"Enter quiz title\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(46, 'dashboard', 'Question Forms', 'question_forms', '{\"true_false\": \"True of False\", \"add_question\": \"Add Question\", \"edit_question\": \"Edit Question\", \"question_type\": \"Question Type\", \"single_choice\": \"Single Choice\", \"correct_answer\": \"Correct Answer\", \"question_title\": \"Question Title\", \"multiple_choice\": \"Multiple Choice\", \"question_options\": \"Question Options\", \"select_question_type\": \"Select question type\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(47, 'dashboard', 'Course Content', 'course_content', '{\"sections\": \"Sections\", \"assignments\": \"Assignments\", \"section_title\": \"Section Title\", \"lesson_content\": \"Lesson Content\", \"quiz_questions\": \"Quiz Questions\", \"section_description\": \"Section Description\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(48, 'dashboard', 'User Management', 'user_management', '{\"user_roles\": \"User Roles\", \"permissions\": \"Permissions\", \"update_user\": \"Update User\", \"login_history\": \"Login History\", \"user_activity\": \"User Activity\", \"user_preferences\": \"User Preferences\", \"select_approval_status\": \"Select the approval status\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(49, 'dashboard', 'Course Progress', 'course_progress', '{\"time_spent\": \"Time Spent\", \"quiz_scores\": \"Quiz Scores\", \"completion_rate\": \"Completion Rate\", \"course_progress\": \"Course Progress\", \"certificates_issued\": \"Certificates Issued\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(50, 'dashboard', 'Financial Management', 'financial_management', '{\"admin_revenue\": \"Admin Revenue\", \"payment_history\": \"Payment History\", \"commission_rates\": \"Commission Rates\", \"revenue_tracking\": \"Revenue Tracking\", \"instructor_revenue\": \"Instructor Revenue\", \"admin_revenue_this_year\": \"Admin Revenue This Year\", \"instructor_revenue_this_year\": \"Instructor Revenue This Year\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(51, 'dashboard', 'Content Moderation', 'content_moderation', '{\"content_review\": \"Content Review\", \"flagged_content\": \"Flagged Content\", \"moderation_queue\": \"Moderation Queue\", \"content_guidelines\": \"Content Guidelines\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(52, 'dashboard', 'Support & Help', 'support_help', '{\"help_desk\": \"Help Desk\", \"documentation\": \"Documentation\", \"support_tickets\": \"Support Tickets\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(53, 'dashboard', 'Marketing', 'marketing', '{\"email_marketing\": \"Email Marketing\", \"affiliate_program\": \"Affiliate Program\", \"promotional_codes\": \"Promotional Codes\", \"marketing_campaigns\": \"Marketing Campaigns\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(54, 'dashboard', 'Integration', 'integration', '{\"api_management\": \"API Management\", \"external_services\": \"External Services\", \"third_party_integrations\": \"Third Party Integrations\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(55, 'dashboard', 'Dashboard Statistics', 'dashboard_statistics', '{\"draft\": \"Draft\", \"active\": \"Active\", \"inactive\": \"Inactive\", \"published\": \"Published\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(56, 'dashboard', 'Course Forms', 'course_forms', '{\"status_required\": \"Status *\", \"category_required\": \"Category *\", \"select_course_instructor\": \"Select the course instructor\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(57, 'dashboard', 'Course Creation', 'course_creation', '{\"price\": \"Price\", \"expiry_type\": \"Expiry Type\", \"course_level\": \"Course Level\", \"drip_content\": \"Drip Content\", \"course_status\": \"Course Status\", \"course_category\": \"Course Category\", \"course_language\": \"Course Language\", \"expiry_duration\": \"Expiry Duration\", \"select_category\": \"Select the course category\", \"course_instructor\": \"Course Instructor\", \"select_instructor\": \"Select the course instructor\", \"type_content_here\": \"Type your content here...\", \"enter_course_price\": \"Enter your course price ($0)\", \"enter_course_title\": \"Enter Course Title\", \"enable_drip_content\": \"Enable drip content for this course\", \"enter_discount_price\": \"Enter discount price\", \"check_course_discount\": \"Check if this course has discount\", \"pricing_type_required\": \"Pricing type *\", \"type_caption_optional\": \"Type caption for image (optional)\", \"enter_short_description\": \"Enter Short Description\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(58, 'dashboard', 'Course Update Header', 'course_update_header', '{\"course_player\": \"Course Player\", \"course_preview\": \"Course Preview\", \"submit_for_approval\": \"Submit for Approval\", \"course_ready_approval\": \"This course is ready for approval!\", \"course_approval_status\": \"Course Approval Status\", \"course_content_summary\": \"Course Content Summary\", \"course_needs_attention\": \"This course needs attention before it can be approved:\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(59, 'dashboard', 'Course Info', 'course_info', '{\"outcomes\": \"Outcomes\", \"sort_items\": \"Sort Items\", \"course_faqs\": \"Course Faqs\", \"requirements\": \"Requirements\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(60, 'dashboard', 'Live Classes', 'live_classes', '{\"edit_class\": \"Edit Class\", \"join_class\": \"Join Class\", \"scheduling\": \"Scheduling...\", \"enable_zoom\": \"Enable Zoom\", \"delete_class\": \"Delete Class\", \"live_classes\": \"Live Classes\", \"schedule_class\": \"Schedule Class\", \"zoom_not_enabled\": \"Zoom is not enabled for this course. Please enable Zoom to schedule live classes.\", \"enter_class_topic\": \"Enter class topic\", \"schedule_live_class\": \"Schedule Live Class\", \"class_notes_optional\": \"Class Notes (Optional)\", \"class_topic_required\": \"Class Topic *\", \"schedule_new_live_class\": \"Schedule New Live Class\", \"start_date_time_required\": \"Start Date & Time *\", \"no_live_classes_scheduled\": \"No Live Classes Scheduled\", \"schedule_first_live_class\": \"Schedule your first live class to get started with Zoom.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(61, 'dashboard', 'Media Management', 'media_management', '{\"banner\": \"Banner\", \"thumbnail\": \"Thumbnail\", \"enter_video_url\": \"Enter video URL\", \"preview_video_url\": \"Preview Video URL\", \"preview_video_type\": \"Preview Video Type\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(62, 'dashboard', 'Blog Categories', 'blog_categories', '{\"blog_category\": \"Blog Category\", \"blog_categories\": \"Blog Categories\", \"update_category\": \"Update Category\", \"category_thumbnail\": \"Category Thumbnail\", \"category_description\": \"Category Description\", \"total_number_of_blog\": \"Total number of blog\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(63, 'dashboard', 'Blog Form', 'blog_form', '{\"add_blog\": \"Add Blog\", \"blog_banner\": \"Blog Banner\", \"media_files\": \"Media Files\", \"update_blog\": \"Update Blog\", \"title_80_char\": \"Title (80 Character)\", \"blog_thumbnail\": \"Blog Thumbnail\", \"blog_information\": \"Blog Information\", \"enter_blog_title\": \"Enter blog title\", \"keywords_80_char\": \"Keywords (80 Character)\", \"enter_your_keywords\": \"Enter your keywords\", \"provide_blog_details\": \"Provide the essential details about your blog post\", \"write_blog_content_here\": \"Write your blog content here...\", \"upload_banner_thumbnail_desc\": \"Upload banner and thumbnail images for your blog\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(64, 'dashboard', 'Category Form', 'category_form', '{\"icon_picker\": \"Icon Picker\", \"subtitle_80_char\": \"Subtitle (80 Character)\", \"pick_category_icon\": \"Pick your category icon\", \"enter_category_name\": \"Enter category name\", \"enter_category_description\": \"Enter category description\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(65, 'dashboard', 'Course Management', 'course_management', '{\"outcomes\": \"Outcomes\", \"course_faqs\": \"Course Faqs\", \"enable_zoom\": \"Enable Zoom\", \"live_classes\": \"Live Classes\", \"requirements\": \"Requirements\", \"zoom_not_enabled\": \"Zoom is not enabled for this course. Please enable Zoom to schedule live classes.\", \"no_live_classes_scheduled\": \"No Live Classes Scheduled\", \"schedule_first_live_class\": \"Schedule your first live class to get started with Zoom.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(66, 'dashboard', 'SEO Form', 'seo_form', '{\"og_title\": \"OG Title\", \"meta_title\": \"Meta Title\", \"meta_keywords\": \"Meta Keywords\", \"og_description\": \"OG Description\", \"meta_description\": \"Meta Description\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(67, 'dashboard', 'Question Form', 'question_form', '{\"true_false\": \"True of False\", \"question_type\": \"Question Type\", \"single_choice\": \"Single Choice\", \"question_title\": \"Question Title\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(68, 'dashboard', 'Lesson Form', 'lesson_form', '{\"is_free\": \"Is Free\", \"video_url\": \"Video URL\", \"image_file\": \"Image File\", \"video_file\": \"Video File\", \"lesson_type\": \"Lesson Type\", \"embed_source\": \"Embed Source\", \"lesson_title\": \"Lesson Title\", \"text_content\": \"Text Content\", \"document_file\": \"Document File\", \"lesson_status\": \"Lesson Status\", \"lesson_duration\": \"Lesson Duration\", \"lesson_provider\": \"Lesson Provider\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(69, 'dashboard', 'Live Class Form', 'live_class_form', '{\"class_notes\": \"Class Notes (Optional)\", \"class_topic\": \"Class Topic\", \"start_date_time\": \"Start Date & Time\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(70, 'dashboard', 'Course Status', 'course_status', '{\"feedback\": \"Feedback\", \"course_ready_approval\": \"This course is ready for approval!\", \"course_approval_status\": \"Course Approval Status\", \"course_content_summary\": \"Course Content Summary\", \"course_needs_attention\": \"This course needs attention before it can be approved:\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(71, 'dashboard', 'Course Info Sections', 'course_info_sections', '{\"outcomes\": \"Outcomes\", \"course_faqs\": \"Course Faqs\", \"requirements\": \"Requirements\", \"section_title\": \"Section Title\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(72, 'dashboard', 'Live Class', 'live_class', '{\"live_classes\": \"Live Classes\", \"zoom_not_enabled_message\": \"Zoom is not enabled for this course. Please enable Zoom to schedule live classes.\", \"no_live_classes_scheduled\": \"No Live Classes Scheduled\", \"schedule_first_live_class\": \"Schedule your first live class to get started with Zoom.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(73, 'dashboard', 'Live Class Status', 'live_class_status', '{\"live\": \"live\", \"ended\": \"ended\", \"upcoming\": \"upcoming\", \"scheduled\": \"scheduled\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(74, 'frontend', 'Status & Error Messages', 'status_error_messages', '{\"posting\": \"Posting...\", \"replies\": \"Replies\", \"replying\": \"Replying...\", \"network_error\": \"Network error. Please check your connection.\", \"delete_warning\": \"Are you sure to delete?\", \"invalid_file_type\": \"Invalid file type. Please select a valid file.\", \"no_element_available\": \"No element available\", \"something_went_wrong\": \"Something went wrong. Please try again.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(75, 'frontend', 'Common Views', 'common_views', '{\"all\": \"All\", \"closed\": \"Closed\", \"section\": \"Section\", \"grid_view\": \"Grid View\", \"list_view\": \"List View\", \"join_class\": \"Join Class\", \"no_lesson_found\": \"No lesson found\", \"company_fallback\": \"TechCorp Inc.\", \"notification_list\": \"Notification List\", \"section_properties\": \"Section Properties\", \"no_unread_notifications\": \"No unread notifications\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(76, 'frontend', 'Common Success Messages', 'common_success_messages', '{\"reply_posted\": \"Reply posted successfully\", \"email_changed\": \"Email changed successfully\", \"job_circulars\": \"Job Circulars\", \"comment_posted\": \"Comment posted successfully\", \"profile_updated\": \"Profile updated successfully\", \"password_changed\": \"Password changed successfully\", \"email_not_verified\": \"Your email is not verified yet. Please verify your email address by clicking on the link we just emailed to you.\", \"application_submitted\": \"Application submitted successfully\", \"verification_link_sent\": \"A new verification link has been sent to the email address you provided during registration.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(77, 'frontend', 'Navigation & Pagination', 'navigation_pagination', '{\"sort_by\": \"Sort by\", \"last_page\": \"Last page\", \"first_page\": \"First page\", \"privacy_policy\": \"Privacy Policy\", \"showing_results\": \"Showing :from to :to of :total results\", \"terms_of_service\": \"Terms of Service\", \"student_dashboard\": \"Student Dashboard\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(78, 'frontend', 'Course Lists', 'course_lists', '{\"star\": \"Star\", \"stars\": \"Stars\", \"review\": \"Review\", \"characters\": \"Characters\", \"edit_review\": \"Edit Review\", \"submit_review\": \"Submit Review\", \"you_rated_this\": \"You rated this\", \"no_courses_found\": \"No courses found\", \"no_wishlist_items\": \"No wishlist items found\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(79, 'frontend', 'Job Circulars', 'job_circulars', '{\"posted\": \"Posted\", \"day_left\": \"1 day left\", \"job_type\": \"Job Type\", \"location\": \"Location\", \"days_left\": \":days days left\", \"work_type\": \"Work Type\", \"negotiable\": \"Negotiable\", \"quick_apply\": \"Quick Apply\", \"last_updated\": \"Last updated\", \"contact_email\": \"Contact Email\", \"job_statistics\": \"Job Statistics\", \"apply_via_email\": \"Apply via Email\", \"job_description\": \"Job Description\", \"skills_required\": \"Skills Required\", \"experience_level\": \"Experience Level\", \"send_application\": \"Send your application directly to our team\", \"positions_available\": \"Positions Available\", \"application_deadline\": \"Application Deadline\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(80, 'frontend', 'Shopping Cart', 'shopping_cart', '{\"tax\": \"Tax\", \"total\": \"Total\", \"discount\": \"Discount\", \"sub_total\": \"Sub total\", \"cart_items\": \"Cart items\", \"payment_summary\": \"Payment summary\", \"your_cart_is_empty\": \"Your cart is empty\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(81, 'frontend', 'Blog System', 'blog_system', '{\"like\": \"like\", \"dislike\": \"dislike\", \"all_blogs\": \"All Blogs\", \"author_alt\": \"Author\", \"blog_list_alt\": \"Blog List\", \"post_a_comment\": \"Post A Comment\", \"blog_banner_alt\": \"Blog banner\", \"no_comments_yet\": \"No comments yet. Be the first to comment!\", \"default_site_name\": \"Mentor Learning Management System\", \"latest_blog_posts\": \"Latest Blog Posts\", \"blog_page_keywords\": \"blogs, articles, tutorials, news, posts, learning, education\", \"blog_thumbnail_alt\": \"Blog thumbnail\", \"blog_page_description\": \"Read :total+ articles and tutorials from our instructors and team. Stay updated with insights, news, and how‑to guides.\", \"author_initials_fallback\": \"AU\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(82, 'frontend', 'Zoom Live Class', 'zoom_live_class', '{\"try_again\": \"Try Again\", \"joining_meeting\": \"Joining Meeting...\", \"loading_zoom_sdk\": \"Loading Zoom SDK...\", \"open_in_zoom_app\": \"Open in Zoom App\", \"zoom_sdk_not_loaded\": \"Zoom SDK not loaded\", \"you_can_join_directly\": \"You can join directly using:\", \"failed_to_join_meeting\": \"Failed to join meeting\", \"unable_to_join_meeting\": \"Unable to Join Meeting\", \"zoom_sdk_not_configured\": \"Zoom SDK not configured. Please contact administrator.\", \"failed_to_initialize_meeting\": \"Failed to initialize meeting\", \"meeting_information_not_found\": \"Meeting information not found.\", \"failed_to_get_meeting_configuration\": \"Failed to get meeting configuration\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(83, 'frontend', 'Certificate', 'certificate', '{\"completed_on\": \"Completed on: :date\", \"download_format\": \"Download Format\", \"pdf_certificate_saved\": \"Your PDF certificate has been saved to your downloads folder.\", \"png_certificate_saved\": \"Your PNG certificate has been saved to your downloads folder.\", \"authorized_certificate\": \"Authorized Certificate of Achievement\", \"certificate_description\": \"This certificate is proudly presented to acknowledge the successful completion of all course requirements and demonstrates a strong commitment to professional development and learning excellence. This is to certify that\", \"certificate_of_completion\": \"Certificate of Completion\", \"has_successfully_completed\": \"has successfully completed the course\", \"course_certificate_download\": \"Course Certificate Download\", \"download_official_certificate\": \"Download your official course completion certificate\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(84, 'frontend', 'Quiz Viewer', 'quiz_viewer', '{\"true\": \"True\", \"false\": \"False\", \"hours\": \"Hours\", \"passed\": \"Passed\", \"result\": \"Result\", \"retake\": \"Retake\", \"minutes\": \"Minutes\", \"seconds\": \"Seconds\", \"summery\": \"Summery\", \"duration\": \"Duration\", \"not_passed\": \"Not Passed\", \"pass_marks\": \"Pass Marks\", \"start_quiz\": \"Start Quiz\", \"retake_quiz\": \"Retake Quiz\", \"total_marks\": \"Total Marks\", \"quiz_submitted\": \"Quiz Submitted\", \"correct_answers\": \"Correct Answers\", \"retake_attempts\": \"Retake Attempts\", \"total_questions\": \"Total Questions\", \"incorrect_answers\": \"Incorrect Answers\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(85, 'frontend', 'Document Viewer', 'document_viewer', '{\"document\": \"Document\", \"download\": \"Download\", \"pdf_document\": \"PDF Document\", \"text_document\": \"Text Document\", \"open_in_new_tab\": \"Open in new tab\", \"download_document\": \"Download document\", \"open_in_new_tab_button\": \"Open in New Tab\", \"unsupported_document_format\": \"Unsupported Document Format\", \"document_format_cannot_be_previewed\": \"This document format (.{extension}) cannot be previewed directly. You can download it to view with an appropriate application.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(86, 'frontend', 'Course Details', 'course_details', '{\"free\": \"Free\", \"level\": \"Level\", \"language\": \"Language\", \"outcomes\": \"Outcomes\", \"students\": \"Students\", \"requirements\": \"Requirements\", \"view_details\": \"View Details\", \"expiry_period\": \"Expiry Period\", \"default_author\": \"UiLib\", \"student_reviews\": \"Student Reviews\", \"no_reviews_found\": \"No reviews found.\", \"course_curriculum\": \"Course curriculum\", \"enrolled_students\": \"Enrolled Students\", \"course_certificate\": \"Course Certificate\", \"certificate_included\": \"Certificate Included\", \"there_is_no_lesson_added\": \"There is no lesson added\", \"learn_comprehensive_course\": \"Learn with our comprehensive course\", \"online_course_learning_lms\": \"online course, learning, LMS\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(87, 'frontend', 'Course Actions', 'course_actions', '{\"buy_now\": \"Buy Now\", \"enroll_now\": \"Enroll Now\", \"add_to_cart\": \"Add to cart\", \"play_course\": \"Play Course\", \"course_player\": \"Course Player\", \"add_to_wishlist\": \"Add to Wishlist\", \"remove_from_wishlist\": \"Remove from Wishlist\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(88, 'frontend', 'Pagination', 'pagination', '{\"next\": \"Next\", \"prev\": \"Prev\", \"go_to_page_colon\": \"Go to page:\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(89, 'frontend', 'Course Cards', 'course_cards', '{\"student\": \"Student\", \"progress\": \"Progress\", \"trending\": \"Trending\", \"course_details\": \"Course Details\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(90, 'frontend', 'Dashboard', 'dashboard', '{\"courses\": \"Courses\", \"lessons\": \"Lessons\", \"students\": \"Students\", \"view_all\": \"View All\", \"dashboard\": \"Dashboard\", \"enrollment\": \"Enrollment\", \"no_results\": \"No results.\", \"course_status\": \"Course Status\", \"latest_pending_withdrawal_request\": \"Latest Pending Withdrawal Request\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(91, 'frontend', 'Installer', 'installer', '{\"click_here\": \"Click here\", \"admin_setup\": \"Admin Setup\", \"php_extension\": \"PHP Extension\", \"setup_complete\": \"Setup complete\", \"important_notes\": \"Important Notes\", \"test_connection\": \"Test Connection\", \"symlink_function\": \"Symlink Function\", \"symlink_required\": \"Required for Laravel\'s storage:link command to make uploaded files publicly accessible\", \"environment_setup\": \"Environment Setup\", \"database_connection\": \"Database Connection\", \"get_back_to_project\": \"to get back to your project.\", \"environment_variables_set\": \"Your changed environment variables are set in the .env file now.\", \"server_requirements_not_met\": \"Your server doesn\'t meet the following requirements\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(92, 'frontend', 'Time Formats', 'time_formats', '{\"days_ago\": \":days days ago\", \"hour_ago\": \"1 hour ago\", \"just_now\": \"Just now\", \"week_ago\": \"1 week ago\", \"year_ago\": \"1 year ago\", \"hours_ago\": \":hours hours ago\", \"month_ago\": \"1 month ago\", \"weeks_ago\": \":weeks weeks ago\", \"years_ago\": \":years years ago\", \"minute_ago\": \"1 minute ago\", \"months_ago\": \":months months ago\", \"minutes_ago\": \":minutes minutes ago\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(93, 'input', 'Authentication & User Info', 'authentication_user_info', '{\"email\": \"Email\", \"phone\": \"Phone\", \"password\": \"Password\", \"username\": \"Username\", \"from_name\": \"From Name\", \"full_name\": \"Full Name\", \"new_email\": \"New Email\", \"your_email\": \"Your Email\", \"profile_url\": \"Profile URL\", \"remember_me\": \"Remember me\", \"from_address\": \"From Address\", \"new_password\": \"New Password\", \"system_email\": \"System Email\", \"account_email\": \"Account Email\", \"contact_email\": \"Contact Email\", \"current_email\": \"Current Email\", \"email_address\": \"Email address\", \"confirm_password\": \"Confirm password\", \"current_password\": \"Current Password\", \"confirm_new_password\": \"Confirm New Password\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(94, 'input', 'General Content & Metadata', 'general_content_metadata', '{\"url\": \"URL\", \"icon\": \"Icon\", \"name\": \"Name\", \"slug\": \"Slug\", \"tags\": \"Tags\", \"title\": \"Title\", \"active\": \"Active\", \"author\": \"Author\", \"banner\": \"Banner\", \"slogan\": \"Slogan\", \"status\": \"Status\", \"og_title\": \"OG Title\", \"url_slug\": \"URL Slug\", \"sub_title\": \"Sub Title\", \"thumbnail\": \"Thumbnail\", \"list_items\": \"List Items\", \"meta_title\": \"Meta Title\", \"action_type\": \"Action Type\", \"description\": \"Description\", \"meta_keywords\": \"Meta Keywords\", \"dropdown_items\": \"Dropdown Items\", \"og_description\": \"OG Description\", \"background_color\": \"Background Color\", \"background_image\": \"Background Image\", \"meta_description\": \"Meta Description\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(95, 'input', 'Courses & Lessons', 'courses_lessons', '{\"price\": \"Price\", \"select\": \"Select\", \"made_in\": \"Made in\", \"summary\": \"Summary\", \"duration\": \"Duration\", \"video_url\": \"Video URL\", \"class_notes\": \"Class Notes (Optional)\", \"class_topic\": \"Class Topic\", \"course_name\": \"Course Name\", \"expiry_date\": \"Expiry date\", \"lesson_type\": \"Lesson type\", \"requirement\": \"Requirement\", \"course_level\": \"Course level\", \"embed_source\": \"Embed source\", \"pricing_type\": \"Pricing type\", \"select_image\": \"Select image\", \"select_video\": \"Select video\", \"student_name\": \"Student Name\", \"preview_video\": \"Preview Video\", \"completion_date\": \"Completion Date\", \"course_discount\": \"Course Discount\", \"course_language\": \"Course Language\", \"download_format\": \"Download Format\", \"enrollment_type\": \"Enrollment Type\", \"select_document\": \"Select document\", \"select_provider\": \"Select Provider\", \"start_date_time\": \"Start Date & Time\", \"certificate_size\": \"Certificate Size\", \"course_instructor\": \"Course Instructor\", \"short_description\": \"Short Description\", \"expiry_period_type\": \"Expiry period type\", \"preview_video_type\": \"Preview Video Type\", \"video_url_provider\": \"Video URL Provider\", \"enable_drip_content\": \"Enable drip content\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(96, 'input', 'Exams, Questions & Feedback', 'exams_questions_feedback', '{\"hours\": \"Hours\", \"answer\": \"Answer\", \"rating\": \"Rating\", \"minutes\": \"Minutes\", \"options\": \"Options\", \"outcome\": \"Outcome\", \"seconds\": \"Seconds\", \"feedback\": \"Feedback\", \"keywords\": \"Keywords\", \"question\": \"Question\", \"pass_mark\": \"Pass Mark\", \"your_text\": \"Enter your text\", \"total_mark\": \"Total Mark\", \"your_review\": \"Your Review\", \"question_type\": \"Question Type\", \"section_title\": \"Section Title\", \"question_title\": \"Question Title\", \"retake_attempts\": \"Retake Attempts\", \"title_80_character\": \"Title (80 Character)\", \"keywords_80_character\": \"Keywords (80 Character)\", \"subtitle_80_character\": \"Subtitle (80 Character)\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18');
INSERT INTO `language_properties` (`id`, `group`, `name`, `slug`, `properties`, `language_id`, `created_at`, `updated_at`) VALUES
(97, 'input', 'Jobs & Resume', 'jobs_resume', '{\"resume\": \"Resume\", \"skills\": \"Skills\", \"currency\": \"Currency\", \"job_type\": \"Job Type\", \"location\": \"Location\", \"biography\": \"Biography\", \"job_title\": \"Job Title\", \"work_type\": \"Work Type\", \"designation\": \"Designation\", \"maximum_salary\": \"Maximum Salary\", \"minimum_salary\": \"Minimum Salary\", \"job_description\": \"Job Description\", \"skills_required\": \"Skills Required\", \"experience_level\": \"Experience Level\", \"positions_available\": \"Positions Available\", \"application_deadline\": \"Application Deadline\", \"salary_is_negotiable\": \"Salary is Negotiable\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(98, 'input', 'Payments, APIs & Keys', 'payments_apis_keys', '{\"host\": \"Host\", \"port\": \"Port\", \"amount\": \"Amount\", \"api_key\": \"API Key\", \"send_to\": \"Send To\", \"subject\": \"Subject\", \"store_id\": \"Store ID\", \"client_id\": \"Client ID\", \"account_id\": \"Account ID\", \"api_secret\": \"API Secret\", \"encryption\": \"Encryption\", \"secret_key\": \"Secret Key\", \"bucket_name\": \"Bucket Name\", \"mail_driver\": \"Mail Driver\", \"live_api_key\": \"Live API Key\", \"test_api_key\": \"Test API Key\", \"access_key_id\": \"Access Key ID\", \"client_secret\": \"Client Secret\", \"default_region\": \"Default Region\", \"storage_driver\": \"Storage Driver\", \"store_password\": \"Store Password\", \"webhook_secret\": \"Webhook Secret\", \"live_public_key\": \"Live Public Key\", \"live_secret_key\": \"Live Secret Key\", \"public_live_key\": \"Public Live Key\", \"public_test_key\": \"Public Test Key\", \"secret_live_key\": \"Secret Live Key\", \"secret_test_key\": \"Secret Test Key\", \"test_public_key\": \"Test Public Key\", \"test_secret_key\": \"Test Secret Key\", \"sandbox_client_id\": \"Sandbox Client ID\", \"secret_access_key\": \"Secret Access Key\", \"sandbox_secret_key\": \"Sandbox Secret Key\", \"production_client_id\": \"Production Client ID\", \"meeting_sdk_client_id\": \"Meeting SDK Client ID\", \"production_secret_key\": \"Production Secret Key\", \"do_you_want_use_web_sdk\": \"Do you want to use Web SDK for your live class?\", \"meeting_sdk_client_secret\": \"Meeting SDK Client Secret\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(99, 'input', 'Integrations & Configurations', 'integrations_configurations', '{\"coupon\": \"Coupon\", \"github\": \"GitHub\", \"favicon\": \"Favicon\", \"twitter\": \"Twitter\", \"website\": \"Website\", \"category\": \"Category\", \"facebook\": \"Facebook\", \"linkedin\": \"LinkedIn\", \"logo_dark\": \"Logo Dark\", \"mail_host\": \"Mail Host\", \"mail_port\": \"Mail Port\", \"logo_light\": \"Logo Light\", \"blog_banner\": \"Blog Banner\", \"website_name\": \"Website Name\", \"category_icon\": \"Category Icon\", \"mail_password\": \"Mail Password\", \"mail_username\": \"Mail Username\", \"page_contents\": \"Page Contents\", \"select_option\": \"Select an option\", \"website_title\": \"Website Title\", \"blog_thumbnail\": \"Blog Thumbnail\", \"mail_from_name\": \"Mail From Name\", \"category_status\": \"Category Status\", \"mail_encryption\": \"Mail Encryption\", \"select_zip_file\": \"Select File (.zip only)\", \"google_client_id\": \"Google Client ID\", \"aws_access_key_id\": \"AWS Access Key ID\", \"mail_from_address\": \"Mail From Address\", \"aws_default_region\": \"AWS Default Region\", \"course_selling_tax\": \"Course Selling Tax (%)\", \"instructor_revenue\": \"Instructor Revenue (%)\", \"google_redirect_uri\": \"Google Redirect URI\", \"google_client_secret\": \"Google Client Secret\", \"merchant_id_public_key\": \"Merchant ID/Public Key\", \"course_selling_currency\": \"Course Selling Currency\", \"merchant_key_secret_key\": \"Merchant Key/Secret Key\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(100, 'input', 'Authentication & User Info Placeholder', 'authentication_user_info_placeholder', '{\"email_placeholder\": \"email@example.com\", \"password_placeholder\": \"Enter password\", \"username_placeholder\": \"Enter username\", \"full_name_placeholder\": \"Enter your full name\", \"new_email_placeholder\": \"Enter your new email\", \"your_name_placeholder\": \"Enter your name\", \"system_type_placeholder\": \"Select System Type\", \"new_password_placeholder\": \"Enter your new password\", \"phone_number_placeholder\": \"Enter Phone Number\", \"contact_email_placeholder\": \"hr@company.com\", \"current_email_placeholder\": \"Enter your current email\", \"confirm_password_placeholder\": \"Confirm password\", \"current_password_placeholder\": \"Enter your current password\", \"rewrite_password_placeholder\": \"Rewrite your new password\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(101, 'input', 'General Content & Metadata Placeholder', 'general_content_metadata_placeholder', '{\"url_placeholder\": \"Enter URL (e.g., /courses, https://example.com)\", \"icon_placeholder\": \"Pick your icon\", \"name_placeholder\": \"Enter your name\", \"slug_placeholder\": \"Enter unique slug\", \"tags_placeholder\": \"Enter tags...\", \"title_placeholder\": \"Enter title\", \"status_placeholder\": \"Select status\", \"caption_placeholder\": \"Type caption for image (optional)\", \"og_title_placeholder\": \"Enter OG Title\", \"image_url_placeholder\": \"Image URL or path\", \"page_name_placeholder\": \"Enter Page Name\", \"page_slug_placeholder\": \"Enter Page Slug\", \"meta_title_placeholder\": \"Enter Meta Title\", \"page_title_placeholder\": \"Enter Page Title\", \"action_type_placeholder\": \"Select action type\", \"description_placeholder\": \"Enter description\", \"content_here_placeholder\": \"Type your content here...\", \"meta_keywords_placeholder\": \"Enter Meta Keywords\", \"section_title_placeholder\": \"Enter your section title\", \"og_description_placeholder\": \"Enter OG Description\", \"meta_description_placeholder\": \"Enter Meta Description\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(102, 'input', 'Courses & Lessons Placeholder', 'courses_lessons_placeholder', '{\"category_placeholder\": \"Select a category\", \"duration_placeholder\": \"00:00:00\", \"provider_placeholder\": \"Select a provider\", \"video_url_placeholder\": \"Enter your video url\", \"instructor_placeholder\": \"Select the course instructor\", \"quiz_title_placeholder\": \"Enter quiz title\", \"class_topic_placeholder\": \"Enter class topic\", \"course_name_placeholder\": \"Enter the course name\", \"course_level_placeholder\": \"Select your course level\", \"course_price_placeholder\": \"Enter your course price ($0)\", \"course_title_placeholder\": \"Enter Course Title\", \"embed_source_placeholder\": \"Enter the embed source url\", \"lesson_title_placeholder\": \"Lesson title\", \"discount_price_placeholder\": \"Enter your discount price ($0)\", \"type_video_url_placeholder\": \"Type your video url\", \"approval_status_placeholder\": \"Select the approval status\", \"course_language_placeholder\": \"Select your course language\", \"certificate_size_placeholder\": \"Select certificate size\", \"short_description_placeholder\": \"Enter Short Description\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(103, 'input', 'Jobs & Resume Placeholder', 'jobs_resume_placeholder', '{\"currency_placeholder\": \"Select your currency\", \"location_placeholder\": \"e.g., Dhaka, Bangladesh\", \"url_slug_placeholder\": \"senior-react-developer\", \"biography_placeholder\": \"Write about yourself\", \"job_title_placeholder\": \"e.g., Senior React Developer\", \"skills_tag_placeholder\": \"Enter the skills as a tag\", \"designation_placeholder\": \"Enter your designation\", \"about_yourself_placeholder\": \"Write about yourself\", \"maximum_salary_placeholder\": \"Enter maximum salary\", \"minimum_salary_placeholder\": \"Enter minimum salary\", \"job_description_placeholder\": \"Provide a detailed description of the role, expectations, and what makes this opportunity exciting...\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(104, 'input', 'Payments, APIs & Keys Placeholder', 'payments_apis_keys_placeholder', '{\"coupon_placeholder\": \"Enter coupon\", \"api_key_placeholder\": \"Enter api key\", \"api_secret_placeholder\": \"Enter api secret\", \"your_amount_placeholder\": \"Enter your amount\", \"live_api_key_placeholder\": \"Enter live api key\", \"test_api_key_placeholder\": \"Enter test api key\", \"webhook_secret_placeholder\": \"Enter webhook secret\", \"live_public_key_placeholder\": \"Enter live public key\", \"live_secret_key_placeholder\": \"Enter live secret key\", \"test_public_key_placeholder\": \"Enter test public key\", \"test_secret_key_placeholder\": \"Enter test secret key\", \"paytm_merchant_id_placeholder\": \"Enter Paytm merchant ID\", \"sandbox_client_id_placeholder\": \"Enter sandbox client ID\", \"paytm_merchant_key_placeholder\": \"Enter Paytm merchant key\", \"sandbox_secret_key_placeholder\": \"Enter sandbox secret key\", \"mollie_live_api_key_placeholder\": \"Enter Mollie live api key\", \"mollie_test_api_key_placeholder\": \"Enter Mollie test api key\", \"razorpay_public_key_placeholder\": \"Enter Razorpay public key\", \"razorpay_secret_key_placeholder\": \"Enter Razorpay secret key\", \"production_client_id_placeholder\": \"Enter production client ID\", \"production_secret_key_placeholder\": \"Enter production secret key\", \"sslcommerz_public_key_placeholder\": \"Enter SSLCommerz public key\", \"sslcommerz_secret_key_placeholder\": \"Enter SSLCommerz secret key\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(105, 'input', 'Integrations & Configurations Placeholder', 'integrations_configurations_placeholder', '{\"https_placeholder\": \"https://example.com\", \"keywords_placeholder\": \"Enter Keywords\", \"port_587_placeholder\": \"587\", \"mail_host_placeholder\": \"smtp.example.com\", \"mail_port_placeholder\": \"587\", \"encryption_placeholder\": \"Select Encryption\", \"author_name_placeholder\": \"Enter Author Name\", \"bucket_name_placeholder\": \"Enter Bucket Name\", \"mail_driver_placeholder\": \"Select Mail Driver\", \"select_logo_placeholder\": \"Select Logo\", \"select_user_placeholder\": \"Select a user\", \"smtp_example_placeholder\": \"smtp.example.com\", \"system_email_placeholder\": \"Enter System Email\", \"website_name_placeholder\": \"Enter Website Name\", \"access_key_id_placeholder\": \"Enter Access Key ID\", \"mail_password_placeholder\": \"Enter your mail password\", \"mail_username_placeholder\": \"your-email@example.com\", \"select_banner_placeholder\": \"Select Banner\", \"select_course_placeholder\": \"Select a course\", \"website_title_placeholder\": \"Enter Website Title\", \"default_region_placeholder\": \"Enter Default Region\", \"mail_from_name_placeholder\": \"Your Application Name\", \"select_favicon_placeholder\": \"Select Favicon\", \"storage_driver_placeholder\": \"Select Storage Driver\", \"website_slogan_placeholder\": \"Enter Website Slogan\", \"zoom_client_id_placeholder\": \"Enter your Zoom client ID\", \"noreply_example_placeholder\": \"noreply@example.com\", \"zoom_account_id_placeholder\": \"Enter your Zoom account ID\", \"google_client_id_placeholder\": \"Enter your google client id\", \"selling_currency_placeholder\": \"Select Selling Currency\", \"aws_access_key_id_placeholder\": \"Enter AWS Access Key ID\", \"mail_from_address_placeholder\": \"noreply@example.com\", \"secret_access_key_placeholder\": \"Enter Secret Access Key\", \"your_company_name_placeholder\": \"Your Company Name\", \"aws_default_region_placeholder\": \"us-east-1\", \"revenue_percentage_placeholder\": \"Enter Instructor Revenue Percentage\", \"zoom_account_email_placeholder\": \"Enter your Zoom account email\", \"zoom_client_secret_placeholder\": \"Enter your Zoom client secret\", \"google_redirect_url_placeholder\": \"Enter your google redirect url\", \"website_description_placeholder\": \"Enter Website Description\", \"google_client_secret_placeholder\": \"Enter your google client secret\", \"meeting_sdk_client_id_placeholder\": \"Enter your Meeting SDK client ID\", \"selling_tax_percentage_placeholder\": \"Enter Selling Tax Percentage\", \"meeting_sdk_client_secret_placeholder\": \"Enter your Meeting SDK client secret\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(106, 'table', 'Common Elements', 'common_elements', '{\"csv\": \"CSV\", \"type\": \"Type\", \"resume\": \"Resume\", \"no_data\": \"No data available\", \"previous\": \"Prev\", \"go_to_page\": \"Go to page:\", \"view_resume\": \"View Resume\", \"total_results\": \"Total results\", \"img_placeholder\": \"IMG\", \"showing_results\": \"Showing results\", \"delete_course_warning\": \"After deleting the course, all the related data, like, course sections, lessons, quizzes, enrollments, etc will be deleted automatically.\", \"delete_instructor_warning\": \"After deleting the instructor, the admin will be the assign as a new instructor, of this instructor all the courses.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(107, 'table', 'Table Headers Management', 'table_headers_management', '{\"name\": \"Name\", \"role\": \"Role\", \"slug\": \"Slug\", \"email\": \"Email\", \"title\": \"Title\", \"creator\": \"Creator\", \"sections\": \"Sections\", \"use_case\": \"Use Case\", \"enrollments\": \"Enrollments\", \"expiry_date\": \"Expiry Date\", \"payout_date\": \"Payout Date\", \"course_title\": \"Course Title\", \"category_name\": \"Category Name\", \"enrolled_date\": \"Enrolled Date\", \"meta_keywords\": \"Meta Keywords\", \"payout_amount\": \"Payout amount\", \"payout_method\": \"Payout Method\", \"category_child\": \"Category Child\", \"processed_date\": \"Processed Date\", \"enrolled_course\": \"Enrolled Course\", \"meta_description\": \"Meta Description\", \"number_of_course\": \"Number Of Course\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(108, 'table', 'Table Action Labels', 'table_action_labels', '{\"action\": \"Action\", \"status\": \"Status\", \"custom_pages\": \"Custom Pages\", \"add_custom_page\": \"Add Custom Page\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(109, 'table', 'Table Actions & Status', 'table_actions_status', '{\"pay\": \"Pay\", \"print\": \"Print\", \"select\": \"Select\", \"copy_url\": \"Copy URL\", \"selected\": \"Selected\", \"edit_page\": \"Edit Page\", \"preview_page\": \"Preview Page\", \"lifetime_access\": \"Lifetime access\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(110, 'table', 'Content Text Table Specific', 'content_text_table_specific', '{\"url_copied\": \"URL copied to clipboard\", \"best_single_instructor\": \"Best for Single Instructor\", \"best_multiple_instructors\": \"Best for Multiple Instructors\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(111, 'settings', 'Settings Configuration & Management', 'settings_configuration_management', '{\"social_links\": \"Social Links\", \"page_settings\": \"Page Settings\", \"smtp_settings\": \"SMTP Settings\", \"system_settings\": \"System Settings\", \"account_settings\": \"Account Settings\", \"payment_gateways\": \"Payment Gateways\", \"storage_settings\": \"Storage Settings\", \"language_settings\": \"Language Settings\", \"custom_global_style\": \"Custom Global Style\", \"language_properties\": \"Language Properties\", \"live_class_settings\": \"Live Class Settings\", \"translate_language_properties\": \"Translate Language Properties\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(112, 'settings', 'Common Application Terms', 'common_application_terms', '{\"application_backup\": \"Application Backup\", \"application_update\": \"Application Update\", \"application_updated\": \"Application updated successfully\", \"updating_application\": \"Updating application...\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(113, 'settings', 'Common Backup Terms', 'common_backup_terms', '{\"backup_date\": \"Backup Date\", \"backup_name\": \"Backup Name\", \"backup_size\": \"Size\", \"backup_failed\": \"Backup creation failed. Please try again.\", \"backup_status\": \"Status\", \"backup_actions\": \"Actions\", \"backup_created\": \"Backup created successfully\", \"backup_deleted\": \"Backup deleted successfully\", \"backup_history\": \"Backup History\", \"backup_restored\": \"Backup restored successfully\", \"backup_recommendation\": \"We strongly recommend creating a backup before updating.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(114, 'settings', 'Common Descriptions', 'common_descriptions', '{\"elements\": \"Elements\", \"configure_zoom\": \"Configure Zoom Server-to-Server OAuth Credentials\", \"css_description\": \"Write custom CSS that will be applied globally to the site.\", \"edit_custom_page\": \"Edit Custom Page\", \"backup_description\": \"Create a complete backup of your application including files and database\", \"translation_update\": \"Translation Update\", \"update_description\": \"Upload and install application updates safely\", \"available_home_pages\": \"Available Home Pages\", \"home_pages_description\": \"List of all home pages in the system\", \"maintenance_description\": \"Update, backup and restore your application safely and automatically.\", \"translation_description\": \"Translate Language Properties\", \"custom_pages_description\": \"Manage your custom pages\", \"backup_history_description\": \"View and manage your application backups\", \"email_settings_description\": \"Configure your email sending settings\", \"system_settings_description\": \"Manage your system\'s core settings\", \"storage_settings_description\": \"Configure your storage settings\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(115, 'settings', 'Application Update', 'application_update', '{\"browser\": \"Browser\", \"downtime\": \"Downtime\", \"uploading\": \"Uploading...\", \"migrations\": \"Migrations\", \"file_format\": \"File Format\", \"backup_first\": \"Backup First\", \"compatibility\": \"Compatibility\", \"selected_file\": \"Selected file:\", \"refresh_server\": \"Refresh Server\", \"select_zip_file\": \"Select File (.zip only)\", \"maintenance_mode\": \"Maintenance Mode\", \"this_update_will\": \"This update will:\", \"browser_guideline\": \"Do not refresh or close browser during update\", \"downtime_guideline\": \"Update process may take several minutes\", \"update_application\": \"Update Application\", \"do_not_close_window\": \"Please do not close this window\", \"backup_first_warning\": \"Make sure you have created a backup first! This action cannot be undone.\", \"migrations_guideline\": \"Database migrations will be automatically applied\", \"put_site_maintenance\": \"Put the site in maintenance mode\", \"updating_application\": \"Updating application...\", \"file_format_guideline\": \"Upload must be a valid ZIP file\", \"refresh_server_button\": \"Refresh Server\", \"backup_first_guideline\": \"Always create a backup before updating\", \"compatibility_guideline\": \"Ensure the update is compatible with your system\", \"run_database_migrations\": \"Run database migrations\", \"update_application_with\": \"Are you sure you want to update the application with :filename?\", \"application_update_title\": \"Application Update\", \"process_may_take_minutes\": \"Process may take several minutes\", \"refresh_server_guideline\": \"Every time refresh server before updating\", \"replace_application_files\": \"Replace all application files\", \"confirm_application_update\": \"Confirm Application Update\", \"file_selected_successfully\": \"File selected successfully. Click \\\"Update Application\\\" to proceed.\", \"maintenance_mode_guideline\": \"Site will be temporarily unavailable during update\", \"upload_install_description\": \"Upload and install the latest version of your application\", \"important_update_guidelines\": \"Important Update Guidelines\", \"updating_application_button\": \"Updating Application...\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(116, 'settings', 'Payment Gateway Settings', 'payment_gateway_settings', '{\"paytm_settings\": \"Paytm Settings\", \"mollie_settings\": \"Mollie Settings\", \"paypal_settings\": \"PayPal Settings\", \"stripe_settings\": \"Stripe Settings\", \"paystack_settings\": \"Paystack Settings\", \"razorpay_settings\": \"Razorpay Settings\", \"sslcommerz_settings\": \"SSLCommerz Settings\", \"configure_payment_gateway\": \"Configure :gateway payment gateway\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(117, 'settings', 'Environment Settings', 'environment_settings', '{\"test_mode\": \"Test Mode\", \"using_live_keys\": \"Using Live Keys\", \"using_test_keys\": \"Using Test Keys\", \"using_live_environment\": \"Using Live Environment\", \"using_test_environment\": \"Using Test Environment\", \"using_sandbox_environment\": \"Using Sandbox Environment\", \"using_staging_environment\": \"Using Staging Environment\", \"using_production_environment\": \"Using Production Environment\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(118, 'settings', 'Credential Sections', 'credential_sections', '{\"api_credentials\": \"API Credentials\", \"live_credentials\": \"Live Credentials\", \"test_credentials\": \"Test Credentials\", \"sandbox_credentials\": \"Sandbox Credentials\", \"production_credentials\": \"Production Credentials\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(119, 'settings', 'Helper Messages', 'helper_messages', '{\"use_staging_key\": \"Use your staging :key\", \"use_live_mode_key\": \"Use your live mode :key\", \"use_test_mode_key\": \"Use your test mode :key\", \"use_production_key\": \"Use your production :key\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(120, 'settings', 'Common Warnings', 'common_warnings', '{\"update_warning\": \"This update will:\", \"system_type_warning\": \"Are you sure you want to change the system type? This action will affect the entire application behavior.\", \"delete_backup_warning\": \"Are you sure you want to delete this backup? This action cannot be undone.\", \"restore_backup_warning\": \"Are you sure you want to restore from this backup? This will:\", \"update_system_type_warning\": \"Are you sure to update system type?\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(121, 'settings', 'Common Configuration', 'common_configuration', '{\"configuration\": \"Configuration: Environment and config files\", \"config_not_found\": \"Configuration not found.\", \"footer_config_not_found\": \"Footer configuration not found.\", \"navbar_config_not_found\": \"Navbar configuration not found.\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(122, 'settings', 'General Settings', 'general_settings', '{\"app_version\": \"App Version\", \"app_maintenance\": \"App Maintenance\", \"current_version\": \"Current Version:\", \"manage_core_settings\": \"Manage your system\'s core settings\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(123, 'settings', 'Navbar & Footer', 'navbar_footer', '{\"after_login\": \"After Login\", \"before_login\": \"Before Login\", \"interactive_preview\": \"Interactive preview of\", \"live_footer_preview\": \"Live Footer Preview\", \"live_navbar_preview\": \"Live Navbar Preview\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(124, 'settings', 'Pages', 'pages', '{\"custom_pages\": \"Custom Pages\", \"collaborative\": \"Collaborative\", \"administrative\": \"Administrative\", \"available_home_pages\": \"Available Home Pages\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(125, 'settings', 'Maintenance', 'maintenance', '{\"note\": \"Note\", \"assets\": \"Assets: Uploaded media and public files\", \"database\": \"Database: Complete MySQL database dump\", \"source_code\": \"Source Code: All application files and code\", \"refresh_note\": \"Note: Every time refresh server before backup.\", \"configuration\": \"Configuration: Environment and config files\", \"what_backed_up\": \"What will be backed up?\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(126, 'settings', 'Backup Management', 'backup_management', '{\"do_not_close\": \"Please do not close this window\", \"backup_details\": \"Backup Details\", \"deleting_backup\": \"Deleting backup...\", \"cannot_be_undone\": \"Cannot be undone or recovered\", \"critical_warning\": \"Critical Warning\", \"restoring_backup\": \"Restoring backup...\", \"current_data_lost\": \"All current data and files will be lost\", \"action_cannot_undone\": \"This action cannot be undone\", \"remove_backup_record\": \"Remove the backup record from the database\", \"restore_process_time\": \"Process may take several minutes\", \"replace_current_files\": \"Overwrite all current application files\", \"restore_database_state\": \"Replace the entire database with backup data\", \"maintenance_mode_enabled\": \"Put the site in maintenance mode\", \"permanently_delete_files\": \"Permanently delete the backup files from storage\", \"restore_backup_confirmation\": \"Are you sure you want to restore the backup \\\":backup_name\\\"?\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(127, 'settings', 'Website Settings', 'website_settings', '{\"logo_favicon\": \"Logo & Favicon\", \"media_settings\": \"Media Settings\", \"social_media_links\": \"Social Media Links\", \"contact_information\": \"Contact Information\", \"website_information\": \"Website Information\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(128, 'settings', 'Update Process', 'update_process', '{\"do_not_close\": \"Please do not close this window\", \"replace_files\": \"Replace all application files\", \"process_update\": \"Process the update automatically\", \"run_migrations\": \"Run database migrations\", \"maintenance_mode\": \"Put the site in maintenance mode\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(129, 'settings', 'Live Class Settings', 'live_class_settings', '{\"configure_zoom\": \"Configure Zoom Server-to-Server OAuth Credentials\", \"create_zoom_app\": \"Create a Server-to-Server OAuth app in Zoom Marketplace\", \"get_credentials\": \"Get your Account ID, Client ID, and Client Secret\", \"configure_scopes\": \"Configure the required scopes for your app\", \"zoom_setup_guide\": \"Zoom Setup Guide\", \"setup_instructions\": \"Follow these steps to set up Zoom integration:\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_resources`
--

CREATE TABLE `lesson_resources` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_lesson_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marksheet_templates`
--

CREATE TABLE `marksheet_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'course',
  `logo_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` json NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marksheet_templates`
--

INSERT INTO `marksheet_templates` (`id`, `name`, `type`, `logo_path`, `template_data`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Professional Blue Marksheet', 'course', NULL, '{\"fontFamily\": \"sans-serif\", \"footerText\": \"This is an official academic record\", \"headerText\": \"Academic Marksheet\", \"borderColor\": \"#2563eb\", \"primaryColor\": \"#1e40af\", \"secondaryColor\": \"#475569\", \"backgroundColor\": \"#ffffff\", \"institutionName\": \"Learning Management System\"}', 1, '2025-12-29 14:31:18', '2025-12-29 14:31:18'),
(2, 'Elegant Green Marksheet', 'course', NULL, '{\"fontFamily\": \"serif\", \"footerText\": \"Certified Academic Achievement Record\", \"headerText\": \"Course Performance Report\", \"borderColor\": \"#10b981\", \"primaryColor\": \"#047857\", \"secondaryColor\": \"#1f2937\", \"backgroundColor\": \"#f0fdf4\", \"institutionName\": \"Excellence in Education\"}', 0, '2025-12-29 14:31:19', '2025-12-29 14:31:19'),
(3, 'Royal Purple Marksheet', 'course', NULL, '{\"fontFamily\": \"serif\", \"footerText\": \"Excellence in Academic Performance\", \"headerText\": \"Official Transcript\", \"borderColor\": \"#c026d3\", \"primaryColor\": \"#6b21a8\", \"secondaryColor\": \"#374151\", \"backgroundColor\": \"#fef3ff\", \"institutionName\": \"Premier Learning Academy\"}', 0, '2025-12-29 14:31:19', '2025-12-29 14:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2023_04_09_112905_create_blogs_table', 1),
(5, '2023_10_20_000000_create_payment_settings_table', 1),
(6, '2025_01_29_104900_create_instructors_table', 1),
(7, '2025_01_29_111624_create_course_categories_table', 1),
(8, '2025_01_29_130009_create_course_category_children_table', 1),
(9, '2025_01_29_141506_create_courses_table', 1),
(10, '2025_01_29_141646_create_course_sections_table', 1),
(11, '2025_01_29_141707_create_section_lessons_table', 1),
(12, '2025_01_29_141807_create_lesson_resources_table', 1),
(13, '2025_01_29_141856_create_section_quizzes_table', 1),
(14, '2025_01_29_141949_create_quiz_questions_table', 1),
(15, '2025_01_29_143208_create_question_answers_table', 1),
(16, '2025_01_29_143300_create_quiz_submissions_table', 1),
(17, '2025_01_29_143310_create_course_live_classes_table', 1),
(18, '2025_01_29_243310_create_course_assignments_table', 1),
(19, '2025_01_29_343310_create_assignment_submissions_table', 1),
(20, '2025_01_30_044515_create_course_progress_table', 1),
(21, '2025_01_30_064442_create_course_reviews_table', 1),
(22, '2025_01_30_104051_create_course_coupons_table', 1),
(23, '2025_01_30_112337_create_course_enrollments_table', 1),
(24, '2025_01_30_123810_create_course_certificates_table', 1),
(25, '2025_01_30_135148_create_course_wishlists_table', 1),
(26, '2025_01_31_151836_create_payment_histories_table', 1),
(27, '2025_02_01_114558_create_watche_histories_table', 1),
(28, '2025_02_07_165441_create_course_requirements_table', 1),
(29, '2025_02_07_165529_create_course_outcomes_table', 1),
(30, '2025_02_07_165542_create_course_faqs_table', 1),
(31, '2025_02_07_194558_create_course_forums_table', 1),
(32, '2025_02_07_205951_create_course_forum_replies_table', 1),
(33, '2025_02_08_095546_create_media_table', 1),
(34, '2025_03_18_115418_create_settings_table', 1),
(35, '2025_03_23_081541_create_course_carts_table', 1),
(36, '2025_04_16_075231_create_personal_access_tokens_table', 1),
(37, '2025_05_17_094411_create_notifications_table', 1),
(38, '2025_05_19_131522_create_newsletters_table', 1),
(39, '2025_05_19_190604_create_payout_histories_table', 1),
(40, '2025_06_18_182234_create_pages_table', 1),
(41, '2025_06_18_182301_create_page_sections_table', 1),
(42, '2025_07_08_065852_create_subscribes_table', 1),
(43, '2025_07_18_075602_create_chunked_uploads_table', 1),
(44, '2025_07_18_160310_create_chunked_upload_parts_table', 1),
(45, '2025_07_28_095757_create_backups_table', 1),
(46, '2025_08_09_223221_create_navbars_table', 1),
(47, '2025_08_09_223223_create_navbar_items_table', 1),
(48, '2025_08_09_223225_create_footers_table', 1),
(49, '2025_08_09_223226_create_footer_items_table', 1),
(50, '2025_08_12_205051_create_job_circulars_table', 1),
(51, '2025_09_03_000001_update_embed_source_column_on_section_lessons_table', 1),
(52, '2025_09_06_141156_create_temp_stores_table', 1),
(53, '2025_09_07_141049_create_blog_categories_table', 1),
(54, '2025_09_07_141122_modify_blogs_table_for_foreign_key', 1),
(55, '2025_09_09_141658_create_blog_like_dislikes_table', 1),
(56, '2025_09_09_141718_create_blog_comments_table', 1),
(57, '2025_09_23_215546_create_languages_table', 1),
(58, '2025_09_23_215606_create_language_properties_table', 1),
(59, '2025_09_24_134320_add_course_id_to_course_coupons_table', 1),
(60, '2025_10_29_115956_create_certificate_templates_table', 1),
(61, '2025_10_29_120153_create_marksheet_templates_table', 1),
(62, '2025_10_30_134729_create_exam_categories_table', 1),
(63, '2025_10_30_134730_create_exams_table', 1),
(64, '2025_10_30_134731_create_exam_questions_table', 1),
(65, '2025_10_30_134732_create_exam_question_options_table', 1),
(66, '2025_10_30_134733_create_exam_attempts_table', 1),
(67, '2025_10_30_134734_create_exam_attempt_answers_table', 1),
(68, '2025_10_30_134736_create_exam_wishlists_table', 1),
(69, '2025_10_30_134739_create_exam_enrollments_table', 1),
(70, '2025_10_30_134741_create_exam_reviews_table', 1),
(71, '2025_10_30_134742_create_exam_coupons_table', 1),
(72, '2025_11_06_000001_create_exam_faqs_table', 1),
(73, '2025_11_06_000002_create_exam_requirements_table', 1),
(74, '2025_11_06_000003_create_exam_outcomes_table', 1),
(75, '2025_11_12_000001_update_payment_histories_table', 1),
(76, '2025_11_14_182846_add_type_column_to_certificate_templates_table', 1),
(77, '2025_11_14_182848_add_type_column_to_marksheet_templates_table', 1),
(78, '2025_11_15_141807_create_exam_resources_table', 1),
(79, '2025_11_20_131537_update_course_coupons_table_add_advanced_fields', 1),
(80, '2025_11_30_134320_add_active_column_to_pages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `navbars`
--

CREATE TABLE `navbars` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navbars`
--

INSERT INTO `navbars` (`id`, `title`, `slug`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Navbar 1', 'navbar_1', 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `navbar_items`
--

CREATE TABLE `navbar_items` (
  `id` bigint UNSIGNED NOT NULL,
  `sort` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items` json DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `navbar_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navbar_items`
--

INSERT INTO `navbar_items` (`id`, `sort`, `type`, `slug`, `title`, `value`, `items`, `active`, `navbar_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'url', 'courses', 'Courses', '/courses/all', '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(2, 2, 'url', 'exams', 'Exams', '/exams/all', '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(3, 3, 'url', 'about-us', 'About Us', '/about-us', '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(4, 4, 'url', 'our-team', 'Our Team', '/our-team', '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(5, 5, 'url', 'careers', 'Careers', '/careers', '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(6, 6, 'url', 'blogs', 'Blogs', '/blogs/all', '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(7, 7, 'action', 'search', 'Search', NULL, '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(8, 8, 'action', 'theme', 'Theme', NULL, '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(9, 9, 'action', 'notification', 'Notification', NULL, '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(10, 10, 'action', 'cart', 'Cart', NULL, '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(11, 11, 'action', 'language', 'Language', NULL, '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(12, 12, 'action', 'profile', 'Profile', NULL, '[]', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inner_page',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `type`, `title`, `banner`, `favicon`, `description`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Collaborative 1', 'home-1', 'collaborative', 'Mentor LMS - Home Page 1', NULL, NULL, 'Discover top categories, trending courses, expert instructors, and more.', 'Mentor LMS Home 1: Find your perfect course, learn from the best instructors, and join our community.', 'online courses, best instructors, trending, categories, testimonials', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(2, 'Collaborative 2', 'home-2', 'collaborative', 'Mentor LMS - Home Page 2', NULL, NULL, 'Discover top categories, trending courses, expert instructors, and more.', 'Mentor LMS Home 1: Find your perfect course, learn from the best instructors, and join our community.', 'online courses, best instructors, trending, categories, testimonials', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(3, 'Collaborative 3', 'home-3', 'collaborative', 'Mentor LMS - Online Learning Platform', NULL, NULL, 'Learn from expert instructors with our wide range of online courses.', 'Mentor LMS offers 5,500+ online courses taught by 400+ trusted instructors across various categories.', 'online courses, e-learning, LMS, instructor-led, training, education', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(4, 'Administrative 1', 'home-4', 'administrative', 'Mentor LMS - Advanced Learning Platform', NULL, NULL, 'Immersive learning experience with AR/VR technology and expert-led courses', 'Mentor LMS Home 3: Experience next-generation learning with immersive courses, expert instructors, and cutting-edge educational technology', 'AR/VR learning, immersive education, online courses, virtual reality education, expert instructors', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(5, 'Administrative 2', 'home-5', 'administrative', 'Mentor LMS - Advanced Learning Platform', NULL, NULL, 'Immersive learning experience with AR/VR technology and expert-led courses', 'Mentor LMS Home 3: Experience next-generation learning with immersive courses, expert instructors, and cutting-edge educational technology', 'AR/VR learning, immersive education, online courses, virtual reality education, expert instructors', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(6, 'About Us', 'about-us', 'inner_page', 'About Us - Why Choose Mentor?', NULL, NULL, NULL, 'Mentor LMS offers quality content, affordable learning, and continuous improvement in online education.', 'about us, mission, vision, quality content, affordable learning, education platform', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(7, 'Our Team', 'our-team', 'inner_page', 'Our Team - Meet the People Behind Mentor', NULL, NULL, NULL, 'Meet the Mentor team - passionate educators, skilled developers, and dedicated professionals working to democratize education.', 'our team, about team, Mentor team, leadership, educators, developers, support staff', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(8, 'Careers', 'careers', 'inner_page', 'Careers - Join Our Mission at Mentor', NULL, NULL, NULL, 'Join Mentor team and help transform education. Explore career opportunities, company culture, and growth prospects.', 'careers, jobs, employment, Mentor jobs, education careers, remote work, software engineer, product manager', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(9, 'Address', 'contact-us', 'inner_page', 'Contact Us - Get in Touch with Mentor', NULL, NULL, '<h1 style=\"text-align: center;\"><strong>Contact Us</strong></h1><p style=\"text-align: center;\">We\'re here to help! Whether you have questions about our courses, need technical support, or want to provide feedback, we\'d love to hear from you. Here are the best ways to get in touch with our team.</p><h2><strong>General Inquiries</strong></h2><p>For general questions about Mentor, our courses, or our platform, please email us at:</p><p><strong>Email: info@example.com</strong></p><h2><strong>Technical Support</strong></h2><p>If you\'re experiencing technical issues or need help with your account, our support team is ready to assist you:</p><p><strong>Email: support@uilib.com</strong></p><p>Response Time: We typically respond to support requests within 24 hours.</p><h2><strong>Partnership &amp; Business Inquiries</strong></h2><p>Interested in partnering with Mentor or have business-related questions? Contact our business development team:</p><p><strong>Email: partnerships@example.com</strong></p><h2><strong>Career Opportunities</strong></h2><p>Looking to join our team? Visit our Careers page or send your resume to:</p><p><strong>Email: careers@example.com</strong></p><h2><strong>Feedback &amp; Suggestions</strong></h2><p>We value your feedback and are always looking for ways to improve. Share your thoughts and suggestions with us:</p><p><strong>Email: feedback@example.com</strong></p><h2><strong>Office Address</strong></h2><p><strong>Mentor Headquarters</strong></p><p>123 Education Street Learning City, LC 12345 United States</p><p style=\"text-align: center;\">Thank you for choosing Mentor. We look forward to hearing from you!</p>', 'Contact Mentor for support, partnerships, careers, or general inquiries. Find all our contact information and office details.', 'contact us, support, help, contact information, customer service, partnerships, feedback', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(10, 'Cookie Policy', 'cookie-policy', 'inner_page', 'Cookie Policy', NULL, NULL, '<h1 style=\"text-align: center;\"><strong>Cookie policy</strong></h1><h2><strong>Cookie policy</strong></h2><ol><li><p>Cookies are small text files that can be used by websites to make a user\'s experience more efficient.</p></li><li><p>The law states that we can store cookies on your device if they are strictly necessary for the operation of this site. For all other types of cookies we need your permission.</p></li><li><p>This site uses different types of cookies. Some cookies are placed by third party services that appear on our pages.</p></li></ol>', 'Mentor LMS Cookie Policy: Learn about how we use cookies and similar technologies on our platform.', 'cookie policy, cookies, privacy, tracking, web cookies, http cookies', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(11, 'Terms and Conditions', 'terms-and-conditions', 'inner_page', 'Terms and Conditions', NULL, NULL, '<h1 style=\"text-align: center;\"><strong>Terms and Conditions</strong></h1><p>Welcome to Mentor. By accessing and using our platform, you agree to comply with and be bound by the following terms and conditions. Please read them carefully before using our services.</p><h2><strong>1. Acceptance of Terms</strong></h2><p>By accessing and using the Mentor website and services, you accept and agree to be bound by these terms and conditions. If you do not agree with any part of these terms, you must not use our platform.</p><h2><strong>2. Use of the Platform</strong></h2><p>You agree to use Mentor for lawful purposes only. You must not use our platform in any way that breaches any applicable local, national, or international law or regulation.</p><h2><strong>3. Account Registration</strong></h2><p>To access certain features of Mentor, you may be required to create an account. You agree to provide accurate and complete information during the registration process and to keep your account information up to date.</p><h2><strong>4. User Conduct</strong></h2><p>You agree not to use Mentor to:</p><ul><li><p>Post, upload, or distribute any content that is unlawful, defamatory, abusive, or otherwise objectionable.</p></li><li><p>Engage in any activity that could harm or disrupt the platform or other users\' experience.</p></li><li><p>Infringe upon the intellectual property rights of others.</p></li></ul><h2><strong>5. Intellectual Property</strong></h2><p>All content on Mentor, including but not limited to text, graphics, logos, and software, is the property of Mentor or its content suppliers and is protected by intellectual property laws. You may not reproduce, distribute, or create derivative works based on our content without express written permission from Mentor.</p><h2><strong>6. Payment and Refunds</strong></h2><p>Certain courses and services on Mentor may be offered for a fee. All payments are non-refundable unless otherwise specified. Mentor reserves the right to change its pricing at any time.</p><h2><strong>7. Termination</strong></h2><p>Mentor reserves the right to terminate or suspend your account at our sole discretion, without prior notice, for conduct that we believe violates these terms or is harmful to other users of our platform.</p><h2><strong>8. Disclaimer of Warranties</strong></h2><p>Mentor provides the platform and services \'as is\' and without any warranty or condition, express, implied, or statutory. We do not guarantee that the platform will be uninterrupted or error-free.</p><h2><strong>9. Limitation of Liability</strong></h2><p>In no event shall Mentor be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from (a) your use or inability to use the platform; (b) any unauthorized access to or use of our services; (c) any interruption or cessation of transmission to or from our services.</p><h2><strong>10. Changes to Terms</strong></h2><p>Mentor reserves the right to modify these terms at any time. We will notify you of any changes by posting the new terms on this page. Your continued use of the platform after any changes constitutes your acceptance of the new terms.</p><h2><strong>11. Governing Law</strong></h2><p>These terms and conditions are governed by and construed in accordance with the laws of the jurisdiction in which Mentor operates, without regard to its conflict of law principles.</p>', 'Read Mentor LMS Terms and Conditions to understand your rights and responsibilities while using our platform.', 'terms, conditions, terms of service, legal agreement, user agreement', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(12, 'Privacy Policy', 'privacy-policy', 'inner_page', 'Privacy Policy', NULL, NULL, '<h1 style=\"text-align: center;\"><strong>Privacy Policy</strong></h1><p>Welcome to Mentor. We are committed to protecting your privacy and ensuring that your personal information is handled in a safe and responsible manner. This Privacy Policy outlines how we collect, use, and protect your information when you use our platform.</p><h2><strong>1. Information We Collect</strong></h2><p>We collect various types of information in connection with the services we provide, including:</p><ul><li><p><strong>Personal Information:</strong> When you register for an account, we may collect personal details such as your name, email address, phone number, and payment information.</p></li><li><p><strong>Usage Data:</strong> We collect information about your interactions with our platform, such as the pages you visit, the courses you access, and other actions you take.</p></li><li><p><strong>Cookies and Tracking Technologies:</strong> We use cookies and similar technologies to track your activity on our platform and hold certain information.</p></li></ul><h2><strong>2. How We Use Your Information</strong></h2><p>We use the information we collect for various purposes, including:</p><ul><li><p><strong>Providing Services:</strong> To create and manage your account, process transactions, and provide the courses and services you request.</p></li><li><p><strong>Improving Our Platform:</strong> To analyze usage patterns and improve the functionality and user experience of our platform.</p></li><li><p><strong>Communication:</strong> To send you updates, newsletters, and other information that may be of interest to you. You can opt-out of receiving these communications at any time.</p></li><li><p><strong>Security:</strong> To monitor and protect the security of our platform and its users.</p></li></ul><h2><strong>3. Sharing Your Information</strong></h2><p>We may share your information with third parties in the following circumstances:</p><ul><li><p><strong>Service Providers:</strong> We may share your information with third-party service providers who perform services on our behalf, such as payment processing, data analysis, and email delivery.</p></li><li><p><strong>Legal Requirements:</strong> We may disclose your information if required to do so by law or in response to valid requests by public authorities.</p></li><li><p><strong>Business Transfers:</strong> In the event of a merger, acquisition, or sale of all or a portion of our assets, your information may be transferred as part of that transaction.</p></li></ul><h2><strong>4. Data Security</strong></h2><p>We implement appropriate security measures to protect your information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee its absolute security.</p>', 'Learn about how Mentor LMS collects, uses, and protects your personal information in our Privacy Policy.', 'privacy policy, data protection, personal information, data collection, data security', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1),
(13, 'Refund Policy', 'refund-policy', 'inner_page', 'Refund Policy', NULL, NULL, '<h1 style=\"text-align: center;\"><strong>Refund Policy</strong></h1><p>At Mentor, we strive to provide the best learning experience for our users. We understand that there may be situations where you may need to request a refund. This Refund Policy outlines the conditions and processes for obtaining a refund for purchases made on our platform.</p><h2><strong>1. General Refund Policy</strong></h2><p>Our general refund policy applies to all courses and services offered on Mentor. Refunds will be granted under the following conditions:</p><ul><li><p><strong>Course Not Accessed:</strong> If you have purchased a course and have not accessed any of its content, you may request a full refund within 14 days of the purchase date.</p></li><li><p><strong>Technical Issues:</strong> If you experience technical issues that prevent you from accessing the course content and we are unable to resolve the issue, you may request a refund within 14 days of the purchase date.</p></li></ul><h2><strong>2. Non-Refundable Items</strong></h2><p>Certain items and services are non-refundable. These include:</p><ul><li><p><strong>Downloaded Content:</strong> Any content that has been downloaded to your device is non-refundable.</p></li><li><p><strong>Completed Courses:</strong> If you have completed a course, it is not eligible for a refund.</p></li></ul><h2><strong>3. How to Request a Refund</strong></h2><p>To request a refund, please follow these steps:</p><ol><li><p><strong>Contact Support:</strong> Email our support team at <strong>support@uilib.com</strong> with your refund request. Include your order number, the course name, and the reason for the refund request.</p></li><li><p><strong>Review Process:</strong> Our support team will review your request and may ask for additional information to process your refund.</p></li><li><p><strong>Refund Approval:</strong> If your refund request meets the conditions outlined in this policy, we will process the refund to your original method of payment. Please allow 5-10 business days for the refund to appear in your account.</p></li></ol><h2><strong>4. Changes to Refund Policy</strong></h2><p>Mentor reserves the right to modify this Refund Policy at any time. We will notify you of any changes by posting the new policy on this page. Your continued use of the platform after any changes constitutes your acceptance of the new policy.</p>', 'Learn about Mentor LMS refund conditions and processes for course purchases and other services.', 'refund policy, refunds, money back, course refund, payment returns', '2025-12-29 14:31:17', '2025-12-29 14:31:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_sections`
--

CREATE TABLE `page_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flags` json DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `page_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_sections`
--

INSERT INTO `page_sections` (`id`, `name`, `slug`, `sort`, `title`, `sub_title`, `description`, `thumbnail`, `background_image`, `background_color`, `video_url`, `flags`, `properties`, `active`, `page_id`, `created_at`, `updated_at`) VALUES
(1, 'Hero', 'hero', 1, 'YOUR JOURNEY BEGINS HERE', 'Grow Your Knowledge with Leading Online Courses', 'Start learning today with top-rated courses and instructors Take your team\'s learning and development to new heights Take your team\'s learning', '/assets/images/intro/home-1/hero-image.png', NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"thumbnail\": true, \"description\": true}', '{\"array\": [{\"image\": \"\"}, {\"image\": \"/assets/avatars/avatar-1.png\"}, {\"image\": \"/assets/avatars/avatar-2.png\"}, {\"image\": \"/assets/avatars/avatar-3.png\"}, {\"image\": \"/assets/avatars/avatar-4.png\"}, {\"image\": \"/assets/avatars/avatar-5.png\"}, {\"image\": \"/assets/avatars/avatar-6.png\"}], \"ratings\": \"5.0\", \"button_link\": \"/courses/all\", \"button_text\": \"Browse Courses\", \"subscribers\": \"+2000 readers worldwide\"}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(2, 'Partners', 'partners', 2, 'Trusted by over 100 leading companies worldwide', NULL, NULL, NULL, NULL, NULL, NULL, '{\"title\": true}', '{\"array\": [{\"image\": \"\"}, {\"image\": \"/assets/logos/logo-1.png\"}, {\"image\": \"/assets/logos/logo-2.png\"}, {\"image\": \"/assets/logos/logo-3.png\"}, {\"image\": \"/assets/logos/logo-4.png\"}, {\"image\": \"/assets/logos/logo-5.png\"}, {\"image\": \"/assets/logos/logo-8.png\"}, {\"image\": \"/assets/logos/logo-6.png\"}, {\"image\": \"/assets/logos/logo-7.png\"}]}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(3, 'Top Categories', 'top_categories', 3, 'Top Categories', 'Featured category', 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [2, 3, 4, 5, 6, 7, 8, 9]}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(4, 'Top Courses', 'top_courses', 4, 'Courses', 'Popular Courses', 'Your professional development is supported by Mentor covering everything from technical subjects to essential abilities.', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(5, 'Overview', 'overview', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '{\"array\": [{\"icon\": \"\", \"color\": \"\", \"count\": \"\", \"title\": \"\"}, {\"icon\": \"users\", \"color\": \"rgba(52,105,154,1)\", \"count\": \"68k+\", \"title\": \"Join 68k+ students already mastering new skills.\"}, {\"icon\": \"download\", \"color\": \"rgba(255,203,97,1)\", \"count\": \"32k+\", \"title\": \"Downloaded over 32,000 times by users worldwide.\"}, {\"icon\": \"heart\", \"color\": \"rgba(74,151,130,1)\", \"count\": \"45k+\", \"title\": \"Loved by learners with 45k+ great reviews.\"}, {\"icon\": \"award\", \"color\": \"rgba(121,158,255,1)\", \"count\": \"1.2k+\", \"title\": \"Recognized with more than 1,200 prestigious accolades.\"}]}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(6, 'New Courses', 'new_courses', 6, 'Courses', 'Latest Courses', 'Your professional development is supported by Mentor covering everything from technical subjects to essential abilities.', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(7, 'Top Instructors', 'top_instructors', 7, 'Top Instructors', 'Meet Our Experts', 'They efficiently serve large number of students on our platform', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [2, 3, 4, 5, 6, 7]}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(8, 'FAQs', 'faqs', 8, 'FAQ', 'Frequently Asked Questions!', 'These are the most popular courses among listen courses learners worldwide these are the most popular courses among listen', '/assets/images/intro/home-1/faqs.png', NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"thumbnail\": true, \"description\": true}', '{\"array\": [{\"title\": \"\", \"description\": \"\"}, {\"title\": \"Do I need any prior experience to take your courses?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether you\'re a complete beginner or looking to sharpen existing skills, you\'ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"How long do I have access to the course materials?\", \"description\": \"Once enrolled, you have lifetime access to all course materials. You can learn at your own pace and revisit content whenever you need a refresher.\"}, {\"title\": \"Will I get a certificate after completing a course?\", \"description\": \"Yes! Upon successful completion of a course, you\'ll receive a certificate of completion that you can share on your LinkedIn profile or include in your portfolio.\"}, {\"title\": \"Can I ask questions or get support during the course?\", \"description\": \"Absolutely! Each course includes a discussion section where you can ask questions, share insights, and connect with other learners. I personally monitor and respond to questions.\"}, {\"title\": \"What if I\'m not satisfied with the course?\", \"description\": \"I offer a 30-day money-back guarantee. If you\'re not completely satisfied with your purchase, you can request a full refund within 30 days of enrollment.\"}]}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(9, 'Blogs', 'blogs', 9, 'Blogs', 'Our Latest Post', 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(10, 'Newsletter', 'call_to_action', 10, 'Subscribe Our Newsletter', NULL, 'Subscribe to our newsletter to get the latest news and updates. We will not spam you.', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"array\": [{\"image\": \"\"}, {\"image\": \"/assets/avatars/avatar-1.png\"}, {\"image\": \"/assets/avatars/avatar-2.png\"}, {\"image\": \"/assets/avatars/avatar-3.png\"}, {\"image\": \"/assets/avatars/avatar-4.png\"}, {\"image\": \"/assets/avatars/avatar-5.png\"}, {\"image\": \"/assets/avatars/avatar-6.png\"}], \"button_text\": \"Subscribe\", \"subscribers\": \"+2000 readers worldwide\"}', 1, 1, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(11, 'Hero', 'hero', 1, 'YOUR JOURNEY BEGINS HERE', 'Unlock 5,500+ Expert-Led Courses Powered by 400+ Trusted Instructors', 'Start learning today with top-rated courses and instructors.', '/assets/images/intro/home-2/hero-image.png', NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"thumbnail\": true, \"description\": true}', '[]', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(12, 'Top Categories', 'top_categories', 2, 'Top Categories', 'Explore by Category', 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]}', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(13, 'Overview', 'overview', 3, 'We Provide', 'Take Your Skills to the Next Level', 'These are the most popular courses among listen courses learners worldwide.', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"array\": [{\"icon\": \"\", \"count\": \"\", \"title\": \"\"}, {\"icon\": \"clock\", \"count\": \"212+\", \"title\": \"Hours Course Time\"}, {\"icon\": \"monitor-play\", \"count\": \"15+\", \"title\": \"Creative Courses\"}, {\"icon\": \"users\", \"count\": \"6+\", \"title\": \"Number of Students\"}]}', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(14, 'Top Courses', 'top_courses', 4, 'Top Courses', 'Popular Right Now', 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(15, 'New Courses', 'new_courses', 5, 'New Courses', 'Recently Added', 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(16, 'Top Instructors', 'top_instructors', 6, 'Top Instructors', 'Meet Our Experts', 'They efficiently serve large number of students on our platform', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [2, 3, 4, 5, 6, 7]}', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(17, 'Testimonials', 'testimonials', 7, 'Testimonials', 'What Client Say About Us', 'They efficiently serve large number of students on our platform', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"array\": [{\"name\": \"\", \"image\": \"\", \"rating\": 0, \"description\": \"\"}, {\"name\": \"John Smith\", \"image\": \"/assets/images/users/user-1.jpg\", \"rating\": 5, \"description\": \"John is an experienced web developer with 10+ years of experience in building modern web applications.\"}, {\"name\": \"Emma Johnson\", \"image\": \"/assets/images/users/user-2.jpg\", \"rating\": 4, \"description\": \"Emma is a talented UX designer who specializes in creating intuitive user interfaces for web and mobile applications.\"}, {\"name\": \"Michael Chen\", \"image\": \"/assets/images/users/user-3.jpg\", \"rating\": 5, \"description\": \"Michael is a data scientist with expertise in machine learning algorithms and data analysis techniques.\"}, {\"name\": \"Sarah Williams\", \"image\": \"/assets/images/users/user-4.jpg\", \"rating\": 4, \"description\": \"Sarah is a digital marketing expert who helps businesses grow their online presence through effective marketing strategies.\"}, {\"name\": \"David Rodriguez\", \"image\": \"/assets/images/users/user-5.jpg\", \"rating\": 5, \"description\": \"David is a mobile application developer with expertise in both iOS and Android platforms.\"}]}', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(18, 'Partners', 'partners', 8, 'Brands', 'We Work With', 'Trusted by over 16,000 companies and millions of learners around the world', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"array\": [{\"image\": \"\"}, {\"image\": \"/assets/logos/logo-1.png\"}, {\"image\": \"/assets/logos/logo-2.png\"}, {\"image\": \"/assets/logos/logo-3.png\"}, {\"image\": \"/assets/logos/logo-4.png\"}, {\"image\": \"/assets/logos/logo-5.png\"}, {\"image\": \"/assets/logos/logo-6.png\"}, {\"image\": \"/assets/logos/logo-7.png\"}, {\"image\": \"/assets/logos/logo-8.png\"}]}', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(19, 'Call to Action', 'call_to_action', 9, 'Subscribe Our Newsletter', NULL, 'Nam ipsum risus, rutrum vitae, vestibulum eu, molestie vel, lacus. Sed magna purus, fermentum eu', '/assets/images/intro/home-2/cta-image.png', NULL, NULL, NULL, '{\"title\": true, \"thumbnail\": true, \"description\": true}', '{\"button_text\": \"Subscribe\"}', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(20, 'Blogs', 'blogs', 10, 'Blogs', 'Our Latest Post', 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 2, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(21, 'Hero', 'hero', 1, 'YOUR JOURNEY BEGINS HERE', 'Grow Your Knowledge with Leading Online Courses', 'Take your team\'s learning and development to new heights.', '/assets/images/intro/home-3/hero-image.png', NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"thumbnail\": true, \"description\": true}', '{\"array\": [{\"label\": \"\", \"value\": \"\"}, {\"label\": \"Students\", \"value\": \"12k\"}, {\"label\": \"Students\", \"value\": \"12k\"}, {\"label\": \"Graduates\", \"value\": \"50k\"}], \"button_link\": \"/courses/all\", \"button_text\": \"Browse Courses\"}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(22, 'Overview', 'overview', 2, 'Take Your Skills To the Next Level', NULL, 'These are the most popular courses among listen courses learners worldwide. These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"array\": [{\"icon\": \"\", \"count\": \"\", \"title\": \"\"}, {\"icon\": \"clock\", \"count\": \"212+\", \"title\": \"Hours Course Time\"}, {\"icon\": \"monitor-play\", \"count\": \"15+\", \"title\": \"Creative Courses\"}, {\"icon\": \"users\", \"count\": \"6+\", \"title\": \"Number of Students\"}]}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(23, 'Partners', 'partners', 3, 'Adopted by renowned enterprises such as', NULL, NULL, NULL, NULL, NULL, NULL, '{\"title\": true}', '{\"array\": [{\"image\": \"\"}, {\"image\": \"/assets/logos/logo-1.png\"}, {\"image\": \"/assets/logos/logo-2.png\"}, {\"image\": \"/assets/logos/logo-3.png\"}, {\"image\": \"/assets/logos/logo-4.png\"}, {\"image\": \"/assets/logos/logo-5.png\"}]}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(24, 'Category Courses', 'category_courses', 4, 'Everything you need to know in one place', NULL, 'Your professional development is supported by Mentor, covering everything from technical subjects to essential abilities.', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"contents\": [2, 3, 4, 5, 6, 7], \"button_link\": \"/courses/all\", \"button_text\": \"View More\", \"content_limit\": 6}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(25, 'Top Instructors', 'top_instructors', 5, 'Meet Our Experts', NULL, 'They efficiently serve large number of students on our platform', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"contents\": [2, 3, 4, 5, 6, 7]}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(26, 'Features', 'features', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '{\"array\": [{\"image\": \"\", \"title\": \"\", \"description\": \"\"}, {\"image\": \"/assets/icons/globe-earth.png\", \"title\": \"Learn Anything Anywhere\", \"description\": \"Where ever you are you can learn using our online education platform. Where ever you are you can learn.\"}, {\"image\": \"/assets/icons/student.png\", \"title\": \"World Class Instructors\", \"description\": \"Where ever you are you can learn using our online education platform. Where ever you are you can learn.\"}, {\"image\": \"/assets/icons/laptop.png\", \"title\": \"Lifetime Access\", \"description\": \"Where ever you are you can learn using our online education platform. Where ever you are you can learn.\"}]}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(27, 'Top Categories', 'top_categories', 7, 'Featured category', NULL, 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"contents\": [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(28, 'New Courses', 'new_courses', 8, 'Latest Courses', NULL, 'Check out the latest additions to our course library.', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(29, 'Testimonials', 'testimonials', 9, 'What our customers say', NULL, 'Hear from our learners about their experiences.', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"array\": [{\"name\": \"\", \"image\": \"\", \"rating\": 0, \"description\": \"\"}, {\"name\": \"John Smith\", \"image\": \"/assets/images/users/user-1.jpg\", \"rating\": 5, \"description\": \"John is an experienced web developer with 10+ years of experience in building modern web applications.\"}, {\"name\": \"Emma Johnson\", \"image\": \"/assets/images/users/user-2.jpg\", \"rating\": 4, \"description\": \"Emma is a talented UX designer who specializes in creating intuitive user interfaces for web and mobile applications.\"}, {\"name\": \"Michael Chen\", \"image\": \"/assets/images/users/user-3.jpg\", \"rating\": 5, \"description\": \"Michael is a data scientist with expertise in machine learning algorithms and data analysis techniques.\"}, {\"name\": \"Sarah Williams\", \"image\": \"/assets/images/users/user-4.jpg\", \"rating\": 4, \"description\": \"Sarah is a digital marketing expert who helps businesses grow their online presence through effective marketing strategies.\"}, {\"name\": \"David Rodriguez\", \"image\": \"/assets/images/users/user-5.jpg\", \"rating\": 5, \"description\": \"David is a mobile application developer with expertise in both iOS and Android platforms.\"}]}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(30, 'Call to Action', 'call_to_action', 10, 'Subscribe for course updates & discounts', NULL, 'Nam ipsum risus, rutrum vitae, vestibulum eu, molestie vel, lacus. Sed magna purus, fermentum eu', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"array\": [{\"image\": \"\"}, {\"image\": \"/assets/avatars/avatar-1.png\"}, {\"image\": \"/assets/avatars/avatar-2.png\"}, {\"image\": \"/assets/avatars/avatar-3.png\"}, {\"image\": \"/assets/avatars/avatar-4.png\"}, {\"image\": \"/assets/avatars/avatar-5.png\"}, {\"image\": \"/assets/avatars/avatar-6.png\"}], \"button_text\": \"Subscribe\", \"subscribers\": \"+2000 readers worldwide\"}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(31, 'Blogs', 'blogs', 11, 'Best Rated Posts', NULL, 'Read our top blog posts and articles.', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 3, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(32, 'Hero', 'hero', 1, 'Mastering Figma A Beginner\'s Guide to Digital Design', NULL, 'Learn with a dedicated instructor guiding you every step of the way. Gain hands-on experience, develop real-world design skills, And achieve your creative goals with confidence.', '/assets/images/intro/home-4/hero-image.png', '/assets/images/intro/home-4/hero-bg.png', NULL, 'https://youtu.be/6nDmtt1I4TY?si=CCMNgBqcFP9HPvaO', '{\"title\": true, \"thumbnail\": true, \"video_url\": true, \"description\": true, \"background_image\": true}', '{\"array\": [{\"image\": \"\"}, {\"image\": \"/assets/images/intro/home-4/card-1.png\"}, {\"image\": \"/assets/images/intro/home-4/card-2.png\"}, {\"image\": \"/assets/images/intro/home-4/card-3.png\"}, {\"image\": \"/assets/images/intro/home-4/card-4.png\"}], \"ratings\": \"5.0\", \"subscribers\": \"+2000 readers worldwide\", \"button_link_1\": \"/courses/all\", \"button_link_2\": \"/login\", \"button_text_1\": \"Browse Courses\", \"button_text_2\": \"Get Started Today\"}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(33, 'Partners', 'partners', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '{\"array\": [{\"image\": \"\"}, {\"image\": \"/assets/logos/logo-1.png\"}, {\"image\": \"/assets/logos/logo-2.png\"}, {\"image\": \"/assets/logos/logo-3.png\"}, {\"image\": \"/assets/logos/logo-4.png\"}, {\"image\": \"/assets/logos/logo-5.png\"}, {\"image\": \"/assets/logos/logo-6.png\"}, {\"image\": \"/assets/logos/logo-7.png\"}, {\"image\": \"/assets/logos/logo-8.png\"}]}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(34, 'Top Categories', 'top_categories', 3, 'Top Categories', NULL, 'These are the most popular courses among listen courses learners worldwide these are the most popular courses among listen courses.', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"contents\": [2, 3, 4]}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(35, 'Top Course', 'top_course', 4, 'Top Course', NULL, NULL, NULL, NULL, NULL, NULL, '{\"title\": true}', '{\"contents\": []}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(36, 'Overview', 'overview', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '{\"array\": [{\"icon\": \"\", \"count\": \"\", \"image\": \"\", \"title\": \"\", \"bg_color\": \"\", \"text_color\": \"\"}, {\"icon\": \"users\", \"count\": \"68k+\", \"image\": \"/assets/images/intro/home-4/overview-1.png\", \"title\": \"Join 68k+ students already mastering new skills.\", \"bg_color\": \"rgba(249,217,128,1)\", \"text_color\": \"rgba(20,26,33,1)\"}, {\"icon\": \"download\", \"count\": \"32k+\", \"image\": \"/assets/images/intro/home-4/overview-2.png\", \"title\": \"Downloaded over 32,000 times by users worldwide.\", \"bg_color\": \"rgba(112,78,231,1)\", \"text_color\": \"rgba(255,255,255,1)\"}, {\"icon\": \"heart\", \"count\": \"45k+\", \"image\": \"/assets/images/intro/home-4/overview-3.png\", \"title\": \"Loved by learners with 45k+ great reviews.\", \"bg_color\": \"rgba(223,200,253,1)\", \"text_color\": \"rgba(20,26,33,1)\"}, {\"icon\": \"award\", \"count\": \"1.2k+\", \"image\": \"/assets/images/intro/home-4/overview-4.png\", \"title\": \"Recognized with more than 1,200 prestigious accolades.\", \"bg_color\": \"rgba(0,120,103,1)\", \"text_color\": \"rgba(255,255,255,1)\"}]}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(37, 'Instructor', 'instructor', 6, 'Reasons to Learn with Me', NULL, 'These are the most popular courses among listen courses learners worldwide these are the most popular courses among listen', '/assets/images/users/user-7.jpg', NULL, NULL, NULL, '{\"title\": true, \"thumbnail\": true, \"description\": true}', '{\"array\": [{\"icon\": \"\", \"title\": \"\", \"description\": \"\"}, {\"icon\": \"book\", \"title\": \"Project-Based Learning\", \"description\": \"Every course includes real-world projects to help you build a strong, job-ready portfolio.\"}, {\"icon\": \"book-open-text\", \"title\": \"Beginner-Friendly Teaching Style\", \"description\": \"My lessons are designed to be simple, clear, and step-by-step — perfect for learners of all levels, especially beginners.\"}, {\"icon\": \"monitor-play\", \"title\": \"Real-World Experience\", \"description\": \"With over a decade of hands-on experience in web design and development, I bring practical insights you won’t find in textbooks.\"}, {\"icon\": \"headset\", \"title\": \"Personalized Support\", \"description\": \"You’re never learning alone. I personally respond to questions and offer guidance to help you stay on track.\"}]}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(38, 'FAQs', 'faqs', 7, 'Frequently Asked Questions!', NULL, 'These are the most popular courses among listen courses learners worldwide these are the most popular courses among listen', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"array\": [{\"title\": \"\", \"description\": \"\"}, {\"title\": \"Do I need any prior experience to take your courses?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"How long do I have access to the course materials?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"Will I get a certificate after completing a course?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"Can I ask questions or get support during the course?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"What if I’m not satisfied with the course?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"What is the refund policy?\", \"description\": \"We offer a 30-day money-back guarantee. If you’re not satisfied with your purchase, you can request a refund within 30 days of purchase. Please note that refunds are only available for unused course materials.\"}, {\"title\": \"How do I get access to the course materials?\", \"description\": \"Once you’ve enrolled, you’ll receive immediate access to all course materials. You can access them anytime, anywhere, on any device with an internet connection.\"}, {\"title\": \"How can I get help if I need it?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"What is the refund policy?\", \"description\": \"We offer a 30-day money-back guarantee. If you\'re not satisfied with your purchase, you can request a refund within 30 days of purchase. Please note that refunds are only available for unused course materials.\"}]}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(39, 'Testimonials', 'testimonials', 8, 'Success Stories', 'What Client Say About Us', 'They efficiently serve large number of students on our platform', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"array\": [{\"name\": \"\", \"image\": \"\", \"rating\": 0, \"description\": \"\"}, {\"name\": \"John Smith\", \"image\": \"/assets/images/users/user-1.jpg\", \"rating\": 5, \"description\": \"John is an experienced web developer with 10+ years of experience in building modern web applications.\"}, {\"name\": \"Emma Johnson\", \"image\": \"/assets/images/users/user-2.jpg\", \"rating\": 4, \"description\": \"Emma is a talented UX designer who specializes in creating intuitive user interfaces for web and mobile applications.\"}, {\"name\": \"Michael Chen\", \"image\": \"/assets/images/users/user-3.jpg\", \"rating\": 5, \"description\": \"Michael is a data scientist with expertise in machine learning algorithms and data analysis techniques.\"}, {\"name\": \"Sarah Williams\", \"image\": \"/assets/images/users/user-4.jpg\", \"rating\": 4, \"description\": \"Sarah is a digital marketing expert who helps businesses grow their online presence through effective marketing strategies.\"}, {\"name\": \"David Rodriguez\", \"image\": \"/assets/images/users/user-5.jpg\", \"rating\": 5, \"description\": \"David is a mobile application developer with expertise in both iOS and Android platforms.\"}]}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(40, 'Blogs', 'blogs', 9, 'Best Rated Posts', NULL, 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(41, 'Call to Action', 'call_to_action', 10, 'Subscribe to My Newsletter', NULL, 'Stay ahead in digital design with curated insights, learning tips, and course updates every week.', NULL, '/assets/images/intro/home-4/cta-bg.png', NULL, NULL, '{\"title\": true, \"description\": true, \"background_image\": true}', '{\"button_text\": \"Subscribe\"}', 1, 4, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(42, 'Hero', 'hero', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '{\"contents\": [1, 2]}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(43, 'Statistics', 'statistics', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '{\"array\": [{\"label\": \"\", \"value\": \"\"}, {\"label\": \"Students\", \"value\": \"64k\"}, {\"label\": \"Good Comments\", \"value\": \"45k\"}, {\"label\": \"Service Download\", \"value\": \"32k\"}, {\"label\": \"Best Awards\", \"value\": \"129k+\"}]}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(44, 'Top Categories', 'top_categories', 3, 'Categories', 'Top Categories', 'These are the most popular courses among listen courses learners worldwide these are the most popular courses among listen courses learners worldwide categories', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [2, 3, 4]}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(45, 'Top Course', 'top_course', 4, 'Top Course', NULL, NULL, NULL, NULL, NULL, NULL, '{\"title\": true}', '{\"contents\": [1], \"button_text\": \"Buy Now\"}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(46, 'Top Courses', 'top_courses', 5, 'Courses', 'Top Courses', 'These are the most popular courses among listen courses learners worldwide these are the most popular courses among courses', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4]}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(47, 'Instructor', 'instructor', 6, 'Instructor', 'ABOUT ME', 'These are the most popular courses among listen courses learners worldwide these are the most popular courses among listen', '/assets/images/users/user-7.jpg', NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"thumbnail\": true, \"description\": true}', '{\"array\": [{\"icon\": \"\", \"title\": \"\", \"description\": \"\"}, {\"icon\": \"book\", \"title\": \"Project-Based Learning\", \"description\": \"Every course includes real-world projects to help you build a strong, job-ready portfolio.\"}, {\"icon\": \"book-open-text\", \"title\": \"Beginner-Friendly Teaching Style\", \"description\": \"My lessons are designed to be simple, clear, and step-by-step — perfect for learners of all levels, especially beginners.\"}, {\"icon\": \"monitor-play\", \"title\": \"Real-World Experience\", \"description\": \"With over a decade of hands-on experience in web design and development, I bring practical insights you won’t find in textbooks.\"}, {\"icon\": \"headset\", \"title\": \"Personalized Support\", \"description\": \"You’re never learning alone. I personally respond to questions and offer guidance to help you stay on track.\"}]}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(48, 'FAQs', 'faqs', 7, 'FAQs', 'FAQs', 'These are the most popular courses among listen courses learners worldwide these are the most popular courses among listen', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"array\": [{\"title\": \"\", \"description\": \"\"}, {\"title\": \"Do I need any prior experience to take your courses?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"How long do I have access to the course materials?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"Will I get a certificate after completing a course?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"Can I ask questions or get support during the course?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}, {\"title\": \"What if I’m not satisfied with the course?\", \"description\": \"Not at all! My courses are designed for learners of all levels. Whether your a complete beginner or looking to sharpen existing skills, you’ll find step-by-step guidance to help you progress with confidence.\"}]}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(49, 'Testimonials', 'testimonials', 8, 'Success Stories', 'What Client Say About Us', 'They efficiently serve large number of students on our platform', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"array\": [{\"name\": \"\", \"image\": \"\", \"rating\": 0, \"description\": \"\"}, {\"name\": \"John Smith\", \"image\": \"/assets/images/users/user-1.jpg\", \"rating\": 5, \"description\": \"John is an experienced web developer with 10+ years of experience in building modern web applications.\"}, {\"name\": \"Emma Johnson\", \"image\": \"/assets/images/users/user-2.jpg\", \"rating\": 4, \"description\": \"Emma is a talented UX designer who specializes in creating intuitive user interfaces for web and mobile applications.\"}, {\"name\": \"Michael Chen\", \"image\": \"/assets/images/users/user-3.jpg\", \"rating\": 5, \"description\": \"Michael is a data scientist with expertise in machine learning algorithms and data analysis techniques.\"}, {\"name\": \"Sarah Williams\", \"image\": \"/assets/images/users/user-4.jpg\", \"rating\": 4, \"description\": \"Sarah is a digital marketing expert who helps businesses grow their online presence through effective marketing strategies.\"}, {\"name\": \"David Rodriguez\", \"image\": \"/assets/images/users/user-5.jpg\", \"rating\": 5, \"description\": \"David is a mobile application developer with expertise in both iOS and Android platforms.\"}]}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(50, 'Call to Action', 'call_to_action', 9, 'Subscribe for course updates & discounts', NULL, 'Nam ipsum risus, rutrum vitae, vestibulum eu, molestie vel, lacus. Sed magna purus, fermentum eu', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"array\": [{\"image\": \"\"}, {\"image\": \"/assets/avatars/avatar-1.png\"}, {\"image\": \"/assets/avatars/avatar-2.png\"}, {\"image\": \"/assets/avatars/avatar-3.png\"}, {\"image\": \"/assets/avatars/avatar-4.png\"}, {\"image\": \"/assets/avatars/avatar-5.png\"}, {\"image\": \"/assets/avatars/avatar-6.png\"}], \"button_text\": \"Subscribe\", \"subscribers\": \"+2000 readers worldwide\"}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(51, 'Blogs', 'blogs', 10, 'Blogs', 'Best Rated Posts', 'These are the most popular courses among listen courses learners worldwide', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '{\"contents\": [1, 2, 3, 4, 5, 6]}', 1, 5, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(52, 'Hero', 'hero', 1, 'About Us', NULL, NULL, NULL, NULL, NULL, NULL, '{\"title\": true}', '{\"array\": [{\"image\": \"/assets/images/team-1.jpg\", \"title\": \"Our Mission\", \"description\": \"To democratize education by making high-quality learning accessible to everyone, everywhere. We strive to bridge the gap between knowledge and application. Meet our passionate team of educators, developers, and designers who believe in the power of learning to change lives.\"}, {\"image\": \"/assets/images/team-2.jpg\", \"title\": \"Our Value\", \"description\": \"We believe in fostering a love for lifelong learning through innovative teaching methods, personalized experiences, and supportive communities. Meet our passionate team of educators, developers, and designers who believe in the power of learning to change lives.\"}]}', 1, 6, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(53, 'Success Statistics', 'success_statistics', 2, 'Our Success Depends on Our Students Success', NULL, 'We believe that our success is measured by our students\' achievements. Every milestone they reach is a testament to our commitment to excellence in education.', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"array\": [{\"count\": \"100+\", \"image\": \"/assets/images/students-1.jpg\", \"title\": \"Active Students\"}, {\"count\": \"300+\", \"image\": \"/assets/images/students-2.jpg\", \"title\": \"Best Courses\"}, {\"count\": \"40k+\", \"image\": \"/assets/images/students-3.jpg\", \"title\": \"Active Users\"}]}', 1, 6, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(54, 'Team', 'team', 3, 'The Minds Behind the Mission', NULL, 'Meet our passionate team of educators, developers, and designers who believe in the power of learning to change lives. Meet our passionate team of educators, developers, and designers who believe in the power of learning to change lives.', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"array\": [{\"name\": \"Sarah Johnson\", \"role\": \"Lead Instructor\", \"image\": \"/assets/images/users/user-1.jpg\"}, {\"name\": \"Michael Chen\", \"role\": \"Course Designer\", \"image\": \"/assets/images/users/user-2.jpg\"}, {\"name\": \"Emily Rodriguez\", \"role\": \"Learning Experience Manager\", \"image\": \"/assets/images/users/user-3.jpg\"}, {\"name\": \"David Thompson\", \"role\": \"Technology Director\", \"image\": \"/assets/images/users/user-4.jpg\"}, {\"name\": \"Lisa Wang\", \"role\": \"Student Success Coordinator\", \"image\": \"/assets/images/users/user-5.jpg\"}, {\"name\": \"James Miller\", \"role\": \"Content Strategist\", \"image\": \"/assets/images/users/user-6.jpg\"}, {\"name\": \"Amanda Davis\", \"role\": \"Quality Assurance Lead\", \"image\": \"/assets/images/users/user-7.jpg\"}, {\"name\": \"Robert Kim\", \"role\": \"Community Manager\", \"image\": \"/assets/images/users/user-8.jpg\"}]}', 1, 6, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(55, 'Newsletter', 'call_to_action', 4, 'Newsletter', 'Subscribe Our Newsletter', 'Subscribe to our newsletter to get the latest news and updates. We will not spam you.', NULL, NULL, NULL, NULL, '{\"title\": true, \"sub_title\": true, \"description\": true}', '[]', 1, 6, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(56, 'Top Instructors', 'top_instructors', 1, 'Meet Our Experts', NULL, 'Our team is a group of passionate educators, developers, & designers who believe in the power of learning to change lives.', NULL, NULL, NULL, NULL, '{\"title\": true, \"description\": true}', '{\"contents\": [2, 3, 4, 5, 6, 7, 8, 9]}', 1, 7, '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(57, 'Partners', 'partners', 2, 'Trusted by over 100 leading companies worldwide', NULL, NULL, NULL, NULL, NULL, NULL, '{\"title\": true}', '{\"array\": [{\"image\": \"/assets/logos/logo-1.png\"}, {\"image\": \"/assets/logos/logo-2.png\"}, {\"image\": \"/assets/logos/logo-3.png\"}, {\"image\": \"/assets/logos/logo-4.png\"}, {\"image\": \"/assets/logos/logo-5.png\"}, {\"image\": \"/assets/logos/logo-6.png\"}, {\"image\": \"/assets/logos/logo-7.png\"}, {\"image\": \"/assets/logos/logo-8.png\"}]}', 1, 7, '2025-12-29 14:31:17', '2025-12-29 14:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `admin_revenue` decimal(10,2) DEFAULT NULL,
  `instructor_revenue` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `coupon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_id` bigint UNSIGNED DEFAULT NULL,
  `meta` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'paypal, stripe, razorpay, paytm, paystack, etc.',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `fields` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_histories`
--

CREATE TABLE `payout_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `payout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_answers`
--

CREATE TABLE `question_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `answers` json NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `quiz_question_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json DEFAULT NULL,
  `answer` json DEFAULT NULL,
  `sort` int NOT NULL,
  `section_quiz_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_submissions`
--

CREATE TABLE `quiz_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `attempts` int NOT NULL,
  `correct_answers` int NOT NULL,
  `incorrect_answers` int NOT NULL,
  `total_marks` int NOT NULL,
  `is_passed` tinyint(1) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `section_quiz_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_lessons`
--

CREATE TABLE `section_lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `lesson_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_src` text COLLATE utf8mb4_unicode_ci,
  `lesson_provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `embed_source` longtext COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_free` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `lesson_number` int UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `course_section_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_quizzes`
--

CREATE TABLE `section_quizzes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` time NOT NULL,
  `hours` int NOT NULL DEFAULT '0',
  `minutes` int NOT NULL DEFAULT '0',
  `seconds` int NOT NULL DEFAULT '0',
  `total_mark` int NOT NULL,
  `pass_mark` int NOT NULL,
  `retake` int NOT NULL DEFAULT '1',
  `drip_rule` int DEFAULT NULL,
  `summary` int DEFAULT NULL,
  `num_questions` int DEFAULT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `course_section_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `sub_type`, `title`, `fields`, `created_at`, `updated_at`) VALUES
(1, 'system', 'collaborative', 'System Settings', '{\"name\": \"Mentor Learning Management System\", \"email\": \"admin@yourdomain.com\", \"phone\": \"+123 45 678 9201\", \"theme\": \"system\", \"title\": \"Mentor Learning Management System\", \"author\": \"UiLib\", \"banner\": \"/banner.png\", \"slogan\": \"A course based video CMS\", \"favicon\": \"/favicon.ico\", \"keywords\": \"LMS, Learning Management System, Courses, Mentor, LMS\", \"direction\": \"none\", \"logo_dark\": \"/assets/icons/logo-dark.png\", \"logo_light\": \"/assets/icons/logo-light.png\", \"description\": \"Transform your learning journey with Mentor LMS - a comprehensive online learning platform connecting expert instructors with passionate learners. Discover courses, build skills, and achieve your goals.\", \"selling_tax\": 5, \"global_style\": \"\", \"selling_currency\": \"USD\", \"language_selector\": true, \"instructor_revenue\": 70}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(2, 'payment', 'paypal', 'Paypal Settings', '{\"active\": false, \"currency\": \"USD\", \"test_mode\": true, \"sandbox_client_id\": \"\", \"sandbox_secret_key\": \"\", \"production_client_id\": \"\", \"production_secret_key\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(3, 'payment', 'stripe', 'Stripe Settings', '{\"active\": false, \"currency\": \"USD\", \"test_mode\": true, \"webhook_secret\": \"\", \"live_public_key\": \"\", \"live_secret_key\": \"\", \"test_public_key\": \"\", \"test_secret_key\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(4, 'payment', 'mollie', 'Mollie Settings', '{\"active\": false, \"currency\": \"USD\", \"test_mode\": true, \"live_api_key\": \"\", \"test_api_key\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(5, 'payment', 'paystack', 'Paystack Settings', '{\"active\": false, \"currency\": \"ZAR\", \"test_mode\": true, \"live_public_key\": \"\", \"live_secret_key\": \"\", \"test_public_key\": \"\", \"test_secret_key\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(6, 'payment', 'sslcommerz', 'SSLCommerz Settings', '{\"active\": false, \"currency\": \"BDT\", \"store_id\": \"\", \"test_mode\": true, \"store_password\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(7, 'payment', 'razorpay', 'Razorpay Settings', '{\"active\": false, \"api_key\": \"\", \"currency\": \"INR\", \"test_mode\": true, \"api_secret\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(8, 'payment', 'offline', 'Offline Payment Settings', '{\"active\": false, \"payment_details\": \"Please put your offline payment/bank information here\", \"payment_instructions\": \"Please complete your payment using one of the following payment details below. After making the payment, please submit your transaction details on the next page.\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(9, 'smtp', NULL, 'SMTP Settings', '{\"mail_host\": \"\", \"mail_port\": \"465\", \"mail_mailer\": \"smtp\", \"mail_password\": \"\", \"mail_username\": \"\", \"mail_from_name\": \"Mentor LMS\", \"mail_encryption\": \"ssl\", \"mail_from_address\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(10, 'auth', 'google', 'Google Auth', '{\"active\": false, \"redirect\": \"http://localhost:8000/auth/google/callback\", \"client_id\": \"\", \"client_secret\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(11, 'auth', 'recaptcha', 'Google Recaptcha', '{\"active\": false, \"site_key\": \"\", \"secret_key\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(12, 'storage', NULL, 'Storage Settings', '{\"aws_bucket\": \"\", \"storage_driver\": \"local\", \"aws_access_key_id\": \"\", \"aws_default_region\": \"us-east-1\", \"aws_secret_access_key\": \"\", \"aws_use_path_style_endpoint\": false}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(13, 'live_class', NULL, 'Live Class Settings', '{\"zoom_web_sdk\": false, \"zoom_client_id\": \"\", \"zoom_account_id\": \"\", \"zoom_account_email\": \"\", \"zoom_client_secret\": \"\", \"zoom_sdk_client_id\": \"\", \"zoom_sdk_client_secret\": \"\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17'),
(14, 'home_page', NULL, 'Select Home Page', '{\"page_id\": 1, \"page_name\": \"Collaborative 1\", \"page_slug\": \"home-1\"}', '2025-12-29 14:31:17', '2025-12-29 14:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_stores`
--

CREATE TABLE `temp_stores` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_links` json DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `instructor_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `password`, `email`, `status`, `photo`, `google_id`, `social_links`, `email_verified_at`, `instructor_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '$2y$12$fLmGPh7.9TKh.kRHfCpcN.A6FUBQAafEW447cm1BErU26pJTg.p4C', 'admin@example.com', 1, NULL, NULL, NULL, '2025-12-29 14:31:19', 1, NULL, '2025-12-29 14:31:19', '2025-12-29 14:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `watch_histories`
--

CREATE TABLE `watch_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `prev_watching_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prev_watching_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_section_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_watching_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_watching_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_watching_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_watching_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_watching` json DEFAULT NULL,
  `completion_date` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_submissions_user_id_foreign` (`user_id`),
  ADD KEY `assignment_submissions_course_assignment_id_foreign` (`course_assignment_id`),
  ADD KEY `assignment_submissions_grader_id_foreign` (`grader_id`);

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_user_id_foreign` (`user_id`),
  ADD KEY `blog_comments_blog_id_index` (`blog_id`),
  ADD KEY `blog_comments_parent_id_index` (`parent_id`);

--
-- Indexes for table `blog_like_dislikes`
--
ALTER TABLE `blog_like_dislikes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_like_dislikes_blog_id_user_id_unique` (`blog_id`,`user_id`),
  ADD KEY `blog_like_dislikes_user_id_foreign` (`user_id`),
  ADD KEY `blog_like_dislikes_blog_id_type_index` (`blog_id`,`type`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `certificate_templates`
--
ALTER TABLE `certificate_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chunked_uploads`
--
ALTER TABLE `chunked_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chunked_uploads_user_id_status_index` (`user_id`,`status`);

--
-- Indexes for table `chunked_upload_parts`
--
ALTER TABLE `chunked_upload_parts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chunked_upload_parts_upload_id_part_number_unique` (`upload_id`,`part_number`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_instructor_id_foreign` (`instructor_id`),
  ADD KEY `courses_course_category_id_foreign` (`course_category_id`);

--
-- Indexes for table `course_assignments`
--
ALTER TABLE `course_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_assignments_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_carts`
--
ALTER TABLE `course_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_carts_user_id_foreign` (`user_id`),
  ADD KEY `course_carts_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_category_children`
--
ALTER TABLE `course_category_children`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_category_children_course_category_id_foreign` (`course_category_id`);

--
-- Indexes for table `course_certificates`
--
ALTER TABLE `course_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_certificates_identifier_unique` (`identifier`),
  ADD KEY `course_certificates_user_id_foreign` (`user_id`),
  ADD KEY `course_certificates_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_coupons`
--
ALTER TABLE `course_coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_coupons_code_unique` (`code`),
  ADD KEY `course_coupons_code_index` (`code`),
  ADD KEY `course_coupons_course_id_index` (`course_id`),
  ADD KEY `course_coupons_is_active_index` (`is_active`);

--
-- Indexes for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_enrollments_user_id_foreign` (`user_id`),
  ADD KEY `course_enrollments_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_faqs`
--
ALTER TABLE `course_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_faqs_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_forums`
--
ALTER TABLE `course_forums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_forums_user_id_foreign` (`user_id`),
  ADD KEY `course_forums_course_id_foreign` (`course_id`),
  ADD KEY `course_forums_section_lesson_id_foreign` (`section_lesson_id`);

--
-- Indexes for table `course_forum_replies`
--
ALTER TABLE `course_forum_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_forum_replies_user_id_foreign` (`user_id`),
  ADD KEY `course_forum_replies_course_forum_id_foreign` (`course_forum_id`);

--
-- Indexes for table `course_live_classes`
--
ALTER TABLE `course_live_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_live_classes_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_outcomes`
--
ALTER TABLE `course_outcomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_outcomes_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_progress`
--
ALTER TABLE `course_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_progress_user_id_foreign` (`user_id`),
  ADD KEY `course_progress_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_requirements`
--
ALTER TABLE `course_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_requirements_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_reviews_user_id_foreign` (`user_id`),
  ADD KEY `course_reviews_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_sections`
--
ALTER TABLE `course_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_sections_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_wishlists`
--
ALTER TABLE `course_wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_wishlists_user_id_foreign` (`user_id`),
  ADD KEY `course_wishlists_course_id_foreign` (`course_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exams_slug_unique` (`slug`),
  ADD KEY `exams_slug_index` (`slug`),
  ADD KEY `exams_status_index` (`status`),
  ADD KEY `exams_instructor_id_index` (`instructor_id`),
  ADD KEY `exams_exam_category_id_index` (`exam_category_id`),
  ADD KEY `exams_pricing_type_index` (`pricing_type`);

--
-- Indexes for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_attempts_user_id_index` (`user_id`),
  ADD KEY `exam_attempts_exam_id_index` (`exam_id`),
  ADD KEY `exam_attempts_status_index` (`status`),
  ADD KEY `exam_attempts_user_id_exam_id_attempt_number_index` (`user_id`,`exam_id`,`attempt_number`);

--
-- Indexes for table `exam_attempt_answers`
--
ALTER TABLE `exam_attempt_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_attempt_answers_exam_attempt_id_index` (`exam_attempt_id`),
  ADD KEY `exam_attempt_answers_exam_question_id_index` (`exam_question_id`),
  ADD KEY `exam_attempt_answers_is_correct_index` (`is_correct`);

--
-- Indexes for table `exam_categories`
--
ALTER TABLE `exam_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exam_categories_slug_unique` (`slug`),
  ADD KEY `exam_categories_slug_index` (`slug`),
  ADD KEY `exam_categories_status_index` (`status`);

--
-- Indexes for table `exam_coupons`
--
ALTER TABLE `exam_coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exam_coupons_code_unique` (`code`),
  ADD KEY `exam_coupons_code_index` (`code`),
  ADD KEY `exam_coupons_exam_id_index` (`exam_id`),
  ADD KEY `exam_coupons_is_active_index` (`is_active`);

--
-- Indexes for table `exam_enrollments`
--
ALTER TABLE `exam_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exam_enrollments_user_id_exam_id_unique` (`user_id`,`exam_id`),
  ADD KEY `exam_enrollments_user_id_index` (`user_id`),
  ADD KEY `exam_enrollments_exam_id_index` (`exam_id`),
  ADD KEY `exam_enrollments_enrollment_type_index` (`enrollment_type`);

--
-- Indexes for table `exam_faqs`
--
ALTER TABLE `exam_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_faqs_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `exam_outcomes`
--
ALTER TABLE `exam_outcomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_outcomes_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_questions_exam_id_index` (`exam_id`),
  ADD KEY `exam_questions_question_type_index` (`question_type`),
  ADD KEY `exam_questions_sort_index` (`sort`);

--
-- Indexes for table `exam_question_options`
--
ALTER TABLE `exam_question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_question_options_exam_question_id_index` (`exam_question_id`),
  ADD KEY `exam_question_options_is_correct_index` (`is_correct`);

--
-- Indexes for table `exam_requirements`
--
ALTER TABLE `exam_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_requirements_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `exam_resources`
--
ALTER TABLE `exam_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_resources_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `exam_reviews`
--
ALTER TABLE `exam_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exam_reviews_user_id_exam_id_unique` (`user_id`,`exam_id`),
  ADD KEY `exam_reviews_user_id_index` (`user_id`),
  ADD KEY `exam_reviews_exam_id_index` (`exam_id`),
  ADD KEY `exam_reviews_rating_index` (`rating`);

--
-- Indexes for table `exam_wishlists`
--
ALTER TABLE `exam_wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exam_wishlists_user_id_exam_id_unique` (`user_id`,`exam_id`),
  ADD KEY `exam_wishlists_user_id_index` (`user_id`),
  ADD KEY `exam_wishlists_exam_id_index` (`exam_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `footers`
--
ALTER TABLE `footers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_items`
--
ALTER TABLE `footer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footer_items_footer_id_foreign` (`footer_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructors_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_circulars`
--
ALTER TABLE `job_circulars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_circulars_slug_unique` (`slug`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_properties`
--
ALTER TABLE `language_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_properties_language_id_foreign` (`language_id`);

--
-- Indexes for table `lesson_resources`
--
ALTER TABLE `lesson_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_resources_section_lesson_id_foreign` (`section_lesson_id`);

--
-- Indexes for table `marksheet_templates`
--
ALTER TABLE `marksheet_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navbars`
--
ALTER TABLE `navbars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navbar_items`
--
ALTER TABLE `navbar_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `navbar_items_navbar_id_foreign` (`navbar_id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_sections_page_id_foreign` (`page_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_settings_type_unique` (`type`);

--
-- Indexes for table `payout_histories`
--
ALTER TABLE `payout_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payout_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_answers_user_id_foreign` (`user_id`),
  ADD KEY `question_answers_quiz_question_id_foreign` (`quiz_question_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_questions_section_quiz_id_foreign` (`section_quiz_id`);

--
-- Indexes for table `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_submissions_user_id_foreign` (`user_id`),
  ADD KEY `quiz_submissions_section_quiz_id_foreign` (`section_quiz_id`);

--
-- Indexes for table `section_lessons`
--
ALTER TABLE `section_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_lessons_course_id_foreign` (`course_id`),
  ADD KEY `section_lessons_course_section_id_foreign` (`course_section_id`);

--
-- Indexes for table `section_quizzes`
--
ALTER TABLE `section_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_quizzes_course_id_foreign` (`course_id`),
  ADD KEY `section_quizzes_course_section_id_foreign` (`course_section_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribes_email_unique` (`email`);

--
-- Indexes for table `temp_stores`
--
ALTER TABLE `temp_stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `temp_stores_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `watch_histories`
--
ALTER TABLE `watch_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watch_histories_user_id_foreign` (`user_id`),
  ADD KEY `watch_histories_course_id_foreign` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_like_dislikes`
--
ALTER TABLE `blog_like_dislikes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificate_templates`
--
ALTER TABLE `certificate_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chunked_uploads`
--
ALTER TABLE `chunked_uploads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chunked_upload_parts`
--
ALTER TABLE `chunked_upload_parts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_assignments`
--
ALTER TABLE `course_assignments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_carts`
--
ALTER TABLE `course_carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_category_children`
--
ALTER TABLE `course_category_children`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_certificates`
--
ALTER TABLE `course_certificates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_coupons`
--
ALTER TABLE `course_coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_faqs`
--
ALTER TABLE `course_faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_forums`
--
ALTER TABLE `course_forums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_forum_replies`
--
ALTER TABLE `course_forum_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_live_classes`
--
ALTER TABLE `course_live_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_outcomes`
--
ALTER TABLE `course_outcomes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_progress`
--
ALTER TABLE `course_progress`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_requirements`
--
ALTER TABLE `course_requirements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_reviews`
--
ALTER TABLE `course_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_sections`
--
ALTER TABLE `course_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_wishlists`
--
ALTER TABLE `course_wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_attempt_answers`
--
ALTER TABLE `exam_attempt_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_categories`
--
ALTER TABLE `exam_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_coupons`
--
ALTER TABLE `exam_coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_enrollments`
--
ALTER TABLE `exam_enrollments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_faqs`
--
ALTER TABLE `exam_faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_outcomes`
--
ALTER TABLE `exam_outcomes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_question_options`
--
ALTER TABLE `exam_question_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_requirements`
--
ALTER TABLE `exam_requirements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_resources`
--
ALTER TABLE `exam_resources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_reviews`
--
ALTER TABLE `exam_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_wishlists`
--
ALTER TABLE `exam_wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footers`
--
ALTER TABLE `footers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `footer_items`
--
ALTER TABLE `footer_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_circulars`
--
ALTER TABLE `job_circulars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language_properties`
--
ALTER TABLE `language_properties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `lesson_resources`
--
ALTER TABLE `lesson_resources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marksheet_templates`
--
ALTER TABLE `marksheet_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `navbars`
--
ALTER TABLE `navbars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `navbar_items`
--
ALTER TABLE `navbar_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `page_sections`
--
ALTER TABLE `page_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_histories`
--
ALTER TABLE `payout_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_lessons`
--
ALTER TABLE `section_lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_quizzes`
--
ALTER TABLE `section_quizzes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_stores`
--
ALTER TABLE `temp_stores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `watch_histories`
--
ALTER TABLE `watch_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD CONSTRAINT `assignment_submissions_course_assignment_id_foreign` FOREIGN KEY (`course_assignment_id`) REFERENCES `course_assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submissions_grader_id_foreign` FOREIGN KEY (`grader_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `blog_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_like_dislikes`
--
ALTER TABLE `blog_like_dislikes`
  ADD CONSTRAINT `blog_like_dislikes_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_like_dislikes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chunked_uploads`
--
ALTER TABLE `chunked_uploads`
  ADD CONSTRAINT `chunked_uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chunked_upload_parts`
--
ALTER TABLE `chunked_upload_parts`
  ADD CONSTRAINT `chunked_upload_parts_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `chunked_uploads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`),
  ADD CONSTRAINT `courses_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`);

--
-- Constraints for table `course_assignments`
--
ALTER TABLE `course_assignments`
  ADD CONSTRAINT `course_assignments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_carts`
--
ALTER TABLE `course_carts`
  ADD CONSTRAINT `course_carts_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_category_children`
--
ALTER TABLE `course_category_children`
  ADD CONSTRAINT `course_category_children_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_certificates`
--
ALTER TABLE `course_certificates`
  ADD CONSTRAINT `course_certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_coupons`
--
ALTER TABLE `course_coupons`
  ADD CONSTRAINT `course_coupons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  ADD CONSTRAINT `course_enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_faqs`
--
ALTER TABLE `course_faqs`
  ADD CONSTRAINT `course_faqs_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_forums`
--
ALTER TABLE `course_forums`
  ADD CONSTRAINT `course_forums_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_forums_section_lesson_id_foreign` FOREIGN KEY (`section_lesson_id`) REFERENCES `section_lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_forums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_forum_replies`
--
ALTER TABLE `course_forum_replies`
  ADD CONSTRAINT `course_forum_replies_course_forum_id_foreign` FOREIGN KEY (`course_forum_id`) REFERENCES `course_forums` (`id`),
  ADD CONSTRAINT `course_forum_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `course_live_classes`
--
ALTER TABLE `course_live_classes`
  ADD CONSTRAINT `course_live_classes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_outcomes`
--
ALTER TABLE `course_outcomes`
  ADD CONSTRAINT `course_outcomes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_progress`
--
ALTER TABLE `course_progress`
  ADD CONSTRAINT `course_progress_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progress_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_requirements`
--
ALTER TABLE `course_requirements`
  ADD CONSTRAINT `course_requirements_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD CONSTRAINT `course_reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_sections`
--
ALTER TABLE `course_sections`
  ADD CONSTRAINT `course_sections_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_wishlists`
--
ALTER TABLE `course_wishlists`
  ADD CONSTRAINT `course_wishlists_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_exam_category_id_foreign` FOREIGN KEY (`exam_category_id`) REFERENCES `exam_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exams_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD CONSTRAINT `exam_attempts_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_attempt_answers`
--
ALTER TABLE `exam_attempt_answers`
  ADD CONSTRAINT `exam_attempt_answers_exam_attempt_id_foreign` FOREIGN KEY (`exam_attempt_id`) REFERENCES `exam_attempts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_attempt_answers_exam_question_id_foreign` FOREIGN KEY (`exam_question_id`) REFERENCES `exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_coupons`
--
ALTER TABLE `exam_coupons`
  ADD CONSTRAINT `exam_coupons_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_enrollments`
--
ALTER TABLE `exam_enrollments`
  ADD CONSTRAINT `exam_enrollments_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_faqs`
--
ALTER TABLE `exam_faqs`
  ADD CONSTRAINT `exam_faqs_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_outcomes`
--
ALTER TABLE `exam_outcomes`
  ADD CONSTRAINT `exam_outcomes_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `exam_questions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_question_options`
--
ALTER TABLE `exam_question_options`
  ADD CONSTRAINT `exam_question_options_exam_question_id_foreign` FOREIGN KEY (`exam_question_id`) REFERENCES `exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_requirements`
--
ALTER TABLE `exam_requirements`
  ADD CONSTRAINT `exam_requirements_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_resources`
--
ALTER TABLE `exam_resources`
  ADD CONSTRAINT `exam_resources_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_reviews`
--
ALTER TABLE `exam_reviews`
  ADD CONSTRAINT `exam_reviews_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_wishlists`
--
ALTER TABLE `exam_wishlists`
  ADD CONSTRAINT `exam_wishlists_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `footer_items`
--
ALTER TABLE `footer_items`
  ADD CONSTRAINT `footer_items_footer_id_foreign` FOREIGN KEY (`footer_id`) REFERENCES `footers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `language_properties`
--
ALTER TABLE `language_properties`
  ADD CONSTRAINT `language_properties_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_resources`
--
ALTER TABLE `lesson_resources`
  ADD CONSTRAINT `lesson_resources_section_lesson_id_foreign` FOREIGN KEY (`section_lesson_id`) REFERENCES `section_lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `navbar_items`
--
ALTER TABLE `navbar_items`
  ADD CONSTRAINT `navbar_items_navbar_id_foreign` FOREIGN KEY (`navbar_id`) REFERENCES `navbars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD CONSTRAINT `page_sections_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD CONSTRAINT `payment_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payout_histories`
--
ALTER TABLE `payout_histories`
  ADD CONSTRAINT `payout_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD CONSTRAINT `question_answers_quiz_question_id_foreign` FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_section_quiz_id_foreign` FOREIGN KEY (`section_quiz_id`) REFERENCES `section_quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  ADD CONSTRAINT `quiz_submissions_section_quiz_id_foreign` FOREIGN KEY (`section_quiz_id`) REFERENCES `section_quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `section_lessons`
--
ALTER TABLE `section_lessons`
  ADD CONSTRAINT `section_lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `section_lessons_course_section_id_foreign` FOREIGN KEY (`course_section_id`) REFERENCES `course_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `section_quizzes`
--
ALTER TABLE `section_quizzes`
  ADD CONSTRAINT `section_quizzes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `section_quizzes_course_section_id_foreign` FOREIGN KEY (`course_section_id`) REFERENCES `course_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `temp_stores`
--
ALTER TABLE `temp_stores`
  ADD CONSTRAINT `temp_stores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `watch_histories`
--
ALTER TABLE `watch_histories`
  ADD CONSTRAINT `watch_histories_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `watch_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
