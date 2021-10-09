import 'package:flutter/material.dart';

class SelectField extends StatelessWidget {
  const SelectField({
    Key? key,
    this.hintText = "",
    this.keyboardType = TextInputType.text,
    this.controllerString = "",
    required this.onChangedText,
    required this.validator,
    this.obscureText = true,
    required this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final TextInputType keyboardType;
  final String controllerString;
  final ValueChanged<String> onChangedText;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final Widget suffixIcon;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: TextEditingController(text: controllerString),
        onChanged: onChangedText,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelStyle: new TextStyle(
              color: const Color(0xFF424242)
          ),
          prefixIcon: Icon(Icons.lock_outline),
          hintText: hintText,
          // hintStyle: TextStyle(color: CustomTheme.black2),
          suffixIcon: suffixIcon,
          enabledBorder: UnderlineInputBorder(
            // borderSide: BorderSide(color: CustomTheme.black2),
          ),
          focusedBorder: UnderlineInputBorder(
            // borderSide: BorderSide(color: CustomTheme.skyBlue),
          ),
          border: UnderlineInputBorder(
            // borderSide: BorderSide(color: CustomTheme.black2),
          ),
        ),
      ),
    );
  }
}