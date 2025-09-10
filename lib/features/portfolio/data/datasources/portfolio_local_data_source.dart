import '../models/portfolio_models.dart';

abstract class PortfolioLocalDataSource {
  Future<PersonalInfoModel> getPersonalInfo();
  Future<List<SkillModel>> getSkills();
  Future<List<ExperienceModel>> getExperience();
  Future<List<ProjectModel>> getProjects();
  Future<List<AwardModel>> getAwards();
}

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<PersonalInfoModel> getPersonalInfo() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    return const PersonalInfoModel(
      name: 'Pushparaj Manickam',
      title: 'Flutter Developer',
      description:
          'Passionate Flutter developer with 4+ years of experience building production-ready mobile applications. Specialized in fintech, e-commerce, and real-time solutions.',
      email: 'pushparaj2709@gmail.com',
      phone: '+91 88836 43437',
      location: 'Tamil Nadu, India',
      profileImageUrl:
          'https://drive.google.com/uc?export=view&id=1XnKgS5tU_WBfpVC2mWfgpCfVR6DMkpL8',
      socialLinks: {
        'github': 'https://github.com/pushparajmanickam',
        'linkedin': 'https://www.linkedin.com/in/pushparajmanickam/',
        'leetcode': 'https://leetcode.com/u/Pushparaj_27/',
        'hackerrank': 'https://www.hackerrank.com/profile/pushparaj2709',
      },
    );
  }

  @override
  Future<List<SkillModel>> getSkills() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return const [
      // Languages
      SkillModel(name: 'Dart', category: 'Languages', proficiency: 5),
      SkillModel(name: 'Kotlin', category: 'Languages', proficiency: 4),
      SkillModel(name: 'Swift', category: 'Languages', proficiency: 4),

      // Frameworks & Platforms
      SkillModel(
        name: 'Flutter',
        category: 'Frameworks & Platforms',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Android SDK',
        category: 'Frameworks & Platforms',
        proficiency: 4,
      ),
      SkillModel(
        name: 'iOS SDK',
        category: 'Frameworks & Platforms',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Cross-Platform Mobile Development',
        category: 'Frameworks & Platforms',
        proficiency: 5,
      ),

      // State Management & Architecture
      SkillModel(
        name: 'BLoC',
        category: 'State Management & Architecture',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Provider',
        category: 'State Management & Architecture',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Riverpod',
        category: 'State Management & Architecture',
        proficiency: 4,
      ),
      SkillModel(
        name: 'GetX',
        category: 'State Management & Architecture',
        proficiency: 4,
      ),
      SkillModel(
        name: 'MVVM',
        category: 'State Management & Architecture',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Clean Architecture',
        category: 'State Management & Architecture',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Repository Pattern',
        category: 'State Management & Architecture',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Dependency Injection',
        category: 'State Management & Architecture',
        proficiency: 4,
      ),
      SkillModel(
        name: 'SOLID Principles',
        category: 'State Management & Architecture',
        proficiency: 5,
      ),

      // UI/UX & Tools
      SkillModel(
        name: 'Material Design',
        category: 'UI/UX & Tools',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Cupertino Widgets',
        category: 'UI/UX & Tools',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Responsive Design',
        category: 'UI/UX & Tools',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Custom Animations',
        category: 'UI/UX & Tools',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Google Maps',
        category: 'UI/UX & Tools',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Android Studio',
        category: 'UI/UX & Tools',
        proficiency: 5,
      ),
      SkillModel(name: 'VS Code', category: 'UI/UX & Tools', proficiency: 5),
      SkillModel(name: 'Xcode', category: 'UI/UX & Tools', proficiency: 4),

      // APIs & Networking
      SkillModel(
        name: 'REST API',
        category: 'APIs & Networking',
        proficiency: 5,
      ),
      SkillModel(
        name: 'GraphQL',
        category: 'APIs & Networking',
        proficiency: 3,
      ),
      SkillModel(
        name: 'Firebase APIs',
        category: 'APIs & Networking',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Third-Party SDKs Integration',
        category: 'APIs & Networking',
        proficiency: 4,
      ),

      // Cloud & Services
      SkillModel(
        name: 'Firebase Authentication',
        category: 'Cloud & Services',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Firestore',
        category: 'Cloud & Services',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Realtime Database',
        category: 'Cloud & Services',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Crashlytics',
        category: 'Cloud & Services',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Performance Monitoring',
        category: 'Cloud & Services',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Cloud Functions',
        category: 'Cloud & Services',
        proficiency: 3,
      ),
      SkillModel(
        name: 'Google Cloud',
        category: 'Cloud & Services',
        proficiency: 3,
      ),

      // Databases
      SkillModel(name: 'SQLite', category: 'Databases', proficiency: 4),
      SkillModel(name: 'Hive', category: 'Databases', proficiency: 4),
      SkillModel(
        name: 'SharedPreferences',
        category: 'Databases',
        proficiency: 5,
      ),

      // Testing
      SkillModel(name: 'Unit Testing', category: 'Testing', proficiency: 4),
      SkillModel(name: 'Widget Testing', category: 'Testing', proficiency: 4),
      SkillModel(
        name: 'Integration Testing',
        category: 'Testing',
        proficiency: 4,
      ),
      SkillModel(name: 'Mockito', category: 'Testing', proficiency: 4),

      // CI/CD & Deployment
      SkillModel(name: 'Git', category: 'CI/CD & Deployment', proficiency: 5),
      SkillModel(
        name: 'GitHub Actions',
        category: 'CI/CD & Deployment',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Jenkins',
        category: 'CI/CD & Deployment',
        proficiency: 3,
      ),
      SkillModel(
        name: 'Play Store Deployment',
        category: 'CI/CD & Deployment',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Continuous Integration',
        category: 'CI/CD & Deployment',
        proficiency: 4,
      ),

      // Agile Practices
      SkillModel(
        name: 'Agile Scrum Methodology',
        category: 'Agile Practices',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Sprint Planning',
        category: 'Agile Practices',
        proficiency: 4,
      ),
      SkillModel(
        name: 'Daily Stand-ups',
        category: 'Agile Practices',
        proficiency: 5,
      ),
      SkillModel(
        name: 'Reviews & Retrospectives',
        category: 'Agile Practices',
        proficiency: 4,
      ),

      // Other Skills
      SkillModel(
        name: 'Troubleshooting',
        category: 'Other Skills',
        proficiency: 5,
      ),
      SkillModel(name: 'Debugging', category: 'Other Skills', proficiency: 5),
      SkillModel(
        name: 'Reliability Engineering',
        category: 'Other Skills',
        proficiency: 4,
      ),
      SkillModel(name: 'Mentoring', category: 'Other Skills', proficiency: 4),
      SkillModel(
        name: 'Developer-Friendly Collaboration',
        category: 'Other Skills',
        proficiency: 5,
      ),
    ];
  }

  @override
  Future<List<ExperienceModel>> getExperience() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return const [
      ExperienceModel(
        company: 'Aditya Birla Capital',
        position: 'Flutter Developer',
        duration: 'Jan 2023 - Present',
        responsibilities: [
          'Developed and maintained mobile applications using Flutter framework',
          'Collaborated with cross-functional teams to deliver high-quality products',
          'Implemented clean architecture and best practices',
          'Integrated REST APIs and managed state using Provider/Bloc',
        ],
        isCurrent: true,
      ),
      ExperienceModel(
        company: 'Shriram Automall',
        position: 'Junior Flutter Developer',
        duration: 'Jun 2022 - Dec 2022',
        responsibilities: [
          'Built responsive mobile applications with Flutter',
          'Worked on UI/UX improvements and performance optimization',
          'Participated in code reviews and team meetings',
          'Learned and applied mobile development best practices',
        ],
        isCurrent: false,
      ),
    ];
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    await Future.delayed(const Duration(milliseconds: 350));

    return const [
      ProjectModel(
        name: 'Push portfolio',
        description:
            '👨‍💻 I’m a Flutter Developer with 4+ years of experience building mobile apps.\n'
            '⚡ Skilled in Flutter, Dart, Firebase, and creating clean, scalable UIs.\n'
            '🌐 Check out my portfolio and connect with me on LinkedIn and GitHub.\n'
            '✉️ Have a project or idea? Reach out via the contact form to collaborate.',

        technologies: ['Flutter', 'Dart', 'Mobile Development', 'Android'],
        githubUrl: null,
        liveUrl:
            'https://play.google.com/store/apps/details?id=com.coderpush.push_potfolio&hl=en_IN',
        imageUrl: 'assets/images/app_logo.png',
      ),
    ];
  }

  @override
  Future<List<AwardModel>> getAwards() async {
    await Future.delayed(const Duration(milliseconds: 200));

    return const [
      AwardModel(
        title: 'Star Performer of the Quarter 2016– 2020',
        organization: 'Neurealm (Formerly GS Lab | GAVS)',
        date: 'Q2 2024',
        description:
            'Recognized for delivering UPI AutoPay and BBPS integrations, improving app performance and customer experience.',
      ),
      AwardModel(
        title: 'ABCD EDGE Award',
        organization: 'Aditya Birla Capital Digital',
        date: 'Sep 2024',
        description:
            'Honored for fintech innovations including UPI-Lite Auto-Topup and Delegate Payments, enabling secure and seamless digital transactions.',
      ),
    ];
  }
}
