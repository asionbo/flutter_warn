import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:warn/show_full_page/state.dart';

Widget buildView(ShowFullState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: (){
      Navigator.of(viewService.context).pop('ok');
    },
    child: Container(
      color: Colors.black,
      child: SizedBox(
        width: 250,
        child: ScaleAnimatedTextKit(
            onTap: () {
              Navigator.of(viewService.context).pop('ok');
            },
            text: state.texts ?? ['Help me','救我','ヘルプ'],
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
            ),
            textAlign: TextAlign.center,
            alignment: AlignmentDirectional.center // or Alignment.topLeft
        ),
      )
    ),
  );
}