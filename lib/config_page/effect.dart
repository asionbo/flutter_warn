import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:warn/home_page/action.dart';
import 'action.dart';
import 'state.dart';

import 'package:shared_preferences/shared_preferences.dart';

Effect<ConfigState> buildEffect() {
  return combineEffects(<Object, Effect<ConfigState>>{
    Lifecycle.didChangeDependencies:_init,
    ConfigAction.onEdit: _onEdit,
    ConfigAction.onDel: _onDel,
  });
}

void _init(Action action, Context<ConfigState> ctx) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> list = prefs.getStringList('list');
  if (list != null) {
    ctx.dispatch(ConfigActionCreator.init(list));
  }
}

void _onEdit(Action action, Context<ConfigState> ctx) async {

  final int index = action.payload ?? -1;
  ctx.state.dialogText.text = index < 0 ? '' : ctx.state.showText[index] ;

  final String select = await showDialog<String>(
      context: ctx.context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          title: Text(index < 0 ? '新增' : '修改',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700
            ),
          ),
          content: TextField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            maxLines: 3,
            cursorColor: Colors.amberAccent,
            decoration: InputDecoration(
              fillColor: Colors.amberAccent,
              border: InputBorder.none,
              hintText: index < 0 ? '请输入内容' : ctx.state.showText[index],
            ),
            controller: ctx.state.dialogText,
          ),
          actions: <Widget>[
            new RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              onPressed: () {
                Navigator.pop(buildContext);
              },
              child: new Text('取消'),
              color: Colors.grey,
              textColor: Colors.amberAccent,),
            new RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              onPressed: () {
                Navigator.of(buildContext).pop('Yes');
              },
              child: new Text('确定'),
              color: Colors.black,
              textColor: Colors.amberAccent,)
          ],
        );
      });

  if (select == 'Yes' && ctx.state.dialogText.text.isNotEmpty) {
    List<String> ll = ctx.state.showText.toList() ?? [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if ( index < 0){
      ll.add(ctx.state.dialogText.text);
    }else{
      ll.removeAt(index);
      ll.insert(index, ctx.state.dialogText.text);
    }
    prefs.setStringList('list', ll);

   ctx.dispatch(ConfigActionCreator.editAction(index));
  }
}

void _onDel(Action action, Context<ConfigState> ctx) async {

  final int index = action.payload ?? -1;
  assert (index >= 0);
  final String string = ctx.state.showText[index];

  final String select = await showDialog<String>(
      context: ctx.context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          title: Text('确定要删除？',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700
          ),),
          content: Text('${string}'),
          actions: <Widget>[
            new RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              onPressed: () {
                Navigator.pop(buildContext);
              },
              child: new Text('取消'),
              color: Colors.grey,
              textColor: Colors.amberAccent,),
            new RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              onPressed: () {
                Navigator.of(buildContext).pop('Yes');
              },
              child: new Text('确定'),
              color: Colors.black,
              textColor: Colors.amberAccent,)
          ],
        );
      });

  if (select == 'Yes') {
    List<String> ll = ctx.state.showText.toList() ?? [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ll.removeAt(index);
    prefs.setStringList('list', ll);

    ctx.dispatch(ConfigActionCreator.delAction(index));
  }
}
