import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  const LeaderPhone({Key key, this.leaderImage, this.leaderPhone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(250),
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: _launchURL,
                child: Image.network(
                  this.leaderImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Text(
                '点击拨打店长电话',
                style: TextStyle(color: Color(0xffffffff)),
              ),
            )
          ],
        ));
  }

  void _launchURL() async {
    String url = 'tel:' + this.leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('url不能访问');
    }
  }
}
