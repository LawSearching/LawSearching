import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawsearching/pages/CivilAvationRules/CivilAvationRulersDirectory.dart'; //民航法规、空管规章
import 'package:lawsearching/pages/MingyongHangkong_rules/directory.dart'; //管制协议纪要
import 'package:lawsearching/pages/WorkingManual/managementHandbook.dart';
import 'package:lawsearching/pages/WorkingManual/trainingHandbook.dart';
import 'package:lawsearching/pages/WorkingManual/workingHandbook.dart';
import 'package:lawsearching/ruler_Read.dart';
import 'pages/Guanzhi_Xieyi/Guanzhi_Xieyi_Directory.dart'; //应急管理手册
import 'pages/YingjiGuanliShouce/YingjiGuanliShouce_Directory.dart'; //民用航空空中交通管理规则

String search_key = '法律法规名称搜索';
var url = "http://39.97.103.161:8080/querybyKey";

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  String searchByName = '';
  bool selected = false;
  List receive_data = [];//用来接收检索获得数据


  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      getdata(searchByName);
    }
  }

/**条纹检索功能 */
  Future getdata(String stringtext) async {
    try {
      print('正在访问数据...');
      Response response;
      var data = {"name": stringtext};
      response = await Dio().post(url, data: data);
      for (var item in response.data) {
        print('返回数据' + item.toString());
      }
      setState(() {
        receive_data = response.data;
      });
    } catch (e) {
      print(e);
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
                  '民航法律法规',
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
                  '法律法规搜索',
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
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(2050),
                    height: ScreenUtil().setHeight(315),
                    color: Colors.green[300],
                    alignment: Alignment.centerLeft,
                    child: Form(
                      key: searchKey,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                        width: ScreenUtil().setWidth(2000),
                        height: ScreenUtil().setHeight(315),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(' '),
                            Icon(
                              Icons.search,
                              size: 30.0,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: ScreenUtil().setWidth(1860),
                              height: ScreenUtil().setHeight(185),
                              color: Colors.white,
                              child: TextFormField(
                                autofocus: false,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(30.0)),
                                decoration:
                                    InputDecoration(hintText: search_key),
                                textAlign: TextAlign.left,
                                obscureText: false,
                                onSaved: (value) {
                                  searchByName = value;
                                },
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              search_key = '法律法规名称搜索';
                            });
                          },
                          child: Container(
                            height: ScreenUtil().setHeight(265.0),
                            width: ScreenUtil().setWidth(500.0),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Text('名称搜索',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(65.0),
                                    color: Colors.white)),
                          ),
                        ),
                        Text('  '),
                        InkWell(
                          onTap: () {
                            setState(() {
                              search_key = '法律法规条文搜索';
                              search();
                            });
                          },
                          child: Container(
                            height: ScreenUtil().setHeight(265.0),
                            width: ScreenUtil().setWidth(500.0),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Text('条文搜索',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(65.0),
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(2048),
                    height: ScreenUtil().setHeight(1620),
                    child: ListView.builder(
                      itemCount: receive_data.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Pattern pattern = r'\n';
                        // List text =
                        //     receive_data[index]['内容'].toString().split(pattern);
                        // for (var item in text) {
                        //   print(item);
                        // }
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RulerReaderPage(
                                        '${receive_data[index]['内容']}')));
                          },
                          child: Card(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: Text(
                              '     ${receive_data[index]['内容']}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(44.0)),
                            ),
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ManagementHandbook()));
                  },
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TrainingHandbook()));
                  },
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WorkingHandbook()));
                  },
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
