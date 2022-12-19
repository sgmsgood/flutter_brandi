// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      json['collection'] as String,
      json['datetime'] as String?,
      json['display_sitename'] as String?,
      json['doc_url'] as String?,
      json['image_url'] as String?,
      json['thumbnail_url'] as String?,
      json['height'] as int?,
      json['width'] as int?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'collection': instance.collection,
      'dataTime': instance.dataTime,
      'display_sitename': instance.displaySitename,
      'doc_url': instance.docUrl,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnameUrl,
      'height': instance.height,
      'width': instance.width,
    };
