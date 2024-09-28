import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider).searchMovies;
  return SearchedMoviesNotifier(searchedMovies: movieRepository, ref: ref);
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final Ref ref;
  final SearchMoviesCallback searchedMovies;
  SearchedMoviesNotifier({required this.searchedMovies, required this.ref})
      : super([]);
  Future<List<Movie>> searchedMoviesByQuery(String query) async {
    final List<Movie> movies = await searchedMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
