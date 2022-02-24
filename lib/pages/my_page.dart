import 'package:flutter/material.dart';
import 'package:flutter_app_trip/widgets/webview.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomWebView(
            url: 'https://m.ctrip.com/webapp/myctrip/',
            hideAppBar: true,
            statusBarColor: '4c5bca'));
  }
}
