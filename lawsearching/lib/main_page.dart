import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  String searchByName = '';
  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
    }
  }

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
                height: ScreenUtil().setHeight(550),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[800],
                ),
                child: Text(
                  '中国法律法规大全',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(70),
                    color: Colors.white,
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
                fontSize: ScreenUtil().setSp(55),
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Form(
                  key: searchKey,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                    width: ScreenUtil().setWidth(2048),
                    height: ScreenUtil().setHeight(400),
                    // decoration: BoxDecoration(
                    //   border: Border(
                    //     bottom: BorderSide(
                    //       color: Colors.blueGrey,
                    //       width: 1.0,
                    //       style: BorderStyle.solid
                    //     )
                    //   )
                    // ),
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: ScreenUtil().setSp(55)),
                      decoration: InputDecoration(hintText: '搜索'),
                      textAlign: TextAlign.center,
                      obscureText: false,
                      onSaved: (value) {
                        searchByName = value;
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(2048),
                  height: ScreenUtil().setHeight(1655),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.only(left: 30, top: 20),
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              border: Border(
                                  bottom: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.grey,
                            width: 1.0,
                          ))),
                          child: Text('data'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _lawList() {
    return Container(
      height: ScreenUtil().setHeight(2182),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Colors.lightBlue[800],
            // Colors.blueAccent[100],
            Colors.lightBlueAccent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '宪法',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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
