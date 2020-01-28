import 'package:flutter/material.dart';
import 'package:receitas_vovo/models/Receita.dart';
import 'package:receitas_vovo/views/receitaPage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receitas_vovo/widgets/drawer_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Receita> receitas = [];

  Future<List<Receita>> _getReceitas() async {
    var respose = await http.get(
      Uri.encodeFull("http://sitedomanu.com.br/api/json/receitas_vovo.php"),
      headers: {"Accept" : "Application/json"}
    );

    setState(() {
      var jsonData = json.decode(respose.body);

      for (var u in jsonData) {
        Receita receita = Receita(u["id_receita"], u["nome"], u["img"], u["ingredientes"], u["categoria"], u["preparo"], u["dia"], u["color"]);

        receitas.add(receita);
      }
    });

    return receitas;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/bg2.png",
              fit: BoxFit.contain,
              height: 32.0,
            ),
            Text('Página Inicial', style: TextStyle(fontSize: 18.0)),
          ],
        ),
        centerTitle: true,
        flexibleSpace: Image(
          image: AssetImage('assets/images/bg2.png'),
          fit: BoxFit.cover,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.heart),
            onPressed: () {},
            iconSize: 18.0,
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.ellipsisV),
            onPressed: () {},
            iconSize: 18.0,
          ),
        ],
        leading: IconButton(
          icon: Container(
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.bars, color: Color.fromRGBO(228, 89, 84, 1),)
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        backgroundColor: Color.fromRGBO(252, 152, 152, 1),
      ),
      drawer: DrawerMenu(),
      body: Container(
        child: ListView.builder(
          itemCount: receitas.length,
          itemBuilder: (BuildContext context, int index) {
            final Receita receita = receitas[index];
            
            return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (BuildContext context) => ReceitaPage(receita),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 5.0,
                              color: Color.fromRGBO(255, 138, 138, 1.0)
                            )
                          ),
                          child: SizedBox(
                            child: Image.asset(
                              "assets/images/receitas/${receita.img}",
                            ),
                          ),
                        ),
                        Container(
                          height: 40.0,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * .5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(68, 68, 68, 0.5),
                            blurRadius: 5.0,
                            )]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(receita.nome)
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 138, 138, 1.0),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0)
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: Color.fromRGBO(68, 68, 68, 0.5),
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(receita.categoria, style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.star, size: 20.0, color: Colors.yellow),
                                  Icon(Icons.star, size: 15.0, color: Colors.yellow),
                                  Icon(Icons.star, size: 15.0, color: Colors.yellow),
                                  Icon(Icons.star, size: 15.0, color: Colors.yellow),
                                  Icon(Icons.star, size: 15.0, color: Colors.yellow)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ]
                ),
              ),
            );
          }
        )
      )
    );
  }

  @override
  void initState() {
    super.initState();
    this._getReceitas();
  }
}