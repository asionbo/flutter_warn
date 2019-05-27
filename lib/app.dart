import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:warn/home_page/page.dart';
import 'package:warn/show_full_page/page.dart';


Widget createApp() {
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'home' : HomePage(),
        'show_full' : ShowFullPage(),
      },
    ),
  ]);

  return MaterialApp(
    title: '',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('home', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}