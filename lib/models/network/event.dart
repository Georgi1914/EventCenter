import 'package:event_center/models/network/image.dart';
import 'package:json_annotation/json_annotation.dart';

import '../ui/event.dart';
import '../ui/picture.dart';

part 'event.g.dart';

@JsonSerializable()
class NetworkEvent {
  @JsonKey(defaultValue: 0)
  final int id;
  final Attributes? attributes;

  NetworkEvent(
    this.id,
    this.attributes,
  );

  DomainEvent toEvent() => DomainEvent(
        id,
        attributes?.name ?? '',
        DateTime.tryParse(attributes?.date ?? '') ?? DateTime.utc(0),
        attributes?.description ?? '',
        attributes?.address ?? '',
        attributes?.mainPicture?.toImage() ?? DomainImage(-1, ''),
      );

  factory NetworkEvent.fromJson(Map<String, dynamic> json) =>
      _$NetworkEventFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkEventToJson(this);
}

@JsonSerializable()
class Attributes {
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String date;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String address;
  final NetworkImage? mainPicture;

  Attributes(
      this.name, this.date, this.description, this.address, this.mainPicture);

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}
