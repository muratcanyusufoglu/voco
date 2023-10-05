import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resources_model.g.dart';

@JsonSerializable()
class ResourcesModel extends Equatable {
    final int? id;
    final String? name;
    final int? year;
    final String? color;
    final String? pantoneValue;


  const ResourcesModel({
        this.id,
        this.name,
        this.year,
        this.color,
        this.pantoneValue,
  });

  factory ResourcesModel.fromJson(Map<String, dynamic> json) => _$ResourcesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResourcesModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        year,
        color,
        pantoneValue,
      ];
}
