import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/domain/counter/counter.dart';

final counterProvider = StateNotifierProvider<CounterNotifier, Counter>(
  (ref) {
    return CounterNotifier();
  },
);

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter(currentValue: 0, minValue: 0, maxValue: 0));

  void incrementar() {
    final currentValInc = state.currentValue + 1;
    final copyState = state.copyWith(
      currentValue: currentValInc,
      maxValue:
          (currentValInc > state.maxValue ? currentValInc : state.maxValue),
    );

    state = copyState;
  }

  void decrementar() {
    final currentValDec = state.currentValue - 1;
    final copyState = state.copyWith(
      currentValue: currentValDec,
      minValue:
          (currentValDec < state.minValue ? currentValDec : state.minValue),
    );

    state = copyState;
  }

  void resetear() {
    state = state.copyWith(currentValue: 0);
  }

  void resetearTodo() {
    state = state.copyWith(currentValue: 0, minValue: 0, maxValue: 0);
  }
}
