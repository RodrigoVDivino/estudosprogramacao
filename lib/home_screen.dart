import 'package:aula_alura_flutter/widgets/task_widgets.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
            'Tarefas',
          ),
        ),
        body: ListView(
          children: const [
            Task('Aprender flutter todos os dias da semana !@@@@!'),
            Task(' Andar de bike'),
            Task('Andar de skae'),
            Task('Jogar videogame'),
            Task('Jogar dado'),
            Task('Jogar ping pong'),
            Task('Jogar bola'),
            Task('Jogar basquete '),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
