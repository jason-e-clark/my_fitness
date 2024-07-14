import 'package:flutter/material.dart';
import 'package:my_fitness/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'My Fitness',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
