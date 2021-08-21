import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            height: 210.0,
            child: DrawerHeader(
              child: Column(
                children: <Widget>[
                  Container(
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
                  Divider(color: Color.fromRGBO(255, 255, 255, 0.9)),
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
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
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
    );
  }
}