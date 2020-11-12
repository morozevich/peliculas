class Pelicula {
  String title;
  int id;
  String posterPath;

  Pelicula({this.id, this.title, this.posterPath});

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.posterPath = json['poster_path'];
  }

  getPosterImg() {
    if (posterPath == null) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}

class Peliculas {
  List<Pelicula> items = List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    }
    for (final map in jsonList) {
      items.add(Pelicula.fromJsonMap(map));
    }
  }
}
