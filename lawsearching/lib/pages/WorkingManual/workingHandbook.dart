import 'package:flutter/material.dart';
import 'WorkingManual_reader.dart';
import 'directoryData.dart';

class WorkingHandbook extends StatelessWidget {
  List<Widget> secondaryCategory = [];
  List secondarylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('运行手册'),
      ),
      body: ListView.builder(
        itemCount: workingList.length,
        itemBuilder: (BuildContext context, int index) {
          secondaryCategory = [];
          if (index == 0) {
            secondarylist = [];
          }
          if (index == 1) {
            secondarylist = workingList_L2_C2;
          }
          if (index == 2) {
            secondarylist = workingList_L2_C3;
          }
          if (index == 3) {
            secondarylist = workingList_L2_C4;
          }
          if (index == 4) {
            secondarylist = workingList_L2_C5;
          }
          if (index == 5) {
            secondarylist = workingList_L2_C6;
          }
          if (index == 6) {
            secondarylist = workingList_L2_C7;
          }
          if (secondarylist != []) {
            for (String item in secondarylist) {
              secondaryCategory.add(new ListTile(
                title: Text(item),
                onTap: (){
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkingManualReader(
                            '${secondarylist[index]}', item)));
                },
              ));
            }
          }
          return ExpansionTile(
            title:InkWell(
              onTap: (){
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkingManualReader(
                            '${workingList[index]}', 'temp')));
              },
              child: Text(managementList[index]),
            ),
            children: secondaryCategory,
          );
          
        },
      ),
    );
  }
}