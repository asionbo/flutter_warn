import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ShowAction { init }

class ShowActionCreator {
  static Action initAction(List<String> list) {
    return Action(ShowAction.init,payload: list);
  }
}
