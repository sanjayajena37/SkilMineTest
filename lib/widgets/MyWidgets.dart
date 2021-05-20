import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidgets{
  static Widget CircleContainer(String value){
   return Container(
      padding: EdgeInsets.symmetric(horizontal: 13,vertical: 9),
      margin: EdgeInsets.only(right: 5, left: 3,top: 5),
      //alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(
            5.0) //                 <--- border radius here
        ),
      ),
      child: Text(value.capitalizeFirstofEach),
    );
  }
}

extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';

  String get allInCaps => this.toUpperCase();

  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}
