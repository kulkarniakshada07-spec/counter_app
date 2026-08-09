import 'package:count_proj/counterbloc/counter_event.dart';
import 'package:count_proj/counterbloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent , CounterState>{
  CounterBloc() : super(InitialState()){
    on<Increment>((event, emit) {
      if(state.counter < 10){
        emit(IncrementState(state.counter + 1));
      }
    });
    on<Decrement>((event, emit) {
      if(state.counter > 0){
        emit(IncrementState(state.counter - 1));
      }
    });
    on<Reset>((event, emit){
      emit (const ResetState());
    });
  }
}