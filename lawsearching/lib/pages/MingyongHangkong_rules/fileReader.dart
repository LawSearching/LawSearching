/**
 * 每个条文详细阅读页面，可重复使用
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var text_file = ""; //文本内容
var file_name = ''; //章节名称

class FileReader extends StatefulWidget {
  FileReader(filename) {
    file_name = filename;
  }

  @override
  _FileReaderState createState() => _FileReaderState();
}

class _FileReaderState extends State<FileReader> {
  var textfile = "";
  List listfile = [];
  // File file = new File('/lib/pages/open-file.txt');
  Future<String> loadAsset() async {
    var content = await rootBundle.loadString('assets/TotalRulers.txt');
    return content;
  }

  dynamic result;
  Pattern pattern = "\n第";
  void loadAssests() async {
    result = await loadAsset();
    setState(() {
      textfile = result.toString();
      //print(textfile);
      listfile = textfile.split(pattern);
      print('匹配到的--->${listfile[3]}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('----------');
    loadAssests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '$file_name',
        style: TextStyle(fontSize: ScreenUtil().setSp(50.0)),
      )),
      body: ListView.builder(
        itemCount: listfile.length - 1,
        itemBuilder: (context, index) {
          index = index + 1;
          return Card(
            elevation: 15.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Text(
              '\n   第${listfile[index]}',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(45.0)),
            ),
          );
        },
      ),
    );
  }
}
