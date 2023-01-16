import 'package:flutter/material.dart';
import 'package:todo/modules/todo_model.dart';

class EditProvider extends ChangeNotifier {
  updateTodo(Todo todo, String title) {
    todo.title = title;
    notifyListeners();
  }
}
