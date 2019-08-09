import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ShowState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      Flexible(
        flex: 3,
        child: Image(
          image: AssetImage('images/hacker_mind.png'),
          fit: BoxFit.scaleDown,
        ),
      ),
      Flexible(
        flex: 3,
        child: Center(
          child: Container(
            child: SizedBox(
              width: 250.0,
              child: state.texts != null && state.texts.length > 0 ? TypewriterAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  duration: Duration(milliseconds: state.texts.reduce((a,b)=>a+b).length * 5000 ~/ 5),
                  text: state.texts,
                  textStyle: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none
                  ),
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ) : Container(),
            ),
          ),
        ),
      ),
      Flexible(
        flex: 1,
        child: RaisedButton(
          color: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Icon(Icons.fullscreen,color: Colors.amber,),
          onPressed: () {
            Navigator.of(viewService.context)
                .pushNamed('show_full', arguments: <String,dynamic>{'list':state.texts});
          },
        ),
      )
    ],
  );
}
