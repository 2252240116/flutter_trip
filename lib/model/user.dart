
// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 和文件名需要保持一致
part 'user.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User{
  User(this.name, this.email,this.age,this.money);

  String name;
  String email;
  String age;
  String money;

  //不同的类使用不同的mixin即可  固定写法FromJson,ToJson
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}