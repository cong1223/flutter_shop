import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdBanner extends StatelessWidget {
  final String adPicture;

  const AdBanner({Key key, this.adPicture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(100),
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              right: 0,
              child: Container(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil().setHeight(100),
                child: Image.network(
                  this.adPicture,
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
            child: Center(
              child: Text('广告位', style: TextStyle(color: Color(0xffffffff))),
            ),
          )
        ],
      ),
    );
  }
}
