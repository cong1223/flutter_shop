
import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

import 'components/details_page/details_bottom.dart';
import 'components/details_page/details_explain.dart';
import 'components/details_page/details_tabbar.dart';
import 'components/details_page/details_top_area.dart';
import 'components/details_page/details_web.dart';

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
      body: Stack(
        children: <Widget>[
          Container(
            child: ListView(
              children: <Widget>[
                DetailsTopArea(),
                DetailsExplain(),
                DetailsTabbar(),
                DetailsWeb()
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: DetailsBottom(),
          )
        ],
      )
    );
  }

  void _getBackInfo(BuildContext context){
    Provide.value<DetailsInfoProvider>(context).getGoodsInfo(id: goodsId);
    print("加载完成");
  }
}
