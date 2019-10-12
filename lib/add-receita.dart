import 'package:flutter/material.dart';

class AddReceita extends StatefulWidget {
  @override
  _AddReceitaState createState() => _AddReceitaState();
}

class _AddReceitaState extends State<AddReceita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Receita'),
        centerTitle: true,
      ),
    );
  }
}