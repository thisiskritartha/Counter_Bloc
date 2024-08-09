import 'package:flutter/material.dart';

import '../view/counter_page.dart';
import '../view/second_page.dart';
import '../view/third_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => CounterPage(),
        );

      case "/second":
        return MaterialPageRoute(
          builder: (_) => SecondPage(name: "Second Page"),
        );

      case "/third":
        return MaterialPageRoute(
          builder: (_) => ThirdPage(name: "Third Page"),
        );

      default:
        return null;
    }
  }
}
