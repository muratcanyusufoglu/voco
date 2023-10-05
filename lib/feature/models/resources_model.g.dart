// GENERATED CODE - DO NOT MODIFY BY HAND

part of './resources_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourcesModel _$ResourcesModelFromJson(Map<String, dynamic> json) => ResourcesModel(
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$ResourcesModelToJson(ResourcesModel instance) => <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'id': instance.id,
      'avatar': instance.avatar
    };
