import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.cyan,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.pinkAccent,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.purpleAccent,
                  ),
                ],
              ),
              Container(
                color: Colors.amber,
                height: 30,
                width: 300,
                child: const Text(
                  "Eu amo a Dede!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print('Você apertou o botão');
                  },
                  child: const Text('Aperte-me')),
            ],
          ),
        ));
  }
}