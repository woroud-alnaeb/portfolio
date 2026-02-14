/// Portfolio data models and content
/// You can edit values here - keys should remain unchanged
library portfolio_data;

import '../generated/assets.dart';

// === Personal Info ===
class PersonalInfo {
  static const String name = 'Woroud Alnaeb';
  static const String title = 'Senior Mobile Engineer';
  static const String subtitle = 'Flutter Specialist';
  static const String tagline =
      'Building enterprise-grade mobile applications with passion for clean architecture';
  static const String location = 'Dubai, UAE';
  static const String email = 'woroud.alnaeb@gmail.com';
  static const String phone = '+971558867210';
  static const String availability =
      'Available for Remote Opportunities';
  static const String profileImage = 'assets/images/profile.jpg';
  static const String resumeUrl =
      'https://docs.google.com/document/d/15-ZisTdPMck-sVjmMrU35_Si7q6oKNjcLl7yoah6qF4/edit?usp=sharing';
}

// === Social Links ===
class SocialLinks {
  static const String linkedin =
      'https://www.linkedin.com/in/woroud-alnaeb/';
  static const String github = 'https://github.com/woroud.alnaeb';
  static const String pubdev =
      'https://pub.dev/publishers/flutterbots.dev/packages';
  static const String twitter = '';
  static const String medium = '';
}

// === About ===
class About {
  static const String shortBio =
      'Senior Mobile Engineer with 5 years specializing in Flutter development. Passionate about building scalable, offline-first applications and mentoring developers to achieve technical excellence.';

  static const String longBio = '''
I am a Senior Mobile Engineer with a systems-driven mindset, focused on building scalable, maintainable, and reliable mobile platforms across iOS, Android, and web. I prioritize architectural clarity, strong state management, and well-defined domain boundaries to ensure systems remain robust as they grow. My expertise includes Flutter, native mobile technologies, advanced backend integration, real-time synchronization, and hardware interfaces such as BLE and NFC. I design solutions that balance performance, cost efficiency, and long-term sustainability. Beyond implementation, I establish engineering standards, mentor developers, and foster structured problem-solving. I build software with the perspective of an engineer responsible for its evolution, not just its release.
''';

  static const List<Map<String, String>> highlights = [
    {
      'icon': '💰',
      'title': 'Cost Optimization',
      'description':
          'Reduced cloud infrastructure costs from \$100/month to \$0 through architectural optimization',
    },
    {
      'icon': '👥',
      'title': 'Team Leadership',
      'description':
          'Led team of 5 engineers and successfully mentored 3 juniors to mid-level',
    },
    {
      'icon': '📱',
      'title': 'Production Apps',
      'description':
          'Delivered 15+ production applications across iOS and Android',
    },
    {
      'icon': '🌍',
      'title': 'Global Impact',
      'description':
          'Built systems serving thousands of users across MENA, Europe, and beyond',
    },
  ];

  static const List<String> funFacts = [
    'Created beacon_plugin used by Flutter community',
    'Reduced a company\'s cloud costs to \$0 (and they were happy about it!)',
    'Mentored 3 developers who are now mid-level engineers',
    'Can debug code in my sleep (literally had dreams about fixing bugs)',
  ];
}

// === Stats ===
class Stats {
  static const int yearsOfExperience = 5;
  static const int projectsCompleted = 20;
  static const int appsPublished = 15;
  static const int usersServed = 10000;
  static const int teamsMentored = 5;
}

// === Skills ===
class SkillCategory {
  final String name;
  final String level;
  final List<Skill> skills;

  const SkillCategory({
    required this.name,
    required this.level,
    required this.skills,
  });
}

class Skill {
  final String name;
  final int level;
  final String years;

  const Skill(
      {required this.name, required this.level, required this.years});
}

