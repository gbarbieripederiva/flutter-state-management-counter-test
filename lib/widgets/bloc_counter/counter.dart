import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tests/widgets/bloc_counter/counter_bloc.dart';

class CounterWithBloc extends StatelessWidget {
  const CounterWithBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
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
      onPressed: () => BlocProvider.of<CounterBloc>(context).add(DecrementEvent()), child: const Text("-"));
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: () => BlocProvider.of<CounterBloc>(context).add(IncrementEvent()), child: const Text("+"));
}

class DisplayCounter extends StatelessWidget {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CounterBloc, CounterState>(builder: (context, state) => Text(state.counter.toString()));
}
