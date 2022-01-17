// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum CounterActions { Increment, Decrement }

int counterReducer(int state, dynamic action) {
  switch (action) {
    case CounterActions.Increment:
      return state + 1;
    case CounterActions.Decrement:
      return state - 1;
    default:
      return state;
  }
}

class CounterWithRedux extends StatelessWidget {
  const CounterWithRedux({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
        store: Store<int>(counterReducer, initialState: 0),
        child: Row(
          children: const [
            DecrementButton(),
            DisplayCounter(),
            IncrementButton(),
          ],
        ));
  }
}

class DecrementButton extends StatelessWidget {
  const DecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<int, VoidCallback>(
        converter: (store) => (() => store.dispatch(CounterActions.Decrement)),
        builder: (context, callback) => ElevatedButton(onPressed: callback, child: const Text("-")),
      );
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<int, VoidCallback>(
        converter: (store) => (() => store.dispatch(CounterActions.Increment)),
        builder: (context, callback) => ElevatedButton(onPressed: callback, child: const Text("+")),
      );
}

class DisplayCounter extends StatelessWidget {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<int, String>(
        converter: (store) => store.state.toString(),
        builder: (context, counter) => Text(counter),
      );
}
