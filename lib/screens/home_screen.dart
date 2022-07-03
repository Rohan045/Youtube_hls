import 'package:flutter/material.dart';
import 'package:youtube_hls/Providers/videoList.dart';
import 'package:youtube_hls/widgets/videoDisplay.dart';
import 'package:youtube_hls/models/video.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Youtube",
      )),
      body: FutureBuilder(
          future: Provider.of<VideoList>(context, listen: false).readJson(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<VideoList>(
                      builder: (ctx, list, _) => ListView.builder(
                        itemCount: list.videos.length,
                        itemBuilder: (ctx, i) => VideoDisplay(Video(
                          id: list.videos[i].id,
                          title: list.videos[i].title,
                          coverPictureUrl: list.videos[i].coverPictureUrl,
                          videoUrl: list.videos[i].videoUrl,
                        )),
                      ),
                    )),
    );
  }
}
