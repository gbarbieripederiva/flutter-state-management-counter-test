import 'package:flutter/material.dart';

class InheritedCounter extends InheritedWidget {
  final int counter;
  final VoidCallback increment;
  final VoidCallback decrement;

  const InheritedCounter({
    required this.counter,
    required this.increment,
    required this.decrement,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedCounter oldWidget) =>
      counter != oldWidget.counter;

  static InheritedCounter? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
}

class MyInheritedWidgetCounter extends StatefulWidget {
  const MyInheritedWidgetCounter({Key? key}) : super(key: key);

  @override
  State<MyInheritedWidgetCounter> createState() =>
      _MyInheritedWidgetCounterState();
}

class _MyInheritedWidgetCounterState extends State<MyInheritedWidgetCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
      counter: count,
      decrement: () => setState(() => count--),
      increment: () => setState(() => count++),
      child: Row(
        children: const [
          DecrementButton(),
          DisplayCounter(),
          IncrementButton(),
        ],
      ),
    );
  }
}

class DecrementButton extends StatelessWidget {
  const DecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: () => InheritedCounter.of(context)?.decrement(),
      child: const Text("-"));
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: () => InheritedCounter.of(context)?.increment(),
      child: const Text("+"));
}

class DisplayCounter extends StatelessWidget {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Text(InheritedCounter.of(context)?.counter.toString() ?? "");
}
