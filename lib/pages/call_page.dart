import 'dart:developer' show log;

import 'package:family_meeting/services/stream_video_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  Call? call;

  @override
  void initState() {
    super.initState();
    initCall();
  }

  void initCall() async {
    final newCall = await StreamVideoService.joinCall('test-room');
    setState(() {
      call = newCall;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: call == null
          ? const Center(child: CircularProgressIndicator())
          : StreamCallContainer(
              call: call!,
              onLeaveCallTap: () {
                log('message');
              },
            ),
    );
  }
}
