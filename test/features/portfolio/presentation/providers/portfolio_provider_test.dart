import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pushparaj_portfolio/core/error/failures.dart';
import 'package:pushparaj_portfolio/core/usecases/usecase.dart';
import 'package:pushparaj_portfolio/features/portfolio/domain/entities/personal_info.dart';
import 'package:pushparaj_portfolio/features/portfolio/domain/entities/skill.dart';
import 'package:pushparaj_portfolio/features/portfolio/domain/usecases/get_personal_info.dart';
import 'package:pushparaj_portfolio/features/portfolio/domain/usecases/get_skills.dart';
import 'package:pushparaj_portfolio/features/portfolio/domain/usecases/get_experience.dart';
import 'package:pushparaj_portfolio/features/portfolio/domain/usecases/get_projects.dart';
import 'package:pushparaj_portfolio/features/portfolio/presentation/providers/portfolio_provider.dart';

import 'portfolio_provider_test.mocks.dart';

@GenerateMocks([
  GetPersonalInfo,
  GetSkills,
  GetExperience,
  GetProjects,
])
void main() {
  late PortfolioProvider provider;
  late MockGetPersonalInfo mockGetPersonalInfo;
  late MockGetSkills mockGetSkills;
  late MockGetExperience mockGetExperience;
  late MockGetProjects mockGetProjects;

  setUp(() {
    mockGetPersonalInfo = MockGetPersonalInfo();
    mockGetSkills = MockGetSkills();
    mockGetExperience = MockGetExperience();
    mockGetProjects = MockGetProjects();
    
    provider = PortfolioProvider(
      getPersonalInfo: mockGetPersonalInfo,
      getSkills: mockGetSkills,
      getExperience: mockGetExperience,
      getProjects: mockGetProjects,
    );
  });

  const tPersonalInfo = PersonalInfo(
    name: 'Pushparaj Manickam',
    title: 'Flutter Developer',
    description: 'Passionate Flutter developer',
    email: 'pushparaj2709@gmail.com',
    phone: '+91 9876543210',
    location: 'Tamil Nadu, India',
    profileImageUrl: 'https://example.com/profile.jpg',
    socialLinks: {},
  );

  const tSkills = [
    Skill(
      name: 'Flutter',
      category: 'Framework',
      proficiency: 90,
      icon: 'flutter',
    ),
  ];

  group('PortfolioProvider', () {
    test('initial state should be correct', () {
      expect(provider.isLoading, false);
      expect(provider.errorMessage, null);
      expect(provider.personalInfo, null);
      expect(provider.skills, isEmpty);
    });

    test('should load personal info successfully', () async {
      // arrange
      when(mockGetPersonalInfo(any))
          .thenAnswer((_) async => const Right(tPersonalInfo));
      when(mockGetSkills(any))
          .thenAnswer((_) async => const Right(tSkills));
      when(mockGetExperience(any))
          .thenAnswer((_) async => const Right([]));
      when(mockGetProjects(any))
          .thenAnswer((_) async => const Right([]));

      // act
      await provider.loadPortfolioData();

      // assert
      expect(provider.isLoading, false);
      expect(provider.errorMessage, null);
      expect(provider.personalInfo, tPersonalInfo);
      verify(mockGetPersonalInfo(NoParams()));
    });

    test('should handle failure when loading data', () async {
      // arrange
      const tFailure = ServerFailure('Server error');
      when(mockGetPersonalInfo(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      await provider.loadPortfolioData();

      // assert
      expect(provider.isLoading, false);
      expect(provider.errorMessage, 'Server error');
      expect(provider.personalInfo, null);
    });

    test('should group skills by category correctly', () async {
      // arrange
      const testSkills = [
        Skill(name: 'Flutter', category: 'Framework', proficiency: 90, icon: 'flutter'),
        Skill(name: 'Dart', category: 'Language', proficiency: 85, icon: 'dart'),
        Skill(name: 'Firebase', category: 'Framework', proficiency: 80, icon: 'firebase'),
      ];
      
      when(mockGetPersonalInfo(any))
          .thenAnswer((_) async => const Right(tPersonalInfo));
      when(mockGetSkills(any))
          .thenAnswer((_) async => const Right(testSkills));
      when(mockGetExperience(any))
          .thenAnswer((_) async => const Right([]));
      when(mockGetProjects(any))
          .thenAnswer((_) async => const Right([]));

      // act
      await provider.loadPortfolioData();
      final groupedSkills = provider.getSkillsByCategory();

      // assert
      expect(groupedSkills.keys, contains('Framework'));
      expect(groupedSkills.keys, contains('Language'));
      expect(groupedSkills['Framework']?.length, 2);
      expect(groupedSkills['Language']?.length, 1);
    });
  });
}