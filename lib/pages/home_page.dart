import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/components/AdBanner.dart';
import 'package:flutter_shop/pages/components/FloorGoods.dart';
import 'package:flutter_shop/pages/components/Recommend.dart';
import 'package:flutter_shop/pages/components/TopNavigator.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'components/LeaderPhone.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  // 保持页面状态必须重写wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  String homePageContent = '正在获取数据';

  // 分页加载
  int page = 1;
  // 热卖商品
  // List<Map> hotGoodsList = [];
  List<String> hotGoodsList = ['','','',''];

  EasyRefreshController _controller; 


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = EasyRefreshController();
  }
  
  // 有了futureBuilder就不需要初始化了
  // @override
  // void initState() {
  //   getHomePageContent().then((val) => {
  //     setState((){
  //       this.homePageContent = val.toString();
  //     })
  //   });
  //   super.initState();
  // }

  // 获取热销商品数据
  void _getHotGoods() {
    var params = {'page': page};
    request('test',params:params).then((val){
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState((){
        // hotGoodsList.addAll(newGoodsList);
        page ++ ;
      });
    });
  }

  // 火爆商品头部
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    padding: EdgeInsets.all(5.0),
    child: Text('火爆专区'),
  );

  // 火爆商品流式布局
  Widget wrapList() {
    // if (this.hotGoodsList.length != 0) {
      if(true) {
      List<Widget> listWidget = hotGoodsList.map((item){
        return InkWell(
          onTap: (){},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network("https://cdn.pixabay.com/photo/2019/10/24/00/43/dock-4573120_960_720.jpg"),
                Text(
                  '测试火爆商品',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥19.9'),
                    Text('￥29.9',style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black26),)
                  ],
                )
              ],
            ),
          )
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    }else {
      return Text('');
    }
  }

  Widget _hotGoods() {
    return (
      Container(
        child: Column(
          children: <Widget>[
            hotTitle,
            wrapList()
          ],
        ),
      )
    );
  }

          
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
        ),
        body: EasyRefresh(
          controller: _controller,
          // 是否控制加载
          enableControlFinishLoad: false,
          // 是否控制刷新
          enableControlFinishRefresh: false,
          // 底部样式自定义
          footer: ClassicalFooter(
            loadedText: '没有更多啦~',
            loadingText: '加载中'
          ),
          header: ClassicalHeader(
            refreshingText: '正在刷新...',
            refreshedText: '加载完成'
          ),
          // 下拉刷新
          onRefresh: () async{
            await Future.delayed(Duration(seconds: 2),(){
              print('下拉刷新了');
              setState(() {
                hotGoodsList = ['','','',''];
              });
              _controller.resetLoadState();
            });
          },
          // 上拉加载
          onLoad: () async {
            Future.delayed(Duration(seconds: 2),(){
              if (hotGoodsList.length < 16) {
                setState(() {
                  this. hotGoodsList.add('');
                  this. hotGoodsList.add('');
                });
              }
            });
          },
          child: ListView(
              children: <Widget>[
                SwiperDiy(),
                TopNavigator(),
                AdBanner(adPicture: 'http://pic34.nipic.com/20131030/2455348_194508648000_2.jpg'),
                LeaderPhone(leaderImage: 'http://img4.cache.netease.com/photo/0001/2011-03-01/6U3BQPRO00AQ0001.jpg',leaderPhone:'13757154855'),
                Recommend(recommendList: [{},{},{}],),
                FloorGoods(),
                _hotGoods()
              ],
          ),
        )
        // FutureBuilder组件是接受一个异步返回数据的组件，有FutureBuilder就不需要初始化了
        // FutureBuilder(
        //   future: getHomePageContent(),
        //   builder: (context,snapshot){
        //     if(snapshot.hasData) {
        //       var data = json.decode(snapshot.data.toString());
        //       List<Map> swiper = (data['data']['slider'] as List).cast();    //.cast()泛型类型向上转型
        //       String adPicture = data['data']['advertesPicture']['PICTURE_ADDRESS'];
                  // String leaderImage = data['data']['shopInfo']['leaderImage'];
                  // String leaderPhone = data['data']['shopInfo']['leaderPhone'];
                  // List<Map> recommendList = (data['data']['recommend'] as List).cast();
        //       return Column(
        //         children: <Widget>[
        //           // SwiperDiy(swiperDataList:swiper),
                    // TopNavigator(navigatorList:navigatorList),
                    // AdBanner(adPicture:adPicture),
                    // LeaderPhone(leaderImage:leaderImage,leaderPhone:leaderPhone);
        //         ],
        //       );
        //     }else {
        //       return Center(
        //         child: Text('加载中...'),
        //       );
        //     }
        //   },
        // )
      )
    );
  }
}


class SwiperDiy extends StatelessWidget {
  // final List swiperDataList;
  final List swiperDataList = ['http://pic46.nipic.com/20140816/18875271_104608886000_2.jpg','http://pic26.nipic.com/20121230/9034633_172138299000_2.jpg','http://pic34.nipic.com/20131022/7939646_231200261101_2.jpg'];
  // SwiperDiy({this.swiperDataList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network("${swiperDataList[index]}",fit: BoxFit.cover,);
        },
        itemCount: this.swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
