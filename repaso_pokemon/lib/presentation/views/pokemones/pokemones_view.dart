import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/presentation/providers/user/user_login_provider.dart';
import 'package:pokemon_prueba/presentation/widgets/horizontalListview/horizontal_listview.dart';

class PokemonesView extends ConsumerWidget {
  const PokemonesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userLoginProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    HorizontalListview(
                        userId: userId,
                        items: const [],
                        title: 'Fuego',
                        loadNextPage: () {}),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
