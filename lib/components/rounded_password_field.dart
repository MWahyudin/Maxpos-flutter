import 'package:api/components/text_field_container.dart';
import 'package:api/constant.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final controller;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: "Password",
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
