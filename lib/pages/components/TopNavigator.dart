import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigator extends StatelessWidget {
  // final List navigatorList;
  List<String> getDataList() {
      List<String> list = [];
      for (int i = 0; i < 10; i++) {
        list.add(i.toString());
      }
      return list;
    }

  // const TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context) {
    return InkWell(
      onTap: (){print('点击了导航');},
      child: Column(
        children: <Widget>[
          Image.network("http://img3.duitang.com/uploads/item/201507/23/20150723115018_ma428.thumb.700_0.jpeg",width: ScreenUtil().setWidth(95),),
          Text('测试')
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        children: getDataList().map((item) => _gridViewItemUI(context)).toList(),
      ),
    );
  }
}