import 'package:fish_redux/fish_redux.dart';

class HomeState implements Cloneable<HomeState> {

  int currentIndex;
  List<String> shows;


  @override
  HomeState clone() {
    return HomeState()
      ..currentIndex = currentIndex
      ..shows = shows
    ;
  }

}

HomeState initState(Map<String, dynamic> args) {
  final HomeState state = HomeState();
  state.currentIndex = 0;
  state.shows = [];
  return state;
}





