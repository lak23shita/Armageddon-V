import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundFarm extends StatelessWidget {
  const BackgroundFarm({
    Key key,
    @required this.index,
    @required FlareControls controller,
    this.size,
  })  : _controller = controller,
        super(key: key);

  final int index, size;
  final FlareControls _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 140,
          left: 30,
          width: 80,
          child: CircleAvatar(
            minRadius: 40,
            backgroundColor: Colors.yellow,
          ),
        ),
        Positioned(
          bottom: 100,
          height: 100,
          width: 400,
          child: Container(
            color: const Color(0xFF5c9972),
          ),
        ),
        Positioned(
          right: -100,
          bottom: 150,
          child: SvgPicture.asset(
            "assets/images/farm.svg",
            height: 300,
            width: 300,
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          bottom: 50,
          left: lerpDouble(-200, 50, index / size),
          child: SizedBox(
            height: 300,
            width: 300,
            child: FlareActor(
              "assets/rive/tractor.flr",
              controller: _controller,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: const Color(0xFF72C08E),
          ),
        ),
        Positioned(
          bottom: 80,
          child: Image.asset(
            "assets/images/grass.png",
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
