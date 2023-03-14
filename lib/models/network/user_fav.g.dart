// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fav.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFav _$UserFavFromJson(Map<String, dynamic> json) => UserFav(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      provider: json['provider'] as String?,
      confirmed: json['confirmed'] as bool?,
      blocked: json['blocked'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      favoriteEvents: (json['favoriteEvents'] as List<dynamic>?)
              ?.map((e) => FavNetworkEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserFavToJson(UserFav instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'provider': instance.provider,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'favoriteEvents': instance.favoriteEvents,
    };

FavNetworkEvent _$FavNetworkEventFromJson(Map<String, dynamic> json) =>
    FavNetworkEvent(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
    );

Map<String, dynamic> _$FavNetworkEventToJson(FavNetworkEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'description': instance.description,
      'address': instance.address,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
    };
