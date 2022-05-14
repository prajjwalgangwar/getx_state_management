import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_state_management/controller/todo_controller.dart';
import 'package:getx_state_management/model/todo_model.dart';
import 'package:getx_state_management/utilities/colors.dart';
import 'package:getx_state_management/utilities/constants.dart';
import 'package:getx_state_management/view/Home.dart';

class TodoPage extends StatelessWidget {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TodoController todoController = Get.put(TodoController(), permanent: true);
  GetStorage todoList = GetStorage('todo list');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white, width: 5.5),
                borderRadius: BorderRadius.circular(25)),
            backgroundColor: Colors.transparent,
            child: const Icon(
              Icons.add,
              size: 18,
            ),
            onPressed: () {
              Get.bottomSheet(SaveTodoBottomSheet(),
                  backgroundColor: Colors.red.shade900);
            },
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  CustomAppBar(
                    title: Constants().tasksMap.keys.elementAt(0),
                    color: AppColor.appbarBackgroundColor,
                    leadingIcon: Constants().tasksMap.values.elementAt(0)[0],
                  ),
                  UncheckedTodoList()
                ],
              ),
              CheckedTodoList()
            ],
          )),
    );
  }

  Widget SaveTodoBottomSheet() {
    return Container(
      margin: const EdgeInsets.all(20),
      color: Colors.red.shade900,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.yellow,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade50))),
            controller: titleController,
            cursorColor: Colors.greenAccent.shade700,
            style: TextStyle(
              color: Colors.grey.shade100,
            ),
          ),
          InkWell(
            onTap: () {
              todoController
                  .addTodo(Todo(title: titleController.text.toString()));
              titleController.clear();
              Get.back();
              !Get.isSnackbarOpen
                  ? Get.snackbar('Alert!!!', 'todo added',
                      backgroundColor: Colors.green.shade50,
                      snackPosition: SnackPosition.TOP,
                      backgroundGradient: LinearGradient(colors: [
                        Colors.green.shade200,
                        Colors.greenAccent.shade100,
                      ]),
                      duration: Duration(milliseconds: 850))
                  : null;
            },
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              color: Colors.greenAccent.shade100,
              child: const Text(
                'save todo',
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget UncheckedTodoList() {
    return Expanded(
      child: Obx(
        () => todoController.todoList.isNotEmpty
            ? ListView.builder(
                itemCount: todoController.todoList.length,
                itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      onDismissed: (_) {
                        todoController.todoList.removeAt(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.blue.shade200,
                              Colors.blue.shade300,
                              Colors.blueAccent.shade100
                            ]),
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(10)),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: todoController.todoList[index].done,
                          onChanged: (value) {
                            todoController.checkTodo(index);
                          },
                          shape: const RoundedRectangleBorder(
                              side:
                                  BorderSide(color: Colors.yellow, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          title: Row(
                            children: [
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      todoController.todoList[index].title ??
                                          ' ',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 1),
                                    )),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete_sweep_rounded,
                                      color: Colors.redAccent.shade400,
                                      size: 18,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
            : Center(
                child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red.shade100),
                    borderRadius: BorderRadius.circular(50)),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 40,
                  child: Icon(
                    Icons.list_alt_outlined,
                    size: 30,
                    color: Colors.red.shade200,
                  ),
                ),
              )),
      ),
    );
  }

  Widget CheckedTodoList() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Badge(
          badgeColor: Colors.red.shade50,
          gradient: RadialGradient(
            colors: [
              Colors.red.shade50,
              Colors.red.shade100
            ]
          ),
          animationType: BadgeAnimationType.fade,
          badgeContent: Obx(() => Text(
                '${todoController.doneTodoList.length}',
                style:
                    const TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
              )),
          position: BadgePosition.bottomEnd(bottom: 10, end: 15),
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Get.bottomSheet(
                  Obx(
                    () => todoController.doneTodoList.isNotEmpty
                        ? ListView.builder(
                            itemCount: todoController.doneTodoList.length,
                            itemBuilder: (context, index) => Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    value: true,
                                    onChanged: (value) {
                                      todoController.uncheckTodo(index);
                                    },
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.yellow, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    title: Row(
                                      children: [
                                        Expanded(
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                todoController
                                                        .doneTodoList[index]
                                                        .title ??
                                                    ' ',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    letterSpacing: 1,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                              onPressed: () {
                                                todoController
                                                    .deleteTodo(index);
                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                color:
                                                    Colors.redAccent.shade400,
                                                size: 18,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                        : Center(
                            child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red.shade100),
                                borderRadius: BorderRadius.circular(50)),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 40,
                              child: Icon(
                                Icons.hourglass_empty,
                                size: 30,
                                color: Colors.red.shade200,
                              ),
                            ),
                          )),
                  ),
                  backgroundColor: Colors.grey,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))));
            },
            child: Icon(
              Icons.delete,
              color: Colors.red.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
