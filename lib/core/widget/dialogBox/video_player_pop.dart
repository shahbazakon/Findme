import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/app_loader.dart';
import 'package:flutter/material.dart';

showVideoPop({required String videoUrl, required String thumbnail}) {
  showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) {
      return VideoPlayerWidget(
        videoUrl: videoUrl,
        thumbnail: thumbnail,
      );
    },
  );
}

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {super.key, required this.videoUrl, required this.thumbnail});

  final String videoUrl;
  final String thumbnail;
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerSettings _customVideoPlayerSettings;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    )..initialize().then((value) => setState(() {}));

    _customVideoPlayerSettings = CustomVideoPlayerSettings(
        showSeekButtons: true,
        showPlayButton: true,
        thumbnailWidget: Image.network(
          widget.thumbnail,
          width: width,
          fit: BoxFit.cover,
        ));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  _customVideoPlayerController.dispose();
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.close,
                    color: AppColors.light,
                    size: 28,
                  ),
                ),
              ),
            )),
        Material(
          color: Colors.transparent,
          child: _videoPlayerController.value.isInitialized
              ? Container(
                  height: height * .3,
                  width: width,
                  decoration: appBoxDecoration,
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomVideoPlayer(
                      customVideoPlayerController: _customVideoPlayerController,
                    ),
                  ),
                )
              : const AppLoader(),
        ),
        Material(
            child: SizedBox(
          height: height * .05,
        ))
      ],
    );
  }
}
