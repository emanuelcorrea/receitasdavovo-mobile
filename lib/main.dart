import 'package:flutter/material.dart';
import 'package:receitas_vovo/pages/homePage.dart';
import 'package:receitas_vovo/pages/painelPage.dart';
import 'package:receitas_vovo/pages/AddReceitaPage.dart';

void main() => runApp(MyApp());

var rotas = <String, WidgetBuilder> {
  '/' : (context) => HomePage(),
  '/painel' : (context) => PainelPage(),
  '/addReceita' : (context) => AddReceitaPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
