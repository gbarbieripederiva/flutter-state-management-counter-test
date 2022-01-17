import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterNotifier extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }
}

class CounterWithProvider extends StatelessWidget {
  const CounterWithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterNotifier>(
      create: (context) => CounterNotifier(),
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
      onPressed: () => Provider.of<CounterNotifier>(context, listen: false).decrement(), child: const Text("-"));
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: () => Provider.of<CounterNotifier>(context, listen: false).increment(), child: const Text("+"));
}

class DisplayCounter extends StatelessWidget {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      // Child aca sirve porque le podes pasar un parametro child si tenes una parte que no cambia. Basicamente reusa
      // el widget ese
      Consumer<CounterNotifier>(builder: (context, counter, child) {
        return Text(counter.counter.toString());
      });
}
