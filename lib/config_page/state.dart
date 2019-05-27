import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ConfigState implements Cloneable<ConfigState> {

  List<String> showText;
  TextEditingController dialogText;

  @override
  ConfigState clone() {
    return ConfigState()
      ..showText = showText
      ..dialogText = dialogText
    ;
  }
}

ConfigState initState(Map<String, dynamic> args) {
  return ConfigState()
    ..showText = []
    ..dialogText = TextEditingController(text: '')
  ;
}
