

class Todo{

  String? title;

  Todo({this.title});

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(title: json['title']);
  }

  Map<String, dynamic> toJson()=>{'title' : title};
}