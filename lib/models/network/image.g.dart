// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkImage _$NetworkImageFromJson(Map<String, dynamic> json) => NetworkImage(
      id: json['data']['id'] as int? ?? 0,
      attributes: json['data']['attributes'] == null
          ? null
          : ImageAttributes.fromJson(
              json['data']['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkImageToJson(NetworkImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

ImageAttributes _$ImageAttributesFromJson(Map<String, dynamic> json) =>
    ImageAttributes(
      name: json['name'] as String?,
      alternativeText: json['alternativeText'] as String?,
      caption: json['caption'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      formats: json['formats'] == null
          ? null
          : Formats.fromJson(json['formats'] as Map<String, dynamic>),
      hash: json['hash'] as String?,
      ext: json['ext'] as String?,
      mime: json['mime'] as String?,
      size: (json['size'] as num?)?.toDouble(),
      url: json['url'] as String?,
      previewUrl: json['previewUrl'] as String?,
      provider: json['provider'] as String?,
      providerMetadata: json['providerMetadata'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ImageAttributesToJson(ImageAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'alternativeText': instance.alternativeText,
      'caption': instance.caption,
      'width': instance.width,
      'height': instance.height,
      'formats': instance.formats,
      'hash': instance.hash,
      'ext': instance.ext,
      'mime': instance.mime,
      'size': instance.size,
      'url': instance.url,
      'previewUrl': instance.previewUrl,
      'provider': instance.provider,
      'providerMetadata': instance.providerMetadata,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

Formats _$FormatsFromJson(Map<String, dynamic> json) => Formats(
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : Thumbnail.fromJson(json['medium'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : Thumbnail.fromJson(json['small'] as Map<String, dynamic>),
      large: json['large'] == null
          ? null
          : Thumbnail.fromJson(json['large'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FormatsToJson(Formats instance) => <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'medium': instance.medium,
      'small': instance.small,
      'large': instance.large,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      name: json['name'] as String?,
      hash: json['hash'] as String?,
      ext: json['ext'] as String?,
      mime: json['mime'] as String?,
      path: json['path'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      size: (json['size'] as num?)?.toDouble(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'name': instance.name,
      'hash': instance.hash,
      'ext': instance.ext,
      'mime': instance.mime,
      'path': instance.path,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'url': instance.url,
    };
