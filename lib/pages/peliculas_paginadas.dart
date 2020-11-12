import 'package:flutter/material.dart';
import 'package:peliculas/providers/peliculas_provider.dart';
import 'package:peliculas/widgets/peliculas_horizontal.dart';

class PeliculasPaginadas extends StatelessWidget {
  final PeliculasProvider peliculasProvider;

  const PeliculasPaginadas({
    @required this.peliculasProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text('Populares...'),
          ),
          SizedBox(height: 8),
          FutureBuilder(
            future: peliculasProvider.getPopulares(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return MovieHorizontal(peliculas: snapshot.data);
            },
          )
        ],
      ),
    );
  }
}
