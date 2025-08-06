import 'package:family_meeting/pages/call_page.dart';
import 'package:family_meeting/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: CallPage.path,
    routes: [
      GoRoute(
        path: HomePage.path,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: CallPage.path,
        builder: (context, state) => const CallPage(),
      ),
    ],
  );
}
