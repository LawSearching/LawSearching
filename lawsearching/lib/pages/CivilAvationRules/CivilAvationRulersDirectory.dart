import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawsearching/pages/CivilAvationRules/CivilAvationFileReader.dart';
import 'package:lawsearching/pages/CivilAvationRules/CivilAvationdata.dart';

class CivilAvationRulersDirectory extends StatelessWidget {
  const CivilAvationRulersDirectory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('民航法规、空管规章'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text('国家法律法规'),
              children: <Widget>[
                _civilAvationDirectory1(),
              ],
            ),
            ExpansionTile(
              title: Text('民航规章'),
              children: <Widget>[
                ExpansionTile(
                  title: Text('民用航空'),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text('民用航空使用空域办法'),
                      children: <Widget>[
                        _civilAvationDirectory2('民用航空', '民用航空使用空域办法'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('民用机场飞行程序和运行最低标准管理规定'),
                      children: <Widget>[
                        _civilAvationDirectory2('民用航空', '民用机场飞行程序和运行最低标准管理规定'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('民用航空航行通告发布规定'),
                      children: <Widget>[
                        _civilAvationDirectory2('民用航空', '民用航空航行通告发布规定'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('搜寻援救民用航空器工作手册'),
                      children: <Widget>[
                        _civilAvationDirectory2('民用航空', '搜寻援救民用航空器工作手册'),
                      ],
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('通用航空'),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text('通用航空飞行管制条例'),
                      children: <Widget>[
                        _commonFlyDirectory2('通用航空', '通用航空飞行管制条例'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('民用无人驾驶航空器系统空中交通管理办法'),
                      children: <Widget>[
                        _commonFlyDirectory2('通用航空', '民用无人驾驶航空器系统空中交通管理办法'),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        )));
  }

  Widget _civilAvationDirectory1() {
    //国家法律法规子目录
    return Container(
      height: ScreenUtil().setHeight(1200),
      child: ListView.builder(
        itemCount: countryRulersList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${countryRulersList[index]}'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }

  //民航规章民用航空子目录
  Widget _civilAvationDirectory2(String name1, String name2) {
    List directory_list = [];
    List secondarylist = [];
    List<Widget> secondaryCategory = [];
    if (name2.contains('民用航空使用空域办法')) {
      directory_list = airspaceUserquery;
    } else if (name2.contains('民用机场飞行程序和运行最低标准管理规定')) {
      directory_list = civilAvationList_FlyRoutine_L2;
    } else if (name2.contains('民用航空航行通告发布规定')) {
      directory_list = flyAnnouncementRelease;
    } else {
      directory_list = rescueAircraftlist;
    }
    //子目录
    return Container(
      height: ScreenUtil().setHeight(1200),
      child: ListView.builder(
          itemCount: directory_list.length,
          itemBuilder: (context, index) {
            if (directory_list[index].contains('第四章 空域规范')) {
              secondarylist = airspaceUserquery_L4;
            } else if (directory_list[index].contains('附件四 管制扇区划设指导材料')) {
              secondarylist = airspaceUserquery_F4;
            } else if (directory_list[index].contains('附件五 重要点的设置和识别规范')) {
              secondarylist = airspaceUserquery_F5;
            } else if (directory_list[index].contains('附件六 航路和航线代号的识别规范')) {
              secondarylist = airspaceUserquery_F6;
            } else if (directory_list[index].contains('第一章 总则')) {
              secondarylist = rescueAircraftlist_L1_S1;
            } else if (directory_list[index].contains('第二章 组织机构与职责')) {
              secondarylist = rescueAircraftlist_L2_S2;
            } else if (directory_list[index].contains('第三章 搜寻援救管理')) {
              secondarylist = rescueAircraftlist_L3_S3;
            } else if (directory_list[index].contains('第四章 搜寻援救实施')) {
              secondarylist = rescueAircraftlist_L3_S4;
            } else {
              secondarylist = [];
            }
            secondaryCategory = [];
            for (String item in secondarylist) {
              secondaryCategory.add(new ListTile(
                title: Text(item),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CivilAvationFileReader(
                              name1, name2, directory_list[index], item)));
                },
              ));
            }
            return ExpansionTile(
              title: InkWell(
                child: Text('${directory_list[index]}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CivilAvationFileReader(
                              name1, name2, directory_list[index], '-')));
                },
              ),
              children: secondaryCategory,
            );
          }),
    );
  }

  //通用航空航规章子目录
  Widget _commonFlyDirectory2(String name1, String name2) {
    List directory_list = [];
    if (name2.contains('通用航空飞行管制条例')) {
      directory_list = commonFlyMangementList;
    } else if (name2.contains('民用无人驾驶航空器系统空中交通管理办法')) {
      directory_list = commonFlyMangementList_2;
    }
    //子目录
    return Container(
      height: ScreenUtil().setHeight(1200),
      child: ListView.builder(
        itemCount: directory_list.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${directory_list[index]}'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CivilAvationFileReader(
                        name1, name2, directory_list[index], '-')));
          },
        ),
      ),
    );
  }
}
