import 'package:youtube_premium/const/api.dart';
import 'package:dio/dio.dart';
import 'package:youtube_premium/model/video_model.dart';

class YoutubeRepository {
  static Future<List<VideoModel>> getVideos() async {
    try {
      print('Using Channel ID: $CF_CHANNEL_ID');
      print('API Key length: ${API_KEY.length}');

      final resp = await Dio().get(
        YOUTUBE_API_BASE_URL,
        queryParameters: {
          'channelId': CF_CHANNEL_ID,
          'maxResults': 50,
          'key': API_KEY,
          'part': 'snippet',
          'order': 'date',
          'type': 'video', // 비디오 타입만 검색하도록 지정
        },
      );

      print('API Response: ${resp.data}'); // 디버깅용 로그

      // 응답 데이터 체크
      if (resp.data['items'] == null || resp.data['items'].isEmpty) {
        print('No videos found. Please check channelId and API key.');

        return [
          VideoModel(
            id: 'hudZyBCA8dc',
            title: '우울할 때',
          ),
          VideoModel(
            id: 'X3P5czZBMlE',
            title: '비가 올 때',
          ),
          VideoModel(
            id: 'AVPBxB6W6w4',
            title: '기쁠 때',
          ),
          VideoModel(
            id: 'IrBh4WGQo5Y',
            title: '와인 한잔 마실 때',
          ),
        ];
      }

      final listWithData = resp.data['items'].where(
        (item) =>
            item?["id"]?["videoId"] != null &&
            item?["snippet"]?["title"] != null,
      );

      return listWithData
          .map<VideoModel>((item) => VideoModel(
                id: item["id"]["videoId"],
                title: item["snippet"]["title"],
              ))
          .toList();
    } catch (e) {
      print('Error details: $e');
      rethrow;
    }
  }
}
