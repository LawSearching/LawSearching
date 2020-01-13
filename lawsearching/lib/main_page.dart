import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 2048, height: 2732, allowFontScaling: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MainPage',
      theme: ThemeData.light(),
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(456),
                child: Text(
                  '中国法律法规大全',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(70),
                  ),
                ),
              ),
              _lawList(),
            ],
          ),
        ),
        body: Scaffold(
          appBar: AppBar(
            title: Text(
              '法律法规检索',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }

  Widget _lawList() {
    return Container(
      height: ScreenUtil().setHeight(2276),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '宪法',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '刑法',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '民法',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '诉讼',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '行政',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '商法',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '劳动法',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '经济法',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '国际法',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '常用法律',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '最新法律',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '全部法律',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '司法解释',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '房地产',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
