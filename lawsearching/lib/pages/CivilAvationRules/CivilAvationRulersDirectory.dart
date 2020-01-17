import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawsearching/pages/CivilAvationRules/CivilAvationdata.dart';

class CivilAvationRulersDirectory extends StatelessWidget {
  const CivilAvationRulersDirectory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('民航法规、空管规章'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text('国家法律法规'),
              children: <Widget>[
                _civilAvationDirectory1(),
              ],
            ),
            ExpansionTile(
              title: Text('民航规章'),
              children: <Widget>[
                ExpansionTile(
                  title: Text('民用航空'),
                  children: <Widget>[
                    _civilAvationDirectory2(),
                  ],
                ),
                ExpansionTile(
                  title: Text('通用航空'),
                  children: <Widget>[
                    ListTile(
                      title: Text('通航飞行管制条例'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _civilAvationDirectory1() {
    //国家法律法规子目录
    return Container(
      height: ScreenUtil().setHeight(1200),
      child: ListView.builder(
        itemCount: countryRulersList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${countryRulersList[index]}'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }

  //民航规章民用航空子目录
  Widget _civilAvationDirectory2() {
    //子目录
    return Container(
      height: ScreenUtil().setHeight(1200),
      child: ListView.builder(
        itemCount: civilAvationList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${civilAvationList[index]}'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }
}
