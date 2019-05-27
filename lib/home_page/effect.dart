import 'package:fish_redux/fish_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
//    Lifecycle.didChangeDependencies:_init,
    HomeAction.refreshText: _init
  });
}

void _init(Action action, Context<HomeState> ctx) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> list = prefs.getStringList('list');
  ctx.dispatch(HomeActionCreator.initShowsAction(list));
}