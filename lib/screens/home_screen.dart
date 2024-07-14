import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _restartOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', false);
    if (context.mounted) {
      context.pushReplacementNamed('root');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Fitness'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _restartOnboarding(context),
            child: const Text('Restart Onboarding'),
          ),
        ),
      ),
    );
  }
}
