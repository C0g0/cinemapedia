import 'package:cinemapedia/infrastructure/datasources/themoviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este provider es de solo lectura por lo tanto no va a cambiar el repositorio
//en ese orden de ideas este provider es solo para leer la información en el
//repositorio
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(datasource: ThemoviedbDatasource());
});
