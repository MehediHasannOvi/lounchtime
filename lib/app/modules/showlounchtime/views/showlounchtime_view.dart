import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lounchtime/helper/AppColors.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/showlounchtime_controller.dart';

class ShowlounchtimeView extends GetView<HomeController> {
  const ShowlounchtimeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           backgroundColor: appColors.bgColor,
          title: const Text(
            'Somoy List ',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: controller.Timelist(context),
        ));
  }
}
