import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/router/router_handler.dart';

class Routes {
  static String root = '/';
  static String detailsPage = 'details';
  static String jpushPage = 'jpush';
  
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params) {
        print('ROUTER IS NOT FOUND!');
      }
    );
    router.define(detailsPage, handler: detailsHandler);
    router.define(jpushPage, handler: jpushHandler);
  }
}