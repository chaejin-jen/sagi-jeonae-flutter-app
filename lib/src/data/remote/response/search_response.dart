import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'pageNo')
  int? pageNo;
  @JsonKey(name: 'totalCount')
  int? totalCount;
  @JsonKey(name: 'numOfRows')
  int? numOfRows;
  @JsonKey(name: 'items')
  List<Map<String, dynamic>>? items;

  SearchResponse({
    this.pageNo,
    this.totalCount,
    this.numOfRows,
    this.items,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
