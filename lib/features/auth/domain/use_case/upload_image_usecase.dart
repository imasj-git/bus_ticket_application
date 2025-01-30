import 'dart:io';

import 'package:bus_ticket_app/app/usecase/usecase.dart';
import 'package:bus_ticket_app/core/error/failure.dart';
import 'package:bus_ticket_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';



class UploadImageParams {
  final File file;

  const UploadImageParams({
    required this.file,
  });
}

class UploadImageUsecase
    implements UseCaseWithParams<String, UploadImageParams> {
  final IAuthRepository _repository;

  UploadImageUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    return _repository.uploadProfilePicture(params.file);
  }
}