import 'package:cross_platform_app/constants.dart';
import 'package:cross_platform_app/screens/example.dart';
import 'package:cross_platform_app/screens/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:video_player/video_player.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Featured extends StatefulWidget {
  const Featured({super.key});

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  late VideoPlayerController controller;

  Future<void> secure() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    // TODO: implement initState
    secure();
    super.initState();

    controller = VideoPlayerController.asset('assets/video.mp4')
      ..addListener(() {
        setState(() {});
      })
      ..setVolume(0)
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() async {
    super.dispose();
    controller.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text("CBSE\nGrade 2",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: kblue)),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_outlined,
                  color: kblue,
                ))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
                child: Text("Let's Explore Our Learning With!",
                    style: TextStyle(fontSize: 18))),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PdfApp()));
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: Image.asset('assets/books.jpg', height: 50),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Sample pdf')
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPlayerWidget(
                                      controller: controller,
                                    )));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Image.asset(
                          'assets/books.jpg',
                          height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Sample video')
                  ],
                ),
              ],
            ),
            // SizedBox(height: 30),
            // Text('Conceptual Videos'),
            // SizedBox(
            //   height: 10,
            // ),
            // ListView(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     children: [
            //       Container(height: 100,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(10))),
            //         child: Column(children: [
            //           Image.asset('assets/books.jpg'),
            //           Text('Big Carrot')
            //         ]),
            //       )
            //     ])
            // Container(
            //   height: 400,
            //   child: PDFView(controll),
            // )
          ],
        ),
      ),
    );
  }
}
