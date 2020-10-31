import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kissan_mitra/services/crop_suggest_api.dart';
import 'package:kissan_mitra/utils/mapping.dart';
import 'package:provider/provider.dart';

import 'Screens/Welcome/welcome_screen.dart';
import 'Screens/analysis_screen/analysis_screen.dart';
import 'constants.dart';
import 'providers/auth_provider.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  CropSuggestAPI().getSuggestion([
    32,
    127,
    3,
    185.0,
    156.0,
    27.53,
    183.07,
    1188.54,
    105.57,
    10107.61111,
    12544.38889,
    2724.555556,
    1448.055556,
    1051.833333,
    5073.388889,
    22092.66667,
    0.0,
    0.0,
    0.0,
    710.3888889,
    0,
    0.5542,
    0.3393,
    0.0238,
    0.5298
  ]);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Kisan Mitra',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.green[300],
            ),
            home: AuthWidget(),
          );
        },
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: Provider.of<AuthProvider>(context, listen: false).user(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data != null) return AnalysisScreen();
          return WelcomeScreen();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
