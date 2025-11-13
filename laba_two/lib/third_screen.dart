import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Третий экран (3)')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Назад'),
          onPressed: () {
            Navigator.pop(context); // Просто закрываем (снимаем) этот экран
          },
        ),
      ),
    );
  }
}