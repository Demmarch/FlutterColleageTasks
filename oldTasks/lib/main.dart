import 'package:flutter/material.dart';
import 'signup.dart';
import 'signin.dart';
import 'subjects.dart';
import 'teachers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _navigateToAuthorization(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AuthorizationPage()),
    );
  }

  void _navigateToRegistration(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RegistrationPage()),
    );
  }

  void _navigateToTeachers(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const TeachersClass()),
    );
  }

  void _navigateToSubjects(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SubjectsClass()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _navigateToAuthorization(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const SelectableText("Авторизоваться"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToRegistration(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text("Зарегистрироваться"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToTeachers(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const SelectableText("Учителя"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToSubjects(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: SelectableText("Предметы"),
            ),
          ],
        ),
      ),
    );
  }
}
