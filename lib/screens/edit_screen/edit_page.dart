import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/todo_model.dart';
import 'package:todo/screens/edit_screen/edit_provider.dart';
import 'package:todo/screens/home_screen/home_provider.dart';
import 'package:todo/widgets/appbar.dart';
import 'package:todo/widgets/form_widget.dart';
// IconButton(
// icon: Icon(Icons.delete),
// onPressed: () {
// final provider =
// Provider.of<HomeProvider>(context, listen: false);
// provider.removeTodo(todo);
//
// Navigator.of(context).pop();
// },
// ),
class EditTodoPage extends StatefulWidget {
   Todo todo;

   EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  @override
  Widget build(BuildContext context) {
    final editProvider = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      appBar:
      PreferredSize(  preferredSize: const Size.fromHeight(100),child: CustomAppBar(titleAppBar: 'Edit Todo', isShowAddButton: false,isShowArrowBack: true,)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: editProvider.formKey,
          child: FormWidget(
            onChangedTitle: (title) => {
              editProvider.title = title,
            },
            onSaved: saveTodo,
          ),
        ),
      ),
    );

  }

    saveTodo() {
     final isValid = Provider.of<EditProvider>(context, listen: true)
         .formKey
         .currentState!
         .validate();

     if (!isValid) {
       return;
     } else {

       final provider = Provider.of<EditProvider>(context, listen: true);

       provider.updateTodo(widget.todo, provider.title);

       Get.back();
     }
   }
}
