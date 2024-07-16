import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/presentation/home/widgets/home_tabs_widget.dart';

import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../widgets/home_artist_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarWidget(
        showBackButton: false,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body:const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            HomeArtistWidget(
            ),
            HomeTabsWidget(),
          ],
        ),
      ),
    );
  }
}