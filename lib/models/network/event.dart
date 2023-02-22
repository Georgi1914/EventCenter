import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final int? id;
  final String? name;
  final String? date;
  final String? description;
  final String? address;

  Event(this.id, this.name, this.date, this.description, this.address);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
