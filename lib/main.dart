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

  final String videoUrl = 'https://www.youtube.com/watch?v=-f5PwE_Q8Fs';

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
      home: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: controller),
        builder: (context, player){
          return Scaffold(
            appBar: AppBar(
              title: const Text('Youtube player example'),
              elevation: 4,
              shadowColor: Colors.black54,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: player,
              )
            ),
          );
        } 
      ),
    );
  }
}
