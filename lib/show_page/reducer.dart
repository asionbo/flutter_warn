import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ShowState> buildReducer() {
  return asReducer(
    <Object, Reducer<ShowState>>{
      ShowAction.init: _init,
    },
  );
}

ShowState _init(ShowState state, Action action) {
  final ShowState newState = state.clone();
  final List<String> list = action.payload;
  return newState..texts = list;
}
