import 'models/project_model.dart';
import 'models/skill_model.dart';

class PortfolioData {
  PortfolioData._();

  // Personal Information
  static const String name = 'Pradeep Tharu';
  static const String title = 'Flutter Developer';
  static const String location = 'Kathmandu, Nepal';
  static const String email = 'pradeeptharu100@gmail.com';
  static const String phone = '+977 9761666132';
  static const String linkedIn =
      'https://www.linkedin.com/in/pradeep-tharu-7aaaa0281/';
  static const String github = 'https://github.com/Pradeeptharu100';

  static const String summary =
      'Flutter developer with 2 years of experience building versatile mobile applications across sectors like education, spirituality, and e-commerce. Known for expertise in complex state management (GetX, Bloc, Provider), payment gateway integration, and CI/CD with Codemagic. Skilled in Firebase notifications, local storage with Hive, and delivering high-quality, user-centered applications.';

  // Work Experience
  static final List<WorkExperience> workExperience = [
    WorkExperience(
      title: 'Junior-Level Flutter Developer',
      company: 'Dallo Tech Pvt. Ltd.',
      location: 'Satdobato, Lalitpur, Nepal',
      startDate: DateTime(2023, 8),
      endDate: null,
      responsibilities: [
        'Developed features for Eye Will, e-Shiksha, and Jeevan Vigyan applications, enhancing user engagement',
        'Collaborated with cross-functional teams, contributing to project planning, code quality, and troubleshooting',
      ],
    ),
    WorkExperience(
      title: 'Flutter Intern',
      company: 'Vurilo Pvt. Ltd.',
      location: 'Maharajgunj, Kathmandu, Nepal',
      startDate: DateTime(2023, 4),
      endDate: DateTime(2023, 7),
      responsibilities: [
        'Assisted in developing QA Lint and Vurilo applications, gaining hands-on experience in Flutter development',
      ],
    ),
  ];

  // Skills
  static final List<SkillModel> skills = [
    // Mobile Development
    const SkillModel(
      name: 'Flutter',
      category: SkillCategory.mobile,
      proficiency: 0.9,
    ),
    const SkillModel(
      name: 'Dart',
      category: SkillCategory.mobile,
      proficiency: 0.9,
    ),
    const SkillModel(
      name: 'MVC Architecture',
      category: SkillCategory.mobile,
      proficiency: 0.85,
    ),
    const SkillModel(
      name: 'Clean Architecture',
      category: SkillCategory.mobile,
      proficiency: 0.8,
    ),
    const SkillModel(
      name: 'GetX',
      category: SkillCategory.mobile,
      proficiency: 0.9,
    ),
    const SkillModel(
      name: 'Bloc',
      category: SkillCategory.mobile,
      proficiency: 0.85,
    ),
    const SkillModel(
      name: 'Provider',
      category: SkillCategory.mobile,
      proficiency: 0.85,
    ),

    // Backend & Databases
    const SkillModel(
      name: 'Firebase',
      category: SkillCategory.backend,
      proficiency: 0.85,
    ),
    const SkillModel(
      name: 'MongoDB',
      category: SkillCategory.backend,
      proficiency: 0.75,
    ),
    const SkillModel(
      name: 'MySQL',
      category: SkillCategory.backend,
      proficiency: 0.75,
    ),
    const SkillModel(
      name: 'Node.js',
      category: SkillCategory.backend,
      proficiency: 0.7,
    ),
    const SkillModel(
      name: 'Express.js',
      category: SkillCategory.backend,
      proficiency: 0.7,
    ),

    // Tools
    const SkillModel(
      name: 'Git',
      category: SkillCategory.tools,
      proficiency: 0.85,
    ),
    const SkillModel(
      name: 'GitHub',
      category: SkillCategory.tools,
      proficiency: 0.85,
    ),
    const SkillModel(
      name: 'Trello',
      category: SkillCategory.tools,
      proficiency: 0.8,
    ),
    const SkillModel(
      name: 'Codemagic',
      category: SkillCategory.tools,
      proficiency: 0.8,
    ),

    // Other Skills
    const SkillModel(
      name: 'REST API Integration',
      category: SkillCategory.other,
      proficiency: 0.9,
    ),
    const SkillModel(
      name: 'Payment Gateways (eSewa, Khalti, Razorpay)',
      category: SkillCategory.other,
      proficiency: 0.85,
    ),
    const SkillModel(
      name: 'Hive (Local Storage)',
      category: SkillCategory.other,
      proficiency: 0.85,
    ),
  ];

