import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/todo_model.dart';
import 'package:todo/screens/edit_screen/edit_provider.dart';
import 'package:todo/widgets/appbar.dart';

import 'package:todo/widgets/form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  String? title;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: CustomAppBar(
              titleAppBar: 'Edit Todo',
              isShowArrowBack: true,
              isShowAddButton: false,
            )),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: FormWidget(
              title: title!,
              onChangedTitle: (title) => setState(() => this.title = title),
              onSaved: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<EditProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title!);

      Get.back();
    }
  }
}
