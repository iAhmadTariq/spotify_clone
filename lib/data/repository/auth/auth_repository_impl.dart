import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/source/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/entities/auth/user_entity.dart';
import 'package:spotify_clone/domain/repository/auth/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(UserEntity user) async {
    return await sl<AuthFirebaseService>().signIn(user);
  }

  @override
  Future<Either> signUp(UserEntity user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }
}
