import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../utils/extensions/extensions.dart';
import 'route_transitions.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return _buildRoute(const HomePage(), settings: settings);

      default:
        return _buildRoute(const ErrorView(), settings: settings);
    }
  }

  static PageRouteBuilder _buildRoute(Widget child, {RouteSettings? settings}) {
    return SlideRouteTransition(
      settings: settings,
      enterWidget: child,
    );
  }
}

class Routes {
  static const home = "/";
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: Center(
        child: Text(
          "404 - Page Not Found!",
          style: context.titleLarge,
        ),
      ),
    );
  }
}
