import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главный экран (GoRouter)')),
      body: Center(
        child: ElevatedButton(
          child: const Text('На Экран 2 (GoRouter)'),
          onPressed: () {
            context.push('/second');
          },
        ),
      ),
    );
  }
}