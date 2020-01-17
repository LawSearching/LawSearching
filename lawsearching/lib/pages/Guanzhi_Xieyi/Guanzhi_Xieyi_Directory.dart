import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Guanzhi_Xieyi_Data.dart';

class Guanzhi_Xieyi_Directory extends StatelessWidget {
  const Guanzhi_Xieyi_Directory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管 制 协 议 纪 要'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text('工作协议纪要',style: TextStyle(fontSize: ScreenUtil().setSp(55)),),
              children: <Widget>[
                ExpansionTile(
                  title: Text('军航————民航'),
                  children: <Widget>[_junHang_MinHangList()],
                ),
                ExpansionTile(
                  title: Text('民航————民航'),
                  children: <Widget>[_minHang_MinHangList()],
                ),
                ExpansionTile(
                  title: Text('民航————通航机场及公司'),
                  children: <Widget>[_minHang_TongHangList()],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//军航————民航
  Widget _junHang_MinHangList() {
    return Container(
      height: ScreenUtil().setHeight(1000),
      child: ListView.builder(
        itemCount: junHang_MinHang.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${junHang_MinHang[index]}'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }

//民航————民航
  Widget _minHang_MinHangList() {
    return Container(
      height: ScreenUtil().setHeight(1000),
      child: ListView.builder(
        itemCount: minHang_MinHang.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${minHang_MinHang[index]}'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }

//民航————通航机场及公司
  Widget _minHang_TongHangList() {
    return Container(
      height: ScreenUtil().setHeight(1000),
      child: ListView.builder(
        itemCount: minHang_TongHang.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${minHang_TongHang[index]}'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }
}
