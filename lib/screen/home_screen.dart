import 'package:flutter/material.dart';
import 'package:youtube_premium/component/custom_youtube_player.dart';
import 'package:youtube_premium/model/video_model.dart';
import 'package:youtube_premium/repository/youtube_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "내가 듣고 싶어서 만든 외힙 플리",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: snapshot.data!
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomYoutubePlayer(videoModel: e), // 동영상 플레이어
                            const SizedBox(height: 8), // 간격 추가
                            Text(
                              e.title, // 영상 제목 추가
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black, // 제목 색상
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
