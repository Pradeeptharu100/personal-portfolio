import '../models/project_model.dart';
import '../models/skill_model.dart';

class PortfolioData {
  PortfolioData._();

  // Personal Information
  static const String name = 'Pradeep Tharu';
  static const String title = 'Flutter Developer';
  static const String location = 'Shivraj 1, Kapilvastu';
  static const String email = 'pradeeptharu100@gmail.com';
  static const String phone = '+977 9761666132';
  static const String linkedIn =
      'https://www.linkedin.com/in/pradeep-tharu-7aaaa0';
  static const String github = 'https://github.com/Pradeeptharu100';
  static const String dob = '1997-03-21';

  static const String summary =
      'As a mobile and Flutter developer, my objective is to build scalable solutions that solve real-world problems for millions of people. I aim to simplify everyday tasks, enhance learning experiences, and improve work-life efficiency by creating reliable, user-friendly, and impactful applications that make daily life easier.';

  // Work Experience
  static final List<WorkExperience> workExperience = [
    WorkExperience(
      title: 'Mid Flutter Developer',
      company: 'Delta-v Logic and Solution',
      location: 'Remote',
      startDate: DateTime(2025, 1),
      endDate: null,
      responsibilities: [
        'Developed and maintained end-to-end mobile applications using Flutter and Dart.',
        'Implemented complex features including role-based access, API integrations, and offline support.',
        'Collaborated with remote teams using Agile practices and designed scalable app architecture.',
        'Contributed to UI/UX decisions, feature planning, and code reviews.',
      ],
    ),
    WorkExperience(
      title: 'Junior Flutter Developer',
      company: 'Dallo Tech Pvt. Ltd.',
      location: 'Satdobato, Lalitpur, Nepal',
      startDate: DateTime(2023, 5),
      endDate: DateTime(2025, 3),
      responsibilities: [
        'Built and maintained large-scale applications like E-Shiksha and Jeevan Vigyan.',
        'Implemented pixel-perfect UI and clean architecture using Provider/GetX.',
        'Developed features for PDF reading, video downloads, offline access, and QR-code scanning.',
        'Optimized app performance for 10,000+ active users.',
      ],
    ),
    WorkExperience(
      title: 'Flutter Intern',
      company: 'Vurilo Pvt. Ltd.',
      location: 'Maharajgunj, Kathmandu, Nepal',
      startDate: DateTime(2023, 3),
      endDate: DateTime(2023, 8),
      responsibilities: [
        'Assisted in developing Flutter apps with a focus on clean code and scalable folder structures.',
        'Contributed to internal products including a quiz application and QA platform (QA Lint).',
        'Collaborated with senior developers to debug issues and improve stability.',
      ],
    ),
  ];

