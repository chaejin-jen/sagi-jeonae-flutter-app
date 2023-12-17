import 'package:sagi_jeonae_app/src/data/enums/search_type.dart';
import 'package:sagi_jeonae_app/src/services/search_service.dart';

class SearchServiceHandler {
  static Future<List<Map<String, dynamic>>?> fetchSearchResults(SearchType searchType,
      String queryParam,) async {
    final searchService = SearchService();

    switch (searchType) {
      case SearchType.url:
        return await searchService.searchByUrl(queryParam);
      case SearchType.product:
        return await searchService.searchByProductName(queryParam);
      case SearchType.company:
        return await searchService.searchByCompanyName(queryParam);
      default:
        throw ArgumentError('Invalid search type');
    }
  }
}
