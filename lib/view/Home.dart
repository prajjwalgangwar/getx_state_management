import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:getx_state_management/utilities/colors.dart';
import 'package:getx_state_management/utilities/constants.dart';
import 'package:getx_state_management/utilities/variables.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.black45,
          body: Column(
            children: [
              CustomAppBar(
                title: 'Tasks using Getx',
                color: AppColor.appbarBackgroundColor,
                leadingIcon: Icons.landscape_outlined,
                trailingIcon: Icons.settings_input_hdmi_outlined,
              ),
              Expanded(child: TaskCard())
            ],
          ),
        ),
      ),
    );
  }

  Widget TaskCard() {
    return ListView.builder(
        itemCount: Constants().tasksMap.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                  Constants().tasksMap.values.elementAt(index)[2].toString());
            },
            child: Card(
              elevation: 20,
              color: Colors.transparent,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        tileMode: TileMode.clamp,
                        colors: [
                          Colors.red.shade100,
                          Colors.green.shade100,
                          Colors.yellow.shade100,
                          Colors.blue.shade100
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  height: 70,
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Constants().tasksMap.values.elementAt(index)[0],
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Constants().tasksMap.keys.elementAt(index),
                        style: const TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color color;
  final IconData leadingIcon;
  final IconData? trailingIcon;

  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.color,
      required this.leadingIcon,
      this.trailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: color,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 40,
                height: 30,
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.green.shade700, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: IconButton(
                  iconSize: 16,
                  color: Colors.green.shade700,
                  icon: Icon(leadingIcon),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  margin: const EdgeInsets.only(
                      right: 10, left: 10, top: 5, bottom: 5),
                  padding: const EdgeInsets.only(
                      right: 50, left: 50, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.green.shade700, width: 0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        color: Colors.green.shade600),
                  )),
            ),
          ),

          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 40,
                height: 30,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  iconSize: 16,
                  color: Colors.green.shade700,
                  icon: Icon(trailingIcon ?? Icons.lan),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          // const SizedBox(width: 15,),
        ],
      ),
    );
  }
}
