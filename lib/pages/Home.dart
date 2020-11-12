import 'package:flutter/material.dart';
import 'package:peliculas/pages/peliculas_card_swiper.dart';
import 'package:peliculas/pages/peliculas_paginadas.dart';
import 'package:peliculas/providers/peliculas_provider.dart';

class Home extends StatelessWidget {
  final peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PeliculasCardSwiper(
            peliculasProvider: peliculasProvider,
          ),
          PeliculasPaginadas(
            peliculasProvider: peliculasProvider,
          ),
        ],
      ),
    );
  }
}
