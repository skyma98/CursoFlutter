class Counter {
  final int currentValue;
  final int minValue;
  final int maxValue;

  Counter({
    required this.currentValue,
    required this.minValue,
    required this.maxValue,
  });

  Counter copyWith({int? currentValue, int? minValue, int? maxValue}) {
    return Counter(
      currentValue: currentValue ?? this.currentValue,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
    );
  }
}
