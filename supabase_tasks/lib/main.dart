import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = 'https://diatfsydzbqpfdzwcgil.supabase.co';
const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRpYXRmc3lkemJxcGZkendjZ2lsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjEyMTIxNzIsImV4cCI6MjA3Njc4ODE3Mn0.o5w70G_DuDtwR2MEaylJC68g-UTN5dzOJmVVmzVog8w';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends StatelessWidget {
  const MyApp({super.key});

  Future<List<dynamic>> _fetchData() async {
    print("Запрос данных из Supabase");

    try {
      final data = await supabase.from('messages').select();      
      print("Данные получены: $data");
      return data;
    } catch (error) {
      print("Ошибка при загрузке: $error");
      throw Exception('Не удалось загрузить сообщения: $error');
    }
  }

  @override 
  Widget build(BuildContext c) {
  
  return Scaffold(
    body: Container(    
      child: FutureBuilder<List<dynamic>>(
          future: _fetchData(),
          builder: (context, snapshot) {
            
            // Состояние загрузки
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      'Состояние: ${snapshot.connectionState}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            }

            // Состояние: Ошибка
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Ошибка: ${snapshot.error}\n\nСостояние: ${snapshot.connectionState}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Сообщений нет.'));
            }

            final messages = snapshot.data!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Текущее состояние: ${snapshot.connectionState}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                      fontSize: 18,
                    ),
                  ),
                  ...List.generate(
                    messages.length,
                    (index) {
                      final itemString = messages[index].toString();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: SelectableText(itemString),
                      );
                    },
                  ),
                ]
              ),
            );
          }
        ),
      )
    );
  }
}