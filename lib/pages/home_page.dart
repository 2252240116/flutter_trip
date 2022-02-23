import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_trip/dao/home_dao.dart';
import 'package:flutter_app_trip/model/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future _initData() async {
    //通过dio获取model
    HomeModel model = await HomeDao.fetch();
    //model2map
    Map map = model.toJson();
    //map2json
    String jsonstring = json.encode(map);
    print("将mode2json" + jsonstring);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
