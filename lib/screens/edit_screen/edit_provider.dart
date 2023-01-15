import 'package:flutter/material.dart';
import 'package:todo/modules/todo_model.dart';

class EditProvider extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  updateTodo(Todo todo, String title) {
    todo.title = title;
    notifyListeners();
  }

}
