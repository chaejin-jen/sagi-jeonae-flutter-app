import 'package:dio/dio.dart';
import 'package:sagi_jeonae_app/src/data/model/udipotal_mfds_data_model.dart';
import 'package:sagi_jeonae_app/src/data/remote/api/udipotal_mfds_api.dart';

class UdiportalMfdsService {
  final UdiportalMfdsApi _udiportApi;

  UdiportalMfdsService() : _udiportApi = UdiportalMfdsApi(Dio());

  Future<String> fetchMedicalDeviceDataByModelName(String modelName) async {
    final queryParams = MedicalDeviceParams()
      ..typeName = modelName
      ..searchYn = 'true';
    return await _udiportApi.fetchMedicalDeviceData(queryParams);
  }

  Future<String> fetchDisciplinaryDataByCompanyName(String companyName) async {
    final queryParams = SearchKeywordParams()
      ..searchKwd = companyName
      ..searchType = 'ENTP'
      ..searchYn = 'true';
    return await _udiportApi.fetchDisciplinaryData(queryParams);
  }

  Future<String> fetchRecallDataByModelName(String modelName) async {
    final queryParams = SearchKeywordParams()
      ..searchKwd = modelName
      ..searchType = 'MODEL'
      ..searchYn = 'true';
    return await _udiportApi.fetchRecallData(queryParams);
  }

}
