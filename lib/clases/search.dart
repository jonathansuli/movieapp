class PeliculaSearch {
  PeliculaSearch({this.title, this.image, this.resumen, this.id});

  factory PeliculaSearch.fromJson(Map<String, dynamic> jsonsearch) {
    final String original_title = jsonsearch['original_title'];
    final String poster_path = jsonsearch['poster_path'];
    final String resumen = jsonsearch["overview"];
    final int id = jsonsearch["id"];

    return PeliculaSearch(
        title: original_title, image: poster_path, resumen: resumen, id: id);
  }
  final String title;
  final String image;
  final String resumen;
  final int id;
}
