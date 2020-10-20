import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': ['Maria', 'Gustavo', 'Leo', 'Pedro']
    }
  ];

  void _responder() {
    if(temPerguntaSelecionada){
    setState(() {
      _perguntaSelecionada++;
    });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada ?_perguntas[_perguntaSelecionada]['respostas']: null;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? 
        Column(
          children: [
            Questao(_perguntas[_perguntaSelecionada]['texto']),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ): Center(child:
        Text('Parabens!',
        style: TextStyle(fontSize: 28),),),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
