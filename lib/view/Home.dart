import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/shopping_controller.dart';

class Home extends StatelessWidget {

  ShoppingController controller1 = Get.find<ShoppingController>(tag: 'total');

  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ShoppingItem();
                  }),
              Positioned(
                top: 600,
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  color: Colors.black,
                  child: Obx((){
                    return Text(
                      'TOTAL: ${controller1.total.value}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                    );
                  })
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

class ShoppingItem extends StatelessWidget {
  
  ShoppingController controller = Get.find<ShoppingController>();
  ShoppingController controller1 = Get.find<ShoppingController>(tag: 'total');
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        border: Border.all(
          color: Colors.black,
        )
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2 - 42,
            color: Colors.deepOrange,
          ),
          Container(
            width: 100,
            height: 40,
            color: Colors.deepOrange.shade200,
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: IconButton(
                    onPressed: () {


                      controller.quantity.value==1 ?controller1.total.value-- : controller1.total.value ;
                      controller.removeProduct();// create





                    }, icon: const Icon(Icons.remove),
                  ),
                ),
                Center(
                  child: Container(
                    width: 20,
                    // color: Colors.green,
                    child: Obx(() => Text(


                      controller.quantity.value.toString(),



                      textAlign: TextAlign.center,// using same instance of Get.find
                    ),
                  ),
                )),
                SizedBox(
                  width: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {


                        controller.quantity.value==0 ?controller1.total.value++ : controller1.total.value ;
                        controller.addProduct();// create







                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
