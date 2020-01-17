import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'YingjiGuanzhiDirectory_Data.dart';

class YingjiGuanliShouce_Directory extends StatelessWidget {
  const YingjiGuanliShouce_Directory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进近管制室应急管理手册'),
      ),
      body: ListView.builder(
        itemCount: jinjinGuanzhi_Directory.length, //列表项总数，不设置为无限加载
        itemBuilder: (context, index) => ExpansionTile(
          title: Text("${jinjinGuanzhi_Directory[index]}"),
          children: <Widget>[_jinjinGuanzhi_DirectoryList(index)],
        ),
      ),
    );
  }

//应急管理手册子目录
  Widget _jinjinGuanzhi_DirectoryList(int index1) {
    if (index1 == 0 || index1 == 2 || index1 == 5)
      return Container(
        height: ScreenUtil().setHeight(50),
        child: ListView.builder(
          itemCount: 0,
          itemBuilder: (context, index) => ListTile(
            title: Text(''),
          ),
        ),
      );
    if (index1 == 1)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: jinjinGuanzhi_Directory_Two.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${jinjinGuanzhi_Directory_Two[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //第四章 应急管理处置程序
    if (index1 == 3)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: jinjinGuanzhi_Directory_Four.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${jinjinGuanzhi_Directory_Four[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //第五章 银川进近管制室应急手册检查单
    if (index1 == 4)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: jinjinGuanzhi_Directory_Five.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${jinjinGuanzhi_Directory_Five[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
  }
}
