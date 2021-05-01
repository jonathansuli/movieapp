import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pruebas/clases/clase_encines.dart';
import 'package:pruebas/clases/clase_pelicula.dart';
import 'package:pruebas/clases/clase_masvistas.dart';
import 'package:pruebas/clases/search.dart';

/* Future<List<Pelicula>> obtenerPeliculas() async {
  try {
    var response = await Dio().get(
        'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES&page=1');

    final json = response.data['results'];
    var listadoPeliculas =
        json.map((peliculaJson) => Pelicula.fromJson(peliculaJson)).toList();

    return List<Pelicula>.from(listadoPeliculas);
  } catch (e) {
    return [];
  }
} */

Future<List<PeliculaSearch>> obtenerPeliculasSearch(String query) async {
  try {
    var response = await Dio().get(
        'https://api.themoviedb.org/3/search/movie?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES&query=$query&page=1&include_adult=false');

    final jsonsearch = response.data['results'];
    var listadoPeliculasok = jsonsearch
        .map((peliculaJsonotros) => PeliculaSearch.fromJson(peliculaJsonotros))
        .toList();

    return List<PeliculaSearch>.from(listadoPeliculasok);
  } catch (e) {
    return [];
  }
}

/* Future<List<Peliculas_masvistas>> obtenerPeliculasMasvistas() async {
  try {
    var response = await Dio().get(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES&page=1');

    final jsonotro = response.data['results'];
    var listadoPeliculasMasvistas = jsonotro
        .map((peliculaJsonotro) =>
            Peliculas_masvistas.fromJson(peliculaJsonotro))
        .toList();

    return List<Peliculas_masvistas>.from(listadoPeliculasMasvistas);
  } catch (e) {
    return [];
  }
}
 */
/* Future<List<Peliculas_Encines>> obtenerPeliculasEncines() async {
  try {
    var response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES&page=1');

    final jsoncines = response.data['results'];
    var listadoPeliculasEncines = jsoncines
        .map((peliculaJsonencines) =>
            Peliculas_Encines.fromJson(peliculaJsonencines))
        .toList();

    return List<Peliculas_Encines>.from(listadoPeliculasEncines);
  } catch (e) {
    return [];
  }
} */

class PopularesProvider extends ChangeNotifier {
  List<Pelicula> _peliculas = [];

  List<Pelicula> get peliculas => _peliculas;

  void setPeliculas(List<Pelicula> peliculas) {
    _peliculas = peliculas;
    notifyListeners();
  }

  PopularesProvider() {
    obtenerPopulares();
  }

  Future<List<Pelicula>> obtenerPopulares() async {
    try {
      var response = await Dio().get(
          'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES&page=1');

      final json = response.data['results'];
      var listadoPeliculas =
          json.map((peliculaJson) => Pelicula.fromJson(peliculaJson)).toList();

      var listPeliculas = List<Pelicula>.from(listadoPeliculas);
      setPeliculas(listPeliculas);
      return listPeliculas;
    } catch (e) {
      return [];
    }
  }
}

class PeliculasEnCinesProvider extends ChangeNotifier {
  List<Peliculas_Encines> _peliculasencines = [];

  List<Peliculas_Encines> get peliculasencines => _peliculasencines;

  void setPeliculas(List<Peliculas_Encines> peliculasencines) {
    _peliculasencines = peliculasencines;
    notifyListeners();
  }

  PeliculasEnCinesProvider() {
    obtenerPeliculasEncines();
  }

  Future<List<Peliculas_Encines>> obtenerPeliculasEncines() async {
    try {
      var response = await Dio().get(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES&page=1');

      final jsoncines = response.data['results'];
      var listadoPeliculasencines = jsoncines
          .map((peliculaJsonencines) =>
              Peliculas_Encines.fromJson(peliculaJsonencines))
          .toList();

      var listPeliculasencines =
          List<Peliculas_Encines>.from(listadoPeliculasencines);
      setPeliculas(listPeliculasencines);
      return listPeliculasencines;
    } catch (e) {
      return [];
    }
  }
}

class PeliculasMasvistasProvider extends ChangeNotifier {
  List<Peliculas_masvistas> _peliculasmasvistas = [];

  List<Peliculas_masvistas> get peliculasmasvistas => _peliculasmasvistas;

  void setPeliculas(List<Peliculas_masvistas> peliculasmasvistas) {
    _peliculasmasvistas = peliculasmasvistas;
    notifyListeners();
  }

  PeliculasMasvistasProvider() {
    obtenerPeliculasMasvistas();
  }
  Future<List<Peliculas_masvistas>> obtenerPeliculasMasvistas() async {
    try {
      var response = await Dio().get(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES&page=1');

      final jsonotro = response.data['results'];
      var listadoPeliculasmasvistas = jsonotro
          .map((peliculaJsonmasvistas) =>
              Peliculas_masvistas.fromJson(peliculaJsonmasvistas))
          .toList();

      var listPeliculasmasvistas =
          List<Peliculas_masvistas>.from(listadoPeliculasmasvistas);
      setPeliculas(listPeliculasmasvistas);
      return listadoPeliculasmasvistas;
    } catch (e) {
      return [];
    }
  }
}
/* 
class PeliculasSearchProvider extends ChangeNotifier {
  List<PeliculaSearch> _peliculasearch = [];

  List<PeliculaSearch> get peliculasearch => _peliculasearch;

  void setPeliculas(List<PeliculaSearch> peliculasearch) {
    _peliculasearch = peliculasearch;
    notifyListeners();
  }

  PeliculasSearchProvider() {
    obtenerPeliculasSearch();
  }

  Future<List<Peliculas_masvistas>> obtenerPeliculasMasvistas() async {
    try {
      var response = await Dio().get(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES&page=1');

      final jsonotro = response.data['results'];
      var listadoPeliculasmasvistas = jsonotro
          .map((peliculaJsonmasvistas) =>
              Peliculas_masvistas.fromJson(peliculaJsonmasvistas))
          .toList();

      var listPeliculasmasvistas =
          List<Peliculas_masvistas>.from(listadoPeliculasmasvistas);
      setPeliculas(listPeliculasmasvistas);
      return listadoPeliculasmasvistas;
    } catch (e) {
      return [];
    }
  }
}
 */
