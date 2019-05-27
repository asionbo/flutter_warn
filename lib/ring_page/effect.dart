import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'action.dart';
import 'state.dart';
import 'package:soundpool/soundpool.dart';

Effect<RingState> buildEffect() {
  return combineEffects(<Object, Effect<RingState>>{
    Lifecycle.initState: _init,
    Lifecycle.deactivate: _ringStop,
    RingAction.onRing: _onRing,
  });
}

void _init(Action action, Context<RingState> ctx) async {
  final Soundpool oldPool = ctx.state.soundpool;
  if (oldPool == null){
    Soundpool pool = Soundpool(streamType: StreamType.ring);
    int soundId = await rootBundle.load("sounds/ring.mp3").then((ByteData soundData) {
      return pool.load(soundData);
    });
    //init sound
    ctx.dispatch(RingActionCreator.initSound(soundId,pool));
  }
}

void _onRing(Action action, Context<RingState> ctx) async {
  final bool isRing = ctx.state.isRing;
  final int soundId = ctx.state.soundId;
  final int streamId = ctx.state.streamId;
  final Soundpool pool = ctx.state.soundpool;
  if (isRing) {
    await pool.stop(streamId);
  }else{
    int streamId = await pool.play(soundId,repeat: 99);
    ctx.dispatch(RingActionCreator.updateStreamAction(streamId));
  }
  ctx.dispatch(RingActionCreator.ringAction());
}

void _ringStop(Action action, Context<RingState> ctx) async {
  final bool isRing = ctx.state.isRing;
  final int streamId = ctx.state.streamId;
  final Soundpool pool = ctx.state.soundpool;
  if (isRing) {
    await pool.stop(streamId);
    ctx.dispatch(RingActionCreator.ringAction());
  }
}


