import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/main.dart';
import 'package:todo/screens/home_screen/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/screens/home_screen/home_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: (10)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Lottie.network(
            'https://assets8.lottiefiles.com/packages/lf20_oqd7dv9m.json',
            fit: BoxFit.cover, controller: controller,
            animate: true,
            onLoaded: (composition) {



          controller
                ..duration = composition.duration
                ..forward().whenComplete(() => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ));
            },
            // height: 500,
          ),
        ));
  }
}
