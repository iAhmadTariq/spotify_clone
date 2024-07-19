import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SongEntity extends Equatable{
  final String? title;
  final String? artist;
  final num? duration;
  final Timestamp? releaseDate;
  final String? coverUrl;
  final String? songUrl;

  const SongEntity({this.coverUrl, this.songUrl, this.title, this.artist, this.duration, this.releaseDate});

  @override
  List<Object?> get props => [
    title,
    artist,
    duration,
    releaseDate,
    coverUrl,
    songUrl
  ];
  
}