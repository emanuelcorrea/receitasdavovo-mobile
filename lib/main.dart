import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receitas_vovo/views/homePage.dart';
import 'package:receitas_vovo/views/painelPage.dart';
import 'package:receitas_vovo/views/AddReceitaPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  
  runApp(MyApp());
}

var rotas = <String, WidgetBuilder> {
  '/' : (context) => HomePage(),
  '/painel' : (context) => PainelPage(),
  '/addReceita' : (context) => AddReceitaPage(),
};


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    
    return MaterialApp(
      title: 'Receitas da Vovó',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: rotas,
      debugShowCheckedModeBanner: false,
    );
  }
}
