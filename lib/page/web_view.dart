import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    var contoller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          print(progress); //페이지 로드되는걸 숫자로 표현( 100되면 다된거임)
        },
        onPageStarted: (String url) {
          print("페이지 로드가 시작되면 호출함");
        },
        onPageFinished: (String url) {
          print("페이지 로드가 완료되면 호출됩니다.");
        },
        onNavigationRequest: (request) {
          if (request.url.startsWith("https://velog.io/@jaehee21232")) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse("https://velog.io/@jaehee21232"));

    return Scaffold(
        appBar: AppBar(
          title: Text('재희 Velog 웹뷰 연결'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: WebViewWidget(
            controller: contoller,
          ),
        ));
  }
}
