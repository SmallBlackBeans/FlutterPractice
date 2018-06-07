import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  User(this.name, this.email);
  String name;
  String email;
  //自定义命名策略
  @JsonKey(name: 'id')
  int user_id;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

test() {
  //使用
  //反序列化
  String jsonMap = "{'name': 'hanxiaocu', 'email': '123@gmail.com'}";
  Map userMap = json.decode(jsonMap);
  var user = new User.fromJson(userMap);
  //序列化
  String jsonStr = json.encode(user);
  print(jsonStr);
}
