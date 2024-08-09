import 'package:bloc_counter/logic/counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        //[Named Routing]//
        // routes: {
        //   "/": (context) => BlocProvider.value(value: _counterBloc, child: const CounterPage()),
        //   "/second": (context) => BlocProvider.value(
        //         value: _counterBloc,
        //         child: const SecondPage(name: "Second Page"),
        //       ),
        //   "/third": (context) => BlocProvider.value(
        //         value: _counterBloc,
        //         child: const ThirdPage(name: "Third Page"),
        //       ),
        // },

        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
