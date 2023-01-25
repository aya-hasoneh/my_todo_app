import 'package:flutter/material.dart';
import 'package:todo/modules/todo.dart';

class EditProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String title = '';
  editTodo(Todo todo, String title) {
    todo.title = title;
    todo.save();
    notifyListeners();
  }
}
