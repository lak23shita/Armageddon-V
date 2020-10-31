import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kissan_mitra/classes/language.dart';
import 'package:kissan_mitra/localization/language_constants.dart';

import '../main.dart';
import 'Welcome/welcome_screen.dart';

// import 'Welcome/welcome_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    App.setLocale(context, _locale);
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => WelcomeScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/images/$assetName.jpg'),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: getTranslated(context, 'planting'),
          body: getTranslated(context, 'first'),
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
            child: Image.asset("assets/images/rafiki.png",
                height: 150.0, width: 100.0),
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xFFF9A825),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 50.0),
            bodyTextStyle: TextStyle(
                color: Color(0xFFE0E0E0),
                fontWeight: FontWeight.w400,
                fontSize: 20.0),
          ),
        ),
        PageViewModel(
          title: getTranslated(context, 'harvesting'),
          body:getTranslated(context, 'second') ,
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
            child: Image.asset("assets/images/amico.png", height: 175.0),
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xFF33691E),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 50.0),
            bodyTextStyle: TextStyle(
                color: Color(0xFFE0E0E0),
                fontWeight: FontWeight.w400,
                fontSize: 20.0),
          ),
        ),
        PageViewModel(
          title: getTranslated(context, 'gardening'),
          body: getTranslated(context, 'third'),
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
            child: Image.asset("assets/images/pana.png", height: 200.0),
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xFF9CCC65),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 50.0),
            bodyTextStyle: TextStyle(
                color: Color(0xFFE0E0E0),
                fontWeight: FontWeight.w400,
                fontSize: 20.0),
          ),
        )
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 19.0,
          color: Colors.white,
        ),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 19.0,
          color: Colors.white,
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFE0E0E0),
        activeColor: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
