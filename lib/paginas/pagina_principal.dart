import 'package:flutter/material.dart';
import 'package:pruebas/clases/clase_encines.dart';
import 'package:pruebas/clases/clase_pelicula.dart';
import 'package:pruebas/search/search_delegate.dart';
import 'package:pruebas/paginas/mas_populares.dart';
import 'package:pruebas/paginas/mas_vistas.dart';
import 'package:pruebas/servicios/pelicula_servicio.dart';
import 'package:provider/provider.dart';

class Pagina_Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Movie App'), actions: <Widget>[
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
        child: Consumer<PeliculasEnCinesProvider>(
          builder: (context, value, child) =>
              /* value.peliculasencines == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              :  */
              ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemCount: value.peliculasencines.length,
            itemBuilder: (context, index) => PeliculaWidget(
              pelicula: value.peliculasencines[index],
            ),
          ),
        ),
      ),
    );
  }
}

class PeliculaWidget extends StatelessWidget {
  const PeliculaWidget({Key key, this.pelicula}) : super(key: key);

  final Peliculas_Encines pelicula;

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
                child: FadeInImage(
                  placeholder: AssetImage("lib/assets/cargando.gif"),
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
                        pelicula.image,
                  ),
                )))
      ],
    );
    return GestureDetector(
      child: peli,
      onTap: () {
        Navigator.pushNamed(context, "pruebas/paginas/pagina_detalles.dart",
            arguments: Peliculas_Encines(
                title: pelicula.title,
                image: pelicula.image,
                resumen: pelicula.resumen,
                id: pelicula.id));
      },
    );
  }
}

/* Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder<List<Peliculas_Encines>>(
          future: obtenerPeliculasEncines(),
          builder: (context, snapshot) => snapshot.data == null
              ? snapshot.hasError
                  ? Center(child: Text('Error'))
                  : Center(
                      child: CircularProgressIndicator(),
                    )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder (
                    itemBuilder: (context, index) => PeliculaWidget(
                      titleW: snapshot.data[index].title,
                      imageW: snapshot.data[index].image,
                      idw: snapshot.data[index].id,
                      resumen: snapshot.data[index].resumen,
                    ),
                    itemCount: snapshot.data.length,
                  )),
        ), */
