import 'package:family_meeting/app_router.dart';
import 'package:family_meeting/services/stream_video_flutter.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StreamVideoService.init();
  runApp(FamilyMeetingApp());
}

class FamilyMeetingApp extends StatelessWidget {
  const FamilyMeetingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
