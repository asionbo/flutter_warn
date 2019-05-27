import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:warn/config_page/page.dart';
import 'package:warn/ring_page/page.dart';
import 'package:warn/show_page/page.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeState state, Dispatch dispatch, ViewService viewService) {
  Future<bool> _onWillPop() {
    return showDialog(
      context: viewService.context,
      builder: (context) => new AlertDialog(
        title: new Text('提示'),
        content: new Text('确定退出程序吗？'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('取消'),
            textColor: Colors.grey,
          ),
          new FlatButton(
            onPressed: (){
              Navigator.of(context).pop(true);
            },
            child: new Text('确定'),
          ),
        ],
      ),
    ) ?? false;
  }
  return WillPopScope(
    onWillPop: _onWillPop,
    child: Scaffold(
        appBar: AppBar(
          title: Text('Help !!!'),
          actions: <Widget>[
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: _page(state.currentIndex,viewService,state.shows),
        ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.music_note, title: "Ring"),
          TabData(iconData: Icons.record_voice_over, title: "Show"),
          TabData(iconData: Icons.settings, title: "Setting")
        ],
        onTabChangedListener: (position){
          dispatch(HomeActionCreator.onPageChangeAction(position));
        },
      ),
    ),
  );
}

Widget _page(int index,ViewService vs,List<String> shows){
  switch(index){
    case 0:
      return RingPage().buildPage(null);
    case 1:
      return ShowPage().buildPage(null);
    case 2:
      return ConfigPage().buildPage(null);
  }
}
