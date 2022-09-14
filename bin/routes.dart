#! /usr/bin/env dcli

import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:recase/recase.dart';

void main() {
  File('lib/routes/app.dart').readAsString().then((String contents) {
    // routeFile = contents;
    RegExp exp = new RegExp(r"\(\r?\n?.*?name:\s?[']([/\w]+)[']?", multiLine: true, caseSensitive: false);
    // \n.\w+\(name:\s?[']([/\w]+)[']?
    Iterable<RegExpMatch> matches = exp.allMatches(contents);
    String routes = "class Routes {\n\t";
    for (final Match m in matches) {
      String match = m[0]!;
      match = match.replaceAll(RegExp(r"\s"), "").replaceAll(RegExp(r"name:"), "name: ");
      String routeVar = "";
      match = match.split(RegExp(r"\s"))[1];
      routeVar = match.replaceAll(RegExp(r"['/]"), ' ');
      routes += "static String get ${routeVar.trim().camelCase} => $match;\n\t";
    }
    routes += "}";
    "lib/routes/Routes.dart".write(routes);
  });
}
