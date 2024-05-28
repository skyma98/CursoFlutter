import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_prueba/domain/user/user.dart';
import 'package:pokemon_prueba/presentation/providers/user/user_login_provider.dart';

class CustomDrawer extends ConsumerWidget {
  final User usuario;
  const CustomDrawer({super.key, required this.usuario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 24,
                bottom: 24,
              ),
              color: Colors.redAccent.shade400,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(usuario.imageUrl),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${usuario.name} ${usuario.lastName}',
                    style: textTheme.titleLarge!.copyWith(
                        color: const Color.fromARGB(255, 235, 230, 230)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    usuario.email,
                    style: textTheme.bodyMedium!.copyWith(
                        color: const Color.fromARGB(255, 235, 230, 230)),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 16,
                children: [
                  ListTile(
                    title: const Text('Pokemones'),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      context.push('/home/${usuario.uuid}/pokemones/0');
                    },
                  ),
                  ListTile(
                    title: const Text('Contador'),
                    leading: const Icon(Icons.plus_one),
                    onTap: () {
                      context.push('/home/${usuario.uuid}/counter');
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text('Cerrar sesión'),
                    onTap: () {
                      context.go('/');
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
