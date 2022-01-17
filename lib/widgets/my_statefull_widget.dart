import 'package:flutter/material.dart';

class MyStateFullWidgetCounter extends StatefulWidget {
  const MyStateFullWidgetCounter({Key? key}) : super(key: key);

  @override
  _MyStateFullWidgetCounterState createState() => _MyStateFullWidgetCounterState();
}

class _MyStateFullWidgetCounterState extends State<MyStateFullWidgetCounter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        ElevatedButton(
            onPressed: () => setState(() {
                  counter--;
                }),
            child: const Text("-")),
        Text(counter.toString()),
        ElevatedButton(
            onPressed: () => setState(() {
                  counter++;
                }),
            child: const Text("+"))
      ],
    ));
  }
}
