import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(RingState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.white,
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
              image: AssetImage('images/ring_on.jpg'),
//              color: Colors.red,
              fit: BoxFit.scaleDown,
            ) : Image(
              image: AssetImage('images/ring_off.jpg'),
//              color: Colors.blue,
              fit: BoxFit.scaleDown,
            )
        ),
      ),
    )

  );
}
