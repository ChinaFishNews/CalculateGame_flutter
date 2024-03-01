//ios风格的路由
import 'package:flutter/cupertino.dart';

import '../pageView.dart';
import '../pageViewBuilder.dart';
import '../pageViewFullPage.dart';
import '../shop.dart';
import '../tabs.dart';
import '../tools/dialog.dart';
import '../tools/pageViewKeepAlive.dart';

Map routes = {
  "/": (contxt) => const Tabs(),
  "/dialog": (contxt) => const DialogPage(),
  "/pageView": (contxt) => const PageViewPage(),
  "/pageViewBuilder": (contxt) => const PageViewBuilderPage(),
  "/pageViewFullPage": (contxt) => const PageViewFullPage(),
  "/pageViewKeepAlive": (contxt) => const PageViewKeepAlive(),
  "/shop": (contxt, {arguments}) => ShopPage(arguments: arguments),
};

// 配置onGenerateRoute  固定写法  这个方法也相当于一个中间件，这里可以做权限判断
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name; //  /news 或者 /search
  final Function? pageContentBuilder =
      routes[name]; //  Function = (contxt) { return const NewsPage()}

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));

      return route;
    }
  }
  return null;
};
