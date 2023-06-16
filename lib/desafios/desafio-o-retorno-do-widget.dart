import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool opacidade = true;

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.add_chart_outlined),
            backgroundColor: Colors.blue,
            title: const Text("Flutter: Primeiros Passos"),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: ListView(
            children: const [
              Desafio(
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 64, 129),
                  Color.fromARGB(255, 64, 196, 255),
                  100,
                  Icon(Icons.person)),
              Desafio(
                  Color.fromARGB(255, 233, 30, 99),
                  Color.fromARGB(255, 156, 39, 176),
                  Color.fromARGB(255, 68, 138, 255),
                  100,
                  Icon(Icons.person)),
              Desafio(
                  Color.fromARGB(255, 255, 64, 129),
                  Color.fromARGB(255, 255, 193, 7),
                  Color.fromARGB(255, 3, 169, 244),
                  100,
                  Icon(Icons.person)),
              Desafio(
                  Color.fromARGB(255, 224, 64, 251),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 76, 175, 80),
                  100,
                  Icon(Icons.person)),
            ],
          ),
        ));
  }
}

class Desafio extends StatefulWidget {
  final Color cor1;
  final Color cor2;
  final Color cor3;
  final Icon icone;
  final double largura;

  const Desafio(this.cor1, this.cor2, this.cor3, this.largura, this.icone,
      {Key? key})
      : super(key: key);

  @override
  State<Desafio> createState() => _DesafioState();
}

class _DesafioState extends State<Desafio> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.cor1,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
            ),
            height: 140,
            width: (widget.largura <= 120) ? widget.largura : 120,
          ),
          Container(
            decoration: BoxDecoration(
              color: widget.cor2,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
            ),
            height: 140,
            width: (widget.largura <= 120) ? widget.largura : 120,
            child: widget.icone,
          ),
          Container(
            decoration: BoxDecoration(
              color: widget.cor3,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
            ),
            height: 140,
            width: (widget.largura <= 120) ? widget.largura : 120,
          ),
        ],
      ),
    );
  }
}
