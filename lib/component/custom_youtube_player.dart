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
    controller = YoutubePlayerController(
      initialVideoId: widget.videoModel.id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
