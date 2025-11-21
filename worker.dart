import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Controller untuk mendemonstrasikan pengguna workers
class WorkerController extends GetxController {
  //Variabel reaktif yang kan kita monitor
  var count = 0.obs;

  @override
  void onInit() {
    //memanggil worker setiap kali count berubah
    ever(count, (_) => print("ever: Count changed to $count"));

    //memanggil worker hanya satu kali saat count berubah untuk pertama kalinya
    once(count, (_) => print("once: Count changed to $count"));

    //memanggil worker stiap 2 detik, hanya jika ada perubahan pada count
    interval(
      count,
      (_) => print("interval: Count changed to $count"),
      time: Duration(seconds: 15),
    );

    super.onInit();
  }

  //fungsi untuk menambah nilai count
  void increment() {
    count++;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Workers Example")),
        body: WorkerExample(),
      ),
    );
  }
}

class WorkerExample extends StatelessWidget {
  //Menginisialisasi Controller menggunakan GetX
  final WorkerController wc = Get.put(WorkerController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text("Count: ${wc.count}", style: TextStyle(fontSize: 24))),
          SizedBox(height: 20),
          ElevatedButton(onPressed: wc.increment, child: Text("Increment")),
        ],
      ),
    );
  }
}
