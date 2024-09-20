import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/bloc/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  void IncreaseCounterBy(BuildContext context, int value) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+3'),
            onPressed: () {
              IncreaseCounterBy(context, 3);
            },
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () {
              IncreaseCounterBy(context, 2);
            },
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+1'),
            onPressed: () {
              IncreaseCounterBy(context, 1);
            },
          )
        ],
      ),
    );
  }
}
