import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/source/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/song/song_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class SongRepositoryImpl extends SongRepository{
  @override
  Future<Either> getNewsSongs() {
    return sl<SongFirebaseService>().getNewsSongs();
  }
  
}