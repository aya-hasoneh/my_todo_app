import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo/utls/color.dart';
import 'package:todo/widgets/appbar.dart';
import 'package:todo/widgets/listView_widget.dart';

class HomePage extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Center(
              child: CircularPercentIndicator(animation: true,animationDuration: 100,
                radius: 100,
                lineWidth: 30,
                percent: 0.3,
                center: const Text("100%"),
                progressColor: CustomColor.darkPurple,
              ),
            ),

                ListViewWidget(),

          ],
        ),
      ),
    );
  }
}
