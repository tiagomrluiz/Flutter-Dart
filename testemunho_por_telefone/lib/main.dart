import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void geraLista() {
    print('Criou a lista');
  }

  List _toDoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testemunho por Telefone"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Novos Números",
                        labelStyle: TextStyle(color: Colors.purple)),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                RaisedButton(
                  color: Colors.purple,
                  child: Text("Criar"),
                  textColor: Colors.white,
                  onPressed: geraLista,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
