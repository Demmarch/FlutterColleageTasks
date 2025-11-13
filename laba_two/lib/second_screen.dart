import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Второй экран (GoRouter)')),
      body: Center(
        child: ElevatedButton(
          child: const Text('На Экран 3 (GoRouter)'),
          onPressed: () {
            context.push('/third');
          },
        ),
      ),
    );
  }
}