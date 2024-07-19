import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/home/bloc/news_song_cubit.dart';

class HomePlaylistWidget extends StatelessWidget {
  const HomePlaylistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsSongCubit()..getNewsSongs(),
      child: Container(),
    );
  }
}