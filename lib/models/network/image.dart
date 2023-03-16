import 'package:json_annotation/json_annotation.dart';

import '../../global_variables.dart';
import '../ui/picture.dart';

part 'image.g.dart';

@JsonSerializable()
class NetworkImage {
  @JsonKey(defaultValue: 0)
  int id;
  ImageAttributes? attributes;

  NetworkImage({required this.id, this.attributes});

  factory NetworkImage.fromJson(Map<String, dynamic> json) =>
      _$NetworkImageFromJson(json['data']);

  DomainImage toImage() => DomainImage(
        id,
        attributes?.url != null ? '$baseURL${attributes?.url}' : '',
      );

  Map<String, dynamic> toJson() => _$NetworkImageToJson(this);
}

@JsonSerializable()
class ImageAttributes {
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  String? previewUrl;
  String? provider;
  String? providerMetadata;
  String? createdAt;
  String? updatedAt;

  ImageAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  factory ImageAttributes.fromJson(Map<String, dynamic> json) =>
      _$ImageAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ImageAttributesToJson(this);
}

@JsonSerializable()
class Formats {
  Thumbnail? thumbnail;
  Thumbnail? medium;
  Thumbnail? small;
  Thumbnail? large;

  Formats({this.thumbnail, this.medium, this.small, this.large});

  factory Formats.fromJson(Map<String, dynamic> json) =>
      _$FormatsFromJson(json);

  Map<String, dynamic> toJson() => _$FormatsToJson(this);
}

@JsonSerializable()
class Thumbnail {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  String? path;
  int? width;
  int? height;
  double? size;
  String? url;

  Thumbnail(
      {this.name,
      this.hash,
      this.ext,
      this.mime,
      this.path,
      this.width,
      this.height,
      this.size,
      this.url});

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}
