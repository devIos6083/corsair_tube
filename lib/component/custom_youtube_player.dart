import 'package:flutter/material.dart';
import 'package:youtube_premium/model/video_model.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final VideoModel videoModel;

  const CustomYoutubePlayer({
    required this.videoModel,
    super.key,
  });

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
      initialVideoId: widget.videoModel.id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        YoutubePlayer(
          controller: controller!,
          showVideoProgressIndicator: true,
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
