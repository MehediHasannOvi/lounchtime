import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lounchtime/helper/AppColors.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.bgColor,
        appBar: AppBar(
          backgroundColor: appColors.bgColor,
          title: const Text(
            'বিজ্ঞপ্তি',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.all(20),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Notification").snapshots(),
            builder: (contex,snapshot){return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) => Container(
                    height: 200.00,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 80.00,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      snapshot.data!.docs[index]["image"]),
                                  fit: BoxFit.fill)),
                        ),
                        Text(
                          snapshot.data!.docs[index]["title"],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                         Text(
                           snapshot.data!.docs[index]["sub"],
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );})
        ));
  }
}
