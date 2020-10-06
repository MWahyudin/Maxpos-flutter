import 'package:api/components/text_field_container.dart';
import 'package:api/constant.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  // var attController;
  final controller;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText = "Masukan Email",
    this.icon = Icons.email,
    this.onChanged,
    this.controller,
    // this._emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
