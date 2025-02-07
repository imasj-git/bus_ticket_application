import 'package:bus_ticket_app/app/shared_prefs/token_shared_prefs.dart';
import 'package:bus_ticket_app/app/usecase/usecase.dart';
import 'package:bus_ticket_app/core/error/failure.dart';
import 'package:bus_ticket_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  // Initial Constructor
  const LoginParams.initial()
      : email = '',
        password = '';

  @override
  List<Object> get props => [email, password];
}

class LoginUseCase implements UseCaseWithParams<String, LoginParams> {
  final IAuthRepository repository;
  final TokenSharedPrefs tokenSharedPrefs;

  LoginUseCase(this.repository, this.tokenSharedPrefs);

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    // Save token in Shared Preferences
    return repository
        .loginCustomer(params.email, params.password)
        .then((value) {
      return value.fold(
        (failure) => Left(failure),
        (token) {
          tokenSharedPrefs.saveToken(token);
          // tokenSharedPrefs.getToken().then((value) {
          //   print(value);
          // });
          return Right(token);
        },
      );
    });
  }
}