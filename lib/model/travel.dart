import 'package:json_annotation/json_annotation.dart';

part 'travel.g.dart';

@JsonSerializable()
class Travel extends Object {

  @JsonKey(name: 'endColor')
  String? endColor;

  @JsonKey(name: 'item1')
  Item1? item1;

  @JsonKey(name: 'item2')
  Item2? item2;

  @JsonKey(name: 'item3')
  Item3? item3;

  @JsonKey(name: 'item4')
  Item4? item4;

  @JsonKey(name: 'mainItem')
  MainItem? mainItem;

  @JsonKey(name: 'startColor')
  String? startColor;

  Travel(this.endColor,this.item1,this.item2,this.item3,this.item4,this.mainItem,this.startColor,);

  factory Travel.fromJson(Map<String, dynamic> srcJson) => _$TravelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TravelToJson(this);

}


@JsonSerializable()
class Item1 extends Object {

  @JsonKey(name: 'hideAppBar')
  bool hideAppBar;

  @JsonKey(name: 'statusBarColor')
  String statusBarColor;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  Item1(this.hideAppBar,this.statusBarColor,this.title,this.url,);

  factory Item1.fromJson(Map<String, dynamic> srcJson) => _$Item1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Item1ToJson(this);

}


@JsonSerializable()
class Item2 extends Object {

  @JsonKey(name: 'hideAppBar')
  bool hideAppBar;

  @JsonKey(name: 'statusBarColor')
  String statusBarColor;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  Item2(this.hideAppBar,this.statusBarColor,this.title,this.url,);

  factory Item2.fromJson(Map<String, dynamic> srcJson) => _$Item2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Item2ToJson(this);

}


@JsonSerializable()
class Item3 extends Object {

  @JsonKey(name: 'hideAppBar')
  bool hideAppBar;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  Item3(this.hideAppBar,this.title,this.url,);

  factory Item3.fromJson(Map<String, dynamic> srcJson) => _$Item3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Item3ToJson(this);

}


@JsonSerializable()
class Item4 extends Object {

  @JsonKey(name: 'hideAppBar')
  bool hideAppBar;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  Item4(this.hideAppBar,this.title,this.url,);

  factory Item4.fromJson(Map<String, dynamic> srcJson) => _$Item4FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Item4ToJson(this);

}


@JsonSerializable()
class MainItem extends Object {

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

  MainItem(this.hideAppBar,this.icon,this.statusBarColor,this.title,this.url,);

  factory MainItem.fromJson(Map<String, dynamic> srcJson) => _$MainItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MainItemToJson(this);

}