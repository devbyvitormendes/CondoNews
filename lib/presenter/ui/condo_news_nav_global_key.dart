import 'package:flutter/material.dart';

class CondoNewsNavGlobalKey {
  static CondoNewsNavGlobalKey? _instance;
  final navKey = GlobalKey<NavigatorState>();

  CondoNewsNavGlobalKey._();

  static CondoNewsNavGlobalKey get instance =>
      _instance ??= CondoNewsNavGlobalKey._();
}