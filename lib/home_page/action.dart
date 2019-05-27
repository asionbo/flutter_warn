import 'package:fish_redux/fish_redux.dart';

enum HomeAction { onPageChange, initShows, refreshText }

class HomeActionCreator {

  static Action onPageChangeAction(int index) {
    return Action(HomeAction.onPageChange, payload: index);
  }

  static Action initShowsAction(List<String> list) {
    return Action(HomeAction.initShows, payload: list);
  }

  static Action refreshAction() {
    return Action(HomeAction.refreshText);
  }

}
