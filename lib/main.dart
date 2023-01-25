import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/todo.dart';
import 'package:todo/routes/app_routes.dart';
import 'package:todo/screens/edit_screen/edit_provider.dart';
import 'package:todo/screens/home_screen/home_provider.dart';
import 'screens/splash_screen/splash_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(TodoAdapter());
  // Opening the box
  await Hive.openBox<Todo>('todo');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => EditProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashPage(),
      getPages: AppRoutes().pages,
    );
  }
}
