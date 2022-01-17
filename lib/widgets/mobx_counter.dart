import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'mobx_counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }
}

class CounterWithMobX extends StatelessWidget {
  final Counter counter = Counter();

  CounterWithMobX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(onPressed: counter.decrement, child: Text("-")),
        Observer(builder: (_) {
          return Text(counter.value.toString());
        }),
        ElevatedButton(onPressed: counter.increment, child: Text("+")),
      ],
    );
  }
}
