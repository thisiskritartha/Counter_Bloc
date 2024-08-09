import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/counter/bloc/counter_bloc.dart';

class ThirdPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> thirdKey = GlobalKey<ScaffoldState>();
  final String name;
  ThirdPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: thirdKey,
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(
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
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Counter Incremented Third"),
                    duration: Duration(milliseconds: 100),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
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
              heroTag: "$name first",
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrementPressed());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: FloatingActionButton(
              heroTag: Text("$name second"),
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
