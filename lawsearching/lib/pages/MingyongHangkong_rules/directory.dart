import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CivilAvationData.dart';

class Civil_Aviation_Directory extends StatelessWidget {
  const Civil_Aviation_Directory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('民用航空空中交通管理规则'),
      ),
      body: ListView.builder(
        itemCount: civilAvtionDirectorylist.length, //列表项总数，不设置为无限加载
        itemBuilder: (context, index) => ExpansionTile(
          title: Text("${civilAvtionDirectorylist[index]}"),
          children: <Widget>[_civilAvtionlist(index)],
        ),
      ),
    );
  }

  Widget _civilAvtionlist(int index1) {
    //目录存在空值情况
    List nulllist = [];
    if (index1 == 0 ||
        index1 == 7 ||
        index1 == 8 ||
        index1 == 9 ||
        index1 == 18)
      return Container(
        height: ScreenUtil().setHeight(50),
        child: ListView.builder(
          itemCount: 0,
          itemBuilder: (context, index) => ListTile(
            title: Text(''),
          ),
        ),
      );
    //判断第二章，并显示子目录
    if (index1 == 1)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Two.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Two[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第三章，并显示子目录
    if (index1 == 2)
      return Container(
        height: ScreenUtil().setHeight(600),
        child: ListView.builder(
          itemCount: civilAvtionlist_Three.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Three[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第四章，并显示子目录
    if (index1 == 3)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Four.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Four[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第五章，并显示子目录
    if (index1 == 4)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Five.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Five[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第六章，并显示子目录
    if (index1 == 5)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Six.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Six[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第七章，并显示子目录
    if (index1 == 6)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Seven.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Seven[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第十一章，并显示子目录
    if (index1 == 10)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Eleven.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Eleven[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第十二章，并显示子目录
    if (index1 == 11)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Twelve.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Twelve[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第十三章，并显示子目录
    if (index1 == 12)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Thirteen.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Thirteen[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第十四章，并显示子目录
    if (index1 == 13)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Fourteen.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Fourteen[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第十五章，并显示子目录
    if (index1 == 14)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Fifteen.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Fifteen[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第十六章，并显示子目录
    if (index1 == 15)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Sixteen.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Sixteen[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第十七章，并显示子目录
    if (index1 == 16)
      return Container(
        height: ScreenUtil().setHeight(600),
        child: ListView.builder(
          itemCount: civilAvtionlist_Seventeen.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Seventeen[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第十八章，并显示子目录
    if (index1 == 17)
      return Container(
        height: ScreenUtil().setHeight(600),
        child: ListView.builder(
          itemCount: civilAvtionlist_Eighteen.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Eighteen[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
    //判断第二十章，并显示子目录
    if (index1 == 19)
      return Container(
        height: ScreenUtil().setHeight(950),
        child: ListView.builder(
          itemCount: civilAvtionlist_Twenty.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('${civilAvtionlist_Twenty[index]}'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      );
  }
}
