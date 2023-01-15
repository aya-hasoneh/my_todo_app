import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo/routes/app_links.dart';
import 'package:todo/screens/edit_screen/edit_page.dart';
import 'package:todo/screens/home_screen/home_page.dart';

class AppRoutes {
  final pages =[
    GetPage(
      name: AppLinks().homePage,
      page: () => HomePage(),
    ),


  ];
}
