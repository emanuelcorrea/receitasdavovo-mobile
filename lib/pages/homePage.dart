import 'package:flutter/material.dart';
import 'package:receitas_vovo/models/Receita.dart';
import 'package:receitas_vovo/pages/receitaPage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      drawer: Drawer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 240.0,
              child: DrawerHeader(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 12.0),
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                          bottomLeft: Radius.circular(50.0),
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/vovo-feliz.png",
                        width: 100.0,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Divider(color: Color.fromRGBO(255, 255, 255, 0.9),),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Olá,'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold)),
                        Text(' Emanuel Corrêa'.toUpperCase(), style: TextStyle(color: Color.fromRGBO(155, 42, 48, .8), fontSize: 15.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold)),
                        Text('!'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover
                  )
                ),
                padding: EdgeInsets.all(10.0),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.739176,
              transform: Matrix4.translationValues(0, -10, -23),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 25.0, 0, 0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg2.png'),
                    fit: BoxFit.cover
                  )
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Minha Conta'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.pushNamed(context, '/painel');
                      },
                      trailing: Icon(FontAwesomeIcons.newspaper, color: Colors.white, size: 23.0),
                    ),
                    ListTile(
                      title: Text('Minhas Receitas'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold)),
                      // title: Text('SUPORTE'.toUpperCase(), style: TextStyle(color: Color.fromRGBO(155, 42, 48, 1), fontSize: 17.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.pushNamed(context, '/painel');
                      },
                      trailing: Icon(FontAwesomeIcons.book, color: Colors.white, size: 23.0,),
                    ),
                    ListTile(
                      title: Text('Suporte'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold)),
                      // title: Text('SUPORTE'.toUpperCase(), style: TextStyle(color: Color.fromRGBO(155, 42, 48, 1), fontSize: 17.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold)),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                      trailing: Icon(FontAwesomeIcons.envelopeOpenText, color: Colors.white, size: 23.0,),
                    ),
                    ListTile(
                      title: Text('Sair'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold)),
                      // title: Text('SUPORTE'.toUpperCase(), style: TextStyle(color: Color.fromRGBO(155, 42, 48, 1), fontSize: 17.0, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold)),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                      trailing: Icon(FontAwesomeIcons.signOutAlt, color: Colors.white, size: 25.0,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: receitas.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (BuildContext context) => ReceitaPage(receitas[index]),
                  ),
                );
              },
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        child: Image.asset(
                          "assets/images/receitas/${receitas[index].img}",
                        ),
                        height: 200.0,
                        width: 350,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
                      child: Text(receitas[index].dia, style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                        fontSize: 11.0
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(receitas[index].nome, style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
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
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: OutlineButton(
                              onPressed: () {},
                              borderSide: BorderSide(
                                color: Colors.pink[100]
                              ),
                              child: Text(receitas[index].categoria, style: TextStyle(color: Colors.grey, fontSize: 13.0)),
                            ),
                            height: 20.0,
                          )
                        ],
                      ),
                    )
                  ]
                ),
                borderOnForeground: false,
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