import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:todo/routes/app_routes.dart';
import 'package:todo/screens/edit_screen/edit_provider.dart';
import 'package:todo/screens/home_screen/home_provider.dart';

import 'screens/splash_screen/splash_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => EditProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: const SplashPage(), getPages: AppRoutes().pages);
  }
}
