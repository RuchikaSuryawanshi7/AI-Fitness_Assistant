import 'dart:math';

import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final Map curItem;
  final Color backgroundColor;
  final String suffix;

  const ItemWidget(
      this.curItem,
      this.backgroundColor,
      this.suffix, {
        Key? key,
      }) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late List<String> textParts;
  late String leftText, rightText;

  @override
  void initState() {
    super.initState();
    int decimalCount = 1;
    num fac = pow(10, decimalCount);

    var mText = ((widget.curItem["value"] * fac).round() / fac).toString();
    textParts = mText.split(".");
    leftText = textParts.first;
    rightText = textParts.last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 1,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: RotatedBox(
        quarterTurns: 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  leftText,
                  style: TextStyle(
                      fontSize: widget.curItem["fontSize"],
                      color: widget.curItem["color"],
                      fontWeight:
                      rightText == "0" ? FontWeight.w800 : FontWeight.w400),
                ),
                Text(
                  rightText == "0" ? "" : ".",
                  style: TextStyle(
                    fontSize: widget.curItem["fontSize"] - 3,
                    color: widget.curItem["color"],
                  ),
                ),
                Text(
                  rightText == "0" ? "" : rightText,
                  style: TextStyle(
                    fontSize: widget.curItem["fontSize"] - 3,
                    color: widget.curItem["color"],
                  ),
                ),
                (widget.suffix.isEmpty)
                    ? const SizedBox()
                    : Text(
                  widget.suffix,
                  style: TextStyle(
                    fontSize: widget.curItem["fontSize"],
                    color: widget.curItem["color"],
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Container(
              height: Colors.black == widget.curItem["color"] ? 28 : 18,
              width: 2,
              color: widget.curItem["color"],
            ),
          ],
        ),
      ),
    );
  }
}