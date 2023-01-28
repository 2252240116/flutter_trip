import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_trip/model/home_model.dart';
import 'package:flutter_app_trip/utils/navigator_util.dart';
import 'package:flutter_app_trip/widgets/cached_image.dart';
import 'package:flutter_app_trip/widgets/webview.dart';

/**
 * StatelessWidget无状态组件
 */
class LocalNav extends StatelessWidget {
  //不可变参数
  final List<CommonModel> localNavList;
  //required 必参
  const LocalNav({
    Key? key,
    required this.localNavList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //思路2. 写个集合items套住多个 _item
    List<Widget> items = [];
    localNavList.forEach((model) {
      items.add(_item(context, model));
    });

    return Container(
      //圆角
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 7,bottom: 7),
        //思路3. 用Row横向布局排列集合items
        child: Row(
          /// MainAxisAlignment.spaceBetween  两边靠 中间等距
          /// MainAxisAlignment.spaceAround   每个单位左右等距
          /// MainAxisAlignment.spaceEvenly   空格等距
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //这个地方 多个child 但是不用[] 因为items是集合
          children: items,
        ),
      ),
    );
  }

  //思路1 先写单个item
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
        children: [
          CachedImage(
            url: model.icon,
            width: 32,
            height: 32,
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          Text(
            model.title ?? '',
            style: TextStyle(fontSize: 12,color:Color(0xff333333)),
          )
        ],
      ),
    );
  }
}
