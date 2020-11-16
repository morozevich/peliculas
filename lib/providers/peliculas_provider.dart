import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/pelicula.dart';

class PeliculasProvider {

  String _apiKey = '1865f43a0549ca50d341dd9ab8b29f49';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage = 0;
  List<Pelicula> peliculas = List();
  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;
  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController.close();
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language
    });
    final resp = await http.get(url);
    final dataMap = json.decode(resp.body);
    final peliculas = Peliculas.fromJsonList(dataMap['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getPopulares() async {
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });
    final resp = await http.get(url);
    final dataMap = json.decode(resp.body);
    final _resp = Peliculas.fromJsonList(dataMap['results']);
    peliculas.addAll(_resp.items);
    popularesSink(peliculas);
    return _resp.items;
  }
}