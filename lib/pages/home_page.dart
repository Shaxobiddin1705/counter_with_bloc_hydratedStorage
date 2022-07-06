import 'dart:developer';

import 'package:counter_with_bloc/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('State is build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if(state is IncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Successfully increased'), duration: Duration(milliseconds: 500),)
                );
              } else if(state is DecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Successfully decreased'), duration: Duration(milliseconds: 500),)
                );
              }
            },
            builder: (context, state) {
              return Text('Counter value: ${state.counterValue}', style: const TextStyle(fontSize: 18),);
            },
          ),

          const SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ElevatedButton.icon(
                  onPressed: () => context.read<CounterBloc>().add(CounterDecrementEvent()),
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrease'),
                ),

                ElevatedButton.icon(
                  onPressed: () => context.read<CounterBloc>().add(CounterIncrementEvent()),
                  icon: const Icon(Icons.add),
                  label: const Text('Increase'),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
