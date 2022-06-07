import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboardingscreen/screens/success/successscreen.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';
import '../../components/roundedbutton.dart';
import '../../services/firebase_auth_methods.dart';
import '../register/registerscreen.dart';
import 'loginbackground.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey1 = GlobalKey<FormState>();

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void signInUser() async {
      FirebaseAuthMethods(FirebaseAuth.instance).signInWithEmail(
          email: _email.text, password: _password.text, context: context);
    }

    return LoginBackground(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                controller: _email,
              ),
              RoundedPasswordField(
                controller: _password,
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  if (_formKey1.currentState!.validate()) {
                    signInUser();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SuccessScreen();
                        },
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const RegisterScreen();
                    },
                  ), (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
