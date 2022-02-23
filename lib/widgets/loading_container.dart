import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 自定义页面LoadingView Widget
 */
class LoadingContainer extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingContainer({
    Key? key,
    required this.isLoading,
    required this.child
  }) :super (key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading ? _loadingView : child;
  }

  Widget get _loadingView {
    return Center(child: CircularProgressIndicator());
  }

}