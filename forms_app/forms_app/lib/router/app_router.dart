import 'package:forms_app/presentation/screen/bloc_counter_screen.dart';
import 'package:forms_app/presentation/screen/cubit_counter_Screen.dart';
import 'package:forms_app/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen(),
    ),
    GoRoute(
      path: '/counter-bloc',
      builder: (context, state) => const BlocCounterScreen(),
    )
  ],
);
