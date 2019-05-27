import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ShowPage extends Page<ShowState, Map<String, dynamic>> {
  ShowPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ShowState>(
                adapter: null,
                slots: <String, Dependent<ShowState>>{
                }),
            middleware: <Middleware<ShowState>>[
            ],);

}
