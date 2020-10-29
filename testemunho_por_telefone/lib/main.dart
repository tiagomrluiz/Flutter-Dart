import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:async/async.dart';

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
  final _toDoController = TextEditingController();
  List<String> _toDoList = [];

 void gerarNums({String numero}) {
    _toDoList.clear();
    String substring = numero.substring(0, numero.length - 2);
 
    for (int i = 0; i < 100; i++) {
      if (i < 10)
        _toDoList.add('${substring}0$i');
      else if (i < 100)
        _toDoList.add('${substring}$i');
      else
        _toDoList.add('${substring}$i');
    }

    setState(() {});
  }

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
                    controller: _toDoController,
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
                  onPressed: () => gerarNums(numero: _toDoController.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: _toDoList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      '${_toDoList[index]}',
                      style: TextStyle(fontSize: 25),
                    ),
                   
                  );
                }),
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/data.json');
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
