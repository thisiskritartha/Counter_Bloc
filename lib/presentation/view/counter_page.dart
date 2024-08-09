import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/counter/bloc/counter_bloc.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state.isIncremented!) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Counter Incremented"),
                    duration: Duration(milliseconds: 100),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Counter Decremented"),
                    duration: Duration(milliseconds: 100),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: Text(
                  "${state.count}",
                  style: const TextStyle(fontSize: 100.0),
                ),
              );
            },
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/second");
            },
            color: Colors.redAccent,
            child: const Text("Second screen"),
          ),
          const SizedBox(
            height: 24,
          ),
          MaterialButton(
            color: Colors.greenAccent,
            onPressed: () {
              Navigator.of(context).pushNamed("/third");
            },
            child: const Text('Third Screen'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: FloatingActionButton(
              heroTag: const Text("Counter first"),
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrementPressed());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: FloatingActionButton(
              heroTag: const Text("Counter second"),
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
