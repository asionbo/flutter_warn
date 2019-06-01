import 'package:fish_redux/fish_redux.dart';

class ShowFullState implements Cloneable<ShowFullState> {

  List<String> texts;

  @override
  ShowFullState clone() {
    return ShowFullState()
      ..texts = texts
    ;
  }
}

ShowFullState initState(Map<String, dynamic> args) {
  final List<String> list = args['list'] ?? [];
  return ShowFullState()
    ..texts = list
  ;
}
