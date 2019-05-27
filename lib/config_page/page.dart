import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ConfigPage extends Page<ConfigState, Map<String, dynamic>> {
  ConfigPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ConfigState>(
                adapter: null,
                slots: <String, Dependent<ConfigState>>{
                }),
            middleware: <Middleware<ConfigState>>[
            ],);

}
