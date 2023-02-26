// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : CategoryAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

CategoryAttributes _$CategoryAttributesFromJson(Map<String, dynamic> json) =>
    CategoryAttributes(
      name: json['name'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      events: json['events'] == null
          ? null
          : NetworkEvent.fromJson(json['events'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryAttributesToJson(CategoryAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'events': instance.events,
    };