const List<SkillCategory> skillCategories = [
  SkillCategory(
    name: 'Mobile Development',
    level: 'expert',
    skills: [
      Skill(name: 'Flutter', level: 95, years: '5'),
      Skill(name: 'Dart', level: 95, years: '5'),
      Skill(name: 'Android (Kotlin)', level: 50, years: '1'),
      Skill(name: 'iOS (Swift)', level: 50, years: '1'),
    ],
  ),
  SkillCategory(
    name: 'State Management & Architecture',
    level: 'expert',
    skills: [
      Skill(name: 'BLoC', level: 100, years: '5'),
      Skill(name: 'Riverpod', level: 90, years: '4'),
      Skill(name: 'Provider', level: 95, years: '5'),
      Skill(name: 'Clean Architecture', level: 100, years: '5'),
      Skill(name: 'SOLID Principles', level: 100, years: '5'),
    ],
  ),
  SkillCategory(
    name: 'Backend & Database',
    level: 'advanced',
    skills: [
      Skill(name: 'Firebase', level: 90, years: '4+'),
      Skill(name: 'Firestore', level: 90, years: '3+'),
      Skill(name: 'SQLite', level: 85, years: '3+'),
      Skill(name: 'SQL', level: 70, years: '2+'),
      Skill(name: 'REST APIs', level: 90, years: '4+'),
      Skill(name: 'OAuth2/SSO', level: 85, years: '2+'),
    ],
  ),
  SkillCategory(
    name: 'DevOps & Tools',
    level: 'advanced',
    skills: [
      Skill(name: 'Git/GitHub', level: 95, years: '4+'),
      Skill(name: 'Azure DevOps', level: 80, years: '1'),
      Skill(name: 'CI/CD', level: 85, years: '3+'),
      Skill(name: 'Agile/Scrum', level: 90, years: '3+'),
      Skill(name: 'Linux', level: 75, years: '2+'),
      Skill(
        name: 'Unit/Widget/Integration Testing',
        level: 85,
        years: '3+',
      ),
    ],
  ),
  SkillCategory(
    name: 'Specialized Skills',
    level: 'advanced',
    skills: [
      Skill(name: 'IoT Integration (NFC/BLE)', level: 85, years: '2'),
      Skill(name: 'Google Maps SDK', level: 90, years: '2+'),
      Skill(
          name: 'Offline-First Architecture', level: 90, years: '2+'),
      Skill(name: 'Real-time Sync', level: 85, years: '2+'),
      Skill(name: 'Computer Vision', level: 60, years: '1'),
      Skill(name: 'AI Integration', level: 70, years: '1+'),
    ],
  ),
];

// === Experience ===
class Experience {
  final String id;
  final String company;
  final String location;
  final String position;
  final String type;
  final String startDate;
  final String? endDate;
  final bool current;
  final String duration;
  final String logo;
  final String? companyUrl;
  final String description;
  final List<String> technologies;
  final List<String> achievements;
  final List<Map<String, String>> highlights;

  const Experience({
    required this.id,
    required this.company,
    required this.location,
    required this.position,
    required this.type,
    required this.startDate,
    this.endDate,
    required this.current,
    required this.duration,
    required this.logo,
    this.companyUrl,
    required this.description,
    required this.technologies,
    required this.achievements,
    required this.highlights,
  });
}

