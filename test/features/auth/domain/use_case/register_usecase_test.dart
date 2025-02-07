import 'package:bus_ticket_app/core/error/failure.dart';
import 'package:bus_ticket_app/features/auth/domain/entity/auth_entity.dart';
import 'package:bus_ticket_app/features/auth/domain/repository/auth_repository.dart';
import 'package:bus_ticket_app/features/auth/domain/use_case/register_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock the IAuthRepoitory
class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late RegisterUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = RegisterUseCase(mockRepository);
    registerFallbackValue(const AuthEntity(
      fName: '',
      lName: '',
      phone: '',
      email: '',
      password: '',
      image: '',
    ));
  });

  // Test case for successful signup
  test('should call registurCustomer with correct AuthEntity and return void',
      () async {
    // Arrange
    const params = RegisterUserParams(
      fname: 'saurav',
      lname: 'joshi',
      phone: '9845297004',
      email: 'saurav@gmail.com',
      password: '12345',
      image: 'profile.jpg',
    );

    const authEntity = AuthEntity(
      fName: 'saurav',
      lName: 'joshi',
      phone: '9845297004',
      email: 'saurav@gmail.com',
      password: '12345',
      image: 'profile.jpg',
    );

    when(() => mockRepository.registerCustomer(authEntity))
        .thenAnswer((_) async => const Right(null));

    final result = await useCase(params);

    expect(result, const Right(null));
    verify(() => mockRepository.registerCustomer(authEntity)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  //Failure when singup user fails
  test('should return a Failure when signupUser fails', () async {
    const params = RegisterUserParams(
      fname: 'saurav',
      lname: 'joshi',
      phone: '9845297004',
      email: 'saurav@gmail.com',
      password: '12345',
      image: 'profile.jpg',
    );

    const authEntity = AuthEntity(
      fName: 'saurav',
      lName: 'joshi',
      phone: '9845297004',
      email: 'saurav@gmail.com',
      password: '12345',
      image: 'profile.jpg',
    );

    const failure = ApiFailure(message: 'Signup failed');

    when(() => mockRepository.registerCustomer(authEntity))
        .thenAnswer((_) async => const Left(failure));

    final result = await useCase(params);

    expect(result, const Left(failure));
    verify(() => mockRepository.registerCustomer(authEntity)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  tearDown(() {
    reset(mockRepository);
  });

//failuree when email is already in use
  test('should return a Failure when email is already in use', () async {
    const params = RegisterUserParams(
      fname: 'saurav',
      lname: 'joshi',
      phone: '9840922949',
      email: 'saurav@gmail.com',
      password: '12345',
      image: 'profile.jpg',
    );

    const failure = ApiFailure(message: 'Email is already in use');

    when(() => mockRepository.registerCustomer(any(that: isA<AuthEntity>())))
        .thenAnswer((_) async => const Left(failure));

    final result = await useCase(params);

    expect(result, const Left(failure));
    verify(() => mockRepository.registerCustomer(any(
        that: isA<AuthEntity>()
            .having((e) => e.email, 'email', 'saurav@gmail.com')))).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  tearDown(() {
    reset(mockRepository);
  });
//failure when email formate is invalid
  test('should return a Failure when email format is invalid', () async {
    const params = RegisterUserParams(
      fname: 'saurav',
      lname: 'joshi',
      phone: '9845297004',
      email: 'invalid-email',
      password: '12345',
      image: 'profile.jpg',
    );

    const failure = ApiFailure(message: 'Invalid email format');

    when(() => mockRepository.registerCustomer(any(that: isA<AuthEntity>())))
        .thenAnswer((_) async => const Left(failure));

    final result = await useCase(params);

    expect(result, const Left(failure));
    verify(() => mockRepository.registerCustomer(any(
        that: isA<AuthEntity>()
            .having((e) => e.email, 'email', 'invalid-email')))).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  tearDown(() {
    reset(mockRepository);
  });
}

