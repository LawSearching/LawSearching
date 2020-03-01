import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawsearching/pages/MingyongHangkong_rules/fileReader.dart';
import 'package:lawsearching/sqlManger/my_db_method.dart'; //导出sqflite通用方法
import 'CivilAvationData.dart';

class Civil_Aviation_Directory extends StatefulWidget {
  Civil_Aviation_Directory({Key key}) : super(key: key);

  @override
  _Civil_Aviation_DirectoryState createState() =>
      _Civil_Aviation_DirectoryState();
}

class _Civil_Aviation_DirectoryState extends State<Civil_Aviation_Directory> {
  MyDbMethod myGeneralRulesMethod = new MyDbMethod();
  List civilAvtionDirectorylistName = civilAvtionDirectorylist; //导入民用航空交通管理目录数据
  String mingYongHangKong = "MingYongHangKong"; //表名
  String cadDirectoryName = "CADirectoryName"; //列名
  int num = 0; //统计获取的民用航空数据数量;
  List getlist = []; //统计获取的民用航空数据;

  /**
   * 将民用航空交通管理目录数据存入my_db.db数据库中，表名为mingYongHangKong,列名为CADirectoryName
   */

  //存取民用航空章目录
  _saveMingYongHangKong(String name) {
    myGeneralRulesMethod.saveString(mingYongHangKong, cadDirectoryName, name);
  }

  //获取民用航空章目录数量
  Future _getnumOfMingYongHangKong() async {
    return await myGeneralRulesMethod.getString(
        mingYongHangKong, cadDirectoryName); //返回值为int类型，显示数据库中的数据量;
  }

  //获取民用航空章目录数据
  Future<List<Map>> _getMingYongHangKong() async {
    return await myGeneralRulesMethod.searchString(
        mingYongHangKong, cadDirectoryName); //返回值为List类型，显示数据库中数据;
  }

  @override
  void initState() {
    super.initState();
    _getnumOfMingYongHangKong().then((value) {
      print(value);
      //如果从数据库中未获取到数据，则向数据库中存入数据；
      if (value == 0) {
        print('当前民用航空表中无任何章节数据，现加载内容如下：');
        for (String itemName in civilAvtionDirectorylistName) {
          _saveMingYongHangKong(itemName); //一个一个存取章名
          print('加载内容:$itemName');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('民用航空空中交通管理规则'),
      ),
      body: FutureBuilder(
        future: _getMingYongHangKong(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FileReader(
                                    snapshot.data[index]['CADirectoryName']
                                        .toString(),
                                  )));
                    },
                    child: Text(
                      snapshot.data[index]['CADirectoryName'].toString(),
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: ScreenUtil().setSp(45.0)),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _topsearch() {
    return Container(
      padding: EdgeInsets.all(2.0),
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(250),
      width: ScreenUtil().setWidth(2048),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      margin: EdgeInsets.only(left: 10.0),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: 22.0,
          ),
          Text(
            '',
            style: TextStyle(fontSize: 13.0),
          ),
        ],
      ),
    );
  }
}
