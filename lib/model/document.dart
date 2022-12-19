
import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable()
class Document {
  String collection;
  String? dataTime;
  String? displaySitename;
  String? docUrl;
  String? imageUrl;
  String? thumbnameUrl;
  int? height;
  int? width;

  Document(
    this.collection,
    this.dataTime,
    this.displaySitename,
    this.docUrl,
    this.imageUrl,
    this.thumbnameUrl,
    this.height,
    this.width,
  );

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
