import 'package:flutter/material.dart';
import '../constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  const RoundedPasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isPassCodeVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        obscureText: isPassCodeVisible,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            tooltip: 'toggle visibility',
            icon: isPassCodeVisible
                ? const Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
            onPressed: () {
              setState(() {
                isPassCodeVisible = !isPassCodeVisible;
              });
            },
          ),
          border: InputBorder.none,
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Password can\'t be empty';
          }
          if (text.length < 6) {
            return 'Password can\'t be less than 6 words';
          }
          //password regexp matcher
          if (RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>')
              .hasMatch(text)) {
            return 'Password not valid';
          }
          return null;
        },
      ),
    );
  }
}
