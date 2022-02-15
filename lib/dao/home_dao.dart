

import 'package:dio/dio.dart';
import 'package:flutter_app_trip/model/home_model.dart';

const HOME_URL = 'https://apk-1256738511.cos.ap-chengdu.myqcloud.com/FlutterTrip/data/home_page.json';

class HomeDao{
  static Future<HomeModel> fetch() async {
   Response response =   await Dio().get(HOME_URL);
    if(response.statusCode ==200){
      return HomeModel.fromJson(response.data);
    }else{
      throw Exception('Failed to load home_page.json');
    }
  }
}