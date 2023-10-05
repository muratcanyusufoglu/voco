// GENERATED CODE - DO NOT MODIFY BY HAND

part of './resources_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourcesModel _$ResourcesModelFromJson(Map<String, dynamic> json) => ResourcesModel(
      pantoneValue: json['pantone_value'] as String?,
      name: json['name'] as String?,
      color: json['color'] as String?,
      id: json['id'] as int?,
      year: json['year'] as int?,
    );

Map<String, dynamic> _$ResourcesModelToJson(ResourcesModel instance) => <String, dynamic>{
      'pantone_value': instance.pantoneValue,
      'name': instance.name,
      'color': instance.color,
      'id': instance.id,
      'year': instance.year
    };
