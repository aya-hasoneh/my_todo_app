import 'package:hive/hive.dart';
import 'package:todo/modules/todo.dart';

class Boxes{
  static Box<Todo> getTodo()=> Hive.box<Todo>('todo');
}