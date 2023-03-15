import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class ParticleWidget extends StatefulWidget {
  @override
  _ParticleWidgetState createState() => _ParticleWidgetState();
}

class _ParticleWidgetState extends State<ParticleWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      body: CircularParticle(
        awayRadius: 80,
        numberOfParticles: 200,
        speedOfParticles: 1,
        height: size.height,
        width: size.width,
        onTapAnimation: true,
        particleColor: Colors.white.withAlpha(150),
        awayAnimationDuration: Duration(milliseconds: 600),
        maxParticleSize: 8,
        isRandSize: true,
        isRandomColor: true,
        randColorList: [
          Colors.red.withAlpha(210),
          Colors.white.withAlpha(210),
          Colors.yellow.withAlpha(210),
          Colors.green.withAlpha(210)
        ],
        awayAnimationCurve: Curves.easeInOutBack,
        enableHover: true,
        hoverColor: Colors.white,
        hoverRadius: 90,
        connectDots: false,
      ),
    );
  }
}
