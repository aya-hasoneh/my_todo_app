import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/todo.dart';
import 'package:todo/screens/edit_screen/edit_provider.dart';
import 'package:todo/widgets/appbar.dart';

import 'package:todo/widgets/form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  @override
  void initState() {
    super.initState();
    //  WidgetsBinding.instance.addPostFrameCallback((_) {
    //  Provider.of<EditProvider>(context, listen: false).title;
    // //   UserDatamodels.fetchUserDataApi();
    //  });
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
            key: Provider.of<EditProvider>(context).formKey,
            child: FormWidget(
                title: Provider.of<EditProvider>(context).title,
                onChangedTitle: (title) => {
                      Provider.of<EditProvider>(context, listen: false).title =
                          title
                    },
                onSaved: Provider.of<EditProvider>(context, listen: false)
                    .editTodo(
                        widget.todo, Provider.of<EditProvider>(context).title)),
          ),
        ),
      );
}
