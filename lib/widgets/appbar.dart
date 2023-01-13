import 'package:flutter/material.dart';
import 'package:todo/utls/color.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  bool isShowArrowBack = true;
  CustomAppBar({Key? key, required this.title, required this.isShowArrowBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColor.darkIndigo,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: CustomColor.lightPurple),
      ),
      actions: [
        isShowArrowBack
            ? const Icon(
          Icons.arrow_back_ios,
          color: CustomColor.lightPurple,
        )
            : Container(),
      ],
      //   title: ,
    );
  }
}
