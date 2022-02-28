
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///自定义Tabbar下划线圆角
///自定义tabbar的高度以及文字与下划线的距离 https://github.com/caik13/flutter_ZTabBar
class CustomIndicator extends Decoration {
  const CustomIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
  })  : assert(borderSide != null),
        assert(insets != null);

  final BorderSide borderSide;

  final EdgeInsetsGeometry insets;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is UnderlineTabIndicator) {
      return UnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CustomIndicator) {
      return CustomIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _MyUnderlinePainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyUnderlinePainter(this, onChanged);
  }
}

class _MyUnderlinePainter extends BoxPainter {
  _MyUnderlinePainter(this.decoration, VoidCallback? onChanged)
      : assert(decoration != null),
        super(onChanged);

  final CustomIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;
  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);

    /**
     * 这里打开: 处理tabbar自定义下划线宽度
     */
    // //希望的宽度
    // double wantWidth = 32;
    // //取中间坐标
    // double cw = (indicator.left + indicator.right) / 2;
    // return Rect.fromLTWH(cw - wantWidth / 2,
    //     indicator.bottom - borderSide.width, wantWidth, borderSide.width);

    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator =
    _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    // 改为圆角
    final Paint paint = borderSide.toPaint()..strokeCap = StrokeCap.round;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}