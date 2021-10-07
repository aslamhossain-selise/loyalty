import 'package:flutter/material.dart';

const kFontFamily = 'Futura PT';
const kButtonBgColor = Color(0xffC9AC60);
const kButtonTextColor = Color(0xFF000000);
const kBodyTextColor = Color(0xFFFFFFFF);
const kCardColor = Color(0xFFC1C1C1);

const kInputDecoration = InputDecoration(
  // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

  hintStyle: TextStyle(
    color: Color.fromRGBO(193, 193, 193, 0.5),
    fontSize: 16,
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.0,
    ),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
  ),
);
