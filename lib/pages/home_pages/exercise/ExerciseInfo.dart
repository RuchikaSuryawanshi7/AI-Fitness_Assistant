import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExerciseTutorialPage extends StatefulWidget {
  final String? videoUrl;
  final String? description;
  const ExerciseTutorialPage({Key? key,this.videoUrl,this.description}) : super(key: key);

  @override
  _ExerciseTutorialPageState createState() => _ExerciseTutorialPageState();
}

class _ExerciseTutorialPageState extends State<ExerciseTutorialPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoUrl!);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
        title: Text(
          "Yoga Tutorial",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical : 0.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Center(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Positioned(
                  top: 170.0,
                  left: 340.0,
                  child: IconButton(onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  }, icon: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 50,
                    color: Colors.white,
                  ),),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 30,
              ),
              child: Text(
                widget.description!,
                style: TextStyle(
                  fontSize: 17,
                ),
              ))
        ],
      ),
    );
  }
}
