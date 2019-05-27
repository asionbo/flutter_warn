import 'package:fish_redux/fish_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'action.dart';
import 'state.dart';

Effect<ShowState> buildEffect() {
  return combineEffects(<Object, Effect<ShowState>>{
    Lifecycle.initState:_init,
  });
}

void _init(Action action, Context<ShowState> ctx) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> list = prefs.getStringList('list');
  if (list == null) {
    list = ['Help me','救我','ヘルプ'];
  }
  ctx.dispatch(ShowActionCreator.initAction(list));
}

