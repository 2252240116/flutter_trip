

import 'package:dio/dio.dart';
import 'package:flutter_app_trip/model/home_model.dart';

//const是编译期确定了值。final是运行期确定值
const HOME_URL = 'https://apk-1256738511.cos.ap-chengdu.myqcloud.com/FlutterTrip/data/home_page.json';

class HomeDao{
  //async await是语法糖。本质是返回Fututr对象
  static Future<HomeModel> fetch() async {
   Response response =   await Dio().get(HOME_URL);
    if(response.statusCode ==200){
      return HomeModel.fromJson(response.data);
    }else{
      throw Exception('Failed to load home_page.json');
    }
  }
}