import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:testapp/main.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        //PageViewModel로 해도 되고 Widget 만들어서 해도 될듯?
        PageViewModel(
          title: "개발자를 꿈꾸고 계신가요?",
          body: "코드디씨는 교내 개발동아리로 재학생이라면\n 누구나 지원할 수 있습니다.",
          image: Image.asset('assets/images/onboarding/page1.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Title!",
          body: "This is body!\n" "second page!!",
          image: Image.asset('assets/images/onboarding/page2.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Title!",
          body: "This is body!\n" "third page!!",
          image: Image.asset('assets/images/onboarding/page3.png'),
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text("done"),
      onDone: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const MyApp())));
      }, //done을 누르면 실행되는거(마지막 페이지에서 나옴)
      globalBackgroundColor: Color.fromRGBO(30, 35, 44, 1),
      next: const Text("다음"), //Next 버튼 아이콘으로 됨
      showSkipButton: false,
      showBackButton: true,
      back: const Text("이전"), //스킵버튼 문구 지정
      dotsContainerDecorator: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white, width: 0.8))),
      dotsDecorator: DotsDecorator(
        color: Colors.cyan,
        size: const Size(10, 10), //점 사이즈
        activeSize: const Size(22, 10), //현재 활성화된 점 사이즈
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        activeColor: Colors.red, //밑에 활성화된 점 색상
      ),
      curve: Curves.bounceOut, //페이지 넘김 효과
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
      bodyTextStyle: TextStyle(fontSize: 18, color: Colors.white),
      imagePadding: EdgeInsets.only(top: 40),
      pageColor: Color.fromRGBO(30, 35, 44, 1),
    );
  }
}