  // Skills
  static final List<SkillModel> skills = [
    // Mobile Development
    const SkillModel(
      name: 'Flutter & Dart',
      category: SkillCategory.mobile,
      proficiency: 0.95,
    ),
    const SkillModel(
      name: 'State Management (BLOC, Provider, GetX)',
      category: SkillCategory.mobile,
      proficiency: 0.9,
    ),
    const SkillModel(
      name: 'Clean Code & MVC Principles',
      category: SkillCategory.mobile,
      proficiency: 0.85,
    ),

    // Payment & Tools
    const SkillModel(
      name:
          'Payment Gateways (eSewa, Khalti, Connect IPS, Stripe, PayPal, Razorpay)',
      category: SkillCategory.tools,
      proficiency: 0.85,
    ),
    const SkillModel(
      name: 'Git (GitHub, GitLab)',
      category: SkillCategory.tools,
      proficiency: 0.85,
    ),
    const SkillModel(
      name: 'Trello, Meister Task',
      category: SkillCategory.tools,
      proficiency: 0.8,
    ),
    const SkillModel(
      name: 'Agile Environments',
      category: SkillCategory.tools,
      proficiency: 0.8,
    ),

    // Backend & API
    const SkillModel(
      name: 'Node js',
      category: SkillCategory.backend,
      proficiency: 0.25,
    ),
    const SkillModel(
      name: 'Supabase',
      category: SkillCategory.backend,
      proficiency: 0.85,
    ),
    const SkillModel(
      name: 'REST API Integration',
      category: SkillCategory.backend,
      proficiency: 0.9,
    ),
    const SkillModel(
      name: 'Firebase Services',
      category: SkillCategory.backend,
      proficiency: 0.85,
    ),

    const SkillModel(
      name: 'Authentication (Google, Apple, Phone, Email)',
      category: SkillCategory.backend,
      proficiency: 0.85,
    ),
    const SkillModel(
      name:
          'Offline Storage (SQLite, Hive, Shared Preferences, Local Storage, Secure Storage)',
      category: SkillCategory.backend,
      proficiency: 0.85,
    ),
    // Advanced Features
    const SkillModel(
      name: 'Server-Driven UI (SDUI)',
      category: SkillCategory.other,
      proficiency: 0.75,
    ),
    const SkillModel(
      name: 'Feature Flags',
      category: SkillCategory.other,
      proficiency: 0.75,
    ),
    const SkillModel(
      name: 'AI-Powered Developer Tools',
      category: SkillCategory.other,
      proficiency: 0.7,
    ),
  ];

