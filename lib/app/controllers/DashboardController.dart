import 'package:ui_x/ui_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvc/app/controllers/AppController.dart';
import 'package:flutter_mvc/app/views/errors/ServerErrorPage.dart';
import 'package:get/get.dart';

class DashboardController extends AppController {
  static DashboardController get to => Get.find();

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
      _tasks.add({'task': "Task no. $i", "completed": false});
    }
    setBusy(false);
  }

  void saveTask(ButtonController btn) async {
    try {
      btn.setBusy(true).setDisabled(true);
      // await Future.delayed(1.seconds);
      _tasks.add({
        "task": taskInput.text,
        "completed": false,
      });
      taskInput.clear();
      btn.setBusy(false).setDisabled(false);
    } catch (e) {
      btn.setBusy(false).setDisabled(false);
      Get.to(ServerErrorPage(message: "$e"));
    }
  }

  void toggleTask(int index) async {
    try {
      var selectedTask = _tasks[index];
      selectedTask['completed'] = !selectedTask['completed'];
      _tasks.removeAt(index);
      _tasks.insert(index, selectedTask);
    } catch (e) {
      Get.to(ServerErrorPage(message: "$e"));
    }
  }

  void removeTask(int index) async {
    try {
      _tasks.removeAt(index);
    } catch (e) {
      Get.to(ServerErrorPage(message: "$e"));
    }
  }
}
