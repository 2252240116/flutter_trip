// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    (json['bannerList'] as List)
        ?.map((e) =>
            e == null ? null : BannerList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['config'] == null
        ? null
        : Config.fromJson(json['config'] as Map<String, dynamic>),
    json['gridNav'] == null
        ? null
        : GridNav.fromJson(json['gridNav'] as Map<String, dynamic>),
    (json['localNavList'] as List)
        ?.map((e) =>
            e == null ? null : LocalNavList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['salesBox'] == null
        ? null
        : SalesBox.fromJson(json['salesBox'] as Map<String, dynamic>),
    (json['subNavList'] as List)
        ?.map((e) =>
            e == null ? null : SubNavList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'bannerList': instance.bannerList,
      'config': instance.config,
      'gridNav': instance.gridNav,
      'localNavList': instance.localNavList,
      'salesBox': instance.salesBox,
      'subNavList': instance.subNavList,
    };

BannerList _$BannerListFromJson(Map<String, dynamic> json) {
  return BannerList(
    json['icon'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$BannerListToJson(BannerList instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'url': instance.url,
    };

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return Config(
    json['searchUrl'] as String,
  );
}

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'searchUrl': instance.searchUrl,
    };

GridNav _$GridNavFromJson(Map<String, dynamic> json) {
  return GridNav(
    json['flight'] == null
        ? null
        : Flight.fromJson(json['flight'] as Map<String, dynamic>),
    json['hotel'] == null
        ? null
        : Hotel.fromJson(json['hotel'] as Map<String, dynamic>),
    json['travel'] == null
        ? null
        : Travel.fromJson(json['travel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GridNavToJson(GridNav instance) => <String, dynamic>{
      'flight': instance.flight,
      'hotel': instance.hotel,
      'travel': instance.travel,
    };

LocalNavList _$LocalNavListFromJson(Map<String, dynamic> json) {
  return LocalNavList(
    json['hideAppBar'] as bool,
    json['icon'] as String,
    json['statusBarColor'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$LocalNavListToJson(LocalNavList instance) =>
    <String, dynamic>{
      'hideAppBar': instance.hideAppBar,
      'icon': instance.icon,
      'statusBarColor': instance.statusBarColor,
      'title': instance.title,
      'url': instance.url,
    };

SalesBox _$SalesBoxFromJson(Map<String, dynamic> json) {
  return SalesBox(
    json['bigCard1'] == null
        ? null
        : BigCard1.fromJson(json['bigCard1'] as Map<String, dynamic>),
    json['bigCard2'] == null
        ? null
        : BigCard2.fromJson(json['bigCard2'] as Map<String, dynamic>),
    json['icon'] as String,
    json['moreUrl'] as String,
    json['smallCard1'] == null
        ? null
        : SmallCard1.fromJson(json['smallCard1'] as Map<String, dynamic>),
    json['smallCard2'] == null
        ? null
        : SmallCard2.fromJson(json['smallCard2'] as Map<String, dynamic>),
    json['smallCard3'] == null
        ? null
        : SmallCard3.fromJson(json['smallCard3'] as Map<String, dynamic>),
    json['smallCard4'] == null
        ? null
        : SmallCard4.fromJson(json['smallCard4'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SalesBoxToJson(SalesBox instance) => <String, dynamic>{
      'bigCard1': instance.bigCard1,
      'bigCard2': instance.bigCard2,
      'icon': instance.icon,
      'moreUrl': instance.moreUrl,
      'smallCard1': instance.smallCard1,
      'smallCard2': instance.smallCard2,
      'smallCard3': instance.smallCard3,
      'smallCard4': instance.smallCard4,
    };

BigCard1 _$BigCard1FromJson(Map<String, dynamic> json) {
  return BigCard1(
    json['icon'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$BigCard1ToJson(BigCard1 instance) => <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
    };

BigCard2 _$BigCard2FromJson(Map<String, dynamic> json) {
  return BigCard2(
    json['icon'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$BigCard2ToJson(BigCard2 instance) => <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
    };

SmallCard1 _$SmallCard1FromJson(Map<String, dynamic> json) {
  return SmallCard1(
    json['icon'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$SmallCard1ToJson(SmallCard1 instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
    };

SmallCard2 _$SmallCard2FromJson(Map<String, dynamic> json) {
  return SmallCard2(
    json['icon'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$SmallCard2ToJson(SmallCard2 instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
    };

SmallCard3 _$SmallCard3FromJson(Map<String, dynamic> json) {
  return SmallCard3(
    json['icon'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$SmallCard3ToJson(SmallCard3 instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
    };

SmallCard4 _$SmallCard4FromJson(Map<String, dynamic> json) {
  return SmallCard4(
    json['icon'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$SmallCard4ToJson(SmallCard4 instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
    };

SubNavList _$SubNavListFromJson(Map<String, dynamic> json) {
  return SubNavList(
    json['hideAppBar'] as bool,
    json['icon'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$SubNavListToJson(SubNavList instance) =>
    <String, dynamic>{
      'hideAppBar': instance.hideAppBar,
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
    };
