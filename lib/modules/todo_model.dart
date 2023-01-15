class TodoField {
  static String createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String? id;

  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.id,
    this.isDone = false,
  });
}
