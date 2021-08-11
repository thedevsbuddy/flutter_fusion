import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/helpers/global.dart';

class LoadingIconWidget extends StatelessWidget {
  final double? height;
  final Color? color;

  LoadingIconWidget({Key? key, this.height, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetIcon('loading-sm.gif'),
      height: height ?? 14.0,
      color: color ?? null,
    );
  }
}
