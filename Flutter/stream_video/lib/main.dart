import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VlcPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VlcPlayerController.network(
      // 'rtsp://192.168.1.6/cam-lo.jpg', // Thay đổi địa chỉ RTSP tùy thuộc vào độ phân giải bạn muốn sử dụng.
      'http://192.168.1.6/cam-hi.jpg', // Thay đổi địa chỉ RTSP tùy thuộc vào độ phân giải bạn muốn sử dụng.
      options: VlcPlayerOptions(),
      // onInit: () {
      //   setState(() {});
      // },
    )..initialize().then((value) => print("Streaming initialized..."));

    _controller.addOnInitListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_controller.value.isInitialized);
    if (!_controller.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ESP32-CAM Video'),
      ),
      body: Center(
        // child: AspectRatio(
        //   aspectRatio: _controller.value.aspectRatio,
        child: VlcPlayer(
          controller: _controller,
          aspectRatio: _controller.value.aspectRatio,
        ),
      ),
      // ),
    );
  }
}
