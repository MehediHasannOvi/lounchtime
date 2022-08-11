import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lounchtime/helper/AppColors.dart';
import 'package:get/get.dart';
import 'package:lounchtime/helper/ShimmerView.dart';
import '../../home/controllers/home_controller.dart';

class ShowlounchtimeView extends GetView<HomeController> {
  // final String selectedValue;
  const ShowlounchtimeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var getdata = Get.arguments['From'];
    final nowtime = DateTime.now().hour;
    var GOTO = "Munshiganj";
    // final getData = selectedValue;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.bgColor,
        title: const Text(
          "সময়ের তালিকা",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: GOTO == getdata
            ? StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(
                      "Munshiganj",
                    )
                    .where('day', isGreaterThanOrEqualTo: nowtime.toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  final getdata = snapshot.data?.docs;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  Center(child: const CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        itemCount: getdata?.length,
                        itemBuilder: (contex, index) {
                          return getdata!.length == null
                              ? const Center(
                                  child: const Text("Not Data Fount "),
                                )
                              : Card(
                                  child: ListTile(
                                    title: Text(getdata[index]["Name"]),
                                    trailing: Text(getdata[index]["Time"]),
                                  ),
                                );
                        });
                  }
                },
              )
            : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Narayanganj")
                    .where('day', isGreaterThanOrEqualTo: nowtime.toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  final getdata = snapshot.data?.docs;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: const CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: getdata?.length,
                        itemBuilder: (contex, index) {
                          print("Print This Line ${getdata}");
                          return getdata!.length == null
                              ? const Center(
                                  child: const Text("Not Data Fount "),
                                )
                              : Card(
                                  child: ListTile(
                                    title: Text(getdata[index]["Name"]),
                                    trailing: Text(getdata[index]["Time"]),
                                  ),
                                );
                        });
                  }
                }),
      ),
    );
  }
}
