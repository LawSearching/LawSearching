import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'WorkingManual_reader.dart';
import 'directoryData.dart';

class ManagementHandbook extends StatelessWidget {
  List<Widget> secondaryCategory = [];
  List secondarylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '管理手册',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(60.0),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: managementList.length,
        itemBuilder: (BuildContext context, int index) {
          secondaryCategory = [];
          if (index == 0) {
            secondarylist = managementList_L2_C1;
          }
          if (index == 1) {
            secondarylist = [];
          }
          if (index == 2) {
            secondarylist = managementList_L2_C3;
          }
          if (index == 3) {
            secondarylist = managementList_L2_C4;
          }
          if (index == 4) {
            secondarylist = managementList_L2_C5;
          }
          if (index == 5) {
            secondarylist = managementList_L2_C6;
          }
          if (index == 6) {
            secondarylist = managementList_L2_C7;
          }
          if (index == 7) {
            secondarylist = managementList_L2_C8;
          }
          if (index == 8) {
            secondarylist = managementList_L2_C9;
          }
          if (secondarylist != []) {
            for (String item in secondarylist) {
              secondaryCategory.add(
                new ListTile(
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
                            builder: (context) => WorkingManualReader(
                                '管理手册', '${workingList[index]}', item)));
                  },
                ),
              );
            }
          }
          return index == 1
              ? ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkingManualReader(
                                  '管理手册', '${workingList[index]}', 'temp')));
                    },
                    child: Text(
                      managementList[index],
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(40.0),
                      ),
                    ),
                  ),
                )
              : ExpansionTile(
                  title: InkWell(
                    child: Text(
                      managementList[index],
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(40.0),
                      ),
                    ),
                  ),
                  children: secondaryCategory,
                );
        },
      ),
    );
  }
}
