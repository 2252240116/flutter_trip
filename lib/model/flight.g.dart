// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flight _$FlightFromJson(Map<String, dynamic> json) {
  return Flight(
    json['endColor'] as String,
    json['item1'] == null
        ? null
        : Item1.fromJson(json['item1'] as Map<String, dynamic>),
    json['item2'] == null
        ? null
        : Item2.fromJson(json['item2'] as Map<String, dynamic>),
    json['item3'] == null
        ? null
        : Item3.fromJson(json['item3'] as Map<String, dynamic>),
    json['item4'] == null
        ? null
        : Item4.fromJson(json['item4'] as Map<String, dynamic>),
    json['mainItem'] == null
        ? null
        : MainItem.fromJson(json['mainItem'] as Map<String, dynamic>),
    json['startColor'] as String,
  );
}

Map<String, dynamic> _$FlightToJson(Flight instance) => <String, dynamic>{
      'endColor': instance.endColor,
      'item1': instance.item1,
      'item2': instance.item2,
      'item3': instance.item3,
      'item4': instance.item4,
      'mainItem': instance.mainItem,
      'startColor': instance.startColor,
    };

Item1 _$Item1FromJson(Map<String, dynamic> json) {
  return Item1(
    json['hideAppBar'] as bool,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$Item1ToJson(Item1 instance) => <String, dynamic>{
      'hideAppBar': instance.hideAppBar,
      'title': instance.title,
      'url': instance.url,
    };

Item2 _$Item2FromJson(Map<String, dynamic> json) {
  return Item2(
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$Item2ToJson(Item2 instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
    };

Item3 _$Item3FromJson(Map<String, dynamic> json) {
  return Item3(
    json['hideAppBar'] as bool,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$Item3ToJson(Item3 instance) => <String, dynamic>{
      'hideAppBar': instance.hideAppBar,
      'title': instance.title,
      'url': instance.url,
    };

Item4 _$Item4FromJson(Map<String, dynamic> json) {
  return Item4(
    json['hideAppBar'] as bool,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$Item4ToJson(Item4 instance) => <String, dynamic>{
      'hideAppBar': instance.hideAppBar,
      'title': instance.title,
      'url': instance.url,
    };

MainItem _$MainItemFromJson(Map<String, dynamic> json) {
  return MainItem(
    json['icon'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$MainItemToJson(MainItem instance) => <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
    };
