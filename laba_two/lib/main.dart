import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'main_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

// 1. Создаем и настраиваем маршрутизатор
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
    // Я добавил /third, хотя в вашем задании его не было,
    // чтобы пример был полным
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
    // 2. Используем конструктор MaterialApp.router
    return MaterialApp.router(
      title: 'GoRouter Navigation',
      routerConfig: _router, // Передаем нашу конфигурацию
    );
  }
}