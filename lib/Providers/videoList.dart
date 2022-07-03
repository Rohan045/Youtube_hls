import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_hls/models/video.dart';

class VideoList extends ChangeNotifier {
  List<Video> _videos = [];

  List<Video> get videos {
    return [..._videos];
  }

  Future<void> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/dataset.json');
      //print(response);
      final data = await json.decode(response) as List<dynamic>;
      print(data[0]['id']);
      print(data.length);
      List<Video> _list = [];
      for (int i = 0; i < data.length; i++) {
        print(data[i]['id']);
        _list.add(Video(
          id: data[i]['id'].toString(),
          title: data[i]['title'],
          coverPictureUrl: data[i]['coverPicture'],
          videoUrl: data[i]['videoUrl'],
        ));
      }
      _videos = _list;
      notifyListeners();
    } catch (error) {
      print(error);
      // throw error;
      // print(error);
      notifyListeners();
    }
  }
}
