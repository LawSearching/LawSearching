/**
 * 每个条文详细阅读页面，可重复使用
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ruler_Read.dart';

var url_1 = "http://39.97.103.161:8080/managementbookquerybyChapter"; //按章查询;
var url_2 = "http://39.97.103.161:8080/managementbookquerybySection"; //按章、节查询;
var chapter_name = ''; //章名称
var section_name = ''; //节名称
List receive_data = [];

class WorkingManualReader extends StatefulWidget {
  WorkingManualReader(chaptername, sectionname) {
    chapter_name = chaptername;
    section_name = sectionname;
  }

  @override
  _WorkingManualReaderState createState() => _WorkingManualReaderState();
}

class _WorkingManualReaderState extends State<WorkingManualReader> {
  List chapterName = chapter_name.split(' ');
  List sectionName = section_name.split(' ');
  Future<String> loadAsset() async {
    var content = await rootBundle.loadString('assets/TotalRulers.txt');
    return content;
  }

/**
 * 章查询
 */
  Future getchapter(String stringtext) async {
    try {
      receive_data = [];
      print('正在访问章节数据...');
      Response response;
      var data = {"chapter": stringtext};
      response = await Dio().post(url_1, data: data);
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

/**
 * 节查询
 */
  Future getSection(String stringtext1, String stringtext2) async {
    try {
      receive_data = [];
      print('正在访问章节数据...');
      Response response;
      var data = {"chapter": stringtext1, "section": stringtext2};
      response = await Dio().post(url_2, data: data);
      for (var item in response.data) {
        // print('返回节数据' + item.toString());
      }
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
    print(chapterName);
    print(section_name);
    if (section_name.contains('temp')) {
      print(chapterName[0]);
      getchapter(chapterName[0]);
    } else {
      String section_temp = section_name[0] + section_name[1] + section_name[2];
      print('----------');
      print(section_temp);
      getSection(chapterName[0], section_temp);
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
                          RulerReaderPage(' ${receive_data[index]['内容']}')));
            },
            child: Card(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Text(
                '\n' + '${receive_data[index]['内容']}' + '\n',
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
