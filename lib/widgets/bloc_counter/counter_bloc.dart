import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState {
  final int counter;

  CounterState({this.counter = 0});

  CounterState copyWith({int? counter}) => CounterState(counter: counter ?? this.counter);
}

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<DecrementEvent>((event, emit) => emit(state.copyWith(counter: state.counter - 1)));
    on<IncrementEvent>((event, emit) => emit(state.copyWith(counter: state.counter + 1)));
  }
}
