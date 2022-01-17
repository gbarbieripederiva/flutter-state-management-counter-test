import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class Counter {
  final int counter;
  Counter(this.counter);
}

@immutable
class ViewModel {
  final counter = RM.inject<Counter>(() => Counter(0));

  decrement() => counter.state = Counter(counter.state.counter - 1);
  increment() => counter.state = Counter(counter.state.counter + 1);
}

final viewModel = ViewModel();

class CounterWithStateRebuilder extends StatelessWidget {
  const CounterWithStateRebuilder({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) => ElevatedButton(onPressed: () => viewModel.decrement(), child: const Text("-"));
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(onPressed: () => viewModel.increment(), child: const Text("+"));
}

class DisplayCounter extends ReactiveStatelessWidget {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(viewModel.counter.state.counter.toString());
  }
}
