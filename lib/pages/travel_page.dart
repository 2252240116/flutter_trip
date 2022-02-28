import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_trip/dao/travel_tab_dao.dart';
import 'package:flutter_app_trip/model/travel_tab_model.dart';
import 'package:flutter_app_trip/pages/travel_tab_page.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TravelPage();
}

class _TravelPage extends State<TravelPage> with TickerProviderStateMixin {
  List<TravelTab> tabs = [];
  TravelTabModel? travelTabModel;
  late TabController _tabController;

  @override
  void initState() {
    initTabsData();
  }

  void initTabsData() async {
    _tabController = TabController(length:0, vsync: this);//不加这行会有初始化错误
    try {
      TravelTabModel model = await TravelTabDao.fetch();
      setState(() {
        tabs = model.tabs;
        _tabController = TabController(length: model.tabs.length, vsync: this);
        travelTabModel = model;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
            child: TabBar(
              labelColor: Color(int.parse('0xff000000')),
              unselectedLabelColor: Color(int.parse('0xff666666')),
              labelPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              isScrollable: true,//需要这个属性 要写上 否则很奇怪tab太色的看不见
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                  insets: EdgeInsets.fromLTRB(20, 0, 20, 0)),
              controller: _tabController,
              tabs: tabs.map<Tab>(
                (TravelTab tab) {
                  return Tab(
                    text: tab.labelName,
                  );
                },
              ).toList(),
            ),
          ),
          Flexible(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((TravelTab tab) {
                  return TravelTabPage(
                    travelUrl: travelTabModel!.url,
                    params: travelTabModel!.params,
                    groupChannelCode: tab.groupChannelCode,
                    type: tab.type,
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
