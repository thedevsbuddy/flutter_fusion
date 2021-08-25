import 'package:flutter/material.dart';
import 'package:flutter_mvc/config/config.dart';
import 'package:get/get.dart';

import '../../helpers/text_styles.dart';

class MasterLayout extends StatelessWidget {
  final Widget body;
  final Drawer? drawer;
  final Color? backgroundColor;
  final String? title;

  MasterLayout({
    Key? key,
    required this.body,
    this.drawer,
    this.backgroundColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "${title != null ? title : Config.appName}",
          style: TextStyles.subtitle(context)?.copyWith(fontSize: 20.0),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Get.toNamed('/settings');
              })
        ],
      ),
      drawer: drawer ?? null,
      body: SafeArea(
        child: body,
      ),
    );
  }
}
