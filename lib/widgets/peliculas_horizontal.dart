import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;
  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 150) {
        siguientePagina();
      }
    });
    return Container(
      height: _screenSize.height * 0.25,
      width: _screenSize.width,
      child: PageView(
        pageSnapping: false,
        controller: _pageController,
        children: _getTarjetas(),
      ),
    );
  }

  List<Widget> _getTarjetas() {
    return peliculas.map((e) {
      return Container(
        margin: EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: FadeInImage(
                image: NetworkImage(e.getPosterImg()),
                placeholder: AssetImage('assets/images/no-image.jpg'),
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            SizedBox(height: 2,),
            Text(e.title, overflow: TextOverflow.ellipsis,)
          ],
        ),
      );
    }).toList();
  }
}

