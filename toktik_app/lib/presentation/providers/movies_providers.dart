import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  return MoviesNotifier();
});

class MoviesNotifier extends StateNotifier<List<MoviesNotifier>> {
  int currentPage = 0;
  MoviesNotifier() : super([]);
  Future<void> loadNextPage() async {
    currentPage++;
  }
}
