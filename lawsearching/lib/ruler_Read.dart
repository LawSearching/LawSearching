/*
*每个条文详细阅读界面
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String chaptername;
String sectionname;
String textmessage = '';
String lawlistreturn_url = 'http://39.97.103.161:8080/LawListReturn'; //法律名称搜索

class RulerReaderPage extends StatelessWidget {
  RulerReaderPage(chapter_name, section_name, text_message) {
    chaptername = chapter_name;
    sectionname = section_name;
    textmessage = text_message;
  }

  @override
  Widget build(BuildContext context) {
    if (sectionname.contains('null')) sectionname = '-';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '详细条文阅读: {$chaptername     $sectionname }',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(60.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: ScreenUtil().setWidth(2560),
            child: Text(
              '\n' + textmessage + '\n',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(55.0)),
            ),
          ),
        ),
      ),
    );
  }
}
