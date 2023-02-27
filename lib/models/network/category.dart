import 'package:json_annotation/json_annotation.dart';

import 'event.dart';

part 'category.g.dart';

@JsonSerializable()
class NetworkCategory {
  @JsonKey(defaultValue: 0)
  int id;
  CategoryAttributes attributes;

  NetworkCategory(this.id, this.attributes);

  factory NetworkCategory.fromJson(Map<String, dynamic> json) =>
      _$NetworkCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkCategoryToJson(this);
}

@JsonSerializable()
class CategoryAttributes {
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String createdAt;
  @JsonKey(defaultValue: '')
  String updatedAt;
  @JsonKey(defaultValue: '')
  String publishedAt;
  @JsonKey(defaultValue: [])
  List<NetworkEvent> events;

  CategoryAttributes(
      this.name, this.createdAt, this.updatedAt, this.publishedAt, this.events);

  factory CategoryAttributes.fromJson(Map<String, dynamic> json) =>
      _$CategoryAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryAttributesToJson(this);
}
