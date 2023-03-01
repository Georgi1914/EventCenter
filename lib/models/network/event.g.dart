// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkEvent _$NetworkEventFromJson(Map<String, dynamic> json) => NetworkEvent(
      json['id'] as int? ?? 0,
      Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkEventToJson(NetworkEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      json['name'] as String? ?? '',
      json['date'] as String? ?? '',
      json['description'] as String? ?? '',
      json['address'] as String? ?? '',
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'description': instance.description,
      'address': instance.address,
    };
