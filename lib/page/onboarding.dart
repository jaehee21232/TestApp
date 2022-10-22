import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:testapp/main.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title!",
          body: "This is body!\n" "first page!!",
          image: Image.asset('images/page1.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Title!",
          body: "This is body!\n" "second page!!",
          image: Image.asset('images/page2.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Title!",
          body: "This is body!\n" "third page!!",
          image: Image.asset('images/page3.png'),
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text("done"),
      onDone: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => const MyApp())));
      }, //done을 누르면 실행되는거
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true, //스킵버튼
      skip: const Text("Skip"),
      dotsDecorator: DotsDecorator(
        color: Colors.cyan,
        size: Size(10, 10),
        activeSize: Size(22, 10),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 18, color: Colors.blue),
      imagePadding: EdgeInsets.only(top: 40),
      pageColor: Colors.orange,
    );
  }
}
