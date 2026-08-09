import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counterbloc/counter_bloc.dart';
import '../counterbloc/counter_event.dart';
import '../counterbloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter App'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {

          if (state is IncrementState && state.counter == 10) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Maximum limit reached'),
              ),
            );
          }

          if (state is ResetState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter reset to 0'),
              ),
            );
          }

          if (state is IncrementState && state.counter == 10) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Maximum limit reached'),
              ),
            );
          }
        },

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Counter Circle
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${state.counter}',
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              const Text(
                'Current Count',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 30),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Increment
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(
                        Increment(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(65, 60),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 35,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Decrement
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(
                        Decrement(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(65, 60),
                    ),
                    child: const Icon(
                      Icons.remove,
                      size: 35,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Reset
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(
                        Reset(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(65, 60),
                    ),
                    child: const Icon(
                      Icons.refresh,
                      size: 35,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Maximum Limit
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Maximum Limit: 10',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}