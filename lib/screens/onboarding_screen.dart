import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
    if (context.mounted) {
      context.pushReplacementNamed('home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  const Center(
                    child: Text('Welcome to My Fitness!',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center),
                  ),
                  const Center(
                    child: Text('Track your workouts.',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Stay fit and healthy.',
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: ElevatedButton(
                          onPressed: () => _completeOnboarding(context),
                          child: const Text('Finish'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const WormEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  spacing: 16.0,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
