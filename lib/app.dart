import 'package:bloc_counter/logic/counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/presentation/view/counter_page.dart';
import 'package:bloc_counter/presentation/view/second_page.dart';
import 'package:bloc_counter/presentation/view/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final CounterBloc _counterBloc = CounterBloc();
  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => BlocProvider.value(value: _counterBloc, child: const CounterPage()),
        "/second": (context) => BlocProvider.value(
              value: _counterBloc,
              child: const SecondPage(name: "Second Page"),
            ),
        "/third": (context) => BlocProvider.value(
              value: _counterBloc,
              child: const ThirdPage(name: "Third Page"),
            ),
      },
    );
  }
}
