import 'package:flutter/material.dart';
import 'WorkingManual_reader.dart';
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
            secondarylist = trainingList_L3_C3;
          }
          if (index == 3) {
            secondarylist = trainingList_L4_C4;
          }
          for (String item in secondarylist) {
            secondaryCategory.add(new ListTile(
              title: Text(item),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkingManualReader(
                            '培训手册', '${trainingList[index]}', item)));
              },
            ));
          }
          return ExpansionTile(
            title: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkingManualReader(
                            '培训手册', '${trainingList[index]}', 'temp')));
              },
              child: Text(trainingList[index]),
            ),
            children: secondaryCategory,
          );
        },
      ),
    );
  }
}
