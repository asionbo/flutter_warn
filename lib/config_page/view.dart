import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ConfigState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Text('显示的文字',style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w700
          ),),
        ),
        Flexible(
          flex: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            height: 300,
            child: state.showText.length > 0 ? ListView.builder(
              itemCount: state.showText.length,
              itemBuilder: (btx, index) {
                return new ListTile(
                  title: Text('${index+1}.${state.showText[index]}'),
                  trailing: Icon(Icons.edit),
                  onTap: (){
                    dispatch(ConfigActionCreator.onEditAction(index));
                  },
                  onLongPress: (){
                    dispatch(ConfigActionCreator.onDelAction(index));
                  },
                );
              },
            ) : Text('请添加自定义文字'),
          ),
        ),
        Flexible(
          flex: 1,
          child: RaisedButton(
            color: Colors.blue,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              dispatch(ConfigActionCreator.onEditAction(-1));
            },
          ),
        )
      ],
    ),
  );
}
