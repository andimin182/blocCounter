import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Create EVENT
@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncrementEvent extends CounterEvent {
  const IncrementEvent() : super();

  @override
  List<Object?> get props => [];
}

class DecrementEvent extends CounterEvent {
  const DecrementEvent() : super();

  @override
  List<Object?> get props => [];
}

// Create State
@immutable
class CounterState extends Equatable {
  final int value;

  const CounterState({required this.value});
  @override
  List<Object?> get props => [value];
}

// Create BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(value: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(value: state.value + 1));
    });
    on<DecrementEvent>(
      (event, emit) {
        emit(CounterState(value: state.value - 1));
      },
    );
  }
}
