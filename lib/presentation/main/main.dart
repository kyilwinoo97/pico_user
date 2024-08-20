import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/layout.dart';
import 'package:pico_user/presentation/cart/bloc/cart_bloc.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/route/routes.dart';
import 'package:pico_user/presentation/utils/app_scroll_behavior.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';

import '../../di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
      MultiBlocProvider(providers:[
        BlocProvider<CartBloc>(
          create: (BuildContext context) => di.sl<CartBloc>(),
        ),
      ], child: const PicoApp()));
}

class PicoApp extends StatelessWidget {
  const PicoApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: kGrey100
    ));
    return Layout(
      child: MaterialApp(
        title: appName,
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: context.theme(),
        initialRoute: initialRoute,
        onGenerateRoute: RouteGen.generateRoute,
      ),
    );
  }

  String get initialRoute => Routes.nav;

}
