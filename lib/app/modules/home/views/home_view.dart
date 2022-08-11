// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lounchtime/app/modules/home/Widget/appDrawer.dart';
import 'package:lounchtime/app/modules/home/Widget/appbar.dart';
import 'package:lounchtime/helper/AppColors.dart';


import '../Widget/homefrom.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: appColors.bgColor,
      appBar: homeAppbar(),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const HometextFrom(),
           
              const SizedBox(
                height: 40,
              ),
              const Text(
                "বিশেষ দ্রষ্টব্য:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: appColors.dark2Green,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "১। লঞ্চের সংখ্যা বৃদ্ধি পেলে সময়সূচির পরিবর্তণ ঘটবে",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF939597),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // const Text(
              //   "২| লঞ্চ ভরা 30 / 40 টাকা , ভর পরিবর্তন কমতে পারে বারতে পারে",
              //   style: TextStyle(
              //     fontSize: 15,
              //     color: Color(0xFF939597),
              //   ),
              // ),
              // const SizedBox(
              //   height: 50,
              // ),
              const Center(
                child: const Text(
                  "Power by",
                  style: TextStyle(
                    fontSize: 18,
                    color: appColors.dark2Green,
                  ),
                ),
              ),
              SizedBox(
                  height: 100,
                  width: 180,
                  child: Center(child: Image.asset("assets/logo.png")))
            ],
          )),
    );
  }
}

