import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/todo.dart';
import 'package:todo/screens/edit_screen/edit_page.dart';
import 'package:todo/screens/edit_screen/edit_provider.dart';
import 'package:todo/screens/home_screen/home_provider.dart';
import 'package:todo/utls/color.dart';
import 'package:todo/widgets/form_widget.dart';

class ToDo extends StatelessWidget {
  List<Todo> todo;
  ToDo({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (context, index) {
            //final todo = todo[index];
            return buildCard(context, todo[index]);
          }),
    );
  }

  buildCard(
    BuildContext context,
    Todo todo,
  ) {
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
              icon: const Icon(
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
                Provider.of<HomeProvider>(context).doneTodo(todo);
              },
            ),
            Center(child: Text('${todo.title}')),
            Expanded(child: Container()),

            IconButton(
              onPressed: () {

                Get.to(EditTodoPage(
                  todo: todo,
                ));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => EditTodoPage(todo: todo)),
                // );
                //  Provider.of<EditProvider>(context).editTodo(todo, todo.title!);
              },
              icon: const Icon(
                Icons.edit,
                color: CustomColor.darkBlue,
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.snackbar(
                    "deleted",
                    "${todo.title}",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: CustomColor.darkRed,
                  );
                  Provider.of<HomeProvider>(context, listen: false)
                      .removeTodo(todo);
                },
                icon: const Icon(Icons.close, color: CustomColor.darkRed)),
          ],
        ),
      ),
    );
  }
}
