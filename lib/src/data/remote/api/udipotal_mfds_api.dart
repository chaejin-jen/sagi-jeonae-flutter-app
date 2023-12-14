import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sagi_jeonae_app/src/data/model/udipotal_mfds_data_model.dart';


part 'udipotal_mfds_api.g.dart';

@RestApi(baseUrl: "http://udiportal.mfds.go.kr")
abstract class UdiportalMfdsApi {
  factory UdiportalMfdsApi(Dio dio, {String baseUrl}) = _UdiportalMfdsApi;

  @GET("/search/data/list")
  Future<String> fetchMedicalDeviceData(@Queries() MedicalDeviceParams params);

  @GET("/disps/MNU10036")
  Future<String> fetchDisciplinaryData(@Queries() SearchKeywordParams params);

  @GET("/recall/MNU10035")
  Future<String> fetchRecallData(@Queries() SearchKeywordParams params);
}
