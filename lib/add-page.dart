import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerImg = TextEditingController();
  TextEditingController controllerCategoria = TextEditingController();
  TextEditingController controllerPontuacao = TextEditingController();

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
        padding: const EdgeInsets.fromLTRB(5.0, 10, 0 ,0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  controller: controllerNome,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.pink,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                    labelText: "Nome da Receita"),
                ),
              ),
              SizedBox(height: 14.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  controller: controllerCategoria,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.pink,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink,
                        ),
                      ),
                      labelText: "Categorias da Receita"),
                ),
              ),
              SizedBox(height: 14.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  controller: controllerImg,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.pink,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                    labelText: "Nome da Imagem", hintStyle: TextStyle(fontSize: 12.0)),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 70.0, 16.0, 0),
                child: RaisedButton(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "CADASTRAR",
                    style: TextStyle(fontSize: 17.0, color: Colors.white),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
