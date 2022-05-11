import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/model/todo_model.dart';

class TodoController extends GetxController{
  var todoList = List<Todo>.empty().obs;

  addTodo(Todo todo){
    todoList.add(todo);
  }

  deleteTodo(index){
    todoList.removeAt(index);
  }


}