// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(json['name'] as String, json['email'] as String)
    ..user_id = json['id'] as int;
}

abstract class _$UserSerializerMixin {
  String get name;
  String get email;
  int get user_id;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'email': email, 'id': user_id};
}
