import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_trip/dao/home_dao.dart';
import 'package:flutter_app_trip/model/home_model.dart';
import 'package:flutter_app_trip/pages/speak_page.dart';
import 'package:flutter_app_trip/utils/navigator_util.dart';
import 'package:flutter_app_trip/widgets/cached_image.dart';
import 'package:flutter_app_trip/widgets/grid_nav.dart';
import 'package:flutter_app_trip/widgets/loading_container.dart';
import 'package:flutter_app_trip/widgets/local_nav.dart';
import 'package:flutter_app_trip/widgets/sales_box.dart';
import 'package:flutter_app_trip/widgets/search_bar.dart';
import 'package:flutter_app_trip/widgets/search_page.dart';
import 'package:flutter_app_trip/widgets/sub_nav.dart';
import 'package:flutter_app_trip/widgets/webview.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import 'city_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isLoading = true;
  bool isLight = true; //默认系统状态栏字体颜色白色

  double appBarAlpha = 0;
  int APPBAR_SCROLL_OFFSET = 100;

  String city = '上海市'; //默认地名

  //定义数据 可变源
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
        //监听系统状态栏颜色改变`
        value: isLight ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        child: Scaffold(
            backgroundColor: Color(0xfff2f2f2), //主要基色
            body: LoadingContainer(
              isLoading: isLoading,
              child: Stack(
                children: [
                  MediaQuery.removePadding(
                      //移除默认状态栏高度
                      removeTop: true,
                      context: context,
                      child: RefreshIndicator(
                        onRefresh: () {
                          return refreshData();
                        },
                        /**
                         * NotificationListener组件 这里监听listview
                         * 可以监听树冒泡事件,当包裹的子组件发生变化时会回调
                         * 这里的实现的业务是:监听listview滚动改变appBar的透明度
                         */
                        child: NotificationListener(
                          onNotification: (scrollNotification) {
                            //scrollNotification.depth == 0表示是其子组件 而不是孙组件
                            //ScrollUpdateNotification 表示子组件更新了
                            if (scrollNotification
                                    is ScrollUpdateNotification &&
                                scrollNotification.depth == 0) {
                              //滚动并且是列表滚动的时候
                              _onScroll(scrollNotification.metrics.pixels);
                            }
                            return false;
                          },
                          child: _listview,
                        ),
                      )),
                  _appBar
                ],
              ),
            )));
  }

  ListView get _listview {
    return ListView(
      children: [
        _banner,
        Container(
          margin: EdgeInsets.fromLTRB(7, 4, 7, 0),
          child: LocalNav(
            localNavList: localNavList,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: GridNav(
            gridNavModel: gridNav,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: SubNav(
            subNavList: subNavList,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: SalesBox(
            salesBox: salesBox,
          ),
        ),
      ],
    );
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).padding.top, 0, 10),
            decoration: BoxDecoration(
                //使用BoxDecoration的color属性的ARGB设置透明度 0-1 就像Android中的dim
                color:
                    Color.fromARGB((appBarAlpha * 255).toInt(), 66, 165, 245)),
            child: SearchBar(
              city: city,
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              // searchBarType: SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: _jumpToCity,
              rightButtonClick: () {},
              onChanged: (String value) {},
            ),
          ),
        ),
        Container(
          height: appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 0.5),
            ],
          ),
        )
      ],
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

// 判断滚动改变透明度
  void _onScroll(offset) {
    APPBAR_SCROLL_OFFSET =
        (MediaQuery.of(context).padding.top + 40).toInt(); //高度为appbar高度(含状态栏)
    // APPBAR_SCROLL_OFFSET 常量，值：100 , offset 滚动的距离
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      //向下 滑到顶部偏移量offset是个0
      alpha = 0; //完全透明
    } else if (alpha > 1) {
      //向上 滑动超过一个appbar高度
      alpha = 1; //完全不透明
    } else {
      //中间状态
      //其余为0-appbar高度 计算比率
    }
    setState(() {
      appBarAlpha = alpha;
      isLight = appBarAlpha == 0;
    });
  }

  Future refreshData() async {
    //通过dio获取model
    HomeModel model = await HomeDao.fetch();
    //必须要有setState 才能重新加载数据
    setState(() {
      bannerList = model.bannerList;
      localNavList = model.localNavList;
      gridNav = model.gridNav;
      subNavList = model.subNavList;
      salesBox = model.salesBox;
      //loading结束
      isLoading = false;

      //测试代码 model2map
      // Map map = model.toJson();
      //map2json
      // String jsonstring = json.encode(map);
      // print("将mode2json" + jsonstring);
    });
  }

  // 跳转到城市列表
  void _jumpToCity() async {
    String result = await NavigatorUtil.push(context, CityPage(city: city));
    setState(() {
      city = result;
    });
  }

  // 跳转搜索页面
  void _jumpToSearch() {
    NavigatorUtil.push(context, SearchPage(hint: SEARCH_BAR_DEFAULT_TEXT));
  }

  // 跳转语音识别页面
  void _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }
}
