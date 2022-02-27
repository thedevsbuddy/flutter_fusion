import 'package:flutter/material.dart';
import 'package:flutter_mvc/config/Config.dart';
import 'package:get/get.dart';

class MasterLayout extends StatelessWidget {
  final Widget body;
  final Drawer? drawer;
  final Color? backgroundColor;
  final dynamic title;

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
        title: title is String
            ? Text(
                "${title != null ? title : Config.appName}",
              )
            : title,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.toNamed('/settings');
            },
          ),
        ],
      ),
      drawer: drawer ?? null,
      body: SafeArea(
        child: body,
      ),
    );
  }
}
