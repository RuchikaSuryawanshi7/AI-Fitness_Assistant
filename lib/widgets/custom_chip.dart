import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  CustomChip({
    required this.label,
    required this.onSelected,
    this.isSelected = false,
    this.fontColor = const Color(0xff5c54e2),
  });

  final String label;
  final ValueChanged<bool> onSelected;
  final bool isSelected;
  final Color fontColor;

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FilterChip(
        pressElevation: 0,
        backgroundColor: Colors.white,
        label: Text(widget.label),
        labelStyle: TextStyle(
          color: widget.fontColor,
          fontSize: 18,
          letterSpacing: 0.5,
        ),
        shape: StadiumBorder(
          side: BorderSide(color: Color(0xff5c54e2), width: 1.5),
        ),
        labelPadding: EdgeInsets.fromLTRB(7, 3, 7, 3),
        selectedColor: Color(0xff5c54e2),
        disabledColor: Colors.white,
        shadowColor: Color(0xff5c54e2),
        selected: widget.isSelected,
        showCheckmark: false,
        onSelected: widget.onSelected,
      ),
    );
  }
}
