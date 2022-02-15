// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 和文件名需要保持一致
part 'hotel.g.dart';

@JsonSerializable()
class Hotel extends Object {

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

  Hotel(this.endColor,this.item1,this.item2,this.item3,this.item4,this.mainItem,this.startColor,);

  factory Hotel.fromJson(Map<String, dynamic> srcJson) => _$HotelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotelToJson(this);

}


@JsonSerializable()
class Item1 extends Object {

  @JsonKey(name: 'statusBarColor')
  String statusBarColor;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  Item1(this.statusBarColor,this.title,this.url,);

  factory Item1.fromJson(Map<String, dynamic> srcJson) => _$Item1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Item1ToJson(this);

}


@JsonSerializable()
class Item2 extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  Item2(this.title,this.url,);

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

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'statusBarColor')
  String statusBarColor;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  MainItem(this.icon,this.statusBarColor,this.title,this.url,);

  factory MainItem.fromJson(Map<String, dynamic> srcJson) => _$MainItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MainItemToJson(this);

}

