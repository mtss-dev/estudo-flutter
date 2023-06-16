import 'package:flutter/material.dart';
import 'package:projeto_testes/components/task.dart';

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
            children: const [
              Task('Aprender Flutter', 'assets/images/Dash.png', 3),
              Task('Andar de bicicleta', 'assets/images/bicicleta.jpg', 2),
              Task('Jogar futebol', 'assets/images/futebol.jpg', 1),
              Task('Ler um livro', 'assets/images/livro.jpg', 4),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  opacidade = !opacidade;
                });
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.hide_source,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.add,
                  color: Colors.green,
                )),
          ],
        ));
  }
}
