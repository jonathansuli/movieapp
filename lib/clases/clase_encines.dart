class Peliculas_Encines {
  Peliculas_Encines({this.title, this.image, this.resumen, this.id});

  factory Peliculas_Encines.fromJson(Map<String, dynamic> jsoncines) {
    final String original_title = jsoncines['original_title'];
    final String poster_path = jsoncines['poster_path'];
    final String resumen = jsoncines["overview"];
    final int id = jsoncines["id"];
    return Peliculas_Encines(
        title: original_title, image: poster_path, resumen: resumen, id: id);
  }
  final String title;
  final String image;
  final String resumen;
  final int id;
}
