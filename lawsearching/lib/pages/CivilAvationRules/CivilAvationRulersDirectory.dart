import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawsearching/pages/CivilAvationRules/CivilAvationFileReader.dart';
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
                ExpansionTile(
                  title: Text('中华人民共和国宪法'),
                  children: <Widget>[
                    _civilAvationDirectory1('国家法律法规', '中华人民共和国宪法'),
                  ],
                ),
                ExpansionTile(
                  title: Text('中华人民共和国保守国家秘密法'),
                  children: <Widget>[
                    _civilAvationDirectory1('国家法律法规', '中华人民共和国保守国家秘密法'),
                  ],
                ),
                ExpansionTile(
                  title: Text('中华人民共和国安全生产法及相关条例'),
                  children: <Widget>[
                    _civilAvationDirectory(
                        safeProduceLawAndOtherConnectionMessage),
                  ],
                ),
                ExpansionTile(
                  title: Text('中国人民共和国劳动法和劳动合同法以及相关法律规定'),
                  children: <Widget>[
                    _civilAvationDirectory(labourLawAndOtherConnectionMessage),
                  ],
                ),
                ExpansionTile(
                  title: Text('中华人民共和国民用航空法'),
                  children: <Widget>[
                    _civilAvationDirectory1('国家法律法规', '中华人民共和国民用航空法'),
                  ],
                ),
                ExpansionTile(
                  title: Text('中国人民共和国飞行基本规则'),
                  children: <Widget>[
                    _civilAvationDirectory1('国家法律法规', '中国人民共和国飞行基本规则'),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: Text('民航规章'),
              children: <Widget>[
                ExpansionTile(
                  title: Text('民用航空'),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text('民用航空使用空域办法'),
                      children: <Widget>[
                        _civilAvationDirectory2('民用航空', '民用航空使用空域办法'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('民用机场飞行程序和运行最低标准管理规定'),
                      children: <Widget>[
                        _civilAvationDirectory2('民用航空', '民用机场飞行程序和运行最低标准管理规定'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('民用航空航行通告发布规定'),
                      children: <Widget>[
                        _civilAvationDirectory2('民用航空', '民用航空航行通告发布规定'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('搜寻援救民用航空器工作手册'),
                      children: <Widget>[
                        _civilAvationDirectory2('民用航空', '搜寻援救民用航空器工作手册'),
                      ],
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('通用航空'),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text('通用航空飞行管制条例'),
                      children: <Widget>[
                        _commonFlyDirectory2('通用航空', '通用航空飞行管制条例'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('民用无人驾驶航空器系统空中交通管理办法'),
                      children: <Widget>[
                        _commonFlyDirectory2('通用航空', '民用无人驾驶航空器系统空中交通管理办法'),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        )));
  }

  Widget _civilAvationDirectory(List directorylist) {
    //国家法律法规子目录
    return Container(
      height: ScreenUtil().setHeight(1800),
      child: ListView.builder(
        itemCount: directorylist.length,
        itemBuilder: (context, index) => ExpansionTile(
          title: Text(directorylist[index]),
          children: <Widget>[
            _civilAvationDirectory1('国家法律法规', directorylist[index]),
          ],
        ),
      ),
    );
  }

  //国家法律法规子目录
  Widget _civilAvationDirectory1(String name1, String name2) {
    List directory_list = [];
    List secondarylist = [];
    List<Widget> secondaryCategory = [];
    if (name2.contains('中华人民共和国宪法')) {
      directory_list = constitutionLawlist;
    } else if (name2.contains('中华人民共和国保守国家秘密法')) {
      directory_list = secretKeepLawlist;
    } else if (name2.contains('中华人民共和国安全生产法')) {
      directory_list = safeProduceLawlist;
    } else if (name2.contains('中华人民共和国劳动法')) {
      directory_list = labourLawlist;
    } else if (name2.contains('中华人民共和国劳动合同法')) {
      directory_list = labourContractLawlist;
    } else if (name2.contains('中华人民共和国就业促进法')) {
      directory_list = jobPromoteLawlist;
    } else if (name2.contains('就业服务与就业管理规定')) {
      directory_list = jobServiceAndManagementlist;
    } else if (name2.contains('安全生产标准制修订工作细则')) {
      directory_list = safeProduceStandardChange;
    } else if (name2.contains('企业职工工伤保险试行办法')) {
      directory_list = jobInjuryInsurancelist;
    } else if (name2.contains('劳动保障监察条例')) {
      directory_list = labourGuaranteeSupervisionlist;
    } else if (name2.contains('集体合同规定')) {
      directory_list = communityContractlist;
    } else if (name2.contains('失业保险条例')) {
      directory_list = unemploymentInsurancelist;
    } else if (name2.contains('失业保险金申领发放办法')) {
      directory_list = unemploymentInsurancelistApply;
    } else if (name2.contains('最低工资规定')) {
      directory_list = lowestSalarylist;
    } else if (name2.contains('中华人民共和国工会法')) {
      directory_list = labourUnionLawlist;
    } else if (name2.contains('中华人民共和国行政许可法')) {
      directory_list = adminisstrativelicensingLawlist;
    } else if (name2.contains('中华人民共和国消防法')) {
      directory_list = fireLawlist;
    } else if (name2.contains('中华人民共和国职业病防治法')) {
      directory_list = occupationalDiseasesPreventionlist;
    } else if (name2.contains('安全评价机构管理规定')) {
      directory_list = safetyAssessmentManagementlist;
    } else if (name2.contains('安全生产许可证条例')) {
      directory_list = safeProduceLicenselist;
    } else if (name2.contains('特种设备安全监察条例')) {
      directory_list = safetySupervisionOfSpecialEquipmentlist;
    } else if (name2.contains('危险废物经营许可证管理办法')) {
      directory_list = hazardousWasteBusinessLicenselist;
    } else if (name2.contains('危险化学品安全管理条例')) {
      directory_list = hazardousChemicalsSafetyManagementlist;
    } else if (name2.contains('危险化学品生产储存建设项目安全审查办法')) {
      directory_list = hazardousChemicalsProduceSafetyExaminationlist;
    } else if (name2.contains('危险化学品生产企业安全生产许可证实施办法')) {
      directory_list = hazardousChemicalsSafeProduceLicenselist;
    } else if (name2.contains('烟花爆竹生产企业安全生产许可证实施办法')) {
      directory_list = fireworksSafeProduceLicenselist;
    } else if (name2.contains('危险化学品安全管理条例')) {
      directory_list = hazardousChemicalsSafetyManagementlist;
    } else if (name2.contains('浙江省安全生产事故报告和调查处理暂行规定')) {
      directory_list = zheJiangSafeProduceAccidentlist;
    } else if (name2.contains('浙江省剧毒化学品定点经营安全管理办法')) {
      directory_list = zheJiangToxicChemicalsManagementlist;
    } else if (name2.contains('浙江省企业职工安全生产教育管理规定')) {
      directory_list = zheJiangEmployeeEducatelist;
    } else if (name2.contains('浙江省危险化学品安全管理实施办法')) {
      directory_list = zheJiangDangerousChemicalsManagementlist;
    } else if (name2.contains('中华人民共和国民用航空法')) {
      directory_list = civilAviationLawlist;
    } else if (name2.contains('中国人民共和国飞行基本规则')) {
      directory_list = flyRulelist;
    } else {
      directory_list = rescueAircraftlist;
    }
    //子目录
    return Container(
      height: ScreenUtil().setHeight(1200),
      child: ListView.builder(
          itemCount: directory_list.length,
          itemBuilder: (context, index) {
            if (directory_list[index].contains('第三章 民用航空器权利')) {
              secondarylist = civilAviationLawlist_L3;
            } else if (directory_list[index].contains('第五章 航空人员')) {
              secondarylist = civilAviationLawlist_L5;
            } else if (directory_list[index].contains('第七章 空中航行')) {
              secondarylist = civilAviationLawlist_L7;
            } else if (directory_list[index].contains('第九章 公共航空运输')) {
              secondarylist = civilAviationLawlist_L9;
            } else if (directory_list[index].contains('第三章 国家机构')) {
              secondarylist = constitutionLawlist_L3;
            } else if (directory_list[index].contains('第五章 特别规定')) {
              secondarylist = labourContractLawlist_L5;
            } else if (directory_list[index].contains('第四章 行政许可的实施程序')) {
              secondarylist = adminisstrativelicensingLawlist_L4; //到这
            } else if (directory_list[index].contains('第四章 搜寻援救实施')) {
              secondarylist = rescueAircraftlist_L3_S4;
            } else {
              secondarylist = [];
            }
            secondaryCategory = [];
            for (String item in secondarylist) {
              secondaryCategory.add(new ListTile(
                title: Text(item),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CivilAvationFileReader(
                              name1, name2, directory_list[index], item)));
                },
              ));
            }
            return ExpansionTile(
              title: InkWell(
                child: Text('${directory_list[index]}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CivilAvationFileReader(
                              name1, name2, directory_list[index], '-')));
                },
              ),
              children: secondaryCategory,
            );
          }),
    );
  }

  //民航规章民用航空子目录
  Widget _civilAvationDirectory2(String name1, String name2) {
    List directory_list = [];
    List secondarylist = [];
    List<Widget> secondaryCategory = [];
    if (name2.contains('民用航空使用空域办法')) {
      directory_list = airspaceUserquery;
    } else if (name2.contains('民用机场飞行程序和运行最低标准管理规定')) {
      directory_list = civilAvationList_FlyRoutine_L2;
    } else if (name2.contains('民用航空航行通告发布规定')) {
      directory_list = flyAnnouncementRelease;
    } else {
      directory_list = rescueAircraftlist;
    }
    //子目录
    return Container(
      height: ScreenUtil().setHeight(1200),
      child: ListView.builder(
          itemCount: directory_list.length,
          itemBuilder: (context, index) {
            if (directory_list[index].contains('第四章 空域规范')) {
              secondarylist = airspaceUserquery_L4;
            } else if (directory_list[index].contains('附件四 管制扇区划设指导材料')) {
              secondarylist = airspaceUserquery_F4;
            } else if (directory_list[index].contains('附件五 重要点的设置和识别规范')) {
              secondarylist = airspaceUserquery_F5;
            } else if (directory_list[index].contains('附件六 航路和航线代号的识别规范')) {
              secondarylist = airspaceUserquery_F6;
            } else if (directory_list[index].contains('第一章 总则')) {
              secondarylist = rescueAircraftlist_L1_S1;
            } else if (directory_list[index].contains('第二章 组织机构与职责')) {
              secondarylist = rescueAircraftlist_L2_S2;
            } else if (directory_list[index].contains('第三章 搜寻援救管理')) {
              secondarylist = rescueAircraftlist_L3_S3;
            } else if (directory_list[index].contains('第四章 搜寻援救实施')) {
              secondarylist = rescueAircraftlist_L3_S4;
            } else {
              secondarylist = [];
            }
            secondaryCategory = [];
            for (String item in secondarylist) {
              secondaryCategory.add(new ListTile(
                title: Text(item),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CivilAvationFileReader(
                              name1, name2, directory_list[index], item)));
                },
              ));
            }
            return ExpansionTile(
              title: InkWell(
                child: Text('${directory_list[index]}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CivilAvationFileReader(
                              name1, name2, directory_list[index], '-')));
                },
              ),
              children: secondaryCategory,
            );
          }),
    );
  }

  //通用航空航规章子目录
  Widget _commonFlyDirectory2(String name1, String name2) {
    List directory_list = [];
    if (name2.contains('通用航空飞行管制条例')) {
      directory_list = commonFlyMangementList;
    } else if (name2.contains('民用无人驾驶航空器系统空中交通管理办法')) {
      directory_list = commonFlyMangementList_2;
    }
    //子目录
    return Container(
      height: ScreenUtil().setHeight(1200),
      child: ListView.builder(
        itemCount: directory_list.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${directory_list[index]}'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CivilAvationFileReader(
                        name1, name2, directory_list[index], '-')));
          },
        ),
      ),
    );
  }
}
