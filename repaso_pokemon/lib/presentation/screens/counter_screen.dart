import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/presentation/providers/counter/counter_provider.dart';
import 'package:pokemon_prueba/presentation/providers/user/user_login_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = "counter-screen";

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final textTheme = Theme.of(context).textTheme;
    final userid = ref.read(userLoginProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Strike'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter[userid] == null
                  ? '0'
                  : counter[userid]!.currentValue.toString(),
              style: textTheme.titleLarge!.copyWith(fontSize: 120),
            ),
            Text(
              'Max value: ${counter[userid] == null ? '0' : counter[userid]!.maxValue} ',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text(
                'Min value: ${counter[userid] == null ? '0' : counter[userid]!.minValue} ',
                style: textTheme.bodyLarge)
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn0",
            onPressed: () {
              ref.read(counterProvider.notifier).resetearTodo(userid);
            },
            child: const Icon(Icons.delete_outline),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              ref.read(counterProvider.notifier).resetear(userid);
            },
            child: const Icon(Icons.refresh_outlined),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              ref.read(counterProvider.notifier).decrementar(userid);
            },
            child: const Icon(Icons.exposure_minus_1_outlined),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "btn3",
            onPressed: () {
              ref.read(counterProvider.notifier).incrementar(userid);
            },
            child: const Icon(Icons.plus_one_outlined),
          ),
        ],
      ),
    );
  }
}
