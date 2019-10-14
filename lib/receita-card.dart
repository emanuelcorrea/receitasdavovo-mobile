import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final bool loved = false;

  ReceitaCard(this.index);

  ingredientes(index) {
    List<String> ingredientes;

    ingredientes = index.split("|");

    return ingredientes;
  }

  Widget listaPreparo(index)
  {
    List<String> strings;

    strings = index.split('|');
    
    List<Widget> list = List<Widget>();
    
    for(var i = 1; i < strings.length; i++){
      list.add(
        Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: RichText(
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                strutStyle: StrutStyle(height: 2.0),
                text: TextSpan(
                  style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: '${i}. ', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 21.0, color: Colors.pink)),
                    TextSpan(text: '${strings[i]}', style: TextStyle()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      );
    }

    return Column(
      children: list
    );
  }

  Widget listaIngredientes(index)
  {
    List<String> strings;

    strings = index.split('|');
    
    List<Widget> list = List<Widget>();
    
    for(var i = 0; i < strings.length; i++){
      list.add(
        Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: RichText(
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                strutStyle: StrutStyle(height: 2.0),
                text: TextSpan(
                  style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black, textBaseline: TextBaseline.ideographic),
                  children: <TextSpan>[
                    TextSpan(text: ' •   ', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 28.0, color: Colors.pink, )),
                    TextSpan(text: '${strings[i]}', style: TextStyle()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.0)
          ],
        ),
      );
    }

    return Column(
      children: list
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Image(
          image: AssetImage('assets/images/bg2.png'),
          fit: BoxFit.cover,
        ),
        title: Text('Receita'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
            child: Container(
              width: 39.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
              child: IconButton(
                icon: Icon(FontAwesomeIcons.heart, color: loved ? Colors.grey : Color.fromRGBO(252, 152, 152, 1)),
                onPressed: () {},
                iconSize: 20.0,
              ),
            ),
          ),
        ],
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
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: SizedBox(
                        child: Image.asset(
                          "assets/images/receitas/${snapshot.data[index].img}",
                        ),
                        height: 200.0,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, .5),
                            offset: Offset(5.0, 2.0),
                            blurRadius: 10.0
                          )
                        ]
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0, 25, -10),
                          width: 50.0,
                          child: Divider(color: Colors.black12,)
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, 25, -10),
                          width: 50.0,
                          child: Divider(color: Colors.black12)
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            child: Text("${snapshot.data[index].nome}".toUpperCase(), style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),)
                          ),
                        ],
                      )
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -20.0, 0),
                      height: 5.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(252, 152, 152, 1),
                            Colors.pinkAccent,
                            Color.fromRGBO(252, 152, 152, 1),
                          ]
                        )
                      ),
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: 250.0,
                            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(210, 210, 210, .2),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(0.0),
                                bottomLeft: Radius.circular(0.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  transform: Matrix4.translationValues(0, -5, 0),
                                  child: Icon(FontAwesomeIcons.clipboardList, color: Color.fromRGBO(252, 152, 152, 1),)
                                ),
                                Text(' Ingredientes'.toUpperCase(), style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w300, fontSize: 17.0)),
                              ],
                            )
                          ),
                          Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 195, 195, .1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                            ),
                            padding: EdgeInsets.all(10.0),
                            child: listaIngredientes(snapshot.data[index].ingredientes)
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 50.0,
                            width: 250.0,
                            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(210, 210, 210, .2),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(0.0),
                                bottomLeft: Radius.circular(0.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  transform: Matrix4.translationValues(-5, -5, 0),
                                  child: Icon(FontAwesomeIcons.clipboardList, color: Color.fromRGBO(252, 152, 152, 1),)
                                ),
                                Text('Modo de preparo'.toUpperCase(), style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w300, fontSize: 17.0)),
                              ],
                            )
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 195, 195, .1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              )
                            ),
                            padding: EdgeInsets.all(10.0),
                            child: listaPreparo(snapshot.data[index].preparo),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ],
                ),
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
