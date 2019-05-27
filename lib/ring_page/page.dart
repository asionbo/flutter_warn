import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RingPage extends Page<RingState, Map<String, dynamic>> {
  RingPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RingState>(
                adapter: null,
                slots: <String, Dependent<RingState>>{
                }),
            middleware: <Middleware<RingState>>[
              logMiddleware(tag: 'RingPage'),
            ],);

}
