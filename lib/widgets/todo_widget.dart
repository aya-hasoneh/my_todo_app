import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/todo_model.dart';
import 'package:todo/routes/app_links.dart';
import 'package:todo/screens/edit_screen/edit_page.dart';
import 'package:todo/screens/edit_screen/edit_provider.dart';
import 'package:todo/screens/home_screen/home_provider.dart';
import 'package:todo/utls/color.dart';

class ToDo extends StatelessWidget {
  final Todo todo;

  const ToDo({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final editProvider = Provider.of<EditProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.done,
                color: CustomColor.darkGreen,
              ),
              onPressed: () {
                Get.snackbar(
                  "Completed",
                  "${todo.title}",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: CustomColor.darkGreen,
                );
                homeProvider.doneTodo(todo);
              },
            ),
            Center(child: Text('${todo.title}')),
            Expanded(child: Container()),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  EditTodoPage(todo: todo)),
                  );
                 // editProvider.updateTodo(tod odo.title);
                },
                icon: const Icon(
                  Icons.edit,
                  color: CustomColor.darkBlue,
                )),
            IconButton(
                onPressed: () {
                  Get.snackbar(
                    "deleted",
                    "${todo.title}",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: CustomColor.darkRed,
                  );
                  homeProvider.removeTodo(todo);
                },
                icon: const Icon(Icons.close, color: CustomColor.darkRed)),
          ],
        ),
      ),
    );
  }
}
