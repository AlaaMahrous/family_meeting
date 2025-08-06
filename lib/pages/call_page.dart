import 'package:family_meeting/pages/home_page.dart';
import 'package:family_meeting/services/stream_video_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});
  static final String path = '/CallPage';

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  Call? call;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await requestPermissions();
    initCall();
  }

  void initCall() async {
    final newCall = await StreamVideoService.joinCall('test-room');
    setState(() {
      call = newCall;
    });
  }

  Future<void> requestPermissions() async {
    await [Permission.camera, Permission.microphone].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: call == null
          ? const Center(child: CircularProgressIndicator(color: Colors.blue))
          : StreamCallContainer(
              call: call!,
              onBackPressed: () {
                GoRouter.of(context).go(HomePage.path);
              },
              onLeaveCallTap: () {
                GoRouter.of(context).go(HomePage.path);
              },
            ),
    );
  }
}
