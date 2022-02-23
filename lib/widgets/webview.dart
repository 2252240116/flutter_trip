import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  //使用late 在构造函数中不能用const
  late final String url;
  final String? statusBarColor;
  final String? title;
  final bool? hideAppBar;

  CustomWebView({
    Key? key,
    required this.url,
    this.statusBarColor,
    this.title,
    this.hideAppBar,
  }) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<CustomWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    //io包中
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    //判空处理
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    //将字符串类型颜色转换成Color  背景色与状态栏色保持一致
    Color backgroundColor = Color(int.parse('0xff' + statusBarColorStr));
    //返回按钮色与背景色相反
    Color backButtonColor;
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: [
          _appBar(backgroundColor, backButtonColor),
          Expanded(
              child: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              print("WebView is loading (progress : $progress%)");
            },
            navigationDelegate: (NavigationRequest request) {
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
          ))
        ],
      ),
    );
  }

  Widget _appBar(Color backgroundColor, Color backButtonColor) {
    //没有appBar只显示25个dp的状态栏高度
    if(widget.hideAppBar??false){
      return Container(
        color: backgroundColor,
        height: 25,
      );
    }
    //有appBar 这里高度包括了状态栏 使用Container的padding设置???
    return Container(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      color: backgroundColor,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                  size: 26,
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    widget.title ?? '',
                    style: TextStyle(color: backgroundColor, fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
