import 'package:flutter/material.dart';
import 'package:receitas_vovo/models/Receita.dart';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class ReceitaPage extends StatefulWidget {
  final Receita receita;

  ReceitaPage(this.receita);
  
  @override
  _ReceitaPageState createState() => _ReceitaPageState();
}

class _ReceitaPageState extends State<ReceitaPage> {
  final bool loved = false;

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
                    TextSpan(text: '$i. ', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 21.0, color: Colors.pink)),
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
        elevation: 0.0,
        bottomOpacity: 0.0,
        iconTheme: IconThemeData(
          color: Colors.pink, //change your color here
        ),
        toolbarHeight: 70,
        backgroundColor: Colors.grey[100],
        title: Shimmer.fromColors(
          highlightColor: Colors.pink,
          baseColor: Colors.pink[200],
          child: Text('Detalhes da receita', style: TextStyle(fontWeight: FontWeight.w300))
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
            child: Container(
              width: 50.0,
              height: 50.0,
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
                iconSize: 20.0
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: SizedBox(
                child: Image.network("http://emanuelcorrea.com/receitasdavovo/assets/images/receitas/${widget.receita.slug}"),
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
                    child: Text("${widget.receita.nome}".toUpperCase(), style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w300),)
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
                    child: listaIngredientes(widget.receita.ingredientes)
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
                    child: listaPreparo(widget.receita.preparo),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}