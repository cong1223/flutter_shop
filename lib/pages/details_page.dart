
import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

import 'components/details_page/details_explain.dart';
import 'components/details_page/details_tabbar.dart';
import 'components/details_page/details_top_area.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            DetailsTopArea(),
            DetailsExplain(),
            DetailsTabbar(),
          ],
        ),
      ),
    );
  }

  void _getBackInfo(BuildContext context){
    Provide.value<DetailsInfoProvider>(context).getGoodsInfo(id: goodsId);
    print("加载完成");
  }
}
