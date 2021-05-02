import 'package:flutter/material.dart';
import 'package:pruebas/paginas/pagina_detalles.dart';
import 'package:pruebas/paginas/pagina_principal.dart';
import 'package:pruebas/servicios/pelicula_servicio.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PopularesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PeliculasMasvistasProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PeliculasEnCinesProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          initialRoute: "/",
          routes: {
            "/": (BuildContext context) => Pagina_Principal(),
            "pruebas/paginas/pagina_detalles.dart": (BuildContext context) =>
                PaginaDetalle(),
          }),
    );
    //home: Pagina_Principal());
  }
}
