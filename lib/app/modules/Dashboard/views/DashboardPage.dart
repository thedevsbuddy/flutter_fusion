import 'package:flutter/material.dart';
import '../../Modules.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/widgets/Widgets.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (DashboardController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
                ? LoadingIconWidget(message: "Please wait...")
                : MasterLayout(
                    title: "Dashboard",
                    actions: [
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          Get.toNamed(ProfileRoutes.profile);
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
                          Obx(
                            () => Expanded(
                              child: controller.tasks.length <= 0
                                  ? Center(
                                      child: Text("No tasks yet!"),
                                    )
                                  : ListView.separated(
                                      itemCount: controller.tasks.length,
                                      itemBuilder: (context, index) {
                                        Map<String, dynamic> task = controller.tasks[index];
                                        return GestureDetector(
                                          onDoubleTap: () => controller.removeTask(index),
                                          child: Container(
                                            color: Theme.of(context).backgroundColor,
                                            child: ListTile(
                                              dense: true,
                                              title: Text(
                                                "${task['task']}",
                                                style: TextStyl.body,
                                              ),
                                              trailing: Checkbox(
                                                value: task['completed'],
                                                onChanged: (val) => controller.toggleTask(task['id']),
                                              ),
                                              onTap: () => controller.toggleTask(task['id']),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, idx) => Divider(height: 0),
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: spacer3, vertical: spacer2),
                            child: Row(
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
                                  onTap: (btn) async {
                                    btn.setBusy(true);
                                    await controller.saveTask();
                                    btn.setBusy(false);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
      },
    );
  }
}
