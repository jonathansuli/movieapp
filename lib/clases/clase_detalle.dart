class PeliculasDetalle {
  PeliculasDetalle({this.title, this.image, this.id});

  factory PeliculasDetalle.fromJson(Map<String, dynamic> jsondetalle) {
    final String original_title = jsondetalle['original_title'];
    final String poster_path = jsondetalle['poster_path'];
    final int idpeli = jsondetalle["id"];

    return PeliculasDetalle(
        title: original_title, image: poster_path, id: idpeli);
  }
  final String title;
  final String image;
  final int id;
}
