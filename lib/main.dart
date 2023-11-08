import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  final String videoUrl = 'https://www.youtube.com/watch?v=YfpV3al_Q3k';

  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    final videoID = YoutubePlayer.convertUrlToId(videoUrl);

    controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const  YoutubePlayerFlags(
        autoPlay: false,
        hideThumbnail: true,
        showLiveFullscreenButton: false,
        disableDragSeek: true,
        enableCaption: false
      ) 
    );
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Youtube player example'),
          elevation: 4,
          shadowColor: Colors.black54,
        ),
        body: Center(
          child: YoutubePlayer(
            controller: controller,
            // showVideoProgressIndicator: true,
            
          ),
        ),
      ),
    );
  }
}
