import 'package:binder/binder.dart';
import 'package:flutter/material.dart';

final counterRef = StateRef(0);

class CounterLogic with Logic {
  @override
  Scope scope;

  CounterLogic(this.scope);

  void decrement() => write(counterRef, read(counterRef) - 1);
  void increment() => write(counterRef, read(counterRef) + 1);
}

final counterViewLogic = LogicRef((scope) => CounterLogic(scope));

class CounterWithBinder extends StatelessWidget {
  const CounterWithBinder({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => context.use(counterViewLogic).decrement(), child: const Text("-"));
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => context.use(counterViewLogic).increment(), child: const Text("+"));
  }
}

class DisplayCounter extends StatelessWidget {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = context.watch(counterRef);
    return Text(counter.toString());
  }
}
