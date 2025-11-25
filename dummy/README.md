# Mentor LMS - Learning Management System

Mentor LMS is a comprehensive Learning Management System built with Laravel 12 and React, designed to provide a seamless online education experience for students, instructors, and administrators.

## Overview

Mentor LMS offers a robust platform for creating, managing, and selling online courses with features like curriculum building, payment processing, student enrollment management, live classes, job postings, and advanced analytics. The system supports multiple user roles, course formats, payment gateways, and includes modular architecture for easy maintenance and updates.

## Updated Version 3.0.0 - 23 November 2025

- **New**: Introduced comprehensive Exam Module as a standalone examination system separate from courses
- **New**: Implemented complete exam with wishlist and checkout functionality
- **New**: Added exam category management system for organizing exams
- **New**: Integrated exam coupon system with code generator and discount management
- **New**: Created 7 advanced question types for comprehensive assessment:
  - Multiple Choice (MCQ) with single selection
  - Multiple Select with checkbox options
  - Matching questions with dropdown selectors
  - Fill in the Blanks with inline input fields
  - Ordering questions with drag-and-drop functionality
  - Short Answer for open-ended responses
  - Listening questions with audio player and controls
- **New**: Implemented a tracking system based on the exam attempts
- **New**: Added countdown timer with auto-submit when time expires
- **New**: Created question navigator with status indicators and mark for review feature
- **New**: Added fullscreen mode for distraction-free exam taking
- **New**: Integrated before-leave warnings to prevent accidental navigation
- **New**: Built comprehensive results page with score breakdown and analytics
- **New**: Added attempt history tracking with best score highlighting
- **New**: Implemented performance analytics by question type
- **New**: Created auto-grading system for 6 question types like
  - MCQ,
  - Multiple Select,
  - Matching,
  - Fill Blank,
  - Ordering,
  - Listening
- **New**: Added manual grading interface for short answer questions
- **New**: Integrated pass/fail determination with visual indicators
- **New**: Implemented exam review and rating system for students
- **New**: Added exam enrollment management for both free and paid exams
- **New**: Created exam statistics dashboard for admins and instructors
- **New**: Added exam update functionality with all editable fields
- **New**: Implemented exam analytics page with enrollment and revenue tracking
- **New**: Added comprehensive validation and error handling throughout exam flow
- **New**: Integrated exam purchase system by the existing payment gateways
- **Fix**: Resolve the copyright text issue from the course player
- **Fix**: Fix the mobile responsive issues from the course player page
- **Fix**: Fix the mobile responsive issues from some others pages
- **Improve**: Optimized exam taking performance for large question sets

## Updated Version 2.3.0 - 02 November 2025

- **New**: Integrated Google reCAPTCHA v3 for registration page security
- **New**: Implemented comprehensive student course management system with organized tabs
- **New**: Added module viewer with lesson completion tracking in student dashboard
- **New**: Live class management interface with direct join functionality for students
- **New**: Assignment management system with submission and result viewing capabilities
- **New**: Quiz management interface with result viewing for submitted quizzes
- **New**: Resources hub for organized lesson materials with easy download or access
- **New**: Certificate and marksheet download options upon course completion
- **New**: Real-time course progress tracking display for students
- **New**: Certificate template builder in admin dashboard for custom template creation
- **New**: Marksheet template builder in admin dashboard for custom marksheet design
- **New**: Template management system with update functionality for existing templates
- **New**: Default certificate selection option for administrators
- **New**: Added automatic app domain capture option in the step-2 of installation wizard
- **Fix**: Resolved enrollment display issue for instructors
- **Improve**: Enhanced student course experience with centralized material access
- **Improve**: Streamlined quiz status display with submission indicators and action buttons

## Updated Version 2.2.0 - 20 October 2025

