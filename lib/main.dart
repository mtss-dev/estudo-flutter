import 'package:flutter/material.dart';
import 'package:projeto_testes/data/task_inherited.dart';
import 'package:projeto_testes/screens/initial_screen.dart';

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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: TaskInherited(
          child: const InitialScreen(),
        ));
  }
}
