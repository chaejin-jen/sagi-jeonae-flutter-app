import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sagi_jeonae_app/src/data/remote/response/search_response.dart';


part 'search_api.g.dart';

@RestApi(baseUrl: 'http://192.168.0.18:8000')
abstract class SearchApi {
  factory SearchApi(Dio dio, {String baseUrl}) = _SearchApi;

  @GET('/product_info/url')
  Future<SearchResponse?> fetchProductInfoByUrl(@Query('encoded_url') String url);

  @GET('/medical_device/product')
  Future<SearchResponse?> fetchProductInfoByName(@Query('model_name') String productName);

  @GET('/medical_device/manufacturer')
  Future<SearchResponse?> fetchProductInfoByCompany(@Query('company_name') String companyName);
}
