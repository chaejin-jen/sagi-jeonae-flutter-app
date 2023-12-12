import 'package:flutter/material.dart';
import 'package:sagi_jeonae_app/src/services/search_service.dart';
import 'package:sagi_jeonae_app/src/widgets/search_textfield_button.dart';
import 'package:sagi_jeonae_app/src/widgets/search_result_table.dart';

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
    final searchService = SearchService();
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.link), text: 'url'),
              Tab(icon: Icon(Icons.shopping_bag), text: '제품명'),
              Tab(icon: Icon(Icons.factory), text: '제조사/수입사명'),
            ],
          ),
          title: const Text('사기 전에'),
        ),
        body: TabBarView(
            children: [
              SearchTextFieldButton(
                  controller: _inputController,
                  onSearch: () => _handleSearch(searchService.searchByUrl)
              ),
              SearchTextFieldButton(
                  controller: _inputController,
                  onSearch: () => _handleSearch(searchService.searchByProductName)
              ),
              SearchTextFieldButton(
                  controller: _inputController,
                  onSearch: () => _handleSearch(searchService.searchByCompanyName)
              ),
            ]
        ),
      ),
    );
  }

  void _handleSearch(Future<List<Map<String, dynamic>>?> Function(String) searchFunction) {
    String userInput = _inputController.text.trim();

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
        searchFunction(userInput).then((searchResult) =>
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SearchInfoPage(keyword: userInput, data: searchResult),
            ),
          )
        );
      } catch (e) {
        debugPrint('Error during search: $e');
      }
    }
  }
}


class SearchInfoPage extends StatelessWidget {
  final String keyword;
  final List<Map<String, dynamic>>? data;

  const SearchInfoPage({
    super.key,
    required this.keyword,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    List<List<String>> tableData = [
      ['Product Name', '물건'],
      ['Price', '\$${10000.toString()}'],
      // Add more details as needed
    ];

    for (var item in data ?? []){
      for (var key in item.keys) {
        debugPrint('$key: ${item[key]}');
      }
      debugPrint('====================');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('검색 결과'),
      ),
      body: Center(
          child: Column(
            children: [
              Text('검색어 : $keyword'),
              Container(
                alignment: Alignment.center,
                transformAlignment: Alignment.center,
                margin: const EdgeInsets.all(8.0),
                child: SelectionArea(
                  child: SearchResultTable(
                      data: tableData),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('홈으로!'),
              ),
            ],
          )
      ),
    );
  }
}
