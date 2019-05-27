import 'package:fish_redux/fish_redux.dart';

class ShowState implements Cloneable<ShowState> {

  List<String> texts;

  @override
  ShowState clone() {
    return ShowState()
    ..texts = texts;
  }
}

ShowState initState(Map<String, dynamic> args) {
  return ShowState();
}
