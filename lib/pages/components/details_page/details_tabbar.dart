import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';


class DetailsTabbar extends StatefulWidget {
  @override
  _DetailsTabbarState createState() => _DetailsTabbarState();
}

class _DetailsTabbarState extends State<DetailsTabbar> {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvider>(
      builder: (context,child,value){
        var isLeft = Provide.value<DetailsInfoProvider>(context).isLeft;
        var isRight = Provide.value<DetailsInfoProvider>(context).isRight;
        return Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: <Widget>[
              _myTabbarLeft(context,isLeft),
              _myTabBarRight(context,isRight)
            ],
          ),
        );
      },
    );
  }


  Widget _myTabbarLeft(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: (){
        Provide.value<DetailsInfoProvider>(context).changeLeftAndRight('left');
      },
      child: Container(
        padding:EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: isLeft?Colors.pink:Colors.black12
                )
            )
        ),
        child: Text(
          '详细',
          style: TextStyle(
              color:isLeft?Colors.pink:Colors.black
          ),
        ),
      ),
    );
  }

  Widget _myTabBarRight(BuildContext context,bool isRight){
    return InkWell(
      onTap: (){
        Provide.value<DetailsInfoProvider>(context).changeLeftAndRight('right');
      },
      child: Container(

        padding:EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: isRight?Colors.pink:Colors.black12
                )
            )
        ),
        child: Text(
          '评论',
          style: TextStyle(
              color:isRight?Colors.pink:Colors.black
          ),
        ),
      ),
    );
  }
}
