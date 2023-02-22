import 'package:json_annotation/json_annotation.dart';

import '../ui/event.dart';

part 'event.g.dart';

@JsonSerializable()
class NetworkEvent {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String date;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String address;

  NetworkEvent(this.id, this.name, this.date, this.description, this.address);

  DomainEvent toEvent() => DomainEvent(
        id,
        name,
        DateTime.tryParse(date) ?? DateTime.utc(0),
        description,
        address,
      );

  factory NetworkEvent.fromJson(Map<String, dynamic> json) =>
      _$NetworkEventFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkEventToJson(this);
}
