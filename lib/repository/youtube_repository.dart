import 'package:youtube_premium/const/api.dart';
import 'package:dio/dio.dart';
import 'package:youtube_premium/model/video_model.dart';

class YoutubeRepository {
  static Future<List<VideoModel>> getVideos() async {
    final resp = await Dio().get(
      YOUTUBE_API_BASE_URL,
      queryParameters: {
        'channelId': CF_CHANNEL_ID,
        'maxResults': 50,
        'key': API_KEY,
        'part': 'snippet',
        'order': 'date',
      },
    );

    final listWithData = resp.data['items'].where(
      (item) =>
          item?["id"]?["videoId"] != null && item?["snippet"]?["title"] != null,
    );

    return listWithData
        .map<VideoModel>(
            (item) => VideoModel(
                  id: item["id"]["videoId"],
                  title: item["snippet"]["title"],
                ),
            print(resp.data))
        .toList();
  }
}
