import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/source/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/source/auth/auth_firebase_service_impl.dart';
import 'package:spotify_clone/domain/repository/auth/auth_repository.dart';
import 'package:spotify_clone/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/signup_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );


  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SignUpUsecase>(
    SignUpUsecase()
  );

  sl.registerSingleton<SignInUsecase>(
    SignInUsecase()
  );  

}