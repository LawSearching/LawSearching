import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'YingjiGuanzhiDirectory_Data.dart';
import 'yingjiFileReader.dart';

List receive_data = [];
List tempdirectorylist = [];

class YingjiGuanliShouce_Directory extends StatelessWidget {
  List<Widget> secondaryCategory = [];
  List yingjiDirectorylistName = jinjinGuanzhi_Directory; //导入应急管理手册目录数据

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进近管制室应急管理手册'),
      ),
      body: ListView.builder(
          itemCount: yingjiDirectorylistName.length, //列表项总数，不设置为无限加载
          itemBuilder: (context, index1) {
            secondaryCategory = [];
            if (index1 == 0 || index1 == 2 || index1 == 5) {
              tempdirectorylist = [];
            }
            //判断第二章，并显示子目录
            if (index1 == 1) {
              tempdirectorylist = jinjinGuanzhi_Directory_Two;
            }
            //第四章 应急管理处置程序
            if (index1 == 3) {
              tempdirectorylist = jinjinGuanzhi_Directory_Four;
            }
            // //第五章 银川进近管制室应急手册检查单
            // if (index1 == 4) {
            //   tempdirectorylist = jinjinGuanzhi_Directory_Five;
            // }
            for (var item in tempdirectorylist) {
              secondaryCategory.add(new ListTile(
                title: Text(item),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmergencyFileReader(
                              jinjinGuanzhi_Directory[index1], item)));
                },
              ));
            }
            return ExpansionTile(
              title: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmergencyFileReader(
                              '${yingjiDirectorylistName[index1]}', 'temp')));
                },
                child: Text(yingjiDirectorylistName[index1]),
              ),
              children: secondaryCategory,
            );
          }),
    );
  }
}
