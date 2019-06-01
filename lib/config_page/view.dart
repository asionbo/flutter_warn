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
          child: Text('显示的文字,共计${state.showText.length}行',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700
          ),),
        ),
        Flexible(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
//            color: Colors.grey[200],
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 300,
            width: MediaQuery.of(viewService.context).size.width,
            child: state.showText.length > 0 ? ListView.separated(
              separatorBuilder: (BuildContext context, int index) => new Divider(),
              itemCount: state.showText.length,
              itemBuilder: (btx, index) {
                return new ListTile(
                  title: Text('${index+1}.${state.showText[index]}'),
                  trailing: Icon(Icons.edit,color: Colors.amberAccent,),
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
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Icon(
              Icons.add,
              color: Colors.amber,
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
