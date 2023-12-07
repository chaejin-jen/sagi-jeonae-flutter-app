// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      pageNo: json['pageNo'] as int?,
      totalCount: json['totalCount'] as int?,
      numOfRows: json['numOfRows'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
      'numOfRows': instance.numOfRows,
      'items': instance.items,
    };
