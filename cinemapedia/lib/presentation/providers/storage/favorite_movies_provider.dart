import 'package:cinemapedia/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/repositories/local_storage_repository.dart';

final favoriteMoviesProvider = StateNotifierProvider<StorageMovieNotifier, Map<int, Movie>>(
  (ref) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return StorageMovieNotifier(localStorageRepository: localStorageRepository);
  },
);

class StorageMovieNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMovieNotifier({required this.localStorageRepository}) : super({});

  Future<void> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10);
    page++;

    final tempMoviesMap = <int, Movie>{};

    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tempMoviesMap};
  }
}
