import 'package:flutter/material.dart';
import 'package:pruebas/clases/clase_pelicula.dart';
import 'package:pruebas/servicios/pelicula_servicio.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final peliculasProvider = new Pelicula();
  DataSearch() : super(searchFieldLabel: "Busca una pelicula...");
  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if (query.isEmpty) {
      return Container();
    } else
      return FutureBuilder(
        future: obtenerPeliculasSearch(query),
        builder: (context, snapshot) => snapshot.data == null
            ? snapshot.hasError
                ? Center(child: Text('Error'))
                : Center(
                    child: CircularProgressIndicator(),
                  )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => PeliculaWidgetSearch(
                    titleW: snapshot.data[index].title,
                    imageW: snapshot.data[index].image,
                    resumen: snapshot.data[index].resumen,
                    idw: snapshot.data[index].id,
                  ),
                  itemCount: snapshot.data.length,
                )),
      );
  }
}

class PeliculaWidgetSearch extends StatelessWidget {
  const PeliculaWidgetSearch({
    Key key,
    this.titleW,
    this.imageW,
    this.idw,
    this.resumen,
  }) : super(key: key);

  final String titleW;
  final String imageW;
  final int idw;
  final String resumen;

  @override
  Widget build(BuildContext context) {
    final peli = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (imageW != null)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: FadeInImage(
                      placeholder: AssetImage("lib/assets/cargando.gif"),
                      image: NetworkImage(
                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2' +
                            imageW,
                      ),
                      height: 50,
                      width: 40))
              : SizedBox(),
          Text(
            titleW,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
    );

    return GestureDetector(
      child: peli,
      onTap: () {
        if (resumen != null) {
          Navigator.pushNamed(context, "pruebas/paginas/pagina_detalles.dart",
              arguments: Pelicula(
                  title: titleW, image: imageW, resumen: resumen, id: idw));
        }
      },
    );
  }
}
