import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula.dart';
import 'package:peliculas/providers/peliculas_provider.dart';
import 'package:peliculas/widgets/card_swiper.dart';

class PeliculasCardSwiper extends StatelessWidget {
  const PeliculasCardSwiper({
    Key key,
    @required this.peliculasProvider,
  }) : super(key: key);

  final PeliculasProvider peliculasProvider;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 300.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return CardSwiper(peliculas: snapshot.data);
      },
    );
  }
}
