import 'package:family_meeting/pages/call_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static final String path = '/HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            spacing: 5,
            children: [
              Image.asset('assets/images/family.jpg'),
              Text(
                'This app brings our family closer, no matter the distance between us.\nShare smiles, stories, and precious moments — anytime, anywhere.\nClick below to reconnect and see who’s already inside the family circle.',
                style: TextStyle(fontFamily: 'Cairo', color: Colors.grey),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(CallPage.path);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CallPage()),
                  );
                },
                child: const Text(
                  'Resume Call',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
