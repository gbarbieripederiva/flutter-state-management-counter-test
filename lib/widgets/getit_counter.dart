import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CounterValueNotifier extends ValueNotifier<int> {
  CounterValueNotifier() : super(0);

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }
}

class CounterWithGetIt extends StatelessWidget {
  const CounterWithGetIt({Key? key}) : super(key: key);

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
      ElevatedButton(onPressed: () => GetIt.instance.get<CounterValueNotifier>().decrement(), child: const Text("-"));
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ElevatedButton(onPressed: () => GetIt.instance.get<CounterValueNotifier>().increment(), child: const Text("+"));
}

class DisplayCounter extends StatelessWidget {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var valueNotifier = GetIt.instance.get<CounterValueNotifier>();
    return ValueListenableBuilder<int>(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          return Text(value.toString());
        });
  }
}
