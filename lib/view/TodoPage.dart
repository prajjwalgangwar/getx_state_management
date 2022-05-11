
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_state_management/controller/todo_controller.dart';
import 'package:getx_state_management/model/todo_model.dart';

class TodoPage extends StatelessWidget{

  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TodoController todoController = Get.put(TodoController());
  GetStorage todoList = GetStorage('todo list');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Get.bottomSheet(
            bottomSheet()
          );
          // Get.snackbar('Button Clicked', '', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.pink.shade700);

        },
      ),
      body: Container(
        color: Colors.yellow.shade900,
        child: Obx(()=>ListView.builder(
          itemCount: todoController.todoList.length,
            itemBuilder: (context, index)=> ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                        child: Text(todoController.todoList[index].title.toString())),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(onPressed: (){

                      todoController.deleteTodo(index);

                    }, icon: Icon(Icons.delete, color: Colors.black,)),
                  )
                ],
              ),
            )
        ),
      ),
    ));

  }

  Widget bottomSheet(){
    return Container(
      margin: const EdgeInsets.all(20),
      color: Colors.pink,
      child: Column(
        children: [
          Container(
            width: 250,
            margin: const EdgeInsets.only(top: 30),
            color: Colors.pink.shade50,
            child: TextFormField(
              controller: titleController,
              cursorColor: Colors.yellowAccent.shade200,
              style: const TextStyle(
                color: Colors.black,

              ),
            ),
          ),
          // TextFormField(
          //   controller: descriptionController,
          //   cursorColor: Colors.yellowAccent.shade200,
          //   style: const TextStyle(
          //     color: Colors.black,
          //
          //   ),
          // ),
          InkWell(
            onTap: (){
              todoController.addTodo(
                Todo(
                  title: titleController.text.toString()
                )
              );
              print('Value: ${titleController.value.text}');
              Get.snackbar('Save Alert', 'todo saved', backgroundColor: Colors.deepPurple.shade200);
            },
            child: Container(
              height: 50,
              width: 200,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              child: const Text('save todo', textAlign: TextAlign.center,),
            ),
          )
        ],
      ),
    );
  }
}