- **New**: Implemented lesson resource upload system.
- **New**: Admin UI to create/manage lesson resources.
- **New**: Lesson resource download option for students.
- **New**: Floating Action Button for mobile screen in navbar for managing appearance, cart, language, etc.
- **Fix**: Footer payment gateway add/update/delete issues.
- **Fix**: Logo display issue in course player page.
- **Fix**: Dashboard and table pagination text visibility.
- **Fix**: Default language not applied properly on frontend.
- **Update**: App logo is always show for all devices screen for consistent branding.
- **Update**: Moved language selector from public pages to student, instructor and admin dashboard.
- **Improve**: Hardened components to avoid production errors.
- **Improve**: Home page section array items customization system

## Updated Version 2.1.0 - 15 October 2025

- **New**: Integrated Google reCAPTCHA v3 for login page security
- **New**: Added Google reCAPTCHA configuration option in admin dashboard
- **New**: Implemented default theme and language setup option in admin dashboard
- **Fix**: Resolved array items removal issue in intro section editor
- **Update**: Enhanced home page customization system stability

## Updated Version 2.0.0 - 09 October 2025

- **New**: Added comprehensive multi-language support
- **New**: Implemented language management dashboard for admin
- **New**: Integrated language selector for all user roles
- **New**: Added support for dynamic content translation
- **New**: Added translation editor with organized group sections
- **New**: Added RTL or LTR feature for language direction
- **New**: Added comprehensive App Maintenance Panel for system recovery
- **New**: Implemented application update system with version management
- **New**: Added system reboot functionality with maintenance mode controls
- **New**: Integrated complete backup management system
- **New**: Added recovery tools for system diagnostics and repair
- **Fix**: Resolved text direction issues in RTL languages
- **Fix**: Fixed translation caching for better performance
- **Fix**: Ensured maintenance panel remains accessible during system issues
- **Fix**: Improved system stability with enhanced error recovery
- **Fix**: Optimized backup creation and restoration processes

## Updated Version 1.2.1 - 23 September 2025

- **Fix**: Enhanced system reboot UI with better visual feedback
- **Fix**: Resolved job creation issue from Job Circular section
- **Fix**: Fixed popup form update issue from course lesson edit
- **Fix**: Resolved Razorpay payment gateway issue and updated configuration
- **New**: Added system reboot confirmation page with detailed operation preview
- **New**: Implemented secure system cache clearing without affecting user sessions
- **New**: Implemented maintenance mode bypass for system reboot operations
- **New**: Added session management improvements for system operations
- **New**: Added comprehensive system reboot functionality with admin verification
- **New**: Added installer refresh functionality to resolve any issue during installation

## Updated Version 1.2.0 - 22 September 2025

- **Fix**: Enhanced system reboot UI with better visual feedback
- **Fix**: Resolved job creation issue from Job Circular section
- **Fix**: Fixed popup form update issue from course lesson edit
- **Fix**: Resolved Razorpay payment gateway issue and updated configuration
- **New**: Added system reboot confirmation page with detailed operation preview
- **New**: Implemented secure system cache clearing without affecting user sessions
- **New**: Implemented maintenance mode bypass for system reboot operations
- **New**: Added session management improvements for system operations
- **New**: Added comprehensive system reboot functionality with admin verification
- **New**: Added installer refresh functionality to resolve any issue during installation

## Updated Version 1.1.1 - 14 September 2025

- **Fix**: Resolved course lesson update issues.
- **Fix**: Fix all mobile responsive issues from dashboard pages.
- **Fix**: Resolved instructor create issue from admin dashboard.
- **Fix**: Course edit page – category not showing in some cases.
- **Fix**: Email footer issue and email template styling improvements.
- **New**: Added server refresh option to the maintenance page
- **New**: Added blog section for all intro pages to show the blogs
- **New**: Added Global Custom CSS option in Admin → Settings → System.
- **Update**: Enhanced version management with robust update and rollback capabilities.
- **Update**: Optimized JS chunking for better page load on direct browse/reload URLs.

## Updated Version 1.1.0 - 10 September 2025

