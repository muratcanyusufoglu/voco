// GENERATED CODE - DO NOT MODIFY BY HAND

part of './login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      token: json['token'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) => <String, dynamic>{
      'token': instance.token,
      'error': instance.error,
    };