const List<Experience> experiences = [
  Experience(
    id: 'coopatek',
    company: 'CoopatTek',
    location: 'Lebanon (Remote)',
    position: 'Senior Mobile Engineer',
    type: 'Part-time',
    startDate: '2024-01',
    endDate: null,
    current: true,
    duration: '1+ year',
    logo: Assets.companiesCoopatekLogo,
    companyUrl: 'http://www.coopatek.com',
    description:
        'Independently architecting and developing Skoohub, an enterprise-grade School Management System serving 10000+ users across students, parents, and staff.',
    technologies: [
      'Firebase (Advanced Firestore, Rules & triggers)',
      'Google Maps SDK',
      'Background Fetch',
      'Reactive Forms',
      'NFC/BLE',
      'OAuth2/SSO',
    ],
    achievements: [
      'A system that serves schools with different administrative structures and varying operational preferences',
      'Published to App Store, TestFlight, and Google Play',
    ],
    highlights: [
      {
        'icon': '💰',
        'title': 'Cost Optimization Champion',
        'description':
            'Reduced cloud infrastructure costs from \$100/month to \$0 through data structure optimization',
      },
      {
        'icon': '🏗️',
        'title': 'End-to-End Ownership',
        'description':
            'Led complete development lifecycle from analysis and architecture to deployment',
      },
      {
        'icon': '🖇',
        'title': 'IoT Integration',
        'description':
            'Integrated Bluetooth Low Energy (BLE) and Near Field Communication (NFC) for attendance tracking',
      },
      {
        'icon': '📍',
        'title': 'Real-time Tracking System',
        'description':
            'Implemented live bus tracking using Google Maps SDK with background geolocation',
      },
    ],
  ),
  Experience(
    id: 'mootawer',
    company: 'Mootawer',
    location: 'Lebanon (Remote)',
    position: 'Mid Mobile Applications Developer & Team Lead',
    type: 'Full-time',
    startDate: '2022-07',
    endDate: '2023-11',
    current: false,
    duration: '1 year 5 months',
    logo: Assets.companiesMootawerLogo,
    companyUrl: 'https://www.mootawer.com',
    description:
        'Led mobile development team of 5 engineers while delivering multiple production applications and establishing engineering best practices.',
    technologies: [
      'Flutter',
      'Firebase',
      'Mason',
      'CI/CD',
      'BLoC',
      'Riverpod',
    ],
    achievements: [
      'Led team to deliver 7+ apps in 16 months',
      'Trained and mentored junior developers to mid-level following my own road map',
      'Established CI/CD reducing deployment time by 70%',
      'Created reusable architecture templates',
      'Built white labeled core project for internal development',
    ],
    highlights: [
      {
        'icon': '👥',
        'title': 'Team Leadership',
        'description':
            'Managed team of 5 mobile engineers, conducted code reviews, and established architectural standards',
      },
      {
        'icon': '🎓',
        'title': 'Mentorship Success',
        'description':
            'Created comprehensive training roadmap and mentored 3 junior developers to mid-level',
      },
      {
        'icon': '🔄',
        'title': 'Custom Sync System',
        'description':
            'Engineered offline-sync service from scratch for Hapster industrial training platform',
      },
    ],
  ),
  Experience(
    id: 'elkood',
    company: 'Elkood',
    location: 'Aleppo',
    position: 'Flutter Developer',
    type: 'Full-time',
    startDate: '2021-02',
    endDate: '2022-05',
    current: false,
    duration: '1 year 4 months',
    logo: Assets.companiesElkoodLogo,
    companyUrl: '',
    description:
        'Joined as 4th employee in early-stage startup. Built and shipped multiple applications while improving architecture and code quality standards.',
    technologies: [
      'Flutter',
      'Dart',
      'Firebase',
      'Provider/BloC',
      'REST APIs'
    ],
    achievements: [
      'Delivered 4 apps from concept to Play Store',
      'Created 3 internal packages still in use',
    ],
    highlights: [
      {
        'icon': '📍',
        'title': 'Near By',
        'description':
            'Developed Near By service allows apps to easily discover, connect to, and exchange data with nearby devices in real-time',
      },
      {
        'icon': '📱',
        'title': 'Product Delivery',
        'description':
            'Built 4 applications from scratch and published to Google Play Store',
      },
    ],
  ),
];

// === Projects ===
class Project {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String thumbnail;
  final String shortDescription;
  final String? fullDescription;
  final String role;
  final List<String> technologies;
  final List<String> impact;
  final Map<String, String> links;
  final String status;
  final String year;
  final List<String> platforms;
  final bool isFeatured;

  const Project({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.thumbnail,
    required this.shortDescription,
    this.fullDescription,
    required this.role,
    required this.technologies,
    required this.impact,
    required this.links,
    required this.status,
    required this.year,
    required this.platforms,
    this.isFeatured = false,
  });
}

