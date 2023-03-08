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
    WebViewController contoller = WebViewController()
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
      ..loadRequest(Uri.parse(
          "https://pf.kakao.com/_jFsFxj/friend?app_key=245a8022cd30a514b0843483c584d9f6&kakao_agent=sdk%2F1.3.1+sdk_type%2Fflutter+os%2Fandroid-33+lang%2Fko-KR+origin%2FDDsEBRV1Dsa%2FvAneS44Jv0%2FFRY0%3D+device%2FSM-S901N+android_pkg%2Fcom.CODEDC.CODEDCAPP+app_ver%2F1.0.0&api_ver=1.0"));
    Uri velogurl = Uri.parse(
        "https://pf.kakao.com/_jFsFxj/friend?app_key=245a8022cd30a514b0843483c584d9f6&kakao_agent=sdk%2F1.3.1+sdk_type%2Fflutter+os%2Fandroid-33+lang%2Fko-KR+origin%2FDDsEBRV1Dsa%2FvAneS44Jv0%2FFRY0%3D+device%2FSM-S901N+android_pkg%2Fcom.CODEDC.CODEDCAPP+app_ver%2F1.0.0&api_ver=1.0");
    return Scaffold(
        appBar: AppBar(
          title: Text('재희 Velog 웹뷰 연결'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (() {
                  if (contoller == null) {
                    return;
                  }
                  contoller.loadRequest(velogurl);
                }),
                icon: Icon(Icons.home))
          ],
        ),
        body: WebViewWidget(
          controller: contoller,
        ));
  }
}
