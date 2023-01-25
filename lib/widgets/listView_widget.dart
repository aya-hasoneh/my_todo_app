import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/todo.dart';
import 'package:todo/screens/home_screen/home_provider.dart';
import 'package:todo/utls/boxes.dart';

import 'todo_widget.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  void dispose() {
    Hive.box('todo').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<Box<Todo>>(
      valueListenable: Boxes.getTodo().listenable(),
      builder: (context, box, _) {
        final todo = box.values.toList().cast<Todo>();
        return todo.isEmpty
            ? Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_z4cshyhf.json')
            : ToDo(todo: todo);
      },
    );
  }
}
