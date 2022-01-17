import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';

class CounterWithCommands extends StatelessWidget {
  final Command<int, int> setCounter = Command.createSync((x) => x, 0);

  CounterWithCommands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(onPressed: () => setCounter(setCounter.value - 1), child: const Text("-")),
        ValueListenableBuilder(
            valueListenable: setCounter,
            builder: (context, value, child) {
              return Text(value.toString());
            }),
        ElevatedButton(onPressed: () => setCounter(setCounter.value + 1), child: const Text("+")),
      ],
    );
  }
}
