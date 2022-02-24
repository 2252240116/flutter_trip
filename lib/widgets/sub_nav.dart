import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_trip/model/home_model.dart';
import 'package:flutter_app_trip/utils/navigator_util.dart';
import 'package:flutter_app_trip/widgets/cached_image.dart';
import 'package:flutter_app_trip/widgets/webview.dart';

class SubNav extends StatelessWidget {
  final List<CommonModel> subNavList;

  const SubNav({Key? key, required this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7, bottom: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: _items(context),
    );
  }

  Widget _items(BuildContext context) {
    List<Widget> listItems = [];
    subNavList.forEach((model) {
      listItems.add(_item(context, model));
    });

    ///2 表示只有两行  0.5为了处理奇数个数
    int count = (subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: listItems.sublist(0, count),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: listItems.sublist(count, subNavList.length),
        )
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            CustomWebView(
              url: model.url,
              statusBarColor: model.statusBarColor,
              title: model.title,
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedImage(
            url: model.icon,
            width: 18,
            height: 18,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 7),
          Text(
            model.title ?? '',
            style: TextStyle(fontSize: 12, color: Color(0xff333333)),
          )
        ],
      ),
    );
  }
}
