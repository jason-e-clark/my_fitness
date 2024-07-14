import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_fitness/screens/home_screen.dart';
import 'package:my_fitness/screens/onboarding_screen.dart';
import 'package:my_fitness/screens/settings_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) {
        return FutureBuilder<bool>(
          future: _checkOnboardingComplete(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return snapshot.data == true
                  ? const HomeScreen()
                  : const OnboardingScreen();
            }
          },
        );
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

Future<bool> _checkOnboardingComplete() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('onboardingComplete') ?? false;
}
