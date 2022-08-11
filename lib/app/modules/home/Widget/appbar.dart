import 'package:flutter/material.dart';
import 'package:lounchtime/helper/AppColors.dart';

AppBar homeAppbar() {
  return AppBar(
    backgroundColor: appColors.bgColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40, width: 60, child: Image.asset("assets/boat.png")),
        const Text(
          'লঞ্চের',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: appColors.darkGreen,
              borderRadius: BorderRadius.circular(4)),
          child: const Text('সময় ?',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 60,
        )
      ],
    ),
    centerTitle: true,
  );
}
