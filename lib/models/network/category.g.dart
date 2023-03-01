// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkCategory _$NetworkCategoryFromJson(Map<String, dynamic> json) =>
    NetworkCategory(
      json['id'] as int? ?? 0,
      CategoryAttributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkCategoryToJson(NetworkCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

CategoryAttributes _$CategoryAttributesFromJson(Map<String, dynamic> json) =>
    CategoryAttributes(
      json['name'] as String? ?? '',
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
      json['publishedAt'] as String? ?? '',
      (json['events']['data'] as List<dynamic>?)
              ?.map((e) => NetworkEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CategoryAttributesToJson(CategoryAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'events': instance.events,
    };