const List<Project> projects = [
  // === Featured Projects ===
  Project(
    id: 'skoohub',
    title: 'Skoohub',
    subtitle: 'IoT-Enabled School Ecosystem',
    category: 'Enterprise / IoT / Education',
    thumbnail: Assets.projectsSkoohub,
    shortDescription:
        'Mission-critical school ecosystem integrating BLE/NFC hardware for real-time student safety and offline-first architecture.',
    fullDescription: '''
Skoohub is an enterprise-grade School Management System engineered to bridge the physical and digital worlds of education. Unlike standard admin platforms, it integrates directly with custom IoT hardware to automate critical safety workflows.

Key Technical Achievements:
*   IoT & Hardware Integration: Developed a custom communication layer for BLE Beacons (automated classroom attendance) and NFC Tags (real-time bus passenger tracking), processing hardware signals directly on the mobile device.
*   Offline-First Architecture: Architected a robust synchronization engine using background_fetch and local storage. This ensures teachers can grade exams and take attendance without internet, with distinct data automatically syncing when connectivity is restored.
*   Complex State & Navigation: Utilized Flutter BLoC and Clean Architecture to manage dynamic user roles (Admin, Teacher, Parent, Student), creating four distinct app experiences from a single codebase.
*   Performance: Optimized Firestore reads/writes to reduce cloud infrastructure costs to near-zero while supporting multi-country scaling.
''',
    role: 'Lead Full-Stack Mobile Engineer',
    technologies: [
      'Flutter',
      'Dart',
      'Firebase (Firestore/Functions)',
      'BLE & NFC (Hardware)',
      'Google Maps SDK',
      'Offline-Sync / Background Fetch',
      'Flutter BLoC',
      'Clean Architecture',
      'Reactive Forms',
      'CI/CD & Testing',
    ],
    impact: [
      'Automated Hardware Tracking',
      '100% Offline Relaibility',
      'Real-time Student Safety',
      'Multi-Tenant Scalability',
      'Cost-Optimized Backend',
    ],
    links: {},
    status: 'In Production',
    year: '2026',
    platforms: ['iOS', 'Android', 'Web'],
    isFeatured: true,
  ),
  Project(
    id: 'hapster',
    title: 'Hapster',
    subtitle: 'Industrial Skills & Training Platform',
    category: 'Enterprise / Industrial',
    thumbnail: Assets.projectsHapster,
    shortDescription:
        'Large-scale industrial training system with custom offline-sync architecture deployed across facilities in France.',
    fullDescription: '''
Hapster is a comprehensive training management platform designed for industrial environments. It enables the creation, tracking, and validation of employee skills through a strict compliance workflow involving trainers, trainees, and supervisors.

The application is architected to function seamlessly in zero-connectivity zones. I engineered a robust offline-sync engine using Hive (NoSQL) and Workmanager that handles complex relational data synchronization and conflict resolution for thousands of skill records 'Deployed across facilities in France'.
''',
    role: 'Mid-Senior Flutter Developer',
    technologies: [
      'Flutter',
      'Hive/NoSQL',
      'Workmanager',
      'Custom Sync Engine',
      'Bloc/Cubit',
      'Reactive Forms'
    ],
    impact: [
      'Deployed across facilities in France'
          'Engineered offline-first sync engine',
      'Built custom Windows screen recorder',
      'Implemented digital signatures workflow',
    ],
    links: {'website': 'https://www.hapster.io'},
    status: 'In Production',
    year: '2023',
    platforms: ['iOS', 'Android', 'Windows'],
    isFeatured: true,
  ),
  Project(
    id: 'safara',
    title: 'Safara',
    subtitle: 'Quran Schools Management System',
    category: 'Education / Islamic',
    thumbnail: Assets.projectsSafara,
    shortDescription:
        'Islamic-themed school management app for Quran schools with beautiful UI, offline-first architecture, and comprehensive student tracking.',
    fullDescription: '''
Safara is a specialized school management system designed for Quran schools (Halaqa). It features a beautiful Islamic-themed UI with support for Arabic RTL layouts, student progress tracking for Quran memorization, and comprehensive classroom management.

The app uses clean architecture with Riverpod for state management and supports both light and dark themes with elegant Islamic design patterns.
''',
    role: 'Senior Mobile Engineer - Full Stack',
    technologies: [
      'Flutter',
      'Firebase',
      'Cloud fuctions',
      'Clean Architecture',
      'Hive',
      'OAuth2',
    ],
    impact: [
      'Beautiful Islamic UI',
      'Offline-first design',
      'Quran tracking system',
    ],
    links: {},
    status: 'In Development',
    year: '2024',
    platforms: ['iOS', 'Android', 'Web'],
    isFeatured: true,
  ),

  // === Other Projects ===
  Project(
    id: 'beacon_plugin',
    title: 'beacon_plugin',
    subtitle: 'Flutter Beacon Technology Package',
    category: 'Open Source / SDK',
    thumbnail: Assets.projectsPlaceholder,
    shortDescription:
        'Open-source Flutter plugin for beacon technology, enabling proximity-based features in mobile applications.',
    role: 'Creator & Maintainer',
    technologies: ['Flutter', 'Kotlin', 'Swift', 'Platform Channels'],
    impact: [
      'Published on pub.dev',
      'Used in Me-Mate',
      'Community package'
    ],
    links: {
      // 'pubdev': 'https://pub.dev/publishers/flutterbots.dev/packages',
      // 'github': 'https://github.com/flutter-bots/beacon_plugin',
    },
    status: 'Active Development',
    year: '2023',
    platforms: ['iOS', 'Android'],
  ),
  Project(
    id: 'getup',
    title: 'GetUp',
    subtitle: 'Educational Point of Sale',
    category: 'Education / E-commerce',
    thumbnail: Assets.projectsGetup,
    shortDescription:
        'Point of Sale application for educational platform serving high school students.',
    role: 'Flutter Developer',
    technologies: ['Flutter', 'Payment Integration', 'Firebase'],
    impact: [
      'POS system',
      'Educational platform',
      'Published to Play Store'
    ],
    links: {
      'playStore':
          'https://play.google.com/store/apps/details?id=com.elkood.get_up',
    },
    status: 'Published',
    year: '2021',
    platforms: ['Android'],
  ),
  Project(
    id: 'taknikat',
    title: 'Taknikat',
    subtitle: 'Art Sharing Social Platform',
    category: 'Social / Art',
    thumbnail: Assets.projectsTaknikat,
    shortDescription:
        'Social platform for artists in Saudi Arabia to share artwork and discover cultural events.',
    role: 'Flutter Developer',
    technologies: ['Flutter', 'Firebase', 'Image Processing'],
    impact: [
      'Social features',
      'Event management',
      'Saudi Arabia market'
    ],
    links: {
      'portfolio': 'https://www.mootawer.com/portfolio/taknikat'
    },
    status: 'Published',
    year: '2023',
    platforms: ['iOS', 'Android'],
  ),
  Project(
    id: 'mustawdaat',
    title: 'Mustawdaat',
    subtitle: 'Container Rental E-commerce',
    category: 'E-commerce / Logistics',
    thumbnail: Assets.projectsMustawdaat,
    shortDescription:
        'E-commerce platform with specialized container rental and warehouse management for Saudi Arabia.',
    role: 'Flutter Developer',
    technologies: [
      'Flutter',
      'Payment Gateway',
      'Inventory Management'
    ],
    impact: [
      'Container rental',
      'Warehouse management',
      'Multi-vendor'
    ],
    links: {
      'portfolio': 'https://www.mootawer.com/portfolio/mustawdaat'
    },
    status: 'Published',
    year: '2023',
    platforms: ['iOS', 'Android'],
  ),
  Project(
    id: 'baytna_express',
    title: 'Baytna Express',
    subtitle: 'Restaurant Management Ecosystem',
    category: 'Food & Beverage',
    thumbnail: Assets.projectsBaytnaExpress,
    shortDescription:
        'Multi-app restaurant ecosystem including customer ordering, kitchen management, and delivery coordination.',
    role: 'Flutter Developer',
    technologies: [
      'Flutter',
      'Real-time Updates',
      'Location Tracking'
    ],
    impact: [
      'Multi-app system',
      'Real-time tracking',
      'Order management'
    ],
    links: {
      'playStore':
          'https://play.google.com/store/apps/details?id=com.digitile.baytna_express',
    },
    status: 'Published',
    year: '2022',
    platforms: ['Android'],
  ),
  Project(
    id: 'foodland',
    title: 'Foodland',
    subtitle: 'Restaurant Ordering & Delivery',
    category: 'Food & Beverage',
    thumbnail: Assets.projectsFoodland,
    shortDescription:
        'Comprehensive restaurant ordering and delivery app for Foodland Najaf chain, featuring menu browsing, easy ordering, real-time tracking, and exclusive deals.',
    fullDescription: '''
Foodland is a full-featured restaurant ordering and delivery application developed for the Foodland restaurant chain in Najaf. Built as a freelance project with Jacksi Ltd, the app provides a seamless dining experience for customers.

Key Features:
• Comprehensive Menu: Browse the complete restaurant menu including dishes, beverages, and sides
• Easy Ordering: Place orders with just a few taps, with customization options
• Order Tracking: Real-time order status and delivery time updates
• Ratings & Reviews: Share feedback about food and dining experience
• Exclusive Offers: Access special promotions and discounts
''',
    role: 'Flutter Developer (Freelance)',
    technologies: [
      'Flutter',
      'REST APIs',
      'Firebase',
      'Payment Integration',
      'Real-time Updates',
    ],
    impact: [
      'Published on App Store',
      'Restaurant chain app',
      'Order tracking system',
    ],
    links: {
      'appStore':
          'https://apps.apple.com/il/app/foodland-najaf/id6477353753',
      'website': 'https://jacksi.co.uk/project/Food-Land',
    },
    status: 'Published',
    year: '2024',
    platforms: ['iOS'],
  ),
  Project(
    id: 'memate',
    title: 'Me-Mate',
    subtitle: 'Proximity-Based Social Networking',
    category: 'Social / Networking',
    thumbnail: Assets.projectsMemate,
    shortDescription:
        'Social networking app using beacon technology for proximity-based professional networking.',
    role: 'Flutter Developer',
    technologies: [
      'Flutter',
      'Beacon Technology',
      'Google Nearby API',
      'Firebase',
    ],
    impact: [
      '5K+ downloads',
      'Custom beacon plugin',
      'Proximity networking'
    ],
    links: {
      'playStore':
          'https://play.google.com/store/apps/details?id=com.elkood.memate',
    },
    status: 'Published',
    year: '2022',
    platforms: ['Android'],
  ),
];

