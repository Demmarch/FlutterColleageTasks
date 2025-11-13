import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'main_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) => const SecondScreen(),
    ),
    GoRoute(
      path: '/third',
      builder: (context, state) => const ThirdScreen(),
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Navigation',
      routerConfig: _router,
    );
  }
}