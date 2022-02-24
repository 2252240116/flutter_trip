import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

///图片缓存widget
class CachedImage extends StatelessWidget {
  final String url;
  //BoxFit图片的显示方式 fill是填充满父容器
  final BoxFit? fit;
  final Alignment alignment;
  //这里宽高表示图片拥有的占位 配合fit和alignment放置
  final double? width;
  final double? height;

  const CachedImage({
    Key? key,
    required this.url,
    this.fit,
    //默认中间对齐
    this.alignment = Alignment.center,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      ),
    );
  }
}
