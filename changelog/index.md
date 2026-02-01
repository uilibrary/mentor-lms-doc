# Changelog

All notable changes, improvements, and fixes to Mentor LMS are documented here. Each version includes detailed information about new features, bug fixes, and improvements.

## Version 3.4.3 - 31 January 2026

- **New**: Cloudflare R2 storage option.
- **Fix**: Job circular salary display issue.
- **Fix**: Live class zoom integration warning show issue.
- **Fix**: Lesson resources delete issue during lesson delete.
- **Improve**: Chunked upload file handling system.

## Version 3.4.2 - 21 January 2026

- **Fix**: Job circular salary display issue.
- **Fix**: Exam enrollment issue during payment.
- **Fix**: Exam question answer scoring issue.
- **Fix**: Exam best attempt score finding issue.
- **Improve**: Ability to separate the price instead of plain number based on system currency.

## Version 3.4.1 - 2 January 2026

- **Fix**: Responsive issue from the Home-4 and Home-5.
- **Fix**: Richtext editor image render issue after inserting.
- **Fix**: The online and offline payment history view issue from the dashboard.
- **New**: Added new option in the image insert section of richtext editor.
- **Improve**: Added an id into the main app-logo for add custom style.

## Version 3.4.0 - 15 December 2025

- **Fix**: Razorpay payment gateway issues
- **Fix**: Installation final step migration issue
- **Fix**: Course coupon validity issue specific course
- **Fix**: Foreign key issue from payment_histories table of installer final step
- **New**: Added sslcommerz and razorpay payment gateway for instructor payout
- **New**: Reconnect the storage with the public by symlink from the admin dashboard
- **Improve**: App maintenance page with each feature UI, UX and functionality
- **Improve**: Instructor payout methods handling functionality
- **Improve**: Course and Exam payment methods handling functionality
- **Improve**: Changed the placements of some feature codebase files
- **Improve**: Reduce the codebase by clearing the unused and duplicate codes and files

## Version 3.3.0 - 08 December 2025

- **Fix**: Free course enrollment issue
- **Fix**: Expiry period show issue from the course card
- **Fix**: Student email verification warning show issue
- **Fix**: Course approval modal always show issue for admin
- **Fix**: Resource download issue from Course lesson
- **Fix**: The sizebar RTL issue of the exam course player page
- **Fix**: Link input form button issue from richtext editor
- **Fix**: Text wrap and design break issue of richtext editor from all components
- **Fix**: Richtext editor content render issues from all components
- **Fix**: Category select issue form exam create and update components
- **Fix**: System currency symbol issue from exam card and dashboard cart components
- **Fix**: 'Top course' section issue from home page of administrative landing page
- **Fix**: Intro page section edit modal issue from other pages intro page
- **Fix**: Course or Exam enrollment duration duration period issue from the data table.
- **Fix**: RTL issue from course and exam category pages of admin/instructor dashboard.
- **Remove**: Previous Course or Exam enrollment duration period handing functionality
- **Improve**: Added a list of course or exam enrollment duration period for create and update.
- **Improve**: Course or Exam enrollment duration period handing functionality.
- **Improve**: Changed some routes access permission for the student role

## Version 3.2.0 - 30 November 2025

- **New**: Implemented comprehensive Offline Payment Gateway system
- **New**: Added offline payment method option in payment gateway selection
- **New**: Introduced Payment Report module in admin dashboard
- **New**: Added "Payment Report" menu with Online Payments and Offline Payments sections
- **New**: Created Offline Payments page with status tracking (Pending, Verified, Rejected)
- **New**: Added pagination and sortable tables for better data management
- **New**: Built offline payment verification system with detailed modal interface
- **New**: Added attachment download functionality for transaction proofs
- **New**: Added automatic course/exam enrollment upon payment verification
- **Fix**: Fixed undefined relationship error in PaymentHistory model

## Version 3.1.0 - 29 November 2025

- **Fix**: Fixed navbar items active/deactive issue
- **Fix**: Fixed footer social media button click issue
- **Fix**: fixed shared hosting missing CURL_SSLVERSION_TLSv1_2 constant issue
- **Fix**: fixed enrollment modal issue from admin dashboard
- **Fix**: resolved custom page active off or on issue and added 404 page
- **Remove**: custom rich text editor and used it as a npm package
- **Improve**: reduce the front-end chunk size and improve the performance

## Version 3.0.0 - 23 November 2025

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

## Version 2.3.0 - 02 November 2025

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

## Version 2.2.0 - 20 October 2025

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

## Version 2.1.0 - 15 October 2025

- **New**: Integrated Google reCAPTCHA v3 for login page security
- **New**: Added Google reCAPTCHA configuration option in admin dashboard
- **New**: Implemented default theme and language setup option in admin dashboard
- **Fix**: Resolved array items removal issue in intro section editor
- **Update**: Enhanced home page customization system stability

## Version 2.0.0 - 09 October 2025

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

## Version 1.2.1 - 23 September 2025

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

## Version 1.2.0 - 22 September 2025

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

## Version 1.1.1 - 14 September 2025

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

## Version 1.1.0 - 10 September 2025

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

## Version 1.0.1 - 3 September 2025

- **Fix**: Fixed mobile responsiveness issues on the course player page
- **Fix**: Resolved rating progress bar overflow in `student-feedback`
- **Improve**: Polished course player layout and spacing for small screens
- **Refactor**: Extracted `LessonIcons` with discriminated props (drip vs non-drip)
- **Update**: Resolved Google authentication (OAuth) configuration process
- **Update**: Increased `section_lessons.embed_source` column size to `LONGTEXT`

## Need Help?

If you have questions about any version or need assistance with updates, please:

- Contact our support team at [support@ui-lib.com](mailto:support@ui-lib.com)
