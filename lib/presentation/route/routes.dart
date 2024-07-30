import 'package:flutter/material.dart';
import 'package:pico_user/presentation/bottom_nav/bottom_nav_widget.dart';
import '../all_item/all_item_page.dart';
import '../home/home_page.dart';
import '../utils/extensions/extensions.dart';
import 'route_transitions.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.nav:
        return _buildRoute(const BottomNavWidget(),settings: settings);

      case Routes.home:
        return _buildRoute(const HomePage(), settings: settings);
      case Routes.cart:
        return _buildRoute(const AllItemPage(),settings: settings);
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
  static const nav = "/nav";
  static const home = "/";
  static const cart = "/cart";
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
