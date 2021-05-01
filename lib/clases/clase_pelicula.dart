import 'package:flutter/cupertino.dart';

class Pelicula {
  Pelicula({this.title, this.image, this.id, this.resumen});

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    final String original_title = json['original_title'];
    final String poster_path = json['poster_path'];
    final int id = json["id"];
    final String resumen = json["overview"];

    return Pelicula(
        title: original_title, image: poster_path, id: id, resumen: resumen);
  }
  final String title;
  final String image;
  final int id;
  final String resumen;
}
