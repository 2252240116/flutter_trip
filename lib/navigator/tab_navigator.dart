import 'package:flutter/material.dart';
import 'package:flutter_app_trip/pages/home_page.dart';
import 'package:flutter_app_trip/pages/my_page.dart';
import 'package:flutter_app_trip/pages/travel_page.dart';
import 'package:flutter_app_trip/widgets/search_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info/package_info.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  //定义 PageView的ageController
  PageController _pageController = PageController(initialPage: 0);

  //当前位置
  int _currentIndex = 0;

  //定义颜色
  Color _colorTextSelect = Colors.blue;
  Color _colorTextDefault = Colors.grey;

  DateTime? _lastTime;

  @override
  void initState() {
    getPackageInfo();
  }

  @override
  void dispose() {
    _pageController.dispose(); //丢弃
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold:body, bottomNavigationBar
    return Scaffold(
      body: WillPopScope(
        //回调函数 返回Future<bool>类型 为false说明当前路由不出栈,不退出
        onWillPop:exitApp,
        child: PageView(
          //physics物理效果，不滚动
          physics: NeverScrollableScrollPhysics(),
          //控制器
          controller: _pageController,
          //滑动监听
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            HomePage(),
            SearchPage(hideLeft: true,),
            TravelPage(),
            MyPage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          //控制pageView位置
          _pageController.jumpToPage(index);
          //刷新tab选中位置
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _bottomItem(Icons.home, "首页"),
          _bottomItem(Icons.search, "搜索"),
          _bottomItem(Icons.camera, "旅拍"),
          _bottomItem(Icons.account_circle, "我的"),
        ],
        //通过刷新这个属性tab改变选中
        currentIndex: _currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(color: _colorTextSelect),
        unselectedLabelStyle: TextStyle(color: _colorTextDefault),
        //必须有这个属性,否则字体不显示
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  BottomNavigationBarItem _bottomItem(IconData iconData, String label) {
    return BottomNavigationBarItem(
        icon: Icon(iconData, color: _colorTextDefault),
        activeIcon: Icon(iconData, color: _colorTextSelect),
        label: label);
  }

  Future<bool> exitApp() async {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime!) > Duration(seconds: 2)) {
      Fluttertoast.showToast(msg: "再按一次退出应用",
          backgroundColor: Colors.blue,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 14);
      _lastTime = DateTime.now();
      // Future.value(**);
      return Future.value(false);
    }
    return Future.value(true);
  }

  void getPackageInfo() async{
    PackageInfo info = await PackageInfo.fromPlatform();
    print(
      '携程项目基本信息=> appName:${info.appName},packageName:${info.packageName},version:${info.version},buildNumber:${info.buildNumber}'
    );
  }
}
