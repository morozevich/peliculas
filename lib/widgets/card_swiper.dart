import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/models/pelicula.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Swiper(
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5,
        itemBuilder: (BuildContext context, int index) => ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: FadeInImage(
            image: NetworkImage(peliculas[index].getPosterImg()),
            placeholder: AssetImage('assets/images/no-image.jpg'),
            fit: BoxFit.cover,
          )
        ),
        itemCount: this.peliculas.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
