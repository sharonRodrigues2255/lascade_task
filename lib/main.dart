import 'package:flutter/material.dart';
import 'package:lascade_task/core/consts/font_const.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/providers/home_screen_provider/home_screen_async_provider.dart';
import 'package:lascade_task/providers/search_provider/search_provider.dart';
import 'package:lascade_task/screens/landing_screen/landing_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}
final rootNavigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     SizeConfig.init(context);
    return MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => HomeScreenAsyncProvider()),ChangeNotifierProvider(create: (context) => SearchProvider())],
      child: MaterialApp(
          navigatorKey: rootNavigatorKey,
          title: 'Lascade Application',
          theme: ThemeData(fontFamily: FontConst.fontFamily,
          ),
          home: const LandingScreen(),
        ),
    );
  }
}
