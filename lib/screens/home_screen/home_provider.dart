import 'package:flutter/material.dart';
import 'package:todo/modules/todo_model.dart';

class HomeProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  List<Todo> todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'go to shopping',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'clean my room',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'study ',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'sports',
    ),
  ];
  List<Todo> get todo => todos.where((todo) => todo.isDone == false).toList();
  addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  bool  doneTodo(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

 void removeTodo(Todo todo) {
    todos.remove(todo);

    notifyListeners();
  }


}
