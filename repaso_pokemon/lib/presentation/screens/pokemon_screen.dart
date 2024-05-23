import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_prueba/domain/user/user.dart';
import 'package:pokemon_prueba/presentation/providers/user/users_provider.dart';
import 'package:pokemon_prueba/presentation/views/pokemones/capturados_view.dart';
import 'package:pokemon_prueba/presentation/views/pokemones/pokemones_view.dart';
import 'package:pokemon_prueba/presentation/widgets/drawer/custom_drawer.dart';

class PokemonScreen extends ConsumerWidget {
  static const name = "pokemon-screen";

  final String userid;
  final int selectedView;
  PokemonScreen({
    super.key,
    required this.userid,
    required this.selectedView,
  });

  void onItemTapped(BuildContext context, int selectedMenu) {
    context.go('/home/$userid/pokemones/$selectedMenu');
  }

  final List<Widget> views = [
    const PokemonesView(),
    const CapturadosView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User user = ref.watch(usersProvider.notifier).getById(userid);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemones'),
      ),
      drawer: CustomDrawer(usuario: user),
      body: views[selectedView],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: (selectedMenu) => onItemTapped(context, selectedMenu),
        currentIndex: selectedView,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max), label: 'Pokemones'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label_outline), label: 'Capturados'),
        ],
      ),
    );
  }
}
