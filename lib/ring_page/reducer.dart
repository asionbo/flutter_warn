import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RingState> buildReducer() {
  return asReducer(
    <Object, Reducer<RingState>>{
      RingAction.ring: _ring,
      RingAction.initSoundId: _initSoundId,
      RingAction.updateStream: _updateSteam,
    },
  );
}

RingState _updateSteam(RingState state, Action action) {
  final RingState newState = state.clone();
  newState.streamId = action.payload;
  return newState;
}

RingState _initSoundId(RingState state, Action action) {
  final RingState newState = state.clone();
  newState.soundId = action.payload['id'];
  newState.soundpool = action.payload['pool'];
  return newState;
}

RingState _ring(RingState state, Action action) {
  final RingState newState = state.clone();
  newState.isRing = !newState.isRing;
  return newState;
}
