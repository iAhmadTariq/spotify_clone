import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/source/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/source/auth/auth_firebase_service_impl.dart';
import 'package:spotify_clone/domain/repository/auth/auth_repository.dart';
import 'package:spotify_clone/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify_clone/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/get_news_song.dart';

import 'data/repository/song/song_repository_impl.dart';
import 'data/source/song/song_firebase_service.dart';
import 'data/source/song/song_firebase_service_impl.dart';
import 'domain/repository/song/song_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl()
  );

  sl.registerSingleton<SongRepository>(
    SongRepositoryImpl()
  );


  //Usecases
  sl.registerSingleton<SignUpUsecase>(
    SignUpUsecase()
  );

  sl.registerSingleton<SignInUsecase>(
    SignInUsecase()
  );  

  sl.registerSingleton<GetNewsSongUsecase>(
    GetNewsSongUsecase()
  ); 

}