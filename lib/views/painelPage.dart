import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PainelPage extends StatefulWidget {
  @override
  _PainelPageState createState() => _PainelPageState();
}

class _PainelPageState extends State<PainelPage> {
  List<Receitas> receitas = [];

  Future<List<Receitas>> _getReceitas() async {
    var respose = await http.get(
      Uri.encodeFull("http://receitas.emanuelcorrea.com.br/api/json/receitas_vovo.php"),
      headers: {"Accept" : "Application/json"}
    );

    var jsonData = json.decode(respose.body);

    for (var u in jsonData) {
      Receitas receita = Receitas(u["id_receita"], u["nome"], u["img"], u["ingredientes"], u["categoria"], u["preparo"], u["dia"], u["color"], u["slug"]);

      receitas.add(receita);
    }

    return receitas;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/bg2.png",
              fit: BoxFit.contain,
              height: 32.0,
            ),
            Text('Minhas Receitas'),
          ],
        ),
        flexibleSpace: Image(
          image: AssetImage('assets/images/bg2.png'),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: _getReceitas(),
          builder: (BuildContext  context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0, 0),
                                child: SizedBox(
                                  child: Image.network(
                                    "http://receitas.emanuelcorrea.com.br/public/assets/img/receitas/${snapshot.data[index].slug}.jpg",
                                    height: 90.0,
                                    width: 130.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12.0, 6.0, 0, 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(snapshot.data[index].nome, style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,)),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 10.0, 8.0, 0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.star, size: 15.0, color: Colors.yellow),
                                          Icon(Icons.star, size: 15.0, color: Colors.yellow),
                                          Icon(Icons.star, size: 15.0, color: Colors.yellow),
                                          Icon(Icons.star, size: 15.0, color: Colors.yellow),
                                          Icon(Icons.star, size: 15.0, color: Colors.yellow)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 7.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            child: OutlineButton(
                                              onPressed: () {},
                                              borderSide: BorderSide(
                                                color: Colors.pink[100]
                                              ),
                                              child: Text(snapshot.data[index].categoria, style: TextStyle(color: Colors.grey, fontSize: 10.0)),
                                            ),
                                            height: 20.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 12.0, 8.0, 0),
                              child: Container(
                                height: 35.0,
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50.0),
                                    topLeft: Radius.circular(50.0),
                                    bottomRight: Radius.circular(50.0),
                                    topRight: Radius.circular(50.0),
                                  )
                                ),
                                child: Icon(FontAwesomeIcons.trashAlt, color: Colors.white, size: 16.0),
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
                              child: Container(
                                height: 35.0,
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(252, 152, 152, 1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50.0),
                                    topLeft: Radius.circular(50.0),
                                    bottomRight: Radius.circular(50.0),
                                    topRight: Radius.circular(50.0),
                                  )
                                ),
                                child: Icon(FontAwesomeIcons.edit, color: Colors.white, size: 16.0),
                              )
                            ),
                          ],
                        ),
                      ]
                    ),
                  );
                },
              );
            }
          },
        )
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          color: Colors.white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          Navigator.of(context).pushNamed('/addReceita');
        }),
        tooltip: 'Adicionar Receita',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Receitas {
  final String idreceita;
  final String nome;
  final String img;
  final String ingredientes;
  final String categoria;
  final String preparo;
  final String dia;
  final String color;
  final String slug;
  
  Receitas(this.idreceita, this.nome, this.img, this.ingredientes, this.categoria, this.preparo, this.dia, this.color, this.slug);
}
