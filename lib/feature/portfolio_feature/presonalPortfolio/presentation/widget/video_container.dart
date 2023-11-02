import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/widget/dialogBox/video_player_pop.dart';
import 'package:flutter/material.dart';

class CustomVideoContainer extends StatelessWidget {
  const CustomVideoContainer({
    super.key,
    required this.videoUrl,
    required this.thumbnail,
  });
  final String videoUrl;
  final String thumbnail;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showVideoPop(videoUrl: videoUrl, thumbnail: thumbnail);
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(
                thumbnail,
              ),
              fit: BoxFit.cover),
        ),
        child: Image.asset(AppIcons.play, scale: 2.5),
      ),
    );
  }
}
