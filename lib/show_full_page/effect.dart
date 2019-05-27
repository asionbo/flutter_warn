import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:screen/screen.dart';

import 'state.dart';

Effect<ShowFullState> buildEffect() {
  return combineEffects(<Object, Effect<ShowFullState>>{
    Lifecycle.initState:_init,
    Lifecycle.dispose:_dispose,
  });
}

void _init(Action action, Context<ShowFullState> ctx) async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  await SystemChrome.setEnabledSystemUIOverlays([]);

  await Screen.keepOn(true);
}

void _dispose(Action action, Context<ShowFullState> ctx) async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  await Screen.keepOn(false);
}

