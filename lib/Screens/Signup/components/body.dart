import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../../providers/auth_provider.dart';
import '../../Login/login_screen.dart';
import '../../analysis_screen/analysis_screen.dart';
import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name, email, password;

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/farm.svg",
              height: size.height * 0.27,
            ),
            RoundedInputField(
              hintText: "Enter Your Name",
              onChanged: (value) {
                name = value;
              },
            ),
            RoundedInputField(
              hintText: "Enter Your Email ID",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                _auth.registerWithEmailAndPassword(name, email, password).then(
                  (value) {
                    if (value != null)
                      return Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => AnalysisScreen()),
                      );
                  },
                  onError: (e) {
                    print(e);
                  },
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
