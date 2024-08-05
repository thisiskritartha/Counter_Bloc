import 'package:bloc_counter/counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/counter/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
  }
}
