import 'package:sagi_jeonae_app/src/services/udiportal_mfds_service.dart';

class UdiportalMfdsServiceHandler {
  static Future<Map<String, String?>> fetchHtmlData(
      Map<String, dynamic> searchResult,) async {
    final udiportalService = UdiportalMfdsService();

    final String modelName = searchResult["품명 및 모델명"]
        .split('/')
        .length > 1
        ? searchResult["품명 및 모델명"].split('/')[1]
        : searchResult["품명 및 모델명"] ?? '';

    final String companyName = searchResult["제조자(수입자)"] ?? '';

    final productHtml = modelName.isNotEmpty
        ? await udiportalService.fetchMedicalDeviceDataByModelName(modelName)
        : null;
    final recallHtml = modelName.isNotEmpty
        ? await udiportalService.fetchRecallDataByModelName(modelName)
        : null;
    final companyHtml = companyName.isNotEmpty
        ? await udiportalService.fetchDisciplinaryDataByCompanyName(companyName)
        : null;

    return {
      'productHtml': productHtml,
      'recallHtml': recallHtml,
      'companyHtml': companyHtml,
    };
  }
}
