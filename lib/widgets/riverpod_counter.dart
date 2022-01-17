import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Parecido a un change notifier
class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

class CounterWithRiverpod extends StatelessWidget {
  const CounterWithRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        DecrementButton(),
        DisplayCounter(),
        IncrementButton(),
      ],
    );
  }
}

class DecrementButton extends ConsumerWidget {
  const DecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).decrement(), child: const Text("-"));
}

class IncrementButton extends ConsumerWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).increment(), child: const Text("+"));
}

class DisplayCounter extends ConsumerWidget {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Text(counter.toString());
  }
}
