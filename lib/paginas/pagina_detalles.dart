import 'package:flutter/material.dart';
import 'package:pruebas/clases/clase_pelicula.dart';
import 'package:pruebas/paginas/pagina_principal.dart';
import 'package:pruebas/search/search_delegate.dart';

import 'mas_populares.dart';
import 'mas_vistas.dart';

class PaginaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula peliculasDetalle = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar:
          AppBar(title: Text("${peliculasDetalle.title}"), actions: <Widget>[
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
      body: ListView(
        children: [
          Text(
            peliculasDetalle.title,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Hero(
            tag: peliculasDetalle.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
                    peliculasDetalle.image,
              ),
            ),
          ),
          Text(
            "${peliculasDetalle.resumen}",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
