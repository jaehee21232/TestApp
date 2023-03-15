import 'package:flutter/material.dart';
import 'package:testapp/page/Diss_missible.dart';
import 'package:testapp/page/Form_Validation.dart';
import 'package:testapp/page/Splash_Screen.dart';
import 'package:testapp/page/bloc_save.dart';
import 'package:testapp/page/chat_app_main.dart';
import 'package:testapp/page/countbloc.dart';
import 'package:testapp/page/inflearns.dart';
import 'package:testapp/page/listview_data.dart';
import 'package:testapp/page/listview_dialog.dart';
import 'package:testapp/page/onboarding.dart';
import 'package:testapp/page/prticles.dart';
import 'package:testapp/page/flu_widgets.dart';
import 'package:testapp/page/textanimaion.dart';
import 'package:testapp/page/web_view.dart';

class HomeBuilder extends StatelessWidget {
  final List<Widget> pages = <Widget>[
    Fluwidgets(),
    OnBoardingPage(),
    ListViewPage(),
    ListViewDataMove(),
    LoginSinUpScreen(),
    Inflearns(),
    FormValidation(),
    SwipeToDismiss(),
    SplashScreen(),
    WebViewPage(),
    TextAni(),
    ParticleWidget(),
    CounterBloc(),
    CounterSaveTestPage(),
  ];
  final List<String> texts = const <String>[
    "Widgets",
    "OnBoardingPage",
    "ListView&Dialog",
    "ListView&DataMove",
    "ChatApp",
    "Inflearns",
    "FormValidation",
    "Dissmissible",
    "Loding Page",
    "WebView",
    "텍스트애니메이션",
    "Particle",
    "Bloc 카운트 테스트",
    "Bloc 저장 테스트",
  ];

  HomeBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: width * 0.95,
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return InkWell(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 50,
                  child: Row(children: [
                    Text(
                      '$index ${texts[index].toString()}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pages[index],
                      ));
                });
          }),
          itemCount: pages.length,
        ),
      ),
    );
  }
}
