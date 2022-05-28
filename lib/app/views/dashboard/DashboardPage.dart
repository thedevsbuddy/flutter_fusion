import 'package:ui_x/ui_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/controllers/DashboardController.dart';
import 'package:flutter_mvc/app/views/errors/NotConnectedErrorPage.dart';
import 'package:flutter_mvc/app/views/widgets/LoadingIconWidget.dart';
import 'package:get/get.dart';

import '../layouts/MasterLayout.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    // final Size screen = Get.size;
    return Obx(
      () => !controller.isConnected
          ? NotConnectedErrorPage()
          : controller.isBusy
              ? LoadingIconWidget(message: "Please wait...")
              : MasterLayout(
                  title: "Dashboard",
                  actions: [
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Get.toNamed('/settings');
                      },
                    ),
                  ],
                  body: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: controller.tasks.length <= 0
                              ? Center(
                                  child: Text("No tasks yet!"),
                                )
                              : ListView.separated(
                                  itemCount: controller.tasks.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> task =
                                        controller.tasks[index];
                                    return GestureDetector(
                                      onDoubleTap: () =>
                                          controller.removeTask(index),
                                      child: Container(
                                        color: kcWhite,
                                        child: ListTile(
                                          dense: true,
                                          title: Text(
                                            "${task['task']}",
                                            style: TextStyl.subtitle(context)
                                                ?.copyWith(fontSize: 18),
                                          ),
                                          trailing: Checkbox(
                                            value: task['completed'],
                                            onChanged: (val) =>
                                                controller.toggleTask(index),
                                          ),
                                          onTap: () =>
                                              controller.toggleTask(index),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, idx) =>
                                      Divider(height: 0),
                                ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FormInput.text(
                                controller: controller.taskInput,
                                placeholder: "Enter task",
                              ),
                            ),
                            SizedBox(width: 12),
                            Button(
                              key: UniqueKey(),
                              label: "Create",
                              onTap: (btn) => controller.saveTask(btn),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
