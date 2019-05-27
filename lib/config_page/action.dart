import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ConfigAction { init, onEdit, edit, onDel, del}

class ConfigActionCreator {

  static Action init(List<String> list) {
    return Action(ConfigAction.init,payload: list);
  }

  static Action onEditAction(int index) {
    return Action(ConfigAction.onEdit,payload: index);
  }

  static Action editAction(int index) {
    return Action(ConfigAction.edit,payload:index);
  }

  static Action onDelAction(int index) {
    return Action(ConfigAction.onDel,payload:index);
  }

  static Action delAction(int index) {
    return Action(ConfigAction.del,payload:index);
  }
}
