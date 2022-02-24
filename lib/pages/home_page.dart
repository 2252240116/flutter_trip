import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_trip/dao/home_dao.dart';
import 'package:flutter_app_trip/model/home_model.dart';
import 'package:flutter_app_trip/utils/navigator_util.dart';
import 'package:flutter_app_trip/widgets/cached_image.dart';
import 'package:flutter_app_trip/widgets/grid_nav.dart';
import 'package:flutter_app_trip/widgets/local_nav.dart';
import 'package:flutter_app_trip/widgets/webview.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<CommonModel> bannerList = [];
  List<CommonModel> localNavList = [];
  GridNavModel? gridNav;
  List<CommonModel> subNavList = [];
  SalesBoxModel? salesBox;

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: ListView(
        children: [
          _banner,
          Container(
            margin: EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: LocalNav(
              localNavList: localNavList,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: GridNav(
              gridNavModel: gridNav,
            ),
          )
        ],
      ),
    );
  }

  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        autoplay: true,
        loop: true,
        pagination: SwiperPagination(),
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          return CachedImage(url: bannerList[index].icon, fit: BoxFit.fill);
        },
        onTap: (index) {
          NavigatorUtil.push(
              context,
              CustomWebView(
                url: bannerList[index].url,
                hideAppBar: bannerList[index].hideAppBar,
                title: bannerList[index].title,
              ));
        },
      ),
    );
  }

  Future refreshData() async {
    //通过dio获取model
    HomeModel model = await HomeDao.fetch();
    //必须要有setState
    setState(() {
      bannerList = model.bannerList;
      localNavList = model.localNavList;
      gridNav = model.gridNav;
      subNavList = model.subNavList;
      salesBox = model.salesBox;

      //测试代码 model2map
      // Map map = model.toJson();
      //map2json
      // String jsonstring = json.encode(map);
      // print("将mode2json" + jsonstring);
    });
  }
}
