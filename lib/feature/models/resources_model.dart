import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resources_model.g.dart';

@JsonSerializable()
class ResourcesModel extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const ResourcesModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory ResourcesModel.fromJson(Map<String, dynamic> json) => _$ResourcesModelFromJson(json);

  static List<ResourcesModel> fromJsonList(List<dynamic> json) {
    List<ResourcesModel> requestByModel = [];

    for (var item in json) {
      requestByModel.add(ResourcesModel.fromJson(item));
    }
    return requestByModel;
  }

  Map<String, dynamic> toJson() => _$ResourcesModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];
}
