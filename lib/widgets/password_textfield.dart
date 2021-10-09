import 'package:fitness_app/constant/theme.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    this.hintText = "",
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.onChanged,
    required this.validator,
    this.obscureText = true,
    required this.suffixIcon,
    required this.onSaved,
  }) : super(key: key);

  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelStyle: new TextStyle(color: const Color(0xFF424242)),
          prefixIcon: Icon(Icons.lock_outline),
          hintText: hintText,
          hintStyle: TextStyle(color: CustomTheme.black2),
          suffixIcon: suffixIcon,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomTheme.black2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomTheme.skyBlue),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomTheme.black2),
          ),
        ),
      ),
    );
  }
}
