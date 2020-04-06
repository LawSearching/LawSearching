import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawsearching/pages/MingyongHangkong_rules/fileReader.dart';
import 'CivilAvationData.dart';

var url_1 = "http://39.97.103.161:8080/queryChapter";
List receive_data = [];
List tempdirectorylist = [];

class Civil_Aviation_Directory extends StatefulWidget {
  Civil_Aviation_Directory({Key key}) : super(key: key);

  @override
  _Civil_Aviation_DirectoryState createState() =>
      _Civil_Aviation_DirectoryState();
}

class _Civil_Aviation_DirectoryState extends State<Civil_Aviation_Directory> {
  List<Widget> secondaryCategory = [];
  List civilAvtionDirectorylistName = civilAvtionDirectorylist; //导入民用航空交通管理目录数据

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '民用航空空中交通管理规则',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(60.0),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: civilAvtionDirectorylistName.length,
        itemBuilder: (context, index1) {
          secondaryCategory = [];
          //判断目录为空
          if (index1 == 0 ||
              index1 == 7 ||
              index1 == 8 ||
              index1 == 9 ||
              index1 == 18) {
            tempdirectorylist = [];
          }
          //判断第二章，并显示子目录
          if (index1 == 1) {
            tempdirectorylist = civilAvtionlist_Two;
          }
          //判断第三章，并显示子目录
          if (index1 == 2) {
            tempdirectorylist = civilAvtionlist_Three;
          }
          //判断第四章，并显示子目录
          if (index1 == 3) {
            tempdirectorylist = civilAvtionlist_Four;
          }
          //判断第五章，并显示子目录
          if (index1 == 4) {
            tempdirectorylist = civilAvtionlist_Five;
          }
          //判断第六章，并显示子目录
          if (index1 == 5) {
            tempdirectorylist = civilAvtionlist_Six;
          }
          //判断第七章，并显示子目录
          if (index1 == 6) {
            tempdirectorylist = civilAvtionlist_Seven;
          }
          //判断第十一章，并显示子目录
          if (index1 == 10) {
            tempdirectorylist = civilAvtionlist_Eleven;
          }
          //判断第十二章，并显示子目录
          if (index1 == 11) {
            tempdirectorylist = civilAvtionlist_Twelve;
          }
          //判断第十三章，并显示子目录
          if (index1 == 12) {
            tempdirectorylist = civilAvtionlist_Thirteen;
          }
          //判断第十四章，并显示子目录
          if (index1 == 13) {
            tempdirectorylist = civilAvtionlist_Fourteen;
          }
          //判断第十五章，并显示子目录
          if (index1 == 14) {
            tempdirectorylist = civilAvtionlist_Fifteen;
          }
          //判断第十六章，并显示子目录
          if (index1 == 15) {
            tempdirectorylist = civilAvtionlist_Sixteen;
          }
          //判断第十七章，并显示子目录
          if (index1 == 16) {
            tempdirectorylist = civilAvtionlist_Seventeen;
          }
          //判断第十八章，并显示子目录
          if (index1 == 17) {
            tempdirectorylist = civilAvtionlist_Eighteen;
          }
          //判断第二十章，并显示子目录
          if (index1 == 19) {
            tempdirectorylist = civilAvtionlist_Twenty;
          }
          for (var item in tempdirectorylist) {
            secondaryCategory.add(new ListTile(
              title: Text(
                item,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(35.0),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileReader(
                        '${civilAvtionDirectorylistName[index1]}', item),
                  ),
                );
              },
            ));
          }
          if (index1 == 0 ||
              index1 == 7 ||
              index1 == 8 ||
              index1 == 9 ||
              index1 == 18) {
            return ListTile(
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FileReader(
                          '${civilAvtionDirectorylistName[index1]}', 'temp'),
                    ),
                  );
                },
                child: Text(
                  civilAvtionDirectorylistName[index1],
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(40.0),
                  ),
                ),
              ),
            );
          } else {
            return ExpansionTile(
              title: InkWell(
                child: Text(
                  civilAvtionDirectorylistName[index1],
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(40.0),
                  ),
                ),
              ),
              children: secondaryCategory,
            );
          }
        },
      ),
    );
  }
}
