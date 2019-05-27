import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';
class ShowFullPage extends Page<ShowFullState, Map<String, dynamic>> {
  ShowFullPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<ShowFullState>(
                adapter: null,
                slots: <String, Dependent<ShowFullState>>{
                }),
            middleware: <Middleware<ShowFullState>>[
              logMiddleware(tag: 'ShowFullPage'),
            ],);

}
