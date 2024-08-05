import 'package:bloc_counter/counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/counter/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter using Bloc',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, counter) {
          return Center(
            child: Text(
              "$counter",
              style: const TextStyle(fontSize: 100.0),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrementPressed());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrementPressed());
              },
            ),
          ),
        ],
      ),
    );
  }
}
