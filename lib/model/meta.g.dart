// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      json['total_count'] as int?,
      json['pageable_count'] as int?,
      json['is_end'] as bool?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'total_count': instance.totalCount,
      'pageable_count': instance.pageableCount,
      'is_end': instance.isEnd,
    };
