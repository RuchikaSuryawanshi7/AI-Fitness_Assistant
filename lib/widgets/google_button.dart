import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 15,
        ),
        child: OutlinedButton.icon(
          icon: Image(
            image: AssetImage("assets/images/google.png"),
          ),
          onPressed: onPressed,
          label: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
            side: MaterialStateProperty.all(
                BorderSide(color: Colors.black, width: 1)),
          ),
        ),
      ),
    );
  }
}
