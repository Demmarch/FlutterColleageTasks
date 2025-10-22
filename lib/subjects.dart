import 'package:flutter/material.dart';


class SubjectsClass extends StatelessWidget {
  
    static const Map<int, Map<String, dynamic>> subjects = {
    1: {
      'name': 'Математика',
      'duration': 90,
      'day': 'Понедельник'
    },
    2: {
      'name': 'Физика',
      'duration': 120,
      'day': 'Вторник'
    }
  };
  
  const SubjectsClass({super.key});

  @override
  Widget build(BuildContext context) {
    
    final subjectList = subjects.values.toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Предметы"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Используем List.generate для создания списка виджетов
            ...List.generate(subjectList.length, (index) {
              // Получаем данные текущего предмета по его индексу
              final subject = subjectList[index];
              final String name = subject['name'] ?? 'Без названия';
              final int duration = subject['duration'] ?? 0;
              final String day = subject['day'] ?? 'Неизвестно';

              // Возвращаем ту же красивую карточку, что и раньше
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo.shade100,
                    child: Text(
                      name.isNotEmpty ? name[0] : '?',
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    'День: $day\nДлительность: $duration минут',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  onTap: () {
                    print('Нажали на "$name"');
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}