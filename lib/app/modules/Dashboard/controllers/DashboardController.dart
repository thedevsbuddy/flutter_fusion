import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/ServerErrorPage.dart';

class DashboardController extends AppController {
  static DashboardController get instance {
    if (!Get.isRegistered<DashboardController>()) Get.put(DashboardController());
    return Get.find<DashboardController>();
  }

  /// Observables
  var _tasks = RxList<Map<String, dynamic>>([]);

  /// Getters
  List<Map<String, dynamic>> get tasks => _tasks;

  /// Variables
  TextEditingController taskInput = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    setBusy(true);
    for (int i in Iterable.generate(5)) {
      _tasks.add({'id': i + 1, 'task': "Task no. $i", "completed": false});
    }
    setBusy(false);
  }

  Future<void> saveTask() async {
    try {
      if (taskInput.text.isEmpty) {
        Toastr.show(message: "Please enter a task to continue!");
        return;
      }
      await Future.delayed(1.seconds);
      _tasks.add({
        "id": _tasks.last['id'] + 1,
        "task": taskInput.text,
        "completed": false,
      });
      taskInput.clear();
    } on Exception catch (e) {
      Get.to(ServerErrorPage(message: "$e"));
    }
  }

  void toggleTask(int id) async {
    try {
      _tasks.where((t) => t['id'] == id).first.update("completed", (value) => value = !value);
      _tasks.refresh();
    } on Exception catch (e) {
      Get.to(ServerErrorPage(message: "$e"));
    }
  }

  void removeTask(int index) async {
    try {
      _tasks.removeAt(index);
    } on Exception catch (e) {
      Get.to(ServerErrorPage(message: "$e"));
    }
  }
}
