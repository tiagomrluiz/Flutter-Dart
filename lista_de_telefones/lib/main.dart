import 'package:flutter/material.dart';
import 'package:lista_de_telefones/telefones.dart';

main() => runApp(ListadeTelefone());

class ListadeTelefone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _telefones = [
    Telefones(
        phone: '19988118200', revisita: false, infomacao: 'Nada a declarar'),
    Telefones(
      phone: '19988118201',
      revisita: false,
      infomacao: 'Ligar de novo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testemunho por Telefones'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(17, 1, 7, 1),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                        labelText: "Número",
                        labelStyle: TextStyle(color: Colors.purple)),
                  ),
                ),
                RaisedButton(
                  color: Colors.purple,
                  child: Text("Criar"),
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Column(
            children: _telefones.map((tel) {
              return Center(
                child: Text(tel.phone),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
