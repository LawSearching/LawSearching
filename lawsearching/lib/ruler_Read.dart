/*
*每个条文详细阅读界面
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String textmessage = '';

class RulerReaderPage extends StatelessWidget {
  RulerReaderPage(text_message) {
    textmessage = text_message;
  }

  @override
  Widget build(BuildContext context) {
    Pattern pattern = r'\n';
    List text =
        textmessage.toString().split(pattern); //每一条文textmessage包含多个‘\n’,需进一步分割
    return Scaffold(
      appBar: AppBar(
        title: Text('详细条文阅读'),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Text(
            '\n' + '      ' + textmessage + '\n',
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(55.0)),
          ),
        ),
      ),
    );
  }
}
