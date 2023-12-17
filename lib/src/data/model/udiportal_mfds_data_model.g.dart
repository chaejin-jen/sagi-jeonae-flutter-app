// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'udiportal_mfds_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalDeviceParams _$MedicalDeviceParamsFromJson(Map<String, dynamic> json) =>
    MedicalDeviceParams()
      ..udidiCode = json['udidiCode'] as String?
      ..indtyCd = json['indtyCd'] as String?
      ..entpName = json['entpName'] as String?
      ..itemName = json['itemName'] as String?
      ..mdClsfNo = json['mdClsfNo'] as String?
      ..typeName = json['typeName'] as String?
      ..brandName = json['brandName'] as String?
      ..itemNoFullname = json['itemNoFullname'] as String?
      ..rcprslryCdInptvl = json['rcprslryCdInptvl'] as String?
      ..grade = json['grade'] as int?
      ..mnftrNtnCd = json['mnftrNtnCd'] as String?
      ..cancelYn = json['cancelYn'] as String?
      ..rcprslryTrgtYn = json['rcprslryTrgtYn'] as String?
      ..traceManageTargetYn = json['traceManageTargetYn'] as String?
      ..xprtppYn = json['xprtppYn'] as String?
      ..pageNum = json['pageNum'] as int?
      ..searchYn = json['searchYn'] as String
      ..searchAfKey = json['searchAfKey'] as String?
      ..sort = json['sort'] as String?
      ..sortOrder = json['sortOrder'] as String?
      ..searchOn = json['searchOn'] as String?;

Map<String, dynamic> _$MedicalDeviceParamsToJson(
        MedicalDeviceParams instance) =>
    <String, dynamic>{
      'udidiCode': instance.udidiCode,
      'indtyCd': instance.indtyCd,
      'entpName': instance.entpName,
      'itemName': instance.itemName,
      'mdClsfNo': instance.mdClsfNo,
      'typeName': instance.typeName,
      'brandName': instance.brandName,
      'itemNoFullname': instance.itemNoFullname,
      'rcprslryCdInptvl': instance.rcprslryCdInptvl,
      'grade': instance.grade,
      'mnftrNtnCd': instance.mnftrNtnCd,
      'cancelYn': instance.cancelYn,
      'rcprslryTrgtYn': instance.rcprslryTrgtYn,
      'traceManageTargetYn': instance.traceManageTargetYn,
      'xprtppYn': instance.xprtppYn,
      'pageNum': instance.pageNum,
      'searchYn': instance.searchYn,
      'searchAfKey': instance.searchAfKey,
      'sort': instance.sort,
      'sortOrder': instance.sortOrder,
      'searchOn': instance.searchOn,
    };

SearchKeywordParams _$SearchKeywordParamsFromJson(Map<String, dynamic> json) =>
    SearchKeywordParams()
      ..pageNum = json['pageNum'] as int?
      ..searchYn = json['searchYn'] as String
      ..searchType = json['searchType'] as String?
      ..searchKwd = json['searchKwd'] as String?;

Map<String, dynamic> _$SearchKeywordParamsToJson(
        SearchKeywordParams instance) =>
    <String, dynamic>{
      'pageNum': instance.pageNum,
      'searchYn': instance.searchYn,
      'searchType': instance.searchType,
      'searchKwd': instance.searchKwd,
    };
