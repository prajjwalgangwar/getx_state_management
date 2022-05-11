import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController{
  var todoList = <String>[].obs;

  addTodo(title){
    todoList.add(title);
  }

  deleteTodo(index){
    todoList.removeAt(index);
  }


}