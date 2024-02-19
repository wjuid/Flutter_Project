import 'package:flutter/material.dart';
import 'package:flutter_route/searchpage.dart';
import 'package:flutter_route/main.dart';
import 'package:flutter_route/loginpage.dart';

String homePage = "/";
String loginPage = '/loginPage';
String searchPage = "/searchPage";

final routes = {
  homePage: (context) => const HomePage(),
  searchPage: (context, {arguments}) => SearchPage(arguments: arguments),
  loginPage: (context) => const LoginPage(),
};

var onGenerateRoute = (RouteSettings settings) {
  Function? pageContentBuilder = routes[settings.name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      var route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      var route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
