import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ConfigState> buildReducer() {
  return asReducer(
    <Object, Reducer<ConfigState>>{
      ConfigAction.init: _init,
      ConfigAction.edit: _edit,
      ConfigAction.del: _del,
    },
  );
}

ConfigState _init(ConfigState state, Action action) {
  final ConfigState newState = state.clone();
  final List<String> list = action.payload;
  newState.showText = list;
  return newState;
}

ConfigState _edit(ConfigState state, Action action) {
  final int index = action.payload ?? -1;
  final ConfigState newState = state.clone();
  final String text = newState.dialogText.text;

  if ( index < 0){
    newState.showText.add(text);
  }else{
    newState.showText[index] = text;
  }
  return newState;
}
ConfigState _del(ConfigState state, Action action) {
  final int index = action.payload;
  final ConfigState newState = state.clone();
  if ( index < newState.showText.length){
    newState.showText.removeAt(index);
  }
  return newState;
}
