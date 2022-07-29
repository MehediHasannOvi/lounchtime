// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lounchtime/app/modules/home/Widget/appDrawer.dart';
import 'package:lounchtime/app/modules/home/Widget/appbar.dart';
import 'package:lounchtime/helper/AppColors.dart';

import '../../../routes/app_pages.dart';
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
              HometextFrom(
                controller: controller.go,
              ),
              const SizedBox(
                height: 10,
              ),
              HometextFrom(
                controller: controller.to,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (controller.go.text.isEmpty &&
                      controller.to.text.isEmpty) {
                    SnackBar(content: Text("Please Enter Your Location"));
                    print("Please Enter Your Location");
                  } else {
                    controller.Timelist(context);
                    Get.toNamed(Routes.SHOWLOUNCHTIME);
                  }
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.center,
                  // ignore: prefer_const_constructors
                  child: Text(
                    "সময় জানুন",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: appColors.darkGreen,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
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
                "১। সর্বনিম্ন ভাড়া ১০.০০ টাকা হিসাব করে চার্ট প্রস্তুত করা হয়েছে। তাই উপরােক্ত ভাড়ার সাথে আর কোন অর্থ যােগ করে ভাড়া দাবী করা যাবে না।",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF939597),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "২| এ ভাড়া বৃদ্ধি গ্যাস, অকটেন ও পেট্রোল চালিত যানবাহনের ক্ষেত্রে প্রযােজ্য হবে না।",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF939597),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
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

class HometextFrom extends StatelessWidget {
  final TextEditingController controller;
  const HometextFrom({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
            border: InputBorder.none, labelText: "প্রস্থান (Departure)"),
      ),
    );
  }
}
