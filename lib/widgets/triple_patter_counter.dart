import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CounterStreamStore extends StreamStore<Exception, int> {
  CounterStreamStore() : super(0);

  void decrement() async {
    setLoading(true);
    await Future.delayed(Duration(milliseconds: 500));
    if (state - 1 < 0) {
      setError(Exception("invalid"));
    } else {
      update(state - 1);
    }
    setLoading(false);
  }

  void increment() => update(state + 1);
}

final counterStore = CounterStreamStore();

class CounterWithTriplePattern extends StatelessWidget {
  const CounterWithTriplePattern({Key? key}) : super(key: key);

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

class DecrementButton extends StatelessWidget {
  const DecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ElevatedButton(onPressed: () => counterStore.decrement(), child: const Text("-"));
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ElevatedButton(onPressed: () => counterStore.increment(), child: const Text("+"));
}

class DisplayCounter extends StatelessWidget {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScopedBuilder(
        store: counterStore,
        onError: (context, error) => Text("e"),
        onState: (context, state) => Text(state.toString()),
        onLoading: (context) => Text("L"),
      );
}
