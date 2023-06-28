import 'package:flutter/material.dart';
import 'package:projeto_testes/data/task_inherited.dart';

import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Tarefas'),
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: AnimatedOpacity(
          opacity: (opacidade) ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: ListView(
            padding: const EdgeInsets.only(top: 8, bottom: 70),
            children: TaskInherited.of(context).taskList,
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "esconder",
              onPressed: () {
                setState(() {
                  opacidade = !opacidade;
                });
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.hide_source,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            FloatingActionButton(
                heroTag: "adicionar",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextNew) => FormScreen(
                                taskContext: context,
                              )));
                },
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ],
        ));
  }
}
