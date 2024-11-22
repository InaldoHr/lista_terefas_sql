import 'package:flutter/material.dart';
import 'package:lista_terefas_sql/views/addtarefa_view.dart';
import 'package:lista_terefas_sql/views/edittarefa_view.dart';
import 'package:lista_terefas_sql/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/addTarefa': (context) => const AddtarefaView(),
      },
      title: 'Lista de tarefas',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
      ),
      home: HomeView(),
    );
  }
}