// === Services ===
class ServiceItem {
  final String icon;
  final String title;
  final String description;
  final List<String> features;

  const ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
  });
}

const List<ServiceItem> services = [
  ServiceItem(
    icon: '📱',
    title: 'Mobile App Development',
    description: 'End-to-end Flutter development for iOS and Android',
    features: [
      'Clean Architecture',
      'Offline-First Apps',
      'IoT Integration',
      'Real-time Features',
    ],
  ),
  ServiceItem(
    icon: '🏗️',
    title: 'Architecture Consulting',
    description: 'Design scalable, maintainable app architectures',
    features: [
      'Code Review',
      'Performance Optimization',
      'Technical Strategy',
      'Best Practices',
    ],
  ),
  ServiceItem(
    icon: '👨‍🏫',
    title: 'Training & Mentorship',
    description: 'Level up your team\'s Flutter skills',
    features: [
      'Junior to Mid-level Roadmap',
      '1-on-1 Mentoring',
      'Team Workshops',
      'Code Reviews',
    ],
  ),
];

// === Mentorship ===
class MentorshipInfo {
  static const String title = 'Flutter Junior Roadmap';
  static const String description =
      'A comprehensive roadmap I created for Flutter juniors based on my mentoring experience. Helping developers level up from junior to mid-level.';
  static const String coverImage = Assets.roadmapRoadmapCover;
  static const String roadmapLink =
      'https://www.notion.so/Junior-Flutter-Roadmap-525f78ba7fdf4f6b85f97c09e71e0519?source=copy_link'; // Add your link here
  static const int studentsMentored = 5;
  static const int successStories = 3;
}

// === Education ===
class Education {
  static const String degree = 'Bachelor of Information Engineering';
  static const String institution = 'Aleppo University';
  static const String location = 'Aleppo, Syria';
  static const String period = '2018 - 2023';
  static const String gpa = '3.4';
  static const String rank = 'Top 10 in graduating class (8th place)';

  static const List<String> achievements = [
    'Graduated 8th in class of 100+ students',
    'GPA: 3.4/4.0',
    'Final year project: Free Land Platform (98% score - highest in year)',
    'Active member of BlueBits technical team',
  ];
}

// === Call to Action ===
class CallToAction {
  static const String headline =
      "Let's Build Something Amazing Together";
  static const String subheadline =
      "I'm currently open to remote opportunities where I can contribute my expertise in Flutter development, system architecture, and team leadership.";
  static const String availability =
      'Available for full-time remote positions';

  static const List<String> preferredRoles = [
    'Senior Flutter Engineer',
    'Lead Mobile Engineer',
    'Flutter Architect',
    'Mobile Team Lead',
  ];
}