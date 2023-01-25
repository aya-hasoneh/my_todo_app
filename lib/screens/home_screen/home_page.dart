import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo/utls/color.dart';
import 'package:todo/widgets/appbar.dart';
import 'package:todo/widgets/listView_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            titleAppBar: 'TODO',
            isShowArrowBack: false,
            isShowAddButton: true,
          )),
      body: ListViewWidget(),
    );
  }
}