  // Projects
  static final List<ProjectModel> projects = [
    const ProjectModel(
      id: 'cosmos',
      name: 'Cosmos Astrology Application',
      description:
          'Developed an astrology app integrating GetX, Hive, Firebase, and payment gateways (eSewa, Khalti, PayPal)',
      longDescription:
          'A comprehensive astrology application offering personalized horoscopes, Kundali generation, and astrological consultations. Features include real-time chat with astrologers, in-app purchases, and multi-language support.',
      technologies: [
        'Flutter',
        'GetX',
        'Hive',
        'Firebase',
        'eSewa',
        'Khalti',
        'PayPal',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.cosmosNepal.cosmos&hl=en',
      type: ProjectType.freelance,
    ),
    const ProjectModel(
      id: 'gadget_arena',
      name: 'Gadget Arena Nepal Application',
      description:
          'Created a price comparison app with real-time updates, enabling informed purchasing decisions by comparing prices across platforms',
      longDescription:
          'A mobile price comparison platform that aggregates prices from multiple e-commerce sites in Nepal. Features include price tracking, alerts, product reviews, and specifications comparison.',
      technologies: ['Flutter', 'REST API', 'Firebase', 'Web Scraping'],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mobile.price_mobile_app',
      type: ProjectType.personal,
    ),
    const ProjectModel(
      id: 'jeevan_vigyan',
      name: 'Jeevan Vigyan Application',
      description:
          'Designed a modern spiritual platform offering courses on meditation, yoga, and personal development, increasing app engagement',
      longDescription:
          'A spiritual learning platform providing video courses, live sessions, and guided meditations. Features include progress tracking, certificates, community forums, and offline content access.',
      technologies: [
        'Flutter',
        'Firebase',
        'Video Streaming',
        'Payment Integration',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.jeevanvigyan.mobileapp',
      type: ProjectType.professional,
      company: 'Dallo Tech',
    ),
    const ProjectModel(
      id: 'eshiksha',
      name: 'e-Shiksha Application',
      description:
          'Built an extensive educational app for Samiksha Publication, including live exams, quizzes, courses, video content, and e-book access',
      longDescription:
          'A comprehensive educational platform for students featuring live exams with real-time results, interactive quizzes, video lectures, e-books, and progress analytics. Supports multiple subjects and grade levels.',
      technologies: [
        'Flutter',
        'Firebase',
        'Video Player',
        'PDF Viewer',
        'Real-time Database',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.dallotech.eshiksha&hl=en',
      type: ProjectType.professional,
      company: 'Dallo Tech',
    ),
    const ProjectModel(
      id: 'meal_prep',
      name: 'Meal Prep Application',
      description:
          'Implemented in-app purchase subscriptions, offering premium meal planning tools and recipes, supporting app development and retention',
      longDescription:
          'A meal planning and recipe management app with personalized nutrition plans, grocery lists, and cooking instructions. Features subscription-based premium content and meal tracking.',
      technologies: [
        'Flutter',
        'In-App Purchases',
        'Firebase',
        'Subscription Management',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mealprapp&pcampaignid=web_share',
      type: ProjectType.professional,
      company: 'Dallo Tech',
    ),
    const ProjectModel(
      id: 'qa_lint',
      name: 'QA Lint Application',
      description:
          'Freelance opportunity for QA specialists. Join to ensure code quality, review test cases, and streamline processes',
      longDescription:
          'A quality assurance platform connecting QA specialists with projects. Features include test case management, bug tracking, and collaboration tools for remote QA teams.',
      technologies: ['Flutter', 'Firebase', 'Real-time Collaboration'],
      type: ProjectType.professional,
      company: 'Vurilo',
    ),
    const ProjectModel(
      id: 'kids_learning',
      name: 'Kids Learning Application',
      description:
          'Created an interactive learning platform with quizzes for mastering languages and numbers, fostering auditory and visual learning',
      longDescription:
          'An educational app for children featuring interactive games, quizzes, and activities to learn languages and mathematics. Includes audio-visual content and progress tracking for parents.',
      technologies: ['Flutter', 'Audio/Video', 'Animations', 'Local Storage'],
      type: ProjectType.personal,
    ),
    const ProjectModel(
      id: 'weather',
      name: 'Weather Application',
      description:
          'Developed a user-friendly weather app with real-time location search and navigation, enhancing user experience through smooth functionality',
      longDescription:
          'A weather forecasting app providing real-time weather data, 7-day forecasts, and location-based alerts. Features include interactive maps and weather animations.',
      technologies: ['Flutter', 'Weather API', 'Location Services', 'Maps'],
      type: ProjectType.personal,
    ),
    const ProjectModel(
      id: 'quiz',
      name: 'Quiz Application',
      description:
          'Built a dynamic quiz app with various categories and difficulty levels, integrated with real-time API data for continuous updates',
      longDescription:
          'A trivia and quiz application with multiple categories, difficulty levels, and leaderboards. Features real-time score updates and social sharing.',
      technologies: ['Flutter', 'REST API', 'Firebase', 'Leaderboards'],
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
