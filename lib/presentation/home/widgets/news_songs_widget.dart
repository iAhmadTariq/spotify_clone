import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/presentation/home/bloc/news_song_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/news_song_state.dart';

import '../../../domain/entities/song/song_entity.dart';
import '../../song_player/pages/song_player_page.dart';

class NewsSongsWidget extends StatelessWidget {
  const NewsSongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BlocProvider(
        create: (context) => NewsSongCubit()..getNewsSongs(),
        child: BlocBuilder<NewsSongCubit, NewsSongState>(
            builder: (context, songState) {
          if (songState is NewsSongLoading) {
            return Container(
              alignment: Alignment.center,
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.primaryColor,
                size: 50,
              ),
            );
          }
          if (songState is NewsSongLoaded) {
            final songs = songState.songs;
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                SongEntity song = songs[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SongPlayerPage(song: song,songsList:songs),
                            ),
                          );
                        },
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(song.coverUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 30,
                              width: 30,
                              transform: Matrix4.translationValues(5, 8, 0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.isDarkMode
                                    ? AppColors.lightBackgroundColor
                                        .withOpacity(0.8)
                                    : AppColors.darkBackgroundColor
                                        .withOpacity(0.8),
                              ),
                              child: Icon(
                                Icons.play_arrow_rounded,
                                color: !context.isDarkMode
                                    ? AppColors.lightBackgroundColor
                                    : AppColors.darkBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      song.title!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      song.artist!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
