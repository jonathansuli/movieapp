import 'package:flutter/material.dart';
import 'package:pruebas/clases/clase_pelicula.dart';
import 'package:pruebas/paginas/pagina_detalles.dart';
import 'package:pruebas/paginas/pagina_principal.dart';
import 'package:pruebas/search/search_delegate.dart';
import 'package:pruebas/servicios/pelicula_servicio.dart';
import 'package:provider/provider.dart';

import 'mas_vistas.dart';

class MasPopulares extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Peliculas Mas Populares'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        )
      ]),
      backgroundColor: Colors.black12,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        items: [
          new BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pagina_Principal()));
              },
              icon: Icon(Icons.home),
              color: Colors.blue,
            ),
            title: Text('Home', style: TextStyle(color: Colors.white)),
          ),
          new BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MasPopulares()));
                },
                icon: Icon(Icons.movie),
                color: Colors.blue,
              ),
              title: Text('Populares', style: TextStyle(color: Colors.white))),
          new BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MasVistas()));
              },
              icon: Icon(Icons.movie_outlined),
              color: Colors.blue,
            ),
            title: Text('Mas vistas', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<PopularesProvider>(
          builder: (context, value, child) => value.peliculas == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: value.peliculas.length,
                  itemBuilder: (context, index) => PeliculaWidget(
                    pelicula: value.peliculas[index],
                  ),
                ),
        ),
      ),
    );
  }
}

class PeliculaWidget extends StatelessWidget {
  const PeliculaWidget({Key key, this.pelicula}) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    final peli = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // CircularProgressIndicator(),
        Text(
          pelicula.title,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Hero(
          tag: pelicula.id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
                    pelicula.image),
          ),
        )
      ],
    );
    return GestureDetector(
      child: peli,
      onTap: () {
        Navigator.pushNamed(context, "pruebas/paginas/pagina_detalles.dart",
            arguments: Pelicula(
                title: pelicula.title,
                image: pelicula.image,
                resumen: pelicula.resumen,
                id: pelicula.id));
      },
    );
  }
}