- **Fix**: Resolved image display and upload issues
- **Fix**: Fixed big image file upload problems
- **Fix**: Added 404 error page for better user experience
- **Fix**: Addressed various UX and small interface issues
- **Fix**: Fixed Google login issue for seamless authentication
- **Fix**: Resolved style issues form the email templates
- **New**: Added Razorpay payment gateway for secure payments
- **New**: Integrated SSLCommerz payment gateway for BDT payments
- **New**: Introduced Blog module for sharing articles, tips, and updates.
- **New**: Users can browse, read, and interact with blog posts.
- **New**: Instructors and admins can create, edit, and manage blog content.
- **New**: Added system currency select option for course selling
- **Update**: Improved blog management and user interaction features

## Updated Version 1.0.1 - 3 September 2025

- **Fix**: Fixed mobile responsiveness issues on the course player page
- **Fix**: Resolved rating progress bar overflow in `student-feedback`
- **Improve**: Polished course player layout and spacing for small screens
- **Refactor**: Extracted `LessonIcons` with discriminated props (drip vs non-drip)
- **Update**: Resolved Google authentication (OAuth) configuration process
- **Update**: Increased `section_lessons.embed_source` column size to `LONGTEXT`

## Initial Version 1.0.0 - 1 September 2025

## Key Features

### For Students

- **User-friendly Course Catalog**: Browse and search for courses by category, rating, instructor, or level
- **Personalized Learning Dashboard**: Track progress, manage enrolled courses, and access course materials
- **Interactive Learning Experience**: Access video lessons, quizzes, assignments, and discussion forums
- **Watch History & Progress Tracking**: Resume where you left off with detailed progress analytics
- **Course Reviews & Ratings**: Rate and review completed courses with detailed feedback
- **Certificate Generation**: Automatic certificate generation and download upon course completion
- **Shopping Cart & Wishlist**: Save courses for later or add them to cart for purchase
- **Multi-payment Options**: Pay via PayPal, Stripe, Mollie, or Paystack
- **Live Class Participation**: Join instructor-led live classes with Zoom integration
- **Discussion Forums**: Participate in course-specific discussions and Q&A sessions

### For Instructors

- **Course Creation Tools**: Build structured courses with sections, lessons, quizzes, and multimedia content
- **Curriculum Builder**: Organize course content with drag-and-drop section and lesson management
- **Advanced Quiz System**: Create comprehensive quizzes with multiple question types, automated grading, and result analysis
- **Live Class Management**: Schedule and conduct live classes using Zoom integration
- **Student Management**: Track student progress, participation, quiz performance, and engagement
- **Course Analytics**: Monitor course performance, student engagement, revenue, and completion rates
- **Payout System**: Request earnings with support for multiple payment methods (PayPal, Stripe, Mollie, Paystack)
- **Instructor Dashboard**: Access key metrics, course statistics, and earnings reports
- **Application Process**: Apply to become an instructor with approval workflow
- **Media Management**: Upload and manage course videos, documents, and other media files

### For Administrators

- **Complete System Management**: Control all aspects of the platform with granular permissions
- **User Management**: Manage students, instructors, and admin accounts with role-based access
- **Course Approval Workflow**: Review, approve, or reject instructor course submissions
- **Category Management**: Organize courses with hierarchical categories and subcategories
- **Job Circular Management**: Create and manage job postings for career services
- **Newsletter System**: Send bulk emails and notifications to platform users
- **System Settings**: Configure authentication, email, storage, live classes, and general settings
- **Custom Page Management**: Create and manage dynamic pages for the platform
- **Navbar & Footer Customization**: Customize navigation menus and footer content
- **Full Home Customization**: Easy to customize the available home page or the current selected home page directly from the page.
- **Payment Configuration**: Set up and manage multiple payment gateways with commission settings
- **SMTP Configuration**: Set up the SMTP and manage the email sending related features
- **Storage Configuration**: Configure the storage from 2 type of storage option like local and s3 as the app storage
- **Google Auth Configuration**: Set up the google auth then enable the the login with google option
- **App Installation**: Install the app to the server by following some easy steps
- **Backup & Update System**: Automated backup creation and system updates from the dashboard
- **Collaborative System Mode**: Enable a collaborative platform where qualified users can become instructors and create their own courses. The platform administrator will receive a percentage of revenue from each instructor's course sales.
- **Administrative System Mode**: Centralize course management where only administrators can create and publish educational content. Students can enroll in these official courses, with all revenue flowing directly to the platform administration.

