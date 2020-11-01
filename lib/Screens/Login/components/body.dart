import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../../localization/language_constants.dart';
import '../../../providers/auth_provider.dart';
import '../../Signup/signup_screen.dart';
import '../../dashboard/dashboard_screen.dart';
import '../components/background.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String email, password;
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/farming.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: getTranslated(context, 'email_hint'),
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
              text: getTranslated(context, 'login_page'),
              press: () {
                _auth.signInWithEmailAndPassword(email, password).then(
                  (value) {
                    if (value != null)
                      return Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => DashboardScreen()),
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
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
