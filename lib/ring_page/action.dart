import 'package:fish_redux/fish_redux.dart';
import 'package:soundpool/soundpool.dart';

//TODO replace with your own action
enum RingAction { initSoundId, onRing, ring, updateStream }

class RingActionCreator {

  static Action onRingAction() {
    return const Action(RingAction.onRing);
  }

  static Action ringAction() {
    return const Action(RingAction.ring);
  }

  static Action initSound(int id, Soundpool pool) {
    return Action(RingAction.initSoundId,
        payload:
        <String, dynamic>{
          'id': id, 'pool': pool
        });
  }

  static Action updateStreamAction(int id) {
    return Action(RingAction.updateStream,payload: id);
  }
}
