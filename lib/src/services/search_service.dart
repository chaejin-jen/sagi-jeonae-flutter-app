import 'package:dio/dio.dart';
import 'package:sagi_jeonae_app/src/data/remote/api/search_api.dart';

class SearchService {
  final SearchApi _searchApi;

  SearchService() : _searchApi = SearchApi(Dio());

  Future<List<Map<String, dynamic>>?> searchByUrl(String url) async {
    final searchResponse = await _searchApi.fetchProductInfoByUrl(url);
    return searchResponse?.items;
  }

  Future<List<Map<String, dynamic>>?> searchByProductName(String productName) async {
    final searchResponse = await _searchApi.fetchProductInfoByName(productName);
    return searchResponse?.items;
  }

  Future<List<Map<String, dynamic>>?> searchByCompanyName(String companyName) async {
    final searchResponse = await _searchApi.fetchProductInfoByCompany(companyName);
    return searchResponse?.items?.cast<Map<String, dynamic>>();
  }
}
