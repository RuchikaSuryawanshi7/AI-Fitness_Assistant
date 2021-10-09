import 'package:fitness_app/constant/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText = "",
    required this.iconData,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.onChanged,
    required this.validator,
    required this.onSaved
  }) : super(key: key);

  final String hintText;
  final IconData iconData;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final FormFieldValidator<String> validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: hintText,
          hintStyle: TextStyle(color: CustomTheme.black2),
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
