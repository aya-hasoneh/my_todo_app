import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo/modules/todo.dart';
import 'package:todo/utls/boxes.dart';

class HomeProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  final List<Todo> todos = [];
  Future addTodo(String title) async {
    final todo = Todo()..title = title;
    final box = Boxes.getTodo();
    box.add(todo);
    Get.back();
    notifyListeners();
  }

  editTodo(Todo todo, String title) {
    todo.title = title;
    todo.save();
    notifyListeners();
  }

  bool doneTodo(Todo todo) {
    todo.isDone = !todo.isDone!;
    notifyListeners();

    return todo.isDone!;
  }

  removeTodo(Todo todos) {
    todos.delete();
    notifyListeners();
  }
}
