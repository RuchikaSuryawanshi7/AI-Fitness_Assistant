import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type message...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  color: Color(0xFFF5F6FA),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  border: Border(
    top: BorderSide(color: Color(0xFFF5F6FA), width: 2.0),
    bottom: BorderSide(color: Color(0xFFF5F6FA), width: 2.0),
    left: BorderSide(color: Color(0xFFF5F6FA), width: 2.0),
    right: BorderSide(color: Color(0xFFF5F6FA), width: 2.0),
  ),
);