## Technical Features

### Authentication & User Management

- **Multi-role Authentication**: Student, Instructor, and Admin access levels with role-based permissions
- **Social Authentication**: Google OAuth integration for seamless login
- **Security Features**: Password reset, email verification, session management, and secure password policies
- **Profile Management**: Comprehensive user profile management with avatar uploads

### Course Management

- **Rich Course Content**: Support for videos, documents, quizzes, assignments, and interactive content
- **Advanced Quiz System**: Multiple question types (multiple choice, true/false, essay), timed quizzes, and detailed analytics
- **Curriculum Structure**: Hierarchical organization with sections, lessons, and subsections
- **Drip Content**: Schedule content release based on enrollment date or progress
- **Course Requirements & Outcomes**: Define prerequisites and learning objectives
- **FAQ Management**: Course-specific frequently asked questions
- **Media Library Integration**: Advanced file management with Spatie Media Library

### Live Learning Features

- **Zoom Integration**: Seamless live class scheduling and participation
- **Real-time Collaboration**: Interactive sessions with screen sharing and recording
- **Meeting Management**: Automated meeting creation, updates, and deletion
- **Participant Management**: Host and participant controls with waiting rooms

### Payment & Financial Management

- **Multiple Gateways**: PayPal, Stripe, Mollie, and Paystack integration
- **Secure Transactions**: Encrypted payment processing with webhook verification
- **Subscription Management**: Support for one-time and recurring payments
- **Commission System**: Configurable instructor commission rates and payment rules
- **Payout Processing**: Automated earnings distribution with multiple payout methods
- **Financial Reporting**: Detailed transaction history and revenue analytics

### Communication & Engagement

- **Discussion Forums**: Course-specific discussion boards with threading and moderation
- **Real-time Notifications**: In-app and email notifications for important events
- **Newsletter System**: Bulk email campaigns with subscriber management
- **Review & Rating System**: Comprehensive course feedback with star ratings and comments

### Content Management

- **SEO Optimization**: Meta tags, Open Graph, and Twitter Card support for better discoverability
- **Custom Pages**: Dynamic page creation with rich text editor
- **Navigation Management**: Customizable navbar and footer with drag-and-drop reordering
- **Media Upload**: Chunked uploads for large files with progress tracking
- **Content Versioning**: Track changes and maintain content history

### System Administration

- **Modular Architecture**: Laravel Modules for organized, maintainable code
- **Automated Backups**: Scheduled backup creation with restore functionality
- **System Updates**: Built-in update system for seamless upgrades
- **Storage Management**: Support for local, S3, and Google Cloud Storage
- **SMTP Configuration**: Flexible email configuration with testing capabilities

## User Roles & Permissions

### Students

- Browse and enroll in courses with shopping cart functionality
- Access course content with progress tracking and watch history
- Participate in discussions, submit assignments, and take quizzes
- Review courses, download certificates, and track learning progress
- Manage wishlist and cart for future purchases
- Access live classes and participate in real-time sessions

### Instructors

- Create and manage comprehensive courses with multimedia content
- Build curriculum with sections, lessons, quizzes, and assessments
- Schedule and conduct live classes with Zoom integration
- Monitor student progress and engagement analytics
- Manage earnings and request payouts through multiple methods
- Interact with students through forums and direct messaging
- Access detailed course performance and revenue reports

### Administrators

- Manage all users, courses, and platform content
- Configure system settings, payment gateways, and integrations
- Review and approve instructor applications and course submissions
- Create and manage job circulars for career services
- Send newsletters and manage email campaigns
- Customize platform appearance with navbar/footer management
- Perform system maintenance, backups, and updates
- Access comprehensive analytics and reporting tools
