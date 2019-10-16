import 'dart:io';

class Receita {
  String idreceita, nome, img, ingredientes, categoria, preparo, dia, color;
  File imagem;

  Receita();

  Receita.receita(this.idreceita, this.nome, this.img, this.ingredientes, this.categoria, this.preparo, this.dia, this.color, {this.imagem});
}
