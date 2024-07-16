import 'package:dartz/dartz.dart';
import 'package:spotify_clone/domain/entities/auth/user_entity.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(UserEntity user);

  Future<Either> signup(UserEntity user);
}