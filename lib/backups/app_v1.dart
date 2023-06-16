import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: Scaffold(
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
                  Task(
                      'Aprender Flutter',
                      'https://docs.flutter.dev/assets/images/dash/Dash.png',
                      3),
                  Task(
                      'Andar de bicicleta',
                      'https://mxbikes.com.br/blog/img/main/1200/como-ensinar-uma-crianca-a-pedalar-em-30-minutos.jpg',
                      2),
                  Task(
                      'Jogar futebol',
                      'https://mrvnoesporte.com.br/wp-content/uploads/2017/06/82932-quer-jogar-futebol-ainda-melhor-confira-essas-4-dicas.jpg',
                      1),
                  Task(
                      'Ler um livro',
                      'https://canaldoensino.com.br/blog/wp-content/uploads/2018/03/como-ler-um-livro-mais-rapido_Prancheta-11.jpg',
                      4),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                  height: 12,
                ),
                FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.add,
                      color: Colors.green,
                    )),
              ],
            )));
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(widget.foto, fit: BoxFit.cover)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 17,
                              color: (widget.dificuldade >= 1)
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              size: 17,
                              color: (widget.dificuldade >= 2)
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              size: 17,
                              color: (widget.dificuldade >= 3)
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              size: 17,
                              color: (widget.dificuldade >= 4)
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              size: 17,
                              color: (widget.dificuldade >= 5)
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.white,
                            ),
                            Text(
                              'UP',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                          color: Colors.black,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nivel $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
