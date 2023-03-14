import 'package:json_annotation/json_annotation.dart';

part 'user_fav.g.dart';

@JsonSerializable()
class UserFav {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  @JsonKey(defaultValue: [])
  List<FavNetworkEvent> favoriteEvents;

  UserFav(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.createdAt,
      this.updatedAt,
      this.firstName,
      this.lastName,
      required this.favoriteEvents});

  factory UserFav.fromJson(Map<String, dynamic> json) =>
      _$UserFavFromJson(json);

  Map<String, dynamic> toJson() => _$UserFavToJson(this);
}

@JsonSerializable()
class FavNetworkEvent {
  @JsonKey(defaultValue: 0)
  int id;
  String? name;
  String? date;
  String? description;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  FavNetworkEvent(
      {required this.id,
      this.name,
      this.date,
      this.description,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.publishedAt});

  factory FavNetworkEvent.fromJson(Map<String, dynamic> json) =>
      _$FavNetworkEventFromJson(json);

  Map<String, dynamic> toJson() => _$FavNetworkEventToJson(this);
}
