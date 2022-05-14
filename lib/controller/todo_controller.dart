import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_state_management/model/todo_model.dart';
import 'package:random_string/random_string.dart';

class TodoController extends GetxController {
  var todoList = List<Todo>.empty().obs;
  var doneTodoList = List<Todo>.empty().obs;

  addTodo(Todo todo) {
    todoList.add(todo);
  }

  checkTodo(index){
    doneTodoList.add(todoList[index]);
    todoList.removeAt(index);
  }

  uncheckTodo(index){
    todoList.add(doneTodoList[index]);
    doneTodoList.removeAt(index);
  }

  deleteTodo(index) {
    doneTodoList.removeAt(index);
    !Get.isSnackbarOpen ? Get.snackbar('Alert!!!', 'todo removed', backgroundColor: Colors.red.shade50,  snackPosition: SnackPosition.TOP, backgroundGradient: LinearGradient(colors: [Colors.red.shade200, Colors.redAccent.shade100,]), duration: const Duration(milliseconds: 850)): null;
  }

}
