/**
 * 每个条文详细阅读页面，可重复使用
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ruler_Read.dart';

var url_1 =
    "http://39.97.103.161:8080/CommonFlyManagementquerybyChapter"; //通用航空飞行管制条例按章查询
var url_2 =
    "http://39.97.103.161:8080/UAVManagementquerybyChapter"; //民用无人驾驶航空器空中交通管理办法按章查询
var url_3 =
    "http://39.97.103.161:8080/FlyRoutineAndLowestStandardquerybyChapter"; //民用机场飞行程序和运行最低标准管理规定按章查询
var url_4 =
    "http://39.97.103.161:8080/FlyAnnouncementReleasequerybyChapter"; //民用航空航行通告发布规定按章查询
var url_5 =
    "http://39.97.103.161:8080/FlyAnnouncementReleasequerybySection"; //民用航空航行通告发布规定按章节查询
var url_6 =
    "http://39.97.103.161:8080/AirspaceUsequerybyChapter"; //民用航空使用空域按章查询
var url_7 =
    "http://39.97.103.161:8080/AirspaceUsequerybySection"; //民用航空使用空域按章节查询
var url_8 =
    "http://39.97.103.161:8080/RescueAircraftquerybyChapter"; //搜索救援民用航空器工作手册按章查询
var url_9 =
    "http://39.97.103.161:8080/RescueAircraftquerybySection"; //搜索救援民用航空器工作手册按章节查询
var chapter_name = ''; //章名称
var directory_name = ''; //大目录名称
var directory_name_2 = ''; //目录名称
var section_name = ''; //节名称
List receive_data = [];

class CivilAvationFileReader extends StatefulWidget {
  CivilAvationFileReader(
      directoryname1, directoryname2, chaptername, sectionname) {
    directory_name = directoryname1;
    directory_name_2 = directoryname2;
    chapter_name = chaptername;
    section_name = sectionname;
    print('>>>>>' + section_name);
  }

  @override
  _CivilAvationFileReaderState createState() => _CivilAvationFileReaderState();
}

class _CivilAvationFileReaderState extends State<CivilAvationFileReader> {
  List chapterName = chapter_name.split(' ');
  List sectionName = section_name.split(' ');
/**
 * 章查询
 */
  Future getchapter(String url, String stringtext) async {
    try {
      receive_data = [];
      print('正在访问章节数据...');
      Response response;
      var data = {"chapter": stringtext};
      response = await Dio().post(url, data: data);
      // for (var item in response.data) {
      //  、、 print('返回数据' + item.toString());
      // }
      setState(() {
        receive_data = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

/**
 * 节查询
 */
  Future getSection(String url, String stringtext1, String stringtext2) async {
    try {
      receive_data = [];
      print('正在访问章节数据...');
      print(stringtext1 + '---' + stringtext2);
      Response response;
      var data = {"chapter": stringtext1, "section": stringtext2};
      response = await Dio().post(url, data: data);
      setState(() {
        receive_data = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print('----------');
    print(directory_name);
    print(chapterName[0]);
    if (directory_name.contains('通用航空') &&
        directory_name_2.contains('通用航空飞行管制条例') &&
        section_name.contains('-')) {
      getchapter(url_1, chapterName[0]);
    } else if (directory_name.contains('通用航空') &&
        directory_name_2.contains('民用无人驾驶航空器系统空中交通管理办法') &&
        section_name.contains('-')) {
      getchapter(url_2, chapterName[0]);
    } else if (directory_name.contains('民用航空') &&
        directory_name_2.contains('民用航空使用空域办法') &&
        section_name.contains('-')) {
      getchapter(url_6, chapterName[0]);
    } else if (directory_name.contains('民用航空') &&
        directory_name_2.contains('民用航空使用空域办法') &&
        !chapterName[0].contains('-')) {
      getSection(url_7, chapterName[0], sectionName[0]);
    } else if (directory_name.contains('民用航空') &&
        directory_name_2.contains('民用机场飞行程序和运行最低标准管理规定') &&
        section_name.contains('-')) {
      getchapter(url_3, chapterName[0]);
    } else if (directory_name.contains('民用航空') &&
        directory_name_2.contains('民用航空航行通告发布规定') &&
        section_name.contains('-')) {
      getchapter(url_4, chapterName[0]);
    } else if (directory_name.contains('民用航空') &&
        directory_name_2.contains('搜寻援救民用航空器工作手册') &&
        section_name.contains('-')) {
      getchapter(url_8, chapterName[0]);
    } else if (directory_name.contains('民用航空') &&
        directory_name_2.contains('搜寻援救民用航空器工作手册') &&
        !chapterName[0].contains('-')) {
      getSection(url_9, chapterName[0], sectionName[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '$chapter_name',
        style: TextStyle(fontSize: ScreenUtil().setSp(50.0)),
      )),
      body: ListView.builder(
        itemCount: receive_data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RulerReaderPage(' ${receive_data[index]['内容']}')));
            },
            child: Card(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Text(
                '\n' + '       ${receive_data[index]['内容']}' + '\n',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(45.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
