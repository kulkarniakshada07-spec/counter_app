class CounterState {
  final int counter;
  const CounterState(this.counter);
}

class InitialState extends CounterState {
  const InitialState() : super(0);
}

class IncrementState extends CounterState{
  const IncrementState(int counter) : super(counter);
}

class DecrementState extends CounterState {
  const DecrementState(int counter) : super(counter);
}

class ResetState extends CounterState {
  const ResetState() : super(0);
}