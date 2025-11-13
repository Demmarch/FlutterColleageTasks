import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Второй экран (Named)')),
      body: Center(
        child: ElevatedButton(
          child: const Text('На Экран 3 (pushNamed)'),
          onPressed: () {
            // "Звоним" по имени:
            Navigator.pushNamed(context, '/third');
          },
        ),
      ),
    );
  }
}