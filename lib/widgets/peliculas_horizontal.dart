import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.25,
      width: _screenSize.width,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
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

