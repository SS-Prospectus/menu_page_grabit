import 'package:flutter/material.dart';
Color kCardColor = Color(0xFF20180B);
Color kBGcolor = Color(0xFF03040A);
Color kLightColor = Color(0xFFC0C0C0);

List<Color> kGradientA = [Color(0x1DFFA800),Color(0x9FFFC868),Colors.white60,Color(0xF09E6900),Color(0x00FFD000),Color(0xF0363636), Color(0x10FFFFFF),];
List<Color> kGradientB = [Color(0xCAFFBF10),Color(0xFF20180B),Color(0xADFFA800)];

TextStyle kCardHeadingText = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w700
);
TextStyle kCardLableText =TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFFF8D848)
);
TextStyle kCardContentText(double size) {
  return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: Colors.white
  );}