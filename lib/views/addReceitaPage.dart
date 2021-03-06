import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:http/http.dart' as http;

class AddReceitaPage extends StatefulWidget {
  @override
  _AddReceitaPageState createState() => _AddReceitaPageState();
}

class _AddReceitaPageState extends State<AddReceitaPage> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerImg = TextEditingController();
  TextEditingController controllerCategoria = TextEditingController();
  TextEditingController controllerPontuacao = TextEditingController();

 void abrirImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150.0,
          color: Colors.pink,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text('Escolha uma imagem', style: TextStyle(color: Colors.white)),
              SizedBox(height: 10.0),
              FlatButton(
                onPressed: () {
                  pegarImagem(context, ImageSource.camera);
                },
                child: Text('Usar a camêra!', style: TextStyle(color: Colors.white)),
              ),
              FlatButton(
                onPressed: () {
                  pegarImagem(context, ImageSource.gallery);
                },
                child: Text('Pegar da galeria!', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  void pegarImagem(BuildContext context, ImageSource src) {
    ImagePicker.pickImage(source: src, maxWidth: 400.0).then(
      (File img) {
        Navigator.pop(context);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Receita"),
        flexibleSpace: Image(
          image: AssetImage('assets/images/bg2.png'),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10.0),
              Column(
                children: <Widget>[
                  Container(
                    width: 170.0,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 170.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  controller: controllerNome,
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.pink,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      )
                    ),
                    labelText: "Nome da Receita",
                    hintText: 'Digite o nome da receita...'
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  controller: controllerCategoria,
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.pink,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      )
                    ),
                    labelText: "Categoria da Receita",
                    hintText: 'Ex: Milkshake',
                    hintStyle: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 15.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    )
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Ingredientes', style: TextStyle(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(FontAwesomeIcons.plus, color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    )
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Modo de Preparo', style: TextStyle(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(FontAwesomeIcons.plus, color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  onPressed: () {
                    abrirImagePicker(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.photo_camera),
                      SizedBox(width: 10.0),
                      Text('Escolha uma imagem!')
                    ],
                  ),
                  borderSide: BorderSide(
                    color: Colors.pink,
                  ),
                  textColor: Colors.pinkAccent,
                  highlightedBorderColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 50.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/bg2.png",
                      ),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    )
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "CADASTRAR",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
