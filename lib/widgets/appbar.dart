import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/todo.dart';
import 'package:todo/screens/home_screen/home_provider.dart';
import 'package:todo/utls/color.dart';
import 'package:todo/widgets/form_widget.dart';

class CustomAppBar extends StatefulWidget {
  String titleAppBar;
  bool isShowArrowBack = true;
  bool isShowAddButton = true;
  CustomAppBar(
      {Key? key,
      required this.titleAppBar,
      required this.isShowArrowBack,
      required this.isShowAddButton})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: true);
    return AppBar(
      backgroundColor: CustomColor.darkIndigo,
      centerTitle: true,
      title: Text(
        widget.titleAppBar,
        style: const TextStyle(color: CustomColor.lightPurple),
      ),
      leading: widget.isShowArrowBack
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: CustomColor.lightPurple,
              ))
          : Container(),
      actions: [
        widget.isShowAddButton
            ? IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Add your task',
                    middleText: '',
                    content: FormWidget(
                        onChangedTitle: (title) => {
                              homeProvider.title = title,
                            },
                        onSaved: () {
                         homeProvider.addTodo(homeProvider.title);
                        }),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: CustomColor.lightPurple,
                  size: 30,
                ))
            : Container(),
      ],
      //   title: ,
    );
  }


}
