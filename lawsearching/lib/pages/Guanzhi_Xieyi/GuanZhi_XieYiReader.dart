/**
 * 每个条文详细阅读页面，可重复使用
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ruler_Read.dart';

var chapter_name = ''; //章名称
var section_name = ''; //节名称

List receive_data = [];
String guanzhi_url_1 =
    'http://39.97.103.161:8080/AviationAgreementquerybyChapter'; //工作协议纪要接口按章查询
String guanzhi_url_2 =
    'http://39.97.103.161:8080/AviationAgreementquerybySection'; //工作协议纪要接口按节查询

class GuanZhiXieYiReader extends StatefulWidget {
  GuanZhiXieYiReader(chaptername, sectionname) {
    chapter_name = chaptername;
    section_name = sectionname;
    print('>>>>>' + section_name);
  }

  @override
  _GuanZhiXieYiReaderState createState() => _GuanZhiXieYiReaderState();
}

class _GuanZhiXieYiReaderState extends State<GuanZhiXieYiReader> {
  String chapterName = chapter_name;
  String sectionName = section_name;
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
    if (chapter_name.contains('军航-民航')) {
      if (section_name.contains('2020签字版进近管制室与武警宁夏总队直升机大队飞行管制室管制工作协议')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      } else if (section_name.contains('20190831签字版军航管制协议')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      }
    }
    if (chapter_name.contains('民航-民航')) {
      if (section_name.contains('2019签字版版银川中卫协议')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      } else if (section_name.contains('2020签字版塔台进近协议')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      } else if (section_name.contains('CRS放行规则(2019.08.15)')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      } else if (section_name.contains('待签进近管制室与运行管理中心工作协议')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      } else if (section_name.contains('签字版20190712兰州区域管制室与银川进近协议')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      }
    }
    if (chapter_name.contains('民航-通航机场及公司')) {
      if (section_name.contains('2019版银川鄂托克前旗协议4.23')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      } else if (section_name.contains('20190831签字版民航宁夏空管分局进近管制室与月牙湖机场管制室协议')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      } else if (section_name.contains('银川进近与盐池管制移交协议20190924')) {
        getSection(guanzhi_url_2, chapterName, sectionName);
      }
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
            child: Card(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  '\n' + '       ${receive_data[index]['内容'].toString().replaceAll('\\n', '\n      ')}' + '\n',
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
