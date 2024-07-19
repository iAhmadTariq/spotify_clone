import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/entities/auth/user_entity.dart';
import 'package:spotify_clone/domain/repository/auth/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class SignInUsecase implements Usecase<Either, UserEntity> {
  @override
  Future<Either> call({UserEntity? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
