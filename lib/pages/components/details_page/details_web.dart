import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsDetails = Provide.value<DetailsInfoProvider>(context).goodsInfo.data.goodInfo.goodsDetail;
    return  Provide<DetailsInfoProvider>(

      builder: (context,child,val){
        var isLeft = Provide.value<DetailsInfoProvider>(context).isLeft;
        if(isLeft){
          return  Container(
            child: Html(
                data: goodsDetails
            ),
          );
        }else{
          return Container(
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child:Text('暂时没有数据')
          );
        }
      },
    );
  }
}
