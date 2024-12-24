import 'package:flutter/material.dart';

class CondoNewsScaffoldMessengerKey {
  static CondoNewsScaffoldMessengerKey? _instance;
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  CondoNewsScaffoldMessengerKey._();

  static CondoNewsScaffoldMessengerKey get instance =>
      _instance ??= CondoNewsScaffoldMessengerKey._();
}
