import 'package:flutter/material.dart';
import 'package:youtube_premium/component/custom_youtube_player.dart';
import 'package:youtube_premium/model/video_model.dart';
import 'package:youtube_premium/repository/youtube_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("코팩토리"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<VideoModel>>(
          future: YoutubeRepository.getVideos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              physics: BouncingScrollPhysics(),
              children: snapshot.data!
                  .map((e) => CustomYoutubePlayer(videoModel: e))
                  .toList(),
            );
          }),
    );
  }
}
