import 'package:flutter/material.dart';
import 'directoryData.dart';

class ManagementHandbook extends StatelessWidget {
  List<Widget> secondaryCategory = [];
  List secondarylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管理手册'),
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
              secondaryCategory.add(new ExpansionTile(
                title: Text(item),
              ));
            }
          }
          return ExpansionTile(
            title: Text(managementList[index]),
            children: secondaryCategory,
          );
        },
      ),
    );
  }
}