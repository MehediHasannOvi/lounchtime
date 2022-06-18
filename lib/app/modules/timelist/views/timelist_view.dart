import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lounchtime/helper/AppColors.dart';

import '../controllers/timelist_controller.dart';

class TimelistView extends GetView<TimelistController> {
  const TimelistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> lTime = ["০৮.৩০", "১০.১০", "০৬.১০", "০৮.১০", "১০.৩০"];
    final List<String> lname = [
      "খাজা এক্সপ্রেস",
      "দারাশিকো",
      "দারাশিকো",
      "খাজা এক্সপ্রেস",
      "দারাশিকো"
    ];
    final List<String> lday = ["সকাল", "সকাল", "বিকাল", "বিকাল", "বিকাল"];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appColors.bgColor,
          title: const Text(
            "সময়ের তালিকা",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  "Name",
                  style: TextStyle(
                      color: appColors.darkGreen,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Time",
                  style: TextStyle(
                      color: appColors.darkGreen,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Day",
                  style: TextStyle(
                      color: appColors.darkGreen,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(height: 2),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("LaunchTime").orderBy("Number")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (contex, index) {
                        final getData = snapshot.data?.docs;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(getData![index]["Name"]),
                            Text(getData[index]["Time"]),
                            Text(getData[index]["Day"]),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Divider(),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    );
                  }
                }),
          ],
        ));
  }
}
