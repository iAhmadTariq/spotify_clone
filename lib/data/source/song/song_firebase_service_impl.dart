import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/configs/const/firebase_const.dart';
import 'package:spotify_clone/data/models/songs/song_model.dart';
import 'package:spotify_clone/data/source/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/entities/song/song_entity.dart';

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      final songCollection = await FirebaseFirestore.instance
          .collection(FirebaseConst.songs)
          .orderBy("releaseDate", descending: true).get();
      List<SongEntity> songsList = [];

      for(var snap in songCollection.docs){
        SongEntity song = SongModel.fromSnapshot(snap);
        songsList.add(song);
      }
      
      return Right(songsList);
    } catch (e) {
      return const Left('An Error occured, Please try again');
    }
  }
}
