import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout/layout.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/route/routes.dart';
import 'package:pico_user/presentation/utils/app_scroll_behavior.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const PicoApp());
}

class PicoApp extends StatelessWidget {
  const PicoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child:  MaterialApp(
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
