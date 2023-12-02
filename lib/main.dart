import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('사기 전에'),
      ),
      body: Center(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _inputController,
                  decoration: const InputDecoration(
                    labelText: '🔍',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('검색 하기'),
                onPressed: () {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductInfoPage(data: userInput)),
                    );
                  }
                },
              ),
            ]
        ),
      ),
    );
  }
}


class ProductInfoPage extends StatelessWidget {
  final String data;

  const ProductInfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('검색 결과'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(data ?? 'no data'),
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