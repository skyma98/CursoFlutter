import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_prueba/presentation/providers/user/user_login_provider.dart';
import 'package:pokemon_prueba/presentation/providers/user/users_provider.dart';

class LoginScreen extends ConsumerWidget {
  static const name = "LoginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users =
        ref.watch(usersProvider).entries.map((value) => value.value).toList();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return ListTile(
                    onTap: () {
                      final String id = user.uuid;
                      ref.read(userLoginProvider.notifier).state = id;
                      context.go('/home/$id/pokemones/0');
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.imageUrl),
                    ),
                    title: Text('${user.name} ${user.lastName}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final usuario = await ref.read(usersProvider.notifier).addUser();

          ref.read(userLoginProvider.notifier).state = usuario.uuid;

          if (context.mounted) context.go('/home/${usuario.uuid}/pokemones/0');
        },
        child: const Text("Login"),
      ),
    );
  }
}
