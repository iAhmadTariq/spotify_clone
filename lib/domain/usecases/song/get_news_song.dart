import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repository/song/song_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class GetNewsSongUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async{
    return await sl<SongRepository>().getNewsSongs();
  }
}
