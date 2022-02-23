import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorUtil {
  static push(BuildContext context, Widget route) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => route));
    return result;
  }
}
