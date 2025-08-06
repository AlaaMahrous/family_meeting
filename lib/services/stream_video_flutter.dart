import 'dart:developer';

import 'package:family_meeting/services/generate_user_token.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

class StreamVideoService {
  static late final StreamVideo client;
  static Call? _call;

  static Future<void> init() async {
    final String userId = 'user${DateTime.now().millisecondsSinceEpoch}';
    try {
      client = StreamVideo(
        'zgzw22hzk2zz',
        user: User.regular(userId: userId, name: userId),
        userToken: generateUserToken(userId),
      );
    } on Exception catch (e, trace) {
      log('$e \n $trace');
    }
  }

  static Future<Call> joinCall(String callId) async {
    if (_call != null) return _call!;
    _call = client.makeCall(callType: StreamCallType.defaultType(), id: callId);
    await _call!.join();
    return _call!;
  }

  static Future<void> leaveCall() async {
    await _call?.leave();
    _call = null;
  }

  static Call? get currentCall => _call;
}
