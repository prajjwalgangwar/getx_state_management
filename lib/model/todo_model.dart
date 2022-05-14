class Todo {
  String? title;
  bool done;

  Todo({this.title, this.done = false});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(title: json['title'], done: json['done']);
  }

  Map<String, dynamic> toJson() => {'title': title, 'done': done};
}
