
import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  int? totalCount;
  int? pageableCount;
  bool? isEnd;

  Meta(this.totalCount, this.pageableCount, this.isEnd);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
