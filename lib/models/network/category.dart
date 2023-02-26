import 'package:json_annotation/json_annotation.dart';

import 'event.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int? id;
  CategoryAttributes? attributes;

  Category({this.id, this.attributes});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CategoryAttributes {
  String? name;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  NetworkEvent? events;

  CategoryAttributes(
      {this.name,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.events});

  factory CategoryAttributes.fromJson(Map<String, dynamic> json) =>
      _$CategoryAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryAttributesToJson(this);
}
