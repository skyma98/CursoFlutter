import 'package:go_router/go_router.dart';
import 'package:pokemon_prueba/presentation/screens/counter_screen.dart';
import 'package:pokemon_prueba/presentation/screens/login_screen.dart';
import 'package:pokemon_prueba/presentation/screens/pokemon_screen.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/login",
      name: LoginScreen.name,
      builder: (context, state) {
        return const LoginScreen();
      },
      routes: const [],
    ),
    GoRoute(
      path: "/home/:userid/counter",
      name: CounterScreen.name,
      builder: (context, state) {
        return const CounterScreen();
      },
    ),
    GoRoute(
      path: "/home/:userid/pokemones/:index",
      name: PokemonScreen.name,
      builder: (context, state) {
        final index = state.pathParameters["index"]!;
        return PokemonScreen(selectedView: int.tryParse(index)!);
      },
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/login',
    )
  ],
);
