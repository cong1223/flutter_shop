import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/cart_page.dart';
import 'package:flutter_shop/pages/category_page.dart';
import 'package:flutter_shop/pages/home_page.dart';
import 'package:flutter_shop/pages/member_page.dart';
import 'package:flutter_shop/provide/currentIndex.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:provide/provide.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('搜索')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心'))
  ];

  List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  //    极光推送初始化
  String debugLable = 'UnKnow';
  JPush jpush = new JPush();
  
  
  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      //监听响应方法的编写
      jpush.addEventHandler(
        onReceiveMessage: (Map<String,dynamic> message) {
          print(">>>>>>>>>>>>>>>>>flutter 接收到推送: $message");
        }
      );
    }catch(e) {
      print(">>>>>>>>>>>>>>>>>极光推送获取值失败");
    }
  }

  @override
  Widget build(BuildContext context) {
//    适配初始化
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<CurrentIndexProvide>(
      builder: (context, child, value) {
        int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color(0xfff4f4f4),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            items: bottomTabs,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),
          // IndexedStack保持页面状态
          body: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}

//class IndexPage extends StatefulWidget {
//  @override
//  _IndexPageState createState() => _IndexPageState();
//}
//
//class _IndexPageState extends State<IndexPage> {
//  final List<BottomNavigationBarItem> bottomTabs = [
//    BottomNavigationBarItem(
//      icon: Icon(CupertinoIcons.home),
//      title: Text('首页')
//    ),
//    BottomNavigationBarItem(
//      icon: Icon(CupertinoIcons.search),
//      title: Text('搜索')
//    ),
//    BottomNavigationBarItem(
//      icon: Icon(CupertinoIcons.shopping_cart),
//      title: Text('购物车')
//    ),
//    BottomNavigationBarItem(
//      icon: Icon(CupertinoIcons.profile_circled),
//      title: Text('会员中心')
//    )
//  ];
//
//  List<Widget> tabBodies = [
//    HomePage(),
//    CategoryPage(),
//    CartPage(),
//    MemberPage()
//  ];
//  int currentIndex = 0;
//  var currentPage;
//
//  @override
//  void initState() {
//    currentPage = tabBodies[currentIndex];
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    // 初始化屏幕适配组件的设计图大小
//    ScreenUtil.instance = ScreenUtil(width:750, height:1334)..init(context);
//    // 获取设备像素基本信息
//    // print('设备像素密度:${ScreenUtil.pixelRatio}');
//    // print('设备像素高:${ScreenUtil.screenHeight}');
//    // print('设备像素宽:${ScreenUtil.screenWidth}');
//    return Scaffold(
//      backgroundColor: Color(0xfff4f4f4),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: currentIndex,
//        items: bottomTabs,
//        type: BottomNavigationBarType.fixed,
//        onTap: (index) {
//          setState(() {
//            currentIndex = index;
//           currentPage = tabBodies[index];
//          });
//        },
//      ),
//      // IndexedStack保持页面状态
//      body: IndexedStack(
//        index: currentIndex,
//        children: tabBodies,
//      ),
//    );
//  }
//}
