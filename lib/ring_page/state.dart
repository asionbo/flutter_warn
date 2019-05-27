import 'package:fish_redux/fish_redux.dart';
import 'package:soundpool/soundpool.dart';

class RingState implements Cloneable<RingState> {

  bool isRing;
  int soundId;
  int streamId;
  Soundpool soundpool;

  @override
  RingState clone() {
    return RingState()
      ..isRing = isRing
      ..soundId = soundId
      ..streamId = streamId
      ..soundpool = soundpool
    ;
  }
}

RingState initState(Map<String, dynamic> args) {
  return RingState()..isRing = false;
}
