/**
 * 根据查到的法律名称显示该名称下所有的内容
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ruler_Read.dart';

List receive_data = [];
String lawlistreturn_url = 'http://39.97.103.161:8080/LawListReturn'; //法律名称搜索
String lawName = '';

class LawNameSearchReader extends StatefulWidget {
  LawNameSearchReader(lawName1) {
    lawName = lawName1;
  }

  @override
  _LawNameSearchReaderState createState() => _LawNameSearchReaderState();
}

class _LawNameSearchReaderState extends State<LawNameSearchReader> {
/**
 * 法律名称返回查询
 */
  Future returnlawList() async {
    try {
      Response response;
      print('》》》》》访问');
      var data = {"name": lawName};
      response = await Dio().post(lawlistreturn_url, data: data);
      setState(() {
        receive_data = response.data;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    returnlawList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '$lawName' + '查询的所有结果',
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
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '\n' + '     ${receive_data[index]['内容']}' + '\n',
                  textAlign: TextAlign.start,
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
