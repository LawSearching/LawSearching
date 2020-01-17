import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawsearching/pages/CivilAvationRules/CivilAvationRulersDirectory.dart'; //民航法规、空管规章
import 'package:lawsearching/pages/MingyongHangkong_rules/directory.dart'; //管制协议纪要

import 'pages/Guanzhi_Xieyi/Guanzhi_Xieyi_Directory.dart'; //应急管理手册
import 'pages/YingjiGuanliShouce/YingjiGuanliShouce_Directory.dart'; //民用航空空中交通管理规则

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  String searchByName = '';
  bool selected = false;
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
                    fontSize: ScreenUtil().setSp(65),
                    color: Colors.white,
                  ),
                ),
              ),
              _lawList(selected),
            ],
          ),
        ),
        body: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(' '),
                Text(
                  '法律法规检索',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(55),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '反馈',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(50),
                    ),
                  ),
                ),
              ],
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
                    height: ScreenUtil().setHeight(320),
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
                      decoration: InputDecoration(hintText: '法律法规搜索'),
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
                Divider(
                  color: Colors.black38,
                ),
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(2048),
                  height: ScreenUtil().setHeight(1655),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {},
                        title: Text(
                          'data',
                          style: TextStyle(fontSize: ScreenUtil().setSp(50)),
                        ),
                        trailing: Icon(Icons.chevron_right),
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

  Widget _lawList(bool select) {
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
                '民用航空空中交通管理规则',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                  color: selected ? Colors.blueAccent[500] : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Civil_Aviation_Directory()));
              },
            ),
            Divider(
              color: Colors.lightBlue[500],
            ),
            ListTile(
              title: Text(
                '民 航 法 规 、空 管 规 章 ',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CivilAvationRulersDirectory()));
              },
            ),
            Divider(
              color: Colors.lightBlue[500],
            ),
            ListTile(
              title: Text(
                '管  制  协  议  纪  要',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Guanzhi_Xieyi_Directory()));
              },
            ),
            Divider(
              color: Colors.lightBlue[500],
            ),
            ExpansionTile(
              title: Text(
                '运 行 手 册',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    '管 理 手 册',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(50),
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    '培 训 手 册',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(50),
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    '运 行 手 册',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(50),
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Divider(
              color: Colors.lightBlue[500],
            ),
            ListTile(
              title: Text(
                '应 急 管 理 手 册',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(58),
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YingjiGuanliShouce_Directory()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
