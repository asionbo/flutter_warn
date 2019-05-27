import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(RingState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.all(6),
    child:GestureDetector(
      onTap: (){
        dispatch(RingActionCreator.onRingAction());
      },
      child: Center(
        child: SizedBox(
            width: MediaQuery.of(viewService.context).size.width,
            height: MediaQuery.of(viewService.context).size.height,
            child: state.isRing ? Image(
              image: AssetImage('images/alert-fill.png'),
              color: Colors.red,
              fit: BoxFit.scaleDown,
            ) : Image(
              image: AssetImage('images/alert-fill.png'),
              color: Colors.blue,
              fit: BoxFit.scaleDown,
            )
        ),
      ),
    )

  );
}
