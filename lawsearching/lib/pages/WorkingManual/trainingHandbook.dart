import 'package:flutter/material.dart';
import 'directoryData.dart';

class TrainingHandbook extends StatelessWidget {
  List<Widget> secondaryCategory = [];
  List secondarylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('培训手册'),
      ),
      body: ListView.builder(
        itemCount: trainingList.length,
        itemBuilder: (BuildContext context, int index) {
          secondaryCategory = [];
          if (index == 0) {
            secondarylist = trainingList_L2_C1;
          }
          if (index == 1) {
            secondarylist = trainingList_L2_C2;
          }
          if (index == 2) {
            secondarylist = trainingList_L2_C3;
          }
          if (index == 3) {
            secondarylist = trainingList_L2_C4;
          }
          if (index == 4) {
            secondarylist = trainingList_L2_C5;
          }
          if (index == 5) {
            secondarylist = trainingList_L2_C6;
          }
          for (String item in secondarylist) {
            secondaryCategory.add(new ExpansionTile(
              title: Text(item),
            ));
          }
          return ExpansionTile(
            title: Text(trainingList[index]),
            children: secondaryCategory,
          );
        },
      ),
    );
  }
}