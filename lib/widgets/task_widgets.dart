import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome; //criado essa variavel para conseguir mudar o nome das tarefas para nao ficar statico
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding faz distanciar os objetos
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              //decoration decora a borda
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //container do fundo da imagem
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        // esse child Image.networ pega uma url de da internet e insere no container (src source (a origem) )
                        child: ClipRRect(
                          // deu um wrap e criou um cliprrecr pra deixar a borda arredondada
                          borderRadius: BorderRadius.circular(7),
                          child: Image.network(
                            widget.foto,
                            //esse fit arruma o tamanho da imagem
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                // overflow se tiver um texto muito grande , ele comeca e coloca ... ate tamanho maximo
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                // esse linha de baixo representa isso Icon(Icons.star, size: 15, color:if(widget.dificuldade>= 1{Colors.blue} else {Colors.blue[100]}) Colors.blue), mas lembrando que o dart nao aceita esse tipo de codigo e apenas para entender a logica do ternario
                                // condicao ? se condicao for verdadeira : condicao falsa
                                color: (widget.dificuldade >= 1) ? Colors.blue : Colors.blue[100],
                              ),
                              Icon(Icons.star, size: 15, color: (widget.dificuldade >= 2) ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: (widget.dificuldade >= 3) ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: (widget.dificuldade >= 4) ? Colors.blue : Colors.blue[100]),
                              Icon(Icons.star, size: 15, color: (widget.dificuldade >= 5) ? Colors.blue : Colors.blue[100]),
                            ],
                          )
                        ],
                      ),
                      Container(
                        // colocou o elevatedbutton no container para delimitar o tamaho heigth e width
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                          },
                          child: const Column(
                            // usou coluna pq é o icone em cima e o texto embaixo
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                              ),
                              Text(
                                'UP',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
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
                      // padding : edgeinserts vai dizer qual lado ele vai colocar uma 'barreirinha'
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0) ? (nivel / widget.dificuldade) / 10 : 1,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Nível $nivel',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
