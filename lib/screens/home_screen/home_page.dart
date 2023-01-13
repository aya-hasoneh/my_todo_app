import 'package:flutter/material.dart';
import 'package:todo/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(title: 'TODO', isShowArrowBack: false)),
      body: Column(
        children: [],
      ),
    );
  }
}
