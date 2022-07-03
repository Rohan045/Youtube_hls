import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_hls/models/video.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoDisplay extends StatefulWidget {
  final Video video;
  VideoDisplay(this.video);

  @override
  State<VideoDisplay> createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  late final VideoPlayerController videoPlayerController;
  // bool initialized = false;
  // ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    print(widget.video.videoUrl);
    videoPlayerController =
        VideoPlayerController.network(widget.video.videoUrl!)
          ..initialize().then((_) {
            setState(() {
              videoPlayerController.play();
            });
          }).catchError((error) {
            print(error);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: Colors.blue,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: videoPlayerController.value.isInitialized
                  ? VideoPlayer(videoPlayerController)
                  : Image.network(
                      widget.video.coverPictureUrl!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Row(
              children: <Widget>[
                Text(widget.video.title!),
                IconButton(
                    onPressed: () {
                      setState(() {
                        videoPlayerController.play();
                      });
                    },
                    icon: Icon(Icons.play_arrow))
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
}
