import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx1/getx2/route_management.dart';

void main() {
  runApp(MyApp());
}

class ControllerA extends GetxController {
  var value = 'A'.obs;
}

class ControllerB extends GetxController {
  var value = 'B'.obs;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: BindingsBuilder(() {
            //memnyediakan beberapa dependency dalam satu binding
            Get.put(ControllerA());
            Get.put(ControllerB());
          }),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Class Bindings dengan Getx")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("Value A: ${Get.find<ControllerA>().value}")),
            Obx(() => Text("Value B: ${Get.find<ControllerB>().value}")),
          ],
        ),
      ),
    );
  }
}
