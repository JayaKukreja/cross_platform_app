import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  late VideoPlayerController controller;
  VideoPlayerWidget({super.key, required this.controller});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secure();
    // controller = VideoPlayerController.asset('assets/video.mp4')
    //   ..addListener(() {
    //     setState(() {});
    //   })
    //   ..setLooping(true)
    //   ..initialize().then((_) => controller.play());
  }

  secure() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) => widget.controller.value.isInitialized
      ? Container(
          alignment: Alignment.topCenter,
          child: buildVideo(),
        )
      : const Center(
        child: CircularProgressIndicator(),
      );

  Widget buildVideo() => SafeArea(
    
        child: AspectRatio(
            aspectRatio: widget.controller.value.aspectRatio,
            child: VideoPlayer(widget.controller,
            )),
      );
}
