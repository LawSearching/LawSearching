/**
 * 每个条文详细阅读页面，可重复使用
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ruler_Read.dart';
import './service_url.dart';

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
/// 章查询

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

/// 节查询

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
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中国人民共和国飞行基本规则')) {
      getchapter(url_10, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国保守国家秘密法')) {
      getchapter(url_11, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国民用航空法') &&
        section_name.contains('-')) {
      getchapter(url_12, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国民用航空法') &&
        !chapterName[0].contains('-')) {
      getSection(url_13, chapterName[0], sectionName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国宪法') &&
        section_name.contains('-')) {
      getchapter(url_14, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国宪法') &&
        !chapterName[0].contains('-')) {
      getSection(url_15, chapterName[0], sectionName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国劳动法') &&
        section_name.contains('-')) {
      getchapter(url_16, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国劳动合同法') &&
        section_name.contains('-')) {
      getchapter(url_17, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国劳动合同法') &&
        !chapterName[0].contains('-')) {
      getSection(url_18, chapterName[0], sectionName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国就业促进法') &&
        section_name.contains('-')) {
      getchapter(url_19, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国就业服务与就业管理规定') &&
        section_name.contains('-')) {
      getchapter(url_20, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国安全生产标准修订工作细则') &&
        section_name.contains('-')) {
      getchapter(url_21, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('企业职工工伤保险试行办法') &&
        section_name.contains('-')) {
      getchapter(url_22, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('劳动保障监察条例') &&
        section_name.contains('-')) {
      getchapter(url_23, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('集体合同规定') &&
        section_name.contains('-')) {
      getchapter(url_24, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('失业保险条例') &&
        section_name.contains('-')) {
      getchapter(url_25, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('失业保险金申领发放办法') &&
        section_name.contains('-')) {
      getchapter(url_26, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('最低工资规定') &&
        section_name.contains('-')) {
      getchapter(url_27, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国安全生产法') &&
        section_name.contains('-')) {
      getchapter(url_28, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国工会法') &&
        section_name.contains('-')) {
      getchapter(url_29, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国行政许可法') &&
        !chapterName[0].contains('-')) {
      getSection(url_31, chapterName[0], sectionName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国行政许可法') &&
        section_name.contains('-')) {
      getchapter(url_30, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国消防法') &&
        section_name.contains('-')) {
      getchapter(url_32, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('中华人民共和国职业病防治法') &&
        section_name.contains('-')) {
      getchapter(url_33, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('安全评价机构管理规定') &&
        section_name.contains('-')) {
      getchapter(url_34, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('安全生产许可证条例') &&
        section_name.contains('-')) {
      getchapter(url_35, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('特种设备安全监察条例') &&
        section_name.contains('-')) {
      getchapter(url_36, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('危险废物经营许可证管理办法') &&
        section_name.contains('-')) {
      getchapter(url_37, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('危险化学品安全管理条例') &&
        section_name.contains('-')) {
      getchapter(url_38, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('危险化学品生产储存建设项目安全审查办法') &&
        section_name.contains('-')) {
      getchapter(url_39, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('危险化学品生产企业安全生产许可证实施办法') &&
        section_name.contains('-')) {
      getchapter(url_40, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('烟花爆竹生产企业安全生产许可证实施办法') &&
        section_name.contains('-')) {
      getchapter(url_41, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('浙江省安全生产事故报告和调查处理暂行规定') &&
        section_name.contains('-')) {
      getchapter(url_42, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('浙江省剧毒化学品定点经营安全管理办法') &&
        section_name.contains('-')) {
      getchapter(url_43, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('浙江省企业职工安全生产教育管理规定') &&
        section_name.contains('-')) {
      getchapter(url_44, chapterName[0]);
    } else if (directory_name.contains('国家法律法规') &&
        directory_name_2.contains('浙江省危险化学品安全管理实施办法') &&
        section_name.contains('-')) {
      getchapter(url_45, chapterName[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '$chapter_name'+'   $section_name',
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
                          RulerReaderPage('$chapter_name','$section_name',' ${receive_data[index]['内容'].toString().replaceAll('\\n', '\n      ')}')));
            },
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
