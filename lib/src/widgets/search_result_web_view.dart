import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchResultWebView extends StatefulWidget {
  final String initialUrl;
  final String? targetUrl;
  final Map<String, dynamic>? paramsJson;
  final void Function(WebViewController controller)? onPageFinished;
  final String? html;

  const SearchResultWebView({
    super.key,
    required this.initialUrl,
    this.onPageFinished,
    this.targetUrl,
    this.paramsJson,
    this.html,
  });

  @override
  SearchResultWebViewState createState() => SearchResultWebViewState();
}

class SearchResultWebViewState extends State<SearchResultWebView> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setBackgroundColor(Colors.transparent)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            widget.onPageFinished?.call(_webViewController);
            if (widget.html != null) {
              _webViewController.runJavaScript(
                'document.getElementById("searchForm").innerHTML = ${jsonEncode(widget.html)};',
              );
            }
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
    ..loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
      Factory(() => EagerGestureRecognizer()),
    };

    return SizedBox(
      height: 400,
      child: WebViewWidget(
        controller: _webViewController,
        gestureRecognizers: gestureRecognizers,
      ),
    );
  }
}
