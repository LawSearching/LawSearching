/**
 * 每个条文详细阅读页面，可重复使用
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ruler_Read.dart';

var managementbookurl_1 =
    "http://39.97.103.161:8080/managementbookquerybyChapter"; //管理手册按章查询;
var managementbookurl_2 =
    "http://39.97.103.161:8080/managementbookquerybySection"; //管理手册按章、节查询;
var traningbookurl_1 =
    "http://39.97.103.161:8080/TrainBookquerybyChapter"; //培训手册按章查询;
var traningbookurl_2 =
    "http://39.97.103.161:8080/TrainBookquerybySection"; //培训手册按章、节查询;
var runbookurl_1 =
    "http://39.97.103.161:8080/RunBookquerybyChapter"; //运行手册按章查询;
var runbookurl_2 =
    "http://39.97.103.161:8080/RunBookquerybySection"; //运行手册按章、节查询;

var handbook_name = ''; //手册名称
var chapter_name = ''; //章名称
var section_name = ''; //节名称
List receive_data = [];

class WorkingManualReader extends StatefulWidget {
  /**
   * handbookname为培训手册，管理手册，运行手册名称;
   */
  WorkingManualReader(handbookname, chaptername, sectionname) {
    handbook_name = handbookname;
    chapter_name = chaptername;
    section_name = sectionname;
  }

  @override
  _WorkingManualReaderState createState() => _WorkingManualReaderState();
}

class _WorkingManualReaderState extends State<WorkingManualReader> {
  List chapterName = chapter_name.split(' ');
  List sectionName = section_name.split(' ');
  String temp_url = ''; //用来选择接口URL；

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
    print(handbook_name);
    if (handbook_name.contains('管理手册')) {
      if (section_name.contains('temp')) {
        getchapter(managementbookurl_1, chapterName[0]);
      } else {
        getSection(managementbookurl_2, chapterName[0], sectionName[0]);
      }
    }

    if (handbook_name.contains('培训手册')) {
      if (section_name.contains('temp')) {
        getchapter(traningbookurl_1, chapterName[0]);
      } else {
        getSection(traningbookurl_2, chapterName[0], sectionName[0]);
      }
    }

    if (handbook_name.contains('运行手册')) {
      if (section_name.contains('temp')) {
        getchapter(runbookurl_1, chapterName[0]);
      } else {
        getSection(runbookurl_2, chapterName[0], sectionName[0]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '${chapterName[0]}',
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
                          RulerReaderPage('   ${receive_data[index]['内容'].toString().replaceAll('\\n', '\n      ')}')));
            },
            child: Card(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  '\n' + '${receive_data[index]['内容'].toString().replaceAll('\\n', '\n      ')}' + '\n',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtil().setSp(45.0)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
