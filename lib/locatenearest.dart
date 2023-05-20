import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Demo',
      debugShowCheckedModeBanner: false,
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final url = 'https://www.bing.com/maps';
  final initialUrl = 'about:blank';
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find A Blood Bank Near You'),
        backgroundColor: Colors.red,
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: initialUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
            webViewController.loadUrl(url);
          },
          onPageStarted: (String url) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Loading Bing Maps...')));
          },
          onPageFinished: (String url) {
            ScaffoldMessenger.of(context)
                .hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
          },
        );
      }),
    );
  }
}
