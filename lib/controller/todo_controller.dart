import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/model/todo_model.dart';

class TodoController extends GetxController {
  var todoList = List<Todo>.empty().obs;

  addTodo(Todo todo) {
    todoList.add(todo);

  }

  deleteTodo(index) {
    todoList.removeAt(index);
    !Get.isSnackbarOpen ? Get.snackbar('Alert!!!', 'todo removed', backgroundColor: Colors.red.shade50,  snackPosition: SnackPosition.TOP, backgroundGradient: LinearGradient(colors: [Colors.red.shade200, Colors.redAccent.shade100,]), duration: Duration(milliseconds: 850)): null;
  }

  itemChecked(val, index){
    todoList[index].done = val;
  }

  isTitleEmpty(String value){
    if(value.isEmpty || value.length == 0 || value == null){
      return "empty todo";
    }
    return null;
  }
}
