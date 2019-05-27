import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer<HomeState>(<Object, Reducer<HomeState>>{
    HomeAction.onPageChange:_pageChange,
    HomeAction.initShows:_initShows,
  });
}

HomeState _pageChange(HomeState state, Action action){
  final HomeState newState = state.clone();
  newState.currentIndex = action.payload;
  return newState;
}

HomeState _initShows(HomeState state, Action action){
  final HomeState newState = state.clone();
  newState.shows = action.payload;
  return newState;
}
