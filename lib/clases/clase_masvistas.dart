class Peliculas_masvistas {
  Peliculas_masvistas({this.title, this.image, this.resumen, this.id});

  factory Peliculas_masvistas.fromJson(Map<String, dynamic> jsonotro) {
    final String original_title = jsonotro['original_title'];
    final String poster_path = jsonotro['poster_path'];
    final String resumen = jsonotro["overview"];
    final int id = jsonotro["id"];
    return Peliculas_masvistas(
        title: original_title, image: poster_path, resumen: resumen, id: id);
  }
  final String title;
  final String image;
  final String resumen;
  final int id;
}
