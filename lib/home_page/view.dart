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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: new Text('提示',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700
          ),
        ),
        content: new Text('确定退出程序吗？'),
        actions: <Widget>[
          new RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: new Text('取消'),
            color: Colors.grey,
            textColor: Colors.amberAccent,),
          new RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: new Text('确定'),
            color: Colors.black,
            textColor: Colors.amberAccent,)
        ],
      ),
    ) ?? false;
  }
  return WillPopScope(
    onWillPop: _onWillPop,
    child: Scaffold(
        appBar: AppBar(
          title: Text('Warn'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info_outline,color: Colors.amberAccent,),
              onPressed: (){
                showAboutDialog(
                    context: viewService.context,
                  applicationIcon: Image.asset('images/logo.png',width: 40,height: 40),
                  applicationName: 'Warn',
                  applicationVersion: 'https://github.com/asionbo/flutter_warn'
                );
              },
            )
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
        barBackgroundColor: Colors.white,
        textColor: Colors.amberAccent,
        activeIconColor: Colors.amber,
        inactiveIconColor: Colors.black,
        circleColor: Colors.black,
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
