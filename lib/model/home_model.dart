import 'package:flutter_app_trip/model/travel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'flight.dart';
import 'hotel.dart';
  
part 'home_model.g.dart';

@JsonSerializable()
  class HomeModel extends Object {

  @JsonKey(name: 'bannerList')
  List<BannerList?>? bannerList;

  @JsonKey(name: 'config')
  Config? config;

  @JsonKey(name: 'gridNav')
  GridNav? gridNav;

  @JsonKey(name: 'localNavList')
  List<LocalNavList?>? localNavList;

  @JsonKey(name: 'salesBox')
  SalesBox? salesBox;

  @JsonKey(name: 'subNavList')
  List<SubNavList?>? subNavList;

  HomeModel(this.bannerList,this.config,this.gridNav,this.localNavList,this.salesBox,this.subNavList,);

  factory HomeModel.fromJson(Map<String, dynamic> srcJson) => _$HomeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

}

  
@JsonSerializable()
  class BannerList extends Object {

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'url')
  String url;

  BannerList(this.icon,this.url,);

  factory BannerList.fromJson(Map<String, dynamic> srcJson) => _$BannerListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerListToJson(this);

}

  
@JsonSerializable()
  class Config extends Object {

  @JsonKey(name: 'searchUrl')
  String searchUrl;

  Config(this.searchUrl,);

  factory Config.fromJson(Map<String, dynamic> srcJson) => _$ConfigFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);

}

  
@JsonSerializable()
  class GridNav extends Object {

  @JsonKey(name: 'flight')
  Flight? flight;

  @JsonKey(name: 'hotel')
  Hotel? hotel;

  @JsonKey(name: 'travel')
  Travel? travel;

  GridNav(this.flight,this.hotel,this.travel,);

  factory GridNav.fromJson(Map<String, dynamic> srcJson) => _$GridNavFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GridNavToJson(this);

}

@JsonSerializable()
  class LocalNavList extends Object {

  @JsonKey(name: 'hideAppBar')
  bool hideAppBar;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'statusBarColor')
  String statusBarColor;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  LocalNavList(this.hideAppBar,this.icon,this.statusBarColor,this.title,this.url,);

  factory LocalNavList.fromJson(Map<String, dynamic> srcJson) => _$LocalNavListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocalNavListToJson(this);

}

  
@JsonSerializable()
  class SalesBox extends Object {

  @JsonKey(name: 'bigCard1')
  BigCard1? bigCard1;

  @JsonKey(name: 'bigCard2')
  BigCard2? bigCard2;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'moreUrl')
  String moreUrl;

  @JsonKey(name: 'smallCard1')
  SmallCard1? smallCard1;

  @JsonKey(name: 'smallCard2')
  SmallCard2? smallCard2;

  @JsonKey(name: 'smallCard3')
  SmallCard3? smallCard3;

  @JsonKey(name: 'smallCard4')
  SmallCard4? smallCard4;

  SalesBox(this.bigCard1,this.bigCard2,this.icon,this.moreUrl,this.smallCard1,this.smallCard2,this.smallCard3,this.smallCard4,);

  factory SalesBox.fromJson(Map<String, dynamic> srcJson) => _$SalesBoxFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SalesBoxToJson(this);

}

  
@JsonSerializable()
  class BigCard1 extends Object {

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  BigCard1(this.icon,this.title,this.url,);

  factory BigCard1.fromJson(Map<String, dynamic> srcJson) => _$BigCard1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$BigCard1ToJson(this);

}

  
@JsonSerializable()
  class BigCard2 extends Object {

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  BigCard2(this.icon,this.title,this.url,);

  factory BigCard2.fromJson(Map<String, dynamic> srcJson) => _$BigCard2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$BigCard2ToJson(this);

}

  
@JsonSerializable()
  class SmallCard1 extends Object {

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  SmallCard1(this.icon,this.title,this.url,);

  factory SmallCard1.fromJson(Map<String, dynamic> srcJson) => _$SmallCard1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$SmallCard1ToJson(this);

}

  
@JsonSerializable()
  class SmallCard2 extends Object {

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  SmallCard2(this.icon,this.title,this.url,);

  factory SmallCard2.fromJson(Map<String, dynamic> srcJson) => _$SmallCard2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$SmallCard2ToJson(this);

}

  
@JsonSerializable()
  class SmallCard3 extends Object {

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  SmallCard3(this.icon,this.title,this.url,);

  factory SmallCard3.fromJson(Map<String, dynamic> srcJson) => _$SmallCard3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$SmallCard3ToJson(this);

}

  
@JsonSerializable()
  class SmallCard4 extends Object {

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  SmallCard4(this.icon,this.title,this.url,);

  factory SmallCard4.fromJson(Map<String, dynamic> srcJson) => _$SmallCard4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$SmallCard4ToJson(this);

}

  
@JsonSerializable()
  class SubNavList extends Object {

  @JsonKey(name: 'hideAppBar')
  bool hideAppBar;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  SubNavList(this.hideAppBar,this.icon,this.title,this.url,);

  factory SubNavList.fromJson(Map<String, dynamic> srcJson) => _$SubNavListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubNavListToJson(this);

}

  
