import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главный экран (Named)')),
      body: Center(
        child: ElevatedButton(
          child: const Text('На Экран 2 (pushNamed)'),
          onPressed: () {
            // "Звоним" по имени:
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}