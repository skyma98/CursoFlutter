import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_prueba/domain/counter/counter.dart';

final counterProvider =
    StateNotifierProvider<CounterNotifier, Map<String, Counter>>(
  (ref) {
    return CounterNotifier();
  },
);

class CounterNotifier extends StateNotifier<Map<String, Counter>> {
  CounterNotifier() : super({});

  void incrementar(String userId) {
    Counter counter;

    final copyState = {...state};
    if (state[userId] == null) {
      counter = Counter(currentValue: 1, maxValue: 1, minValue: 0);
    } else {
      final currentValInc = state[userId]!.currentValue + 1;
      counter = state[userId]!.copyWith(
          currentValue: currentValInc,
          maxValue: (currentValInc > state[userId]!.maxValue
              ? currentValInc
              : state[userId]!.maxValue));

      copyState.remove(userId);
    }

    state = {...copyState, userId: counter};
  }

//hacer
  void decrementar(String userId) {
    Counter counter;

    final copyState = {...state};
    if (state[userId] == null) {
      counter = Counter(currentValue: -1, maxValue: 0, minValue: -1);
    } else {
      final currentValDec = state[userId]!.currentValue - 1;
      counter = state[userId]!.copyWith(
          currentValue: currentValDec,
          minValue: (currentValDec < state[userId]!.minValue
              ? currentValDec
              : state[userId]!.minValue));

      copyState.remove(userId);
    }

    state = {...copyState, userId: counter};
  }

  void resetear(String userId) {
    Counter counter;

    final copyState = {...state};
    if (state[userId] == null) {
      counter = Counter(currentValue: 0, maxValue: 0, minValue: 0);
    } else {
      counter = state[userId]!.copyWith(currentValue: 0);

      copyState.remove(userId);
    }

    state = {...copyState, userId: counter};
  }

  void resetearTodo(String userId) {
    Counter counter;

    final copyState = {...state};
    if (state[userId] == null) {
      counter = Counter(currentValue: 0, maxValue: 0, minValue: 0);
    } else {
      counter =
          state[userId]!.copyWith(currentValue: 0, maxValue: 0, minValue: 0);

      copyState.remove(userId);
    }

    state = {...copyState, userId: counter};
  }
}