  // Projects
  static final List<ProjectModel> projects = [
    const ProjectModel(
      id: 'cosmos',
      name: 'Cosmos Astrology Admin Panel',
      description:
          'A management app for admins to perform CRUD operations on blogs, astrologers, and videos. Uses Supabase for backend.',
      longDescription:
          'A comprehensive astrology admin panel for managing content, astrologers, and user interactions. Features include real-time updates, analytics dashboard, and content management system.',
      technologies: ['Flutter', 'Supabase', 'Admin Panel', 'CRUD Operations'],
      playStoreUrl: '',
      type: ProjectType.freelance,
      slug: 'cosmos-admin',
    ),
    const ProjectModel(
      id: 'cosmos_astrology_app',
      name: 'Cosmos Astrology',
      description:
          'A modern astrology application providing personalized horoscopes, consultations, and reports with secure online payments.',
      longDescription:
          'Cosmos Astrology is a full-featured astrology platform built with Flutter. '
          'It offers daily horoscopes, kundli generation, astrology consultations, '
          'and personalized reports. The app uses GetX for state management, Hive for '
          'local caching, Firebase for authentication and real-time data, and supports '
          'multiple payment gateways including eSewa, Khalti, and PayPal for seamless '
          'in-app purchases and consultations.',
      technologies: [
        'Flutter',
        'GetX',
        'Hive',
        'Firebase',
        'Astrology',
        'eSewa',
        'Khalti',
        'PayPal',
        'In-App Payments',
        'Real-time Data',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.cosmosNepal.cosmos&hl=en',
      type: ProjectType.freelance,
      slug: 'cosmos-astrology',
    ),

    const ProjectModel(
      id: 'chow_chow_restaurant',
      name: 'Chow Chow Restaurant',
      description:
          'A management app for restaurants to handle order statuses, waitlists, reservations, and analytics.',
      longDescription:
          'Restaurant management system with order tracking, reservation management, waitlist handling, and business analytics. Features real-time order updates and customer management.',
      technologies: [
        'Flutter',
        'Restaurant Management',
        'Analytics',
        'Real-time Updates',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.chowchowespress.chowchowespress&hl=en',
      type: ProjectType.professional,
      company: 'Delta-v Logic and Solution',
      slug: 'chow-chow-restaurant',
    ),
    const ProjectModel(
      id: 'chow_chow_user',
      name: 'Chow Chow (User App)',
      description:
          'A food delivery application with Google Maps integration and social authentication.',
      longDescription:
          'Customer-facing food delivery app with location tracking, social login, order placement, and real-time delivery status updates.',
      technologies: ['Flutter', 'Google Maps', 'Social Auth', 'Food Delivery'],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.chowchowespress.chowchowespress&hl=en',
      type: ProjectType.professional,
      company: 'Delta-v Logic and Solution',
      slug: 'chow-chow-user',
    ),
    const ProjectModel(
      id: 'majjako_deals',
      name: 'Majjako Deals',
      description:
          'E-commerce application supporting diverse payment methods including eSewa, Khalti, Stripe, and Crypto.',
      longDescription:
          'Multi-payment e-commerce platform with product catalog, shopping cart, order management, and secure payment processing through various gateways.',
      technologies: [
        'Flutter',
        'E-commerce',
        'Multiple Payments',
        'Crypto Integration',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.milehigh.majjakodeals&hl=en',
      type: ProjectType.professional,
      company: 'Delta-v Logic and Solution',
      slug: 'majjako-deals',
    ),
    const ProjectModel(
      id: 'majjako_logistics',
      name: 'Majjako Logistics',
      description:
          'Multi-role app for riders, vendors, and admins to manage deliveries with real-time tracking.',
      longDescription:
          'Logistics management platform with role-based access for delivery riders, vendors, and administrators. Features real-time tracking and delivery management.',
      technologies: [
        'Flutter',
        'Logistics',
        'Real-time Tracking',
        'Multi-role System',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mydvls.majjakologistics&hl=en',
      type: ProjectType.professional,
      company: 'Delta-v Logic and Solution',
      slug: 'majjako-logistics',
    ),
    const ProjectModel(
      id: 'jeevan_vigyan',
      name: 'Jeevan Vigyan',
      description: 'A spiritual platform for meditation and yoga courses.',
      longDescription:
          'Spiritual learning platform offering meditation guides, yoga courses, progress tracking, and community features for holistic wellness.',
      technologies: [
        'Flutter',
        'Spiritual Platform',
        'Meditation',
        'Yoga Courses',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.jeevanvigyan.mobileapp&hl=en',
      type: ProjectType.professional,
      company: 'Dallo Tech',
      slug: 'jeevan-vigyan',
    ),
    const ProjectModel(
      id: 'eshiksha',
      name: 'e-Shiksha',
      description:
          'Educational app featuring live exams, quizzes, and video content.',
      longDescription:
          'Comprehensive educational platform with live examinations, interactive quizzes, video lectures, and performance analytics for students.',
      technologies: ['Flutter', 'Education', 'Live Exams', 'Video Content'],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.dallotech.eshiksha&hl=en',
      type: ProjectType.professional,
      company: 'Dallo Tech',
      slug: 'e-shiksha',
    ),
    const ProjectModel(
      id: 'kids_learning',
      name: 'Kids Learning Application',
      description:
          'Interactive language platform for children\'s learning and development.',
      longDescription:
          'Interactive educational app for children featuring language learning, games, and developmental activities with engaging content.',
      technologies: [
        'Flutter',
        'Kids Education',
        'Interactive Learning',
        'Language Platform',
      ],
      playStoreUrl: '',
      type: ProjectType.personal,
    ),
    const ProjectModel(
      id: 'gadget_arena',
      name: 'Gadget Arena Nepal',
      description: 'Price comparison app for gadgets and electronics in Nepal.',
      longDescription:
          'Price comparison platform for gadgets and electronics across multiple Nepalese e-commerce sites with price tracking and alerts.',
      technologies: [
        'Flutter',
        'Price Comparison',
        'E-commerce Integration',
        'Gadget Tracking',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mobile.price_mobile_app&hl=en',
      type: ProjectType.personal,
    ),
  ];

  // Education
  static final List<Education> education = [
    const Education(
      institution: 'Shree Nepal Adarsh Higher Secondary School',
      degree: '12th',
      location: 'Kapilvastu',
    ),
    const Education(
      institution: 'Nepal Adarsh Higher Multiple Campus',
      degree: 'BSC',
      status: 'Uncompleted',
    ),
  ];
}
