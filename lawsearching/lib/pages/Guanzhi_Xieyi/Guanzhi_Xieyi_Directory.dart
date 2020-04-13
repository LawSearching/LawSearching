import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawsearching/pages/Guanzhi_Xieyi/GuanZhi_XieYiReader.dart';
import 'Guanzhi_Xieyi_Data.dart';

class Guanzhi_Xieyi_Directory extends StatelessWidget {
  const Guanzhi_Xieyi_Directory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '工 作 协 议 纪 要',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(60),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text(
                '工作协议纪要',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(40.0),
                ),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    '军航————民航',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(35.0),
                    ),
                  ),
                  children: <Widget>[_junHang_MinHangList('军航-民航')],
                ),
                ExpansionTile(
                  title: Text(
                    '民航————民航',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(35.0),
                    ),
                  ),
                  children: <Widget>[_minHang_MinHangList('民航-民航')],
                ),
                ExpansionTile(
                  title: Text(
                    '民航————通航机场及公司',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(35.0),
                    ),
                  ),
                  children: <Widget>[_minHang_TongHangList('民航-通航机场及公司')],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//军航————民航
  Widget _junHang_MinHangList(String fist_directory) {
    return Container(
      height: ScreenUtil().setHeight(400),
      child: ListView.builder(
        itemCount: junHang_MinHang.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            '${junHang_MinHang[index]}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35.0),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GuanZhiXieYiReader(
                        fist_directory, junHang_MinHang[index])));
          },
        ),
      ),
    );
  }

//民航————民航
  Widget _minHang_MinHangList(String fist_directory) {
    return Container(
      height: ScreenUtil().setHeight(1000),
      child: ListView.builder(
        itemCount: minHang_MinHang.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            '${minHang_MinHang[index]}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35.0),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GuanZhiXieYiReader(
                        fist_directory, minHang_MinHang[index])));
          },
        ),
      ),
    );
  }

//民航————通航机场及公司
  Widget _minHang_TongHangList(String fist_directory) {
    return Container(
      height: ScreenUtil().setHeight(600),
      child: ListView.builder(
        itemCount: minHang_TongHang.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            '${minHang_TongHang[index]}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35.0),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GuanZhiXieYiReader(
                        fist_directory, minHang_TongHang[index])));
          },
        ),
      ),
    );
  }
}
