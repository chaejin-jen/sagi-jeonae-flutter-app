import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'udipotal_mfds_data_model.g.dart';

@JsonSerializable()
class MedicalDeviceParams {
  @Query("udidiCode")
  String? udidiCode;

  @Query("indtyCd")
  String? indtyCd;

  @Query("entpName")
  String? entpName;

  @Query("itemName")
  String? itemName;

  @Query("mdClsfNo")
  String? mdClsfNo;

  @Query("typeName")
  String? typeName;

  @Query("brandName")
  String? brandName;

  @Query("itemNoFullname")
  String? itemNoFullname;

  @Query("rcprslryCdInptvl")
  String? rcprslryCdInptvl;

  @Query("grade")
  int? grade;

  @Query("mnftrNtnCd")
  String? mnftrNtnCd;

  @Query("cancelYn")
  String? cancelYn;

  @Query("rcprslryTrgtYn")
  String? rcprslryTrgtYn;

  @Query("traceManageTargetYn")
  String? traceManageTargetYn;

  @Query("xprtppYn")
  String? xprtppYn;

  @Query("pageNum")
  int? pageNum;

  @Query("searchYn")
  late String searchYn;

  @Query("searchAfKey")
  String? searchAfKey;

  @Query("sort")
  String? sort;

  @Query("sortOrder")
  String? sortOrder;

  @Query("searchOn")
  String? searchOn;

  MedicalDeviceParams();

  factory MedicalDeviceParams.fromJson(Map<String, dynamic> json) =>
      _$MedicalDeviceParamsFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalDeviceParamsToJson(this);
}

@JsonSerializable()
class SearchKeywordParams {
  @Query("pageNum")
  int? pageNum;

  @Query("searchYn")
  late String searchYn;

  @Query("searchType")
  String? searchType;

  @Query("searchKwd")
  String? searchKwd;

  SearchKeywordParams();

  factory SearchKeywordParams.fromJson(Map<String, dynamic> json) =>
      _$SearchKeywordParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchKeywordParamsToJson(this);
}
