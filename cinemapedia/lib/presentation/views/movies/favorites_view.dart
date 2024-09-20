import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => FavoriteViewState();
}

class FavoriteViewState extends ConsumerState<FavoritesView> {
  bool isLastPAge = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPAge) return;
    isLoading = true;
    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPAge = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoriteMoviesProvider).entries.map((movie) => movie.value).toList();

    if (favoritesMovies.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.favorite_outline_sharp, size: 60),
            const Text('Ohhh no!!', style: TextStyle(fontSize: 30)),
            const Text(
              'No tienes películas favoritas',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            FilledButton(onPressed: () => context.go('/home/0'), child: const Text('Empieza a buscar'))
          ],
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(
        movies: favoritesMovies,
        loadNextPage: loadNextPage,
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
