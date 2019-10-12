import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class ReceitaCard extends StatelessWidget {
  final List<Receita> receitas = [];

  Future<List<Receita>> _getReceitas() async {
    var data = await http.get("http://programando.dev/api/json/receitas_vovo.php");

    var jsonData = json.decode(data.body);

    for (var u in jsonData) {
      Receita receita = Receita(
        u["id_receita"],
        u["nome"],
        u["img"],
        u["ingredientes"],
        u["categoria"],
        u["preparo"],
        u["dia"],
        u["color"]
      );

      receitas.add(receita);
    }

    return receitas;
  }

  final int index;

  ReceitaCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: FutureBuilder(
          future: _getReceitas(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Text('...');
            } else {
              return Text('${snapshot.data[index].nome}');
            }
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: _getReceitas(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Image.asset(
                          "assets/images/receitas/${snapshot.data[index].img}",
                        ),
                        height: 232.0,
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 200.0,
                                height: 45.0,
                                child: Container (
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(12.0, 11.0, 0 ,0),
                                    child: Text(
                                      'Tempo de preparo: 1',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18.0
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 0.0, 0),
                                child: Container(
                                  height: 45.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(12.5, 0, 0, 0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.star,
                                            size: 25.0, color: Colors.yellow),
                                        Icon(Icons.star,
                                            size: 25.0, color: Colors.yellow),
                                        Icon(Icons.star,
                                            size: 25.0, color: Colors.yellow),
                                        Icon(Icons.star,
                                            size: 25.0, color: Colors.yellow),
                                        Icon(Icons.star,
                                            size: 25.0, color: Colors.yellow)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: OutlineButton(
                                onPressed: () {},
                                borderSide: BorderSide(color: Colors.pink[100]),
                                child: Text(snapshot.data[index].categoria,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13.0)),
                              ),
                              height: 20.0,
                            )
                          ],
                        ),
                      ),
                      Text('${snapshot.data}')
                    ]),
              );
            }
          },
        ),
      ),
    );
  }
}

class Receita {
  final String idreceita;
  final String nome;
  final String img;
  final String ingredientes;
  final String categoria;
  final String preparo;
  final String dia;
  final String color;

  Receita(this.idreceita, this.nome, this.img, this.ingredientes,
      this.categoria, this.preparo, this.dia, this.color);
}
