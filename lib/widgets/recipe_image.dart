import 'package:flutter/material.dart';

class RecipeImage extends StatefulWidget {
  @override
  _RecipeImageState createState() => _RecipeImageState();
}

class _RecipeImageState extends State<RecipeImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromRGBO(50, 50, 50, .5), Color.fromRGBO(50, 50, 50, .6)]),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .5),
            offset: Offset(5.0, 2.0),
            blurRadius: 10.0
          )
        ]
      ),
      child: SizedBox(
        child: Image.asset(
          "assets/images/receitas/${widget.receita.img}",
        ),
      ),
    );
  }
}