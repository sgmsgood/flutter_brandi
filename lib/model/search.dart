import 'package:flutter_search_jisulee/model/document.dart';
import 'package:flutter_search_jisulee/model/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  Meta? meta;
  List<Document> documents;

  Search({this.meta, required this.documents});


  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);

  // factory Search.fromJson(Map<String, dynamic> json) {
  //   List<dynamic> documents = json['documents'] ?? [];
  //   var parseDocuments = documents.map((e) => Document.fromJson(e)).toList();
  //
  //   return Search(meta: json['meta'], documents: parseDocuments);
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'meta': meta,
  //     'documents': documents,
  //   };
  // }
}


