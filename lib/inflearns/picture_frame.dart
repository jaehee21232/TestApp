import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PictureFrame extends StatefulWidget {
  const PictureFrame({super.key});

  @override
  State<PictureFrame> createState() => _PictureFrameState();
}

class _PictureFrameState extends State<PictureFrame> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }
      controller.animateToPage(nextPage,
          duration: Duration(milliseconds: 400), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return PageView(
      controller: controller,
      children: [1, 2, 3, 4, 5]
          .map((e) => Image.asset(
                "assets/images/inflearns/image_${e}.jpeg",
                fit: BoxFit.cover,
              ))
          .toList(),
    );
  }
}
