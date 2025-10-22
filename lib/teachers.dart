import 'package:flutter/material.dart';


class TeachersClass extends StatelessWidget {
  
  static const Map<int, Map<String, dynamic>> teachers = {
    1: {
      'position': 'Профессор',
      'name': 'Иванов И.И.',
      'phone': '+7 (999) 123-45-67'
    },
    2: {
      'position': 'Доцент',
      'name': 'Петрова П.П.',
      'phone': '+7 (999) 123-45-68'
    }
  };
  
  const TeachersClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Преподаватели"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Добро пожаловать!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Логин',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Пароль',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}