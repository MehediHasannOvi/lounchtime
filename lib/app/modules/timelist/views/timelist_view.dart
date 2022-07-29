import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lounchtime/helper/AppColors.dart';

import '../controllers/timelist_controller.dart';

class TimelistView extends GetView<TimelistController> {
  const TimelistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appColors.bgColor,
          title: const Text(
            "সময়ের তালিকা",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
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
              SizedBox(
                height: 10,
              ),
              Text(
                "মুন্সীগঞ্জ থেকে ছাড়ে",
                style: TextStyle(
                    color: appColors.darkGreen,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 2),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Munshiganj",)
                      .orderBy("Time",descending: true)
                      .snapshots(),
                  builder: (context, mho) {
                    if (mho.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: mho.data!.docs.length,
                        itemBuilder: (contex, index) {
                          final ndataGet = mho.data?.docs;
                          print(mho.data?.docs.length.toString());
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(ndataGet![index]["Name"]),
                              Text(ndataGet[index]["Time"]),
                              // Text(ndataGet[index]["Day"]),
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
              Divider(height: 2),
              SizedBox(
                height: 10,
              ),
              Text(
                "নারায়ণগঞ্জ থেকে ছাড়ে",
                style: TextStyle(
                    color: appColors.darkGreen,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 2),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Narayanganj")
                      .orderBy("Time",descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
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
                              // Text(getData[index]["Day"]),
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
          ),
        ));
  }
}
