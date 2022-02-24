import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_trip/model/home_model.dart';
import 'package:flutter_app_trip/utils/navigator_util.dart';
import 'package:flutter_app_trip/widgets/cached_image.dart';
import 'package:flutter_app_trip/widgets/webview.dart';

/**
 * Flutter界面写多了会很长没有可读性,可以尝试结构性处理封装,这样代码可读性会更高
 */
class GridNav extends StatelessWidget {
  final GridNavModel? gridNavModel;

  const GridNav({Key? key, required this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///裁切小组件 decoration是无法改变Container内部widget样式的,所以得用PhysicalModel
    return PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6), //四个圆角度
        clipBehavior: Clip.antiAlias, //裁切方式 若为Clip.none则圆角失效
        child: Column(
          ///思路4. 组装三行Row
          children: _gridNavItems(context),
        ));
  }

  List<Widget> _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel?.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel!.hotel, true));
    }
    if (gridNavModel?.flight != null) {
      items.add(_gridNavItem(context, gridNavModel!.flight, true));
    }
    if (gridNavModel?.travel != null) {
      items.add(_gridNavItem(context, gridNavModel!.travel, true));
    }
    return items;
  }

  Widget _gridNavItem(
      BuildContext context, GridNavItem gridNavItem, bool first) {
    List items = [];
    List<Widget> expandItems = [];

    items.add(_mainItem(context, gridNavItem.mainItem));
    items.add(_doubleItem(context, gridNavItem.item1, gridNavItem.item2));
    items.add(_doubleItem(context, gridNavItem.item3, gridNavItem.item4));

    items.forEach((item) {
      //横向三行均分
      expandItems.add(Expanded(
        child: item,
        flex: 1,
      ));
    });

    Color startColor = Color(int.parse('0xff${gridNavItem.startColor}'));
    Color endColor = Color(int.parse('0xff${gridNavItem.endColor}'));

    ///思路3.组装一行Row(包含main,doubleItem1,doubleItem2)
    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [startColor, endColor]),
      ),
      child: Row(
        children: expandItems,
      ),
    );
  }

  ///思路2.组装两个item
  Widget _doubleItem(
      BuildContext context, CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: [
        Expanded(child: _item(context, topItem, true)),
        //Expander套FractioallySizeBox
        Expanded(child: _item(context, bottomItem, false))
      ],
    );
  }

  ///思路1.先封装小item widget
  Widget _item(BuildContext context, CommonModel model, bool first) {
    //边框  BorderSide.none无
    BorderSide boderside = BorderSide(width: 0.8, color: Colors.white);

    return FractionallySizedBox(
      widthFactor: 1, //用百分比布局横向宽度填满
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                left: boderside, bottom: first ? boderside : BorderSide.none)),
        child: _wrapGesture(
            context,
            model,
            Center(
              child: Text(
                model.title ?? '',
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }

  ///思路1.先封装小main widget
  Widget _mainItem(BuildContext context, CommonModel model) {
    return _wrapGesture(
        context,
        model,
        Stack(
          alignment: AlignmentDirectional.topCenter, //层叠布局 上中位置
          children: [
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(model.title ?? '',
                    style: TextStyle(fontSize: 14, color: Colors.white))),
            CachedImage(
                url: model.icon,
                fit: BoxFit.contain,
                //图片显示方式为contain 尽可能大 保持分辨率
                alignment: Alignment.bottomCenter,
                width: 121,
                height: 88)
          ],
        ));
  }

  ///对点击事件的封装widget
  Widget _wrapGesture(BuildContext context, CommonModel model, Widget widget) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            CustomWebView(
              url: model.url,
              statusBarColor: model.statusBarColor,
              title: model.title,
              hideAppBar: model.hideAppBar,
            ));
      },
      child: widget,
    );
  }
}
