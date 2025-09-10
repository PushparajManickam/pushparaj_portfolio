import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pushparaj_portfolio/core/error/failures.dart';
import 'package:pushparaj_portfolio/core/usecases/usecase.dart';
import 'package:pushparaj_portfolio/features/portfolio/domain/entities/personal_info.dart';
import 'package:pushparaj_portfolio/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:pushparaj_portfolio/features/portfolio/domain/usecases/get_personal_info.dart';

import 'get_personal_info_test.mocks.dart';

@GenerateMocks([PortfolioRepository])
void main() {
  late GetPersonalInfo usecase;
  late MockPortfolioRepository mockRepository;

  setUp(() {
    mockRepository = MockPortfolioRepository();
    usecase = GetPersonalInfo(mockRepository);
  });

  const tPersonalInfo = PersonalInfo(
    name: 'Pushparaj Manickam',
    title: 'Flutter Developer',
    description: 'Passionate Flutter developer with 4+ years of experience',
    email: 'pushparaj2709@gmail.com',
    phone: '+91 9876543210',
    location: 'Tamil Nadu, India',
    profileImageUrl: 'https://example.com/profile.jpg',
    socialLinks: {
      'github': 'https://github.com/pushparajmanickam',
      'linkedin': 'https://www.linkedin.com/in/pushparajmanickam/',
    },
  );

  test('should get personal info from the repository', () async {
    // arrange
    when(mockRepository.getPersonalInfo())
        .thenAnswer((_) async => const Right(tPersonalInfo));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, const Right(tPersonalInfo));
    verify(mockRepository.getPersonalInfo());
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when repository fails', () async {
    // arrange
    const tFailure = ServerFailure('Server error');
    when(mockRepository.getPersonalInfo())
        .thenAnswer((_) async => const Left(tFailure));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, const Left(tFailure));
    verify(mockRepository.getPersonalInfo());
    verifyNoMoreInteractions(mockRepository);
  });
}