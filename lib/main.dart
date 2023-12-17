import 'package:flutter/material.dart';
import 'package:sagi_jeonae_app/src/data/enums/search_type.dart';
import 'package:sagi_jeonae_app/src/services/search_service_handler.dart';
import 'package:sagi_jeonae_app/src/services/udipotal_mfds_service.dart';
import 'package:sagi_jeonae_app/src/widgets/search_textfield_button.dart';
import 'package:sagi_jeonae_app/src/widgets/search_result_table.dart';
import 'package:sagi_jeonae_app/src/widgets/search_result_web_view.dart';
import 'package:sagi_jeonae_app/src/widgets/common/toggle_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sagi Jeonae',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.link), text: 'url'),
              Tab(icon: Icon(Icons.shopping_bag), text: '모델명'),
              Tab(icon: Icon(Icons.factory), text: '제조사/수입사명'),
            ],
          ),
          title: const Text('사기 전에'),
        ),
        body: TabBarView(
            children: [
              SearchTextFieldButton(
                  controller: _inputController,
                  onSearch: () => _handleSearch(SearchType.url)
              ),
              SearchTextFieldButton(
                  controller: _inputController,
                  onSearch: () =>
                      _handleSearch(SearchType.product)
              ),
              SearchTextFieldButton(
                  controller: _inputController,
                  onSearch: () =>
                      _handleSearch(SearchType.company)
              ),
            ]
        ),
      ),
    );
  }

  void _handleSearch(SearchType searchType) async {
    String userInput = _inputController.text.trim();
    final udipotalService = UdiportalMfdsService();

    if (userInput.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('검색어를 입력해 주세요'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      try {
        final searchResult = await SearchServiceHandler.fetchSearchResults(
            searchType, userInput);
        final String modelName = searchResult != null
            ? searchResult[0]["품명 및 모델명"] ?? ''
            : '';
        final String companyName = searchResult != null
            ? searchResult[0]["제조자(수입자)"] ?? ''
            : '';

        final productHtml = modelName.isNotEmpty ? await udipotalService
            .fetchMedicalDeviceDataByModelName(modelName) : null;
        final recallHtml = modelName.isNotEmpty ? await udipotalService
            .fetchRecallDataByModelName(modelName) : null;
        final companyHtml = companyName.isNotEmpty
            ? await udipotalService
            .fetchDisciplinaryDataByCompanyName(companyName)
            : null;
        // debugPrint(html);
        if (!context.mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SearchResultPage(
                  keyword: userInput,
                  data: searchResult,
                  productHtml: productHtml,
                  recallHtml: recallHtml,
                  companyHtml: companyHtml,),
          ),
        );
      } catch (e) {
        debugPrint('Error during search: $e');
      }
    }
  }
}

class SearchResultPage extends StatelessWidget {
  final String keyword;
  final List<Map<String, dynamic>?>? data;
  final String? productHtml;
  final String? recallHtml;
  final String? companyHtml;

  const SearchResultPage({
    super.key,
    required this.keyword,
    this.data,
    this.productHtml,
    this.recallHtml,
    this.companyHtml,
  });

  @override
  Widget build(BuildContext context) {
    final customTitles = generateCustomTitle(data);
    if (productHtml != null) {
      customTitles.add('[의료기기정보포탈] 의료기기 조회');
    }
    if (recallHtml != null) {
      customTitles.add('[의료기기정보포탈] 회수대상 조회');
    }
    if (companyHtml != null) {
      customTitles.add('[의료기기정보포탈] 행정처분 조회');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('검색 결과'),
      ),
      body: Column(
          children: [
            Text(
                '검색어 : $keyword', maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text('검색 결과 ${data?.length ?? 0} 건'),
            if (data != null && data!.isNotEmpty)
              Expanded(
                child:
                ToggleListView(
                  customTitles: customTitles,
                  children: [
                    for (var item in data!)
                      Container(
                        alignment: Alignment.center,
                        transformAlignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        child: SearchResultTable(data: item ?? {}),
                      ),
                    if (productHtml != null)
                      SearchResultWebView(
                        initialUrl: 'http://udiportal.mfds.go.kr/search/data/MNU10029#item',
                        html: productHtml,
                      ),
                    if (recallHtml != null)
                      SearchResultWebView(
                        initialUrl: 'http://udiportal.mfds.go.kr/recall/MNU10035',
                        html: recallHtml,
                      ),
                    if (companyHtml != null)
                      SearchResultWebView(
                        initialUrl: 'http://udiportal.mfds.go.kr/disps/MNU10036',
                        html: companyHtml,
                      ),
                  ],
                ),
              ),
          ]
      ),
    );
  }
}

List<String> generateCustomTitle(List<Map<String, dynamic>?>? data) {
  return data?.map((item) {
    if (item != null) {
      String manufacturer = item["제조수입업체명"] != null
          ? '${item["제조수입업체명"]}\n'
          : '';
      String product = item["제품명"] ?? item["모델명"] ?? item["품목명"] ?? '';
      if (manufacturer.isEmpty && product.isEmpty) return '제품공시정보';
      return '$manufacturer$product';
    }
    return '';
  }).toList() ?? [];
}
